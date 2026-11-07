# 边界：jalr 使用负立即数；8、12 地址的毒丸指令不应执行。
# EXPECT halt 0x14
# EXPECT cycles 4
# EXPECT reg 2 8
# EXPECT reg 10 7
# EXPECT trace 0 4 16 20
addi x1, zero, 17
jalr x2, x1, -1
addi a0, zero, 99
ebreak
addi a0, zero, 7
ebreak
