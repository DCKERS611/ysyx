#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"h264bsd_byte_stream.c"
	.option nopic
	.text
	.section	.text.h264bsdExtractNalUnit,"ax",@progbits
	.align	2
	.globl	h264bsdExtractNalUnit
	.hidden	h264bsdExtractNalUnit
	.type	h264bsdExtractNalUnit, @function
h264bsdExtractNalUnit:
	addi	sp,sp,-20
	sw	s0,16(sp)
	sw	s1,12(sp)
	li	a4,3
	mv	a5,a0
	bleu	a1,a4,.L2
	lbu	a4,0(a0)
	beq	a4,zero,.L48
.L2:
	sw	a1,12(a2)
	sw	a5,0(a2)
	sw	a5,4(a2)
	sw	zero,8(a2)
	sw	zero,16(a2)
	sw	a1,0(a3)
.L14:
	lw	a1,12(a2)
	mv	a3,a5
	li	a0,0
	addi	a4,a1,-1
	li	t2,2
	li	t0,3
	beq	a1,zero,.L17
.L16:
	lbu	a1,0(a5)
	beq	a1,zero,.L21
.L49:
	sb	a1,0(a3)
	addi	a5,a5,1
	addi	a3,a3,1
	addi	a1,a4,-1
	beq	a4,zero,.L22
	mv	a4,a1
	lbu	a1,0(a5)
	li	a0,0
	bne	a1,zero,.L49
.L21:
	sb	zero,0(a3)
	addi	a0,a0,1
	addi	a3,a3,1
	addi	s0,a5,1
	addi	t1,a4,-1
	beq	a4,zero,.L50
	bne	a0,t2,.L45
	lbu	a1,1(a5)
	beq	a1,t0,.L51
	bleu	a1,a0,.L20
.L45:
	mv	a4,t1
	mv	a5,s0
	j	.L16
.L51:
	beq	t1,zero,.L20
	lbu	a1,2(a5)
	bgtu	a1,t0,.L20
	addi	a5,a5,2
	addi	a4,a4,-2
	li	a0,0
	j	.L16
.L48:
	lbu	a4,1(a0)
	bne	a4,zero,.L2
	lbu	a0,2(a0)
	andi	a4,a0,254
	bne	a4,zero,.L2
	addi	t0,a5,3
	li	a4,3
	li	t1,2
	li	s0,1
	j	.L3
.L53:
	addi	t1,t1,1
.L6:
	addi	a4,a4,1
	addi	t0,t0,1
	lbu	a0,-1(t0)
	beq	a1,a4,.L52
.L3:
	addi	t2,a4,-1
	beq	a0,zero,.L53
	beq	a0,s0,.L54
.L26:
	li	t1,0
	j	.L6
.L50:
	mv	a5,s0
.L22:
	lw	a1,12(a2)
	sub	a5,a5,a3
	sub	a1,a1,a5
.L17:
	sw	a1,12(a2)
	li	a0,0
.L1:
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,20
	jr	ra
.L20:
	lw	s0,16(sp)
	lw	s1,12(sp)
	li	a0,1
	addi	sp,sp,20
	jr	ra
.L54:
	bleu	t1,a0,.L26
	sw	a5,0(sp)
	li	s0,0
	li	a0,0
	li	t1,0
	sw	t2,8(sp)
	mv	a5,a4
	sw	a3,4(sp)
.L13:
	sub	t2,a5,a4
	add	t2,t0,t2
	lbu	t2,0(t2)
	mv	s1,a5
	addi	a5,a5,1
	bne	t2,zero,.L7
	addi	t1,t1,1
.L8:
	bne	a1,a5,.L13
	lw	t2,8(sp)
	lw	a5,0(sp)
	lw	a3,4(sp)
	sub	a1,s1,t2
	sub	a1,a1,t1
.L12:
	add	a5,a5,a4
	add	t1,a1,t1
	sw	a1,12(a2)
	sw	a5,0(a2)
	sw	a5,4(a2)
	sw	zero,8(a2)
	sw	zero,16(a2)
	add	t1,t1,a4
	sw	t1,0(a3)
	bne	s0,zero,.L20
	bne	a0,zero,.L14
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,20
	jr	ra
.L52:
	sw	a1,0(a3)
	li	a0,1
	j	.L1
.L7:
	li	a3,3
	bne	t2,a3,.L9
	li	a3,2
	beq	t1,a3,.L55
.L10:
	li	a3,2
	bleu	t1,a3,.L44
	li	s0,1
.L44:
	li	t1,0
	j	.L8
.L9:
	li	a3,1
	bne	t2,a3,.L10
	li	a3,1
	bleu	t1,a3,.L44
	sub	a1,s1,a4
	li	t2,3
	lw	a5,0(sp)
	lw	a3,4(sp)
	sub	a1,a1,t1
	mv	t0,t1
	bleu	t1,t2,.L11
	li	t0,3
.L11:
	sub	t1,t1,t0
	j	.L12
.L55:
	li	a0,1
	li	t1,0
	j	.L8
	.size	h264bsdExtractNalUnit, .-h264bsdExtractNalUnit
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
