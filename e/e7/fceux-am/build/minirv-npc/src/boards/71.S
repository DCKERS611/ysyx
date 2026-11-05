#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"71.cpp"
	.option nopic
	.text
	.section	.text._ZL8M71Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M71Powerv, @function
_ZL8M71Powerv:
	addi	sp,sp,-12
	la a1, .LANCHOR1; lbu a1, 0(a1);
	li	a0,32768
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR0; sb zero, 0(a5);
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	li	a0,0
	call	_Z7setchr8j
	la a0, .LANCHOR0; lbu a0, 0(a0);
	bne	a0,zero,.L8
.L2:
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL8M71Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
.L8:
	call	_Z9setmirrori
	j	.L2
	.size	_ZL8M71Powerv, .-_ZL8M71Powerv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	addi	sp,sp,-12
	la a1, .LANCHOR1; lbu a1, 0(a1);
	li	a0,32768
	sw	ra,8(sp)
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	li	a0,0
	call	_Z7setchr8j
	la a0, .LANCHOR0; lbu a0, 0(a0);
	bne	a0,zero,.L12
	lw	ra,8(sp)
	addi	sp,sp,12
	jr	ra
.L12:
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M71Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M71Writejh, @function
_ZL8M71Writejh:
	addi	sp,sp,-12
	li	a5,61440
	and	a0,a0,a5
	sw	ra,8(sp)
	sw	s0,4(sp)
	li	a5,36864
	beq	a0,a5,.L18
	la a5, .LANCHOR1; sb a1, 0(a5);
	lla	s0,.LANCHOR0
.L15:
	li	a0,32768
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	li	a0,0
	call	_Z7setchr8j
	lbu	a0,0(s0)
	bne	a0,zero,.L19
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L18:
	srli	a1,a1,4
	andi	a1,a1,1
	addi	a1,a1,2
	lla	s0,.LANCHOR0
	sb	a1,0(s0)
	la a1, .LANCHOR1; lbu a1, 0(a1);
	j	.L15
.L19:
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL8M71Writejh, .-_ZL8M71Writejh
	.section	.text._Z13Mapper71_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper71_InitP8CartInfo
	.hidden	_Z13Mapper71_InitP8CartInfo
	.type	_Z13Mapper71_InitP8CartInfo, @function
_Z13Mapper71_InitP8CartInfo:
	lla	a5,_ZL8M71Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR2
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper71_InitP8CartInfo, .-_Z13Mapper71_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PREG"
	.align	2
.LC1:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL4preg
	.word	1
	.word	.LC0
	.word	_ZL4mirr
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL4preg,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL4preg, @object
	.size	_ZL4preg, 1
_ZL4preg:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
