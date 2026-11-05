#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"88.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lbu	a1,0(s0)
	li	a0,0
	sw	ra,8(sp)
	srli	a1,a1,1
	sw	s1,0(sp)
	call	_Z7setchr2jj
	lbu	a1,1(s0)
	li	s1,4096
	addi	a0,s1,-2048
	srli	a1,a1,1
	call	_Z7setchr2jj
	lbu	a1,2(s0)
	li	a0,4096
	ori	a1,a1,64
	call	_Z7setchr1jj
	lbu	a1,3(s0)
	addi	a0,s1,1024
	li	s1,8192
	ori	a1,a1,64
	call	_Z7setchr1jj
	lbu	a1,4(s0)
	addi	a0,s1,-2048
	ori	a1,a1,64
	call	_Z7setchr1jj
	lbu	a1,5(s0)
	addi	a0,s1,-1024
	ori	a1,a1,64
	call	_Z7setchr1jj
	lbu	a1,6(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,7(s0)
	li	a0,40960
	call	_Z7setprg8jj
	li	a1,-2
	li	a0,49152
	call	_Z7setprg8jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a1,-1
	li	a0,57344
	addi	sp,sp,12
	tail	_Z7setprg8jj
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL8M88Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M88Writejh, @function
_ZL8M88Writejh:
	li	a4,32768
	addi	a5,a4,1
	and	a0,a0,a5
	beq	a0,a4,.L5
	bne	a0,a5,.L11
	la a4, .LANCHOR1; lbu a4, 0(a4);
	lla	a5,.LANCHOR0
	add	a5,a5,a4
	sb	a1,0(a5)
	tail	_ZL4Syncv
.L11:
	ret
.L5:
	andi	a5,a1,7
	srli	a1,a1,6
	la a4, .LANCHOR1; sb a5, 0(a4);
	la a5, .LANCHOR2; sb a1, 0(a5);
	la a5, .LANCHOR3; lbu a5, 0(a5);
	bne	a5,zero,.L12
	ret
.L12:
	andi	a1,a1,1
	addi	a0,a1,2
	tail	_Z9setmirrori
	.size	_ZL8M88Writejh, .-_ZL8M88Writejh
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_ZL4Syncv
	la a5, .LANCHOR3; lbu a5, 0(a5);
	bne	a5,zero,.L16
	lw	ra,8(sp)
	addi	sp,sp,12
	jr	ra
.L16:
	lw	ra,8(sp)
	la a0, .LANCHOR2; lbu a0, 0(a0);
	andi	a0,a0,1
	addi	a0,a0,2
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M88Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M88Powerv, @function
_ZL8M88Powerv:
	addi	sp,sp,-12
	la a5, .LANCHOR0; sw zero, 0(a5);
	la a5, .LANCHOR0+4; sw zero, 0(a5);
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_ZL4Syncv
	la a5, .LANCHOR3; lbu a5, 0(a5);
	bne	a5,zero,.L23
.L18:
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL8M88Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
.L23:
	la a0, .LANCHOR2; lbu a0, 0(a0);
	andi	a0,a0,1
	addi	a0,a0,2
	call	_Z9setmirrori
	j	.L18
	.size	_ZL8M88Powerv, .-_ZL8M88Powerv
	.section	.text._Z13Mapper88_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper88_InitP8CartInfo
	.hidden	_Z13Mapper88_InitP8CartInfo
	.type	_Z13Mapper88_InitP8CartInfo, @function
_Z13Mapper88_InitP8CartInfo:
	lla	a5,_ZL8M88Powerv
	sw	a5,0(a0)
	la a5, .LANCHOR3; sb zero, 0(a5);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR4
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper88_InitP8CartInfo, .-_Z13Mapper88_InitP8CartInfo
	.section	.text._Z14Mapper154_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper154_InitP8CartInfo
	.hidden	_Z14Mapper154_InitP8CartInfo
	.type	_Z14Mapper154_InitP8CartInfo, @function
_Z14Mapper154_InitP8CartInfo:
	lla	a5,_ZL8M88Powerv
	sw	a5,0(a0)
	li	a5,1
	la a4, .LANCHOR3; sb a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR4
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper154_InitP8CartInfo, .-_Z14Mapper154_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CMD"
	.align	2
.LC1:
	.string	"MIRR"
	.align	2
.LC2:
	.string	"REGS"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL3cmd
	.word	1
	.word	.LC0
	.word	_ZL6mirror
	.word	1
	.word	.LC1
	.word	_ZL3reg
	.word	8
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL3cmd,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL3cmd, @object
	.size	_ZL3cmd, 1
_ZL3cmd:
	.zero	1
	.section	.sbss._ZL3reg,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 8
_ZL3reg:
	.zero	8
	.section	.sbss._ZL5is154,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL5is154, @object
	.size	_ZL5is154, 1
_ZL5is154:
	.zero	1
	.section	.sbss._ZL6mirror,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL6mirror, @object
	.size	_ZL6mirror, 1
_ZL6mirror:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
