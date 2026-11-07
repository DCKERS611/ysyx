"""同步本次CSR/计时发布范围，复用现有同步工具的排除规则。"""
from pathlib import Path
import importlib.util, shutil, json, hashlib, sys
spec=importlib.util.spec_from_file_location('sync','/mnt/e/ysyx/e/e7/tools/sync_wsl_snapshot.py')
sync=importlib.util.module_from_spec(spec);spec.loader.exec_module(sync)
src=sync.SOURCE;dst=sync.DESTINATION
paths=['npc/tests/soc-timing','npc/tests/csr-functional','npc/tests/soc_main.cpp','npc/tests/csr_test.cpp','npc/tests/difftest.cpp','npc/tests/run_cpu_tests.py','npc/tests/Makefile.mk','npc/csrc/sim.cpp','npc/csrc/cpu_view.h','npc/vsrc','minirvEMU/emu.cpp','minirvEMU/emu.h','abstract-machine/am/src/riscv/npc/timer.c','abstract-machine/scripts/platform/npc.mk','abstract-machine/scripts/minirv-ysyxsoc.mk','abstract-machine/klib/Makefile','abstract-machine/klib/build/klib-minirv-npc.a','abstract-machine/klib/build/klib-minirv-ysyxsoc.a','ecc/npc-e7/ecc.toml']
paths += ['npc/build/verification/'+p for p in ['current-csr-k12-20261105','timer-config-probe-20261106','rtc-wallclock-calibration-20261105','rtc-wallclock-retest-20261106','rtc-wallclock-fixed-20261106','rtc-wallclock-validated-20261106','rtc-wallclock-compact-20261106','final-acceptance-20261106']]
paths += ['ecc/npc-e7/runs/'+p for p in ['csr-read-suppress-balance-400mhz-20261105','csr-read-suppress-balance-800mhz-20261105']]
paths += ['abstract-machine/.gitignore','am-kernels/tests/am-tests/src/tests/rtc.c',
          'ysyxSoC/perip/gpio/mygpio_top_apb.v','npc/tests/gpio_apb_test.cpp',
          'npc/tests/gpio-functional','npc/build/gpio-tests/evidence','npc/build/gpio-tests/gpio-apb.fst',
          'npc/tests/stage-b-reproduction','npc/tools/run_reconstructed_b.py',
          'npc/tools/check_stage_b_wave.py','npc/tools/run_soc_archbench.py']
paths += [p.relative_to(src).as_posix() for p in sorted((src/'npc/build/verification').glob('rtc-fullprintf-*'))]
paths += [p.relative_to(src).as_posix() for p in sorted((src/'npc/build/verification').glob('full-soc-archbench-test-*'))]
paths += ['npc/build/verification/full-soc-archbench-20261106-180125']
paths += ['npc/build/verification/final-extended-20261106','npc/tools/verify_rtc_wallclock.py']
# 先同步已结束部分，不访问新一轮rtc-k12-final目录。
if '--completed-only' in sys.argv:
    paths=[p for p in paths if not p.startswith('npc/build/verification/rtc-fullprintf-')]
paths += ['npc/build/verification/rtc-k12-final-20261107','npc/build/verification/rtc-k12-cache-phase-20261107']
files=[];excluded=[]
for rel in paths:
    base=src/rel
    for p in ([base] if base.is_file() else sorted(base.rglob('*'))):
        if not p.is_file():continue
        r=p.relative_to(src)
        if any(x in sync.SKIP_DIRECTORIES or x.startswith('obj_dir') for x in r.parts):continue
        if r.parts[:2]==('npc','tests') and 'build' in r.parts:
            excluded.append({'path':str(r),'reason':'test compilation cache; frozen acceptance inputs retained in results directories'});continue
        if p.name.endswith('.lock'):continue
        if r.as_posix()=='npc/tests/stage-b-reproduction/hello.vcd':
            excluded.append({'path':str(r),'reason':'derived 105MiB VCD; preserve original compact FST and checker output instead'});continue
        reason=sync.exclusion(p)
        if reason:excluded.append({'path':str(r),'reason':reason});continue
        if p.is_symlink():raise RuntimeError('unexpected symlink '+str(r))
        target=dst/r;target.parent.mkdir(parents=True,exist_ok=True)
        shutil.copy2(p,target)
        sha=sync.digest(p)
        assert sync.digest(target)==sha
        files.append({'path':r.as_posix(),'sha256':sha,'size':p.stat().st_size})
report={'scope':paths,'files':files,'excluded':excluded,'mismatches':0,'source_preserved':True}
report_path=dst/'verification/2026-11-07/completed-sync/sync-manifest.json' if '--completed-only' in sys.argv else dst/'verification/2026-11-06/final-acceptance/sync-manifest.json'
report_path.parent.mkdir(parents=True,exist_ok=True)
report_path.write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
print('Verified',len(files),'files; mismatches 0')
