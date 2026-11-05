#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"h264bsd_pic_order_cnt.c"
	.option nopic
	.text
	.globl	__udivsi3
	.globl	__umodsi3
	.globl	__mulsi3
	.section	.text.h264bsdDecodePicOrderCnt,"ax",@progbits
	.align	2
	.globl	h264bsdDecodePicOrderCnt
	.hidden	h264bsdDecodePicOrderCnt
	.type	h264bsdDecodePicOrderCnt, @function
h264bsdDecodePicOrderCnt:
	addi	sp,sp,-44
	sw	s0,36(sp)
	lw	s0,284(a2)
	sw	s1,32(sp)
	sw	ra,40(sp)
	mv	s1,a2
	mv	a4,a0
	mv	a2,a1
	beq	s0,zero,.L2
	lw	s0,288(s1)
	beq	s0,zero,.L2
	addi	a5,s1,308
	li	a1,5
	j	.L3
.L54:
	lw	s0,-20(a5)
	beq	s0,zero,.L2
.L3:
	addi	a5,a5,20
	bne	s0,a1,.L54
	li	s0,1
.L2:
	lw	a5,16(a2)
	lw	a0,0(a3)
	beq	a5,zero,.L4
	li	a1,1
	beq	a5,a1,.L5
	li	a5,5
	beq	a0,a5,.L37
	lw	a0,12(s1)
	lw	a1,8(a4)
	lw	a5,12(a4)
	bleu	a1,a0,.L25
	lw	a2,12(a2)
	add	a5,a5,a2
.L25:
	lw	a3,4(a3)
	add	a0,a0,a5
	slli	a0,a0,1
	seqz	a3,a3
	sub	a0,a0,a3
	beq	s0,zero,.L55
.L23:
	sw	zero,12(a4)
	sw	zero,8(a4)
	li	a0,0
.L1:
	lw	ra,40(sp)
	lw	s0,36(sp)
	lw	s1,32(sp)
	addi	sp,sp,44
	jr	ra
.L5:
	li	a5,5
	li	t0,0
	beq	a0,a5,.L14
	lw	a1,8(a4)
	lw	a5,12(s1)
	lw	t0,12(a4)
	bleu	a1,a5,.L14
	lw	a5,12(a2)
	add	t0,t0,a5
.L14:
	lw	a5,4(a3)
	lw	a1,36(a2)
	li	a0,0
	sw	a5,0(sp)
	beq	a1,zero,.L15
	lw	t1,12(s1)
	add	t1,t0,t1
	bne	a5,zero,.L16
	beq	t1,zero,.L34
	addi	t1,t1,-1
.L16:
	beq	t1,zero,.L34
	addi	a5,t1,-1
	mv	a0,a5
	sw	a2,28(sp)
	sw	a4,24(sp)
	sw	t0,20(sp)
	sw	t1,16(sp)
	sw	a1,4(sp)
	sw	a5,8(sp)
	call	__udivsi3
	lw	a5,8(sp)
	lw	a1,4(sp)
	mv	a3,a0
	mv	a0,a5
	sw	a3,8(sp)
	call	__umodsi3
	lw	a1,4(sp)
	lw	t1,16(sp)
	lw	t0,20(sp)
	lw	a4,24(sp)
	lw	a2,28(sp)
	sw	a0,12(sp)
.L17:
	lw	a3,40(a2)
	slli	t2,a1,2
	li	a1,0
	add	t2,t2,a3
	mv	a5,a3
.L19:
	lw	a0,0(a5)
	addi	a5,a5,4
	add	a1,a1,a0
	bne	t2,a5,.L19
	sw	a3,4(sp)
	li	a0,0
	beq	t1,zero,.L15
	lw	a0,8(sp)
	sw	a2,24(sp)
	sw	a4,20(sp)
	sw	t0,16(sp)
	call	__mulsi3
	lw	a5,12(sp)
	lw	a3,4(sp)
	lw	t0,16(sp)
	slli	t1,a5,2
	addi	a5,a3,4
	lw	a4,20(sp)
	lw	a2,24(sp)
	add	t1,t1,a5
	j	.L20
.L56:
	addi	a5,a5,4
.L20:
	lw	a1,0(a3)
	mv	a3,a5
	add	a0,a0,a1
	bne	t1,a5,.L56
.L15:
	lw	a5,0(sp)
	bne	a5,zero,.L21
	lw	a5,28(a2)
	add	a0,a0,a5
.L21:
	lw	a5,32(a2)
	lw	a2,32(s1)
	lw	a3,28(s1)
	add	a5,a5,a2
	add	a0,a0,a3
	blt	a5,zero,.L57
	bne	s0,zero,.L23
.L60:
	lw	a5,12(s1)
	lw	ra,40(sp)
	lw	s0,36(sp)
	sw	t0,12(a4)
	sw	a5,8(a4)
	lw	s1,32(sp)
	addi	sp,sp,44
	jr	ra
.L4:
	li	a1,5
	lw	t1,20(s1)
	beq	a0,a1,.L58
	lw	a5,0(a4)
	lw	a1,4(a4)
	bleu	a5,t1,.L8
	lw	t0,20(a2)
	sub	a0,a5,t1
	srli	t2,t0,1
	bltu	a0,t2,.L8
	add	a1,a1,t0
.L9:
	lw	a3,4(a3)
	lw	a5,24(s1)
	add	a0,t1,a1
	beq	a3,zero,.L10
	sw	a1,4(a4)
	blt	a5,zero,.L59
	beq	s0,zero,.L29
	sw	zero,4(a4)
	sw	zero,0(a4)
	li	a0,0
	j	.L1
.L58:
	sw	zero,4(a4)
	sw	zero,0(a4)
	li	a1,0
.L8:
	bleu	t1,a5,.L9
	lw	a2,20(a2)
	sub	a5,t1,a5
	srli	a0,a2,1
	bleu	a5,a0,.L9
	sub	a1,a1,a2
	j	.L9
.L10:
	bge	a5,zero,.L1
	add	a0,a0,a5
	j	.L1
.L55:
	lw	a3,12(s1)
	lw	ra,40(sp)
	lw	s0,36(sp)
	sw	a5,12(a4)
	sw	a3,8(a4)
	lw	s1,32(sp)
	addi	sp,sp,44
	jr	ra
.L57:
	add	a0,a0,a5
	bne	s0,zero,.L23
	j	.L60
.L37:
	li	a5,0
	li	a0,0
	bne	s0,zero,.L23
	j	.L55
.L59:
	add	a0,a0,a5
	bne	s0,zero,.L30
.L29:
	sw	t1,0(a4)
	j	.L1
.L30:
	neg	a5,a5
	sw	zero,4(a4)
	sw	a5,0(a4)
	li	a0,0
	j	.L1
.L34:
	sw	zero,12(sp)
	sw	zero,8(sp)
	j	.L17
	.size	h264bsdDecodePicOrderCnt, .-h264bsdDecodePicOrderCnt
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
