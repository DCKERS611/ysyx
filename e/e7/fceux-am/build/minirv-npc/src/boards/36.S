#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"36.cpp"
	.option nopic
	.text
	.section	.text._ZL7M36Readj,"ax",@progbits
	.align	2
	.type	_ZL7M36Readj, @function
_ZL7M36Readj:
	la a0, .LANCHOR0; lbu a0, 0(a0);
	ret
	.size	_ZL7M36Readj, .-_ZL7M36Readj
	.section	.text._ZL8M36Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M36Writejh, @function
_ZL8M36Writejh:
	addi	sp,sp,-12
	srli	a0,a0,12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	andi	a0,a0,7
	mv	s0,a1
	beq	a0,zero,.L4
	li	a5,4
	bne	a0,a5,.L6
	li	a0,0
	la a5, .LANCHOR1; sb zero, 0(a5);
	call	_Z9setmirrori
.L6:
	lla	s1,.LANCHOR0
	li	a0,32768
	srli	a1,s0,4
	sb	s0,0(s1)
	call	_Z8setprg32jj
	lbu	a0,0(s1)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	andi	a0,a0,15
	addi	sp,sp,12
	tail	_Z7setchr8j
.L4:
	li	a5,1
	li	a0,1
	la a4, .LANCHOR1; sb a5, 0(a4);
	call	_Z9setmirrori
	j	.L6
	.size	_ZL8M36Writejh, .-_ZL8M36Writejh
	.section	.text._ZL10M36Restorei,"ax",@progbits
	.align	2
	.type	_ZL10M36Restorei, @function
_ZL10M36Restorei:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	srli	a1,a1,4
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a0,a0,15
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL10M36Restorei, .-_ZL10M36Restorei
	.section	.text._ZL8M36Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M36Powerv, @function
_ZL8M36Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	li	a1,0
	lla	s0,.LANCHOR0
	li	a0,32768
	sb	zero,0(s0)
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	li	s0,65536
	andi	a0,a0,15
	call	_Z7setchr8j
	li	a1,16384
	addi	a1,a1,256
	mv	a0,a1
	lla	a2,_ZL7M36Readj
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-2
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL8M36Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL8M36Powerv, .-_ZL8M36Powerv
	.section	.text._Z13Mapper36_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper36_InitP8CartInfo
	.hidden	_Z13Mapper36_InitP8CartInfo
	.type	_Z13Mapper36_InitP8CartInfo, @function
_Z13Mapper36_InitP8CartInfo:
	lla	a5,_ZL8M36Powerv
	sw	a5,0(a0)
	lla	a5,_ZL10M36Restorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR2
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper36_InitP8CartInfo, .-_Z13Mapper36_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"LATC"
	.align	2
.LC1:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL6latche
	.word	1
	.word	.LC0
	.word	_ZL4mirr
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL6latche,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL6latche, @object
	.size	_ZL6latche, 1
_ZL6latche:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
