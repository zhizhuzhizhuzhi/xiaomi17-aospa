#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0
import argparse,pathlib,subprocess,zipfile,hashlib,json,os
p=argparse.ArgumentParser();p.add_argument('tree',type=pathlib.Path);p.add_argument('target_files',type=pathlib.Path);p.add_argument('output',type=pathlib.Path);a=p.parse_args();root=a.tree.resolve();archive=a.target_files.resolve();out=a.output.resolve();part=pathlib.Path(str(out)+'.part')
if out.exists() or part.exists():raise SystemExit('Refusing to overwrite an existing package or partial')
with zipfile.ZipFile(archive) as z:
 names=set(z.namelist())
 if len(names)!=len(z.namelist()):raise SystemExit('Duplicate target-files entry')
 board=z.read('OTA/android-info.txt').strip()
 if board not in [b'require board=pudding',b'require board=pudding|canoe',b'require board=canoe|pudding']:raise SystemExit('Wrong board')
 ab=set(z.read('META/ab_partitions.txt').decode().split())
 core={'boot','dtbo','init_boot','odm','product','pvmfw','recovery','system','system_dlkm','system_ext','vbmeta','vbmeta_system','vendor','vendor_boot','vendor_dlkm'}
 if not core<=ab:raise SystemExit('Missing Pudding core partitions')
 mapping={pathlib.PurePosixPath(n).name:n for n in names if n.startswith('IMAGES/') and n.endswith('.img')}
 for partition in ab:
  image=partition+'.img'
  candidates=[d+'/'+image for d in ['IMAGES','PREBUILT_IMAGES','RADIO']]
  source=next((n for n in candidates if n in names),None)
  if source is None:raise SystemExit('Missing image for A/B partition: '+partition)
  mapping[image]=source
build_out=pathlib.Path(os.environ.get('OUT_DIR','out-pudding-userdebug'));host=(build_out if build_out.is_absolute() else root/build_out)/'host/linux-x86';env=dict(os.environ,PATH=str(host/'bin')+':'+os.environ['PATH']);out.parent.mkdir(parents=True,exist_ok=True)
subprocess.run([str(host/'bin/img_from_target_files'),'-p',str(host),str(archive),str(part)],env=env,check=True)
def sha(f):
 h=hashlib.sha256()
 for b in iter(lambda:f.read(8*1024*1024),b''):h.update(b)
 return h.hexdigest()
rows=[]
with zipfile.ZipFile(archive) as source,zipfile.ZipFile(part) as output:
 if output.testzip() is not None or len(set(output.namelist()))!=len(output.namelist()):raise SystemExit('ZIP CRC/duplicate entry failure')
 if output.read('android-info.txt').strip()!=board:raise SystemExit('Wrong output board')
 actual={n for n in output.namelist() if n.endswith('.img')}
 if actual!=set(mapping):raise SystemExit('Image set differs from target-files')
 for image,entry in sorted(mapping.items()):
  with output.open(image) as f,source.open(entry) as g:
   h=sha(f)
   if h!=sha(g):raise SystemExit('Image mismatch: '+image)
  rows.append(dict(image=image,source=entry,sha256=h))
part.rename(out)
with out.open('rb') as f:h=sha(f)
pathlib.Path(str(out)+'.sha256').write_text(h+'  '+out.name+'\n');pathlib.Path(str(out)+'.manifest.json').write_text(json.dumps(rows,indent=2)+'\n');print('Verified:',out,h)
