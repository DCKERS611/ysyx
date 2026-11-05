#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"tree.c"
	.option nopic
	.text
	.section	.rodata.treeinsert.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `sz > sizeof(*n)' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/tree.c:79  \n"
	.section	.text.treeinsert,"ax",@progbits
	.align	2
	.globl	treeinsert
	.hidden	treeinsert
	.type	treeinsert, @function
treeinsert:
	lw	t2,0(a0)
	addi	sp,sp,-220
	sw	s1,208(sp)
	sw	a0,16(sp)
	sw	ra,216(sp)
	sw	s0,212(sp)
	mv	s1,a2
	mv	a0,a3
	beq	t2,zero,.L33
	addi	t1,sp,20
	li	s0,1
.L7:
	lw	a3,0(t2)
	lw	a4,4(t2)
	beq	a3,a1,.L47
.L3:
	li	a5,1
	bgtu	s1,a4,.L5
	beq	s1,a4,.L48
.L6:
	li	a5,0
.L5:
	addi	a4,a5,2
	slli	a5,a5,2
	slli	a4,a4,2
	add	a5,t2,a5
	add	a4,t2,a4
	lw	t2,8(a5)
	sw	a4,0(t1)
	addi	s0,s0,1
	addi	t1,t1,4
	bne	t2,zero,.L7
.L2:
	li	a5,24
	bleu	a0,a5,.L49
	sw	a1,0(sp)
	call	xmalloc
	addi	a5,s0,-1
	slli	a5,a5,2
	addi	a4,sp,16
	addi	a5,a5,192
	add	a5,a5,a4
	lw	a1,0(sp)
	slli	s0,s0,2
	li	a4,1
	lw	a5,-192(a5)
	sw	a4,16(a0)
	addi	a3,sp,16
	addi	a4,s0,192
	sw	a1,0(a0)
	sw	s1,4(a0)
	sw	zero,12(a0)
	sw	zero,8(a0)
	add	s0,a4,a3
	sw	a0,0(a5)
	addi	s0,s0,-200
	sw	a0,12(sp)
	j	.L27
.L15:
	sgt	a2,a5,a1
	slli	a2,a2,2
	add	t2,a4,a2
	lw	t1,8(t2)
	sgt	a5,a5,a1
	xori	a5,a5,1
	slli	a5,a5,2
	sw	a5,8(sp)
	add	a5,t1,a5
	lw	a1,8(a5)
	sw	a5,4(sp)
	add	a3,t1,a2
	lw	a5,8(a3)
	beq	a1,zero,.L23
	lw	t0,16(a1)
	sw	zero,0(sp)
	addi	a3,t0,1
	beq	a5,zero,.L24
.L29:
	lw	a5,16(a5)
	sw	a5,0(sp)
.L24:
	lw	a5,0(sp)
	bge	a5,t0,.L25
	lw	a5,8(sp)
	add	a2,a1,a2
	sw	a2,0(sp)
	add	a5,a1,a5
	lw	a2,8(a5)
	sw	a2,8(t2)
	lw	a2,0(sp)
	lw	t2,8(a2)
	lw	a2,4(sp)
	sw	t2,8(a2)
	sw	a4,8(a5)
	lw	a5,0(sp)
	sw	t1,8(a5)
	sw	t0,16(a4)
	sw	t0,16(t1)
	sw	a3,16(a1)
.L26:
	sw	a1,0(a0)
	sub	a3,a3,s1
	addi	s0,s0,-4
	beq	a3,zero,.L45
.L27:
	addi	a5,sp,12
	beq	a5,s0,.L45
	lw	a0,0(s0)
	lw	a4,0(a0)
	lw	a3,8(a4)
	lw	s1,16(a4)
	lw	a5,12(a4)
	beq	a3,zero,.L13
	lw	a1,16(a3)
	beq	a5,zero,.L34
.L31:
	lw	a5,16(a5)
	sub	a3,a1,a5
.L14:
	addi	a3,a3,1
	li	a2,2
	bgtu	a3,a2,.L15
	addi	a3,a1,1
	ble	a5,a1,.L17
	addi	a3,a5,1
.L17:
	sw	a3,16(a4)
	sub	a3,a3,s1
	addi	s0,s0,-4
	bne	a3,zero,.L27
.L45:
	lw	t2,12(sp)
	lw	ra,216(sp)
	lw	s0,212(sp)
	li	a5,1
	sb	a5,20(t2)
	lw	s1,208(sp)
	mv	a0,t2
	addi	sp,sp,220
	jr	ra
.L48:
	bgtu	a1,a3,.L5
	j	.L6
.L13:
	li	a1,0
	li	a3,1
	bne	a5,zero,.L31
	j	.L17
.L34:
	mv	a3,a1
	li	a5,0
	j	.L14
.L25:
	mv	a5,a3
	addi	a3,t0,2
.L30:
	lw	a2,4(sp)
	sw	a1,8(t2)
	mv	a1,t1
	sw	a4,8(a2)
	sw	a5,16(a4)
	sw	a3,16(t1)
	j	.L26
.L23:
	li	a3,1
	li	t0,0
	bne	a5,zero,.L29
	li	a3,2
	li	a5,1
	j	.L30
.L47:
	bne	a4,s1,.L3
	lw	ra,216(sp)
	lw	s0,212(sp)
	sb	zero,20(t2)
	lw	s1,208(sp)
	mv	a0,t2
	addi	sp,sp,220
	jr	ra
.L33:
	li	s0,1
	j	.L2
.L49:
	lla	s0,.LC0
	li	a0,65
.L9:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L9
	lla	s0,.LC1
	li	a0,65
.L10:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L10
	lla	s0,.LC2
	li	a0,32
.L11:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L11
	li	a0,1
	call	halt
	.size	treeinsert, .-treeinsert
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
