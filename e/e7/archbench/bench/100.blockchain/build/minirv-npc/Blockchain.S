#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"Blockchain.c"
	.option nopic
	.text
	.section	.rodata.initBlockchain.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Genesis Block"
	.section	.text.initBlockchain,"ax",@progbits
	.align	2
	.globl	initBlockchain
	.hidden	initBlockchain
	.type	initBlockchain, @function
initBlockchain:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	mv	s1,a1
	lla	a2,.LC0
	li	a1,0
	addi	a0,a0,8
	sw	ra,8(sp)
	call	initBlock
	li	a5,1
	sw	s1,0(s0)
	lw	ra,8(sp)
	sw	a5,776(s0)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	initBlockchain, .-initBlockchain
	.section	.text.AddBlock,"ax",@progbits
	.align	2
	.globl	AddBlock
	.hidden	AddBlock
	.type	AddBlock, @function
AddBlock:
	lw	a3,776(a0)
	addi	sp,sp,-20
	sw	s0,12(sp)
	addi	a4,a3,-1
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,5
	addi	a4,a5,104
	add	s0,a0,a4
	addi	a5,a5,8
	sw	s1,8(sp)
	add	a5,a0,a5
	mv	s1,a0
	mv	a0,s0
	sw	ra,16(sp)
	sw	a3,4(sp)
	sw	a5,0(sp)
	call	initBlock
	lw	a5,0(sp)
	mv	a0,a5
	call	GetHash
	lw	a3,4(sp)
	slli	a5,a3,1
	add	a5,a5,a3
	slli	a5,a5,5
	add	a5,s1,a5
	sw	a0,20(a5)
	lw	a1,0(s1)
	mv	a0,s0
	call	MineBlock
	lw	a5,776(s1)
	mv	a0,s0
	lw	s0,12(sp)
	addi	a5,a5,1
	lw	ra,16(sp)
	sw	a5,776(s1)
	lw	s1,8(sp)
	addi	sp,sp,20
	tail	GetHash
	.size	AddBlock, .-AddBlock
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
