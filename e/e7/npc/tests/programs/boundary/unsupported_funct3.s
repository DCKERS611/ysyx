# 边界：ori x10,x10,1 的 opcode 与 addi 相同，但 funct3 不支持。
# INJECT 0x8 0x00156513
# EXPECT illegal 0x80000008 0x00156513
# EXPECT instructions 2
# EXPECT cycles_fixed 1 5
# EXPECT reg 10 7
# E7：a5 保存内存基址，标签仍表示文件内偏移。
lui a5, 0x80000
addi a0, zero, 7
addi zero, zero, 0
ebreak
