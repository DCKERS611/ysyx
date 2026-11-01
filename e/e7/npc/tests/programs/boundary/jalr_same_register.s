# 边界：jalr x1,x1,0 必须先用旧 x1 算目标，再写回返回地址。
# 旧 x1=17，目标清最低位后为16，新 x1=8；不能跳到新值8。
# EXPECT halt 0x80000018
# EXPECT instructions 5
# EXPECT cycles_fixed 1 10
# EXPECT reg 1 0x8000000c
# EXPECT reg 10 7
# EXPECT trace 0x80000000 0x80000004 0x80000008 0x80000014 0x80000018
# E7：a5 保存内存基址，标签仍表示文件内偏移。
lui a5, 0x80000
addi x1, a5, 21
jalr x1, x1, 0
addi a0, zero, 99
ebreak
addi a0, zero, 7
ebreak
