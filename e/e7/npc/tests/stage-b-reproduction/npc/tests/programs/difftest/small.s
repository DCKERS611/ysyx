# DiffTest 小规模：14条静态指令、13条动态指令，覆盖8条指令和ebreak。
# EXPECT halt 0x34
# EXPECT cycles 13
# EXPECT reg 1 0x2c
# EXPECT reg 5 0x12345678
# EXPECT reg 6 0x12345678
# EXPECT reg 7 0x56
# EXPECT reg 8 0xab
# EXPECT reg 9 0x12ab5678
# EXPECT reg 10 0x101
# EXPECT reg 11 0x2c
# EXPECT mem 0x100 0x12ab5678
addi sp, zero, 0x100
lui t0, 0x12345
addi t0, t0, 0x678
sw t0, 0(sp)
lw t1, 0(sp)
lbu t2, 1(sp)
addi s0, zero, 0xab
sb s0, 2(sp)
lw s1, 0(sp)
add a0, t2, s0
jalr ra, zero, done
addi a0, zero, 99
done:
addi a1, ra, 0
ebreak
