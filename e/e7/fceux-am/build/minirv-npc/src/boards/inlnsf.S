#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"inlnsf.cpp"
	.option nopic
	.text
	.section	.text._ZL8M31Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M31Writejh, @function
_ZL8M31Writejh:
	li	a5,-20480
	add	a5,a0,a5
	li	a4,4096
	bltu	a5,a4,.L10
	ret
.L10:
	addi	sp,sp,-12
	lla	a5,.LANCHOR0
	andi	a0,a0,7
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	add	a0,a5,a0
	sb	a1,0(a0)
	mv	s1,a5
	li	s0,32768
.L3:
	lbu	a1,0(s1)
	mv	a0,s0
	li	a5,4096
	add	s0,s0,a5
	call	_Z7setprg4jj
	li	a4,65536
	addi	s1,s1,1
	bne	s0,a4,.L3
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL8M31Writejh, .-_ZL8M31Writejh
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	lla	s1,.LANCHOR0
	li	s0,32768
.L12:
	lbu	a1,0(s1)
	mv	a0,s0
	li	a5,4096
	add	s0,s0,a5
	call	_Z7setprg4jj
	li	a4,65536
	addi	s1,s1,1
	bne	s0,a4,.L12
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M31Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M31Powerv, @function
_ZL8M31Powerv:
	addi	sp,sp,-12
	li	a0,0
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	call	_Z7setchr8j
	lla	a5,.LANCHOR0
	li	a4,-1
	sb	a4,7(a5)
	mv	s1,a5
	li	s0,32768
.L16:
	lbu	a1,0(s1)
	mv	a0,s0
	li	a5,4096
	add	s0,s0,a5
	call	_Z7setprg4jj
	li	a4,65536
	addi	s1,s1,1
	bne	s0,a4,.L16
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a1,24576
	lla	a2,_ZL8M31Writejh
	addi	a1,a1,-1
	li	a0,20480
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL8M31Powerv, .-_ZL8M31Powerv
	.section	.text._Z13Mapper31_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper31_InitP8CartInfo
	.hidden	_Z13Mapper31_InitP8CartInfo
	.type	_Z13Mapper31_InitP8CartInfo, @function
_Z13Mapper31_InitP8CartInfo:
	lla	a5,_ZL8M31Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR1
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper31_InitP8CartInfo, .-_Z13Mapper31_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REGS"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL4regs
	.word	8
	.word	.LC0
	.word	0
	.zero	8
	.section	.sbss._ZL4regs,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4regs, @object
	.size	_ZL4regs, 8
_ZL4regs:
	.zero	8
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
