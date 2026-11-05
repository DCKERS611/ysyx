#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ks7057.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lbu	a1,4(s0)
	li	a0,24576
	sw	ra,8(sp)
	call	_Z7setprg2jj
	lbu	a1,5(s0)
	li	a0,28672
	addi	a0,a0,-2048
	call	_Z7setprg2jj
	lbu	a1,6(s0)
	li	a0,28672
	call	_Z7setprg2jj
	lbu	a1,7(s0)
	li	a0,32768
	addi	a0,a0,-2048
	call	_Z7setprg2jj
	lbu	a1,0(s0)
	li	a0,32768
	call	_Z7setprg2jj
	lbu	a1,1(s0)
	li	a0,36864
	addi	a0,a0,-2048
	call	_Z7setprg2jj
	lbu	a1,2(s0)
	li	a0,36864
	call	_Z7setprg2jj
	lbu	a1,3(s0)
	li	a0,40960
	addi	a0,a0,-2048
	call	_Z7setprg2jj
	li	a1,13
	li	a0,40960
	call	_Z7setprg8jj
	li	a1,7
	li	a0,49152
	call	_Z8setprg16jj
	li	a0,0
	call	_Z7setchr8j
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR1; lbu a0, 0(a0);
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL14UNLKS7057Resetv,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7057Resetv, @function
_ZL14UNLKS7057Resetv:
	tail	_ZL4Syncv
	.size	_ZL14UNLKS7057Resetv, .-_ZL14UNLKS7057Resetv
	.section	.text._ZL14UNLKS7057Writejh,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7057Writejh, @function
_ZL14UNLKS7057Writejh:
	li	a5,61440
	addi	a5,a5,3
	li	a4,49152
	and	a0,a0,a5
	addi	a5,a4,3
	beq	a0,a5,.L6
	bgtu	a0,a5,.L7
	li	a5,45056
	addi	a3,a5,3
	beq	a0,a3,.L8
	bleu	a0,a3,.L30
	addi	a5,a4,1
	beq	a0,a5,.L17
	addi	a5,a4,2
	bne	a0,a5,.L31
	lla	a4,.LANCHOR0
	lbu	a5,3(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,3(a4)
	tail	_ZL4Syncv
.L7:
	li	a5,57344
	beq	a0,a5,.L20
	bleu	a0,a5,.L32
	addi	a4,a5,2
	beq	a0,a4,.L27
	addi	a4,a5,3
	bne	a0,a4,.L33
	lla	a4,.LANCHOR0
	lbu	a5,7(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,7(a4)
	tail	_ZL4Syncv
.L31:
	bne	a0,a4,.L34
	lla	a4,.LANCHOR0
	lbu	a5,2(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,2(a4)
	tail	_ZL4Syncv
.L30:
	addi	a4,a5,1
	beq	a0,a4,.L10
	bleu	a0,a4,.L35
	addi	a5,a5,2
	bne	a0,a5,.L36
	lla	a4,.LANCHOR0
	lbu	a5,1(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,1(a4)
	tail	_ZL4Syncv
.L33:
	addi	a5,a5,1
	bne	a0,a5,.L37
	lla	a4,.LANCHOR0
	lbu	a5,6(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,6(a4)
	tail	_ZL4Syncv
.L32:
	li	a5,53248
	addi	a4,a5,2
	beq	a0,a4,.L22
	bleu	a0,a4,.L38
	addi	a5,a5,3
	bne	a0,a5,.L39
	lla	a4,.LANCHOR0
	lbu	a5,5(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,5(a4)
	tail	_ZL4Syncv
.L35:
	beq	a0,a5,.L12
	beq	a0,a4,.L5
	li	a5,32768
	addi	a4,a5,3
	bgtu	a0,a4,.L14
	bgeu	a0,a5,.L15
.L5:
	ret
.L38:
	beq	a0,a5,.L24
	addi	a5,a5,1
	bne	a0,a5,.L40
	lla	a4,.LANCHOR0
	lbu	a5,4(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,4(a4)
	tail	_ZL4Syncv
.L14:
	li	a5,-36864
	add	a5,a0,a5
	li	a4,3
	bgtu	a5,a4,.L41
.L15:
	andi	a1,a1,1
	la a5, .LANCHOR1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L36:
	ret
.L39:
	ret
.L41:
	ret
.L22:
	lla	a4,.LANCHOR0
	lbu	a5,5(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,5(a4)
	tail	_ZL4Syncv
.L12:
	lla	a4,.LANCHOR0
	lbu	a5,0(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,0(a4)
	tail	_ZL4Syncv
.L24:
	lla	a4,.LANCHOR0
	lbu	a5,4(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,4(a4)
	tail	_ZL4Syncv
.L27:
	lla	a4,.LANCHOR0
	lbu	a5,7(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,7(a4)
	tail	_ZL4Syncv
.L20:
	lla	a4,.LANCHOR0
	lbu	a5,6(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,6(a4)
	tail	_ZL4Syncv
.L10:
	lla	a4,.LANCHOR0
	lbu	a5,0(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,0(a4)
	tail	_ZL4Syncv
.L6:
	lla	a4,.LANCHOR0
	lbu	a5,3(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,3(a4)
	tail	_ZL4Syncv
.L8:
	lla	a4,.LANCHOR0
	lbu	a5,1(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,1(a4)
	tail	_ZL4Syncv
.L17:
	lla	a4,.LANCHOR0
	lbu	a5,2(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,2(a4)
	tail	_ZL4Syncv
.L34:
	ret
.L37:
	ret
.L40:
	ret
	.size	_ZL14UNLKS7057Writejh, .-_ZL14UNLKS7057Writejh
	.section	.text._ZL14UNLKS7057Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7057Powerv, @function
_ZL14UNLKS7057Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_ZL4Syncv
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL14UNLKS7057Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL14UNLKS7057Powerv, .-_ZL14UNLKS7057Powerv
	.section	.text._Z14UNLKS7057_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLKS7057_InitP8CartInfo
	.hidden	_Z14UNLKS7057_InitP8CartInfo
	.type	_Z14UNLKS7057_InitP8CartInfo, @function
_Z14UNLKS7057_InitP8CartInfo:
	lla	a5,_ZL14UNLKS7057Powerv
	sw	a5,0(a0)
	lla	a5,_ZL14UNLKS7057Resetv
	sw	a5,4(a0)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR2
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14UNLKS7057_InitP8CartInfo, .-_Z14UNLKS7057_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PRG"
	.align	2
.LC1:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL3reg
	.word	8
	.word	.LC0
	.word	_ZL6mirror
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL3reg,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 8
_ZL3reg:
	.zero	8
	.section	.sbss._ZL6mirror,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL6mirror, @object
	.size	_ZL6mirror, 1
_ZL6mirror:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
