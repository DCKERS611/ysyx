# 边界：U 型低 12 位补零；立即数位不能误作 rs1/rs2/funct3 检查。
# EXPECT halt 0x80000014
# EXPECT instructions 6
# EXPECT cycles_fixed 1 12
# EXPECT reg 1 0xfffff000
# EXPECT reg 2 0x80000000
# EXPECT reg 3 0x00001000
# EXPECT reg 10 0xffffefff
# E7：a5 保存内存基址，标签仍表示文件内偏移。
lui a5, 0x80000
lui x1, 0xfffff
lui x2, 0x80000
lui x3, 1
addi a0, x1, -1
ebreak
