# DiffTest 小规模：15条静态指令、14条动态指令，覆盖8条指令和ebreak。
# EXPECT halt 0x80000038
# EXPECT instructions 14
# EXPECT cycles_fixed 1 33
# EXPECT reg 1 0x80000030
# EXPECT reg 5 0x12345678
# EXPECT reg 6 0x12345678
# EXPECT reg 7 0x56
# EXPECT reg 8 0xab
# EXPECT reg 9 0x12ab5678
# EXPECT reg 10 0x101
# EXPECT reg 11 0x80000030
# EXPECT mem 0x80000100 0x12ab5678
# E7：a5 保存内存基址，标签仍表示文件内偏移。
lui a5, 0x80000
addi sp, a5, 0x100
lui t0, 0x12345
addi t0, t0, 0x678
sw t0, 0(sp)
lw t1, 0(sp)
lbu t2, 1(sp)
addi s0, zero, 0xab
sb s0, 2(sp)
lw s1, 0(sp)
add a0, t2, s0
jalr ra, a5, done
addi a0, zero, 99
done:
addi a1, ra, 0
ebreak
