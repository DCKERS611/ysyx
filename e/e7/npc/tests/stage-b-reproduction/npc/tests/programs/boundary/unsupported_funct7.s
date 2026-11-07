# 边界：sub x10,x10,x1 不能误译码成 add。
# INJECT 0x08 0x40150533
# EXPECT illegal 0x08 0x40150533
# EXPECT cycles 2
# EXPECT reg 10 7
addi a0, zero, 7
addi x1, zero, 1
addi zero, zero, 0
ebreak
