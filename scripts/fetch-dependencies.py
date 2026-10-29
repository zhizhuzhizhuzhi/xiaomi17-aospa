#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0
"""Install prepared, hash-pinned Pudding inputs; never fetch moving firmware."""
import argparse,hashlib,json,pathlib,shutil,os
kit=pathlib.Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser(description=__doc__);p.add_argument('tree',type=pathlib.Path);p.add_argument('--source',type=pathlib.Path,action='append',default=[]);p.add_argument('--verify',action='store_true');p.add_argument('--replace-stock-inputs',action='store_true');a=p.parse_args();root=a.tree.resolve();rows=json.loads((kit/'dependencies.json').read_text())['files'];plans=[];missing=[]
def sha(path):
 with path.open('rb') as f:return hashlib.file_digest(f,'sha256').hexdigest()
for r in rows:
 rel=pathlib.PurePosixPath(r['destination'])
 if rel.is_absolute() or '..' in rel.parts:raise SystemExit('Invalid input path')
 dst=root/rel
 if not dst.resolve().is_relative_to(root):raise SystemExit('Input destination escapes tree: '+str(rel))
 if dst.is_file() and dst.stat().st_size==r['bytes'] and sha(dst)==r['sha256']:continue
 if a.verify:missing.append(str(rel));continue
 if dst.exists() and not a.replace_stock_inputs:raise SystemExit('Different input exists; review --replace-stock-inputs: '+str(rel))
 src=None
 for source in a.source:
  for name in r.get('sources',[r['destination']]):
   q=source/name
   if q.is_file() and q.stat().st_size==r['bytes'] and sha(q)==r['sha256']:src=q;break
  if src:break
 if src is None:missing.append(str(rel))
 else:plans.append((r,src,dst))
if missing:raise SystemExit('Missing/mismatched prepared inputs (%d):\n%s'%(len(missing),'\n'.join(missing)))
# All candidate hashes are checked before any existing file is replaced.
for r,src,dst in plans:
 dst.parent.mkdir(parents=True,exist_ok=True);part=pathlib.Path(str(dst)+'.pudding-input.part')
 if part.exists():raise SystemExit('Incomplete installation exists: '+str(part))
 with src.open('rb') as f,part.open('xb') as out:shutil.copyfileobj(f,out);out.flush();os.fsync(out.fileno())
 if sha(part)!=r['sha256']:raise SystemExit('Input changed while copying: '+str(src))
 part.chmod(r.get('mode',0o644));part.replace(dst)
print('PASS: %d prepared inputs checked; %d installed'%(len(rows),len(plans)))
