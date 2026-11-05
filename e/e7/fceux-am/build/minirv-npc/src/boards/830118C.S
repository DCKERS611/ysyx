#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"830118C.cpp"
	.option nopic
	.text
	.section	.text._ZL15BMC830118CResetv,"ax",@progbits
	.align	2
	.type	_ZL15BMC830118CResetv, @function
_ZL15BMC830118CResetv:
	la a5, EXPREGS; sb zero, 0(a5);
	tail	_Z12MMC3RegResetv
	.size	_ZL15BMC830118CResetv, .-_ZL15BMC830118CResetv
	.section	.text._ZL15BMC830118CPowerv,"ax",@progbits
	.align	2
	.type	_ZL15BMC830118CPowerv, @function
_ZL15BMC830118CPowerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a5, EXPREGS; sb zero, 0(a5);
	call	_Z12GenMMC3Powerv
	lw	ra,8(sp)
	li	a0,28672
	addi	a1,a0,-1793
	lla	a2,_ZL17BMC830118CLoWritejh
	addi	a0,a0,-2048
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL15BMC830118CPowerv, .-_ZL15BMC830118CPowerv
	.section	.text._ZL17BMC830118CLoWritejh,"ax",@progbits
	.align	2
	.type	_ZL17BMC830118CLoWritejh, @function
_ZL17BMC830118CLoWritejh:
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
	.size	_ZL17BMC830118CLoWritejh, .-_ZL17BMC830118CLoWritejh
	.section	.text._ZL12BMC830118CCWjh,"ax",@progbits
	.align	2
	.type	_ZL12BMC830118CCWjh, @function
_ZL12BMC830118CCWjh:
	la a5, EXPREGS; lbu a5, 0(a5);
	slli	a5,a5,5
	andi	a5,a5,384
	andi	a1,a1,127
	or	a1,a5,a1
	tail	_Z7setchr1jj
	.size	_ZL12BMC830118CCWjh, .-_ZL12BMC830118CCWjh
	.section	.text._ZL12BMC830118CPWjh,"ax",@progbits
	.align	2
	.type	_ZL12BMC830118CPWjh, @function
_ZL12BMC830118CPWjh:
	addi	sp,sp,-12
	la a5, EXPREGS; lbu a5, 0(a5);
	sw	s0,4(sp)
	sw	ra,8(sp)
	andi	a2,a5,12
	li	a3,12
	mv	s0,a1
	bne	a2,a3,.L9
	li	a3,32768
	beq	a0,a3,.L14
	li	a3,40960
	beq	a0,a3,.L15
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L9:
	slli	a5,a5,2
	andi	a5,a5,48
	andi	a1,a1,15
	or	a1,a5,a1
.L13:
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z7setprg8jj
.L14:
	slli	a5,a5,2
	andi	a5,a5,48
	andi	a1,a1,15
	or	a1,a5,a1
	call	_Z7setprg8jj
	andi	a1,s0,13
	lw	s0,4(sp)
	lw	ra,8(sp)
	ori	a1,a1,50
	li	a0,49152
	addi	sp,sp,12
	tail	_Z7setprg8jj
.L15:
	slli	a5,a5,2
	andi	a5,a5,48
	andi	a1,a1,15
	or	a1,a5,a1
	call	_Z7setprg8jj
	andi	a1,s0,13
	ori	a1,a1,50
	li	a0,57344
	j	.L13
	.size	_ZL12BMC830118CPWjh, .-_ZL12BMC830118CPWjh
	.section	.rodata._Z15BMC830118C_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.section	.text._Z15BMC830118C_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z15BMC830118C_InitP8CartInfo
	.hidden	_Z15BMC830118C_InitP8CartInfo
	.type	_Z15BMC830118C_InitP8CartInfo, @function
_Z15BMC830118C_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,8
	li	a2,128
	li	a1,128
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL12BMC830118CPWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL12BMC830118CCWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL15BMC830118CPowerv
	sw	a5,0(s0)
	lla	a5,_ZL15BMC830118CResetv
	sw	a5,4(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,EXPREGS
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z15BMC830118C_InitP8CartInfo, .-_Z15BMC830118C_InitP8CartInfo
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
