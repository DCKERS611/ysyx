#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"gs-2013.cpp"
	.option nopic
	.text
	.section	.text._ZL14BMCGS2013Resetv,"ax",@progbits
	.align	2
	.type	_ZL14BMCGS2013Resetv, @function
_ZL14BMCGS2013Resetv:
	li	a5,-1
	la a4, .LANCHOR0; sb a5, 0(a4);
	ret
	.size	_ZL14BMCGS2013Resetv, .-_ZL14BMCGS2013Resetv
	.section	.text._ZL14BMCGS2013Powerv,"ax",@progbits
	.align	2
	.type	_ZL14BMCGS2013Powerv, @function
_ZL14BMCGS2013Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	li	a5,-1
	lla	s0,.LANCHOR0
	li	a2,-1
	li	a1,24576
	li	a0,0
	sb	a5,0(s0)
	call	_Z8setprg8rijj
	lbu	a2,0(s0)
	li	a1,32768
	li	s0,65536
	srli	a0,a2,3
	andi	a0,a0,1
	call	_Z9setprg32rijj
	li	a0,0
	call	_Z7setchr8j
	li	a1,32768
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL14BMCGS2013Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL14BMCGS2013Powerv, .-_ZL14BMCGS2013Powerv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	addi	sp,sp,-12
	li	a2,-1
	li	a1,24576
	li	a0,0
	sw	ra,8(sp)
	call	_Z8setprg8rijj
	la a2, .LANCHOR0; lbu a2, 0(a2);
	srli	a0,a2,3
	andi	a0,a0,1
	li	a1,32768
	call	_Z9setprg32rijj
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL14BMCGS2013Writejh,"ax",@progbits
	.align	2
	.type	_ZL14BMCGS2013Writejh, @function
_ZL14BMCGS2013Writejh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	a5,a1
	lla	s0,.LANCHOR0
	li	a2,-1
	li	a1,24576
	li	a0,0
	sw	ra,8(sp)
	sb	a5,0(s0)
	call	_Z8setprg8rijj
	lbu	a2,0(s0)
	li	a1,32768
	srli	a0,a2,3
	andi	a0,a0,1
	call	_Z9setprg32rijj
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL14BMCGS2013Writejh, .-_ZL14BMCGS2013Writejh
	.section	.text._Z14BMCGS2013_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14BMCGS2013_InitP8CartInfo
	.hidden	_Z14BMCGS2013_InitP8CartInfo
	.type	_Z14BMCGS2013_InitP8CartInfo, @function
_Z14BMCGS2013_InitP8CartInfo:
	lla	a5,_ZL14BMCGS2013Powerv
	sw	a5,0(a0)
	lla	a5,_ZL14BMCGS2013Resetv
	sw	a5,4(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR1
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14BMCGS2013_InitP8CartInfo, .-_Z14BMCGS2013_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REGS"
	.align	2
.LC1:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR1,. + 0
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
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
