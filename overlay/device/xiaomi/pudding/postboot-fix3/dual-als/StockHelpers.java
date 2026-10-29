package com.xiaomi.pudding.brightness.stock;

import android.content.res.TypedArray;
import android.os.SystemClock;

// ABI adapters between original Xiaomi policy bytecode and the AOSPA host.
// No lux filtering, source selection, hysteresis or scheduling is implemented here.
class AutomaticBrightnessControllerStub {
    static int HANDLE_MAIN_LUX_EVENT=1, HANDLE_ASSIST_LUX_EVENT=2,
            DUAL_SENSOR_LUX_INVALID=0, USE_MAIN_LIGHT_SENSOR=1, USE_ASSIST_LIGHT_SENSOR=2;
    public interface DualSensorPolicyListener {
        float calculateFastAmbientLux(long time);
        float calculateSlowAmbientLux(long time);
        float getAmbientLux();
        float getBrighteningThreshold();
        float getDarkeningThreshold();
        long getSmallBrighteningDebounce();
        float getSmallBrighteningThreshold();
        void removeUpdateAmbientLuxMessage();
        void sendUpdateAmbientLuxMessage(long time);
        void updateAmbientLux(int event,float lux,boolean updateLux,boolean updateBrightness);
        long updateNextBrighteningTransition(long time);
        long updateNextBrighteningTransition(long time,float lux);
        long updateNextDarkeningTransition(long time);
        boolean useDaemonSensorPolicyInProgress();
    }
}
class AutomaticBrightnessControllerImpl {
    static final int SENSOR_TYPE_ASSIST_LIGHT_FOV=33172112, SENSOR_TYPE_LIGHT_FOV=33172111;
    boolean torch, backCamera, aon, game;
    long torchCloseTime;
    protected boolean getIsTorchOpen() { return torch && !backCamera; }
    protected boolean checkAssistSensorValid() {
        return backCamera || (!torch && System.currentTimeMillis()-torchCloseTime>1800);
    }
    protected boolean isAonFlareEnabled() { return aon; }
    public boolean isRearScreenDevice() { return false; } // Pudding has one display.
    public boolean isGameSceneEnabled() { return game; }
    // Original controller forwards these two callbacks to brightness statistics.
    public void notifyAonFlareEvents(int kind,float lux) {}
    public void notifyUpdateBrightness() {}
}
class HysteresisLevelsStub {
    public float getBrighteningThreshold(float lux) { throw new IllegalStateException("stock spline missing"); }
    public float getBrighteningSmallThreshold(float lux) { throw new IllegalStateException("stock spline missing"); }
    public float getDarkeningThreshold(float lux) { throw new IllegalStateException("stock spline missing"); }
}
class HighBrightnessModeController {
    final com.xiaomi.pudding.brightness.stock.config.HighBrightnessModeData data =
            new com.xiaomi.pudding.brightness.stock.config.HighBrightnessModeData();
    HighBrightnessModeController(float minimumLux) { data.minimumLux=minimumLux; }
    public boolean deviceSupportsHbm() { return true; }
    public com.xiaomi.pudding.brightness.stock.config.HighBrightnessModeData getHbmData() { return data; }
}
class BrightnessMappingStrategy {
    public static float[] getFloatArray(TypedArray a) {
        try {
            float[] result=new float[a.length()];
            for(int i=0;i<result.length;i++) {
                if(!a.hasValue(i)) throw new IllegalArgumentException("Missing stock curve entry: "+i);
                result[i]=a.getFloat(i,Float.NaN);
                if(!Float.isFinite(result[i]))
                    throw new IllegalArgumentException("Non-finite stock curve entry: "+i);
            }
            return result;
        } finally { a.recycle(); }
    }
}
class DisplayDebugConfig { static boolean DEBUG_ABC=false; }
