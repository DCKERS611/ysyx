# 边界：addi x16,x0,1 必须拒绝，不能截成 x0 后继续执行。
# INJECT 0x04 0x00100813
# EXPECT illegal 0x04 0x00100813
# EXPECT cycles 1
# EXPECT reg 10 7
addi a0, zero, 7
addi zero, zero, 0 # 占位，被上面的原始非法编码替换。
ebreak
