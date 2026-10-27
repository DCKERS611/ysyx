# 功能：addi、add、lui 的基本运算及写回。
# EXPECT halt 0x80000010
# EXPECT cycles 10
# EXPECT reg 1 5
# EXPECT reg 2 7
# EXPECT reg 3 12
# EXPECT reg 10 0x12345000
addi x1, zero, 5
addi x2, zero, 7
add x3, x1, x2
lui a0, 0x12345
ebreak
