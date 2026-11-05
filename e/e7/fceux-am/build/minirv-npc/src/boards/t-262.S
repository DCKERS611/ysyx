#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"t-262.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	li	a0,0
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	s0,.LANCHOR0
	call	_Z7setchr8j
	lla	s1,.LANCHOR1
	lbu	a5,0(s1)
	lbu	a1,0(s0)
	li	a0,32768
	or	a1,a1,a5
	call	_Z8setprg16jj
	la a4, .LANCHOR2; lbu a4, 0(a4);
	lbu	a1,0(s0)
	li	a5,7
	beq	a4,zero,.L2
	lbu	a5,0(s1)
.L2:
	li	a0,49152
	or	a1,a1,a5
	call	_Z8setprg16jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	la a0, .LANCHOR3; lbu a0, 0(a0);
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL14BMCT262Restorei,"ax",@progbits
	.align	2
	.type	_ZL14BMCT262Restorei, @function
_ZL14BMCT262Restorei:
	tail	_ZL4Syncv
	.size	_ZL14BMCT262Restorei, .-_ZL14BMCT262Restorei
	.section	.text._ZL12BMCT262Resetv,"ax",@progbits
	.align	2
	.type	_ZL12BMCT262Resetv, @function
_ZL12BMCT262Resetv:
	la a5, .LANCHOR2; sb zero, 0(a5);
	la a5, .LANCHOR0; sb zero, 0(a5);
	la a5, .LANCHOR1; sb zero, 0(a5);
	la a5, .LANCHOR4; sb zero, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL12BMCT262Resetv, .-_ZL12BMCT262Resetv
	.section	.text._ZL12BMCT262Writejh,"ax",@progbits
	.align	2
	.type	_ZL12BMCT262Writejh, @function
_ZL12BMCT262Writejh:
	lla	a3,.LANCHOR4
	lbu	a5,0(a3)
	bne	a5,zero,.L11
	srli	a4,a0,2
	srli	t1,a0,3
	srli	a5,a0,1
	andi	t1,t1,32
	srli	a2,a0,13
	andi	a4,a4,24
	xori	a5,a5,1
	or	a4,a4,t1
	andi	a0,a0,-128
	andi	a5,a5,1
	andi	a2,a2,1
	la t1, .LANCHOR0; sb a4, 0(t1);
	sb	a2,0(a3)
	la a4, .LANCHOR2; sb a0, 0(a4);
	la a4, .LANCHOR3; sb a5, 0(a4);
.L11:
	andi	a1,a1,7
	la a5, .LANCHOR1; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL12BMCT262Writejh, .-_ZL12BMCT262Writejh
	.section	.text._ZL12BMCT262Powerv,"ax",@progbits
	.align	2
	.type	_ZL12BMCT262Powerv, @function
_ZL12BMCT262Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR2; sb zero, 0(a5);
	li	s0,65536
	la a5, .LANCHOR0; sb zero, 0(a5);
	la a5, .LANCHOR1; sb zero, 0(a5);
	la a5, .LANCHOR4; sb zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_ZL12BMCT262Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_Z6CartBRj
	li	a0,32768
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL12BMCT262Powerv, .-_ZL12BMCT262Powerv
	.section	.text._Z12BMCT262_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12BMCT262_InitP8CartInfo
	.hidden	_Z12BMCT262_InitP8CartInfo
	.type	_Z12BMCT262_InitP8CartInfo, @function
_Z12BMCT262_InitP8CartInfo:
	lla	a5,_ZL12BMCT262Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12BMCT262Resetv
	sw	a5,4(a0)
	lla	a5,_ZL14BMCT262Restorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR5
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z12BMCT262_InitP8CartInfo, .-_Z12BMCT262_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"BANK"
	.align	2
.LC1:
	.string	"BASE"
	.align	2
.LC2:
	.string	"LOCK"
	.align	2
.LC3:
	.string	"MIRR"
	.align	2
.LC4:
	.string	"MODE"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 72
_ZL9StateRegs:
	.word	_ZL4bank
	.word	1
	.word	.LC0
	.word	_ZL4base
	.word	1
	.word	.LC1
	.word	_ZL4lock
	.word	1
	.word	.LC2
	.word	_ZL4mirr
	.word	1
	.word	.LC3
	.word	_ZL4mode
	.word	1
	.word	.LC4
	.word	0
	.zero	8
	.section	.sbss._ZL4bank,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL4bank, @object
	.size	_ZL4bank, 1
_ZL4bank:
	.zero	1
	.section	.sbss._ZL4base,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL4base, @object
	.size	_ZL4base, 1
_ZL4base:
	.zero	1
	.section	.sbss._ZL4lock,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL4lock, @object
	.size	_ZL4lock, 1
_ZL4lock:
	.zero	1
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL4mode,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL4mode, @object
	.size	_ZL4mode, 1
_ZL4mode:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
