# 边界：连续多次跳转，每次必须使用新 PC 的指令；毒丸 a0=99 不执行。
# EXPECT halt 0x1c
# EXPECT cycles 6
# EXPECT reg 1 8
# EXPECT reg 2 28
# EXPECT reg 10 7
# EXPECT trace 0 4 16 24 12 28
addi a0, zero, 7
jalr ra, zero, first
addi a0, zero, 99
j done
first:
j second
addi a0, zero, 99
second:
jalr sp, zero, 12
done:
ebreak
