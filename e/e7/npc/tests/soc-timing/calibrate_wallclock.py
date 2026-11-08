#!/usr/bin/env python3
"""用主机单调时间戳校准独立 RTC 演示，不改变性能测试默认计时。"""
from pathlib import Path
import fcntl
import hashlib
import json
import os
import re
import shutil
import statistics
import subprocess
import sys
import time

root = Path('/home/ysyx/ysyx-workbench')
source = root / 'npc/tests/soc-timing'
full_printf = os.environ.get('NPC_RTC_SAMPLE_MODE') == 'full-printf'
if full_printf:
    source = source / 'full-printf'
out = Path(os.environ.get(
    'NPC_RTC_CALIBRATION_OUTPUT_DIR',
    str(root / 'npc/build/verification' /
        time.strftime(('rtc-fullprintf-' if full_printf else 'rtc-wallclock-') + '%Y%m%d-%H%M%S')),
))
out.mkdir(parents=True, exist_ok=True)
if (out / 'stage.json').exists():
    raise RuntimeError(f'result directory already used: {out}; choose a new directory')

def parse_run_count(raw_value):
    run_count = int(raw_value)
    if not 2 <= run_count <= 5:
        raise ValueError('NPC_RTC_RUNS must be between 2 and 5')
    return run_count


required_runs = parse_run_count(os.environ.get('NPC_RTC_RUNS', '2'))
max_trials = int(os.environ.get('NPC_RTC_MAX_TRIALS', '4'))
if max_trials < required_runs:
    raise ValueError('NPC_RTC_MAX_TRIALS must be at least NPC_RTC_RUNS')

print(f'Results: {out}', flush=True)
shutil.copy2(__file__, out / 'executed-calibrate_wallclock.py')
shutil.copy2(root / 'npc/tests/soc-timing/measure_host.py', out / 'executed-measure_host.py')
simulator = Path(os.environ.get(
    'NPC_RTC_SIMULATOR',
    str(root / 'npc/build/soc/sim'),
))
(out / 'launch.json').write_text(json.dumps({
    'sample_mode': 'full-printf' if full_printf else 'compact-uptime',
    'requested_same_q_runs': required_runs,
    'max_trials': max_trials,
    'simulator': str(simulator),
    'simulator_sha256': hashlib.sha256(simulator.read_bytes()).hexdigest()
    if simulator.exists() else None,
    'cpu_affinity': sorted(os.sched_getaffinity(0)),
}, indent=2) + '\n')


def save(path, value):
    temporary = path.with_suffix('.tmp')
    temporary.write_text(json.dumps(value, indent=2) + '\n')
    temporary.replace(path)


def summarize_run_means(runs):
    means = [run['mean_interval_seconds'] for run in runs]
    return {
        'count': len(means),
        'min_mean_seconds': min(means),
        'max_mean_seconds': max(means),
        'mean_of_run_means_seconds': statistics.mean(means),
        'population_stddev_seconds': statistics.pstdev(means),
        'range_seconds': max(means) - min(means),
    }


def calibrate(k, frequency_mhz):
    coefficient = int(os.environ.get(
        f'NPC_RTC_INITIAL_Q16_K{k}',
        str({1: 18325, 12: 7754}[k]),
    ))
    consecutive_passes = 0
    history = []

    for trial in range(1, max_trials + 1):
        status = {
            'stage': 'building',
            'k': k,
            'frequency_mhz': frequency_mhz,
            'q16': coefficient,
            'trial': trial,
            'required_same_q_runs': required_runs,
        }
        save(out / f'k{k}.stage.json', status)
        name = f'rtc-wall-q{coefficient}-trial{trial}'
        with (out / 'build.lock').open('w') as build_lock:
            fcntl.flock(build_lock, fcntl.LOCK_EX)
            env = dict(os.environ, AM_HOME=str(root / 'abstract-machine'))
            with (out / f'{name}-k{k}.build.log').open('w') as log:
                build = subprocess.run(
                    [
                        'make', '-s', 'ARCH=minirv-ysyxsoc',
                        f'NPC_CPU_FREQ_MHZ={frequency_mhz}',
                        f'NPC_TIMER_CALIBRATION_Q16={coefficient}',
                        'insert-arg',
                    ],
                    cwd=source,
                    env=env,
                    stdout=log,
                    stderr=subprocess.STDOUT,
                )
            if build.returncode:
                raise RuntimeError(f'k{k} build failed')

            timer_stamp = root / 'abstract-machine/am/build/minirv-ysyxsoc/.npc-timer-config'
            if (
                not timer_stamp.exists()
                or timer_stamp.read_text().strip() != f'freq={frequency_mhz} q16={coefficient}'
            ):
                raise RuntimeError(
                    f'k{k}: library configuration stamp missing or stale; do not run loader'
                )
            timer_assembly = (
                root / 'abstract-machine/am/build/minirv-ysyxsoc/src/riscv/npc/timer.S'
            ).read_text()
            if '__udivdi3' in timer_assembly:
                raise RuntimeError(f'k{k}: physical division branch retained; Q16 not compiled')

            binary_name = (
                'rtc-full-printf-minirv-ysyxsoc.bin'
                if full_printf else 'soc-uptime-minirv-ysyxsoc.bin'
            )
            image = out / f'{name}-k{k}.bin'
            shutil.copy2(source / 'build' / binary_name, image)
            status['image_sha256'] = hashlib.sha256(image.read_bytes()).hexdigest()
            status['compiled_timer_config'] = timer_stamp.read_text().strip()

        status['stage'] = 'sampling'
        save(out / f'k{k}.stage.json', status)
        measurement = subprocess.run(
            [
                sys.executable,
                str(root / 'npc/tests/soc-timing/measure_host.py'),
                name,
                str(k),
            ],
            env=dict(os.environ, NPC_MEASUREMENT_OUTPUT_DIR=str(out)),
        )
        result = json.loads((out / f'{name}-k{k}.result.json').read_text())
        stdout = (out / f'{name}-k{k}.stdout.log').read_text(errors='replace')
        config_ok = (
            f'TIMER_CONFIG_OK CPU_MHZ={frequency_mhz} Q16={coefficient}' in stdout
        )
        format_ok = (
            not full_printf
            or 'RTC_FORMAT_PROBE -2147483648 4294967295 07 deadbeef ok Z %'
            in stdout.splitlines()
        )
        ticks = result['ticks']
        if (
            measurement.returncode
            or len(ticks) != 11
            or result['per_interval_stats']['count'] != 10
            or not config_ok
            or not format_ok
            or [tick['sec'] for tick in ticks] != list(range(1, 12))
        ):
            status.update(
                stage='failed',
                exit_code=measurement.returncode,
                samples=len(ticks),
                reason='guest output, sample count, timer label or format probe mismatch',
            )
            save(out / f'k{k}.stage.json', status)
            raise RuntimeError(
                f'k{k}: {status["reason"]}; exit={measurement.returncode}, samples={len(ticks)}'
            )

        diagnostic = re.search(r'RTC_DIAG max_late_us=(\d+)', stdout)
        if diagnostic is None:
            raise RuntimeError('missing guest deadline diagnostic')
        late_us = int(diagnostic[1])
        mean = result['per_interval_stats']['mean_seconds']
        status.update(
            stage='measured',
            mean_interval_seconds=mean,
            max_late_us=late_us,
            intervals_seconds=result['intervals_seconds'],
            interval_observations=result['interval_observations'],
            per_interval_stats=result['per_interval_stats'],
            per_interval_threshold=None,
            diagnostic_scope=result['diagnostic_scope'],
        )
        history.append(dict(status))
        save(out / f'k{k}.history.json', history)

        if late_us >= 1_000_000:
            status.update(
                stage='needs_review',
                reason='guest deadline overrun >=1000000us; coefficient not increased',
                history=history,
            )
            save(out / f'k{k}.stage.json', status)
            return status

        if abs(mean - 1) <= 0.05:
            if consecutive_passes and (
                history[-2]['image_sha256'] != status['image_sha256']
                or history[-2]['q16'] != coefficient
            ):
                raise RuntimeError('same-Q confirmation image or coefficient changed')
            consecutive_passes += 1
            if consecutive_passes >= required_runs:
                selected_runs = history[-required_runs:]
                status.update(
                    stage='passed',
                    criterion=(
                        f'{required_runs} same-Q identical-image runs: each 10-interval '
                        'mean within 5% of one host second; guest lateness <1000000us'
                    ),
                    runs=selected_runs,
                    same_q_run_stats=summarize_run_means(selected_runs),
                    history=history,
                )
                save(out / f'k{k}.stage.json', status)
                return status
            # 同一 Q 下另起进程复测；逐间隔统计只作记录，不设额外门槛。
            continue

        consecutive_passes = 0
        if os.environ.get('NPC_RTC_FIXED_Q16') != '1':
            coefficient = max(1, round(coefficient * mean))

    status.update(
        stage='needs_review',
        reason='trial limit reached without required same-Q passing runs',
        history=history,
    )
    save(out / f'k{k}.stage.json', status)
    return status


save(out / 'stage.json', {
    'stage': 'running',
    'purpose': 'RTC host-wallclock demonstration only',
    'started_epoch': time.time(),
})
try:
    # 两档串行，避免同时运行仿真器相互改变主机速度。
    with (source / 'build/.wallclock.lock').open('w') as run_lock:
        fcntl.flock(run_lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        ratios = [int(value) for value in os.environ.get('NPC_RTC_RATIOS', '1,12').split(',')]
        if (
            not ratios
            or len(set(ratios)) != len(ratios)
            or any(value not in (1, 12) for value in ratios)
        ):
            raise RuntimeError('NPC_RTC_RATIOS must select 1 and/or 12 without duplicates')
        results = [calibrate(k, 25 * k) for k in ratios]

    save(out / 'summary.json', results)
    save(out / 'stage.json', {
        'stage': 'complete' if all(item['stage'] == 'passed' for item in results)
        else 'needs_review',
        'ended_epoch': time.time(),
        'selected_ratios': ratios,
        'results': results,
    })
    if not all(item['stage'] == 'passed' for item in results):
        sys.exit(2)
except Exception as error:
    save(out / 'stage.json', {
        'stage': 'failed',
        'error': str(error),
        'ended_epoch': time.time(),
    })
    raise
