# 边界：ecall 与 ebreak 只差一位；ecall 应非法，不能通知正常结束。
# INJECT 0x04 0x00000073
# EXPECT illegal 0x04 0x00000073
# EXPECT cycles 1
# EXPECT reg 10 7
addi a0, zero, 7
addi zero, zero, 0
ebreak
