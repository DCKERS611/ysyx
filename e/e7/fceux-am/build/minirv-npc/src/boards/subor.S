#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"subor.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	lla	a3,.LANCHOR0
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lbu	a2,1(a3)
	lbu	a4,0(a3)
	lbu	a5,2(a3)
	lbu	a1,3(a3)
	xor	a4,a2,a4
	slli	a4,a4,1
	andi	a3,a2,8
	andi	a4,a4,32
	xor	a5,a5,a1
	beq	a3,zero,.L2
	andi	a5,a5,30
	add	s0,a5,a4
	la a5, .LANCHOR1; lbu a5, 0(a5);
	addi	s1,s0,1
	beq	a5,zero,.L3
	mv	a1,s1
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s0
	li	a0,49152
	call	_Z8setprg16jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
.L2:
	andi	a5,a5,31
	andi	a2,a2,4
	add	s0,a5,a4
	beq	a2,zero,.L5
	li	a0,32768
	li	a1,31
	call	_Z8setprg16jj
	mv	a1,s0
	li	a0,49152
	call	_Z8setprg16jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
.L5:
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	la a5, .LANCHOR1; lbu a5, 0(a5);
	beq	a5,zero,.L6
	li	a0,49152
	li	a1,32
	call	_Z8setprg16jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
.L3:
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s1
	li	a0,49152
	call	_Z8setprg16jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
.L6:
	li	a0,49152
	li	a1,7
	call	_Z8setprg16jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
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
	.section	.text._ZL9M166Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M166Writejh, @function
_ZL9M166Writejh:
	srli	a0,a0,13
	andi	a0,a0,3
	lla	a5,.LANCHOR0
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.size	_ZL9M166Writejh, .-_ZL9M166Writejh
	.section	.text._ZL9M166Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M166Powerv, @function
_ZL9M166Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR0; sw zero, 0(a5);
	li	s0,65536
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL9M166Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL9M166Powerv, .-_ZL9M166Powerv
	.section	.text._Z14Mapper166_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper166_InitP8CartInfo
	.hidden	_Z14Mapper166_InitP8CartInfo
	.type	_Z14Mapper166_InitP8CartInfo, @function
_Z14Mapper166_InitP8CartInfo:
	lla	a5,_ZL9M166Powerv
	sw	a5,0(a0)
	la a5, .LANCHOR1; sb zero, 0(a5);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR2
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper166_InitP8CartInfo, .-_Z14Mapper166_InitP8CartInfo
	.section	.text._Z14Mapper167_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper167_InitP8CartInfo
	.hidden	_Z14Mapper167_InitP8CartInfo
	.type	_Z14Mapper167_InitP8CartInfo, @function
_Z14Mapper167_InitP8CartInfo:
	lla	a5,_ZL9M166Powerv
	sw	a5,0(a0)
	li	a5,1
	la a4, .LANCHOR1; sb a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR2
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper167_InitP8CartInfo, .-_Z14Mapper167_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"DREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL4regs
	.word	4
	.word	.LC0
	.word	0
	.zero	8
	.section	.sbss._ZL4regs,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4regs, @object
	.size	_ZL4regs, 4
_ZL4regs:
	.zero	4
	.section	.sbss._ZL5is167,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL5is167, @object
	.size	_ZL5is167, 1
_ZL5is167:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
