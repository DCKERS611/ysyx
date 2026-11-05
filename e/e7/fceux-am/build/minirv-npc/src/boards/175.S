#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"175.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lbu	a0,0(s0)
	sw	ra,8(sp)
	call	_Z7setchr8j
	la a5, .LANCHOR1; lbu a5, 0(a5);
	beq	a5,zero,.L5
.L2:
	lbu	a1,0(s0)
	li	a0,57344
	slli	a1,a1,1
	addi	a1,a1,1
	call	_Z7setprg8jj
	la a0, .LANCHOR2; lbu a0, 0(a0);
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,2
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L5:
	lbu	a1,0(s0)
	li	a0,32768
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	li	a0,49152
	slli	a1,a1,1
	call	_Z7setprg8jj
	j	.L2
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL10M175Write2jh,"ax",@progbits
	.align	2
	.type	_ZL10M175Write2jh, @function
_ZL10M175Write2jh:
	andi	a1,a1,15
	la a5, .LANCHOR0; sb a1, 0(a5);
	li	a5,1
	la a4, .LANCHOR1; sb a5, 0(a4);
	tail	_ZL4Syncv
	.size	_ZL10M175Write2jh, .-_ZL10M175Write2jh
	.section	.text._ZL10M175Write1jh,"ax",@progbits
	.align	2
	.type	_ZL10M175Write1jh, @function
_ZL10M175Write1jh:
	la a5, .LANCHOR2; sb a1, 0(a5);
	li	a5,1
	la a4, .LANCHOR1; sb a5, 0(a4);
	tail	_ZL4Syncv
	.size	_ZL10M175Write1jh, .-_ZL10M175Write1jh
	.section	.text._ZL9M175Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M175Powerv, @function
_ZL9M175Powerv:
	li	a1,65536
	addi	sp,sp,-12
	addi	a1,a1,-1
	lla	a2,_ZL8M175Readj
	li	a0,32768
	sw	ra,8(sp)
	la a5, .LANCHOR1; sb zero, 0(a5);
	la a5, .LANCHOR2; sb zero, 0(a5);
	la a5, .LANCHOR0; sb zero, 0(a5);
	call	_Z14SetReadHandleriiPFhjE
	lla	a2,_ZL10M175Write1jh
	li	a1,32768
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a2,_ZL10M175Write2jh
	li	a1,40960
	li	a0,40960
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
	.size	_ZL9M175Powerv, .-_ZL9M175Powerv
	.section	.text._ZL8M175Readj,"ax",@progbits
	.align	2
	.type	_ZL8M175Readj, @function
_ZL8M175Readj:
	li	a5,65536
	addi	a5,a5,-4
	beq	a0,a5,.L17
	tail	_Z6CartBRj
.L17:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	a0,0(sp)
	la a5, .LANCHOR1; sb zero, 0(a5);
	call	_ZL4Syncv
	lw	a0,0(sp)
	lw	ra,12(sp)
	addi	sp,sp,16
	tail	_Z6CartBRj
	.size	_ZL8M175Readj, .-_ZL8M175Readj
	.section	.text._Z14Mapper175_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper175_InitP8CartInfo
	.hidden	_Z14Mapper175_InitP8CartInfo
	.type	_Z14Mapper175_InitP8CartInfo, @function
_Z14Mapper175_InitP8CartInfo:
	lla	a5,_ZL9M175Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR3
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper175_InitP8CartInfo, .-_Z14Mapper175_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REG"
	.align	2
.LC1:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR3,. + 0
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
	.set	.LANCHOR2,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL5delay,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL5delay, @object
	.size	_ZL5delay, 1
_ZL5delay:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
