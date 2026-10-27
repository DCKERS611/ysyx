# 边界：add x10,x0,x16 必须拒绝。
# INJECT 0x04 0x01000533
# EXPECT illegal 0x04 0x01000533
# EXPECT cycles 1
# EXPECT reg 10 7
addi a0, zero, 7
addi zero, zero, 0
ebreak
