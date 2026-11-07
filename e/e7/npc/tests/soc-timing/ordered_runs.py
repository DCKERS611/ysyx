#!/usr/bin/env python3
"""先收集两档RTC墙钟时间戳，再在冻结的当前RTL镜像上重跑两档blockchain。"""
from pathlib import Path
import subprocess,sys,json,time
root=Path('/home/ysyx/ysyx-workbench/npc');out=root/'build/verification/current-csr-k12-20261105';worker=root/'tests/soc-timing/measure_host.py'
for stage,name in [('rtc-host-timestamps','rtc-timestamps'),('blockchain-current-rtl','blockchain')]:
 (out/'stage.json').write_text(json.dumps({'stage':stage,'started_epoch':time.time()})+'\n')
 jobs=[subprocess.Popen([sys.executable,str(worker),name,str(k)]) for k in [1,12]]
 codes=[p.wait() for p in jobs]
 if any(codes):
  (out/'stage.json').write_text(json.dumps({'stage':stage,'failed':codes})+'\n');sys.exit(1)
(out/'stage.json').write_text(json.dumps({'stage':'complete','ended_epoch':time.time()})+'\n')
