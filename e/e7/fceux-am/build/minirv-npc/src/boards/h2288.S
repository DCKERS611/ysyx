#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"h2288.cpp"
	.option nopic
	.text
	.section	.text._ZL10H2288Powerv,"ax",@progbits
	.align	2
	.type	_ZL10H2288Powerv, @function
_ZL10H2288Powerv:
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
	li	a1,24576
	lla	a2,_ZL12H2288WriteLojh
	addi	a1,a1,-1
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	li	a1,40960
	lla	a2,_ZL12H2288WriteHijh
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL10H2288Powerv, .-_ZL10H2288Powerv
	.section	.text._ZL7H2288PWjh,"ax",@progbits
	.align	2
	.type	_ZL7H2288PWjh, @function
_ZL7H2288PWjh:
	la a5, EXPREGS; lbu a5, 0(a5);
	andi	a4,a5,64
	beq	a4,zero,.L5
	addi	sp,sp,-12
	sw	s0,4(sp)
	srli	s0,a5,2
	andi	a4,a5,5
	andi	s0,s0,10
	sw	ra,8(sp)
	andi	a5,a5,2
	or	s0,s0,a4
	beq	a5,zero,.L6
	srli	a1,s0,1
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,32768
	addi	sp,sp,12
	tail	_Z8setprg32jj
.L6:
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,49152
	addi	sp,sp,12
	tail	_Z8setprg16jj
.L5:
	andi	a1,a1,63
	tail	_Z7setprg8jj
	.size	_ZL7H2288PWjh, .-_ZL7H2288PWjh
	.section	.text._ZL12H2288WriteHijh,"ax",@progbits
	.align	2
	.type	_ZL12H2288WriteHijh, @function
_ZL12H2288WriteHijh:
	li	a3,32768
	addi	a4,a3,1
	and	a0,a0,a4
	beq	a0,a3,.L11
	bne	a0,a4,.L15
	tail	_Z13MMC3_CMDWritejh
.L15:
	ret
.L11:
	andi	a3,a1,7
	lla	a4,m114_perm
	add	a4,a4,a3
	lbu	a4,0(a4)
	andi	a1,a1,-64
	li	a0,32768
	or	a1,a4,a1
	tail	_Z13MMC3_CMDWritejh
	.size	_ZL12H2288WriteHijh, .-_ZL12H2288WriteHijh
	.section	.text._ZL12H2288WriteLojh,"ax",@progbits
	.align	2
	.type	_ZL12H2288WriteLojh, @function
_ZL12H2288WriteLojh:
	srli	a5,a0,11
	andi	a5,a5,1
	beq	a5,zero,.L16
	andi	a0,a0,1
	bne	a0,zero,.L20
	la a5, EXPREGS; sb a1, 0(a5);
	la a0, MMC3_cmd; lbu a0, 0(a0);
	tail	_Z10FixMMC3PRGi
.L20:
	la a5, EXPREGS+1; sb a1, 0(a5);
	la a0, MMC3_cmd; lbu a0, 0(a0);
	tail	_Z10FixMMC3PRGi
.L16:
	ret
	.size	_ZL12H2288WriteLojh, .-_ZL12H2288WriteLojh
	.section	.rodata._Z13UNLH2288_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.section	.text._Z13UNLH2288_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13UNLH2288_InitP8CartInfo
	.hidden	_Z13UNLH2288_InitP8CartInfo
	.type	_Z13UNLH2288_InitP8CartInfo, @function
_Z13UNLH2288_InitP8CartInfo:
	addi	sp,sp,-12
	li	a3,0
	li	a2,256
	li	a1,256
	li	a4,0
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL7H2288PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL10H2288Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC0
	li	a2,0
	li	a1,2
	lla	a0,EXPREGS
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13UNLH2288_InitP8CartInfo, .-_Z13UNLH2288_InitP8CartInfo
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
