#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"coolboy.cpp"
	.option nopic
	.text
	.section	.text._ZL12COOLBOYResetv,"ax",@progbits
	.align	2
	.type	_ZL12COOLBOYResetv, @function
_ZL12COOLBOYResetv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z12MMC3RegResetv
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	lla	a5,EXPREGS
	sb	zero,3(a5)
	sb	zero,2(a5)
	sb	zero,1(a5)
	sb	zero,0(a5)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
	.size	_ZL12COOLBOYResetv, .-_ZL12COOLBOYResetv
	.section	.text._ZL12COOLBOYPowerv,"ax",@progbits
	.align	2
	.type	_ZL12COOLBOYPowerv, @function
_ZL12COOLBOYPowerv:
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
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	call	_Z10FixMMC3CHRi
	li	a1,24576
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a1,28672
	lla	a2,_ZL12COOLBOYWritejh
	addi	a1,a1,-1
	li	a0,24576
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL12COOLBOYPowerv, .-_ZL12COOLBOYPowerv
	.section	.text._ZL13MINDKIDSPowerv,"ax",@progbits
	.align	2
	.type	_ZL13MINDKIDSPowerv, @function
_ZL13MINDKIDSPowerv:
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
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	call	_Z10FixMMC3CHRi
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a1,24576
	lla	a2,_ZL12COOLBOYWritejh
	addi	a1,a1,-1
	li	a0,20480
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL13MINDKIDSPowerv, .-_ZL13MINDKIDSPowerv
	.section	.text._ZL9COOLBOYCWjh,"ax",@progbits
	.align	2
	.type	_ZL9COOLBOYCWjh, @function
_ZL9COOLBOYCWjh:
	lla	a2,EXPREGS
	lbu	a4,3(a2)
	lbu	a5,0(a2)
	andi	t1,a4,16
	andi	a3,a5,-128
	xori	a3,a3,255
	andi	a4,a4,64
	beq	t1,zero,.L9
	beq	a4,zero,.L10
	la a4, MMC3_cmd; lbu a4, 0(a4);
	li	t1,4096
	slli	a4,a4,5
	and	a4,a4,t1
	li	t1,-4096
	addi	t1,t1,2047
	xor	a4,a4,a0
	and	a4,a4,t1
	li	t1,1024
	beq	a4,t1,.L24
.L10:
	lbu	a4,2(a2)
	slli	a5,a5,4
	not	a2,a3
	and	a5,a5,a2
	and	a1,a3,a1
	slli	a4,a4,3
	srli	a3,a0,10
	or	a1,a5,a1
	andi	a4,a4,120
	andi	a5,a3,7
	andi	a1,a1,128
	or	a4,a4,a5
	or	a1,a1,a4
	tail	_Z7setchr1jj
.L9:
	bne	a4,zero,.L11
.L16:
	and	a4,a3,a1
.L12:
	slli	a5,a5,4
	not	a3,a3
	and	a5,a5,a3
	andi	a5,a5,128
	or	a1,a5,a4
	tail	_Z7setchr1jj
.L11:
	la a4, MMC3_cmd; lbu a4, 0(a4);
	slli	a4,a4,5
	li	a2,4096
	and	a4,a4,a2
	xor	t1,a4,a0
	addi	t0,t1,-2048
	beq	t0,zero,.L13
	addi	t0,a2,-2048
	bgtu	t1,t0,.L14
	beq	a4,a0,.L15
	li	a2,1024
	li	a4,0
	bne	t1,a2,.L16
	slli	a5,a5,4
	not	a3,a3
	and	a5,a5,a3
	andi	a5,a5,128
	or	a1,a5,a4
	tail	_Z7setchr1jj
.L14:
	addi	a2,a2,-1024
	li	a4,0
	bne	t1,a2,.L16
	slli	a5,a5,4
	not	a3,a3
	and	a5,a5,a3
	andi	a5,a5,128
	or	a1,a5,a4
	tail	_Z7setchr1jj
.L15:
	la a4, DRegBuf; lbu a4, 0(a4);
	and	a4,a3,a4
	j	.L12
.L24:
	andi	a1,a1,127
	j	.L10
.L13:
	la a4, DRegBuf+1; lbu a4, 0(a4);
	and	a4,a3,a4
	j	.L12
	.size	_ZL9COOLBOYCWjh, .-_ZL9COOLBOYCWjh
	.section	.text._ZL9COOLBOYPWjh,"ax",@progbits
	.align	2
	.type	_ZL9COOLBOYPWjh, @function
_ZL9COOLBOYPWjh:
	addi	sp,sp,-12
	sw	s0,8(sp)
	sw	s1,4(sp)
	lla	a5,EXPREGS
	lbu	a2,1(a5)
	lbu	a3,0(a5)
	lbu	t0,3(a5)
	andi	a4,a2,64
	srli	s1,a3,2
	ori	a4,a4,63
	srli	t1,a2,2
	andi	s1,s1,16
	sw	a4,0(sp)
	andi	t1,t1,32
	or	t1,s1,t1
	lw	s1,0(sp)
	slli	a5,a2,2
	slli	t2,a3,2
	srli	s0,a2,1
	andi	a4,a5,128
	andi	s0,s0,8
	andi	t2,t2,192
	andi	a3,a3,7
	andi	a5,a5,48
	or	a3,s0,a3
	or	a5,t2,a5
	or	a4,s1,a4
	andi	s0,t0,64
	xor	t2,t1,a4
	or	a5,a3,a5
	beq	s0,zero,.L34
	li	a4,253
	bgtu	a1,a4,.L36
.L34:
	mv	t1,a1
.L27:
	slli	a5,a5,4
	xor	a4,t1,a5
	and	a4,a4,t2
	andi	a3,t0,16
	xor	a1,a5,a4
	beq	a3,zero,.L35
	andi	a2,a2,2
	srli	a3,a0,13
	andi	a1,t0,14
	bne	a2,zero,.L37
.L31:
	andi	a4,a4,240
	xor	a4,a4,a5
	andi	a3,a3,1
	or	a4,a4,a3
	or	a1,a4,a1
.L35:
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,12
	tail	_Z7setprg8jj
.L37:
	andi	t0,t0,12
	andi	a1,a3,2
	or	a1,t0,a1
	j	.L31
.L36:
	la a4, MMC3_cmd; lbu a4, 0(a4);
	andi	a4,a4,64
	bne	a4,zero,.L34
	li	a4,49152
	and	a3,a0,a4
	li	t1,0
	bne	a3,a4,.L34
	j	.L27
	.size	_ZL9COOLBOYPWjh, .-_ZL9COOLBOYPWjh
	.section	.text._ZL12COOLBOYWritejh,"ax",@progbits
	.align	2
	.type	_ZL12COOLBOYWritejh, @function
_ZL12COOLBOYWritejh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	la a5, A001B; lb a5, 0(a5);
	mv	s0,a0
	mv	s1,a1
	blt	a5,zero,.L42
.L39:
	lla	a4,EXPREGS
	lbu	a5,3(a4)
	li	a3,128
	andi	a5,a5,144
	bne	a5,a3,.L43
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L43:
	lla	a5,MMC3_cmd
	lbu	a0,0(a5)
	andi	s0,s0,3
	add	a4,a4,s0
	sb	s1,0(a4)
	call	_Z10FixMMC3PRGi
	lla	a5,MMC3_cmd
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lbu	a0,0(a5)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
.L42:
	call	_Z6CartBWjh
	j	.L39
	.size	_ZL12COOLBOYWritejh, .-_ZL12COOLBOYWritejh
	.section	.rodata._Z12COOLBOY_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.section	.text._Z12COOLBOY_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12COOLBOY_InitP8CartInfo
	.hidden	_Z12COOLBOY_InitP8CartInfo
	.type	_Z12COOLBOY_InitP8CartInfo, @function
_Z12COOLBOY_InitP8CartInfo:
	li	a1,4096
	addi	sp,sp,-12
	li	a4,1
	li	a3,8
	li	a2,256
	addi	a1,a1,-2048
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL9COOLBOYPWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL9COOLBOYCWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL12COOLBOYPowerv
	sw	a5,0(s0)
	lla	a5,_ZL12COOLBOYResetv
	sw	a5,4(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC0
	li	a2,0
	li	a1,4
	lla	a0,EXPREGS
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z12COOLBOY_InitP8CartInfo, .-_Z12COOLBOY_InitP8CartInfo
	.section	.text._Z13MINDKIDS_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13MINDKIDS_InitP8CartInfo
	.hidden	_Z13MINDKIDS_InitP8CartInfo
	.type	_Z13MINDKIDS_InitP8CartInfo, @function
_Z13MINDKIDS_InitP8CartInfo:
	li	a1,4096
	addi	sp,sp,-12
	li	a4,1
	li	a3,8
	li	a2,256
	addi	a1,a1,-2048
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL9COOLBOYPWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL9COOLBOYCWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL13MINDKIDSPowerv
	sw	a5,0(s0)
	lla	a5,_ZL12COOLBOYResetv
	sw	a5,4(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC0
	li	a2,0
	li	a1,4
	lla	a0,EXPREGS
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13MINDKIDS_InitP8CartInfo, .-_Z13MINDKIDS_InitP8CartInfo
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
