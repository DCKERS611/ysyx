#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"40.cpp"
	.option nopic
	.text
	.section	.text._ZL8M40Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M40Resetv, @function
_ZL8M40Resetv:
	ret
	.size	_ZL8M40Resetv, .-_ZL8M40Resetv
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	li	a1,-2
	li	a0,24576
	sw	ra,8(sp)
	call	_Z7setprg8jj
	li	a1,-4
	li	a0,32768
	call	_Z7setprg8jj
	li	a1,-3
	li	a0,40960
	call	_Z7setprg8jj
	la a1, .LANCHOR0; lbu a1, 0(a1);
	li	a0,49152
	call	_Z7setprg8jj
	li	a0,57344
	li	a1,-1
	call	_Z7setprg8jj
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M40Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M40Powerv, @function
_ZL8M40Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR0; sb zero, 0(a5);
	li	s0,65536
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL8M40Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL8M40Powerv, .-_ZL8M40Powerv
	.section	.text._ZL10M40IRQHooki,"ax",@progbits
	.align	2
	.type	_ZL10M40IRQHooki, @function
_ZL10M40IRQHooki:
	la a5, .LANCHOR1; lw a5, 0(a5);
	beq	a5,zero,.L8
	lla	a5,.LANCHOR2
	lw	a4,0(a5)
	li	a3,4096
	bgeu	a4,a3,.L10
	add	a0,a0,a4
	sw	a0,0(a5)
	ret
.L8:
	ret
.L10:
	li	a0,1
	la a5, .LANCHOR1; sw zero, 0(a5);
	tail	_Z14X6502_IRQBegini
	.size	_ZL10M40IRQHooki, .-_ZL10M40IRQHooki
	.section	.text._ZL8M40Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M40Writejh, @function
_ZL8M40Writejh:
	li	a5,57344
	and	a0,a0,a5
	li	a4,40960
	beq	a0,a4,.L15
	beq	a0,a5,.L16
	li	a5,32768
	beq	a0,a5,.L18
	ret
.L15:
	li	a5,1
	la a4, .LANCHOR1; sw a5, 0(a4);
	ret
.L18:
	li	a0,1
	la a5, .LANCHOR1; sw zero, 0(a5);
	la a5, .LANCHOR2; sw zero, 0(a5);
	tail	_Z12X6502_IRQEndi
.L16:
	andi	a1,a1,7
	la a5, .LANCHOR0; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL8M40Writejh, .-_ZL8M40Writejh
	.section	.text._Z13Mapper40_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper40_InitP8CartInfo
	.hidden	_Z13Mapper40_InitP8CartInfo
	.type	_Z13Mapper40_InitP8CartInfo, @function
_Z13Mapper40_InitP8CartInfo:
	lla	a5,_ZL8M40Powerv
	sw	a5,0(a0)
	lla	a5,_ZL8M40Resetv
	sw	a5,4(a0)
	lla	a5,_ZL10M40IRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR3
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper40_InitP8CartInfo, .-_Z13Mapper40_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"IRQC"
	.align	2
.LC1:
	.string	"IRQA"
	.align	2
.LC2:
	.string	"REG"
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
	.word	_ZL3reg
	.word	1
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL3reg,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
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
