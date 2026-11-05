#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"234.cpp"
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
	sw	ra,8(sp)
	sw	s1,0(sp)
	andi	a5,a1,64
	beq	a5,zero,.L2
	lla	s1,.LANCHOR1
	lbu	a5,0(s1)
	andi	a1,a1,14
	li	a0,32768
	andi	a5,a5,1
	or	a1,a5,a1
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lbu	a5,0(s1)
	slli	a0,a0,2
	srli	a5,a5,4
	andi	a0,a0,56
	andi	a5,a5,7
	or	a0,a0,a5
	call	_Z7setchr8j
.L3:
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	srli	a0,a0,7
	xori	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L2:
	li	a0,32768
	andi	a1,a1,15
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	la a5, .LANCHOR1; lbu a5, 0(a5);
	srli	a5,a5,4
	slli	a0,a0,2
	andi	a5,a5,3
	andi	a0,a0,60
	or	a0,a0,a5
	call	_Z7setchr8j
	j	.L3
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._Z12M234ReadBankj,"ax",@progbits
	.align	2
	.globl	_Z12M234ReadBankj
	.hidden	_Z12M234ReadBankj
	.type	_Z12M234ReadBankj, @function
_Z12M234ReadBankj:
	addi	sp,sp,-16
	sw	ra,12(sp)
	call	_Z6CartBRj
	lla	a5,.LANCHOR0
	lbu	a4,0(a5)
	beq	a4,zero,.L9
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
.L9:
	sw	a0,0(sp)
	sb	a0,0(a5)
	call	_ZL4Syncv
	lw	ra,12(sp)
	lw	a0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z12M234ReadBankj, .-_Z12M234ReadBankj
	.section	.text._Z12M234ReadPregj,"ax",@progbits
	.align	2
	.globl	_Z12M234ReadPregj
	.hidden	_Z12M234ReadPregj
	.type	_Z12M234ReadPregj, @function
_Z12M234ReadPregj:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z6CartBRj
	mv	s0,a0
	la a5, .LANCHOR1; sb a0, 0(a5);
	call	_ZL4Syncv
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	_Z12M234ReadPregj, .-_Z12M234ReadPregj
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M234Resetv,"ax",@progbits
	.align	2
	.type	_ZL9M234Resetv, @function
_ZL9M234Resetv:
	la a5, .LANCHOR1; sb zero, 0(a5);
	la a5, .LANCHOR0; sb zero, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL9M234Resetv, .-_ZL9M234Resetv
	.section	.text._ZL9M234Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M234Powerv, @function
_ZL9M234Powerv:
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
	addi	a1,s0,-97
	addi	a0,s0,-128
	lla	a2,_Z12M234ReadBankj
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-9
	addi	a0,s0,-24
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_Z12M234ReadPregj
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL9M234Powerv, .-_ZL9M234Powerv
	.section	.text._Z14Mapper234_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper234_InitP8CartInfo
	.hidden	_Z14Mapper234_InitP8CartInfo
	.type	_Z14Mapper234_InitP8CartInfo, @function
_Z14Mapper234_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,_ZL9M234Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M234Resetv
	sw	a5,4(a0)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR2
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	addi	sp,sp,12
	jr	ra
	.size	_Z14Mapper234_InitP8CartInfo, .-_Z14Mapper234_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"BANK"
	.align	2
.LC1:
	.string	"PREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL4bank
	.word	1
	.word	.LC0
	.word	_ZL4preg
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL4bank,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL4bank, @object
	.size	_ZL4bank, 1
_ZL4bank:
	.zero	1
	.section	.sbss._ZL4preg,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL4preg, @object
	.size	_ZL4preg, 1
_ZL4preg:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
