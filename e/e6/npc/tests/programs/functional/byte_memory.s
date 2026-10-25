# 功能：小端的四个字节通道、lbu 零扩展、sb 掩码和相邻字节保留。
# EXPECT halt 0x54
# EXPECT cycles 22
# EXPECT reg 6 0x78
# EXPECT reg 7 0x56
# EXPECT reg 8 0x34
# EXPECT reg 9 0x12
# EXPECT reg 10 0x90abcdef
# EXPECT reg 11 0xff
# EXPECT mem 0x100 0x90abcdef
# EXPECT mem 0x104 0x1234ff78
addi x1, zero, 0x100
lui x2, 0x12345
addi x2, x2, 0x678
sw x2, 0(x1)
sw x2, 4(x1)
lbu x6, 0(x1)
lbu x7, 1(x1)
lbu x8, 2(x1)
lbu x9, 3(x1)
addi x3, zero, 0xef
sb x3, 0(x1)
addi x3, zero, 0xcd
sb x3, 1(x1)
addi x3, zero, 0xab
sb x3, 2(x1)
addi x3, zero, 0x90
sb x3, 3(x1)
addi x3, zero, 0xff
sb x3, 5(x1)
lbu x11, 5(x1)
lw a0, 0(x1)
ebreak
