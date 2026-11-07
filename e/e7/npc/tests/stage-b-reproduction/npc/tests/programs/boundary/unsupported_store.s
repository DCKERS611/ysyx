# 边界：sh x2,0(x1) 不支持，不得误写内存。
# INJECT 0x0c 0x00209023
# EXPECT illegal 0x0c 0x00209023
# EXPECT cycles 3
# EXPECT mem 0x100 85
addi x1, zero, 0x100
addi x2, zero, 85
sw x2, 0(x1)
addi zero, zero, 0
ebreak
