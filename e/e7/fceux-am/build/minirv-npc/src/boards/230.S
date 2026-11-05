#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"230.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s1,0(sp)
	sw	ra,8(sp)
	lla	s1,.LANCHOR0
	sw	s0,4(sp)
	la a5, .LANCHOR1; lbu a5, 0(a5);
	lbu	a1,0(s1)
	bne	a5,zero,.L8
	andi	s0,a1,31
	andi	a5,a1,32
	addi	s0,s0,8
	bne	a5,zero,.L9
	srli	a1,s0,1
	li	a0,32768
	call	_Z8setprg32jj
.L5:
	lbu	a0,0(s1)
	srli	a0,a0,6
	andi	a0,a0,1
	call	_Z9setmirrori
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
.L9:
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s0
	li	a0,49152
	call	_Z8setprg16jj
	j	.L5
.L8:
	andi	a1,a1,7
	li	a0,32768
	call	_Z8setprg16jj
	li	a1,7
	li	a0,49152
	call	_Z8setprg16jj
	li	a0,1
	call	_Z9setmirrori
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
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
	.section	.text._ZL9M230Resetv,"ax",@progbits
	.align	2
	.type	_ZL9M230Resetv, @function
_ZL9M230Resetv:
	lla	a4,.LANCHOR1
	lbu	a5,0(a4)
	xori	a5,a5,1
	sb	a5,0(a4)
	tail	_ZL4Syncv
	.size	_ZL9M230Resetv, .-_ZL9M230Resetv
	.section	.text._ZL9M230Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M230Writejh, @function
_ZL9M230Writejh:
	la a5, .LANCHOR0; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL9M230Writejh, .-_ZL9M230Writejh
	.section	.text._ZL9M230Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M230Powerv, @function
_ZL9M230Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR1; sb zero, 0(a5);
	li	s0,65536
	la a5, .LANCHOR0; sb zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_ZL9M230Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_Z6CartBRj
	li	a0,32768
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL9M230Powerv, .-_ZL9M230Powerv
	.section	.text._Z14Mapper230_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper230_InitP8CartInfo
	.hidden	_Z14Mapper230_InitP8CartInfo
	.type	_Z14Mapper230_InitP8CartInfo, @function
_Z14Mapper230_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,_ZL9M230Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M230Resetv
	sw	a5,4(a0)
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
	.size	_Z14Mapper230_InitP8CartInfo, .-_Z14Mapper230_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"RST"
	.align	2
.LC1:
	.string	"LATC"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL5reset
	.word	1
	.word	.LC0
	.word	_ZL6latche
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL5reset,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL5reset, @object
	.size	_ZL5reset, 1
_ZL5reset:
	.zero	1
	.section	.sbss._ZL6latche,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL6latche, @object
	.size	_ZL6latche, 1
_ZL6latche:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
