#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"12in1.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-16
	lla	a5,.LANCHOR0
	sw	ra,12(sp)
	sw	s1,4(sp)
	sw	s0,8(sp)
	lbu	s0,0(a5)
	lla	s1,.LANCHOR1
	lbu	a1,0(s1)
	slli	s0,s0,3
	andi	s0,s0,24
	slli	a4,s0,2
	srli	a1,a1,3
	or	a1,a1,a4
	li	a0,0
	sw	a4,0(sp)
	call	_Z7setchr4jj
	lbu	a1,1(s1)
	lw	a4,0(sp)
	li	a0,4096
	srli	a1,a1,3
	or	a1,a1,a4
	call	_Z7setchr4jj
	lla	a5,.LANCHOR0
	lbu	a4,0(a5)
	lbu	a1,0(s1)
	li	a0,32768
	andi	a4,a4,8
	beq	a4,zero,.L2
	andi	a1,a1,6
	or	a1,s0,a1
	call	_Z8setprg16jj
	lbu	a1,0(s1)
	li	a0,49152
	andi	a1,a1,6
	or	a1,s0,a1
	ori	a1,a1,1
	call	_Z8setprg16jj
	lla	a5,.LANCHOR0
.L3:
	lbu	a0,0(a5)
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	srli	a0,a0,2
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,16
	tail	_Z9setmirrori
.L2:
	andi	a1,a1,7
	or	a1,s0,a1
	call	_Z8setprg16jj
	ori	a1,s0,7
	li	a0,49152
	call	_Z8setprg16jj
	lla	a5,.LANCHOR0
	j	.L3
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL13BMC12IN1Writejh,"ax",@progbits
	.align	2
	.type	_ZL13BMC12IN1Writejh, @function
_ZL13BMC12IN1Writejh:
	li	a5,57344
	and	a0,a0,a5
	li	a4,49152
	beq	a0,a4,.L8
	beq	a0,a5,.L9
	li	a5,40960
	beq	a0,a5,.L11
	ret
.L8:
	la a5, .LANCHOR1+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L11:
	la a5, .LANCHOR1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L9:
	andi	a1,a1,15
	la a5, .LANCHOR0; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL13BMC12IN1Writejh, .-_ZL13BMC12IN1Writejh
	.section	.text._ZL13BMC12IN1Powerv,"ax",@progbits
	.align	2
	.type	_ZL13BMC12IN1Powerv, @function
_ZL13BMC12IN1Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR0; sb zero, 0(a5);
	li	s0,65536
	la a5, .LANCHOR1; sh zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL13BMC12IN1Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL13BMC12IN1Powerv, .-_ZL13BMC12IN1Powerv
	.section	.text._Z13BMC12IN1_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13BMC12IN1_InitP8CartInfo
	.hidden	_Z13BMC12IN1_InitP8CartInfo
	.type	_Z13BMC12IN1_InitP8CartInfo, @function
_Z13BMC12IN1_InitP8CartInfo:
	lla	a5,_ZL13BMC12IN1Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR2
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13BMC12IN1_InitP8CartInfo, .-_Z13BMC12IN1_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REGS"
	.align	2
.LC1:
	.string	"CTRL"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL6prgchr
	.word	2
	.word	.LC0
	.word	_ZL4ctrl
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL4ctrl,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL4ctrl, @object
	.size	_ZL4ctrl, 1
_ZL4ctrl:
	.zero	1
	.section	.sbss._ZL6prgchr,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL6prgchr, @object
	.size	_ZL6prgchr, 2
_ZL6prgchr:
	.zero	2
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
