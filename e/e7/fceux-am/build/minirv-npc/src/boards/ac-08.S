#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ac-08.cpp"
	.option nopic
	.text
	.section	.text._ZL9AC08Powerv,"ax",@progbits
	.align	2
	.type	_ZL9AC08Powerv, @function
_ZL9AC08Powerv:
	addi	sp,sp,-12
	li	a1,0
	li	a0,24576
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR0; sb zero, 0(a5);
	call	_Z7setprg8jj
	li	a2,0
	li	a1,32768
	li	a0,1
	call	_Z9setprg32rijj
	li	a0,0
	call	_Z7setchr8j
	la a0, .LANCHOR1; lbu a0, 0(a0);
	call	_Z9setmirrori
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,16384
	addi	a1,a1,37
	mv	a0,a1
	lla	a2,_ZL8AC08Mirrjh
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL9AC08Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL9AC08Powerv, .-_ZL9AC08Powerv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	addi	sp,sp,-12
	la a1, .LANCHOR0; lbu a1, 0(a1);
	li	a0,24576
	sw	ra,8(sp)
	call	_Z7setprg8jj
	li	a2,0
	li	a1,32768
	li	a0,1
	call	_Z9setprg32rijj
	li	a0,0
	call	_Z7setchr8j
	lw	ra,8(sp)
	la a0, .LANCHOR1; lbu a0, 0(a0);
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8AC08Mirrjh,"ax",@progbits
	.align	2
	.type	_ZL8AC08Mirrjh, @function
_ZL8AC08Mirrjh:
	srli	a5,a1,3
	addi	sp,sp,-12
	xori	a5,a5,1
	sw	s0,4(sp)
	andi	a5,a5,1
	lla	s0,.LANCHOR1
	la a1, .LANCHOR0; lbu a1, 0(a1);
	li	a0,24576
	sw	ra,8(sp)
	sb	a5,0(s0)
	call	_Z7setprg8jj
	li	a2,0
	li	a1,32768
	li	a0,1
	call	_Z9setprg32rijj
	li	a0,0
	call	_Z7setchr8j
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL8AC08Mirrjh, .-_ZL8AC08Mirrjh
	.section	.text._ZL9AC08Writejh,"ax",@progbits
	.align	2
	.type	_ZL9AC08Writejh, @function
_ZL9AC08Writejh:
	addi	sp,sp,-12
	li	a5,32768
	sw	ra,8(sp)
	addi	a5,a5,1
	andi	a4,a1,15
	bne	a0,a5,.L10
	srli	a1,a1,1
	andi	a4,a1,15
.L10:
	mv	a1,a4
	li	a0,24576
	la a5, .LANCHOR0; sb a4, 0(a5);
	call	_Z7setprg8jj
	li	a2,0
	li	a1,32768
	li	a0,1
	call	_Z9setprg32rijj
	li	a0,0
	call	_Z7setchr8j
	lw	ra,8(sp)
	la a0, .LANCHOR1; lbu a0, 0(a0);
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL9AC08Writejh, .-_ZL9AC08Writejh
	.section	.text._Z9AC08_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z9AC08_InitP8CartInfo
	.hidden	_Z9AC08_InitP8CartInfo
	.type	_Z9AC08_InitP8CartInfo, @function
_Z9AC08_InitP8CartInfo:
	lla	a5,_ZL9AC08Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR2
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z9AC08_InitP8CartInfo, .-_Z9AC08_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REG"
	.align	2
.LC1:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL3reg
	.word	1
	.word	.LC0
	.word	_ZL4mirr
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
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
