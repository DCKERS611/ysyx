#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"edu2000.cpp"
	.option nopic
	.text
	.section	.text._ZL15UNLEDU2000Closev,"ax",@progbits
	.align	2
	.type	_ZL15UNLEDU2000Closev, @function
_ZL15UNLEDU2000Closev:
	la a0, .LANCHOR0; lw a0, 0(a0);
	beq	a0,zero,.L7
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR0; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L7:
	la a5, .LANCHOR0; sw zero, 0(a5);
	ret
	.size	_ZL15UNLEDU2000Closev, .-_ZL15UNLEDU2000Closev
	.section	.text._ZL15UNLEDU2000Powerv,"ax",@progbits
	.align	2
	.type	_ZL15UNLEDU2000Powerv, @function
_ZL15UNLEDU2000Powerv:
	addi	sp,sp,-12
	li	a0,2
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z9setmirrori
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_ZL17UNLEDU2000HiWritejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	la a2, .LANCHOR0; lw a2, 0(a2);
	li	a1,24576
	li	a0,32
	call	_Z16FCEU_CheatAddRAMijPh
	lla	s0,.LANCHOR1
	li	a0,0
	sb	zero,0(s0)
	call	_Z7setchr8j
	lbu	a2,0(s0)
	li	a1,24576
	li	a0,16
	srli	a2,a2,6
	call	_Z8setprg8rijj
	lbu	a1,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,32768
	andi	a1,a1,31
	addi	sp,sp,12
	tail	_Z8setprg32jj
	.size	_ZL15UNLEDU2000Powerv, .-_ZL15UNLEDU2000Powerv
	.section	.text._ZL17UNLEDU2000Restorei,"ax",@progbits
	.align	2
	.type	_ZL17UNLEDU2000Restorei, @function
_ZL17UNLEDU2000Restorei:
	addi	sp,sp,-12
	li	a0,0
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z7setchr8j
	lla	s0,.LANCHOR1
	lbu	a2,0(s0)
	li	a1,24576
	li	a0,16
	srli	a2,a2,6
	call	_Z8setprg8rijj
	lbu	a1,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,32768
	andi	a1,a1,31
	addi	sp,sp,12
	tail	_Z8setprg32jj
	.size	_ZL17UNLEDU2000Restorei, .-_ZL17UNLEDU2000Restorei
	.section	.text._ZL17UNLEDU2000HiWritejh,"ax",@progbits
	.align	2
	.type	_ZL17UNLEDU2000HiWritejh, @function
_ZL17UNLEDU2000HiWritejh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	li	a0,0
	lla	s0,.LANCHOR1
	sw	ra,8(sp)
	sb	a1,0(s0)
	call	_Z7setchr8j
	lbu	a2,0(s0)
	li	a1,24576
	li	a0,16
	srli	a2,a2,6
	call	_Z8setprg8rijj
	lbu	a1,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,32768
	andi	a1,a1,31
	addi	sp,sp,12
	tail	_Z8setprg32jj
	.size	_ZL17UNLEDU2000HiWritejh, .-_ZL17UNLEDU2000HiWritejh
	.section	.rodata._Z15UNLEDU2000_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z15UNLEDU2000_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z15UNLEDU2000_InitP8CartInfo
	.hidden	_Z15UNLEDU2000_InitP8CartInfo
	.type	_Z15UNLEDU2000_InitP8CartInfo, @function
_Z15UNLEDU2000_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL15UNLEDU2000Powerv
	sw	a5,0(a0)
	lla	a5,_ZL15UNLEDU2000Closev
	sw	a5,8(a0)
	mv	s0,a0
	lla	a5,_ZL17UNLEDU2000Restorei
	li	a0,32768
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z12FCEU_gmallocj
	mv	a1,a0
	lla	s1,.LANCHOR0
	li	a0,16
	li	a3,1
	li	a2,32768
	sw	a1,0(s1)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a5,48(s0)
	lw	a0,0(s1)
	beq	a5,zero,.L19
	li	a5,32768
	sw	a5,28(s0)
	sw	a0,12(s0)
.L19:
	lla	a3,.LC0
	li	a2,0
	li	a1,32768
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR2
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z15UNLEDU2000_InitP8CartInfo, .-_Z15UNLEDU2000_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"REG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL3reg
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL3reg,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
