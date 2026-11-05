#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"99.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lbu	a0,0(s0)
	sw	ra,8(sp)
	srli	a0,a0,2
	andi	a0,a0,1
	call	_Z7setchr8j
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	li	a1,0
	li	a0,32768
	call	_Z8setprg32jj
	lbu	a1,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,32768
	andi	a1,a1,4
	addi	sp,sp,12
	tail	_Z7setprg8jj
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M99Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M99Writejh, @function
_ZL8M99Writejh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s0,a1
	mv	s1,a0
	la a5, .LANCHOR0; sb a1, 0(a5);
	call	_ZL4Syncv
	mv	a1,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a0,s1
	lw	s1,0(sp)
	la a5, .LANCHOR1; lw a5, 0(a5);
	addi	sp,sp,12
	jr	a5
	.size	_ZL8M99Writejh, .-_ZL8M99Writejh
	.section	.text._ZL8M99Closev,"ax",@progbits
	.align	2
	.type	_ZL8M99Closev, @function
_ZL8M99Closev:
	la a0, .LANCHOR2; lw a0, 0(a0);
	beq	a0,zero,.L13
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR2; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L13:
	la a5, .LANCHOR2; sw zero, 0(a5);
	ret
	.size	_ZL8M99Closev, .-_ZL8M99Closev
	.section	.text._ZL8M99Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M99Powerv, @function
_ZL8M99Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR0; sb zero, 0(a5);
	li	s0,16384
	call	_ZL4Syncv
	addi	a0,s0,22
	call	_Z15GetWriteHandleri
	addi	a1,s0,22
	mv	a5,a0
	lla	a2,_ZL8M99Writejh
	mv	a0,a1
	la a4, .LANCHOR1; sw a5, 0(a4);
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR3; lw a0, 0(a0);
	la a2, .LANCHOR2; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL8M99Powerv, .-_ZL8M99Powerv
	.section	.rodata._Z13Mapper99_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z13Mapper99_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper99_InitP8CartInfo
	.hidden	_Z13Mapper99_InitP8CartInfo
	.type	_Z13Mapper99_InitP8CartInfo, @function
_Z13Mapper99_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL8M99Powerv
	sw	a5,0(a0)
	lla	a5,_ZL8M99Closev
	lla	s0,.LANCHOR3
	sw	a5,8(a0)
	li	a5,8192
	li	a0,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR2
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s0)
	lw	a0,0(s1)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR4
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper99_InitP8CartInfo, .-_Z13Mapper99_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"LATC"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL5latch
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL5latch,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL5latch, @object
	.size	_ZL5latch, 1
_ZL5latch:
	.zero	1
	.section	.sbss._ZL7old4016,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL7old4016, @object
	.size	_ZL7old4016, 4
_ZL7old4016:
	.zero	4
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
