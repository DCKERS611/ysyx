#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"193.cpp"
	.option nopic
	.text
	.section	.text._ZL9M193Resetv,"ax",@progbits
	.align	2
	.type	_ZL9M193Resetv, @function
_ZL9M193Resetv:
	ret
	.size	_ZL9M193Resetv, .-_ZL9M193Resetv
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	la a0, .LANCHOR0; lbu a0, 0(a0);
	addi	sp,sp,-12
	xori	a0,a0,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	lla	s0,.LANCHOR1
	call	_Z9setmirrori
	lbu	a1,3(s0)
	li	a0,32768
	call	_Z7setprg8jj
	li	a1,13
	li	a0,40960
	call	_Z7setprg8jj
	li	a1,14
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,15
	li	a0,57344
	call	_Z7setprg8jj
	lbu	a1,0(s0)
	li	a0,0
	srli	a1,a1,2
	call	_Z7setchr4jj
	lbu	a1,1(s0)
	li	a0,4096
	srli	a1,a1,1
	call	_Z7setchr2jj
	lbu	a1,2(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,8192
	addi	a0,a0,-2048
	srli	a1,a1,1
	addi	sp,sp,12
	tail	_Z7setchr2jj
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M193Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M193Writejh, @function
_ZL9M193Writejh:
	andi	a0,a0,3
	lla	a5,.LANCHOR1
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.size	_ZL9M193Writejh, .-_ZL9M193Writejh
	.section	.text._ZL9M193Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M193Powerv, @function
_ZL9M193Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR2; sb zero, 0(a5);
	call	_ZL4Syncv
	li	a1,24576
	lla	a2,_ZL9M193Writejh
	addi	a1,a1,3
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_Z6CartBWjh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL9M193Powerv, .-_ZL9M193Powerv
	.section	.text._Z14Mapper193_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper193_InitP8CartInfo
	.hidden	_Z14Mapper193_InitP8CartInfo
	.type	_Z14Mapper193_InitP8CartInfo, @function
_Z14Mapper193_InitP8CartInfo:
	lla	a5,_ZL9M193Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M193Resetv
	sw	a5,4(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR3
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper193_InitP8CartInfo, .-_Z14Mapper193_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CMD"
	.align	2
.LC1:
	.string	"MIRR"
	.align	2
.LC2:
	.string	"BANK"
	.align	2
.LC3:
	.string	"REGS"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 60
_ZL9StateRegs:
	.word	_ZL3cmd
	.word	1
	.word	.LC0
	.word	_ZL6mirror
	.word	1
	.word	.LC1
	.word	_ZL4bank
	.word	1
	.word	.LC2
	.word	_ZL3reg
	.word	8
	.word	.LC3
	.word	0
	.zero	8
	.section	.sbss._ZL3cmd,"aw",@nobits
	.type	_ZL3cmd, @object
	.size	_ZL3cmd, 1
_ZL3cmd:
	.zero	1
	.section	.sbss._ZL3reg,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 8
_ZL3reg:
	.zero	8
	.section	.sbss._ZL4bank,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL4bank, @object
	.size	_ZL4bank, 1
_ZL4bank:
	.zero	1
	.section	.sbss._ZL6mirror,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL6mirror, @object
	.size	_ZL6mirror, 1
_ZL6mirror:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
