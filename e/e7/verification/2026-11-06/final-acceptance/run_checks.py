"""在WSL串行运行发布前检查；原始日志和实际退出码单独保存。"""
from pathlib import Path
import subprocess, os, json, hashlib, shutil, time
root = Path('/home/ysyx/ysyx-workbench')
out = root/'npc/build/verification/final-acceptance-20261106'
out.mkdir(parents=True, exist_ok=True)
rows = []
def run(name, args, cwd, extra=None):
    env = dict(os.environ, AM_HOME=str(root/'abstract-machine'))
    env.pop('NPC_TIMER_CALIBRATION_Q16', None)
    env.pop('NPC_CPU_CLOCK_RATIO', None)
    env.update(extra or {})
    start=time.time()
    with (out/(name+'.log')).open('w') as log:
        p=subprocess.run(args,cwd=cwd,env=env,stdout=log,stderr=subprocess.STDOUT)
    rows.append(dict(name=name,command=args,exit_code=p.returncode,seconds=time.time()-start))
    (out/'summary.json').write_text(json.dumps(rows,indent=2)+'\n')
    print(name,p.returncode,flush=True)
    if p.returncode: raise SystemExit(p.returncode)
npc=root/'npc'
run('regress',['make','-f','Makefile.cpptest','regress'],npc)
run('csr-diff',['make','-f','Makefile.diff','difftest-csr','difftest-csr-fixed'],npc)
run('soc-build',['make','-f','Makefile.soc','build','NVBOARD=0'],npc)
hello=root/'am-kernels/kernels/hello'
for k,freq in [(1,25),(12,300)]:
    run(f'hello-build-k{k}',['make','ARCH=minirv-ysyxsoc',f'NPC_CPU_FREQ_MHZ={freq}','NPC_TIMER_CALIBRATION_Q16=0','mainargs=E7_FINAL','insert-arg'],hello)
    frozen=out/f'hello-k{k}.bin'
    shutil.copy2(hello/'build/hello-minirv-ysyxsoc.bin',frozen)
    run(f'hello-run-k{k}',[str(npc/'build/soc/sim'),str(frozen)],npc,{'NPC_CPU_CLOCK_RATIO':str(k)})
    log=(out/f'hello-run-k{k}.log').read_text()
    assert 'E7_FINAL' in log and 'Hello' in log and 'GOOD TRAP' in log
(out/'stage.json').write_text(json.dumps({'stage':'complete','checks':rows,'images':{p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in out.glob('*.bin')}},indent=2)+'\n')
