# 功能：讲义调用/返回，最后由 ebreak 结束。
# EXPECT halt 0x0c
# EXPECT cycles 6
# EXPECT reg 1 12
# EXPECT reg 10 30
# EXPECT trace 0 4 16 20 8 12
addi a0, zero, 20
jalr ra, zero, fun
jalr ra, zero, done
done: ebreak
fun:
addi a0, a0, 10
jalr zero, ra, 0
