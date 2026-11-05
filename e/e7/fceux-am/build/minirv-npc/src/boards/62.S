#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"62.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lhu	a5,0(s0)
	la a0, .LANCHOR1; lbu a0, 0(a0);
	andi	a0,a0,3
	slli	a5,a5,2
	andi	a5,a5,124
	or	a0,a5,a0
	sw	ra,8(sp)
	call	_Z7setchr8j
	lhu	a5,0(s0)
	srli	a1,a5,8
	andi	a4,a5,32
	andi	a1,a1,63
	andi	a5,a5,64
	or	a1,a1,a5
	beq	a4,zero,.L2
	li	a0,32768
	call	_Z8setprg16jj
	lhu	a5,0(s0)
	li	a0,49152
	srli	a1,a5,8
	andi	a1,a1,63
	andi	a5,a5,64
	or	a1,a1,a5
	call	_Z8setprg16jj
.L3:
	lhu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,7
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L2:
	srli	a1,a1,1
	li	a0,32768
	call	_Z8setprg32jj
	j	.L3
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M62Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M62Resetv, @function
_ZL8M62Resetv:
	la a5, .LANCHOR0; sh zero, 0(a5);
	la a5, .LANCHOR1; sb zero, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL8M62Resetv, .-_ZL8M62Resetv
	.section	.text._ZL8M62Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M62Writejh, @function
_ZL8M62Writejh:
	slli	a0,a0,18
	srli	a0,a0,18
	andi	a1,a1,3
	la a5, .LANCHOR0; sh a0, 0(a5);
	la a5, .LANCHOR1; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL8M62Writejh, .-_ZL8M62Writejh
	.section	.text._ZL8M62Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M62Powerv, @function
_ZL8M62Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR0; sh zero, 0(a5);
	li	s0,65536
	la a5, .LANCHOR1; sb zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_ZL8M62Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_Z6CartBRj
	li	a0,32768
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL8M62Powerv, .-_ZL8M62Powerv
	.section	.text._Z13Mapper62_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper62_InitP8CartInfo
	.hidden	_Z13Mapper62_InitP8CartInfo
	.type	_Z13Mapper62_InitP8CartInfo, @function
_Z13Mapper62_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,_ZL8M62Powerv
	sw	a5,0(a0)
	lla	a5,_ZL8M62Resetv
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
	.size	_Z13Mapper62_InitP8CartInfo, .-_Z13Mapper62_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"BANK"
	.align	2
.LC1:
	.string	"MODE"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL4bank
	.word	1
	.word	.LC0
	.word	_ZL4mode
	.word	2
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL4bank,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL4bank, @object
	.size	_ZL4bank, 1
_ZL4bank:
	.zero	1
	.section	.sbss._ZL4mode,"aw",@nobits
	.align	1
	.set	.LANCHOR0,. + 0
	.type	_ZL4mode, @object
	.size	_ZL4mode, 2
_ZL4mode:
	.zero	2
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
