#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"bonza.cpp"
	.option nopic
	.text
	.section	.text._ZL13M216Write5000jh,"ax",@progbits
	.align	2
	.type	_ZL13M216Write5000jh, @function
_ZL13M216Write5000jh:
	ret
	.size	_ZL13M216Write5000jh, .-_ZL13M216Write5000jh
	.section	.text._ZL12M216Read5000j,"ax",@progbits
	.align	2
	.type	_ZL12M216Read5000j, @function
_ZL12M216Read5000j:
	li	a0,0
	ret
	.size	_ZL12M216Read5000j, .-_ZL12M216Read5000j
	.section	.text._ZL5Powerv,"ax",@progbits
	.align	2
	.type	_ZL5Powerv, @function
_ZL5Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	li	a1,0
	lla	s0,.LANCHOR1
	li	a0,32768
	sb	zero,0(s0)
	la a5, .LANCHOR0; sb zero, 0(a5);
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	li	s0,65536
	call	_Z7setchr8j
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL11M216WriteHijh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a2,_ZL13M216Write5000jh
	li	a1,20480
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL12M216Read5000j
	li	a1,20480
	li	a0,20480
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL5Powerv, .-_ZL5Powerv
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
	.section	.text._ZL11M216WriteHijh,"ax",@progbits
	.align	2
	.type	_ZL11M216WriteHijh, @function
_ZL11M216WriteHijh:
	addi	sp,sp,-12
	andi	a4,a0,1
	srli	a0,a0,1
	sw	s0,4(sp)
	andi	a5,a0,7
	lla	s0,.LANCHOR1
	li	a0,32768
	mv	a1,a4
	sw	ra,8(sp)
	sb	a5,0(s0)
	la a3, .LANCHOR0; sb a4, 0(a3);
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL11M216WriteHijh, .-_ZL11M216WriteHijh
	.section	.text._Z14Mapper216_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper216_InitP8CartInfo
	.hidden	_Z14Mapper216_InitP8CartInfo
	.type	_Z14Mapper216_InitP8CartInfo, @function
_Z14Mapper216_InitP8CartInfo:
	lla	a5,_ZL5Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR2
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper216_InitP8CartInfo, .-_Z14Mapper216_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PREG"
	.align	2
.LC1:
	.string	"CREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL7prg_reg
	.word	1
	.word	.LC0
	.word	_ZL7chr_reg
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL7chr_reg,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL7chr_reg, @object
	.size	_ZL7chr_reg, 1
_ZL7chr_reg:
	.zero	1
	.section	.sbss._ZL7prg_reg,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL7prg_reg, @object
	.size	_ZL7prg_reg, 1
_ZL7prg_reg:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
