#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"sa-9602b.cpp"
	.option nopic
	.text
	.section	.text._ZL12SA9602BPowerv,"ax",@progbits
	.align	2
	.type	_ZL12SA9602BPowerv, @function
_ZL12SA9602BPowerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,EXPREGS
	sb	zero,1(a5)
	sb	zero,0(a5)
	call	_Z12GenMMC3Powerv
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	ra,8(sp)
	li	a1,49152
	lla	a2,_ZL12SA9602BWritejh
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL12SA9602BPowerv, .-_ZL12SA9602BPowerv
	.section	.text._ZL12SA9602BWritejh,"ax",@progbits
	.align	2
	.type	_ZL12SA9602BWritejh, @function
_ZL12SA9602BWritejh:
	li	a5,57344
	addi	sp,sp,-16
	addi	a5,a5,1
	sw	s0,8(sp)
	sw	ra,12(sp)
	and	a5,a0,a5
	li	a4,32768
	mv	s0,a0
	beq	a5,a4,.L5
	addi	a4,a4,1
	bne	a5,a4,.L7
	lla	a4,EXPREGS
	lbu	a5,0(a4)
	li	a3,5
	andi	a5,a5,7
	bleu	a5,a3,.L9
.L7:
	mv	a0,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	addi	sp,sp,16
	tail	_Z13MMC3_CMDWritejh
.L5:
	mv	a0,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	la a5, EXPREGS; sb a1, 0(a5);
	addi	sp,sp,16
	tail	_Z13MMC3_CMDWritejh
.L9:
	srli	a5,a1,6
	la a0, MMC3_cmd; lbu a0, 0(a0);
	sb	a5,1(a4)
	sw	a1,0(sp)
	call	_Z10FixMMC3PRGi
	mv	a0,s0
	lw	s0,8(sp)
	lw	a1,0(sp)
	lw	ra,12(sp)
	addi	sp,sp,16
	tail	_Z13MMC3_CMDWritejh
	.size	_ZL12SA9602BWritejh, .-_ZL12SA9602BWritejh
	.section	.text._ZL9SA9602BPWjh,"ax",@progbits
	.align	2
	.type	_ZL9SA9602BPWjh, @function
_ZL9SA9602BPWjh:
	andi	a2,a1,63
	addi	sp,sp,-12
	mv	a1,a0
	la a0, EXPREGS+1; lbu a0, 0(a0);
	sw	ra,8(sp)
	call	_Z8setprg8rijj
	la a5, MMC3_cmd; lbu a5, 0(a5);
	andi	a5,a5,64
	li	a2,-2
	beq	a5,zero,.L11
	li	a1,32768
	li	a0,0
	call	_Z8setprg8rijj
	lw	ra,8(sp)
	li	a2,-1
	li	a1,57344
	li	a0,0
	addi	sp,sp,12
	tail	_Z8setprg8rijj
.L11:
	li	a1,49152
	li	a0,0
	call	_Z8setprg8rijj
	lw	ra,8(sp)
	li	a2,-1
	li	a1,57344
	li	a0,0
	addi	sp,sp,12
	tail	_Z8setprg8rijj
	.size	_ZL9SA9602BPWjh, .-_ZL9SA9602BPWjh
	.section	.rodata._Z12SA9602B_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.section	.text._Z12SA9602B_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12SA9602B_InitP8CartInfo
	.hidden	_Z12SA9602B_InitP8CartInfo
	.type	_Z12SA9602B_InitP8CartInfo, @function
_Z12SA9602B_InitP8CartInfo:
	addi	sp,sp,-12
	li	a2,0
	li	a3,0
	li	a1,512
	li	a4,0
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a4,mmc3opts
	lbu	a5,0(a4)
	lla	a3,_ZL9SA9602BPWjh
	la a2, pwrap; sw a3, 0(a2);
	ori	a5,a5,2
	sb	a5,0(a4)
	la a5, UNIFchrrama; lw a5, 0(a5);
	sw	a5,12(s0)
	li	a5,32768
	sw	a5,28(s0)
	lla	a5,_ZL12SA9602BPowerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC0
	li	a2,0
	li	a1,2
	lla	a0,EXPREGS
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z12SA9602B_InitP8CartInfo, .-_Z12SA9602B_InitP8CartInfo
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
