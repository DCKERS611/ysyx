#!/usr/bin/env python3
"""用主机单调时间戳校准单独RTC演示，不改变性能测试默认计时。"""
from pathlib import Path
import subprocess,sys,json,time,os,fcntl,shutil,concurrent.futures,hashlib
root=Path('/home/ysyx/ysyx-workbench')
source=root/'npc/tests/soc-timing'
previous=root/'npc/build/verification/current-csr-k12-20261105'
out=Path(os.environ.get('NPC_RTC_CALIBRATION_OUTPUT_DIR',str(root/'npc/build/verification/rtc-wallclock-calibration-20261105')))
out.mkdir(parents=True,exist_ok=True)
def save(path,value):
 tmp=path.with_suffix('.tmp');tmp.write_text(json.dumps(value,indent=2)+'\n');tmp.replace(path)
def calibrate(k,freq):
 baseline=json.loads((previous/f'rtc-timestamps-k{k}.result.json').read_text())['mean_interval_seconds']
 coefficient=round(baseline*65536/freq)
 history=[]
 for trial in range(1,int(os.environ.get("NPC_RTC_MAX_TRIALS","4"))+1):
  status={'stage':'building','k':k,'frequency_mhz':freq,'q16':coefficient,'trial':trial}
  save(out/f'k{k}.stage.json',status)
  name=f'rtc-wall-q{coefficient}-trial{trial}'
  with (out/'build.lock').open('w') as lock:
   fcntl.flock(lock,fcntl.LOCK_EX)
   env=dict(os.environ,AM_HOME=str(root/'abstract-machine'))
   with (out/f'{name}-k{k}.build.log').open('w') as log:
    z=subprocess.run(['make','-s','ARCH=minirv-ysyxsoc',f'NPC_CPU_FREQ_MHZ={freq}',f'NPC_TIMER_CALIBRATION_Q16={coefficient}','insert-arg'],cwd=source,env=env,stdout=log,stderr=subprocess.STDOUT)
   if z.returncode:raise RuntimeError(f'k{k} build failed')
   timer_stamp=root/'abstract-machine/am/build/minirv-ysyxsoc/.npc-timer-config'
   if not timer_stamp.exists() or timer_stamp.read_text().strip()!=f'freq={freq} q16={coefficient}':
    raise RuntimeError(f'k{k}: library configuration stamp missing or stale; do not run loader')
   timer_asm=(root/'abstract-machine/am/build/minirv-ysyxsoc/src/riscv/npc/timer.S').read_text()
   if '__udivdi3' in timer_asm:
    raise RuntimeError(f'k{k}: physical division branch retained; Q16 not compiled')
   shutil.copy2(source/'build/soc-uptime-minirv-ysyxsoc.bin',out/f'{name}-k{k}.bin')
   status['image_sha256']=hashlib.sha256((out/f'{name}-k{k}.bin').read_bytes()).hexdigest()
   status['compiled_timer_config']=timer_stamp.read_text().strip()
  status['stage']='sampling';save(out/f'k{k}.stage.json',status)
  z=subprocess.run([sys.executable,str(source/'measure_host.py'),name,str(k)],env=dict(os.environ,NPC_MEASUREMENT_OUTPUT_DIR=str(out)))
  result=json.loads((out/f'{name}-k{k}.result.json').read_text())
  stdout=(out/f'{name}-k{k}.stdout.log').read_text(errors='replace')
  config_ok=f'TIMER_CONFIG_OK CPU_MHZ={freq} Q16={coefficient}' in stdout
  if z.returncode or len(result['ticks'])!=11 or not config_ok or any(f'CPU_MHZ={freq}' not in x['line'] or f'Q16={coefficient}' not in x['line'] for x in result['ticks']):
   status.update(stage='failed',exit_code=z.returncode,samples=len(result['ticks']),reason='guest program failed' if z.returncode else 'sample count or label mismatch')
   save(out/f'k{k}.stage.json',status)
   raise RuntimeError(f'k{k}: {status["reason"]}; exit={z.returncode}, samples={len(result["ticks"])}')
  mean=result['mean_interval_seconds'];status.update(stage='measured',mean_interval_seconds=mean)
  history.append(dict(status));save(out/f'k{k}.history.json',history)
  if abs(mean-1)<=0.05:
   status.update(stage='passed',criterion='10-interval mean within 5% of one host second',history=history)
   save(out/f'k{k}.stage.json',status);return status
  coefficient=max(1,round(coefficient*mean))
 status.update(stage='needs_review',history=history);save(out/f'k{k}.stage.json',status);return status
save(out/'stage.json',{'stage':'running','purpose':'RTC host-wallclock demonstration only','started_epoch':time.time()})
try:
 with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:
  futures=[pool.submit(calibrate,k,freq) for k,freq in [(1,25),(12,300)]]
  results=[f.result() for f in futures]
 save(out/'summary.json',results)
 save(out/'stage.json',{'stage':'complete' if all(x['stage']=='passed' for x in results) else 'needs_review','ended_epoch':time.time(),'results':results})
except Exception as error:
 save(out/'stage.json',{'stage':'failed','error':str(error),'ended_epoch':time.time()})
 raise
