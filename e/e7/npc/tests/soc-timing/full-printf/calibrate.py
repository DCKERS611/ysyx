#!/usr/bin/env python3
# 复用相同阈值、独立复测与证据保留，只切换到完整printf程序。
import os,runpy
from pathlib import Path
os.environ['NPC_RTC_SAMPLE_MODE']='full-printf'
runpy.run_path(str(Path(__file__).resolve().parent.parent/'calibrate_wallclock.py'),run_name='__main__')
