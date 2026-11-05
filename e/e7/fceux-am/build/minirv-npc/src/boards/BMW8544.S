#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"BMW8544.cpp"
	.option nopic
	.text
	.section	.text._ZL15UNLBMW8544Powerv,"ax",@progbits
	.align	2
	.type	_ZL15UNLBMW8544Powerv, @function
_ZL15UNLBMW8544Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z12GenMMC3Powerv
	li	s0,28672
	addi	a1,s0,-1
	lla	a2,_ZL19UNLBMW8544ProtWritejh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL18UNLBMW8544ProtReadj
	li	a0,24576
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL15UNLBMW8544Powerv, .-_ZL15UNLBMW8544Powerv
	.section	.text._ZL18UNLBMW8544ProtReadj,"ax",@progbits
	.align	2
	.type	_ZL18UNLBMW8544ProtReadj, @function
_ZL18UNLBMW8544ProtReadj:
	andi	a0,a0,1
	la a5, fceuindbg; lw a5, 0(a5);
	or	a0,a0,a5
	bne	a0,zero,.L9
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,EXPREGS
	lbu	a5,0(s0)
	sw	ra,8(sp)
	li	a4,192
	andi	a5,a5,224
	beq	a5,a4,.L12
	li	a0,255
	call	_Z5readbi
	sb	a0,2(s0)
.L7:
	la a0, MMC3_cmd; lbu a0, 0(a0);
	andi	a0,a0,127
	call	_Z10FixMMC3CHRi
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
.L9:
	li	a0,0
	ret
.L12:
	li	a0,106
	call	_Z5readbi
	sb	a0,1(s0)
	j	.L7
	.size	_ZL18UNLBMW8544ProtReadj, .-_ZL18UNLBMW8544ProtReadj
	.section	.text._ZL19UNLBMW8544ProtWritejh,"ax",@progbits
	.align	2
	.type	_ZL19UNLBMW8544ProtWritejh, @function
_ZL19UNLBMW8544ProtWritejh:
	andi	a0,a0,1
	beq	a0,zero,.L15
	ret
.L15:
	la a0, MMC3_cmd; lbu a0, 0(a0);
	la a5, EXPREGS; sb a1, 0(a5);
	tail	_Z10FixMMC3PRGi
	.size	_ZL19UNLBMW8544ProtWritejh, .-_ZL19UNLBMW8544ProtWritejh
	.section	.text._ZL12UNLBMW8544CWjh,"ax",@progbits
	.align	2
	.type	_ZL12UNLBMW8544CWjh, @function
_ZL12UNLBMW8544CWjh:
	beq	a0,zero,.L20
	addi	a4,a0,-2048
	beq	a4,zero,.L21
	li	a4,4096
	beq	a0,a4,.L22
	ret
.L20:
	srli	a1,a1,1
	la a5, EXPREGS+1; lbu a5, 0(a5);
	xor	a1,a1,a5
	tail	_Z7setchr2jj
.L22:
	la a1, EXPREGS+2; lbu a1, 0(a1);
	andi	a1,a1,63
	tail	_Z7setchr4jj
.L21:
	la a5, EXPREGS+2; lbu a5, 0(a5);
	slli	a5,a5,1
	andi	a5,a5,128
	srli	a1,a1,1
	li	a0,4096
	or	a1,a5,a1
	addi	a0,a0,-2048
	tail	_Z7setchr2jj
	.size	_ZL12UNLBMW8544CWjh, .-_ZL12UNLBMW8544CWjh
	.section	.text._ZL12UNLBMW8544PWjh,"ax",@progbits
	.align	2
	.type	_ZL12UNLBMW8544PWjh, @function
_ZL12UNLBMW8544PWjh:
	li	a5,32768
	beq	a0,a5,.L25
	tail	_Z7setprg8jj
.L25:
	la a1, EXPREGS; lbu a1, 0(a1);
	andi	a1,a1,31
	tail	_Z7setprg8jj
	.size	_ZL12UNLBMW8544PWjh, .-_ZL12UNLBMW8544PWjh
	.section	.rodata._Z15UNLBMW8544_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.section	.text._Z15UNLBMW8544_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z15UNLBMW8544_InitP8CartInfo
	.hidden	_Z15UNLBMW8544_InitP8CartInfo
	.type	_Z15UNLBMW8544_InitP8CartInfo, @function
_Z15UNLBMW8544_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,128
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL12UNLBMW8544PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL12UNLBMW8544CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL15UNLBMW8544Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC0
	li	a2,0
	li	a1,3
	lla	a0,EXPREGS
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z15UNLBMW8544_InitP8CartInfo, .-_Z15UNLBMW8544_InitP8CartInfo
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
