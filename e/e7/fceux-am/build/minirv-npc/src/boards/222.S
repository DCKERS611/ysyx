#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"222.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	s0,.LANCHOR0
	sw	ra,8(sp)
	lbu	a1,0(s0)
	li	a0,32768
	lla	s1,.LANCHOR1
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	li	s0,0
	call	_Z7setprg8jj
.L2:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	li	a5,8192
	addi	s1,s1,1
	bne	s0,a5,.L2
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	la a0, .LANCHOR2; lbu a0, 0(a0);
	xori	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M222Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M222Powerv, @function
_ZL9M222Powerv:
	addi	sp,sp,-12
	li	a1,-1
	li	a0,49152
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z8setprg16jj
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL9M222Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL9M222Powerv, .-_ZL9M222Powerv
	.section	.text._ZL9M222Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M222Writejh, @function
_ZL9M222Writejh:
	li	a4,61440
	addi	a5,a4,3
	li	a3,49152
	and	a0,a0,a5
	addi	a5,a3,2
	beq	a0,a5,.L10
	bgtu	a0,a5,.L11
	li	a5,45056
	beq	a0,a5,.L12
	bgtu	a0,a5,.L13
	li	a5,36864
	beq	a0,a5,.L14
	li	a5,40960
	bne	a0,a5,.L31
	la a5, .LANCHOR0+1; sb a1, 0(a5);
	j	.L29
.L11:
	li	a5,57344
	beq	a0,a5,.L20
	bleu	a0,a5,.L32
	addi	a5,a5,2
	beq	a0,a5,.L24
	bne	a0,a4,.L29
	addi	sp,sp,-12
	la a5, .LANCHOR3; sb a1, 0(a5);
	sw	ra,8(sp)
	la a4, scanline; lw a4, 0(a4);
	li	a5,239
	ble	a4,a5,.L33
	addi	a1,a1,4
	andi	a1,a1,0xff
.L27:
	li	a0,1
	la a5, .LANCHOR4; sb a1, 0(a5);
	call	_Z12X6502_IRQEndi
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
.L31:
	li	a5,32768
	bne	a0,a5,.L29
	la a5, .LANCHOR0; sb a1, 0(a5);
	j	.L29
.L13:
	addi	a5,a5,2
	beq	a0,a5,.L18
	bne	a0,a3,.L29
	la a5, .LANCHOR1+2; sb a1, 0(a5);
	j	.L29
.L32:
	li	a5,53248
	beq	a0,a5,.L22
	addi	a5,a5,2
	bne	a0,a5,.L29
	la a5, .LANCHOR1+5; sb a1, 0(a5);
	j	.L29
.L18:
	la a5, .LANCHOR1+1; sb a1, 0(a5);
.L29:
	tail	_ZL4Syncv
.L24:
	la a5, .LANCHOR1+7; sb a1, 0(a5);
	j	.L29
.L14:
	andi	a1,a1,1
	la a5, .LANCHOR2; sb a1, 0(a5);
	j	.L29
.L22:
	la a5, .LANCHOR1+4; sb a1, 0(a5);
	j	.L29
.L10:
	la a5, .LANCHOR1+3; sb a1, 0(a5);
	j	.L29
.L12:
	la a5, .LANCHOR1; sb a1, 0(a5);
	j	.L29
.L20:
	la a5, .LANCHOR1+6; sb a1, 0(a5);
	j	.L29
.L33:
	addi	a1,a1,-8
	andi	a1,a1,0xff
	j	.L27
	.size	_ZL9M222Writejh, .-_ZL9M222Writejh
	.section	.text._ZL7M222IRQv,"ax",@progbits
	.align	2
	.type	_ZL7M222IRQv, @function
_ZL7M222IRQv:
	la a5, .LANCHOR3; lbu a5, 0(a5);
	beq	a5,zero,.L34
	lla	a4,.LANCHOR4
	lbu	a5,0(a4)
	li	a3,237
	addi	a5,a5,1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	bgtu	a5,a3,.L38
.L34:
	ret
.L38:
	li	a0,1
	tail	_Z14X6502_IRQBegini
	.size	_ZL7M222IRQv, .-_ZL7M222IRQv
	.section	.text._Z14Mapper222_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper222_InitP8CartInfo
	.hidden	_Z14Mapper222_InitP8CartInfo
	.type	_Z14Mapper222_InitP8CartInfo, @function
_Z14Mapper222_InitP8CartInfo:
	lla	a5,_ZL9M222Powerv
	sw	a5,0(a0)
	lla	a5,_ZL7M222IRQv
	la a4, GameHBIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR5
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper222_InitP8CartInfo, .-_Z14Mapper222_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"IRQC"
	.align	2
.LC1:
	.string	"IRQA"
	.align	2
.LC2:
	.string	"PRG"
	.align	2
.LC3:
	.string	"CHR"
	.align	2
.LC4:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 72
_ZL9StateRegs:
	.word	_ZL8IRQCount
	.word	1
	.word	.LC0
	.word	_ZL4IRQa
	.word	1
	.word	.LC1
	.word	_ZL7prg_reg
	.word	2
	.word	.LC2
	.word	_ZL7chr_reg
	.word	8
	.word	.LC3
	.word	_ZL4mirr
	.word	1
	.word	.LC4
	.word	0
	.zero	8
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL7chr_reg,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL7chr_reg, @object
	.size	_ZL7chr_reg, 8
_ZL7chr_reg:
	.zero	8
	.section	.sbss._ZL7prg_reg,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL7prg_reg, @object
	.size	_ZL7prg_reg, 2
_ZL7prg_reg:
	.zero	2
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 1
_ZL8IRQCount:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
