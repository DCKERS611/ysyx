#!/usr/bin/env python3
"""以主机单调时钟记录 RTC 输出到达时间，不修改目标机器时间。"""
from pathlib import Path
import hashlib
import json
import os
import re
import statistics
import subprocess
import sys
import time

root = Path('/home/ysyx/ysyx-workbench/npc')
out = Path(os.environ.get(
    'NPC_MEASUREMENT_OUTPUT_DIR',
    str(root / 'build/verification/current-csr-k12-20261105'),
))


def summarize_intervals(ticks):
    """从原始输出时间戳生成逐间隔观测与描述统计，不设置单间隔门槛。"""
    observations = []
    for index, (before, after) in enumerate(zip(ticks, ticks[1:]), start=1):
        seconds = (after['host_monotonic_ns'] - before['host_monotonic_ns']) / 1e9
        observations.append({
            'index': index,
            'from_sec': before['sec'],
            'to_sec': after['sec'],
            'seconds': seconds,
            'deviation_from_1s_seconds': seconds - 1.0,
        })

    values = [item['seconds'] for item in observations]
    stats = {
        'count': len(values),
        'min_seconds': min(values) if values else None,
        'max_seconds': max(values) if values else None,
        'mean_seconds': statistics.mean(values) if values else None,
        'population_stddev_seconds': statistics.pstdev(values) if values else None,
        'range_seconds': max(values) - min(values) if values else None,
        'mean_offset_from_1s_seconds': statistics.mean(values) - 1.0 if values else None,
    }
    for item in observations:
        item['deviation_from_run_mean_seconds'] = (
            item['seconds'] - stats['mean_seconds']
            if stats['mean_seconds'] is not None else None
        )
    return [item['seconds'] for item in observations], observations, stats


def main():
    name = sys.argv[1]
    ratio = int(sys.argv[2])
    stem = f'{name}-k{ratio}'
    image = out / f'{stem}.bin'
    simulator = Path(os.environ.get('NPC_RTC_SIMULATOR', str(root / 'build/soc/sim')))
    start = time.monotonic_ns()
    ticks = []
    out.mkdir(parents=True, exist_ok=True)

    with (
        (out / f'{stem}.stdout.log').open('w') as stdout,
        (out / f'{stem}.stderr.log').open('w') as stderr,
    ):
        process = subprocess.Popen(
            ['stdbuf', '-oL', '-eL', str(simulator), str(image)],
            stdout=subprocess.PIPE,
            stderr=stderr,
            text=True,
            bufsize=1,
            env=dict(os.environ, NPC_CPU_CLOCK_RATIO=str(ratio)),
        )
        for line in process.stdout:
            now = time.monotonic_ns()
            stdout.write(line)
            stdout.flush()
            # 兼容旧紧凑行和完整 RTC 日期行；时间戳取完整输出行到达主机之时。
            tick_match = re.fullmatch(r'T(\d{2})\s*', line)
            full_match = re.fullmatch(
                r'\d+-\d+-\d+ \d+:\d+:\d+ GMT \((\d+) seconds?\)\.\s*',
                line,
            )
            if line.startswith('RTC_TICK') or tick_match or full_match:
                second = int(
                    tick_match[1] if tick_match
                    else full_match[1] if full_match
                    else re.search(r'sec=(\d+)', line)[1]
                )
                ticks.append({
                    'sec': second,
                    'host_monotonic_ns': now,
                    'line': line.strip(),
                })
                (out / f'{stem}.timestamps.json').write_text(
                    json.dumps(ticks, indent=2) + '\n'
                )
        exit_code = process.wait()

    intervals, observations, stats = summarize_intervals(ticks)
    result = {
        'exit_code': exit_code,
        'image_sha256': hashlib.sha256(image.read_bytes()).hexdigest(),
        'simulator_path': str(simulator),
        'simulator_sha256': hashlib.sha256(simulator.read_bytes()).hexdigest(),
        'host_elapsed_seconds': (time.monotonic_ns() - start) / 1e9,
        'timestamp_semantics': 'host monotonic time when each complete RTC output line was read',
        'ticks': ticks,
        'intervals_seconds': intervals,
        'interval_observations': observations,
        'per_interval_stats': stats,
        'per_interval_threshold': None,
        'diagnostic_scope': {
            'host_interval': (
                'end-to-end output arrival time; includes guest wait/printf, '
                'simulator execution and host scheduling'
            ),
            'guest_lateness': 'RTC_DIAG is a whole-run maximum, not indexed by interval',
            'guest_lateness_interval_index_available': False,
        },
    }
    (out / f'{stem}.result.json').write_text(json.dumps(result, indent=2) + '\n')
    sys.exit(exit_code)


if __name__ == '__main__':
    main()
