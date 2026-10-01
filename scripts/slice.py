"""Slice each oriented STL separately; retain profile and source hashes as evidence."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess


def flatten(path, profiles, seen=()):
    if path in seen:
        raise ValueError('profile inheritance cycle')
    data=json.loads(path.read_text())
    parent=data.get('inherits')
    result=flatten(profiles[parent],profiles,seen+(path,)) if parent else {}
    result.update(data)
    result.pop('inherits',None)
    return result


def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--profiles',type=Path,required=True,help='Bambu Studio resources/profiles/BBL')
    ap.add_argument('--slicer',default='bambu-studio')
    ap.add_argument('--candidate',type=Path,default=Path('candidate'))
    ap.add_argument('--part',default='*')
    args=ap.parse_args()
    root=args.candidate.resolve(); out=root/'slicing'; out.mkdir(exist_ok=True)
    profiles={p.stem:p for p in args.profiles.rglob('*.json')}
    chosen=['Bambu Lab P1S 0.4 nozzle','0.20mm Standard @BBL X1C','Generic PETG']
    files=[]
    for name in chosen:
        data=flatten(profiles[name],profiles)
        if data['type']=='machine':
            data['nozzle_volume_type']=data['default_nozzle_volume_type']
        if data['type']=='process':
            data.update(brim_type='outer_only',brim_width='5',enable_support='0',
                        wall_loops='4',sparse_infill_density='20%',curr_bed_type='Textured PEI Plate')
        path=out/(data['type']+'.json'); path.write_text(json.dumps(data,indent=2)); files.append(path)
    results=[]
    for stl in sorted((root/'stl').glob(args.part+'.stl')):
        dest=out/stl.stem; dest.mkdir(exist_ok=True)
        process_path=files[1]
        supports=stl.stem in ['habitat-front','habitat-back','habitat-left','habitat-right']
        if supports:
            process=json.loads(files[1].read_text())
            process.update(enable_support='1',support_type='normal(auto)',
                           support_on_build_plate_only='1',support_threshold_angle='45')
            process_path=dest/'process-with-supports.json'
            process_path.write_text(json.dumps(process,indent=2))
        cmd=[args.slicer,'--load-settings',str(files[0])+';'+str(process_path),
             '--load-filaments',str(files[2]),'--arrange','1','--orient','0',
             '--ensure-on-bed','--slice','0','--export-3mf','sliced.3mf',
             '--outputdir',str(dest),str(stl)]
        with (dest/'slicer.log').open('w') as log:
            r=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,
                             env={**os.environ,'APPIMAGE_EXTRACT_AND_RUN':'1'},cwd=dest,timeout=600)
        text=(dest/'slicer.log').read_text()
        import zipfile
        artifact=dest/'sliced.3mf'
        gcode_present=artifact.exists() and any(n.endswith('.gcode') for n in zipfile.ZipFile(artifact).namelist())
        results.append(dict(part=stl.stem,exit_code=r.returncode,gcode_present=gcode_present,supports_enabled=supports,
                            stl_sha256=hashlib.sha256(stl.read_bytes()).hexdigest(),
                            warnings=[line for line in text.splitlines() if any(s in line.lower() for s in ['warn','error','floating','bridge'])]))
        print(stl.stem,r.returncode,flush=True)
        (out/'results.json').write_text(json.dumps(results,indent=2))
    if not results or any(r['exit_code'] or not r['gcode_present'] for r in results):
        raise SystemExit(1)


if __name__=='__main__': main()
