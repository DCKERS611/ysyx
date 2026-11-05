from pathlib import Path
import subprocess,json,re,time,sys
root=Path('/home/ysyx/ysyx-workbench')
baseline=root/'npc/build/verification/testlib-baseline-20261101'
commands=[
('lint','npc','make -f Makefile.cpptest lint'),
('test-library','npc','make -f Makefile.cpptest test-library'),
('test-all','npc','make -f Makefile.cpptest test-all'),
('test-fixed','npc','make -f Makefile.cpptest test-fixed'),
('difftest','npc','make -f Makefile.diff difftest'),
('difftest-fixed','npc','make -f Makefile.diff difftest-fixed'),
('test-acceptance','npc','make -f Makefile.cpptest test-acceptance'),
('check-waves','npc','make -f Makefile.cpptest check-waves'),
('test_mkprog','npc','python3 -m unittest discover -s tests -p test_mkprog.py -v'),
('dummy-run','am-kernels/tests/cpu-tests','make ARCH=minirv-npc ALL=dummy run'),
('dummy-diff','am-kernels/tests/cpu-tests','make ARCH=minirv-npc ALL=dummy run DIFFTEST=1'),
('hello-run','am-kernels/kernels/hello','make ARCH=minirv-npc run'),
('hello-diff','am-kernels/kernels/hello','make ARCH=minirv-npc run DIFFTEST=1'),
('cpu-tests-diff','am-kernels/tests/cpu-tests','make ARCH=minirv-npc run DIFFTEST=1'),
('riscv-tests-i-diff','riscv-tests','make ARCH=minirv-npc run TEST_ISA=i DIFFTEST=1'),
('soc-build','npc','make -f Makefile.soc build'),
('difftest-small','npc','make -f Makefile.diff difftest-small')]
def clean(s): return re.sub(r'\x1b\[[0-9;]*m','',s)
def cases(s,is_diff):
 out={}
 for line in s.splitlines():
  m=re.match(r'\[ PASS \] (\S+): (.*)',line)
  if not m: continue
  name,body=m.groups()
  if is_diff:
   old=re.search(r'PASS: (\d+) \((\d+) steps x 17\); expectations PASS: (\d+) checks',body)
   new=re.search(r'core=(\d+) steps=(\d+) checks=(\d+) memory=(\d+)',body)
   if old: out[name]=tuple(map(int,old.groups()))
   elif new:
    assert int(new[4])==33554432,line
    out[name]=tuple(map(int,new.groups()[:3]))
   else: raise AssertionError(line)
  else:
   m=re.search(r'PASS: (\d+) checks|checks=(\d+)',body)
   assert m,line
   out[name]=int(m[1] or m[2])
 return out
folder,mode=sys.argv[1:3]
log=root/'npc/build/verification/testlib-refactor-20261101'/folder
log.mkdir(parents=True,exist_ok=True)
if mode=='rename': chosen={'lint','test-library','test-all','difftest-small','test_mkprog','dummy-run','dummy-diff','hello-run'}
elif mode=='core': chosen={x[0] for x in commands[:13]}
elif mode=='result': chosen={x[0] for x in commands[:15]}
elif mode=='final': chosen={x[0] for x in commands[:16]}
else: raise ValueError(mode)
records=[]
aggregate_blocks = {}
if mode == 'final':
 print('START regress aggregate', flush=True)
 t = time.time()
 with (log/'regress.log').open('w') as f:
  aggregate = subprocess.run(['bash','-ic','make -f Makefile.cpptest regress'],
                             cwd=root/'npc',stdout=f,stderr=subprocess.STDOUT)
 aggregate_text = (log/'regress.log').read_text(errors='replace')
 if aggregate.returncode:
  print('STOP regress\n'+aggregate_text[-8000:],flush=True)
  raise SystemExit(aggregate.returncode)
 markers = list(re.finditer(r'^make -f Makefile[.](?:cpptest|diff) (lint|test-library|test-all|test-fixed|difftest|difftest-fixed|test-acceptance|check-waves)\s*$',aggregate_text,re.M))
 assert len(markers)==8,[(m[1],m.start()) for m in markers]
 for i,m in enumerate(markers):
  aggregate_blocks[m[1]] = aggregate_text[m.end():markers[i+1].start() if i+1<len(markers) else len(aggregate_text)]
 print('END regress aggregate seconds',round(time.time()-t,2),flush=True)
for name,cwd,cmd in commands:
 if name not in chosen: continue
 print('START',name,flush=True); t=time.time()
 if name in aggregate_blocks:
  (log/(name+'.log')).write_text(aggregate_blocks[name])
  p=subprocess.CompletedProcess(cmd,0)
 else:
  with (log/(name+'.log')).open('w') as f:
   p=subprocess.run(['bash','-ic',cmd],cwd=root/cwd,stdout=f,stderr=subprocess.STDOUT)
 text=clean((log/(name+'.log')).read_text(errors='replace'))
 ok=p.returncode==0
 if name=='test-library': ok &= 'PASS: 10 checks' in text
 if name in ['test-all','test-fixed','difftest','difftest-fixed']:
  is_diff=name.startswith('difftest')
  current=cases(text,is_diff)
  expected=cases(clean((baseline/(name+'.log')).read_text()),is_diff)
  ok &= current==expected
 if name=='difftest-small': ok &= 'difftest: 1/1 programs passed' in text
 if name=='test-acceptance': ok &= len(re.findall(r'^\[ PASS \]',text,re.M))==9
 if name=='check-waves': ok &= 'Wave inspection: PASS add/lw/sb' in text
 required={'dummy-run':'instructions=17 cycles=172','dummy-diff':'PASS: 289 (17 steps x 17)','hello-run':'instructions=30467 cycles=546583 IPC=0.055741','hello-diff':'PASS: 517939 (30467 steps x 17)'}
 if name in required: ok &= required[name] in text
 if name in ['cpu-tests-diff','riscv-tests-i-diff']:
  patt=r'^\[\s*([^]\s]+)\s*\]\s+(PASS|\*\*\*FAIL\*\*\*)\s*$'
  current=re.findall(patt,text,re.M)
  expected=re.findall(patt,clean((baseline/(name+'.log')).read_text()),re.M)
  ok &= len(current)==len(expected) and dict(current)==dict(expected)
 rec=dict(name=name,command=cmd,returncode=p.returncode,pass_gate=bool(ok),seconds=round(time.time()-t,2))
 records.append(rec); (log/'execution-summary.json').write_text(json.dumps(records,indent=2))
 print('END',name,'exit',p.returncode,'gate',bool(ok),'seconds',rec['seconds'],flush=True)
 if not ok:
  print('STOP\n'+text[-8000:],flush=True); raise SystemExit(1)
print('VALIDATION PASS',mode,flush=True)
