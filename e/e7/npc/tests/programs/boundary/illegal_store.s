# 边界：sw x16,0(x1) 必须拒绝；不得覆盖原来存入的 85。
# INJECT 0x10 0x0100a023
# EXPECT illegal 0x80000010 0x0100a023
# EXPECT instructions 4
# EXPECT cycles_fixed 1 10
# EXPECT mem 0x80000100 85
# E7：a5 保存内存基址，标签仍表示文件内偏移。
lui a5, 0x80000
addi x1, a5, 0x100
addi x2, zero, 85
sw x2, 0(x1)
addi zero, zero, 0
ebreak
