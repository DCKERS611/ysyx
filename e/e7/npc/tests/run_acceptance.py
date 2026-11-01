#!/usr/bin/env python3
"""三个验收程序分别运行 NPC、独立 EMU 和逐条 DiffTest，并保留每后端日志。"""

import argparse
from pathlib import Path
import subprocess

from run_cpu_tests import ROOT, build_case, parse_result


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
        instructions = next(int(row.split()[1], 0) for row in manifest if row.startswith("instructions "))
        statuses = []
        commands = [
            ("NPC", "npc", [str(args.npc.resolve()), str(output), str(expected), name]),
            ("EMU", "emu", [str(args.emu.resolve()), str(output)]),
            ("DiffTest", "diff", [str(args.diff.resolve()), str(output), str(expected), name]),
        ]
        for mode, backend, command in commands:
            text = ""
            try:
                completed = subprocess.run(command, capture_output=True, text=True, timeout=60)
                text = completed.stdout + completed.stderr
                # 独立 EMU 的 CLI 只有镜像路径，因此 case 使用镜像文件名。
                fields = parse_result(completed, backend, output.name if backend == "emu" else name)
                ok = completed.returncode == 0 and fields["verdict"] == "pass"
                if backend == "emu":
                    ok &= (fields["retired"], fields["a0"], fields["halt_pc"]) == (instructions, a0, halt)
            except (OSError, ValueError, subprocess.TimeoutExpired) as error:
                ok = False
                if isinstance(error, subprocess.TimeoutExpired):
                    for part in (error.stdout, error.stderr):
                        text += part.decode(errors="replace") if isinstance(part, bytes) else (part or "")
                text += f"\n{type(error).__name__}: {error}\n"
            output.with_suffix("." + mode.lower() + ".log").write_text(text)
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
