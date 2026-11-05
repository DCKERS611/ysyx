#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"41.cpp"
	.option nopic
	.text
	.section	.text._ZL9M41Write1jh,"ax",@progbits
	.align	2
	.type	_ZL9M41Write1jh, @function
_ZL9M41Write1jh:
	la a1, .LANCHOR0; lbu a1, 0(a1);
	andi	a5,a1,4
	bne	a5,zero,.L7
	ret
.L7:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR1
	lbu	a5,0(s0)
	andi	a0,a0,3
	andi	a1,a1,7
	andi	a5,a5,12
	or	a5,a5,a0
	li	a0,32768
	sw	ra,8(sp)
	sb	a5,0(s0)
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	call	_Z7setchr8j
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR2; lbu a0, 0(a0);
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL9M41Write1jh, .-_ZL9M41Write1jh
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	la a1, .LANCHOR0; lbu a1, 0(a1);
	addi	sp,sp,-12
	andi	a1,a1,7
	li	a0,32768
	sw	ra,8(sp)
	call	_Z8setprg32jj
	la a0, .LANCHOR1; lbu a0, 0(a0);
	call	_Z7setchr8j
	lw	ra,8(sp)
	la a0, .LANCHOR2; lbu a0, 0(a0);
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M41Write0jh,"ax",@progbits
	.align	2
	.type	_ZL9M41Write0jh, @function
_ZL9M41Write0jh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR1
	lbu	a5,0(s0)
	srli	a4,a0,5
	srli	a2,a0,1
	andi	a3,a0,0xff
	andi	a2,a2,12
	xori	a4,a4,1
	andi	a5,a5,3
	sw	s1,0(sp)
	or	a5,a5,a2
	lla	s1,.LANCHOR2
	andi	a4,a4,1
	andi	a1,a3,7
	li	a0,32768
	sw	ra,8(sp)
	sb	a4,0(s1)
	sb	a5,0(s0)
	la a2, .LANCHOR0; sb a3, 0(a2);
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	call	_Z7setchr8j
	lw	s0,4(sp)
	lbu	a0,0(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL9M41Write0jh, .-_ZL9M41Write0jh
	.section	.text._ZL8M41Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M41Powerv, @function
_ZL8M41Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	li	a1,0
	lla	s0,.LANCHOR1
	li	a0,32768
	sb	zero,0(s0)
	la a5, .LANCHOR0; sb zero, 0(a5);
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	li	s0,65536
	call	_Z7setchr8j
	la a0, .LANCHOR2; lbu a0, 0(a0);
	call	_Z9setmirrori
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,24576
	lla	a2,_ZL9M41Write0jh
	addi	a1,a1,2047
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL9M41Write1jh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL8M41Powerv, .-_ZL8M41Powerv
	.section	.text._Z13Mapper41_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper41_InitP8CartInfo
	.hidden	_Z13Mapper41_InitP8CartInfo
	.type	_Z13Mapper41_InitP8CartInfo, @function
_Z13Mapper41_InitP8CartInfo:
	lla	a5,_ZL8M41Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR3
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper41_InitP8CartInfo, .-_Z13Mapper41_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"MREG"
	.align	2
.LC1:
	.string	"CREG"
	.align	2
.LC2:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL7mainreg
	.word	1
	.word	.LC0
	.word	_ZL6chrreg
	.word	1
	.word	.LC1
	.word	_ZL6mirror
	.word	1
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL6chrreg,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL6chrreg, @object
	.size	_ZL6chrreg, 1
_ZL6chrreg:
	.zero	1
	.section	.sbss._ZL6mirror,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL6mirror, @object
	.size	_ZL6mirror, 1
_ZL6mirror:
	.zero	1
	.section	.sbss._ZL7mainreg,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL7mainreg, @object
	.size	_ZL7mainreg, 1
_ZL7mainreg:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
