#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"09-034a.cpp"
	.option nopic
	.text
	.section	.text._ZL12UNLSMB2JReadj,"ax",@progbits
	.align	2
	.type	_ZL12UNLSMB2JReadj, @function
_ZL12UNLSMB2JReadj:
	li	a0,255
	ret
	.size	_ZL12UNLSMB2JReadj, .-_ZL12UNLSMB2JReadj
	.section	.text._ZL13UNLSMB2JPowerv,"ax",@progbits
	.align	2
	.type	_ZL13UNLSMB2JPowerv, @function
_ZL13UNLSMB2JPowerv:
	addi	sp,sp,-12
	li	a2,0
	li	a1,24576
	li	a0,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR0; sb zero, 0(a5);
	call	_Z8setprg8rijj
	li	a1,0
	li	a0,32768
	call	_Z8setprg32jj
	li	a0,0
	call	_Z7setchr8j
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	s0,16384
	addi	a1,s0,85
	addi	a0,s0,66
	lla	a2,_ZL12UNLSMB2JReadj
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,104
	mv	a0,a1
	lla	a2,_ZL14UNLSMB2JWrite2jh
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,39
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL14UNLSMB2JWrite1jh
	mv	a0,a1
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL13UNLSMB2JPowerv, .-_ZL13UNLSMB2JPowerv
	.section	.text._ZL14UNLSMB2JWrite2jh,"ax",@progbits
	.align	2
	.type	_ZL14UNLSMB2JWrite2jh, @function
_ZL14UNLSMB2JWrite2jh:
	andi	a1,a1,1
	li	a0,1
	la a5, .LANCHOR1; sw a1, 0(a5);
	la a5, .LANCHOR2; sw zero, 0(a5);
	tail	_Z12X6502_IRQEndi
	.size	_ZL14UNLSMB2JWrite2jh, .-_ZL14UNLSMB2JWrite2jh
	.section	.text._ZL15UNLSMB2JIRQHooki,"ax",@progbits
	.align	2
	.type	_ZL15UNLSMB2JIRQHooki, @function
_ZL15UNLSMB2JIRQHooki:
	la a5, .LANCHOR1; lw a5, 0(a5);
	beq	a5,zero,.L6
	lla	a4,.LANCHOR2
	lw	a3,0(a4)
	li	a5,4096
	addi	a5,a5,1653
	bgtu	a3,a5,.L8
	add	a0,a0,a3
	sw	a0,0(a4)
	ret
.L6:
	ret
.L8:
	li	a0,1
	la a5, .LANCHOR1; sw zero, 0(a5);
	tail	_Z14X6502_IRQBegini
	.size	_ZL15UNLSMB2JIRQHooki, .-_ZL15UNLSMB2JIRQHooki
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	addi	sp,sp,-12
	la a2, .LANCHOR0; lbu a2, 0(a2);
	li	a1,24576
	li	a0,1
	sw	ra,8(sp)
	call	_Z8setprg8rijj
	li	a0,32768
	li	a1,0
	call	_Z8setprg32jj
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL14UNLSMB2JWrite1jh,"ax",@progbits
	.align	2
	.type	_ZL14UNLSMB2JWrite1jh, @function
_ZL14UNLSMB2JWrite1jh:
	andi	a5,a1,1
	addi	sp,sp,-12
	mv	a2,a5
	li	a1,24576
	li	a0,1
	sw	ra,8(sp)
	la a4, .LANCHOR0; sb a5, 0(a4);
	call	_Z8setprg8rijj
	li	a0,32768
	li	a1,0
	call	_Z8setprg32jj
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL14UNLSMB2JWrite1jh, .-_ZL14UNLSMB2JWrite1jh
	.section	.text._Z13UNLSMB2J_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13UNLSMB2J_InitP8CartInfo
	.hidden	_Z13UNLSMB2J_InitP8CartInfo
	.type	_Z13UNLSMB2J_InitP8CartInfo, @function
_Z13UNLSMB2J_InitP8CartInfo:
	lla	a5,_ZL13UNLSMB2JPowerv
	sw	a5,0(a0)
	lla	a5,_ZL15UNLSMB2JIRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR3
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13UNLSMB2J_InitP8CartInfo, .-_Z13UNLSMB2J_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"IRQC"
	.align	2
.LC1:
	.string	"IRQA"
	.align	2
.LC2:
	.string	"PRG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL8IRQCount
	.word	4
	.word	.LC0
	.word	_ZL4IRQa
	.word	4
	.word	.LC1
	.word	_ZL3prg
	.word	1
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL3prg,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL3prg, @object
	.size	_ZL3prg, 1
_ZL3prg:
	.zero	1
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 4
_ZL4IRQa:
	.zero	4
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
