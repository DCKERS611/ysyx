#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"42.cpp"
	.option nopic
	.text
	.section	.text._ZL10M42IRQHooki,"ax",@progbits
	.align	2
	.type	_ZL10M42IRQHooki, @function
_ZL10M42IRQHooki:
	la a5, .LANCHOR0; lw a5, 0(a5);
	beq	a5,zero,.L1
	lla	a5,.LANCHOR1
	lw	a3,0(a5)
	li	a4,32768
	add	a0,a0,a3
	bltu	a0,a4,.L6
	sub	a0,a0,a4
.L6:
	sw	a0,0(a5)
	li	a5,24576
	bltu	a0,a5,.L5
	li	a0,1
	tail	_Z14X6502_IRQBegini
.L1:
	ret
.L5:
	li	a0,1
	tail	_Z12X6502_IRQEndi
	.size	_ZL10M42IRQHooki, .-_ZL10M42IRQHooki
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	addi	sp,sp,-12
	la a1, .LANCHOR2; lbu a1, 0(a1);
	li	a0,24576
	sw	ra,8(sp)
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,32768
	call	_Z8setprg32jj
	la a0, .LANCHOR3; lbu a0, 0(a0);
	call	_Z7setchr8j
	lw	ra,8(sp)
	la a0, .LANCHOR4; lbu a0, 0(a0);
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M42Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M42Powerv, @function
_ZL8M42Powerv:
	addi	sp,sp,-12
	la a5, .LANCHOR2; sb zero, 0(a5);
	sw	ra,8(sp)
	sw	s0,4(sp)
	li	a5,1
	lla	s0,.LANCHOR4
	li	a1,0
	li	a0,24576
	sb	a5,0(s0)
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,32768
	call	_Z8setprg32jj
	la a0, .LANCHOR3; lbu a0, 0(a0);
	call	_Z7setchr8j
	lbu	a0,0(s0)
	li	s0,65536
	call	_Z9setmirrori
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL8M42Writejh
	li	a0,24576
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL8M42Powerv, .-_ZL8M42Powerv
	.section	.text._ZL8M42Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M42Writejh, @function
_ZL8M42Writejh:
	li	a5,57344
	addi	sp,sp,-12
	addi	a4,a5,3
	and	a0,a0,a4
	sw	ra,8(sp)
	sw	s0,4(sp)
	addi	a3,a5,1
	mv	a4,a1
	beq	a0,a3,.L13
	bgtu	a0,a3,.L14
	li	a3,32768
	beq	a0,a3,.L15
	bne	a0,a5,.L12
	andi	a4,a1,15
	mv	a1,a4
	li	a0,24576
	la a5, .LANCHOR2; sb a4, 0(a5);
	call	_Z7setprg8jj
	li	a0,32768
	li	a1,-1
	call	_Z8setprg32jj
	la a0, .LANCHOR3; lbu a0, 0(a0);
.L21:
	call	_Z7setchr8j
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR4; lbu a0, 0(a0);
	addi	sp,sp,12
	tail	_Z9setmirrori
.L14:
	addi	a5,a5,2
	bne	a0,a5,.L12
	andi	a1,a1,2
	la a5, .LANCHOR0; sw a1, 0(a5);
	bne	a1,zero,.L19
	la a5, .LANCHOR1; sw zero, 0(a5);
.L19:
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,1
	addi	sp,sp,12
	tail	_Z12X6502_IRQEndi
.L12:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L15:
	lla	s0,.LANCHOR3
	la a1, .LANCHOR2; lbu a1, 0(a1);
	li	a0,24576
	sb	a4,0(s0)
	call	_Z7setprg8jj
	li	a0,32768
	li	a1,-1
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	j	.L21
.L13:
	srli	a4,a1,3
	xori	a4,a4,1
	andi	a4,a4,1
	lla	s0,.LANCHOR4
	la a1, .LANCHOR2; lbu a1, 0(a1);
	li	a0,24576
	sb	a4,0(s0)
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,32768
	call	_Z8setprg32jj
	la a0, .LANCHOR3; lbu a0, 0(a0);
	call	_Z7setchr8j
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL8M42Writejh, .-_ZL8M42Writejh
	.section	.text._Z13Mapper42_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper42_InitP8CartInfo
	.hidden	_Z13Mapper42_InitP8CartInfo
	.type	_Z13Mapper42_InitP8CartInfo, @function
_Z13Mapper42_InitP8CartInfo:
	lla	a5,_ZL8M42Powerv
	sw	a5,0(a0)
	lla	a5,_ZL10M42IRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR5
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper42_InitP8CartInfo, .-_Z13Mapper42_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PREG"
	.align	2
.LC1:
	.string	"CREG"
	.align	2
.LC2:
	.string	"MIRR"
	.align	2
.LC3:
	.string	"IRQC"
	.align	2
.LC4:
	.string	"IRQA"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 72
_ZL9StateRegs:
	.word	_ZL4preg
	.word	1
	.word	.LC0
	.word	_ZL4creg
	.word	1
	.word	.LC1
	.word	_ZL4mirr
	.word	1
	.word	.LC2
	.word	_ZL8IRQCount
	.word	4
	.word	.LC3
	.word	_ZL4IRQa
	.word	4
	.word	.LC4
	.word	0
	.zero	8
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 4
_ZL4IRQa:
	.zero	4
	.section	.sbss._ZL4creg,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL4creg, @object
	.size	_ZL4creg, 1
_ZL4creg:
	.zero	1
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL4preg,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL4preg, @object
	.size	_ZL4preg, 1
_ZL4preg:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
