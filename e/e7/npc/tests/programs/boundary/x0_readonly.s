# 边界：尝试用 addi/add/lui/lw/jalr 写 x0，并通过真实读数据验证恒零。
# EXPECT halt 0x30
# EXPECT cycles 11
# EXPECT reg 1 7
# EXPECT reg 10 0
# EXPECT mem 0x100 7
# EXPECT mem 0x104 0
# EXPECT trace 0 4 8 12 16 20 24 28 32 36 48
addi x1, zero, 7
addi zero, zero, 99
add zero, x1, x1
lui zero, 0xfffff
addi x2, zero, 0x100
sw x1, 0(x2)
lw zero, 0(x2)
addi a0, zero, 0
sw zero, 4(x2)
jalr zero, zero, done
addi a0, zero, 99
ebreak
done: ebreak
