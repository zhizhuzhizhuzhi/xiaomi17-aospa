set -eu
B=/home/zzq/android/aospa17-pudding
W=/home/zzq/android/pudding-bringup-20261022/unified-fix3/dual-als
H="$B/out-pudding-userdebug/host/linux-x86/bin"
export JAVA_HOME="$B/prebuilts/jdk/jdk21/linux-x86";export PATH="$JAVA_HOME/bin:$PATH"
python3 - <<'PY'
from pathlib import Path
import shutil,zipfile,struct,json,hashlib,subprocess
b=Path('/home/zzq/android/aospa17-pudding');w=Path('/home/zzq/android/pudding-bringup-20261022/unified-fix3/dual-als');s=Path('/home/zzq/android/pudding-bringup-20261022/stock/images')
src=w/'bridge-src';src.mkdir(exist_ok=True)
# Apply the actual Xiaomi framework RRO values to an isolated resource context.
# Loading only framework-ext-res.apk would lose e.g. the AON component override.
def resource_rows(path):
 import re
 rows={};last=None
 for line in path.read_text().splitlines():
  m=re.match(r'\s*resource (0x[0-9a-f]+) (\w+)/([^ ]+)',line)
  if m:last=(int(m[1],16),m[2],m[3])
  elif last and line.strip().startswith('() '):
   rows[last[2]]=(last[0],last[1],line.strip()[3:]);last=None
 return rows
base=resource_rows(w/'framework-ext-res.txt');overlay=resource_rows(w/'overlay-MiuiFrameworkResOverlay.apk.txt')
ids={285933635,285671690,285671469,285671473,285933583,286195871,285540519,285933642,285540525,285933641}
overrides={}
for name,(rid,kind,value) in base.items():
 if rid in ids and name in overlay:
  _,okind,oval=overlay[name];assert kind==okind;overrides[rid]=(kind,oval,name)
methods=[]
for method,kind,jtype in [('getString','string','String'),('getBoolean','bool','boolean'),('getInteger','integer','int'),('getFloat','dimen','float')]:
 cases=[]
 for rid,(k,value,name) in overrides.items():
  if k==kind:
   if jtype=='float':value+='f'
   cases.append('case '+str(rid)+': return '+value+'; // '+name)
 methods.append('@Override public '+jtype+' '+method+'(int id){switch(id){'+'\n'.join(cases)+'\ndefault:return super.'+method+'(id);}}')
(src/'ResourceOverrides.java').write_text('package com.xiaomi.pudding.brightness.stock;\npublic final class ResourceOverrides extends android.content.res.Resources {public ResourceOverrides(android.content.res.AssetManager a,android.util.DisplayMetrics m,android.content.res.Configuration c){super(a,m,c);}\n'+'\n'.join(methods)+'\n}')
(w/'effective-resource-overrides.json').write_text(json.dumps(overrides,indent=2)+'\n')
for n in ['Entry.java','StockHelpers.java','Probe.java']:shutil.copy2(w/n,src/n)
prefix='package com.xiaomi.pudding.brightness.stock;\n'
(src/'CompileApi.java').write_text(prefix+'''
class AmbientLightRingBuffer {
 AmbientLightRingBuffer(long r,int h){} void setBrighteningDebounce(long v){} void setDarkeningDebounce(long v){} public void setSmallBrighteningDebounce(long v){} public void clear(){} public int size(){return 0;} public void prune(long t){} public void push(long t,float v){} public float calculateAmbientLux(long t,long h){return 0;} long nextAmbientLightBrighteningTransition(long t,float v){return 0;} long nextAmbientLightBrighteningTransition(long t,float v,float b,float s){return 0;} long nextAmbientLightDarkeningTransition(long t,float v){return 0;}
}
class HysteresisLevelsImpl extends HysteresisLevelsStub { public HysteresisLevelsImpl(){} public void createHysteresisThresholdSpline(float[] a,float[] b,float[] c,float[] d){} public long getSmallBrighteningLightDebounce(){return 0;} }
class DualSensorPolicy {
 public DualSensorPolicy(android.os.Looper l,android.hardware.SensorManager s,int warm,int rate,long b,long d,int h,int sh,HysteresisLevelsStub hy,AutomaticBrightnessControllerStub.DualSensorPolicyListener listener,AutomaticBrightnessControllerImpl controller,boolean f,boolean af,float ff,float aff){}
 void setSceneDetector(SceneDetector s){} protected android.hardware.Sensor getAssistLightSensor(){return null;} protected void setSensorEnabled(boolean e){} void setAmbientLuxWhenInvalid(int e,float v){} protected boolean updateDualSensorPolicy(long t,int e){return false;} protected boolean updateMainLightSensorAmbientThreshold(int e){return false;} protected float getMainAmbientLux(){return 0;} protected void dump(java.io.PrintWriter p){}
}
class SceneDetector {public SceneDetector(AutomaticBrightnessControllerStub.DualSensorPolicyListener l,AutomaticBrightnessControllerImpl b,android.os.Handler h,android.content.Context c,android.hardware.SensorManager s,boolean aon,boolean prox){} public void configure(boolean e){} protected void dump(java.io.PrintWriter p){} }
''')
csrc=src/'config';csrc.mkdir(exist_ok=True)
(csrc/'HighBrightnessModeData.java').write_text('package com.xiaomi.pudding.brightness.stock.config; public class HighBrightnessModeData { public float minimumLux; }')
(csrc/'HysteresisLevels.java').write_text('package com.xiaomi.pudding.brightness.stock.config; public class HysteresisLevels { public float getBrighteningThreshold(float v){throw new IllegalStateException("stock curve unavailable");} public float getDarkeningThreshold(float v){throw new IllegalStateException("stock curve unavailable");}}')
(src/'MiuiMultiDisplayTypeInfo.java').write_text('package com.xiaomi.pudding.brightness.miui; public final class MiuiMultiDisplayTypeInfo { public static boolean isIndependentRearDevice(){return false;} }')
# Only select the original implementation and its actual scene/binder dependency classes.
original=w/'original-smali';original.mkdir(exist_ok=True)
manifest={};roots=list(w.glob('smali-classes*'))+[w/'stock-services-smali']
for root in roots:
 for p in (root/'com/android/server/display').glob('*.smali'):
  if p.name in ['DualSensorPolicy.smali','AmbientLightRingBuffer.smali','HysteresisLevelsImpl.smali'] or p.name.startswith(('DualSensorPolicy$','SceneDetector')):
   rel=p.relative_to(root);out=original/rel;out.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(p,out);manifest[str(rel)]=hashlib.sha256(p.read_bytes()).hexdigest()
names=['IAONFlareService','IAONFlareService$Default','IAONFlareService$Stub','IAONFlareService$Stub$Proxy','IMiAONListener','IMiAONListener$Default','IMiAONListener$Stub','IMiAONListener$Stub$Proxy']
targets={'Lcom/xiaomi/aon/'+n+';' for n in names};found=set()
def descriptors(data):
 strings_n,strings_o=struct.unpack_from('<II',data,56);types_n,types_o=struct.unpack_from('<II',data,64);classes_n,classes_o=struct.unpack_from('<II',data,96)
 def string(i):
  off=struct.unpack_from('<I',data,strings_o+4*i)[0]
  while data[off]&128:off+=1
  off+=1;end=data.index(0,off);return data[off:end].decode('utf-8','replace')
 for i in range(classes_n):
  typeid=struct.unpack_from('<I',data,classes_o+32*i)[0];sid=struct.unpack_from('<I',data,types_o+4*typeid)[0];yield string(sid)
for jar in [s/'system/framework/services.jar',s/'system/framework/framework.jar',s/'system_ext/framework/miui-framework.jar',s/'system_ext/framework/miui-services.jar']:
 with zipfile.ZipFile(jar) as z:
  for n in z.namelist():
   if not n.endswith('.dex'):continue
   data=z.read(n);wanted=targets.intersection(descriptors(data))
   if not wanted:continue
   dex=w/('binder-'+jar.stem+'-'+n);dex.write_bytes(data)
   subprocess.run([str(b/'prebuilts/jdk/jdk21/linux-x86/bin/java'),'-Xmx512m','-jar',str(b/'prebuilts/extract-tools/common/smali/baksmali.jar'),'d',str(dex),'--classes',','.join(sorted(wanted)),'-o',str(original),'-j','2'],check=True)
   found|=wanted
assert targets==found,(targets-found)
for p in (original/'com/xiaomi/aon').glob('*.smali'):manifest[str(p.relative_to(original))]=hashlib.sha256(p.read_bytes()).hexdigest()
(w/'original-class-hashes.json').write_text(json.dumps(manifest,indent=2)+'\n')
print('ORIGINAL_CLASSES_ISOLATED',len(manifest))
PY
mkdir -p "$W/bridge-classes" "$W/bridge-dex"
J="$B/out-pudding-userdebug/soong/.intermediates/frameworks/base/framework-minus-apex-headers/android_common/turbine-combined/framework.jar"
javac --release 17 -classpath "$J" -d "$W/bridge-classes" $(find "$W/bridge-src" -name '*.java')
jar cf "$W/bridge-classes.jar" -C "$W/bridge-classes" .
"$H/d8" --lib "$B/prebuilts/sdk/current/public/android.jar" --min-api 35 --output "$W/bridge-dex" "$W/bridge-classes.jar"
java -Xmx512m -jar "$B/prebuilts/extract-tools/common/smali/baksmali.jar" d "$W/bridge-dex/classes.dex" -o "$W/combined-smali" -j 2
python3 - <<'PY'
from pathlib import Path
import hashlib,json,re,shutil
w=Path('/home/zzq/android/pudding-bringup-20261022/unified-fix3/dual-als');audit={}
for p in (w/'original-smali').rglob('*.smali'):
 rel=str(p.relative_to(w/'original-smali'));newrel=rel.replace('com/android/server/display/','com/xiaomi/pudding/brightness/stock/')
 original=p.read_text();t=original.replace('Lcom/android/server/display/','Lcom/xiaomi/pudding/brightness/stock/').replace('Lmiui/util/MiuiMultiDisplayTypeInfo;','Lcom/xiaomi/pudding/brightness/miui/MiuiMultiDisplayTypeInfo;')
 out=w/'combined-smali'/newrel;out.parent.mkdir(parents=True,exist_ok=True);out.write_text(t)
 # Namespace relocation is the only change. In particular all branches, constants and timers remain.
 restored=t.replace('Lcom/xiaomi/pudding/brightness/stock/','Lcom/android/server/display/').replace('Lcom/xiaomi/pudding/brightness/miui/MiuiMultiDisplayTypeInfo;','Lmiui/util/MiuiMultiDisplayTypeInfo;')
 assert restored==original
 audit[newrel]={'source_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'namespace_relocation_only':True}
(w/'bytecode-preservation-audit.json').write_text(json.dumps(audit,indent=2)+'\n')
print('PRESERVED_ALL_ORIGINAL_INSTRUCTIONS',len(audit))
PY
java -Xmx512m -jar "$B/prebuilts/extract-tools/common/smali/smali.jar" a "$W/combined-smali" -o "$W/classes.dex" -j 2
python3 - <<'PY'
from pathlib import Path
import zipfile,hashlib
w=Path('/home/zzq/android/pudding-bringup-20261022/unified-fix3/dual-als')
with zipfile.ZipFile(w/'PuddingStockBrightness.jar','w',zipfile.ZIP_DEFLATED) as z:z.write(w/'classes.dex','classes.dex')
print('ORIGINAL_POLICY_JAR',hashlib.sha256((w/'PuddingStockBrightness.jar').read_bytes()).hexdigest())
PY
