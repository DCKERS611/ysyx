#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"82.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s1,0(sp)
	sw	s0,4(sp)
	lla	a5,.LANCHOR0
	lbu	s0,0(a5)
	lla	s1,.LANCHOR1
	lbu	a1,0(s1)
	li	a5,4096
	slli	s0,s0,11
	and	s0,s0,a5
	mv	a0,s0
	srli	a1,a1,1
	call	_Z7setchr2jj
	lbu	a1,1(s1)
	li	a5,4096
	addi	a0,a5,-2048
	xor	a0,s0,a0
	srli	a1,a1,1
	call	_Z7setchr2jj
	lbu	a1,2(s1)
	li	a5,4096
	xor	a0,s0,a5
	call	_Z7setchr1jj
	lbu	a1,3(s1)
	li	a5,4096
	addi	a0,a5,1024
	xor	a0,s0,a0
	call	_Z7setchr1jj
	lbu	a1,4(s1)
	li	a5,8192
	addi	a0,a5,-2048
	xor	a0,s0,a0
	call	_Z7setchr1jj
	li	a5,8192
	lbu	a1,5(s1)
	addi	a0,a5,-1024
	xor	a0,s0,a0
	call	_Z7setchr1jj
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	lbu	a1,6(s1)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,7(s1)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,8(s1)
	li	a0,49152
	call	_Z7setprg8jj
	li	a0,57344
	li	a1,-1
	call	_Z7setprg8jj
	lla	a5,.LANCHOR0
	lbu	a0,0(a5)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M82Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M82Writejh, @function
_ZL8M82Writejh:
	li	a5,32768
	addi	a4,a5,-267
	bgtu	a0,a4,.L6
	andi	a0,a0,7
	lla	a5,.LANCHOR1
	add	a5,a5,a0
	sb	a1,0(a5)
.L7:
	tail	_ZL4Syncv
.L6:
	addi	a4,a5,-261
	beq	a0,a4,.L8
	bgtu	a0,a4,.L9
	addi	a4,a5,-266
	beq	a0,a4,.L10
	addi	a5,a5,-262
	bne	a0,a5,.L7
	srli	a1,a1,2
	la a5, .LANCHOR1+6; sb a1, 0(a5);
	tail	_ZL4Syncv
.L9:
	addi	a5,a5,-260
	bne	a0,a5,.L7
	srli	a1,a1,2
	la a5, .LANCHOR1+8; sb a1, 0(a5);
	tail	_ZL4Syncv
.L8:
	srli	a1,a1,2
	la a5, .LANCHOR1+7; sb a1, 0(a5);
	tail	_ZL4Syncv
.L10:
	andi	a1,a1,3
	la a5, .LANCHOR0; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL8M82Writejh, .-_ZL8M82Writejh
	.section	.text._ZL8M82Closev,"ax",@progbits
	.align	2
	.type	_ZL8M82Closev, @function
_ZL8M82Closev:
	la a0, .LANCHOR2; lw a0, 0(a0);
	beq	a0,zero,.L19
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR2; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L19:
	la a5, .LANCHOR2; sw zero, 0(a5);
	ret
	.size	_ZL8M82Closev, .-_ZL8M82Closev
	.section	.text._ZL8M82Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M82Powerv, @function
_ZL8M82Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_ZL4Syncv
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-260
	addi	a0,s0,-272
	lla	a2,_ZL8M82Writejh
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR3; lw a0, 0(a0);
	la a2, .LANCHOR2; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL8M82Powerv, .-_ZL8M82Powerv
	.section	.rodata._Z13Mapper82_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z13Mapper82_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper82_InitP8CartInfo
	.hidden	_Z13Mapper82_InitP8CartInfo
	.type	_Z13Mapper82_InitP8CartInfo, @function
_Z13Mapper82_InitP8CartInfo:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	lla	a4,_ZL8M82Powerv
	sw	a4,0(a0)
	lla	a4,_ZL8M82Closev
	lla	s0,.LANCHOR3
	sw	a4,8(a0)
	sw	a0,0(sp)
	li	a4,8192
	li	a0,8192
	sw	a4,0(s0)
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
	lw	a5,0(sp)
	lw	a4,48(a5)
	beq	a4,zero,.L25
	lw	a3,0(s1)
	lw	a4,0(s0)
	sw	a3,12(a5)
	sw	a4,28(a5)
.L25:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR4
	addi	sp,sp,16
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper82_InitP8CartInfo, .-_Z13Mapper82_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"REGS"
	.align	2
.LC2:
	.string	"CTRL"
	.section	.bss._ZL4regs,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL4regs, @object
	.size	_ZL4regs, 9
_ZL4regs:
	.zero	9
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL4regs
	.word	9
	.word	.LC1
	.word	_ZL4ctrl
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
	.section	.sbss._ZL4ctrl,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL4ctrl, @object
	.size	_ZL4ctrl, 1
_ZL4ctrl:
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
