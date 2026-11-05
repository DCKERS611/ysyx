#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"91.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR0
	lbu	a1,0(s1)
	li	a0,32768
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z7setprg8jj
	lbu	a1,1(s1)
	li	a0,40960
	lla	s0,.LANCHOR1
	call	_Z7setprg8jj
	li	a1,-2
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
	lbu	a1,0(s0)
	li	a0,0
	call	_Z7setchr2jj
	lbu	a1,1(s0)
	li	a0,4096
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lbu	a1,2(s0)
	li	a0,4096
	call	_Z7setchr2jj
	lbu	a1,3(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,8192
	addi	a0,a0,-2048
	addi	sp,sp,12
	tail	_Z7setchr2jj
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M91Write0jh,"ax",@progbits
	.align	2
	.type	_ZL9M91Write0jh, @function
_ZL9M91Write0jh:
	andi	a0,a0,3
	lla	a5,.LANCHOR1
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.size	_ZL9M91Write0jh, .-_ZL9M91Write0jh
	.section	.text._ZL10M91IRQHookv,"ax",@progbits
	.align	2
	.type	_ZL10M91IRQHookv, @function
_ZL10M91IRQHookv:
	lla	a4,.LANCHOR2
	lbu	a5,0(a4)
	li	a3,7
	bgtu	a5,a3,.L6
	la a3, .LANCHOR3; lbu a3, 0(a3);
	beq	a3,zero,.L6
	addi	a5,a5,1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	li	a4,8
	beq	a5,a4,.L13
.L6:
	ret
.L13:
	li	a0,1
	tail	_Z14X6502_IRQBegini
	.size	_ZL10M91IRQHookv, .-_ZL10M91IRQHookv
	.section	.text._ZL8M91Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M91Powerv, @function
_ZL8M91Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_ZL4Syncv
	li	a1,28672
	lla	a2,_ZL9M91Write0jh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,32768
	lla	a2,_ZL9M91Write1jh
	addi	a1,a1,-1
	li	a0,28672
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL8M91Powerv, .-_ZL8M91Powerv
	.section	.text._ZL9M91Write1jh,"ax",@progbits
	.align	2
	.type	_ZL9M91Write1jh, @function
_ZL9M91Write1jh:
	andi	a5,a0,3
	li	a4,2
	beq	a5,a4,.L17
	li	a4,3
	beq	a5,a4,.L18
	andi	a0,a0,1
	lla	a5,.LANCHOR0
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
.L17:
	li	a0,1
	la a5, .LANCHOR2; sb zero, 0(a5);
	la a5, .LANCHOR3; sb zero, 0(a5);
	tail	_Z12X6502_IRQEndi
.L18:
	li	a5,1
	li	a0,1
	la a4, .LANCHOR3; sb a5, 0(a4);
	tail	_Z12X6502_IRQEndi
	.size	_ZL9M91Write1jh, .-_ZL9M91Write1jh
	.section	.text._Z13Mapper91_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper91_InitP8CartInfo
	.hidden	_Z13Mapper91_InitP8CartInfo
	.type	_Z13Mapper91_InitP8CartInfo, @function
_Z13Mapper91_InitP8CartInfo:
	lla	a5,_ZL8M91Powerv
	sw	a5,0(a0)
	lla	a5,_ZL10M91IRQHookv
	la a4, GameHBIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR4
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper91_InitP8CartInfo, .-_Z13Mapper91_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CREG"
	.align	2
.LC1:
	.string	"PREG"
	.align	2
.LC2:
	.string	"IRQA"
	.align	2
.LC3:
	.string	"IRQC"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 60
_ZL9StateRegs:
	.word	_ZL5cregs
	.word	4
	.word	.LC0
	.word	_ZL5pregs
	.word	2
	.word	.LC1
	.word	_ZL4IRQa
	.word	1
	.word	.LC2
	.word	_ZL8IRQCount
	.word	1
	.word	.LC3
	.word	0
	.zero	8
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL5cregs,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL5cregs, @object
	.size	_ZL5cregs, 4
_ZL5cregs:
	.zero	4
	.section	.sbss._ZL5pregs,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL5pregs, @object
	.size	_ZL5pregs, 2
_ZL5pregs:
	.zero	2
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 1
_ZL8IRQCount:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
