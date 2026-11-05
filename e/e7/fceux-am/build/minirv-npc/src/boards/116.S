#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"116.cpp"
	.option nopic
	.text
	.section	.text._ZL7SyncPRGv,"ax",@progbits
	.align	2
	.type	_ZL7SyncPRGv, @function
_ZL7SyncPRGv:
	addi	sp,sp,-12
	la a5, .LANCHOR0; lbu a5, 0(a5);
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	andi	a5,a5,3
	li	a4,1
	beq	a5,a4,.L2
	addi	a5,a5,-2
	andi	a5,a5,0xff
	bgtu	a5,a4,.L3
	lla	a5,.LANCHOR1
	lbu	a4,0(a5)
	lbu	a1,3(a5)
	andi	a5,a4,8
	andi	s0,a1,15
	beq	a5,zero,.L12
	andi	a4,a4,4
	bne	a4,zero,.L13
	li	a0,32768
	li	a1,0
	call	_Z8setprg16jj
	mv	a1,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,49152
	addi	sp,sp,12
	tail	_Z8setprg16jj
.L3:
	lla	s0,.LANCHOR2
	lbu	a1,0(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	li	a1,-2
	li	a0,49152
	call	_Z7setprg8jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a1,-1
	li	a0,57344
	addi	sp,sp,12
	tail	_Z7setprg8jj
.L2:
	la s0, .LANCHOR3; lbu s0, 0(s0);
	srli	s0,s0,5
	lla	s1,.LANCHOR4
	andi	a5,s0,2
	add	a5,s1,a5
	lbu	a1,6(a5)
	li	a0,32768
	not	s0,s0
	call	_Z7setprg8jj
	lbu	a1,7(s1)
	li	a0,40960
	andi	s0,s0,2
	call	_Z7setprg8jj
	add	s0,s1,s0
	lbu	a1,6(s0)
	li	a0,49152
	call	_Z7setprg8jj
	lw	s0,4(sp)
	lbu	a1,9(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,57344
	addi	sp,sp,12
	tail	_Z7setprg8jj
.L13:
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a1,15
	li	a0,49152
	addi	sp,sp,12
	tail	_Z8setprg16jj
.L12:
	srli	a1,s0,1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,32768
	addi	sp,sp,12
	tail	_Z8setprg32jj
	.size	_ZL7SyncPRGv, .-_ZL7SyncPRGv
	.section	.text._ZL7SyncCHRv,"ax",@progbits
	.align	2
	.type	_ZL7SyncCHRv, @function
_ZL7SyncCHRv:
	addi	sp,sp,-12
	la a5, .LANCHOR0; lbu a5, 0(a5);
	sw	s0,4(sp)
	sw	ra,8(sp)
	slli	s0,a5,6
	sw	s1,0(sp)
	andi	a5,a5,3
	li	a4,1
	andi	s0,s0,256
	beq	a5,a4,.L15
	addi	a5,a5,-2
	andi	a5,a5,0xff
	bgtu	a5,a4,.L16
	lla	s0,.LANCHOR1
	lbu	a5,0(s0)
	lbu	a1,1(s0)
	andi	a5,a5,16
	beq	a5,zero,.L22
	li	a0,0
	call	_Z7setchr4jj
	lbu	a1,2(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,4096
	addi	sp,sp,12
	tail	_Z7setchr4jj
.L15:
	lla	a5,.LANCHOR4
	lbu	a1,0(a5)
	la s1, .LANCHOR3; lbu s1, 0(s1);
	li	a4,4096
	slli	s1,s1,5
	and	s1,s1,a4
	andi	a1,a1,254
	or	a1,a1,s0
	mv	a0,s1
	call	_Z7setchr1jj
	lla	a5,.LANCHOR4
	lbu	a1,0(a5)
	ori	a0,s1,1024
	ori	a1,a1,1
	or	a1,a1,s0
	call	_Z7setchr1jj
	lla	a5,.LANCHOR4
	lbu	a1,1(a5)
	li	a4,4096
	addi	a0,a4,-2048
	andi	a1,a1,254
	xor	a0,s1,a0
	or	a1,a1,s0
	call	_Z7setchr1jj
	lla	a5,.LANCHOR4
	lbu	a1,1(a5)
	li	a4,4096
	addi	a0,a4,-1024
	ori	a1,a1,1
	xor	a0,s1,a0
	or	a1,a1,s0
	call	_Z7setchr1jj
	lla	a5,.LANCHOR4
	lbu	a1,2(a5)
	li	a4,4096
	xor	a0,s1,a4
	or	a1,a1,s0
	call	_Z7setchr1jj
	lla	a5,.LANCHOR4
	lbu	a1,3(a5)
	li	a4,4096
	addi	a0,a4,1024
	xor	a0,s1,a0
	or	a1,a1,s0
	call	_Z7setchr1jj
	lla	a5,.LANCHOR4
	lbu	a1,4(a5)
	li	a4,8192
	addi	a0,a4,-2048
	xor	a0,s1,a0
	or	a1,a1,s0
	call	_Z7setchr1jj
	lla	a5,.LANCHOR4
	lbu	a1,5(a5)
	li	a4,8192
	addi	a0,a4,-1024
	or	a1,a1,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	xor	a0,s1,a0
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_Z7setchr1jj
.L16:
	lla	s1,.LANCHOR5
	lbu	a1,0(s1)
	li	a0,0
	or	a1,a1,s0
	call	_Z7setchr1jj
	lbu	a1,1(s1)
	li	a0,1024
	or	a1,a1,s0
	call	_Z7setchr1jj
	lbu	a1,2(s1)
	li	a5,4096
	addi	a0,a5,-2048
	or	a1,a1,s0
	call	_Z7setchr1jj
	lbu	a1,3(s1)
	li	a5,4096
	addi	a0,a5,-1024
	or	a1,a1,s0
	call	_Z7setchr1jj
	lbu	a1,4(s1)
	li	a0,4096
	or	a1,a1,s0
	call	_Z7setchr1jj
	lbu	a1,5(s1)
	li	a5,4096
	addi	a0,a5,1024
	or	a1,a1,s0
	call	_Z7setchr1jj
	lbu	a1,6(s1)
	li	a5,8192
	addi	a0,a5,-2048
	or	a1,a1,s0
	call	_Z7setchr1jj
	lbu	a1,7(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	or	a1,a1,s0
	lw	s0,4(sp)
	li	a5,8192
	addi	a0,a5,-1024
	addi	sp,sp,12
	tail	_Z7setchr1jj
.L22:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	srli	a0,a1,1
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL7SyncCHRv, .-_ZL7SyncCHRv
	.section	.text._ZL7SyncMIRv,"ax",@progbits
	.align	2
	.type	_ZL7SyncMIRv, @function
_ZL7SyncMIRv:
	la a5, .LANCHOR0; lbu a5, 0(a5);
	andi	a5,a5,3
	li	a4,1
	beq	a5,a4,.L24
	addi	a5,a5,-2
	andi	a5,a5,0xff
	bgtu	a5,a4,.L25
	la a5, .LANCHOR1; lbu a5, 0(a5);
	andi	a5,a5,3
	li	a3,2
	beq	a5,a3,.L31
	li	a3,3
	beq	a5,a3,.L28
	beq	a5,a4,.L29
	li	a0,2
	tail	_Z9setmirrori
.L24:
	la a0, .LANCHOR7; lbu a0, 0(a0);
	not	a0,a0
	andi	a0,a0,1
	tail	_Z9setmirrori
.L25:
	la a0, .LANCHOR6; lbu a0, 0(a0);
	not	a0,a0
	andi	a0,a0,1
	tail	_Z9setmirrori
.L28:
	li	a0,0
	tail	_Z9setmirrori
.L29:
	li	a0,3
	tail	_Z9setmirrori
.L31:
	li	a0,1
	tail	_Z9setmirrori
	.size	_ZL7SyncMIRv, .-_ZL7SyncMIRv
	.section	.text._ZL12UNLSL12Powerv,"ax",@progbits
	.align	2
	.type	_ZL12UNLSL12Powerv, @function
_ZL12UNLSL12Powerv:
	addi	sp,sp,-12
	la a4, .LANCHOR0; sb zero, 0(a4);
	sw	ra,8(sp)
	sw	s0,4(sp)
	lla	a3,.LANCHOR5
	li	a4,-1
	sw	a4,0(a3)
	li	a4,117833728
	addi	a4,a4,1284
	sw	a4,4(a3)
	li	a4,256
	la a3, .LANCHOR2; sh a4, 0(a3);
	la a4, .LANCHOR6; sb zero, 0(a4);
	li	a4,84148224
	lla	a5,.LANCHOR4
	addi	a4,a4,512
	sw	a4,0(a5)
	li	a4,-33816576
	addi	a4,a4,1798
	sw	a4,4(a5)
	li	a4,-2
	sh	a4,8(a5)
	la a5, .LANCHOR8; sb zero, 0(a5);
	la a5, .LANCHOR9; sb zero, 0(a5);
	la a5, .LANCHOR10; sb zero, 0(a5);
	la a5, .LANCHOR7; sb zero, 0(a5);
	la a5, .LANCHOR3; sb zero, 0(a5);
	li	a5,12
	la a4, .LANCHOR1; sw a5, 0(a4);
	li	s0,65536
	la a5, .LANCHOR11; sb zero, 0(a5);
	la a5, .LANCHOR12; sb zero, 0(a5);
	call	_ZL7SyncPRGv
	call	_ZL7SyncCHRv
	call	_ZL7SyncMIRv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	li	a0,16384
	lla	a2,_ZL16UNLSL12ModeWritejh
	addi	a1,a1,-1
	addi	a0,a0,256
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL12UNLSL12Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL12UNLSL12Powerv, .-_ZL12UNLSL12Powerv
	.section	.text._ZL12UNLSL12Writejh,"ax",@progbits
	.align	2
	.type	_ZL12UNLSL12Writejh, @function
_ZL12UNLSL12Writejh:
	addi	sp,sp,-12
	la a5, .LANCHOR0; lbu a5, 0(a5);
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	andi	a5,a5,3
	li	a4,1
	beq	a5,a4,.L35
	addi	a5,a5,-2
	andi	a5,a5,0xff
	bgtu	a5,a4,.L36
	slli	a5,a1,24
	srai	a5,a5,24
	blt	a5,zero,.L66
	lla	a3,.LANCHOR12
	lbu	a5,0(a3)
	lla	a4,.LANCHOR11
	lbu	a2,0(a4)
	andi	a1,a1,1
	sll	a1,a1,a5
	or	a1,a1,a2
	addi	a5,a5,1
	andi	a5,a5,0xff
	andi	a1,a1,0xff
	sb	a1,0(a4)
	sb	a5,0(a3)
	li	a4,5
	beq	a5,a4,.L67
.L34:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L36:
	li	a4,-45056
	li	a5,12288
	add	a4,a0,a4
	addi	a5,a5,3
	bleu	a4,a5,.L68
	li	a5,61440
	and	a5,a0,a5
	li	a4,36864
	beq	a5,a4,.L40
	li	a4,40960
	beq	a5,a4,.L41
	li	a4,32768
	bne	a5,a4,.L34
	la a5, .LANCHOR2; sb a1, 0(a5);
.L59:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_ZL7SyncPRGv
.L35:
	li	a2,57344
	addi	a3,a2,1
	and	a0,a0,a3
	li	a4,49152
	beq	a0,a4,.L44
	bgtu	a0,a4,.L45
	li	a5,32768
	addi	a4,a5,1
	beq	a0,a4,.L46
	li	a4,40960
	bne	a0,a4,.L69
	la a5, .LANCHOR7; sb a1, 0(a5);
	j	.L65
.L45:
	beq	a0,a2,.L50
	bne	a0,a3,.L70
	la a4, .LANCHOR8; sb a5, 0(a4);
	j	.L34
.L70:
	addi	a4,a4,1
	bne	a0,a4,.L34
	la a4, .LANCHOR13; sb a5, 0(a4);
	j	.L34
.L69:
	bne	a0,a5,.L34
	lla	s0,.LANCHOR3
	lbu	s1,0(s0)
	sb	a1,0(s0)
	xor	a1,a1,s1
	andi	a5,a1,64
	bne	a5,zero,.L71
.L53:
	slli	a1,a1,24
	srai	a1,a1,24
	bge	a1,zero,.L34
	j	.L54
.L67:
	srli	a0,a0,13
	addi	a0,a0,-4
	andi	a0,a0,0xff
	lla	a5,.LANCHOR1
	add	a5,a5,a0
	sb	a1,0(a5)
	la a5, .LANCHOR12; sb zero, 0(a5);
	la a5, .LANCHOR11; sb zero, 0(a5);
	li	a5,2
	beq	a0,a5,.L56
	bgtu	a0,a5,.L57
	bne	a0,zero,.L59
	call	_ZL7SyncMIRv
.L56:
	call	_ZL7SyncCHRv
	j	.L59
.L41:
	la a5, .LANCHOR2+1; sb a1, 0(a5);
	j	.L59
.L40:
	la a5, .LANCHOR6; sb a1, 0(a5);
.L65:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_ZL7SyncMIRv
.L68:
	srli	a4,a0,10
	andi	a5,a0,2
	or	a5,a5,a4
	srli	a5,a5,1
	addi	a5,a5,2
	andi	a5,a5,7
	lla	a4,.LANCHOR5
	add	a4,a4,a5
	lbu	a5,0(a4)
	slli	a0,a0,2
	andi	a0,a0,4
	li	a3,240
	sra	a3,a3,a0
	andi	a1,a1,15
	and	a5,a5,a3
	sll	a1,a1,a0
	or	a5,a5,a1
	sb	a5,0(a4)
.L54:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_ZL7SyncCHRv
.L66:
	lla	a4,.LANCHOR1
	lbu	a5,0(a4)
	la a3, .LANCHOR12; sb zero, 0(a3);
	la a3, .LANCHOR11; sb zero, 0(a3);
	ori	a5,a5,12
	sb	a5,0(a4)
	j	.L59
.L57:
	li	a5,3
	beq	a0,a5,.L59
	j	.L34
.L71:
	call	_ZL7SyncPRGv
	lbu	a1,0(s0)
	xor	a1,s1,a1
	j	.L53
.L44:
	la a5, .LANCHOR9; sb a1, 0(a5);
	j	.L34
.L50:
	li	a0,1
	call	_Z12X6502_IRQEndi
	la a5, .LANCHOR8; sb zero, 0(a5);
	j	.L34
.L46:
	la a5, .LANCHOR3; lbu a5, 0(a5);
	andi	a5,a5,7
	lla	a4,.LANCHOR4
	add	a4,a4,a5
	sb	a1,0(a4)
	li	a4,5
	bleu	a5,a4,.L54
	j	.L59
	.size	_ZL12UNLSL12Writejh, .-_ZL12UNLSL12Writejh
	.section	.text._ZL12UNLSL12HBIRQv,"ax",@progbits
	.align	2
	.type	_ZL12UNLSL12HBIRQv, @function
_ZL12UNLSL12HBIRQv:
	la a5, .LANCHOR0; lbu a5, 0(a5);
	andi	a5,a5,3
	li	a4,1
	beq	a5,a4,.L85
.L72:
	ret
.L85:
	lla	a4,.LANCHOR10
	lbu	a5,0(a4)
	beq	a5,zero,.L75
	la a3, .LANCHOR13; lbu a3, 0(a3);
	bne	a3,zero,.L75
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	bne	a5,zero,.L72
.L86:
	la a5, .LANCHOR8; lbu a5, 0(a5);
	beq	a5,zero,.L72
	li	a0,1
	tail	_Z14X6502_IRQBegini
.L75:
	la a5, .LANCHOR9; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, .LANCHOR13; sb zero, 0(a4);
	bne	a5,zero,.L72
	j	.L86
	.size	_ZL12UNLSL12HBIRQv, .-_ZL12UNLSL12HBIRQv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_ZL7SyncPRGv
	call	_ZL7SyncCHRv
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL7SyncMIRv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL16UNLSL12ModeWritejh,"ax",@progbits
	.align	2
	.type	_ZL16UNLSL12ModeWritejh, @function
_ZL16UNLSL12ModeWritejh:
	li	a5,16384
	addi	a5,a5,256
	and	a4,a0,a5
	beq	a4,a5,.L98
	ret
.L98:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a5, .LANCHOR0; sb a1, 0(a5);
	andi	a0,a0,1
	beq	a0,zero,.L91
	li	a5,12
	la a4, .LANCHOR1; sb a5, 0(a4);
	la a5, .LANCHOR1+3; sb zero, 0(a5);
	la a5, .LANCHOR11; sb zero, 0(a5);
	la a5, .LANCHOR12; sb zero, 0(a5);
.L91:
	call	_ZL7SyncPRGv
	call	_ZL7SyncCHRv
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL7SyncMIRv
	.size	_ZL16UNLSL12ModeWritejh, .-_ZL16UNLSL12ModeWritejh
	.section	.text._Z12UNLSL12_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12UNLSL12_InitP8CartInfo
	.hidden	_Z12UNLSL12_InitP8CartInfo
	.type	_Z12UNLSL12_InitP8CartInfo, @function
_Z12UNLSL12_InitP8CartInfo:
	lla	a5,_ZL12UNLSL12Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12UNLSL12HBIRQv
	la a4, GameHBIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR14
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z12UNLSL12_InitP8CartInfo, .-_Z12UNLSL12_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"MODE"
	.align	2
.LC1:
	.string	"VRCC"
	.align	2
.LC2:
	.string	"VRCP"
	.align	2
.LC3:
	.string	"VRCM"
	.align	2
.LC4:
	.string	"M3RG"
	.align	2
.LC5:
	.string	"M3CT"
	.align	2
.LC6:
	.string	"M3MR"
	.align	2
.LC7:
	.string	"IRQR"
	.align	2
.LC8:
	.string	"IRQC"
	.align	2
.LC9:
	.string	"IRQL"
	.align	2
.LC10:
	.string	"IRQA"
	.align	2
.LC11:
	.string	"M1RG"
	.align	2
.LC12:
	.string	"M1BF"
	.align	2
.LC13:
	.string	"M1MR"
	.section	.bss._ZL9mmc3_regs,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL9mmc3_regs, @object
	.size	_ZL9mmc3_regs, 10
_ZL9mmc3_regs:
	.zero	10
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR14,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 180
_ZL9StateRegs:
	.word	_ZL4mode
	.word	1
	.word	.LC0
	.word	_ZL8vrc2_chr
	.word	8
	.word	.LC1
	.word	_ZL8vrc2_prg
	.word	2
	.word	.LC2
	.word	_ZL9vrc2_mirr
	.word	1
	.word	.LC3
	.word	_ZL9mmc3_regs
	.word	10
	.word	.LC4
	.word	_ZL9mmc3_ctrl
	.word	1
	.word	.LC5
	.word	_ZL9mmc3_mirr
	.word	1
	.word	.LC6
	.word	_ZL9IRQReload
	.word	1
	.word	.LC7
	.word	_ZL8IRQCount
	.word	1
	.word	.LC8
	.word	_ZL8IRQLatch
	.word	1
	.word	.LC9
	.word	_ZL4IRQa
	.word	1
	.word	.LC10
	.word	_ZL9mmc1_regs
	.word	4
	.word	.LC11
	.word	_ZL11mmc1_buffer
	.word	1
	.word	.LC12
	.word	_ZL10mmc1_shift
	.word	1
	.word	.LC13
	.word	0
	.zero	8
	.section	.sbss._ZL10mmc1_shift,"aw",@nobits
	.set	.LANCHOR12,. + 0
	.type	_ZL10mmc1_shift, @object
	.size	_ZL10mmc1_shift, 1
_ZL10mmc1_shift:
	.zero	1
	.section	.sbss._ZL11mmc1_buffer,"aw",@nobits
	.set	.LANCHOR11,. + 0
	.type	_ZL11mmc1_buffer, @object
	.size	_ZL11mmc1_buffer, 1
_ZL11mmc1_buffer:
	.zero	1
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR8,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4mode,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL4mode, @object
	.size	_ZL4mode, 1
_ZL4mode:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.set	.LANCHOR10,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 1
_ZL8IRQCount:
	.zero	1
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.set	.LANCHOR9,. + 0
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 1
_ZL8IRQLatch:
	.zero	1
	.section	.sbss._ZL8vrc2_chr,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL8vrc2_chr, @object
	.size	_ZL8vrc2_chr, 8
_ZL8vrc2_chr:
	.zero	8
	.section	.sbss._ZL8vrc2_prg,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL8vrc2_prg, @object
	.size	_ZL8vrc2_prg, 2
_ZL8vrc2_prg:
	.zero	2
	.section	.sbss._ZL9IRQReload,"aw",@nobits
	.set	.LANCHOR13,. + 0
	.type	_ZL9IRQReload, @object
	.size	_ZL9IRQReload, 1
_ZL9IRQReload:
	.zero	1
	.section	.sbss._ZL9mmc1_regs,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL9mmc1_regs, @object
	.size	_ZL9mmc1_regs, 4
_ZL9mmc1_regs:
	.zero	4
	.section	.sbss._ZL9mmc3_ctrl,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL9mmc3_ctrl, @object
	.size	_ZL9mmc3_ctrl, 1
_ZL9mmc3_ctrl:
	.zero	1
	.section	.sbss._ZL9mmc3_mirr,"aw",@nobits
	.set	.LANCHOR7,. + 0
	.type	_ZL9mmc3_mirr, @object
	.size	_ZL9mmc3_mirr, 1
_ZL9mmc3_mirr:
	.zero	1
	.section	.sbss._ZL9vrc2_mirr,"aw",@nobits
	.set	.LANCHOR6,. + 0
	.type	_ZL9vrc2_mirr, @object
	.size	_ZL9vrc2_mirr, 1
_ZL9vrc2_mirr:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
