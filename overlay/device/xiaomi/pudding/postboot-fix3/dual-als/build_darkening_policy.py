#!/usr/bin/env python3
"""Reproduce the three slow-darkening guards over the sealed relocated Xiaomi policy."""
from pathlib import Path
import argparse,hashlib,json,subprocess,zipfile,shutil,difflib,math

CLASS='com/xiaomi/pudding/brightness/stock/DualSensorPolicy.smali'
OWNER='Lcom/xiaomi/pudding/brightness/stock/DualSensorPolicy;'
SITES=[('dual_main','v8','v0','Main','v4','cond_b','v19','v2'),
       ('dual_assist','v12','v0','Assist','v13','cond_18','v10','v2'),
       ('single_main','v6','p0','Main','v5','cond_2','v2','p1')]

def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def guarded_region(text,site):
 name,r,obj,sensor,tr,label,due,now=site
 gate='    iget '+r+', '+obj+', '+OWNER+'->m'+sensor+'FastAmbientLux:F\n'
 if sensor=='Assist':gate+='\n    iget '+tr+', '+obj+', '+OWNER+'->mAssistDarkeningThreshold:F\n'
 gate+='\n    cmpg-float '+r+', '+r+', '+tr+'\n\n    if-gtz '+r+', :'+label+'\n'
 if text.count(gate)!=1:raise ValueError('Expected one exact darkening gate: '+name)
 start=text.index(gate)
 end=text.index('    if-gtz '+r+', :'+label,text.index('    cmp-long '+r+', '+due+', '+now,start))+len('    if-gtz '+r+', :'+label)
 return text[start:end]

def execute_guard(region,site,fast,slow,threshold,next_time,time):
 _,scratch,obj,sensor,tr,label,due,now=site
 regs={tr:threshold,due:next_time,now:time}
 fields={'m'+sensor+'FastAmbientLux:F':fast,'m'+sensor+'SlowAmbientLux:F':slow,'m'+sensor+'DarkeningThreshold:F':threshold}
 for raw in region.splitlines():
  line=raw.strip()
  if not line or line.startswith(('.',':','#')):continue
  op,rest=line.split(' ',1);args=[x.strip() for x in rest.split(',')]
  if op=='iget':regs[args[0]]=fields[args[2].split('->',1)[1]]
  elif op in ['cmpg-float','cmp-long']:
   a,b=regs[args[1]],regs[args[2]]
   regs[args[0]]=1 if op=='cmpg-float' and (math.isnan(a) or math.isnan(b)) else (a>b)-(a<b)
  elif op=='if-gtz':
   if args[1]!=':'+label:raise ValueError('Unexpected rejection target')
   if regs[args[0]]>0:return False
  else:raise ValueError('Unexpected production instruction: '+line)
 return True

def main():
 a=argparse.ArgumentParser()
 for n in ['policy','sha256','work','out','java','baksmali','smali']:a.add_argument('--'+n,required=True)
 args=a.parse_args();W=Path(args.work);W.mkdir(exist_ok=False)
 if sha(args.policy)!=Path(args.sha256).read_text().strip():raise ValueError('Original sealed policy SHA256 mismatch')
 with zipfile.ZipFile(args.policy) as z:
  if z.namelist()!=['classes.dex'] or z.testzip() is not None:raise ValueError('Unexpected original DEX container')
  (W/'before.dex').write_bytes(z.read('classes.dex'))
 subprocess.run([args.java,'-Xmx512m','-jar',args.baksmali,'d',str(W/'before.dex'),'--sequential-labels','-o',str(W/'before'),'-j','2'],check=True)
 shutil.copytree(W/'before',W/'after');p=W/'after'/CLASS;before=p.read_text();after=before
 for name,r,obj,sensor,tr,label,due,now in SITES:
  block=guarded_region(after,(name,r,obj,sensor,tr,label,due,now))
  needle='    if-gtz '+r+', :'+label+'\n'
  if block.count(needle)!=1:raise ValueError('Ambiguous fast-darkening gate: '+name)
  insertion='\n    iget '+r+', '+obj+', '+OWNER+'->m'+sensor+'SlowAmbientLux:F\n\n    cmpg-float '+r+', '+r+', '+tr+'\n\n    if-gtz '+r+', :'+label+'\n'
  changed=block.replace(needle,needle+insertion,1)
  if after.count(block)!=1:raise ValueError('Ambiguous policy region: '+name)
  after=after.replace(block,changed,1)
 p.write_text(after)
 subprocess.run([args.java,'-Xmx512m','-jar',args.smali,'a',str(W/'after'),'-o',str(W/'after.dex'),'-j','2'],check=True)
 subprocess.run([args.java,'-Xmx512m','-jar',args.baksmali,'d',str(W/'after.dex'),'--sequential-labels','-o',str(W/'roundtrip'),'-j','2'],check=True)
 original_files={p.relative_to(W/'before').as_posix():p for p in (W/'before').rglob('*.smali')}
 final_files={p.relative_to(W/'roundtrip').as_posix():p for p in (W/'roundtrip').rglob('*.smali')}
 if original_files.keys()!=final_files.keys():raise ValueError('Policy class set changed')
 for rel,p in final_files.items():
  expected=after if rel==CLASS else original_files[rel].read_text()
  if p.read_text()!=expected:raise ValueError('Unintended roundtrip semantic change: '+rel)
 cases=[('brief_shadow',20.,350.,100.,0,1000,False),('sustained_dark',20.,40.,100.,0,1000,True),
        ('debounce_pending',20.,40.,100.,1100,1000,False),('fast_recovered',150.,40.,100.,0,1000,False),
        ('slow_at_threshold',20.,100.,100.,0,1000,True),('slow_still_bright',20.,100.1,100.,0,1000,False),
        ('invalid_fast',float('nan'),40.,100.,0,1000,False),('invalid_slow',20.,float('nan'),100.,0,1000,False)]
 results=[]
 for site in SITES:
  old=guarded_region(before,site);new=guarded_region(after,site)
  for name,fast,slow,threshold,next_time,time,want in cases:
   prior=execute_guard(old,site,fast,slow,threshold,next_time,time)
   actual=execute_guard(new,site,fast,slow,threshold,next_time,time)
   if actual!=want:raise AssertionError((site[0],name,actual,want))
   if name in ['brief_shadow','slow_still_bright','invalid_slow'] and not prior:raise AssertionError('Before defect not reproduced')
   results.append({'path':site[0],'scenario':name,'before_allows_darkening':prior,'after_allows_darkening':actual,'expected':want})
 out=Path(args.out)
 if out.exists():raise FileExistsError(out)
 with zipfile.ZipFile(out,'x',zipfile.ZIP_DEFLATED) as z:
  info=zipfile.ZipInfo('classes.dex',(2009,1,1,0,0,0));info.compress_type=zipfile.ZIP_DEFLATED;z.writestr(info,(W/'after.dex').read_bytes())
 (W/'policy.patch').write_text(''.join(difflib.unified_diff(before.splitlines(True),after.splitlines(True),fromfile='original/'+CLASS,tofile='confirmed/'+CLASS)))
 report={'status':'PASS','scope':'Three real DEX rejection regions interpreted for boundary cases; full ART/device validation still required','original_policy_sha256':sha(args.policy),'derived_policy_sha256':sha(out),'classes':len(original_files),'unchanged_classes':len(original_files)-1,'only_changed_class':CLASS,'added_slow_confirmations':3,'production_instructions_added':9,'native_timers_and_switching_instructions_unchanged':True,'roundtrip_canonical_smali_exact':True,'test_cases':results,'tool_sha256':{'baksmali':sha(args.baksmali),'smali':sha(args.smali)}}
 (W/'audit.json').write_text(json.dumps(report,indent=2));print(json.dumps({k:v for k,v in report.items() if k!='test_cases'}),flush=True)
if __name__=='__main__':main()
