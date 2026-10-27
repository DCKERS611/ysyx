# 边界：addi x10,x16,1 必须拒绝，不能把 x16 当 x0。
# INJECT 0x04 0x00180513
# EXPECT illegal 0x04 0x00180513
# EXPECT cycles 1
# EXPECT reg 10 7
addi a0, zero, 7
addi zero, zero, 0
ebreak
