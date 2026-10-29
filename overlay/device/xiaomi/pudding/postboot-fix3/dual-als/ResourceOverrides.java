package com.xiaomi.pudding.brightness.stock;
public final class ResourceOverrides extends android.content.res.Resources {public ResourceOverrides(android.content.res.AssetManager a,android.util.DisplayMetrics m,android.content.res.Configuration c){super(a,m,c);}
@Override public String getString(int id){switch(id){case 286195871: return "com.xiaomi.aon/com.xiaomi.aon.AonFlareService"; // config_aon_flare_component
default:return super.getString(id);}}
@Override public boolean getBoolean(int id){switch(id){case 285540519: return true; // config_brightness_step_mode_supported
case 285540525: return true; // config_gamebrightness_useprox
default:return super.getBoolean(id);}}
@Override public int getInteger(int id){switch(id){
default:return super.getInteger(id);}}
@Override public float getFloat(int id){switch(id){
default:return super.getFloat(id);}}
}