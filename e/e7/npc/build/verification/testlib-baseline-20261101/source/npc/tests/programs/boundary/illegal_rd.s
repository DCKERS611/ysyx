# 边界：addi x16,x0,1 必须拒绝，不能截成 x0 后继续执行。
# INJECT 0x8 0x00100813
# EXPECT illegal 0x80000008 0x00100813
# EXPECT instructions 2
# EXPECT cycles_fixed 1 5
# EXPECT reg 10 7
# E7：a5 保存内存基址，标签仍表示文件内偏移。
lui a5, 0x80000
addi a0, zero, 7
addi zero, zero, 0 # 占位，被上面的原始非法编码替换。
ebreak
