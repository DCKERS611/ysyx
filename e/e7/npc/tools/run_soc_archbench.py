#!/usr/bin/env python3
"""串行构建并冻结全套SoC镜像，独立进程运行，保存配置与真实结果。"""
from pathlib import Path
import argparse,subprocess,os,json,time,hashlib,shutil,re,concurrent.futures,math
p=argparse.ArgumentParser();p.add_argument('--jobs',type=int,default=4);p.add_argument('--k',type=int,choices=[1,12],default=1);p.add_argument('--dataset',choices=['test','train'],default='test');a=p.parse_args()
if a.jobs < 1:p.error('--jobs must be positive')
root=Path('/home/ysyx/ysyx-workbench');bench=root/'archbench'
out=root/'npc/build/verification'/time.strftime('full-soc-archbench-'+a.dataset+'-%Y%m%d-%H%M%S');out.mkdir(parents=True)
print(out,flush=True)
env=dict(os.environ,AM_HOME=str(root/'abstract-machine'),BENCH_HOME=str(bench),NPC_CPU_CLOCK_RATIO=str(a.k),NPC_MAX_CYCLES='1000000000000')
sim=out/'sim';shutil.copy2(root/'npc/build/soc/sim',sim)
sha=lambda f:hashlib.sha256(f.read_bytes()).hexdigest()
config={'k':a.k,'frequency_mhz':25*a.k,'q16':0,'dataset':a.dataset,'simulator_sha256':sha(sim),'jobs':a.jobs,'images':{}}
rows=[]
def save():
    for name,value in [('summary',rows),('config',config)]:
        tmp=out/(name+'.tmp');tmp.write_text(json.dumps(value,indent=2)+'\n');tmp.replace(out/(name+'.json'))
names=sorted(x.name for x in (bench/'bench').iterdir() if x.is_dir() and x.name!='000.hello')
(out/'stage.json').write_text(json.dumps({'stage':'building','benchmarks':names})+'\n')
for name in names:
    app=bench/'bench'/name
    with (out/(name+'.build.log')).open('w') as log:
        z=subprocess.run(['make','ARCH=minirv-ysyxsoc',f'NPC_CPU_FREQ_MHZ={25*a.k}','NPC_TIMER_CALIBRATION_Q16=0','mainargs='+a.dataset,'insert-arg'],cwd=app,env=env,stdout=log,stderr=subprocess.STDOUT)
    images=list((app/'build').glob('*-minirv-ysyxsoc.bin'))
    if z.returncode or len(images)!=1:
        rows.append({'name':name,'stage':'build_failed','exit_code':z.returncode});save();continue
    image=out/(name+'.bin');shutil.copy2(images[0],image);config['images'][name]=sha(image);save()
    print('built',name,flush=True)
(out/'stage.json').write_text(json.dumps({'stage':'running','benchmarks':names})+'\n')
print('AM_BUILD_RELEASED',flush=True)
def execute(name):
    start=time.monotonic()
    with (out/(name+'.stdout.log')).open('w') as stdout,(out/(name+'.stderr.log')).open('w') as stderr:
        z=subprocess.run([str(sim),str(out/(name+'.bin'))],cwd=root/'npc',env=env,stdout=stdout,stderr=stderr)
    text=(out/(name+'.stdout.log')).read_text(errors='replace');err=(out/(name+'.stderr.log')).read_text(errors='replace')
    score=re.search(r'(\d+) Marks',text)
    clean=re.sub(r'\x1b\[[0-9;]*m','',text)
    ok=z.returncode==0 and re.search(r'\[RESULT\]\s+PASS\b',clean) is not None and 'GOOD TRAP' in text+err and (a.dataset=='test' or score is not None)
    return {'name':name,'stage':'passed' if ok else 'failed','exit_code':z.returncode,'wall_seconds':time.monotonic()-start,'marks':int(score[1]) if score else None}
with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs) as pool:
    pending={pool.submit(execute,n):n for n in config['images']}
    for f in concurrent.futures.as_completed(pending):
        row=f.result();rows.append(row);save();print(row,flush=True)
passed=len(rows)==len(names) and all(r['stage']=='passed' for r in rows)
scores=[r['marks'] for r in rows if r['stage']=='passed']
result={'stage':'complete' if passed else 'needs_review','passed':sum(r['stage']=='passed' for r in rows),'total':len(names),'results':rows}
if passed and a.dataset=='train':result.update(arithmetic_mean=sum(scores)/len(scores),geometric_mean=0 if 0 in scores else math.exp(sum(map(math.log,scores))/len(scores)))
(out/'stage.json').write_text(json.dumps(result,indent=2)+'\n')
raise SystemExit(0 if passed else 1)
