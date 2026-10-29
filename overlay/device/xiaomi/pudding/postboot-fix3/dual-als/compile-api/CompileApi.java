package com.xiaomi.pudding.brightness.stock;

class AmbientLightRingBuffer {
 AmbientLightRingBuffer(long r,int h){} void setBrighteningDebounce(long v){} void setDarkeningDebounce(long v){} public void setSmallBrighteningDebounce(long v){} public void clear(){} public int size(){return 0;} public void prune(long t){} public void push(long t,float v){} public float calculateAmbientLux(long t,long h){return 0;} long nextAmbientLightBrighteningTransition(long t,float v){return 0;} long nextAmbientLightBrighteningTransition(long t,float v,float b,float s){return 0;} long nextAmbientLightDarkeningTransition(long t,float v){return 0;}
}
class HysteresisLevelsImpl extends HysteresisLevelsStub { public HysteresisLevelsImpl(){} public void createHysteresisThresholdSpline(float[] a,float[] b,float[] c,float[] d){} public long getSmallBrighteningLightDebounce(){return 0;} }
class DualSensorPolicy {
 public DualSensorPolicy(android.os.Looper l,android.hardware.SensorManager s,int warm,int rate,long b,long d,int h,int sh,HysteresisLevelsStub hy,AutomaticBrightnessControllerStub.DualSensorPolicyListener listener,AutomaticBrightnessControllerImpl controller,boolean f,boolean af,float ff,float aff){}
 void setSceneDetector(SceneDetector s){} protected android.hardware.Sensor getAssistLightSensor(){return null;} protected void setSensorEnabled(boolean e){} void setAmbientLuxWhenInvalid(int e,float v){} protected boolean updateDualSensorPolicy(long t,int e){return false;} protected boolean updateMainLightSensorAmbientThreshold(int e){return false;} protected float getMainAmbientLux(){return 0;} protected void dump(java.io.PrintWriter p){}
}
class SceneDetector {public SceneDetector(AutomaticBrightnessControllerStub.DualSensorPolicyListener l,AutomaticBrightnessControllerImpl b,android.os.Handler h,android.content.Context c,android.hardware.SensorManager s,boolean aon,boolean prox){} public void configure(boolean e){} protected void dump(java.io.PrintWriter p){} }
