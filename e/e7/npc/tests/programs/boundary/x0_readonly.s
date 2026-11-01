# 边界：尝试用 addi/add/lui/lw/jalr 写 x0，并通过真实读数据验证恒零。
# EXPECT halt 0x80000034
# EXPECT instructions 12
# EXPECT cycles_fixed 1 27
# EXPECT reg 1 7
# EXPECT reg 10 0
# EXPECT mem 0x80000100 7
# EXPECT mem 0x80000104 0
# EXPECT trace 0x80000000 0x80000004 0x80000008 0x8000000c 0x80000010 0x80000014 0x80000018 0x8000001c 0x80000020 0x80000024 0x80000028 0x80000034
# E7：a5 保存内存基址，标签仍表示文件内偏移。
lui a5, 0x80000
addi x1, zero, 7
addi zero, zero, 99
add zero, x1, x1
lui zero, 0xfffff
addi x2, a5, 0x100
sw x1, 0(x2)
lw zero, 0(x2)
addi a0, zero, 0
sw zero, 4(x2)
jalr zero, a5, done
addi a0, zero, 99
ebreak
done: ebreak
