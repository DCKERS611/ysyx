#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ks7013.cpp"
	.option nopic
	.text
	.section	.text._ZL15UNLKS7013BPowerv,"ax",@progbits
	.align	2
	.type	_ZL15UNLKS7013BPowerv, @function
_ZL15UNLKS7013BPowerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	li	a1,0
	lla	s0,.LANCHOR1
	li	a0,32768
	sb	zero,0(s0)
	la a5, .LANCHOR0; sb zero, 0(a5);
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	lbu	a0,0(s0)
	li	s0,65536
	call	_Z9setmirrori
	li	a0,0
	call	_Z7setchr8j
	li	a1,32768
	lla	a2,_ZL17UNLKS7013BLoWritejh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL17UNLKS7013BHiWritejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL15UNLKS7013BPowerv, .-_ZL15UNLKS7013BPowerv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	addi	sp,sp,-12
	la a1, .LANCHOR0; lbu a1, 0(a1);
	li	a0,32768
	sw	ra,8(sp)
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	la a0, .LANCHOR1; lbu a0, 0(a0);
	call	_Z9setmirrori
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL17UNLKS7013BLoWritejh,"ax",@progbits
	.align	2
	.type	_ZL17UNLKS7013BLoWritejh, @function
_ZL17UNLKS7013BLoWritejh:
	addi	sp,sp,-12
	li	a0,32768
	sw	ra,8(sp)
	la a4, .LANCHOR0; sb a1, 0(a4);
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	la a0, .LANCHOR1; lbu a0, 0(a0);
	call	_Z9setmirrori
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL17UNLKS7013BLoWritejh, .-_ZL17UNLKS7013BLoWritejh
	.section	.text._ZL15UNLKS7013BResetv,"ax",@progbits
	.align	2
	.type	_ZL15UNLKS7013BResetv, @function
_ZL15UNLKS7013BResetv:
	addi	sp,sp,-12
	li	a1,0
	li	a0,32768
	sw	ra,8(sp)
	la a5, .LANCHOR0; sb zero, 0(a5);
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	la a0, .LANCHOR1; lbu a0, 0(a0);
	call	_Z9setmirrori
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL15UNLKS7013BResetv, .-_ZL15UNLKS7013BResetv
	.section	.text._ZL17UNLKS7013BHiWritejh,"ax",@progbits
	.align	2
	.type	_ZL17UNLKS7013BHiWritejh, @function
_ZL17UNLKS7013BHiWritejh:
	addi	sp,sp,-12
	not	a5,a1
	sw	s0,4(sp)
	andi	a5,a5,1
	lla	s0,.LANCHOR1
	la a1, .LANCHOR0; lbu a1, 0(a1);
	li	a0,32768
	sw	ra,8(sp)
	sb	a5,0(s0)
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	lbu	a0,0(s0)
	call	_Z9setmirrori
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL17UNLKS7013BHiWritejh, .-_ZL17UNLKS7013BHiWritejh
	.section	.text._Z15UNLKS7013B_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z15UNLKS7013B_InitP8CartInfo
	.hidden	_Z15UNLKS7013B_InitP8CartInfo
	.type	_Z15UNLKS7013B_InitP8CartInfo, @function
_Z15UNLKS7013B_InitP8CartInfo:
	lla	a5,_ZL15UNLKS7013BPowerv
	sw	a5,0(a0)
	lla	a5,_ZL15UNLKS7013BResetv
	sw	a5,4(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR2
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z15UNLKS7013B_InitP8CartInfo, .-_Z15UNLKS7013B_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REGS"
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
