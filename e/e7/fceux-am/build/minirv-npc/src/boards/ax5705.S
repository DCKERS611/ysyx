#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ax5705.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	s0,.LANCHOR0
	lbu	a1,0(s0)
	li	a0,32768
	lla	s1,.LANCHOR1
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	li	s0,0
	call	_Z7setprg8jj
	li	a1,-2
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
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
	.section	.text._ZL14UNLAX5705Writejh,"ax",@progbits
	.align	2
	.type	_ZL14UNLAX5705Writejh, @function
_ZL14UNLAX5705Writejh:
	li	a4,61440
	addi	a4,a4,15
	li	a5,49152
	and	a0,a0,a4
	addi	a4,a5,11
	bgtu	a0,a4,.L8
	bgeu	a0,a5,.L9
	li	a5,40960
	addi	a4,a5,11
	bgtu	a0,a4,.L10
	bltu	a0,a5,.L34
	sub	a5,a0,a5
	li	a4,11
	bgtu	a5,a4,.L10
	lla	a4,.L24
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL14UNLAX5705Writejh,"a",@progbits
	.align	2
	.align	2
.L24:
	.word	.L28-.L24
	.word	.L10-.L24
	.word	.L10-.L24
	.word	.L10-.L24
	.word	.L10-.L24
	.word	.L10-.L24
	.word	.L10-.L24
	.word	.L10-.L24
	.word	.L27-.L24
	.word	.L26-.L24
	.word	.L25-.L24
	.word	.L23-.L24
	.section	.text._ZL14UNLAX5705Writejh
.L8:
	li	a5,57344
	addi	a4,a5,2
	beq	a0,a4,.L29
	bleu	a0,a4,.L35
	addi	a5,a5,3
	bne	a0,a5,.L10
	lla	a3,.LANCHOR1
	srli	a5,a1,1
	slli	a2,a1,1
	lbu	a4,7(a3)
	andi	a5,a5,2
	andi	a2,a2,4
	or	a5,a5,a2
	andi	a1,a1,9
	or	a5,a5,a1
	slli	a5,a5,4
	andi	a4,a4,15
	or	a5,a5,a4
	sb	a5,7(a3)
.L10:
	tail	_ZL4Syncv
.L9:
	sub	a5,a0,a5
	li	a4,11
	bgtu	a5,a4,.L10
	lla	a4,.L15
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL14UNLAX5705Writejh
	.align	2
	.align	2
.L15:
	.word	.L22-.L15
	.word	.L21-.L15
	.word	.L20-.L15
	.word	.L19-.L15
	.word	.L10-.L15
	.word	.L10-.L15
	.word	.L10-.L15
	.word	.L10-.L15
	.word	.L18-.L15
	.word	.L17-.L15
	.word	.L16-.L15
	.word	.L14-.L15
	.section	.text._ZL14UNLAX5705Writejh
.L34:
	li	a5,32768
	beq	a0,a5,.L12
	addi	a5,a5,8
	bne	a0,a5,.L10
	andi	a1,a1,1
	la a5, .LANCHOR2; sb a1, 0(a5);
	j	.L10
.L35:
	beq	a0,a5,.L31
	addi	a5,a5,1
	bne	a0,a5,.L10
	lla	a2,.LANCHOR1
	srli	a5,a1,1
	slli	a3,a1,1
	lbu	a4,6(a2)
	andi	a5,a5,2
	andi	a3,a3,4
	or	a5,a5,a3
	andi	a1,a1,9
	or	a5,a5,a1
	slli	a5,a5,4
	andi	a4,a4,15
	or	a5,a5,a4
	sb	a5,6(a2)
	j	.L10
.L14:
	lla	a2,.LANCHOR1
	srli	a5,a1,1
	slli	a3,a1,1
	lbu	a4,5(a2)
	andi	a5,a5,2
	andi	a3,a3,4
	or	a5,a5,a3
	andi	a1,a1,9
	or	a5,a5,a1
	slli	a5,a5,4
	andi	a4,a4,15
	or	a5,a5,a4
	sb	a5,5(a2)
	j	.L10
.L16:
	lla	a4,.LANCHOR1
	lbu	a5,5(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,5(a4)
	j	.L10
.L17:
	lla	a2,.LANCHOR1
	srli	a5,a1,1
	slli	a3,a1,1
	lbu	a4,4(a2)
	andi	a5,a5,2
	andi	a3,a3,4
	or	a5,a5,a3
	andi	a1,a1,9
	or	a5,a5,a1
	slli	a5,a5,4
	andi	a4,a4,15
	or	a5,a5,a4
	sb	a5,4(a2)
	j	.L10
.L18:
	lla	a4,.LANCHOR1
	lbu	a5,4(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,4(a4)
	j	.L10
.L19:
	lla	a2,.LANCHOR1
	srli	a5,a1,1
	slli	a3,a1,1
	lbu	a4,3(a2)
	andi	a5,a5,2
	andi	a3,a3,4
	or	a5,a5,a3
	andi	a1,a1,9
	or	a5,a5,a1
	slli	a5,a5,4
	andi	a4,a4,15
	or	a5,a5,a4
	sb	a5,3(a2)
	j	.L10
.L20:
	lla	a4,.LANCHOR1
	lbu	a5,3(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,3(a4)
	j	.L10
.L21:
	lla	a2,.LANCHOR1
	srli	a5,a1,1
	slli	a3,a1,1
	lbu	a4,2(a2)
	andi	a5,a5,2
	andi	a3,a3,4
	or	a5,a5,a3
	andi	a1,a1,9
	or	a5,a5,a1
	slli	a5,a5,4
	andi	a4,a4,15
	or	a5,a5,a4
	sb	a5,2(a2)
	j	.L10
.L22:
	lla	a4,.LANCHOR1
	lbu	a5,2(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,2(a4)
	j	.L10
.L23:
	lla	a2,.LANCHOR1
	srli	a5,a1,1
	slli	a3,a1,1
	lbu	a4,1(a2)
	andi	a5,a5,2
	andi	a3,a3,4
	or	a5,a5,a3
	andi	a1,a1,9
	or	a5,a5,a1
	slli	a5,a5,4
	andi	a4,a4,15
	or	a5,a5,a4
	sb	a5,1(a2)
	j	.L10
.L25:
	lla	a4,.LANCHOR1
	lbu	a5,1(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,1(a4)
	j	.L10
.L26:
	lla	a2,.LANCHOR1
	srli	a5,a1,1
	slli	a3,a1,1
	lbu	a4,0(a2)
	andi	a5,a5,2
	andi	a3,a3,4
	or	a5,a5,a3
	andi	a1,a1,9
	or	a5,a5,a1
	slli	a5,a5,4
	andi	a4,a4,15
	or	a5,a5,a4
	sb	a5,0(a2)
	j	.L10
.L27:
	lla	a4,.LANCHOR1
	lbu	a5,0(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,0(a4)
	j	.L10
.L28:
	srli	a5,a1,2
	andi	a4,a1,5
	andi	a5,a5,2
	slli	a1,a1,2
	or	a5,a5,a4
	andi	a1,a1,8
	or	a5,a5,a1
	la a4, .LANCHOR0+1; sb a5, 0(a4);
	j	.L10
.L31:
	lla	a4,.LANCHOR1
	lbu	a5,6(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,6(a4)
	j	.L10
.L12:
	srli	a5,a1,2
	andi	a4,a1,5
	andi	a5,a5,2
	slli	a1,a1,2
	or	a5,a5,a4
	andi	a1,a1,8
	or	a5,a5,a1
	la a4, .LANCHOR0; sb a5, 0(a4);
	j	.L10
.L29:
	lla	a4,.LANCHOR1
	lbu	a5,7(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,7(a4)
	j	.L10
	.size	_ZL14UNLAX5705Writejh, .-_ZL14UNLAX5705Writejh
	.section	.text._ZL14UNLAX5705Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLAX5705Powerv, @function
_ZL14UNLAX5705Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_ZL4Syncv
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL14UNLAX5705Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL14UNLAX5705Powerv, .-_ZL14UNLAX5705Powerv
	.section	.text._Z14UNLAX5705_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLAX5705_InitP8CartInfo
	.hidden	_Z14UNLAX5705_InitP8CartInfo
	.type	_Z14UNLAX5705_InitP8CartInfo, @function
_Z14UNLAX5705_InitP8CartInfo:
	lla	a5,_ZL14UNLAX5705Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR3
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14UNLAX5705_InitP8CartInfo, .-_Z14UNLAX5705_InitP8CartInfo
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
	.set	.LANCHOR3,. + 0
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
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 1
_ZL8IRQCount:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
