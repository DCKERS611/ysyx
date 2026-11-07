#!/usr/bin/env python3
"""汇编分类程序，提取 EXPECT 注释，逐程序调用 C++ TestSuite 测试入口。"""

import argparse
import importlib.util
from pathlib import Path
import re
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("mkprog", ROOT / "tools/mkprog.py")
mkprog = importlib.util.module_from_spec(spec)
spec.loader.exec_module(mkprog)


def build_case(source, output):
    text = source.read_text(encoding="utf-8")
    binary, listing = mkprog.assemble(text)
    binary = bytearray(binary)
    expectations = []
    injected = set()
    for line_number, line in enumerate(text.splitlines(), 1):
        match = re.match(r"\s*#\s*(EXPECT|INJECT)\s+(.+?)\s*$", line)
        if not match:
            continue
        kind, body = match.groups()
        if kind == "EXPECT":
            expectations.append(body)
        else:
            fields = body.split()
            if len(fields) != 2:
                raise ValueError(f"line {line_number}: INJECT needs address and word")
            address, word = (int(value, 0) for value in fields)
            if address % 4 or address < 0 or address + 4 > len(binary):
                raise ValueError(f"line {line_number}: invalid INJECT address")
            if address in injected or not 0 <= word <= 0xffffffff:
                raise ValueError(f"line {line_number}: invalid or duplicate INJECT")
            injected.add(address)
            binary[address:address + 4] = struct.pack("<I", word)

    if not expectations:
        raise ValueError("no EXPECT comments")
    if len(binary) > 1024:
        raise ValueError("program exceeds NPC memory")
    # 清单同时保留占位指令和实际注入的机器码，便于核对非法输入。
    rows = listing.splitlines()
    for address in sorted(injected):
        word, = struct.unpack_from("<I", binary, address)
        rows[address // 4] = f"{address:08x}  {word:08x}  # INJECT raw instruction"
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_bytes(binary)
    output.with_suffix(".hex").write_text("\n".join(rows) + "\n")
    expected_path = output.with_suffix(".expect")
    expected_path.write_text("\n".join(expectations) + "\n")
    return expected_path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--group", choices=("functional", "boundary", "difftest", "acceptance"), required=True)
    parser.add_argument("--case", help="only run one source stem")
    parser.add_argument("--runner", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, default=ROOT / "build/regress/programs")
    args = parser.parse_args()
    sources = sorted((ROOT / "tests/programs" / args.group).glob("*.s"))
    if args.case:
        sources = [source for source in sources if source.stem == args.case]
    if not sources:
        parser.error("no test programs found")

    failures = 0
    for source in sources:
        name = f"{args.group}/{source.stem}"
        try:
            output = args.output_dir / args.group / (source.stem + ".bin")
            expected = build_case(source, output)
            result = subprocess.run(
                [str(args.runner.resolve()), str(output.resolve()),
                 str(expected.resolve()), name],
                capture_output=True, text=True, timeout=15,
            )
            if result.returncode != 0:
                failures += 1
                print(f"[ FAIL ] {name}", flush=True)
                print(result.stdout + result.stderr, end="", flush=True)
            else:
                summaries = [line for line in result.stdout.splitlines()
                             if line.startswith("PASS:")]
                summary = summaries[0] if summaries else "completed"
                if len(summaries) > 1:
                    summary += "; expectations " + summaries[1]
                print(f"[ PASS ] {name}: {summary}", flush=True)
        except (OSError, ValueError, mkprog.AssemblyError, subprocess.TimeoutExpired) as error:
            failures += 1
            print(f"[ FAIL ] {name}: {error}", flush=True)

    print(f"{args.group}: {len(sources) - failures}/{len(sources)} programs passed")
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())
