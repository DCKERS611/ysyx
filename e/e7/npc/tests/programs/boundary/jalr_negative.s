# 边界：jalr 使用负立即数；8、12 地址的毒丸指令不应执行。
# EXPECT halt 0x80000018
# EXPECT instructions 5
# EXPECT cycles_fixed 1 10
# EXPECT reg 2 0x8000000c
# EXPECT reg 10 7
# EXPECT trace 0x80000000 0x80000004 0x80000008 0x80000014 0x80000018
# E7：a5 保存内存基址，标签仍表示文件内偏移。
lui a5, 0x80000
addi x1, a5, 21
jalr x2, x1, -1
addi a0, zero, 99
ebreak
addi a0, zero, 7
ebreak
