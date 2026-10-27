#!/usr/bin/env python3
"""minirv 小汇编器：9 条指令、绝对地址标签和 j 伪指令。"""

import argparse
from pathlib import Path
import re
import struct
import sys


class AssemblyError(ValueError):
    pass


REGISTERS = {f"x{i}": i for i in range(16)}
REGISTERS.update({
    "zero": 0, "ra": 1, "sp": 2, "gp": 3, "tp": 4,
    "t0": 5, "t1": 6, "t2": 7, "s0": 8, "fp": 8, "s1": 9,
    **{f"a{i}": i + 10 for i in range(6)},
})
LABEL = re.compile(r"^([A-Za-z_][A-Za-z0-9_]*):")


def register(text):
    name = text.lower()
    if name not in REGISTERS:
        raise AssemblyError(f"invalid register '{text}': minirv only has x0..x15")
    return REGISTERS[name]


def immediate(text, labels, low, high):
    # 标签表示从 0 开始的字节地址，不做 PC 相对重定位。
    if text in labels:
        value = labels[text]
    else:
        try:
            value = int(text, 10) if re.fullmatch(r"[+-]?[0-9]+", text) else int(text, 0)
        except ValueError:
            raise AssemblyError(f"invalid immediate or undefined label '{text}'") from None
    if not low <= value <= high:
        raise AssemblyError(f"immediate '{text}' out of range [{low}, {high}]")
    return value


def operands(text, count):
    result = [part.strip() for part in text.split(",")] if text else []
    if len(result) != count or any(not part for part in result):
        raise AssemblyError(f"expected {count} comma-separated operands")
    return result


def memory_operand(text):
    match = re.fullmatch(r"([^()]+)\(\s*([^()]+)\s*\)", text)
    if not match:
        raise AssemblyError("expected offset(rs1), for example 8(x1)")
    return match[1].strip(), register(match[2].strip())


def i_type(opcode, funct3, rd, rs1, imm):
    return ((imm & 0xfff) << 20) | (rs1 << 15) | (funct3 << 12) | (rd << 7) | opcode


def encode(text, labels):
    parts = text.split(None, 1)
    op = parts[0].lower()
    args = parts[1].strip() if len(parts) == 2 else ""

    if op == "ebreak":
        operands(args, 0)
        return 0x00100073

    if op == "j":
        target, = operands(args, 1)
        if target not in labels:
            raise AssemblyError(f"undefined jump label '{target}'")
        addr = immediate(target, labels, -2048, 2047)
        # minirv 没有 jal，此伪指令使用 x0 为基址进行绝对地址跳转。
        return i_type(0x67, 0, 0, 0, addr)

    if op == "add":
        rd, rs1, rs2 = operands(args, 3)
        return (register(rs2) << 20) | (register(rs1) << 15) | (register(rd) << 7) | 0x33

    if op in ("addi", "jalr"):
        rd, rs1, imm = operands(args, 3)
        return i_type(0x13 if op == "addi" else 0x67, 0,
                      register(rd), register(rs1),
                      immediate(imm, labels, -2048, 2047))

    if op == "lui":
        rd, imm = operands(args, 2)
        # 接受 20 位字段，也允许用负数表达对应的补码。
        value = immediate(imm, labels, -(1 << 19), (1 << 20) - 1)
        return ((value & 0xfffff) << 12) | (register(rd) << 7) | 0x37

    if op in ("lw", "lbu", "sw", "sb"):
        reg, address = operands(args, 2)
        offset, rs1 = memory_operand(address)
        imm = immediate(offset, labels, -2048, 2047)
        regno = register(reg)
        if op in ("lw", "lbu"):
            return i_type(0x03, 2 if op == "lw" else 4, regno, rs1, imm)
        value = imm & 0xfff
        return ((value >> 5) << 25) | (regno << 20) | (rs1 << 15) \
            | ((2 if op == "sw" else 0) << 12) | ((value & 0x1f) << 7) | 0x23

    raise AssemblyError(f"unsupported instruction '{op}'")


def assemble(source):
    # 第一遍：每条指令固定 4 字节，j 也只展开成一条。
    labels = {}
    instructions = []
    pc = 0
    for line_number, raw in enumerate(source.splitlines(), 1):
        text = re.split(r"#|//|;", raw, maxsplit=1)[0].strip()
        while text:
            match = LABEL.match(text)
            if not match:
                break
            name = match[1]
            if name in labels:
                raise AssemblyError(f"line {line_number}: duplicate label '{name}'")
            labels[name] = pc
            text = text[match.end():].strip()
        if text:
            instructions.append((pc, line_number, text))
            pc += 4

    if not instructions:
        raise AssemblyError("no instructions")

    # 第二遍：标签地址已知，生成机器码和带地址的清单。
    binary = bytearray()
    listing = []
    for pc, line_number, text in instructions:
        try:
            word = encode(text, labels)
        except AssemblyError as error:
            raise AssemblyError(f"line {line_number}: {error}") from None
        binary.extend(struct.pack("<I", word))
        listing.append(f"{pc:08x}  {word:08x}  {text}")
    return bytes(binary), "\n".join(listing) + "\n"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path, help="input assembly file")
    parser.add_argument("-o", "--output", type=Path, help="output bin (default: source.bin)")
    args = parser.parse_args()
    output = args.output if args.output else args.source.with_suffix(".bin")
    listing_path = output.with_suffix(".hex")
    paths = [args.source.resolve(), output.resolve(), listing_path.resolve()]
    if len(set(paths)) != 3:
        parser.error("source, bin and hex paths must be different")

    try:
        binary, listing = assemble(args.source.read_text(encoding="utf-8-sig"))
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_bytes(binary)
        listing_path.write_text(listing, encoding="utf-8")
    except (OSError, UnicodeError, AssemblyError) as error:
        print(f"{args.source}: {error}", file=sys.stderr)
        return 1
    print(f"Generated {output}: {len(binary)} bytes; listing: {listing_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
