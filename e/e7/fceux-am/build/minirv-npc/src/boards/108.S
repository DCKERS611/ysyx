#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"108.cpp"
	.option nopic
	.text
	.section	.text._ZL9M108Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M108Powerv, @function
_ZL9M108Powerv:
	addi	sp,sp,-12
	la a1, .LANCHOR0; lbu a1, 0(a1);
	li	a0,24576
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,32768
	call	_Z8setprg32jj
	li	a0,0
	call	_Z7setchr8j
	li	a1,32768
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,36864
	lla	a2,_ZL9M108Writejh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL9M108Writejh
	li	a0,61440
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL9M108Powerv, .-_ZL9M108Powerv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	addi	sp,sp,-12
	la a1, .LANCHOR0; lbu a1, 0(a1);
	li	a0,24576
	sw	ra,8(sp)
	call	_Z7setprg8jj
	li	a0,32768
	li	a1,-1
	call	_Z8setprg32jj
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M108Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M108Writejh, @function
_ZL9M108Writejh:
	addi	sp,sp,-12
	li	a0,24576
	sw	ra,8(sp)
	la a4, .LANCHOR0; sb a1, 0(a4);
	call	_Z7setprg8jj
	li	a0,32768
	li	a1,-1
	call	_Z8setprg32jj
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL9M108Writejh, .-_ZL9M108Writejh
	.section	.text._Z14Mapper108_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper108_InitP8CartInfo
	.hidden	_Z14Mapper108_InitP8CartInfo
	.type	_Z14Mapper108_InitP8CartInfo, @function
_Z14Mapper108_InitP8CartInfo:
	lla	a5,_ZL9M108Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR1
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper108_InitP8CartInfo, .-_Z14Mapper108_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL3reg
	.word	1
	.word	.LC0
	.word	0
	.zero	8
	.section	.sbss._ZL3reg,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
