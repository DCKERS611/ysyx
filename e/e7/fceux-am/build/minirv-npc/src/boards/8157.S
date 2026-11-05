#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"8157.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-16
	sw	s1,4(sp)
	lla	s1,.LANCHOR0
	lhu	a5,0(s1)
	sw	s0,8(sp)
	sw	ra,12(sp)
	srli	s0,a5,1
	andi	a3,a5,96
	andi	s0,s0,128
	or	s0,s0,a3
	srli	a2,a5,2
	andi	a3,a5,512
	li	a4,7
	srli	s0,s0,2
	andi	a2,a2,7
	bne	a3,zero,.L2
	andi	a5,a5,128
	li	a4,0
	bne	a5,zero,.L10
.L2:
	la a5, PRGptr+4; lw a5, 0(a5);
	sw	a4,0(sp)
	beq	a5,zero,.L3
.L11:
	srli	s0,s0,3
	mv	a0,s0
	li	a1,32768
	call	_Z9setprg16rijj
	lw	a4,0(sp)
	li	a1,49152
	mv	a0,s0
	mv	a2,a4
	call	_Z9setprg16rijj
.L4:
	lhu	a0,0(s1)
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	srli	a0,a0,1
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,16
	tail	_Z9setmirrori
.L10:
	mv	a4,a2
	la a5, PRGptr+4; lw a5, 0(a5);
	sw	a4,0(sp)
	bne	a5,zero,.L11
.L3:
	or	a1,s0,a2
	li	a0,32768
	call	_Z8setprg16jj
	lw	a4,0(sp)
	li	a0,49152
	or	a1,a4,s0
	call	_Z8setprg16jj
	j	.L4
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL14UNL8157Restorei,"ax",@progbits
	.align	2
	.type	_ZL14UNL8157Restorei, @function
_ZL14UNL8157Restorei:
	tail	_ZL4Syncv
	.size	_ZL14UNL8157Restorei, .-_ZL14UNL8157Restorei
	.section	.text._ZL12UNL8157Resetv,"ax",@progbits
	.align	2
	.type	_ZL12UNL8157Resetv, @function
_ZL12UNL8157Resetv:
	la a5, .LANCHOR0; sh zero, 0(a5);
	li	a5,1
	la a4, .LANCHOR1; sb a5, 0(a4);
	tail	_ZL4Syncv
	.size	_ZL12UNL8157Resetv, .-_ZL12UNL8157Resetv
	.section	.text._ZL12UNL8157Writejh,"ax",@progbits
	.align	2
	.type	_ZL12UNL8157Writejh, @function
_ZL12UNL8157Writejh:
	la a5, .LANCHOR0; sh a0, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL12UNL8157Writejh, .-_ZL12UNL8157Writejh
	.section	.text._ZL12UNL8157Powerv,"ax",@progbits
	.align	2
	.type	_ZL12UNL8157Powerv, @function
_ZL12UNL8157Powerv:
	addi	sp,sp,-12
	li	a0,0
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z7setchr8j
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL12UNL8157Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_ZL11UNL8157Readj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a5, .LANCHOR1; sb zero, 0(a5);
	la a5, .LANCHOR0; sh zero, 0(a5);
	addi	sp,sp,12
	tail	_ZL4Syncv
	.size	_ZL12UNL8157Powerv, .-_ZL12UNL8157Powerv
	.section	.text._ZL11UNL8157Readj,"ax",@progbits
	.align	2
	.type	_ZL11UNL8157Readj, @function
_ZL11UNL8157Readj:
	la a5, .LANCHOR0; lhu a5, 0(a5);
	andi	a5,a5,256
	beq	a5,zero,.L18
	la a4, PRGsize; lw a4, 0(a4);
	li	a5,1048576
	bgeu	a4,a5,.L18
	li	a5,65536
	addi	a5,a5,-16
	and	a0,a0,a5
	la a5, .LANCHOR1; lbu a5, 0(a5);
	add	a0,a5,a0
.L18:
	tail	_Z6CartBRj
	.size	_ZL11UNL8157Readj, .-_ZL11UNL8157Readj
	.section	.text._Z12UNL8157_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12UNL8157_InitP8CartInfo
	.hidden	_Z12UNL8157_InitP8CartInfo
	.type	_Z12UNL8157_InitP8CartInfo, @function
_Z12UNL8157_InitP8CartInfo:
	lla	a5,_ZL12UNL8157Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12UNL8157Resetv
	sw	a5,4(a0)
	lla	a5,_ZL14UNL8157Restorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR2
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z12UNL8157_InitP8CartInfo, .-_Z12UNL8157_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REST"
	.align	2
.LC1:
	.string	"CREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL5reset
	.word	1
	.word	.LC0
	.word	_ZL6cmdreg
	.word	2
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL5reset,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL5reset, @object
	.size	_ZL5reset, 1
_ZL5reset:
	.zero	1
	.section	.sbss._ZL6cmdreg,"aw",@nobits
	.align	1
	.set	.LANCHOR0,. + 0
	.type	_ZL6cmdreg, @object
	.size	_ZL6cmdreg, 2
_ZL6cmdreg:
	.zero	2
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
