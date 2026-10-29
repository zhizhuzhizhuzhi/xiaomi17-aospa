package com.xiaomi.pudding.brightness.stock;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.ComponentName;
import android.content.res.AssetManager;
import android.content.res.Resources;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.CameraCharacteristics;
import android.os.Handler;
import android.os.SystemClock;
import android.util.Slog;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;

/** Host wiring for unmodified, relocated HyperOS DualSensorPolicy bytecode. */
public final class Entry implements AutomaticBrightnessControllerStub.DualSensorPolicyListener {
    private final SensorManager manager;
    private final Sensor front;
    private final Handler handler;
    private final int rate,warmUp,shortHorizon,longHorizon;
    private final AmbientLightRingBuffer mainRing;
    private final HysteresisLevelsImpl hysteresis;
    private final AutomaticBrightnessControllerImpl controller=new AutomaticBrightnessControllerImpl();
    private final DualSensorPolicy policy;
    private final SceneDetector scene;
    private final Consumer<float[]> callback;
    private final CameraManager camera;
    private final Set<String> backIds=new HashSet<>(), busyBackIds=new HashSet<>();
    private final Map<String,Boolean> torches=new HashMap<>();
    private boolean enabled,mainValid;
    private boolean frontRegistered, policyStarted, sceneStarted;
    private boolean torchRegistered, availabilityRegistered;
    private long enableTime;
    private long stepDarkenDebounce;
    private int stockStepDarkenDebounce;
    private float ambient=-1,bright=-1,small=-1,dark=-1;
    private final Runnable updateMain=this::updateMain;

    public Entry(Context context,SensorManager manager,Sensor fallbackFront,Handler handler,
            int[] config,long[] debounce,Consumer<float[]> callback) throws Exception {
        if(config.length!=5 || debounce.length!=2)
            throw new IllegalArgumentException("Invalid stock brightness bridge configuration");
        this.manager=manager;this.handler=new Handler(handler.getLooper(),message->{
            if(message.what==3 && message.obj instanceof Boolean) {
                stepDarkenDebounce=(Boolean)message.obj?stockStepDarkenDebounce:0;
                return true;
            }
            return false;
        });this.callback=callback;
        rate=config[0];warmUp=config[1];shortHorizon=config[2];longHorizon=config[3];
        // Same fallback as HyperOS switchLightSensor: use FOV only when HAL exposes it.
        Sensor fov=manager.getDefaultSensor(33172111);
        front=fov!=null?fov:fallbackFront;
        if(front==null || manager.getDefaultSensor(33171055)==null)
            throw new IllegalStateException("required physical ALS channel missing");
        mainRing=new AmbientLightRingBuffer(rate,longHorizon);
        mainRing.setBrighteningDebounce(debounce[0]);mainRing.setDarkeningDebounce(debounce[1]);
        Resources stock=stockResources(context,"/system_ext/etc/pudding-brightness/framework-ext-res.apk");
        mainRing.setSmallBrighteningDebounce(stock.getInteger(285933635));
        stockStepDarkenDebounce=stock.getInteger(285933641);
        hysteresis=new HysteresisLevelsImpl();
        set(hysteresis,"mSmallBrighteningLightDebounceConfig",stock.getInteger(285933635));
        set(hysteresis,"mRatioForBrightenSmallThreshold",stock.getFloat(285671690));
        set(hysteresis,"mHbmController",new HighBrightnessModeController(config[4]));
        hysteresis.createHysteresisThresholdSpline(array(stock,285409310),array(stock,285409315),
                array(stock,285409320),array(stock,285409325));
        policy=new DualSensorPolicy(handler.getLooper(),manager,warmUp,rate,debounce[0],debounce[1],
                longHorizon,shortHorizon,hysteresis,this,controller,true,false,1.2f,1.0f);
        Context stockContext=new ContextWrapper(context){@Override public Resources getResources(){return stock;}};
        String component=stock.getString(286195871);
        ComponentName service=ComponentName.unflattenFromString(component);
        controller.aon=service!=null && context.getPackageManager().resolveService(
                new Intent().setComponent(service),0)!=null;
        scene=new SceneDetector(this,controller,handler,stockContext,manager,controller.aon,true);
        policy.setSceneDetector(scene);
        camera=context.getSystemService(CameraManager.class);
        if(camera!=null) for(String id:camera.getCameraIdList()) {
            Integer lens=camera.getCameraCharacteristics(id).get(CameraCharacteristics.LENS_FACING);
            if(lens!=null && lens==CameraCharacteristics.LENS_FACING_BACK) backIds.add(id);
        }
        Slog.i("PuddingStockBrightness","original DualSensorPolicy ready: front="+front.getName()
                +" rear="+policy.getAssistLightSensor().getName()+" aonService="+controller.aon);
    }
    private static Resources stockResources(Context c,String path) throws Exception {
        AssetManager assets=AssetManager.class.getConstructor().newInstance();
        int cookie=(Integer)AssetManager.class.getMethod("addAssetPath",String.class).invoke(assets,path);
        if(cookie==0) throw new IllegalStateException("cannot load original resource APK");
        return new ResourceOverrides(assets,c.getResources().getDisplayMetrics(),c.getResources().getConfiguration());
    }
    private static float[] array(Resources r,int id) {
        return BrightnessMappingStrategy.getFloatArray(r.obtainTypedArray(id));
    }
    private static void set(Object target,String name,Object value) throws Exception {
        Field f=target.getClass().getDeclaredField(name);f.setAccessible(true);
        if(f.getType()==long.class)f.setLong(target,((Number)value).longValue());else f.set(target,value);
    }
    private boolean hasRegisteredResources() {
        return frontRegistered || policyStarted || sceneStarted
                || torchRegistered || availabilityRegistered;
    }

    private static RuntimeException release(RuntimeException failure, Runnable operation) {
        try {
            operation.run();
        } catch (RuntimeException error) {
            if (failure == null) return error;
            if (failure != error) failure.addSuppressed(error);
        }
        return failure;
    }

    public void setEnabled(boolean value) {
        if (value && enabled) return;
        if (value) {
            if (hasRegisteredResources()) {
                throw new IllegalStateException("Previous brightness resources were not released");
            }
            mainRing.clear(); mainValid=false; ambient=-1;
            enableTime=SystemClock.uptimeMillis();
            enabled=true;
            try {
                frontRegistered=manager.registerListener(frontListener,front,rate*1000,handler);
                if (!frontRegistered) throw new IllegalStateException("front ALS registration failed");
                // A start call can acquire resources before throwing. Keep ownership
                // until the matching stop has completed, including partial starts.
                policyStarted=true;
                policy.setSensorEnabled(true);
                sceneStarted=true;
                scene.configure(true);
                if (camera!=null) {
                    torchRegistered=true;
                    camera.registerTorchCallback(torchCallback,handler);
                    availabilityRegistered=true;
                    camera.registerAvailabilityCallback(availabilityCallback,handler);
                }
            } catch (RuntimeException operationError) {
                try { setEnabled(false); }
                catch (RuntimeException cleanupError) {
                    if (operationError != cleanupError) operationError.addSuppressed(cleanupError);
                }
                throw operationError;
            }
            return;
        }
        // Stop accepting events immediately. Resource ownership is tracked separately
        // so a failed stop never makes a later explicit cleanup a no-op.
        enabled=false; mainValid=false;
        RuntimeException failure=null;
        if (frontRegistered) failure=release(failure, () -> {
            manager.unregisterListener(frontListener); frontRegistered=false;
        });
        if (policyStarted) failure=release(failure, () -> {
            policy.setSensorEnabled(false); policyStarted=false;
        });
        if (sceneStarted) failure=release(failure, () -> {
            scene.configure(false); sceneStarted=false;
        });
        if (torchRegistered) failure=release(failure, () -> {
            camera.unregisterTorchCallback(torchCallback); torchRegistered=false;
        });
        if (availabilityRegistered) failure=release(failure, () -> {
            camera.unregisterAvailabilityCallback(availabilityCallback); availabilityRegistered=false;
        });
        failure=release(failure, () -> handler.removeCallbacks(updateMain));
        failure=release(failure, () -> mainRing.clear());
        if (failure!=null) throw failure;
    }
    private final SensorEventListener frontListener=new SensorEventListener(){
        @Override public void onAccuracyChanged(Sensor s,int a){}
        @Override public void onSensorChanged(SensorEvent event){
            if(!enabled || !Float.isFinite(event.values[0]) || event.values[0]<0)return;
            long now=SystemClock.uptimeMillis();handler.removeCallbacks(updateMain);
            mainRing.prune(now-longHorizon);mainRing.push(now,event.values[0]);updateMain();
        }
    };
    private void updateMain(){
        if(!enabled || mainRing.size()==0)return;
        long now=SystemClock.uptimeMillis();mainRing.prune(now-longHorizon);
        if(!mainValid){
            if(now<enableTime+warmUp){handler.postAtTime(updateMain,enableTime+warmUp);return;}
            mainValid=true;
            policy.setAmbientLuxWhenInvalid(1,mainRing.calculateAmbientLux(now,shortHorizon));
            callback.accept(new float[]{ambient,1});
        }
        policy.updateDualSensorPolicy(now,1);
    }
    @Override public float calculateFastAmbientLux(long t){return mainRing.calculateAmbientLux(t,shortHorizon);}
    @Override public float calculateSlowAmbientLux(long t){return mainRing.calculateAmbientLux(t,longHorizon);}
    @Override public float getAmbientLux(){return ambient;}
    @Override public float getBrighteningThreshold(){return bright;}
    @Override public float getSmallBrighteningThreshold(){return small;}
    @Override public float getDarkeningThreshold(){return dark;}
    @Override public long getSmallBrighteningDebounce(){return hysteresis.getSmallBrighteningLightDebounce();}
    @Override public void removeUpdateAmbientLuxMessage(){handler.removeCallbacks(updateMain);}
    @Override public void sendUpdateAmbientLuxMessage(long time){if(enabled)handler.postAtTime(updateMain,time);}
    @Override public long updateNextBrighteningTransition(long t){return mainRing.nextAmbientLightBrighteningTransition(t,bright);}
    @Override public long updateNextBrighteningTransition(long t,float lux){return mainRing.nextAmbientLightBrighteningTransition(t,lux,bright,small);}
    @Override public long updateNextDarkeningTransition(long t){return mainRing.nextAmbientLightDarkeningTransition(t,dark)+stepDarkenDebounce;}
    @Override public boolean useDaemonSensorPolicyInProgress(){return false;}
    @Override public void updateAmbientLux(int event,float lux,boolean updateLux,boolean updateBrightness){
        if(!enabled)return;
        if(updateLux)ambient=Math.max(0,lux);
        if(policy.updateMainLightSensorAmbientThreshold(event)) {
            float mainLux=policy.getMainAmbientLux();
            bright=hysteresis.getBrighteningThreshold(mainLux);
            dark=hysteresis.getDarkeningThreshold(mainLux);
            small=hysteresis.getBrighteningSmallThreshold(mainLux);
        }
        if(updateLux)callback.accept(new float[]{ambient,updateBrightness?1:0});
    }
    private final CameraManager.TorchCallback torchCallback=new CameraManager.TorchCallback(){
        @Override public void onTorchModeChanged(String id,boolean on){
            torches.put(id,on);boolean any=torches.containsValue(true);
            if(controller.torch && !any)controller.torchCloseTime=System.currentTimeMillis();
            controller.torch=any;
        }
    };
    private final CameraManager.AvailabilityCallback availabilityCallback=new CameraManager.AvailabilityCallback(){
        @Override public void onCameraAvailable(String id){busyBackIds.remove(id);controller.backCamera=!busyBackIds.isEmpty();}
        @Override public void onCameraUnavailable(String id){if(backIds.contains(id))busyBackIds.add(id);controller.backCamera=!busyBackIds.isEmpty();}
    };
    public String dump(){
        StringWriter text=new StringWriter();PrintWriter p=new PrintWriter(text);
        p.println("Pudding original HyperOS policy: enabled="+enabled+" mainValid="+mainValid
                +" aonServiceAvailable="+controller.aon+" ambient="+ambient);
        policy.dump(p);scene.dump(p);p.flush();return text.toString();
    }
}
