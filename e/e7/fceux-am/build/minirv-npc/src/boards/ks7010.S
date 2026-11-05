#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ks7010.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	la a1, .LANCHOR0; lbu a1, 0(a1);
	li	a0,24576
	sw	ra,8(sp)
	call	_Z7setprg8jj
	li	a1,10
	li	a0,32768
	call	_Z7setprg8jj
	li	a1,11
	li	a0,40960
	call	_Z7setprg8jj
	li	a1,6
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,7
	li	a0,57344
	call	_Z7setprg8jj
	li	a0,12
	call	_Z7setchr8j
	lw	ra,8(sp)
	la a0, .LANCHOR1; lbu a0, 0(a0);
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.rodata._ZL14UNLKS7010Resetv.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"preg %02x %02x %02x\n"
	.section	.text._ZL14UNLKS7010Resetv,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7010Resetv, @function
_ZL14UNLKS7010Resetv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,.LANCHOR0
	lbu	a1,0(a5)
	li	a4,16
	lbu	a2,1(a5)
	addi	a1,a1,1
	andi	a1,a1,0xff
	sb	a1,0(a5)
	lbu	a3,2(a5)
	beq	a1,a4,.L10
	lla	a0,.LC0
	call	printf
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
.L10:
	addi	a2,a2,1
	la a4, .LANCHOR0; sb zero, 0(a4);
	andi	a2,a2,0xff
	beq	a2,a1,.L8
	sb	a2,1(a5)
	li	a1,0
	lla	a0,.LC0
	call	printf
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
.L8:
	addi	a3,a3,1
	andi	a3,a3,0xff
	sb	a3,2(a5)
	li	a2,0
	li	a1,0
	lla	a0,.LC0
	la a4, .LANCHOR0+1; sb zero, 0(a4);
	call	printf
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
	.size	_ZL14UNLKS7010Resetv, .-_ZL14UNLKS7010Resetv
	.section	.text._ZL14UNLKS7010Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7010Powerv, @function
_ZL14UNLKS7010Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	lla	a5,.LANCHOR0
	sh	zero,0(a5)
	sb	zero,2(a5)
	call	_ZL4Syncv
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
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
	li	a0,16384
	lla	a2,_ZL14UNLKS7010Writejh
	addi	a0,a0,32
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL14UNLKS7010Powerv, .-_ZL14UNLKS7010Powerv
	.section	.rodata._ZL14UNLKS7010Writejh.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"bs %04x %02x\n"
	.section	.text._ZL14UNLKS7010Writejh,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7010Writejh, @function
_ZL14UNLKS7010Writejh:
	li	a5,16384
	addi	a5,a5,37
	mv	a2,a1
	beq	a0,a5,.L15
	mv	a1,a0
	lla	a0,.LC1
	tail	printf
.L15:
	srli	a2,a1,3
	xori	a2,a2,1
	andi	a2,a2,1
	la a5, .LANCHOR1; sb a2, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL14UNLKS7010Writejh, .-_ZL14UNLKS7010Writejh
	.section	.text._Z14UNLKS7010_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLKS7010_InitP8CartInfo
	.hidden	_Z14UNLKS7010_InitP8CartInfo
	.type	_Z14UNLKS7010_InitP8CartInfo, @function
_Z14UNLKS7010_InitP8CartInfo:
	lla	a5,_ZL14UNLKS7010Powerv
	sw	a5,0(a0)
	lla	a5,_ZL14UNLKS7010Resetv
	sw	a5,4(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR2
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14UNLKS7010_InitP8CartInfo, .-_Z14UNLKS7010_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"PREG"
	.align	2
.LC3:
	.string	"CREG"
	.align	2
.LC4:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL4preg
	.word	4
	.word	.LC2
	.word	_ZL4creg
	.word	1
	.word	.LC3
	.word	_ZL4mirr
	.word	1
	.word	.LC4
	.word	0
	.zero	8
	.section	.sbss._ZL4creg,"aw",@nobits
	.type	_ZL4creg, @object
	.size	_ZL4creg, 1
_ZL4creg:
	.zero	1
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL4preg,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4preg, @object
	.size	_ZL4preg, 4
_ZL4preg:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
