from pathlib import Path
import zipfile,hashlib,struct,copy,json,argparse
p=argparse.ArgumentParser();p.add_argument('--input',required=True);p.add_argument('--output',required=True);p.add_argument('--icons',required=True);p.add_argument('--audit',required=True);a=p.parse_args()
src=Path(a.input);out=Path(a.output);assert src!=out and not out.exists()
mapping={'res/BNz.png':'235.png','res/zCQ.png':'470.png','res/2Fn.png':'705.png'}
def digest(b):return hashlib.sha256(b).hexdigest()
def dimensions(b):
 assert b[:8]==b'\x89PNG\r\n\x1a\n';return struct.unpack_from('>II',b,16)
changes={};preserved={};removed=[]
with zipfile.ZipFile(src) as z,zipfile.ZipFile(out,'w',allowZip64=True) as dst:
 assert len(z.namelist())==len(set(z.namelist())) and set(mapping).issubset(z.namelist())
 for info in z.infolist():
  n=info.filename;b=z.read(n)
  if n=='META-INF/MANIFEST.MF' or (n.startswith('META-INF/') and n.upper().endswith(('.RSA','.DSA','.EC','.SF'))):removed.append(n);continue
  if n in mapping:
   replacement=(Path(a.icons)/mapping[n]).read_bytes();assert dimensions(b)==dimensions(replacement),(n,dimensions(b),dimensions(replacement));assert digest(b)!=digest(replacement),'Icon already patched'
   changes[n]=dict(before_sha256=digest(b),after_sha256=digest(replacement),size=dimensions(b));b=replacement
  else:preserved[n]=digest(b)
  dst.writestr(copy.copy(info),b)
with zipfile.ZipFile(out) as z:
 assert z.testzip() is None
 assert all(digest(z.read(n))==h for n,h in preserved.items())
 assert all(digest(z.read(n))==r['after_sha256'] for n,r in changes.items())
 assert len(changes)==3
report=dict(status='PASS',input_sha256=digest(src.read_bytes()),unsigned_output_sha256=digest(out.read_bytes()),changed_resources=changes,preserved_entry_count=len(preserved),resources_arsc_unchanged=True,manifest_unchanged=True,dex_native_and_other_assets_unchanged=True,old_signature_entries_removed=removed,original_art='AOSPA Aperture original icon rendered by Android AdaptiveIconDrawable; source authors retained')
Path(a.audit).write_text(json.dumps(report,indent=2));print(json.dumps(report,indent=2))