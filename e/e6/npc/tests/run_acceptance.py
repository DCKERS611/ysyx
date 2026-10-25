#!/usr/bin/env python3
"""三个验收程序分别运行 NPC、独立 EMU 和逐条 DiffTest。"""

import argparse
from pathlib import Path
import re
import subprocess

from run_cpu_tests import ROOT, build_case


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--npc", type=Path, required=True)
    parser.add_argument("--emu", type=Path, required=True)
    parser.add_argument("--diff", type=Path, required=True)
    args = parser.parse_args()
    report = ["# 大程序验收结果", "", "| 程序 | NPC | 独立 EMU | DiffTest |",
              "|---|---|---|---|"]
    failures = 0
    for source in sorted((ROOT / "tests/programs/acceptance").glob("*.s")):
        name = "acceptance/" + source.stem
        output = ROOT / "build/acceptance/programs" / (source.stem + ".bin")
        expected = build_case(source, output)
        manifest = expected.read_text().splitlines()
        a0 = next(int(row.split()[2], 0) for row in manifest if row.startswith("reg 10 "))
        halt = next(int(row.split()[1], 0) for row in manifest if row.startswith("halt "))
        cycles = next(int(row.split()[1], 0) for row in manifest if row.startswith("cycles "))
        statuses = []
        commands = [
            ("NPC", [str(args.npc.resolve()), str(output), str(expected), name]),
            ("EMU", [str(args.emu.resolve()), str(output)]),
            ("DiffTest", [str(args.diff.resolve()), str(output), str(expected), name]),
        ]
        for mode, command in commands:
            result = subprocess.run(command, capture_output=True, text=True, timeout=20)
            text = result.stdout + result.stderr
            output.with_suffix("." + mode.lower() + ".log").write_text(text)
            ok = result.returncode == 0
            if mode == "EMU":
                steps = [line for line in result.stdout.splitlines() if line.startswith("step=")]
                last = steps[-1] if steps else ""
                ok &= f"step={cycles} " in last
                ok &= f"a0=0x{a0:08x}" in last
                ok &= f"-> pc=0x{halt:08x}" in last
                ok &= f"ebreak @ pc=0x{halt:08x}" in result.stdout
            status = "PASS" if ok else "FAIL"
            statuses.append(status)
            print(f"[ {status} ] {name} {mode}: a0={a0} (0x{a0:x})", flush=True)
            if not ok:
                failures += 1
                print(text, flush=True)
        report.append(f"| {source.stem} | {' | '.join(statuses)} |")
    (ROOT / "build/acceptance/results.md").write_text("\n".join(report) + "\n")
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())
