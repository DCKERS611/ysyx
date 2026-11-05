#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"a9746.cpp"
	.option nopic
	.text
	.section	.text._ZL13UNLA9746Powerv,"ax",@progbits
	.align	2
	.type	_ZL13UNLA9746Powerv, @function
_ZL13UNLA9746Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z12GenMMC3Powerv
	lw	ra,8(sp)
	li	a1,49152
	lla	a2,_ZL13UNLA9746Writejh
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL13UNLA9746Powerv, .-_ZL13UNLA9746Powerv
	.section	.text._ZL13UNLA9746Writejh,"ax",@progbits
	.align	2
	.type	_ZL13UNLA9746Writejh, @function
_ZL13UNLA9746Writejh:
	li	a4,57344
	addi	sp,sp,-16
	addi	a4,a4,3
	li	a5,32768
	sw	s0,8(sp)
	and	a0,a0,a4
	sw	ra,12(sp)
	sw	s1,4(sp)
	addi	a4,a5,1
	mv	s0,a1
	beq	a0,a4,.L5
	addi	a4,a5,2
	beq	a0,a4,.L6
	beq	a0,a5,.L31
.L4:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L5:
	srli	a1,a1,5
	srli	a3,s0,3
	lla	s1,EXPREGS
	andi	a3,a3,2
	srli	a4,s0,1
	andi	a1,a1,1
	lbu	a5,0(s1)
	or	a1,a1,a3
	andi	a2,a4,4
	slli	a3,s0,1
	or	a1,a1,a2
	andi	a3,a3,8
	li	a2,37
	or	a1,a1,a3
	beq	a5,a2,.L10
	bgtu	a5,a2,.L11
	li	a3,35
	beq	a5,a3,.L12
	li	a3,36
	bne	a5,a3,.L14
	li	a0,49152
	sw	a4,0(sp)
	call	_Z7setprg8jj
	lw	a4,0(sp)
.L14:
	lbu	a5,1(s1)
	li	a3,21
	bgtu	a5,a3,.L15
	li	a3,7
	bleu	a5,a3,.L4
	addi	a5,a5,-8
	andi	a5,a5,0xff
	li	a3,13
	bgtu	a5,a3,.L4
	lla	a3,.L21
	slli	a5,a5,2
	add	a5,a5,a3
	lw	a5,0(a5)
	add	a5,a5,a3
	jr	a5
	.section	.rodata._ZL13UNLA9746Writejh,"a",@progbits
	.align	2
	.align	2
.L21:
	.word	.L17-.L21
	.word	.L26-.L21
	.word	.L17-.L21
	.word	.L25-.L21
	.word	.L17-.L21
	.word	.L24-.L21
	.word	.L17-.L21
	.word	.L23-.L21
	.word	.L17-.L21
	.word	.L22-.L21
	.word	.L17-.L21
	.word	.L4-.L21
	.word	.L17-.L21
	.word	.L20-.L21
	.section	.text._ZL13UNLA9746Writejh
.L11:
	li	a3,38
	bne	a5,a3,.L14
	li	a0,32768
	sw	a4,0(sp)
	call	_Z7setprg8jj
	lw	a4,0(sp)
	j	.L14
.L15:
	addi	a5,a5,-22
	andi	a5,a5,0xff
	li	a3,8
	bgtu	a5,a3,.L4
	li	a3,1
	sll	a3,a3,a5
	andi	a3,a3,341
	beq	a3,zero,.L32
.L17:
	slli	s0,s0,4
	sb	s0,2(s1)
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L31:
	lw	ra,12(sp)
	lw	s0,8(sp)
	la a5, EXPREGS+1; sb a1, 0(a5);
	la a5, EXPREGS; sb zero, 0(a5);
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L6:
	lw	ra,12(sp)
	lw	s0,8(sp)
	la a5, EXPREGS; sb a1, 0(a5);
	la a5, EXPREGS+1; sb zero, 0(a5);
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L32:
	li	a3,7
	beq	a5,a3,.L18
	li	a3,3
	bne	a5,a3,.L4
	lbu	a1,2(s1)
	li	a0,8192
	addi	a0,a0,-2048
	or	a1,a4,a1
.L33:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	_Z7setchr1jj
.L12:
	li	a0,57344
	sw	a4,0(sp)
	call	_Z7setprg8jj
	lw	a4,0(sp)
	j	.L14
.L10:
	li	a0,40960
	sw	a4,0(sp)
	call	_Z7setprg8jj
	lw	a4,0(sp)
	j	.L14
.L23:
	lbu	a1,2(s1)
	li	a0,4096
	addi	a0,a0,-1024
	or	a1,a4,a1
	ori	a1,a1,1
.L30:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	_Z7setchr1jj
.L22:
	lbu	a1,2(s1)
	li	a0,4096
	or	a1,a4,a1
	j	.L33
.L20:
	lbu	a1,2(s1)
	li	a0,4096
	addi	a0,a0,1024
	or	a1,a4,a1
	j	.L33
.L26:
	lbu	a1,2(s1)
	li	a0,0
	or	a1,a4,a1
	j	.L33
.L25:
	lbu	a1,2(s1)
	li	a0,1024
	or	a1,a4,a1
	ori	a1,a1,1
	j	.L30
.L24:
	lbu	a1,2(s1)
	li	a0,4096
	addi	a0,a0,-2048
	or	a1,a4,a1
	j	.L33
.L18:
	lbu	a1,2(s1)
	li	a0,8192
	addi	a0,a0,-1024
	or	a1,a4,a1
	j	.L33
	.size	_ZL13UNLA9746Writejh, .-_ZL13UNLA9746Writejh
	.section	.rodata._Z13UNLA9746_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.section	.text._Z13UNLA9746_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13UNLA9746_InitP8CartInfo
	.hidden	_Z13UNLA9746_InitP8CartInfo
	.type	_Z13UNLA9746_InitP8CartInfo, @function
_Z13UNLA9746_InitP8CartInfo:
	addi	sp,sp,-12
	li	a3,0
	li	a2,256
	li	a1,128
	li	a4,0
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL13UNLA9746Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC0
	li	a2,0
	li	a1,6
	lla	a0,EXPREGS
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13UNLA9746_InitP8CartInfo, .-_Z13UNLA9746_InitP8CartInfo
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
