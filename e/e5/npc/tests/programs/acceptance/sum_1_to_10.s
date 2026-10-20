# 大程序验收：1+2+...+10，手算 10*11/2=55。只用 addi/add/jalr 和 ebreak。
# EXPECT halt 0x5c
# EXPECT cycles 23
# EXPECT reg 10 55
# EXPECT reg 5 10
addi a0, zero, 0
addi t0, zero, 1
add a0, a0, t0
addi t0, zero, 2
add a0, a0, t0
addi t0, zero, 3
add a0, a0, t0
addi t0, zero, 4
add a0, a0, t0
addi t0, zero, 5
add a0, a0, t0
addi t0, zero, 6
add a0, a0, t0
addi t0, zero, 7
add a0, a0, t0
addi t0, zero, 8
add a0, a0, t0
addi t0, zero, 9
add a0, a0, t0
addi t0, zero, 10
add a0, a0, t0
j done
addi a0, zero, 99 # 毒丸，不应执行。
done: ebreak
