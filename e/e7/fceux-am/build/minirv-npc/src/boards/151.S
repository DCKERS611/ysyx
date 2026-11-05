#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"151.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,4(s0)
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
	lbu	a1,6(s0)
	li	a0,0
	call	_Z7setchr4jj
	lbu	a1,7(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,4096
	addi	sp,sp,12
	tail	_Z7setchr4jj
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M151Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M151Writejh, @function
_ZL9M151Writejh:
	srli	a0,a0,12
	andi	a0,a0,7
	lla	a5,.LANCHOR0
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.size	_ZL9M151Writejh, .-_ZL9M151Writejh
	.section	.text._ZL9M151Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M151Powerv, @function
_ZL9M151Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_ZL4Syncv
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL9M151Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL9M151Powerv, .-_ZL9M151Powerv
	.section	.text._Z14Mapper151_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper151_InitP8CartInfo
	.hidden	_Z14Mapper151_InitP8CartInfo
	.type	_Z14Mapper151_InitP8CartInfo, @function
_Z14Mapper151_InitP8CartInfo:
	lla	a5,_ZL9M151Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR1
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper151_InitP8CartInfo, .-_Z14Mapper151_InitP8CartInfo
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
