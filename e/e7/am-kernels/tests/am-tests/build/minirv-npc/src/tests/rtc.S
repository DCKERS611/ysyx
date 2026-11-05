#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"rtc.c"
	.option nopic
	.text
	.globl	__udivdi3
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
	addi	sp,sp,-56
	sw	s0,48(sp)
	li	a5,1
	addi	s0,sp,39
	sw	s1,44(sp)
	sw	ra,52(sp)
	andi	s0,s0,-8
	sw	a5,4(sp)
	li	s1,0
.L8:
	mv	a1,s0
	li	a0,6
	call	ioe_read
	lw	a0,0(s0)
	lw	a1,4(s0)
	li	a2,999424
	addi	a2,a2,576
	li	a3,0
	call	__udivdi3
	bgtu	s1,a1,.L8
	bne	s1,a1,.L7
	lw	a5,4(sp)
	bgtu	a5,a0,.L8
.L7:
	addi	a1,sp,8
	li	a0,5
	call	ioe_read
	lw	a0,28(sp)
	lw	a5,24(sp)
	lw	a4,20(sp)
	lw	a1,8(sp)
	lw	a3,16(sp)
	lw	a2,12(sp)
	sw	a0,0(sp)
	lla	a0,.LC0
	call	printf
	lw	a4,4(sp)
	li	a5,1
	li	a1,1
	lla	a0,.LC1
	beq	a4,a5,.L10
	lw	a1,4(sp)
	lla	a0,.LC2
.L10:
	call	printf
	lw	a4,4(sp)
	addi	a5,a4,1
	sltu	a4,a5,a4
	add	s1,a4,s1
	sw	a5,4(sp)
	j	.L8
	.size	rtc_test, .-rtc_test
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
