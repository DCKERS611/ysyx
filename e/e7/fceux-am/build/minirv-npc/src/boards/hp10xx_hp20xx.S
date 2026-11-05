#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"hp10xx_hp20xx.cpp"
	.option nopic
	.text
	.section	.text._ZL11BMCHPxxReadj,"ax",@progbits
	.align	2
	.type	_ZL11BMCHPxxReadj, @function
_ZL11BMCHPxxReadj:
	la a0, .LANCHOR0; lbu a0, 0(a0);
	ret
	.size	_ZL11BMCHPxxReadj, .-_ZL11BMCHPxxReadj
	.section	.text._ZL12BMCHPxxResetv,"ax",@progbits
	.align	2
	.type	_ZL12BMCHPxxResetv, @function
_ZL12BMCHPxxResetv:
	lla	a3,.LANCHOR0
	lw	a5,0(a3)
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	lla	a4,EXPREGS
	addi	a5,a5,1
	andi	a5,a5,15
	sb	zero,3(a4)
	sb	zero,2(a4)
	sb	zero,1(a4)
	sb	zero,0(a4)
	lla	s0,MMC3_cmd
	sw	a5,0(a3)
	la a5, .LANCHOR1; sb zero, 0(a5);
	call	_Z12MMC3RegResetv
	lbu	a0,0(s0)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
	.size	_ZL12BMCHPxxResetv, .-_ZL12BMCHPxxResetv
	.section	.text._ZL12BMCHPxxPowerv,"ax",@progbits
	.align	2
	.type	_ZL12BMCHPxxPowerv, @function
_ZL12BMCHPxxPowerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z12GenMMC3Powerv
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	lla	a5,EXPREGS
	sb	zero,3(a5)
	sb	zero,2(a5)
	sb	zero,1(a5)
	sb	zero,0(a5)
	la a4, .LANCHOR1; sb zero, 0(a4);
	la a4, .LANCHOR0; sw zero, 0(a4);
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	li	s0,24576
	call	_Z10FixMMC3CHRi
	addi	a1,s0,-1
	lla	a2,_ZL11BMCHPxxReadj
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL12BMCHPxxWritejh
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a1,65536
	lla	a2,_ZL14BMCHPxxHiWritejh
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL12BMCHPxxPowerv, .-_ZL12BMCHPxxPowerv
	.section	.text._ZL9BMCHPxxPWjh,"ax",@progbits
	.align	2
	.type	_ZL9BMCHPxxPWjh, @function
_ZL9BMCHPxxPWjh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,EXPREGS
	lbu	a5,0(s0)
	sw	ra,8(sp)
	lbu	a4,1(s0)
	andi	a3,a5,4
	beq	a3,zero,.L8
	andi	a5,a5,15
	li	a3,4
	beq	a5,a3,.L13
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a1,a4,1
	andi	a1,a1,15
	li	a0,32768
	addi	sp,sp,12
	tail	_Z8setprg32jj
.L8:
	andi	a5,a5,2
	bne	a5,zero,.L14
	andi	a4,a4,16
	li	a5,31
.L11:
	and	a1,a1,a5
	slli	a4,a4,1
	or	a1,a1,a4
	call	_Z7setprg8jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a2, A001B; lbu a2, 0(a2);
	andi	a2,a2,3
	li	a1,24576
	li	a0,16
	addi	sp,sp,12
	tail	_Z8setprg8rijj
.L14:
	andi	a4,a4,24
	li	a5,15
	j	.L11
.L13:
	andi	a1,a4,31
	li	a0,32768
	call	_Z8setprg16jj
	lbu	a1,1(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,49152
	andi	a1,a1,31
	addi	sp,sp,12
	tail	_Z8setprg16jj
	.size	_ZL9BMCHPxxPWjh, .-_ZL9BMCHPxxPWjh
	.section	.text._ZL9BMCHPxxCWjh,"ax",@progbits
	.align	2
	.type	_ZL9BMCHPxxCWjh, @function
_ZL9BMCHPxxCWjh:
	lla	a4,EXPREGS
	lbu	a5,0(a4)
	lbu	a4,2(a4)
	andi	a3,a5,4
	beq	a3,zero,.L16
	andi	a5,a5,3
	li	a3,2
	beq	a5,a3,.L17
	li	a3,3
	beq	a5,a3,.L18
	andi	a0,a4,63
	tail	_Z7setchr8j
.L16:
	andi	a5,a5,1
	beq	a5,zero,.L19
	andi	a4,a4,48
	li	a5,127
	and	a1,a1,a5
	slli	a4,a4,3
	or	a1,a1,a4
	tail	_Z7setchr1jj
.L19:
	andi	a4,a4,32
	li	a5,255
	and	a1,a1,a5
	slli	a4,a4,3
	or	a1,a1,a4
	tail	_Z7setchr1jj
.L17:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	andi	a5,a5,1
	andi	a4,a4,62
	or	a0,a5,a4
	tail	_Z7setchr8j
.L18:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	andi	a5,a5,3
	andi	a4,a4,60
	or	a0,a5,a4
	tail	_Z7setchr8j
	.size	_ZL9BMCHPxxCWjh, .-_ZL9BMCHPxxCWjh
	.section	.text._ZL12BMCHPxxWritejh,"ax",@progbits
	.align	2
	.type	_ZL12BMCHPxxWritejh, @function
_ZL12BMCHPxxWritejh:
	lla	a4,.LANCHOR1
	lbu	a3,0(a4)
	beq	a3,zero,.L26
	ret
.L26:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	a5,a0
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	lla	a3,EXPREGS
	andi	a5,a5,3
	sw	ra,8(sp)
	add	a5,a3,a5
	sb	a1,0(a5)
	andi	a3,a1,-128
	sb	a3,0(a4)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
	.size	_ZL12BMCHPxxWritejh, .-_ZL12BMCHPxxWritejh
	.section	.text._ZL14BMCHPxxHiWritejh,"ax",@progbits
	.align	2
	.type	_ZL14BMCHPxxHiWritejh, @function
_ZL14BMCHPxxHiWritejh:
	la a5, EXPREGS; lbu a5, 0(a5);
	andi	a5,a5,4
	bne	a5,zero,.L33
	li	a5,49152
	bgeu	a0,a5,.L29
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z13MMC3_CMDWritejh
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
.L29:
	tail	_Z13MMC3_IRQWritejh
.L33:
	la a0, MMC3_cmd; lbu a0, 0(a0);
	la a5, .LANCHOR2; sb a1, 0(a5);
	tail	_Z10FixMMC3CHRi
	.size	_ZL14BMCHPxxHiWritejh, .-_ZL14BMCHPxxHiWritejh
	.section	.text._ZL9BMCHPxxMWh,"ax",@progbits
	.align	2
	.type	_ZL9BMCHPxxMWh, @function
_ZL9BMCHPxxMWh:
	la a5, EXPREGS; lbu a5, 0(a5);
	andi	a4,a5,4
	mv	a5,a0
	beq	a4,zero,.L35
	la a0, .LANCHOR2; lbu a0, 0(a0);
	srli	a0,a0,2
	xori	a0,a0,1
	andi	a0,a0,1
	tail	_Z9setmirrori
.L35:
	not	a0,a0
	andi	a0,a0,1
	la a4, A000B; sb a5, 0(a4);
	tail	_Z9setmirrori
	.size	_ZL9BMCHPxxMWh, .-_ZL9BMCHPxxMWh
	.section	.rodata._Z12BMCHPxx_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.align	2
.LC1:
	.string	"UCHR"
	.align	2
.LC2:
	.string	"DPSW"
	.align	2
.LC3:
	.string	"LOCK"
	.section	.text._Z12BMCHPxx_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12BMCHPxx_InitP8CartInfo
	.hidden	_Z12BMCHPxx_InitP8CartInfo
	.type	_Z12BMCHPxx_InitP8CartInfo, @function
_Z12BMCHPxx_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,8
	li	a2,256
	li	a1,256
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL9BMCHPxxCWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL9BMCHPxxPWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL9BMCHPxxMWh
	la a4, mwrap; sw a5, 0(a4);
	lla	a5,_ZL12BMCHPxxPowerv
	sw	a5,0(s0)
	lla	a5,_ZL12BMCHPxxResetv
	sw	a5,4(s0)
	lla	a3,.LC0
	li	a2,0
	li	a1,8
	lla	a0,EXPREGS
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR2
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC2
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR0
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR1
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z12BMCHPxx_InitP8CartInfo, .-_Z12BMCHPxx_InitP8CartInfo
	.section	.sbss._ZL4lock,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL4lock, @object
	.size	_ZL4lock, 1
_ZL4lock:
	.zero	1
	.section	.sbss._ZL8unromchr,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL8unromchr, @object
	.size	_ZL8unromchr, 1
_ZL8unromchr:
	.zero	1
	.section	.sbss._ZL9dipswitch,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL9dipswitch, @object
	.size	_ZL9dipswitch, 4
_ZL9dipswitch:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
