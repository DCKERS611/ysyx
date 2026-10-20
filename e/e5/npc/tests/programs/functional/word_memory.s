# 功能：sw/lw，非零基址与非零偏移，字地址为 0x108。
# EXPECT halt 0x14
# EXPECT cycles 6
# EXPECT reg 3 42
# EXPECT reg 10 42
# EXPECT mem 0x108 42
addi x1, zero, 0x100
addi x2, zero, 42
sw x2, 8(x1)
lw x3, 8(x1)
addi a0, x3, 0
ebreak
