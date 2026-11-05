#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"h264bsd_stream.c"
	.option nopic
	.text
	.section	.text.h264bsdShowBits32,"ax",@progbits
	.align	2
	.globl	h264bsdShowBits32
	.hidden	h264bsdShowBits32
	.type	h264bsdShowBits32, @function
h264bsdShowBits32:
	lw	a3,12(a0)
	lw	a4,16(a0)
	li	a2,31
	slli	a3,a3,3
	sub	a3,a3,a4
	mv	a5,a0
	lw	a4,4(a0)
	bgt	a3,a2,.L11
	li	a0,0
	ble	a3,zero,.L1
	lw	a2,8(a5)
	lbu	a0,0(a4)
	addi	a4,a4,1
	addi	a1,a2,-8
	addi	a5,a2,24
	add	a3,a1,a3
	sll	a0,a0,a5
	ble	a3,zero,.L1
	addi	a3,a3,-1
	addi	a2,a2,16
	andi	a3,a3,-8
	sub	a2,a2,a3
.L4:
	lbu	a3,0(a4)
	addi	a5,a5,-8
	addi	a4,a4,1
	sll	a3,a3,a5
	or	a0,a0,a3
	bne	a2,a5,.L4
.L1:
	ret
.L11:
	lbu	a0,0(a4)
	lbu	a2,1(a4)
	lbu	a1,3(a4)
	lbu	a3,2(a4)
	slli	a0,a0,24
	slli	a2,a2,16
	lw	a5,8(a5)
	or	a0,a0,a2
	or	a0,a0,a1
	slli	a3,a3,8
	or	a0,a0,a3
	beq	a5,zero,.L1
	lbu	a4,4(a4)
	li	a3,8
	sub	a3,a3,a5
	srl	a4,a4,a3
	sll	a5,a0,a5
	or	a0,a4,a5
	ret
	.size	h264bsdShowBits32, .-h264bsdShowBits32
	.section	.text.h264bsdGetBits,"ax",@progbits
	.align	2
	.globl	h264bsdGetBits
	.hidden	h264bsdGetBits
	.type	h264bsdGetBits, @function
h264bsdGetBits:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	mv	s1,a1
	sw	ra,8(sp)
	call	h264bsdShowBits32
	lw	a5,16(s0)
	lw	a4,12(s0)
	add	a5,s1,a5
	andi	a3,a5,7
	sw	a5,16(s0)
	sw	a3,8(s0)
	slli	a4,a4,3
	bgtu	a5,a4,.L14
	lw	a4,0(s0)
	srli	a5,a5,3
	lw	ra,8(sp)
	add	a5,a4,a5
	sw	a5,4(s0)
	lw	s0,4(sp)
	li	a3,32
	sub	a3,a3,s1
	srl	a0,a0,a3
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L14:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,-1
	addi	sp,sp,12
	jr	ra
	.size	h264bsdGetBits, .-h264bsdGetBits
	.section	.text.h264bsdFlushBits,"ax",@progbits
	.align	2
	.globl	h264bsdFlushBits
	.hidden	h264bsdFlushBits
	.type	h264bsdFlushBits, @function
h264bsdFlushBits:
	lw	a3,16(a0)
	lw	a4,12(a0)
	mv	a5,a0
	add	a1,a1,a3
	andi	a3,a1,7
	sw	a1,16(a0)
	sw	a3,8(a0)
	slli	a4,a4,3
	bgtu	a1,a4,.L18
	lw	a4,0(a0)
	srli	a1,a1,3
	li	a0,0
	add	a4,a4,a1
	sw	a4,4(a5)
	ret
.L18:
	li	a0,-1
	ret
	.size	h264bsdFlushBits, .-h264bsdFlushBits
	.section	.text.h264bsdIsByteAligned,"ax",@progbits
	.align	2
	.globl	h264bsdIsByteAligned
	.hidden	h264bsdIsByteAligned
	.type	h264bsdIsByteAligned, @function
h264bsdIsByteAligned:
	lw	a0,8(a0)
	seqz	a0,a0
	ret
	.size	h264bsdIsByteAligned, .-h264bsdIsByteAligned
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
