#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"rtc.c"
	.option nopic
	.text
	.section	.rodata.rtc_test.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"%d-%d-%d %02d:%02d:%02d GMT ("
	.align	2
.LC1:
	.string	"%d second).\n"
	.align	2
.LC2:
	.string	"%d seconds).\n"
	.section	.text.rtc_test,"ax",@progbits
	.align	2
	.globl	rtc_test
	.hidden	rtc_test
	.type	rtc_test, @function
rtc_test:
	addi	sp,sp,-68
	addi	t1,sp,51
	sw	s1,56(sp)
	andi	s1,t1,-8
	mv	a1,s1
	li	a0,6
	sw	s0,60(sp)
	sw	ra,64(sp)
	call	ioe_read
	lw	a5,0(s1)
	li	s0,0
	sw	a5,4(sp)
	lw	a5,4(s1)
	sw	a5,8(sp)
	li	a5,999424
	addi	a5,a5,576
	sw	a5,16(sp)
	li	a5,1
	sw	a5,12(sp)
.L8:
	mv	a1,s1
	li	a0,6
	call	ioe_read
	lw	a4,0(s1)
	lw	a3,4(sp)
	lw	a5,4(s1)
	lw	a2,8(sp)
	sub	a3,a4,a3
	sgtu	a4,a3,a4
	sub	a5,a5,a2
	sub	a5,a5,a4
	bgtu	s0,a5,.L8
	bne	s0,a5,.L7
	lw	a5,16(sp)
	bgtu	a5,a3,.L8
.L7:
	addi	a1,sp,20
	li	a0,5
	call	ioe_read
	lw	a0,40(sp)
	lw	a5,36(sp)
	lw	a4,32(sp)
	lw	a1,20(sp)
	lw	a3,28(sp)
	lw	a2,24(sp)
	sw	a0,0(sp)
	lla	a0,.LC0
	call	printf
	lw	a4,12(sp)
	li	a5,1
	li	a1,1
	lla	a0,.LC1
	beq	a4,a5,.L10
	lw	a1,12(sp)
	lla	a0,.LC2
.L10:
	call	printf
	lw	a4,16(sp)
	lw	a3,12(sp)
	li	a5,999424
	addi	a5,a5,576
	add	a5,a4,a5
	sltu	a4,a5,a4
	addi	a3,a3,1
	sw	a3,12(sp)
	sw	a5,16(sp)
	add	s0,a4,s0
	j	.L8
	.size	rtc_test, .-rtc_test
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
