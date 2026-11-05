#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"15.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-16
	sw	s0,8(sp)
	lla	s0,.LANCHOR0
	lbu	a0,0(s0)
	sw	s1,4(sp)
	sw	ra,12(sp)
	srli	a0,a0,6
	xori	a0,a0,1
	andi	a0,a0,1
	call	_Z9setmirrori
	lla	s1,.LANCHOR1
	lhu	a5,0(s1)
	li	a4,2
	andi	a3,a5,3
	beq	a3,a4,.L9
	andi	a5,a5,1
	bne	a5,zero,.L3
	li	s1,0
.L4:
	lbu	a1,0(s0)
	slli	a0,s1,13
	li	a5,32768
	slli	a1,a1,1
	andi	a1,a1,126
	add	a1,a1,s1
	add	a0,a0,a5
	call	_Z7setprg8jj
	addi	s1,s1,1
	li	a4,4
	bne	s1,a4,.L4
.L5:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	li	a0,0
	addi	sp,sp,16
	tail	_Z7setchr8j
.L9:
	li	s1,32768
.L2:
	lbu	a5,0(s0)
	mv	a0,s1
	li	a4,8192
	slli	a1,a5,1
	andi	a1,a1,126
	srli	a5,a5,7
	add	a1,a1,a5
	add	s1,s1,a4
	call	_Z7setprg8jj
	li	a5,65536
	bne	s1,a5,.L2
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	li	a0,0
	addi	sp,sp,16
	tail	_Z7setchr8j
.L3:
	lbu	a1,0(s0)
	li	a5,0
	andi	a1,a1,63
.L8:
	andi	a4,a5,1
	slli	a0,a5,13
	sw	a5,0(sp)
	slli	a1,a1,1
	li	a5,32768
	add	a1,a4,a1
	add	a0,a0,a5
	call	_Z7setprg8jj
	lw	a5,0(sp)
	li	a4,4
	li	a3,1
	addi	a5,a5,1
	beq	a5,a4,.L5
	lbu	a1,0(s0)
	andi	a1,a1,63
	beq	a5,a3,.L8
	lhu	a4,0(s1)
	andi	a4,a4,2
	bne	a4,zero,.L8
	ori	a1,a1,7
	j	.L8
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M15Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M15Resetv, @function
_ZL8M15Resetv:
	li	a5,-32768
	la a4, .LANCHOR1; sh a5, 0(a4);
	la a5, .LANCHOR0; sb zero, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL8M15Resetv, .-_ZL8M15Resetv
	.section	.text._ZL8M15Closev,"ax",@progbits
	.align	2
	.type	_ZL8M15Closev, @function
_ZL8M15Closev:
	la a0, .LANCHOR2; lw a0, 0(a0);
	beq	a0,zero,.L22
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR2; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L22:
	la a5, .LANCHOR2; sw zero, 0(a5);
	ret
	.size	_ZL8M15Closev, .-_ZL8M15Closev
	.section	.text._ZL8M15Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M15Powerv, @function
_ZL8M15Powerv:
	addi	sp,sp,-12
	li	a5,-32768
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,8(sp)
	la a4, .LANCHOR1; sh a5, 0(a4);
	sw	s0,4(sp)
	la a5, .LANCHOR0; sb zero, 0(a5);
	li	s0,32768
	call	_Z8setprg8rijj
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL8M15Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	la a0, .LANCHOR3; lw a0, 0(a0);
	la a2, .LANCHOR2; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	call	_Z16FCEU_CheatAddRAMijPh
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
	.size	_ZL8M15Powerv, .-_ZL8M15Powerv
	.section	.text._ZL8M15Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M15Writejh, @function
_ZL8M15Writejh:
	slli	a0,a0,16
	srli	a0,a0,16
	la a5, .LANCHOR1; sh a0, 0(a5);
	la a5, .LANCHOR0; sb a1, 0(a5);
	addi	sp,sp,-12
	sw	ra,8(sp)
	andi	a0,a0,3
	li	a5,3
	la a1, CHRptr; lw a1, 0(a1);
	beq	a0,a5,.L31
	li	a3,1
	li	a2,8192
	li	a0,0
	call	_Z19SetupCartCHRMappingiPhji
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
.L31:
	li	a3,0
	li	a2,8192
	li	a0,0
	call	_Z19SetupCartCHRMappingiPhji
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
	.size	_ZL8M15Writejh, .-_ZL8M15Writejh
	.section	.rodata._Z13Mapper15_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z13Mapper15_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper15_InitP8CartInfo
	.hidden	_Z13Mapper15_InitP8CartInfo
	.type	_Z13Mapper15_InitP8CartInfo, @function
_Z13Mapper15_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL8M15Powerv
	sw	a5,0(a0)
	lla	a5,_ZL8M15Resetv
	sw	a5,4(a0)
	lla	a5,_ZL8M15Closev
	sw	a5,8(a0)
	lla	a5,_ZL12StateRestorei
	lla	s1,.LANCHOR3
	la a4, GameStateRestore; sw a5, 0(a4);
	mv	s0,a0
	li	a5,8192
	li	a0,8192
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	a5,.LANCHOR2
	li	a0,16
	li	a3,1
	sw	a1,0(a5)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a4,48(s0)
	lla	a5,.LANCHOR2
	lw	a0,0(a5)
	lw	a1,0(s1)
	beq	a4,zero,.L34
	sw	a0,12(s0)
	sw	a1,28(s0)
.L34:
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR4
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper15_InitP8CartInfo, .-_Z13Mapper15_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"AREG"
	.align	2
.LC2:
	.string	"DREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL7latchea
	.word	2
	.word	.LC1
	.word	_ZL7latched
	.word	1
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL7latchea,"aw",@nobits
	.align	1
	.set	.LANCHOR1,. + 0
	.type	_ZL7latchea, @object
	.size	_ZL7latchea, 2
_ZL7latchea:
	.zero	2
	.section	.sbss._ZL7latched,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL7latched, @object
	.size	_ZL7latched, 1
_ZL7latched:
	.zero	1
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
