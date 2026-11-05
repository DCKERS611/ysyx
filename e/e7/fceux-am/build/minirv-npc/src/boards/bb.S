#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"bb.cpp"
	.option nopic
	.text
	.section	.text._ZL10UNLBBPowerv,"ax",@progbits
	.align	2
	.type	_ZL10UNLBBPowerv, @function
_ZL10UNLBBPowerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	li	a5,-1
	lla	s0,.LANCHOR0
	li	a1,3
	li	a0,24576
	la a4, .LANCHOR1; sb a5, 0(a4);
	sb	zero,0(s0)
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,32768
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	li	s0,65536
	andi	a0,a0,3
	call	_Z7setchr8j
	li	a1,32768
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL10UNLBBWritejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL10UNLBBPowerv, .-_ZL10UNLBBPowerv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	la a1, .LANCHOR1; lbu a1, 0(a1);
	addi	sp,sp,-12
	andi	a1,a1,3
	li	a0,24576
	sw	ra,8(sp)
	call	_Z7setprg8jj
	li	a0,32768
	li	a1,-1
	call	_Z8setprg32jj
	lw	ra,8(sp)
	la a0, .LANCHOR0; lbu a0, 0(a0);
	andi	a0,a0,3
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL10UNLBBWritejh,"ax",@progbits
	.align	2
	.type	_ZL10UNLBBWritejh, @function
_ZL10UNLBBWritejh:
	addi	sp,sp,-12
	li	a5,36864
	and	a0,a0,a5
	sw	ra,8(sp)
	sw	s0,4(sp)
	li	a5,32768
	beq	a0,a5,.L10
	andi	a1,a1,1
	lla	s0,.LANCHOR0
	sb	a1,0(s0)
	la a1, .LANCHOR1; lbu a1, 0(a1);
.L8:
	andi	a1,a1,3
	li	a0,24576
	call	_Z7setprg8jj
	li	a0,32768
	li	a1,-1
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a0,a0,3
	addi	sp,sp,12
	tail	_Z7setchr8j
.L10:
	lla	s0,.LANCHOR0
	sb	a1,0(s0)
	la a5, .LANCHOR1; sb a1, 0(a5);
	j	.L8
	.size	_ZL10UNLBBWritejh, .-_ZL10UNLBBWritejh
	.section	.text._Z10UNLBB_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10UNLBB_InitP8CartInfo
	.hidden	_Z10UNLBB_InitP8CartInfo
	.type	_Z10UNLBB_InitP8CartInfo, @function
_Z10UNLBB_InitP8CartInfo:
	lla	a5,_ZL10UNLBBPowerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR2
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z10UNLBB_InitP8CartInfo, .-_Z10UNLBB_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REG"
	.align	2
.LC1:
	.string	"CHR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL3reg
	.word	1
	.word	.LC0
	.word	_ZL3chr
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL3chr,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL3chr, @object
	.size	_ZL3chr, 1
_ZL3chr:
	.zero	1
	.section	.sbss._ZL3reg,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
