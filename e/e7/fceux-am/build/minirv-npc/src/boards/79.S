#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"79.cpp"
	.option nopic
	.text
	.section	.text._ZL8M79Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M79Powerv, @function
_ZL8M79Powerv:
	addi	sp,sp,-12
	li	a5,-1
	li	a1,255
	li	a0,32768
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a4, .LANCHOR0; sb a5, 0(a4);
	call	_Z8setprg32jj
	la a0, .LANCHOR1; lbu a0, 0(a0);
	call	_Z7setchr8j
	li	a1,24576
	li	a0,16384
	lla	a2,_ZL8M79Writejh
	addi	a1,a1,-1
	addi	a0,a0,256
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL8M79Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_Z6CartBRj
	li	a0,32768
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL8M79Powerv, .-_ZL8M79Powerv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	addi	sp,sp,-12
	li	a0,32768
	la a1, .LANCHOR0; lbu a1, 0(a1);
	sw	ra,8(sp)
	call	_Z8setprg32jj
	lw	ra,8(sp)
	la a0, .LANCHOR1; lbu a0, 0(a0);
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M79Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M79Writejh, @function
_ZL8M79Writejh:
	addi	sp,sp,-12
	li	a4,16384
	sw	ra,8(sp)
	sw	s0,4(sp)
	addi	a4,a4,256
	mv	a5,a1
	beq	a0,a4,.L7
	la a1, .LANCHOR0; lbu a1, 0(a1);
.L8:
	lla	s0,.LANCHOR1
	andi	a5,a5,7
	li	a0,32768
	sb	a5,0(s0)
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z7setchr8j
.L7:
	srli	a1,a1,3
	andi	a1,a1,1
	la a4, .LANCHOR0; sb a1, 0(a4);
	j	.L8
	.size	_ZL8M79Writejh, .-_ZL8M79Writejh
	.section	.text._Z13Mapper79_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper79_InitP8CartInfo
	.hidden	_Z13Mapper79_InitP8CartInfo
	.type	_Z13Mapper79_InitP8CartInfo, @function
_Z13Mapper79_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,_ZL8M79Powerv
	sw	a5,0(a0)
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
	.size	_Z13Mapper79_InitP8CartInfo, .-_Z13Mapper79_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CREG"
	.align	2
.LC1:
	.string	"PREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL4creg
	.word	1
	.word	.LC0
	.word	_ZL4preg
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL4creg,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL4creg, @object
	.size	_ZL4creg, 1
_ZL4creg:
	.zero	1
	.section	.sbss._ZL4preg,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL4preg, @object
	.size	_ZL4preg, 1
_ZL4preg:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
