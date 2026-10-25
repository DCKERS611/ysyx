#!/usr/bin/env python3
"""从实际 FST 转出的 VCD 中抽查 add/lw/sb 的上升沿前后信号。"""

import argparse
from pathlib import Path


def read_vcd(path):
    symbols, scope, values = {}, [], {}
    snapshots = []
    time = 0
    header = True
    with path.open() as stream:
        for raw in stream:
            line = raw.strip()
            if header:
                fields = line.split()
                if line.startswith("$scope"):
                    scope.append(fields[2])
                elif line.startswith("$upscope"):
                    scope.pop()
                elif line.startswith("$var"):
                    symbols[".".join(scope + [fields[4]])] = fields[3]
                elif line.startswith("$enddefinitions"):
                    header = False
                continue
            if not line or line.startswith("$"):
                continue
            if line.startswith("#"):
                snapshots.append((time, values.copy()))
                time = int(line[1:])
            elif line[0] in "bB":
                bits, symbol = line[1:].split()
                values[symbol] = None if any(c in bits.lower() for c in "xz") else int(bits, 2)
            elif line[0] in "01xXzZ":
                values[line[1:]] = int(line[0]) if line[0] in "01" else None
    snapshots.append((time, values.copy()))
    return symbols, snapshots


def sample_instruction(path, pc):
    symbols, samples = read_vcd(path)
    def value(sample, name):
        symbol = symbols["TOP.top." + name]
        return sample[1].get(symbol)
    for before, after in zip(samples, samples[1:]):
        if (value(before, "clk") == 0 and value(after, "clk") == 1
                and value(before, "rst") == 0 and value(before, "pc") == pc):
            return lambda name: value(before, name), lambda name: value(after, name), after[0]
    raise ValueError(f"{path}: no execution edge for PC=0x{pc:x}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--array", type=Path, required=True)
    parser.add_argument("--bytes", type=Path, required=True)
    args = parser.parse_args()

    tests = [
        ("add", args.array, 0x34,
         {"inst": 0x00650533, "rs1_data": 0, "rs2_data": 1,
          "alu_src": 0, "alu_out": 1, "wen": 1, "rd": 10, "wdata": 1},
         {"pc": 0x38, "u_rf.rf.rf[10]": 1}),
        ("lw", args.array, 0x30,
         {"inst": 0x00012303, "alu_out": 0x80, "mem_read": 1,
          "mem_write": 0, "load_data": 1, "wb_sel": 1, "wdata": 1, "rd": 6},
         {"pc": 0x34, "u_rf.rf.rf[6]": 1}),
        ("sb", args.bytes, 0x38,
         {"inst": 0x00710123, "alu_out": 0x102, "mem_write": 1,
          "mem_read": 0, "mem_byte": 1, "wen": 0,
          "u_lsu.store_data": 0x00ab0000, "u_lsu.store_mask": 4},
         {"pc": 0x3c}),
    ]
    fails = 0
    for name, path, pc, before_expected, after_expected in tests:
        before, after, time = sample_instruction(path, pc)
        print(f"{name}: pre_pc=0x{pc:08x}, rising edge at {time} ps")
        for phase, getter, expected in [("before", before, before_expected),
                                         ("after", after, after_expected)]:
            for signal, wanted in expected.items():
                actual = getter(signal)
                ok = actual == wanted
                if not ok:
                    fails += 1
                actual_text = "unknown" if actual is None else f"0x{actual:08x}"
                print(f"  {'PASS' if ok else 'FAIL'} {phase}.{signal}: {actual_text} expect=0x{wanted:08x}")
    print("Wave inspection: " + ("PASS add/lw/sb" if not fails else f"FAILED {fails} signals"))
    return 1 if fails else 0


if __name__ == "__main__":
    raise SystemExit(main())
