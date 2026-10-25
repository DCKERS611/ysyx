# 讲义原始六条指令，用于逐字核对机器码；halt 为自跳。
start:
    addi a0, zero, 20
    jalr ra, zero, fun
    jalr ra, zero, halt
halt:
    j halt
fun:
    addi a0, a0, 10
    jalr zero, ra, 0
