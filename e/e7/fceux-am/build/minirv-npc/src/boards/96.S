#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"96.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	li	a0,2
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z9setmirrori
	lla	s0,.LANCHOR0
	lbu	a1,0(s0)
	li	a0,32768
	andi	a1,a1,3
	call	_Z8setprg32jj
	lbu	a5,0(s0)
	la a1, .LANCHOR1; lbu a1, 0(a1);
	li	a0,0
	andi	a5,a5,4
	or	a1,a5,a1
	call	_Z7setchr4jj
	lbu	a1,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a1,a1,4
	li	a0,4096
	ori	a1,a1,3
	addi	sp,sp,12
	tail	_Z7setchr4jj
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M96Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M96Writejh, @function
_ZL8M96Writejh:
	la a5, .LANCHOR0; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL8M96Writejh, .-_ZL8M96Writejh
	.section	.text._ZL8M96Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M96Powerv, @function
_ZL8M96Powerv:
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
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL8M96Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL8M96Powerv, .-_ZL8M96Powerv
	.section	.text._ZL7M96Hookj,"ax",@progbits
	.align	2
	.type	_ZL7M96Hookj, @function
_ZL7M96Hookj:
	li	a5,12288
	and	a5,a0,a5
	li	a4,8192
	beq	a5,a4,.L10
	ret
.L10:
	srli	a0,a0,8
	andi	a0,a0,3
	la a5, .LANCHOR1; sb a0, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL7M96Hookj, .-_ZL7M96Hookj
	.section	.text._Z13Mapper96_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper96_InitP8CartInfo
	.hidden	_Z13Mapper96_InitP8CartInfo
	.type	_Z13Mapper96_InitP8CartInfo, @function
_Z13Mapper96_InitP8CartInfo:
	lla	a5,_ZL8M96Powerv
	sw	a5,0(a0)
	lla	a5,_ZL7M96Hookj
	la a4, PPU_hook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR2
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper96_InitP8CartInfo, .-_Z13Mapper96_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REG"
	.align	2
.LC1:
	.string	"PPUL"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL3reg
	.word	1
	.word	.LC0
	.word	_ZL8ppulatch
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL3reg,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.section	.sbss._ZL8ppulatch,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL8ppulatch, @object
	.size	_ZL8ppulatch, 1
_ZL8ppulatch:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
