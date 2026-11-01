# 边界：sub x10,x10,x1 不能误译码成 add。
# INJECT 0xc 0x40150533
# EXPECT illegal 0x8000000c 0x40150533
# EXPECT instructions 3
# EXPECT cycles_fixed 1 7
# EXPECT reg 10 7
# E7：a5 保存内存基址，标签仍表示文件内偏移。
lui a5, 0x80000
addi a0, zero, 7
addi x1, zero, 1
addi zero, zero, 0
ebreak
