# 同一程序用 ebreak 结束，可交给当前 NPC 测试驱动。
start:
    addi a0, zero, 20
    jalr ra, zero, fun
    jalr ra, zero, halt
halt:
    ebreak
fun:
    addi a0, a0, 10
    jalr zero, ra, 0
