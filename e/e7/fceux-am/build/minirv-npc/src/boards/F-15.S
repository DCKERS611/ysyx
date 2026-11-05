#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"F-15.cpp"
	.option nopic
	.text
	.section	.text._ZL11BMCF15Powerv,"ax",@progbits
	.align	2
	.type	_ZL11BMCF15Powerv, @function
_ZL11BMCF15Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z12GenMMC3Powerv
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_ZL11BMCF15Writejh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL11BMCF15Writejh
	li	a0,24576
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL11BMCF15Powerv, .-_ZL11BMCF15Powerv
	.section	.text._ZL8BMCF15PWjh,"ax",@progbits
	.align	2
	.type	_ZL8BMCF15PWjh, @function
_ZL8BMCF15PWjh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	la s0, EXPREGS; lbu s0, 0(s0);
	sw	s1,0(sp)
	srli	s1,s0,3
	andi	s1,s1,1
	andi	s0,s0,15
	not	a1,s1
	and	a1,a1,s0
	li	a0,32768
	sw	ra,8(sp)
	call	_Z8setprg16jj
	or	a1,s0,s1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,49152
	addi	sp,sp,12
	tail	_Z8setprg16jj
	.size	_ZL8BMCF15PWjh, .-_ZL8BMCF15PWjh
	.section	.text._ZL11BMCF15Writejh,"ax",@progbits
	.align	2
	.type	_ZL11BMCF15Writejh, @function
_ZL11BMCF15Writejh:
	la a5, A001B; lb a5, 0(a5);
	blt	a5,zero,.L8
	ret
.L8:
	andi	a1,a1,15
	la a0, MMC3_cmd; lbu a0, 0(a0);
	la a5, EXPREGS; sb a1, 0(a5);
	tail	_Z10FixMMC3PRGi
	.size	_ZL11BMCF15Writejh, .-_ZL11BMCF15Writejh
	.section	.rodata._Z11BMCF15_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.section	.text._Z11BMCF15_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11BMCF15_InitP8CartInfo
	.hidden	_Z11BMCF15_InitP8CartInfo
	.type	_Z11BMCF15_InitP8CartInfo, @function
_Z11BMCF15_InitP8CartInfo:
	addi	sp,sp,-12
	li	a3,0
	li	a2,256
	li	a1,256
	li	a4,0
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL8BMCF15PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL11BMCF15Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,EXPREGS
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z11BMCF15_InitP8CartInfo, .-_Z11BMCF15_InitP8CartInfo
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
