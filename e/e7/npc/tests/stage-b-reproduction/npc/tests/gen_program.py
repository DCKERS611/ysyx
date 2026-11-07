#!/usr/bin/env python3
"""生成当前 addi/jalr/ebreak 测试程序的原始小端二进制。"""

from pathlib import Path
import struct
import sys

PROGRAM = [
    0x01400513,  # 0x00: addi a0, x0, 20
    0x010000E7,  # 0x04: jalr ra, 16(x0)
    0x00C000E7,  # 0x08: jalr ra, 12(x0)
    0x00100073,  # 0x0c: ebreak
    0x00A50513,  # 0x10: addi a0, a0, 10
    0x00008067,  # 0x14: jalr x0, 0(ra)
]

if len(sys.argv) != 2:
    raise SystemExit(f"Usage: {sys.argv[0]} <output.bin>")

output = Path(sys.argv[1])
output.parent.mkdir(parents=True, exist_ok=True)
output.write_bytes(b"".join(struct.pack("<I", word) for word in PROGRAM))
print(f"Generated {output}: {len(PROGRAM) * 4} bytes")
