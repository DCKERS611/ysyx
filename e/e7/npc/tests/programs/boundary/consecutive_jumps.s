# 边界：连续多次跳转，每次必须使用新 PC 的指令；毒丸 a0=99 不执行。
# EXPECT halt 0x80000020
# EXPECT instructions 7
# EXPECT cycles_fixed 1 14
# EXPECT reg 1 0x8000000c
# EXPECT reg 2 0x80000020
# EXPECT reg 10 7
# EXPECT trace 0x80000000 0x80000004 0x80000008 0x80000014 0x8000001c 0x80000010 0x80000020
# E7：a5 保存内存基址，标签仍表示文件内偏移。
lui a5, 0x80000
addi a0, zero, 7
jalr ra, a5, first
addi a0, zero, 99
jalr zero, a5, done
first:
jalr zero, a5, second
addi a0, zero, 99
second:
jalr sp, a5, 16
done:
ebreak
