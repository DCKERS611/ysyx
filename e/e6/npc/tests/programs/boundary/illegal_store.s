# 边界：sw x16,0(x1) 必须拒绝；不得覆盖原来存入的 85。
# INJECT 0x0c 0x0100a023
# EXPECT illegal 0x0c 0x0100a023
# EXPECT cycles 3
# EXPECT mem 0x100 85
addi x1, zero, 0x100
addi x2, zero, 85
sw x2, 0(x1)
addi zero, zero, 0
ebreak
