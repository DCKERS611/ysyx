#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"kof97.cpp"
	.option nopic
	.text
	.section	.text._ZL13UNLKOF97Powerv,"ax",@progbits
	.align	2
	.type	_ZL13UNLKOF97Powerv, @function
_ZL13UNLKOF97Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z12GenMMC3Powerv
	lla	a2,_ZL16UNLKOF97CMDWritejh
	li	a1,40960
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	lla	a2,_ZL16UNLKOF97IRQWritejh
	li	a1,61440
	li	a0,49152
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL13UNLKOF97Powerv, .-_ZL13UNLKOF97Powerv
	.section	.text._ZL16UNLKOF97IRQWritejh,"ax",@progbits
	.align	2
	.type	_ZL16UNLKOF97IRQWritejh, @function
_ZL16UNLKOF97IRQWritejh:
	srli	a5,a1,4
	andi	a4,a1,-40
	slli	a3,a1,3
	andi	a5,a5,2
	or	a5,a5,a4
	andi	a3,a3,32
	srli	a4,a1,1
	andi	a4,a4,1
	or	a5,a5,a3
	slli	a1,a1,2
	or	a5,a5,a4
	andi	a1,a1,4
	li	a4,53248
	or	a1,a5,a1
	beq	a0,a4,.L6
	li	a5,61440
	beq	a0,a5,.L7
	tail	_Z13MMC3_IRQWritejh
.L7:
	li	a0,57344
	addi	a0,a0,1
	tail	_Z13MMC3_IRQWritejh
.L6:
	li	a0,49152
	addi	a0,a0,1
	tail	_Z13MMC3_IRQWritejh
	.size	_ZL16UNLKOF97IRQWritejh, .-_ZL16UNLKOF97IRQWritejh
	.section	.text._ZL16UNLKOF97CMDWritejh,"ax",@progbits
	.align	2
	.type	_ZL16UNLKOF97CMDWritejh, @function
_ZL16UNLKOF97CMDWritejh:
	srli	a5,a1,4
	andi	a4,a1,-40
	slli	a3,a1,3
	andi	a5,a5,2
	or	a5,a5,a4
	andi	a3,a3,32
	srli	a4,a1,1
	andi	a4,a4,1
	or	a5,a5,a3
	slli	a1,a1,2
	or	a5,a5,a4
	andi	a1,a1,4
	li	a4,36864
	or	a1,a5,a1
	bne	a0,a4,.L9
	li	a0,32768
	addi	a0,a0,1
.L9:
	tail	_Z13MMC3_CMDWritejh
	.size	_ZL16UNLKOF97CMDWritejh, .-_ZL16UNLKOF97CMDWritejh
	.section	.text._Z13UNLKOF97_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13UNLKOF97_InitP8CartInfo
	.hidden	_Z13UNLKOF97_InitP8CartInfo
	.type	_Z13UNLKOF97_InitP8CartInfo, @function
_Z13UNLKOF97_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,128
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL13UNLKOF97Powerv
	lw	ra,8(sp)
	sw	a5,0(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	_Z13UNLKOF97_InitP8CartInfo, .-_Z13UNLKOF97_InitP8CartInfo
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
