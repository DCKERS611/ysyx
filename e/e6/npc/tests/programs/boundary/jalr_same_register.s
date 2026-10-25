# 边界：jalr x1,x1,0 必须先用旧 x1 算目标，再写回返回地址。
# 旧 x1=17，目标清最低位后为16，新 x1=8；不能跳到新值8。
# EXPECT halt 0x14
# EXPECT cycles 4
# EXPECT reg 1 8
# EXPECT reg 10 7
# EXPECT trace 0 4 16 20
addi x1, zero, 17
jalr x1, x1, 0
addi a0, zero, 99
ebreak
addi a0, zero, 7
ebreak
