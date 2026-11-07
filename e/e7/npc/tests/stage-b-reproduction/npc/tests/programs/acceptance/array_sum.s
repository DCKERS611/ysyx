# 大程序验收：把1,2,3,4存到0x80，再逐个读回求和，期望a0=10。
# 指令区共84字节，不覆盖0x80开始的数据区。
# EXPECT halt 0x50
# EXPECT cycles 20
# EXPECT reg 2 0x80
# EXPECT reg 6 4
# EXPECT reg 10 10
# EXPECT mem 0x80 1
# EXPECT mem 0x84 2
# EXPECT mem 0x88 3
# EXPECT mem 0x8c 4
addi sp, zero, 0x80
addi t0, zero, 1
sw t0, 0(sp)
addi t0, zero, 2
sw t0, 4(sp)
addi t0, zero, 3
sw t0, 8(sp)
addi t0, zero, 4
sw t0, 12(sp)
addi a0, zero, 0
j read_array
addi a0, zero, 99
read_array:
lw t1, 0(sp)
add a0, a0, t1
lw t1, 4(sp)
add a0, a0, t1
lw t1, 8(sp)
add a0, a0, t1
lw t1, 12(sp)
add a0, a0, t1
ebreak
