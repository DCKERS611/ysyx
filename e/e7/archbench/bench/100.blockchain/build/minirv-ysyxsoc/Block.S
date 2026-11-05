#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"Block.c"
	.option nopic
	.text
	.section	.text.initBlock,"ax",@progbits
	.align	2
	.globl	initBlock
	.hidden	initBlock
	.type	initBlock, @function
initBlock:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	li	a4,-1
	li	a5,-1
	mv	s0,a0
	sw	a1,16(a0)
	sw	a2,8(a0)
	sw	a4,0(a0)
	sw	a5,4(a0)
	call	bench_rand
	sb	zero,24(s0)
	lw	ra,8(sp)
	sw	a0,20(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	initBlock, .-initBlock
	.section	.text.GetHash,"ax",@progbits
	.align	2
	.globl	GetHash
	.hidden	GetHash
	.type	GetHash, @function
GetHash:
	addi	a0,a0,24
	ret
	.size	GetHash, .-GetHash
	.section	.rodata.MineBlock.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"%d%d%s%lld%s"
	.align	2
.LC1:
	.string	"Block mined: %s\n"
	.section	.text.MineBlock,"ax",@progbits
	.align	2
	.globl	MineBlock
	.hidden	MineBlock
	.type	MineBlock, @function
MineBlock:
	addi	sp,sp,-40
	mv	t0,a0
	addi	a0,a1,1
	sw	t0,8(sp)
	sw	ra,36(sp)
	sw	s0,32(sp)
	sw	s1,28(sp)
	mv	s0,a1
	sw	a1,16(sp)
	call	malloc
	mv	a2,s0
	li	a1,48
	mv	s1,a0
	sw	a0,12(sp)
	call	memset
	lw	t0,8(sp)
	add	a5,s1,s0
	sb	zero,0(a5)
	addi	s0,t0,24
	lla	s1,.LANCHOR0
.L6:
	lw	t1,0(t0)
	lw	a0,4(t0)
	lw	a1,12(t0)
	addi	a5,t1,1
	sltu	t1,a5,t1
	lw	a2,16(t0)
	lw	a4,8(t0)
	lw	a3,20(t0)
	add	t1,t1,a0
	sw	a5,0(t0)
	sw	t1,4(t0)
	sw	t1,0(sp)
	sw	a1,4(sp)
	mv	a0,s1
	lla	a1,.LC0
	sw	t0,8(sp)
	sw	a5,20(sp)
	sw	t1,24(sp)
	call	sprintf
	mv	a1,s1
	mv	a0,s0
	call	sha256
	lw	a2,16(sp)
	lw	a1,12(sp)
	mv	a0,s0
	call	memcmp
	lw	t0,8(sp)
	bne	a0,zero,.L6
	mv	a1,s0
	lla	a0,.LC1
	call	printf
	lw	s0,32(sp)
	lw	a0,12(sp)
	lw	ra,36(sp)
	lw	s1,28(sp)
	addi	sp,sp,40
	tail	free
	.size	MineBlock, .-MineBlock
	.section	.bss.str.0,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	str.0, @object
	.size	str.0, 1024
str.0:
	.zero	1024
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
