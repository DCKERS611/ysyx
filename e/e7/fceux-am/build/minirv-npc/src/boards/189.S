#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"189.cpp"
	.option nopic
	.text
	.section	.text._ZL9M189Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M189Powerv, @function
_ZL9M189Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,EXPREGS
	sb	zero,1(a5)
	sb	zero,0(a5)
	call	_Z12GenMMC3Powerv
	lw	ra,8(sp)
	li	a1,32768
	li	a0,16384
	lla	a2,_ZL9M189Writejh
	addi	a1,a1,-1
	addi	a0,a0,288
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL9M189Powerv, .-_ZL9M189Powerv
	.section	.text._ZL9M189Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M189Writejh, @function
_ZL9M189Writejh:
	srli	a5,a1,4
	or	a1,a5,a1
	la a0, MMC3_cmd; lbu a0, 0(a0);
	la a5, EXPREGS; sb a1, 0(a5);
	tail	_Z10FixMMC3PRGi
	.size	_ZL9M189Writejh, .-_ZL9M189Writejh
	.section	.text._ZL6M189PWjh,"ax",@progbits
	.align	2
	.type	_ZL6M189PWjh, @function
_ZL6M189PWjh:
	la a1, EXPREGS; lbu a1, 0(a1);
	andi	a1,a1,7
	li	a0,32768
	tail	_Z8setprg32jj
	.size	_ZL6M189PWjh, .-_ZL6M189PWjh
	.section	.rodata._Z14Mapper189_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.section	.text._Z14Mapper189_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper189_InitP8CartInfo
	.hidden	_Z14Mapper189_InitP8CartInfo
	.type	_Z14Mapper189_InitP8CartInfo, @function
_Z14Mapper189_InitP8CartInfo:
	addi	sp,sp,-12
	li	a3,0
	li	a2,256
	li	a1,256
	li	a4,0
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M189PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL9M189Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC0
	li	a2,0
	li	a1,2
	lla	a0,EXPREGS
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper189_InitP8CartInfo, .-_Z14Mapper189_InitP8CartInfo
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
