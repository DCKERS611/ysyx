#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"232.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	la a5, .LANCHOR0; lbu a5, 0(a5);
	sw	s0,4(sp)
	srli	s0,a5,2
	la a1, .LANCHOR1; lbu a1, 0(a1);
	andi	a5,a5,8
	andi	s0,s0,4
	or	s0,s0,a5
	andi	a1,a1,3
	or	a1,s0,a1
	li	a0,32768
	sw	ra,8(sp)
	call	_Z8setprg16jj
	li	a0,49152
	ori	a1,s0,3
	call	_Z8setprg16jj
	lw	s0,4(sp)
	lw	ra,8(sp)
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
	.section	.text._ZL13M232WritePregjh,"ax",@progbits
	.align	2
	.type	_ZL13M232WritePregjh, @function
_ZL13M232WritePregjh:
	la a5, .LANCHOR1; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL13M232WritePregjh, .-_ZL13M232WritePregjh
	.section	.text._ZL13M232WriteBankjh,"ax",@progbits
	.align	2
	.type	_ZL13M232WriteBankjh, @function
_ZL13M232WriteBankjh:
	la a5, .LANCHOR0; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL13M232WriteBankjh, .-_ZL13M232WriteBankjh
	.section	.text._ZL9M232Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M232Powerv, @function
_ZL9M232Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR1; sb zero, 0(a5);
	la a5, .LANCHOR0; sb zero, 0(a5);
	call	_ZL4Syncv
	li	a1,49152
	lla	a2,_ZL13M232WriteBankjh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL13M232WritePregjh
	li	a0,49152
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_Z6CartBRj
	li	a0,32768
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL9M232Powerv, .-_ZL9M232Powerv
	.section	.text._Z14Mapper232_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper232_InitP8CartInfo
	.hidden	_Z14Mapper232_InitP8CartInfo
	.type	_Z14Mapper232_InitP8CartInfo, @function
_Z14Mapper232_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,_ZL9M232Powerv
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
	.size	_Z14Mapper232_InitP8CartInfo, .-_Z14Mapper232_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"BANK"
	.align	2
.LC1:
	.string	"PREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL4bank
	.word	1
	.word	.LC0
	.word	_ZL4preg
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL4bank,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL4bank, @object
	.size	_ZL4bank, 1
_ZL4bank:
	.zero	1
	.section	.sbss._ZL4preg,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL4preg, @object
	.size	_ZL4preg, 1
_ZL4preg:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
