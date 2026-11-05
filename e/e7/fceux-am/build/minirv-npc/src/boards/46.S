#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"46.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	sw	s1,0(sp)
	lbu	a5,0(s0)
	lla	s1,.LANCHOR1
	lbu	a1,0(s1)
	slli	a5,a5,1
	andi	a5,a5,30
	andi	a1,a1,1
	li	a0,32768
	or	a1,a5,a1
	sw	ra,8(sp)
	call	_Z8setprg32jj
	lbu	a0,0(s1)
	lbu	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	srli	a0,a0,4
	srli	a5,a5,1
	andi	a0,a0,7
	andi	a5,a5,120
	or	a0,a0,a5
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M46Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M46Resetv, @function
_ZL8M46Resetv:
	la a5, .LANCHOR1; sb zero, 0(a5);
	la a5, .LANCHOR0; sb zero, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL8M46Resetv, .-_ZL8M46Resetv
	.section	.text._ZL9M46Write1jh,"ax",@progbits
	.align	2
	.type	_ZL9M46Write1jh, @function
_ZL9M46Write1jh:
	la a5, .LANCHOR1; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL9M46Write1jh, .-_ZL9M46Write1jh
	.section	.text._ZL9M46Write0jh,"ax",@progbits
	.align	2
	.type	_ZL9M46Write0jh, @function
_ZL9M46Write0jh:
	la a5, .LANCHOR0; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL9M46Write0jh, .-_ZL9M46Write0jh
	.section	.text._ZL8M46Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M46Powerv, @function
_ZL8M46Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR1; sb zero, 0(a5);
	li	s0,65536
	la a5, .LANCHOR0; sb zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	lla	a2,_ZL9M46Write0jh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL9M46Write1jh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL8M46Powerv, .-_ZL8M46Powerv
	.section	.text._Z13Mapper46_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper46_InitP8CartInfo
	.hidden	_Z13Mapper46_InitP8CartInfo
	.type	_Z13Mapper46_InitP8CartInfo, @function
_Z13Mapper46_InitP8CartInfo:
	lla	a5,_ZL8M46Powerv
	sw	a5,0(a0)
	lla	a5,_ZL8M46Resetv
	sw	a5,4(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR2
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper46_InitP8CartInfo, .-_Z13Mapper46_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REG0"
	.align	2
.LC1:
	.string	"REG1"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL4reg0
	.word	1
	.word	.LC0
	.word	_ZL4reg1
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL4reg0,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL4reg0, @object
	.size	_ZL4reg0, 1
_ZL4reg0:
	.zero	1
	.section	.sbss._ZL4reg1,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL4reg1, @object
	.size	_ZL4reg1, 1
_ZL4reg1:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
