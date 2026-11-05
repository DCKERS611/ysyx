#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"hello.c"
	.option nopic
	.text
	.section	.rodata.main.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Hello, AbstractMachine!\nmainargs = '%'.\n"
	.section	.text.startup.main,"ax",@progbits
	.align	2
	.globl	main
	.hidden	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	a0,0(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	lla	s0,.LC0
	li	a0,72
	j	.L6
.L2:
	call	putch
.L4:
	lbu	a0,1(s0)
	addi	s0,s0,1
	beq	a0,zero,.L13
.L6:
	li	a5,37
	bne	a0,a5,.L2
	lw	s1,0(sp)
	lbu	a0,0(s1)
	beq	a0,zero,.L4
.L3:
	addi	s1,s1,1
	call	putch
	lbu	a0,0(s1)
	bne	a0,zero,.L3
	lbu	a0,1(s0)
	addi	s0,s0,1
	bne	a0,zero,.L6
.L13:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
