# 功能：sw/lw，非零基址与非零偏移，字地址为 0x108。
# EXPECT halt 0x80000018
# EXPECT cycles 15
# EXPECT reg 3 42
# EXPECT reg 10 42
# EXPECT mem 0x80000108 42
lui x1, 0x80000
addi x1, x1, 0x100
addi x2, zero, 42
sw x2, 8(x1)
lw x3, 8(x1)
addi a0, x3, 0
ebreak
