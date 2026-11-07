#!/usr/bin/env python3
"""主机单调时钟测量RTC输出或benchmark耗时，不修改目标机器时间。"""
from pathlib import Path
import subprocess,os,time,re,json,sys
root=Path('/home/ysyx/ysyx-workbench/npc')
out=Path(os.environ.get('NPC_MEASUREMENT_OUTPUT_DIR', str(root/'build/verification/current-csr-k12-20261105')))
out.mkdir(parents=True,exist_ok=True)
name=sys.argv[1]; ratio=int(sys.argv[2]); stem=f'{name}-k{ratio}'
start=time.monotonic_ns(); ticks=[]
with (out/(stem+'.stdout.log')).open('w') as stdout, (out/(stem+'.stderr.log')).open('w') as stderr:
 p=subprocess.Popen(['stdbuf','-oL','-eL',str(root/'build/soc/sim'),str(out/(stem+'.bin'))],stdout=subprocess.PIPE,stderr=stderr,text=True,bufsize=1,env=dict(os.environ,NPC_CPU_CLOCK_RATIO=str(ratio)))
 for line in p.stdout:
  now=time.monotonic_ns();stdout.write(line);stdout.flush()
  # 兼容旧长行；新测试用四字节T01换行降低UART观测开销。
  tick_match=re.fullmatch(r'T(\d{2})\s*',line)
  if line.startswith('RTC_TICK') or tick_match:
   sec=int(tick_match[1] if tick_match else re.search(r'sec=(\d+)',line)[1]);ticks.append({'sec':sec,'host_monotonic_ns':now,'line':line.strip()})
   (out/(stem+'.timestamps.json')).write_text(json.dumps(ticks,indent=2)+'\n')
 code=p.wait()
intervals=[(b['host_monotonic_ns']-a['host_monotonic_ns'])/1e9 for a,b in zip(ticks,ticks[1:])]
result={'exit_code':code,'host_elapsed_seconds':(time.monotonic_ns()-start)/1e9,'ticks':ticks,'intervals_seconds':intervals,'mean_interval_seconds':sum(intervals)/len(intervals) if intervals else None}
(out/(stem+'.result.json')).write_text(json.dumps(result,indent=2)+'\n')
sys.exit(code)
