#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"187.cpp"
	.option nopic
	.text
	.section	.text._ZL8M187Readj,"ax",@progbits
	.align	2
	.type	_ZL8M187Readj, @function
_ZL8M187Readj:
	la a4, EXPREGS+1; lbu a4, 0(a4);
	andi	a4,a4,3
	lla	a5,.LANCHOR0
	add	a5,a5,a4
	lbu	a0,0(a5)
	ret
	.size	_ZL8M187Readj, .-_ZL8M187Readj
	.section	.text._ZL9M187Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M187Powerv, @function
_ZL9M187Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,EXPREGS
	sb	zero,1(a5)
	sb	zero,0(a5)
	call	_Z12GenMMC3Powerv
	li	a1,24576
	lla	a2,_ZL8M187Readj
	addi	a1,a1,-1
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	li	a1,28672
	lla	a2,_ZL11M187WriteLojh
	addi	a1,a1,-1
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a2,_ZL13M187Write8000jh
	li	a1,32768
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	li	a1,32768
	addi	a1,a1,1
	lla	a2,_ZL13M187Write8001jh
	mv	a0,a1
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL9M187Powerv, .-_ZL9M187Powerv
	.section	.text._ZL13M187Write8001jh,"ax",@progbits
	.align	2
	.type	_ZL13M187Write8001jh, @function
_ZL13M187Write8001jh:
	la a5, EXPREGS+1; lbu a5, 0(a5);
	bne	a5,zero,.L7
	ret
.L7:
	tail	_Z13MMC3_CMDWritejh
	.size	_ZL13M187Write8001jh, .-_ZL13M187Write8001jh
	.section	.text._ZL13M187Write8000jh,"ax",@progbits
	.align	2
	.type	_ZL13M187Write8000jh, @function
_ZL13M187Write8000jh:
	li	a5,1
	la a4, EXPREGS+1; sb a5, 0(a4);
	tail	_Z13MMC3_CMDWritejh
	.size	_ZL13M187Write8000jh, .-_ZL13M187Write8000jh
	.section	.text._ZL6M187CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M187CWjh, @function
_ZL6M187CWjh:
	la a5, MMC3_cmd; lbu a5, 0(a5);
	slli	a5,a5,5
	xor	a5,a5,a0
	li	a4,4096
	and	a5,a5,a4
	bne	a5,zero,.L10
	ori	a1,a1,256
	tail	_Z7setchr1jj
.L10:
	tail	_Z7setchr1jj
	.size	_ZL6M187CWjh, .-_ZL6M187CWjh
	.section	.text._ZL6M187PWjh,"ax",@progbits
	.align	2
	.type	_ZL6M187PWjh, @function
_ZL6M187PWjh:
	la a5, EXPREGS; lbu a5, 0(a5);
	slli	a4,a5,24
	srai	a4,a4,24
	bge	a4,zero,.L12
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	andi	a4,a5,32
	andi	s0,a5,31
	beq	a4,zero,.L13
	andi	a5,a5,64
	srli	a1,s0,2
	bne	a5,zero,.L18
	srli	a1,s0,1
.L18:
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,32768
	addi	sp,sp,12
	tail	_Z8setprg32jj
.L12:
	andi	a1,a1,63
	tail	_Z7setprg8jj
.L13:
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,49152
	addi	sp,sp,12
	tail	_Z8setprg16jj
	.size	_ZL6M187PWjh, .-_ZL6M187PWjh
	.section	.text._ZL11M187WriteLojh,"ax",@progbits
	.align	2
	.type	_ZL11M187WriteLojh, @function
_ZL11M187WriteLojh:
	li	a5,-20480
	add	a0,a0,a5
	li	a5,-4096
	addi	a5,a5,-1
	and	a0,a0,a5
	beq	a0,zero,.L21
	ret
.L21:
	la a0, MMC3_cmd; lbu a0, 0(a0);
	la a5, EXPREGS; sb a1, 0(a5);
	tail	_Z10FixMMC3PRGi
	.size	_ZL11M187WriteLojh, .-_ZL11M187WriteLojh
	.section	.rodata._Z14Mapper187_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.section	.text._Z14Mapper187_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper187_InitP8CartInfo
	.hidden	_Z14Mapper187_InitP8CartInfo
	.type	_Z14Mapper187_InitP8CartInfo, @function
_Z14Mapper187_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,256
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M187PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL6M187CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL9M187Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC0
	li	a2,0
	li	a1,3
	lla	a0,EXPREGS
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper187_InitP8CartInfo, .-_Z14Mapper187_InitP8CartInfo
	.section	.srodata._ZL9prot_data,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL9prot_data, @object
	.size	_ZL9prot_data, 4
_ZL9prot_data:
	.string	"\203\203B"
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
