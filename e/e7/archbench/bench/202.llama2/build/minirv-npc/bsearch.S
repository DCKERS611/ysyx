#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"bsearch.c"
	.option nopic
	.text
	.globl	__mulsi3
	.section	.text.bsearch,"ax",@progbits
	.align	2
	.globl	bsearch
	.hidden	bsearch
	.type	bsearch, @function
bsearch:
	addi	sp,sp,-36
	sw	ra,32(sp)
	sw	s0,28(sp)
	sw	s1,24(sp)
	sw	a0,8(sp)
	sw	a1,12(sp)
	sw	a3,16(sp)
	sw	a4,20(sp)
	beq	a2,zero,.L2
	beq	a3,zero,.L2
	mv	s0,a2
	li	s1,0
.L5:
	lw	a0,16(sp)
	add	a5,s1,s0
	srli	a5,a5,1
	mv	a1,a5
	sw	a5,0(sp)
	call	__mulsi3
	lw	a5,12(sp)
	add	a1,a5,a0
	lw	a5,20(sp)
	lw	a0,8(sp)
	sw	a1,4(sp)
	jalr	a5
	lw	a5,0(sp)
	blt	a0,zero,.L6
	lw	a1,4(sp)
	beq	a0,zero,.L1
	addi	s1,a5,1
	bltu	s1,s0,.L5
.L2:
	li	a1,0
.L1:
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	mv	a0,a1
	addi	sp,sp,36
	jr	ra
.L6:
	mv	s0,a5
	bltu	s1,s0,.L5
	j	.L2
	.size	bsearch, .-bsearch
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
