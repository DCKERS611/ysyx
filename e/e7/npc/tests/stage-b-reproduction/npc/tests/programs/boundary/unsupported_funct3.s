# 边界：ori x10,x10,1 的 opcode 与 addi 相同，但 funct3 不支持。
# INJECT 0x04 0x00156513
# EXPECT illegal 0x04 0x00156513
# EXPECT cycles 1
# EXPECT reg 10 7
addi a0, zero, 7
addi zero, zero, 0
ebreak
