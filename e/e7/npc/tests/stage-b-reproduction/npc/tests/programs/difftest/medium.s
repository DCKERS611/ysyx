# DiffTest 中规模：38条静态指令，动态80条；数组求和1..8，期望36。
# minirv 没有条件分支：地址表前7项指回loop，第8项指向done。
# EXPECT halt 0x94
# EXPECT cycles 80
# EXPECT reg 6 0x220
# EXPECT reg 8 36
# EXPECT reg 9 0x120
# EXPECT reg 10 36
# EXPECT reg 11 0x90
# EXPECT mem 0x100 1
# EXPECT mem 0x11c 8
# EXPECT mem 0x200 0x78
# EXPECT mem 0x21c 0x90
addi sp, zero, 0x100
addi t0, zero, 1
sw t0, 0(sp)
addi t0, zero, 2
sw t0, 4(sp)
addi t0, zero, 3
sw t0, 8(sp)
addi t0, zero, 4
sw t0, 12(sp)
addi t0, zero, 5
sw t0, 16(sp)
addi t0, zero, 6
sw t0, 20(sp)
addi t0, zero, 7
sw t0, 24(sp)
addi t0, zero, 8
sw t0, 28(sp)
addi t1, zero, 0x200
addi t2, zero, loop
sw t2, 0(t1)
sw t2, 4(t1)
sw t2, 8(t1)
sw t2, 12(t1)
sw t2, 16(t1)
sw t2, 20(t1)
sw t2, 24(t1)
addi t2, zero, done
sw t2, 28(t1)
addi s0, zero, 0
addi s1, sp, 0
loop:
lw a0, 0(s1)
add s0, s0, a0
addi s1, s1, 4
lw a1, 0(t1)
addi t1, t1, 4
jalr zero, a1, 0
done:
addi a0, s0, 0
ebreak
