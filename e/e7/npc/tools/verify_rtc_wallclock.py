#!/usr/bin/env python3
"""从原始镜像、主机时间戳和两次独立结果重新核验两档完整RTC。"""
import argparse,hashlib,json,re
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('--k1',type=Path,required=True);p.add_argument('--k12',type=Path,required=True);p.add_argument('--output',type=Path);args=p.parse_args()
results=[]
for k,directory in [(1,args.k1),(12,args.k12)]:
    state=json.loads((directory/f'k{k}.stage.json').read_text())
    assert state['stage']=='passed',(k,state['stage'])
    history=json.loads((directory/f'k{k}.history.json').read_text())[-2:]
    assert len(history)==2 and history[0]['trial']!=history[1]['trial']
    assert history[0]['q16']==history[1]['q16']
    assert history[0]['image_sha256']==history[1]['image_sha256']
    verified=[]
    for run in history:
        prefix=f"rtc-wall-q{run['q16']}-trial{run['trial']}-k{k}"
        image=directory/(prefix+'.bin')
        assert hashlib.sha256(image.read_bytes()).hexdigest()==run['image_sha256']
        raw=json.loads((directory/(prefix+'.result.json')).read_text())
        stdout=(directory/(prefix+'.stdout.log')).read_text()
        assert raw['exit_code']==0 and 'HIT GOOD TRAP' in stdout and 'BAD TRAP' not in stdout
        assert f"TIMER_CONFIG_OK CPU_MHZ={25*k} Q16={run['q16']}" in stdout
        assert 'RTC_FORMAT_PROBE -2147483648 4294967295 07 deadbeef ok Z %' in stdout.splitlines()
        ticks=raw['ticks'];assert [x['sec'] for x in ticks]==list(range(1,12))
        for tick in ticks:
            assert re.fullmatch(r'1900-0-0 00:00:00 GMT \(\d+ seconds?\)\.',tick['line'])
        intervals=[(b['host_monotonic_ns']-a['host_monotonic_ns'])/1e9 for a,b in zip(ticks,ticks[1:])]
        assert len(intervals)==10 and all(x>0 for x in intervals)
        assert intervals==raw['intervals_seconds']
        mean=sum(intervals)/10
        assert abs(mean-1)<=0.05 and abs(mean-run['mean_interval_seconds'])<1e-12
        late=int(re.search(r'RTC_DIAG max_late_us=(\d+)',stdout)[1]);assert late<1000000
        verified.append({'trial':run['trial'],'mean_seconds':mean,'interval_range_seconds':[min(intervals),max(intervals)],'max_late_us':late})
    results.append({'k':k,'q16':history[-1]['q16'],'image_sha256':history[-1]['image_sha256'],'source_directory':str(directory),'runs':verified})
report={'stage':'complete','criterion':'two independent identical-image runs per ratio; mean 1s +/-5%; guest lateness <1s; full RTC text','results':results}
if args.output:
    args.output.mkdir(parents=True,exist_ok=True)
    target=args.output/'stage.json'
    if target.exists():assert json.loads(target.read_text())==report,'refuse to overwrite a different report'
    target.write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
