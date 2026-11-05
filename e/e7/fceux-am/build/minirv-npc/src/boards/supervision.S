#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"supervision.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	li	a0,0
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	lla	s1,PRGptr
	call	_Z7setchr8j
	lw	a5,4(s1)
	lla	s0,.LANCHOR0
	beq	a5,zero,.L2
	lbu	a0,0(s0)
	li	a1,24576
	slli	a2,a0,4
	andi	a2,a2,48
	srli	a0,a0,2
	ori	a2,a2,15
	andi	a0,a0,3
	call	_Z8setprg8rijj
.L3:
	lbu	a0,0(s0)
	andi	a5,a0,16
	beq	a5,zero,.L4
	lw	a5,4(s1)
	la a2, .LANCHOR1; lbu a2, 0(a2);
	slli	a1,a0,3
	andi	a2,a2,7
	beq	a5,zero,.L5
	andi	a1,a1,24
	srli	a0,a0,2
	or	a2,a1,a2
	andi	a0,a0,3
	li	a1,32768
	call	_Z9setprg16rijj
	lbu	a0,0(s0)
	li	a1,49152
	slli	a2,a0,3
	andi	a2,a2,24
	srli	a0,a0,2
	ori	a2,a2,7
	andi	a0,a0,3
	call	_Z9setprg16rijj
	j	.L6
.L4:
	lw	a5,16(s1)
	beq	a5,zero,.L7
	li	a2,0
	li	a1,32768
	li	a0,4
	call	_Z9setprg32rijj
.L6:
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	srli	a0,a0,5
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L2:
	lbu	a1,0(s0)
	li	a0,24576
	slli	a1,a1,4
	andi	a1,a1,255
	ori	a1,a1,15
	addi	a1,a1,4
	call	_Z7setprg8jj
	j	.L3
.L5:
	andi	a1,a1,120
	or	a1,a1,a2
	addi	a1,a1,2
	li	a0,32768
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	li	a0,49152
	slli	a1,a1,3
	andi	a1,a1,120
	ori	a1,a1,7
	addi	a1,a1,2
	call	_Z8setprg16jj
	j	.L6
.L7:
	li	a1,0
	li	a0,32768
	call	_Z8setprg32jj
	j	.L6
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12SuperRestorei,"ax",@progbits
	.align	2
	.type	_ZL12SuperRestorei, @function
_ZL12SuperRestorei:
	tail	_ZL4Syncv
	.size	_ZL12SuperRestorei, .-_ZL12SuperRestorei
	.section	.text._ZL10SuperResetv,"ax",@progbits
	.align	2
	.type	_ZL10SuperResetv, @function
_ZL10SuperResetv:
	la a5, .LANCHOR1; sb zero, 0(a5);
	la a5, .LANCHOR0; sb zero, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL10SuperResetv, .-_ZL10SuperResetv
	.section	.text._ZL12SuperWriteHijh,"ax",@progbits
	.align	2
	.type	_ZL12SuperWriteHijh, @function
_ZL12SuperWriteHijh:
	la a5, .LANCHOR1; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL12SuperWriteHijh, .-_ZL12SuperWriteHijh
	.section	.text._ZL12SuperWriteLojh,"ax",@progbits
	.align	2
	.type	_ZL12SuperWriteLojh, @function
_ZL12SuperWriteLojh:
	lla	a4,.LANCHOR0
	lbu	a5,0(a4)
	andi	a5,a5,16
	beq	a5,zero,.L15
	ret
.L15:
	sb	a1,0(a4)
	tail	_ZL4Syncv
	.size	_ZL12SuperWriteLojh, .-_ZL12SuperWriteLojh
	.section	.text._ZL10SuperPowerv,"ax",@progbits
	.align	2
	.type	_ZL10SuperPowerv, @function
_ZL10SuperPowerv:
	li	a1,32768
	addi	sp,sp,-12
	lla	a2,_ZL12SuperWriteLojh
	addi	a1,a1,-1
	li	a0,24576
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL12SuperWriteHijh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a5, .LANCHOR1; sb zero, 0(a5);
	la a5, .LANCHOR0; sb zero, 0(a5);
	addi	sp,sp,12
	tail	_ZL4Syncv
	.size	_ZL10SuperPowerv, .-_ZL10SuperPowerv
	.section	.text._Z18Supervision16_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z18Supervision16_InitP8CartInfo
	.hidden	_Z18Supervision16_InitP8CartInfo
	.type	_Z18Supervision16_InitP8CartInfo, @function
_Z18Supervision16_InitP8CartInfo:
	lla	a5,_ZL10SuperPowerv
	sw	a5,0(a0)
	lla	a5,_ZL10SuperResetv
	sw	a5,4(a0)
	lla	a5,_ZL12SuperRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR2
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z18Supervision16_InitP8CartInfo, .-_Z18Supervision16_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"L1"
	.align	2
.LC1:
	.string	"L2"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL4cmd0
	.word	1
	.word	.LC0
	.word	_ZL4cmd1
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL4cmd0,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL4cmd0, @object
	.size	_ZL4cmd0, 1
_ZL4cmd0:
	.zero	1
	.section	.sbss._ZL4cmd1,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL4cmd1, @object
	.size	_ZL4cmd1, 1
_ZL4cmd1:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
