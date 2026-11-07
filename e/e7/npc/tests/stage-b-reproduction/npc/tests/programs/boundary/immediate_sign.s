# 边界：I/S 型负立即数、-2048/2047，以及立即数字段不能误当 rs2 检查。
# EXPECT halt 0x20
# EXPECT cycles 9
# EXPECT reg 2 0xffffffff
# EXPECT reg 3 0xffffffff
# EXPECT reg 4 0xfffff800
# EXPECT reg 5 2047
# EXPECT reg 6 2048
# EXPECT reg 7 0xfffff7ff
# EXPECT mem 0x100 0xffffffff
addi x1, zero, 0x104
addi x2, zero, -1
sw x2, -4(x1)
lw x3, -4(x1)
addi x4, zero, -2048
addi x5, zero, 2047
addi x6, x5, 1
addi x7, x4, -1
ebreak
