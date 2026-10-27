# 功能：讲义调用/返回，最后由 ebreak 结束。
# EXPECT halt 0x80000010
# EXPECT cycles 14
# EXPECT reg 1 0x80000010
# EXPECT reg 10 30
# EXPECT trace 0x80000000 0x80000004 0x80000008 0x80000014 0x80000018 0x8000000c 0x80000010
lui x2, 0x80000
addi a0, zero, 20
jalr ra, x2, fun
jalr ra, x2, done
done: ebreak
fun:
addi a0, a0, 10
jalr zero, ra, 0
