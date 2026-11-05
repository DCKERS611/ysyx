#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"8in1.cpp"
	.option nopic
	.text
	.section	.text._ZL12BMC8IN1Powerv,"ax",@progbits
	.align	2
	.type	_ZL12BMC8IN1Powerv, @function
_ZL12BMC8IN1Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a5, EXPREGS; sb zero, 0(a5);
	call	_Z12GenMMC3Powerv
	lw	ra,8(sp)
	li	a1,65536
	lla	a2,_ZL12BMC8IN1Writejh
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL12BMC8IN1Powerv, .-_ZL12BMC8IN1Powerv
	.section	.text._ZL9BMC8IN1PWjh,"ax",@progbits
	.align	2
	.type	_ZL9BMC8IN1PWjh, @function
_ZL9BMC8IN1PWjh:
	la a5, EXPREGS; lbu a5, 0(a5);
	andi	a4,a5,16
	beq	a4,zero,.L5
	slli	a5,a5,2
	andi	a5,a5,48
	andi	a1,a1,15
	or	a1,a5,a1
	tail	_Z7setprg8jj
.L5:
	andi	a1,a5,15
	li	a0,32768
	tail	_Z8setprg32jj
	.size	_ZL9BMC8IN1PWjh, .-_ZL9BMC8IN1PWjh
	.section	.text._ZL9BMC8IN1CWjh,"ax",@progbits
	.align	2
	.type	_ZL9BMC8IN1CWjh, @function
_ZL9BMC8IN1CWjh:
	la a5, EXPREGS; lbu a5, 0(a5);
	slli	a5,a5,5
	andi	a5,a5,384
	andi	a1,a1,127
	or	a1,a5,a1
	tail	_Z7setchr1jj
	.size	_ZL9BMC8IN1CWjh, .-_ZL9BMC8IN1CWjh
	.section	.text._ZL12BMC8IN1Writejh,"ax",@progbits
	.align	2
	.type	_ZL12BMC8IN1Writejh, @function
_ZL12BMC8IN1Writejh:
	li	a4,4096
	and	a4,a0,a4
	bne	a4,zero,.L13
	li	a4,49152
	bgeu	a0,a4,.L9
	tail	_Z13MMC3_CMDWritejh
.L9:
	tail	_Z13MMC3_IRQWritejh
.L13:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	sw	ra,8(sp)
	la a5, EXPREGS; sb a1, 0(a5);
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
	.size	_ZL12BMC8IN1Writejh, .-_ZL12BMC8IN1Writejh
	.section	.rodata._Z12BMC8IN1_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.section	.text._Z12BMC8IN1_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12BMC8IN1_InitP8CartInfo
	.hidden	_Z12BMC8IN1_InitP8CartInfo
	.type	_Z12BMC8IN1_InitP8CartInfo, @function
_Z12BMC8IN1_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,0
	li	a2,128
	li	a1,128
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL9BMC8IN1CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL9BMC8IN1PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL12BMC8IN1Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,EXPREGS
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z12BMC8IN1_InitP8CartInfo, .-_Z12BMC8IN1_InitP8CartInfo
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
