#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0
"""Validate all project bases and overlays before applying the source delta."""
import argparse,hashlib,json,pathlib,subprocess,shutil
kit=pathlib.Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser(description=__doc__);p.add_argument('tree',type=pathlib.Path);g=p.add_mutually_exclusive_group();g.add_argument('--check',action='store_true');g.add_argument('--verify-applied',action='store_true');a=p.parse_args();tree=a.tree.resolve();plans=[]
def sha(path):return hashlib.sha256(path.read_bytes()).hexdigest()
def safe(root,name):
 rel=pathlib.PurePosixPath(name)
 if rel.is_absolute() or '..' in rel.parts:raise SystemExit('Unsafe relative path: '+name)
 return root/rel
def git(repo,*args):return subprocess.run(['git','-C',str(repo),*args],capture_output=True,text=True)
for r in json.loads((kit/'projects.json').read_text()):
 repo=safe(tree,r['path']);head=git(repo,'rev-parse','HEAD')
 if r.get('kind') != 'generated' and (head.returncode or head.stdout.strip()!=r['revision']):raise SystemExit('Wrong base revision: '+r['path'])
 patch=safe(kit,r['patch']) if r['patch'] else None;state='none'
 if patch:
  if sha(patch)!=r['patch_sha256']:raise SystemExit('Patch hash mismatch: '+r['path'])
  if git(repo,'apply','--reverse','--check',str(patch)).returncode==0:state='applied'
  elif not a.verify_applied and git(repo,'apply','--check',str(patch)).returncode==0:state='pending'
  else:raise SystemExit('Patch does not match: '+r['path'])
 for name in r['overlay']:
  src=safe(kit/'overlay'/r['path'],name);dst=safe(repo,name)
  if sha(src)!=r['overlay_sha256'][name]:raise SystemExit('Overlay hash mismatch: '+name)
  if dst.exists() and (not dst.is_file() or sha(dst)!=sha(src)):raise SystemExit('Refusing to overwrite different overlay: '+str(dst))
  if a.verify_applied and not dst.is_file():raise SystemExit('Missing overlay: '+str(dst))
 plans.append((r,repo,patch,state))
if not (a.check or a.verify_applied):
 for r,repo,patch,state in plans:
  if state=='pending':subprocess.run(['git','-C',str(repo),'apply','--whitespace=nowarn',str(patch)],check=True)
  for name in r['overlay']:
   src=kit/'overlay'/r['path']/name;dst=repo/name;dst.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(src,dst);dst.chmod(r.get('overlay_modes',{}).get(name,0o644))
print('PASS: %d project deltas %s'%(len(plans),'verified' if a.check or a.verify_applied else 'applied'))
