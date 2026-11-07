#!/usr/bin/env python3
"""运行隔离重建的阶段b；全部输入冻结并验证每条指令恰好两拍。"""
from pathlib import Path
import subprocess,concurrent.futures,json,time,shutil,hashlib,re,math
root=Path('/home/ysyx/ysyx-workbench');test=root/'npc/tests/stage-b-reproduction'
out=test/'runs'/time.strftime('%Y%m%d-%H%M%S');out.mkdir(parents=True)
names=sorted(x.name for x in (root/'archbench/bench').iterdir() if x.is_dir() and x.name!='000.hello')
config={'source_commit':'9fb61ad','kind':'reconstructed stage b; not recovered historical measurement','frequency_mhz':404,'dataset':'train','images':{}}
rows=[]
for name in names:
    # 优先使用已归档的精确train输入，避免周末重跑时被其他构建覆盖。
    frozen=test/'results'/(name+'.bin')
    inputs=[frozen] if frozen.exists() else list((root/'archbench/bench'/name/'build').glob('*-minirv-npc.bin'))
    if len(inputs)!=1:raise RuntimeError('missing historical input '+name)
    if frozen.exists():
        expected=json.loads((test/'results/config.json').read_text())['images'][name]['sha256']
        assert hashlib.sha256(frozen.read_bytes()).hexdigest()==expected,('input hash mismatch',name)
    dest=out/(name+'.bin');shutil.copy2(inputs[0],dest);config['images'][name]={'sha256':hashlib.sha256(dest.read_bytes()).hexdigest(),'input':str(inputs[0])}
(out/'config.json').write_text(json.dumps(config,indent=2)+'\n')
(out/'stage.json').write_text('{"stage":"running"}\n')
def run(name):
    start=time.monotonic()
    with (out/(name+'.log')).open('w') as log:
        z=subprocess.run([str(test/'npc/build/cpp/sim'),str(out/(name+'.bin'))],stdout=log,stderr=subprocess.STDOUT)
    text=(out/(name+'.log')).read_text(errors='replace');score=re.search(r'(\d+) Marks',text);cycles=re.search(r'instructions=(\d+) cycles=(\d+) IPC=',text)
    two=bool(cycles and int(cycles[2])==2*int(cycles[1]))
    clean=re.sub(r'\x1b\[[0-9;]*m','',text)
    ok=z.returncode==0 and re.search(r'\[RESULT\]\s+PASS\b',clean) is not None and 'GOOD TRAP' in text and score and two
    return {'name':name,'stage':'passed' if ok else 'failed','exit_code':z.returncode,'marks':int(score[1]) if score else None,'instructions':int(cycles[1]) if cycles else None,'cycles':int(cycles[2]) if cycles else None,'two_cycles_per_instruction':two,'wall_seconds':time.monotonic()-start}
with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:
    futures=[pool.submit(run,name) for name in names]
    for future in concurrent.futures.as_completed(futures):
        row=future.result()
        rows.append(row);(out/'summary.json').write_text(json.dumps(rows,indent=2)+'\n');print(row,flush=True)
ok=all(r['stage']=='passed' for r in rows)
scores=[r['marks'] for r in rows if r['stage']=='passed']
result={'stage':'complete' if ok else 'needs_review','passed':len(scores),'total':len(names),'results':rows}
if ok:result.update(arithmetic_mean=sum(scores)/len(scores),geometric_mean=0 if 0 in scores else math.exp(sum(map(math.log,scores))/len(scores)))
(out/'stage.json').write_text(json.dumps(result,indent=2)+'\n')
raise SystemExit(0 if ok else 1)
