# 大程序验收：0x12345678按字节累加，0x78+0x56+0x34+0x12=0x114。
# 然后把地址0x102改为0xab，期望对齐字变成0x12ab5678。
# EXPECT halt 0x44
# EXPECT cycles 17
# EXPECT reg 2 0x100
# EXPECT reg 5 0x12345678
# EXPECT reg 6 0x12
# EXPECT reg 7 0xab
# EXPECT reg 10 0x114
# EXPECT mem 0x100 0x12ab5678
addi sp, zero, 0x100
lui t0, 0x12345
addi t0, t0, 0x678
sw t0, 0(sp)
addi a0, zero, 0
lbu t1, 0(sp)
add a0, a0, t1
lbu t1, 1(sp)
add a0, a0, t1
lbu t1, 2(sp)
add a0, a0, t1
lbu t1, 3(sp)
add a0, a0, t1
addi t2, zero, 0xab
sb t2, 2(sp)
j done
addi a0, zero, 99
done: ebreak
