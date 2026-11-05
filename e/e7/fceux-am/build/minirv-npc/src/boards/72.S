#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"72.cpp"
	.option nopic
	.text
	.section	.text._ZL8M72Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M72Writejh, @function
_ZL8M72Writejh:
	addi	sp,sp,-12
	slli	a4,a1,24
	sw	ra,8(sp)
	sw	s0,4(sp)
	srai	a4,a4,24
	mv	a5,a1
	blt	a4,zero,.L2
	la a1, .LANCHOR0; lbu a1, 0(a1);
.L3:
	andi	a4,a5,64
	lla	s0,.LANCHOR1
	beq	a4,zero,.L4
	andi	a5,a5,15
	sb	a5,0(s0)
.L4:
	li	a0,32768
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,-1
	call	_Z8setprg16jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z7setchr8j
.L2:
	andi	a1,a1,15
	la a4, .LANCHOR0; sb a1, 0(a4);
	j	.L3
	.size	_ZL8M72Writejh, .-_ZL8M72Writejh
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	addi	sp,sp,-12
	la a1, .LANCHOR0; lbu a1, 0(a1);
	li	a0,32768
	sw	ra,8(sp)
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,-1
	call	_Z8setprg16jj
	lw	ra,8(sp)
	la a0, .LANCHOR1; lbu a0, 0(a0);
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M72Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M72Powerv, @function
_ZL8M72Powerv:
	addi	sp,sp,-12
	la a1, .LANCHOR0; lbu a1, 0(a1);
	li	a0,32768
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	la a0, .LANCHOR1; lbu a0, 0(a0);
	call	_Z7setchr8j
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL8M72Writejh
	li	a0,24576
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL8M72Powerv, .-_ZL8M72Powerv
	.section	.text._Z13Mapper72_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper72_InitP8CartInfo
	.hidden	_Z13Mapper72_InitP8CartInfo
	.type	_Z13Mapper72_InitP8CartInfo, @function
_Z13Mapper72_InitP8CartInfo:
	lla	a5,_ZL8M72Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR2
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper72_InitP8CartInfo, .-_Z13Mapper72_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PREG"
	.align	2
.LC1:
	.string	"CREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL4preg
	.word	1
	.word	.LC0
	.word	_ZL4creg
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL4creg,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL4creg, @object
	.size	_ZL4creg, 1
_ZL4creg:
	.zero	1
	.section	.sbss._ZL4preg,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL4preg, @object
	.size	_ZL4preg, 1
_ZL4preg:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
