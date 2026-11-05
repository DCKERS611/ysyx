#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"hello.c"
	.option nopic
	.text
	.section	.rodata.hello.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Hello, AM World @ minirv\n"
	.section	.text.hello,"ax",@progbits
	.align	2
	.globl	hello
	.hidden	hello
	.type	hello, @function
hello:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	li	s0,10
.L2:
	lla	s1,.LC0
	li	a0,72
.L3:
	addi	s1,s1,1
	call	putch
	lbu	a0,0(s1)
	bne	a0,zero,.L3
	addi	s0,s0,-1
	bne	s0,zero,.L2
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	hello, .-hello
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
