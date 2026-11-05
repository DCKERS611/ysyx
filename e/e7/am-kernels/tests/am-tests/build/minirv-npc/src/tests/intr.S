#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"intr.c"
	.option nopic
	.text
	.section	.rodata.simple_trap.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Unhandled event"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/am-kernels/tests/am-tests/src/tests/intr.c:12  \n"
	.section	.text.simple_trap,"ax",@progbits
	.align	2
	.globl	simple_trap
	.hidden	simple_trap
	.type	simple_trap, @function
simple_trap:
	lw	a5,0(a0)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	li	a4,5
	mv	s0,a1
	beq	a5,a4,.L2
	li	a4,6
	beq	a5,a4,.L3
	li	a4,1
	beq	a5,a4,.L4
	lla	s0,.LC0
	li	a0,65
.L5:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L5
	lla	s0,.LC1
	li	a0,85
.L7:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L7
	lla	s0,.LC2
	li	a0,32
.L8:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L8
	li	a0,1
	call	halt
.L4:
	li	a0,121
	call	putch
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L3:
	li	a0,100
	call	putch
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L2:
	li	a0,116
	call	putch
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	simple_trap, .-simple_trap
	.section	.rodata.hello_intr.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"Hello, AM World @ minirv\n"
	.align	2
.LC4:
	.string	"  t = timer, d = device, y = yield\n"
	.section	.text.hello_intr,"ax",@progbits
	.align	2
	.globl	hello_intr
	.hidden	hello_intr
	.type	hello_intr, @function
hello_intr:
	addi	sp,sp,-16
	lla	a0,.LC3
	sw	ra,12(sp)
	sw	s0,8(sp)
	call	printf
	lla	a0,.LC4
	call	printf
	mv	a1,sp
	li	a0,7
	call	ioe_read
	li	a0,1
	li	s0,9998336
	call	iset
	addi	s0,s0,1663
.L17:
	sw	zero,0(sp)
	lw	a5,0(sp)
	bgt	a5,s0,.L15
.L16:
	lw	a5,0(sp)
	addi	a5,a5,1
	sw	a5,0(sp)
	lw	a5,0(sp)
	ble	a5,s0,.L16
.L15:
	call	yield
	j	.L17
	.size	hello_intr, .-hello_intr
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
