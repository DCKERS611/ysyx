#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"mmc1.cpp"
	.option nopic
	.text
	.section	.text._ZL6MBWRAMjh,"ax",@progbits
	.align	2
	.type	_ZL6MBWRAMjh, @function
_ZL6MBWRAMjh:
	la a5, .LANCHOR0+3; lbu a5, 0(a5);
	andi	a5,a5,16
	beq	a5,zero,.L2
	la a5, .LANCHOR1; lw a5, 0(a5);
	beq	a5,zero,.L1
.L2:
	srli	a4,a0,11
	slli	a4,a4,2
	lla	a5,Page
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a0
	sb	a1,0(a5)
.L1:
	ret
	.size	_ZL6MBWRAMjh, .-_ZL6MBWRAMjh
	.section	.text._ZL6MAWRAMj,"ax",@progbits
	.align	2
	.type	_ZL6MAWRAMj, @function
_ZL6MAWRAMj:
	la a5, .LANCHOR0+3; lbu a5, 0(a5);
	andi	a5,a5,16
	beq	a5,zero,.L12
	la a5, .LANCHOR1; lw a5, 0(a5);
	beq	a5,zero,.L17
.L12:
	srli	a4,a0,11
	slli	a4,a4,2
	lla	a5,Page
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
.L17:
	la a0, X+24; lbu a0, 0(a0);
	ret
	.size	_ZL6MAWRAMj, .-_ZL6MAWRAMj
	.section	.text._ZL7MMC1CHRv,"ax",@progbits
	.align	2
	.type	_ZL7MMC1CHRv, @function
_ZL7MMC1CHRv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	la a5, .LANCHOR2; lw a5, 0(a5);
	li	a4,8192
	lla	s0,.LANCHOR0
	bleu	a5,a4,.L19
	li	a4,16384
	lbu	a2,1(s0)
	bleu	a5,a4,.L20
	srli	a2,a2,2
	andi	a2,a2,3
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
.L19:
	lla	s1,.LANCHOR3
	lbu	a5,0(s0)
	lw	a4,0(s1)
	lbu	a1,1(s0)
	andi	a5,a5,16
	beq	a4,zero,.L21
.L28:
	bne	a5,zero,.L27
	andi	a1,a1,254
	li	a0,0
	jalr	a4
	lbu	a1,1(s0)
	lw	s0,4(sp)
	lw	a5,0(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,4096
	ori	a1,a1,1
	addi	sp,sp,12
	jr	a5
.L27:
	li	a0,0
	jalr	a4
	lbu	a1,2(s0)
	lw	s0,4(sp)
	lw	a5,0(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,4096
	addi	sp,sp,12
	jr	a5
.L20:
	srli	a2,a2,3
	li	a1,24576
	andi	a2,a2,1
	li	a0,16
	call	_Z8setprg8rijj
	lla	s1,.LANCHOR3
	lbu	a5,0(s0)
	lw	a4,0(s1)
	lbu	a1,1(s0)
	andi	a5,a5,16
	bne	a4,zero,.L28
.L21:
	beq	a5,zero,.L23
	li	a0,0
	call	_Z7setchr4jj
	lbu	a1,2(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,4096
	addi	sp,sp,12
	tail	_Z7setchr4jj
.L23:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	srli	a0,a1,1
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL7MMC1CHRv, .-_ZL7MMC1CHRv
	.section	.text._ZL7MMC1PRGv,"ax",@progbits
	.align	2
	.type	_ZL7MMC1PRGv, @function
_ZL7MMC1PRGv:
	addi	sp,sp,-12
	sw	s1,0(sp)
	sw	ra,8(sp)
	sw	s0,4(sp)
	lla	a5,.LANCHOR0
	lla	s1,.LANCHOR4
	lbu	s0,1(a5)
	lbu	a3,3(a5)
	lw	a2,0(s1)
	lbu	a5,0(a5)
	andi	s0,s0,16
	andi	a1,a3,15
	andi	a4,a5,12
	beq	a2,zero,.L30
	li	a0,8
	beq	a4,a0,.L31
	bgtu	a4,a0,.L32
	andi	a5,a5,8
	beq	a5,zero,.L42
.L29:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L32:
	li	a5,12
	bne	a4,a5,.L29
	or	a1,s0,a1
	li	a0,32768
	jalr	a2
	addi	a1,s0,15
	lw	s0,4(sp)
	lw	a5,0(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,49152
	addi	sp,sp,12
	jr	a5
.L30:
	li	a3,8
	beq	a4,a3,.L35
	bgtu	a4,a3,.L36
	andi	a5,a5,8
	bne	a5,zero,.L29
	andi	a1,a1,-2
	add	s0,a1,s0
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	addi	a1,s0,1
.L41:
	li	a0,49152
.L40:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_Z8setprg16jj
.L36:
	li	a5,12
	bne	a4,a5,.L29
	add	a1,a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	addi	a1,s0,15
	j	.L41
.L42:
	andi	a3,a3,14
	or	s0,s0,a3
	mv	a1,s0
	li	a0,32768
	jalr	a2
	addi	a1,s0,1
	lw	s0,4(sp)
	lw	a5,0(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,49152
	addi	sp,sp,12
	jr	a5
.L31:
	or	a1,s0,a1
	li	a0,49152
	jalr	a2
	mv	a1,s0
	lw	s0,4(sp)
	lw	a5,0(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,32768
	addi	sp,sp,12
	jr	a5
.L35:
	li	a0,49152
	add	a1,a1,s0
	call	_Z8setprg16jj
	mv	a1,s0
	li	a0,32768
	j	.L40
	.size	_ZL7MMC1PRGv, .-_ZL7MMC1PRGv
	.section	.rodata._ZL11GenMMC1InitP8CartInfoiiii.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.align	2
.LC1:
	.string	"CHRR"
	.align	2
.LC2:
	.string	"DREG"
	.align	2
.LC3:
	.string	"LRST"
	.align	2
.LC4:
	.string	"BFFR"
	.align	2
.LC5:
	.string	"BFRS"
	.section	.text._ZL11GenMMC1InitP8CartInfoiiii,"ax",@progbits
	.align	2
	.type	_ZL11GenMMC1InitP8CartInfoiiii, @function
_ZL11GenMMC1InitP8CartInfoiiii:
	addi	sp,sp,-20
	sub	a5,a3,a4
	sw	s0,12(sp)
	mv	s0,a0
	slli	a0,a3,10
	slli	a3,a5,10
	la a5, .LANCHOR1; sw zero, 0(a5);
	lla	a5,_ZL12GenMMC1Closev
	sw	s1,8(sp)
	sw	ra,16(sp)
	lla	s1,.LANCHOR2
	lla	t0,.LANCHOR5
	sw	a5,8(s0)
	sw	a0,0(s1)
	la a5, .LANCHOR3; sw zero, 0(a5);
	la a5, .LANCHOR4; sw zero, 0(a5);
	sw	a3,0(t0)
	mv	a5,a2
	bne	a0,zero,.L52
.L45:
	beq	a5,zero,.L53
.L47:
	lla	a3,.LC2
	li	a2,0
	li	a1,4
	lla	a0,.LANCHOR0
	call	_Z10AddExStatePvjiPKc
	lla	a5,_ZL12GenMMC1Powerv
	sw	a5,0(s0)
	lla	a3,.LC3
	lla	a5,_ZL12MMC1_Restorei
	li	a2,1
	li	a1,8
	lla	a0,.LANCHOR8
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC4
	li	a2,1
	li	a1,1
	lla	a0,.LANCHOR9
	call	_Z10AddExStatePvjiPKc
	lw	s0,12(sp)
	lw	ra,16(sp)
	lw	s1,8(sp)
	lla	a3,.LC5
	li	a2,1
	li	a1,1
	lla	a0,.LANCHOR10
	addi	sp,sp,20
	tail	_Z10AddExStatePvjiPKc
.L52:
	sw	a4,4(sp)
	sw	a2,0(sp)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	a5,.LANCHOR6
	li	a3,1
	li	a0,16
	sw	a1,0(a5)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s1)
	lla	s1,.LANCHOR6
	lw	a0,0(s1)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	a4,4(sp)
	lw	a5,0(sp)
	beq	a4,zero,.L45
	lla	t0,.LANCHOR5
	lw	a3,0(s1)
	lw	a2,0(t0)
	slli	a4,a4,10
	sw	a4,28(s0)
	add	a4,a3,a2
	sw	a4,12(s0)
	bne	a5,zero,.L47
.L53:
	li	a0,8192
	call	_Z12FCEU_gmallocj
	mv	a1,a0
	lla	s1,.LANCHOR7
	li	a3,1
	li	a2,8192
	li	a0,0
	sw	a1,0(s1)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a0,0(s1)
	lla	a3,.LC1
	li	a2,0
	li	a1,8192
	call	_Z10AddExStatePvjiPKc
	j	.L47
	.size	_ZL11GenMMC1InitP8CartInfoiiii, .-_ZL11GenMMC1InitP8CartInfoiiii
	.section	.text._ZL12GenMMC1Closev,"ax",@progbits
	.align	2
	.type	_ZL12GenMMC1Closev, @function
_ZL12GenMMC1Closev:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a0, .LANCHOR7; lw a0, 0(a0);
	beq	a0,zero,.L55
	call	_Z10FCEU_gfreePv
.L55:
	la a0, .LANCHOR6; lw a0, 0(a0);
	beq	a0,zero,.L56
	call	_Z10FCEU_gfreePv
.L56:
	lw	ra,8(sp)
	la a5, .LANCHOR6; sw zero, 0(a5);
	la a5, .LANCHOR7; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
	.size	_ZL12GenMMC1Closev, .-_ZL12GenMMC1Closev
	.section	.text._ZL10MMC1MIRRORv.part.0,"ax",@progbits
	.align	2
	.type	_ZL10MMC1MIRRORv.part.0, @function
_ZL10MMC1MIRRORv.part.0:
	la a5, .LANCHOR0; lbu a5, 0(a5);
	andi	a5,a5,3
	li	a4,2
	beq	a5,a4,.L65
	li	a4,3
	beq	a5,a4,.L66
	li	a4,1
	beq	a5,a4,.L70
	li	a0,2
	tail	_Z9setmirrori
.L65:
	li	a0,1
	tail	_Z9setmirrori
.L70:
	li	a0,3
	tail	_Z9setmirrori
.L66:
	li	a0,0
	tail	_Z9setmirrori
	.size	_ZL10MMC1MIRRORv.part.0, .-_ZL10MMC1MIRRORv.part.0
	.section	.text._ZL10MMC1_writejh,"ax",@progbits
	.align	2
	.type	_ZL10MMC1_writejh, @function
_ZL10MMC1_writejh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	s0,.LANCHOR8
	lla	s1,timestampbase
	lla	t1,timestamp
	lw	a4,0(s0)
	lw	a5,0(t1)
	lw	a3,0(s1)
	lw	t2,4(s0)
	lw	t0,4(s1)
	addi	a2,a4,2
	add	a3,a5,a3
	sltu	a4,a2,a4
	sltu	a5,a3,a5
	sw	ra,8(sp)
	add	a4,a4,t2
	add	a5,a5,t0
	bgtu	a4,a5,.L71
	beq	a4,a5,.L84
.L72:
	slli	a5,a1,24
	srai	a5,a5,24
	blt	a5,zero,.L85
	lla	a3,.LANCHOR10
	lbu	a5,0(a3)
	lla	a4,.LANCHOR9
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
	beq	a5,a4,.L86
.L71:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L84:
	bleu	a2,a3,.L72
	j	.L71
.L86:
	srli	a0,a0,13
	addi	a0,a0,-4
	lla	a5,.LANCHOR0
	add	a5,a5,a0
	sb	a1,0(a5)
	la a5, .LANCHOR9; sb zero, 0(a5);
	la a5, .LANCHOR10; sb zero, 0(a5);
	li	a5,2
	beq	a0,a5,.L77
	bgtu	a0,a5,.L78
	beq	a0,zero,.L87
.L80:
	call	_ZL7MMC1CHRv
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_ZL7MMC1PRGv
.L78:
	li	a5,3
	bne	a0,a5,.L71
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_ZL7MMC1PRGv
.L85:
	lla	a4,.LANCHOR0
	lbu	a5,0(a4)
	la a3, .LANCHOR9; sb zero, 0(a3);
	la a3, .LANCHOR10; sb zero, 0(a3);
	ori	a5,a5,12
	sb	a5,0(a4)
	call	_ZL7MMC1PRGv
	lla	t1,timestamp
	lw	a5,0(s1)
	lw	a4,0(t1)
	lw	a3,4(s1)
	add	a4,a5,a4
	sltu	a5,a4,a5
	add	a5,a5,a3
	sw	a4,0(s0)
	sw	a5,4(s0)
	j	.L71
.L77:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_ZL7MMC1CHRv
.L87:
	la a5, .LANCHOR11; lw a5, 0(a5);
	bne	a5,zero,.L80
	call	_ZL10MMC1MIRRORv.part.0
	j	.L80
	.size	_ZL10MMC1_writejh, .-_ZL10MMC1_writejh
	.section	.text._ZL12GenMMC1Powerv,"ax",@progbits
	.align	2
	.type	_ZL12GenMMC1Powerv, @function
_ZL12GenMMC1Powerv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	li	s0,65536
	lla	a5,.LANCHOR8
	sw	ra,8(sp)
	li	a3,0
	li	a4,0
	lla	a2,_ZL10MMC1_writejh
	addi	a1,s0,-1
	li	a0,32768
	sw	a3,0(a5)
	sw	a4,4(a5)
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a2,_Z6CartBRj
	addi	a1,s0,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	la a5, .LANCHOR2; lw a5, 0(a5);
	bne	a5,zero,.L99
.L89:
	la a5, .LANCHOR10; sb zero, 0(a5);
	la a5, .LANCHOR9; sb zero, 0(a5);
	li	a5,31
	la a4, .LANCHOR0; sw a5, 0(a4);
	la a5, .LANCHOR11; lw a5, 0(a5);
	bne	a5,zero,.L91
	call	_ZL10MMC1MIRRORv.part.0
.L91:
	call	_ZL7MMC1CHRv
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL7MMC1PRGv
.L99:
	lla	s0,.LANCHOR6
	lw	a2,0(s0)
	li	a1,24576
	li	a0,8
	call	_Z16FCEU_CheatAddRAMijPh
	la a1, .LANCHOR5; lw a1, 0(a1);
	bne	a1,zero,.L100
.L90:
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_ZL6MAWRAMj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL6MBWRAMjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	j	.L89
.L100:
	lw	a0,0(s0)
	li	a2,1
	call	_Z15FCEU_MemoryRandPhjb
	j	.L90
	.size	_ZL12GenMMC1Powerv, .-_ZL12GenMMC1Powerv
	.section	.text._ZL8NWCPowerv,"ax",@progbits
	.align	2
	.type	_ZL8NWCPowerv, @function
_ZL8NWCPowerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_ZL12GenMMC1Powerv
	lw	ra,8(sp)
	li	a1,0
	li	a0,0
	addi	sp,sp,12
	tail	_Z8setchr8rij
	.size	_ZL8NWCPowerv, .-_ZL8NWCPowerv
	.section	.text._ZL12MMC1_Restorei,"ax",@progbits
	.align	2
	.type	_ZL12MMC1_Restorei, @function
_ZL12MMC1_Restorei:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a5, .LANCHOR11; lw a5, 0(a5);
	bne	a5,zero,.L104
	call	_ZL10MMC1MIRRORv.part.0
.L104:
	call	_ZL7MMC1CHRv
	call	_ZL7MMC1PRGv
	lw	ra,8(sp)
	lla	a5,.LANCHOR8
	li	a3,0
	li	a4,0
	sw	a3,0(a5)
	sw	a4,4(a5)
	addi	sp,sp,12
	jr	ra
	.size	_ZL12MMC1_Restorei, .-_ZL12MMC1_Restorei
	.section	.text._ZL10NWCIRQHooki,"ax",@progbits
	.align	2
	.type	_ZL10NWCIRQHooki, @function
_ZL10NWCIRQHooki:
	la a5, .LANCHOR12; lbu a5, 0(a5);
	andi	a5,a5,16
	bne	a5,zero,.L106
	lla	a4,.LANCHOR13
	lw	a5,0(a4)
	li	a3,1040187392
	add	a0,a0,a5
	li	a5,469762048
	or	a5,a0,a5
	bgeu	a5,a3,.L109
	sw	a0,0(a4)
	ret
.L106:
	ret
.L109:
	li	a0,1
	la a5, .LANCHOR13; sw zero, 0(a5);
	tail	_Z14X6502_IRQBegini
	.size	_ZL10NWCIRQHooki, .-_ZL10NWCIRQHooki
	.section	.text._ZL10NWCPRGHookjh,"ax",@progbits
	.align	2
	.type	_ZL10NWCPRGHookjh, @function
_ZL10NWCPRGHookjh:
	la a5, .LANCHOR12; lbu a5, 0(a5);
	andi	a4,a5,8
	beq	a4,zero,.L112
	andi	a1,a1,7
	ori	a1,a1,8
	tail	_Z8setprg16jj
.L112:
	srli	a1,a5,1
	andi	a1,a1,3
	li	a0,32768
	tail	_Z8setprg32jj
	.size	_ZL10NWCPRGHookjh, .-_ZL10NWCPRGHookjh
	.section	.text._ZL10NWCCHRHookjh,"ax",@progbits
	.align	2
	.type	_ZL10NWCCHRHookjh, @function
_ZL10NWCCHRHookjh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	andi	a5,a1,16
	mv	s0,a1
	bne	a5,zero,.L120
.L114:
	la a5, .LANCHOR12; sb s0, 0(a5);
	andi	a5,s0,8
	beq	a5,zero,.L115
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL7MMC1PRGv
.L115:
	srli	a1,s0,1
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a1,a1,3
	li	a0,32768
	addi	sp,sp,12
	tail	_Z8setprg32jj
.L120:
	li	a0,1
	la a5, .LANCHOR13; sw zero, 0(a5);
	call	_Z12X6502_IRQEndi
	j	.L114
	.size	_ZL10NWCCHRHookjh, .-_ZL10NWCCHRHookjh
	.section	.text._Z14Mapper105_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper105_InitP8CartInfo
	.hidden	_Z14Mapper105_InitP8CartInfo
	.type	_Z14Mapper105_InitP8CartInfo, @function
_Z14Mapper105_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,8
	li	a2,256
	li	a1,256
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_ZL11GenMMC1InitP8CartInfoiiii
	lla	a5,_ZL10NWCIRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL10NWCCHRHookjh
	la a4, .LANCHOR3; sw a5, 0(a4);
	lla	a5,_ZL10NWCPRGHookjh
	la a4, .LANCHOR4; sw a5, 0(a4);
	lla	a5,_ZL8NWCPowerv
	lw	ra,8(sp)
	sw	a5,0(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	_Z14Mapper105_InitP8CartInfo, .-_Z14Mapper105_InitP8CartInfo
	.section	.rodata._Z12Mapper1_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	" >8KB external WRAM present.  Use NES 2.0 if you hack the ROM image.\n"
	.section	.text._Z12Mapper1_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12Mapper1_InitP8CartInfo
	.hidden	_Z12Mapper1_InitP8CartInfo
	.type	_Z12Mapper1_InitP8CartInfo, @function
_Z12Mapper1_InitP8CartInfo:
	lw	a5,92(a0)
	addi	sp,sp,-16
	li	a4,-1008828416
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	addi	a4,a4,-919
	lw	a3,48(a0)
	mv	t1,a0
	beq	a5,a4,.L142
	bgtu	a5,a4,.L125
	li	a4,1178787840
	addi	a4,a4,-602
	beq	a5,a4,.L145
	bleu	a5,a4,.L148
	li	a4,-1413517312
	addi	a4,a4,535
	beq	a5,a4,.L145
	li	a4,-1200324608
	addi	a4,a4,-1345
	li	s1,32
	li	s0,32
	bne	a5,a4,.L127
.L124:
	lla	a0,.LC6
	sw	t1,0(sp)
	call	printf
	lw	t1,0(sp)
.L130:
	mv	a3,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	mv	a4,s1
	lw	s1,4(sp)
	li	a2,256
	li	a1,512
	mv	a0,t1
	addi	sp,sp,16
	tail	_ZL11GenMMC1InitP8CartInfoiiii
.L125:
	li	a4,-917147648
	addi	a4,a4,-1226
	beq	a5,a4,.L142
	bleu	a5,a4,.L149
	li	a4,-856465408
	addi	a4,a4,-1022
	beq	a5,a4,.L145
	li	a4,-76976128
	addi	a4,a4,1082
	beq	a5,a4,.L145
.L127:
	lw	a5,52(t1)
	beq	a5,zero,.L150
.L129:
	lw	a3,64(t1)
	lw	a5,60(t1)
	li	a4,6
	srai	s1,a3,31
	add	a5,a3,a5
	srai	s0,a5,31
	andi	s0,s0,1023
	add	s0,s0,a5
	srai	s0,s0,10
	andi	s1,s1,1023
	add	s1,s1,a3
	addi	a3,s0,-1
	srai	s1,s1,10
	bgtu	a3,a4,.L131
	li	a5,8
	ble	s1,a5,.L132
	li	s1,8
.L132:
	li	s0,8
	j	.L130
.L148:
	li	a4,722591744
	addi	a4,a4,176
	beq	a5,a4,.L145
	li	a4,1065013248
	addi	a4,a4,1045
	beq	a5,a4,.L145
	li	a4,572899328
	addi	a4,a4,527
	bne	a5,a4,.L127
.L145:
	li	s1,8
	li	s0,16
	j	.L124
.L149:
	li	a4,-971497472
	addi	a4,a4,36
	beq	a5,a4,.L145
	lw	a5,52(t1)
	bne	a5,zero,.L129
.L150:
	snez	a3,a3
	slli	s1,a3,3
	li	s0,8
	j	.L130
.L142:
	li	s1,32
	li	s0,32
	j	.L124
.L131:
	li	a4,32
	ble	s0,a4,.L133
	li	s0,32
.L133:
	ble	s1,s0,.L134
	mv	s1,s0
.L134:
	li	a4,8192
	addi	a4,a4,1023
	bgt	a5,a4,.L124
	j	.L130
	.size	_Z12Mapper1_InitP8CartInfo, .-_Z12Mapper1_InitP8CartInfo
	.section	.text._Z14Mapper155_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper155_InitP8CartInfo
	.hidden	_Z14Mapper155_InitP8CartInfo
	.type	_Z14Mapper155_InitP8CartInfo, @function
_Z14Mapper155_InitP8CartInfo:
	lw	a4,48(a0)
	addi	sp,sp,-12
	li	a3,8
	snez	a4,a4
	slli	a4,a4,3
	li	a2,256
	li	a1,512
	sw	ra,8(sp)
	call	_ZL11GenMMC1InitP8CartInfoiiii
	lw	ra,8(sp)
	li	a5,1
	la a4, .LANCHOR1; sw a5, 0(a4);
	addi	sp,sp,12
	jr	ra
	.size	_Z14Mapper155_InitP8CartInfo, .-_Z14Mapper155_InitP8CartInfo
	.section	.text._Z14Mapper171_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper171_InitP8CartInfo
	.hidden	_Z14Mapper171_InitP8CartInfo
	.type	_Z14Mapper171_InitP8CartInfo, @function
_Z14Mapper171_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,0
	li	a2,32
	li	a1,32
	sw	ra,8(sp)
	call	_ZL11GenMMC1InitP8CartInfoiiii
	lw	ra,8(sp)
	li	a5,1
	la a4, .LANCHOR11; sw a5, 0(a4);
	addi	sp,sp,12
	jr	ra
	.size	_Z14Mapper171_InitP8CartInfo, .-_Z14Mapper171_InitP8CartInfo
	.section	.text._Z10SAROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SAROM_InitP8CartInfo
	.hidden	_Z10SAROM_InitP8CartInfo
	.type	_Z10SAROM_InitP8CartInfo, @function
_Z10SAROM_InitP8CartInfo:
	lw	a4,48(a0)
	li	a3,8
	li	a2,64
	snez	a4,a4
	slli	a4,a4,3
	li	a1,128
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.size	_Z10SAROM_InitP8CartInfo, .-_Z10SAROM_InitP8CartInfo
	.section	.text._Z10SBROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SBROM_InitP8CartInfo
	.hidden	_Z10SBROM_InitP8CartInfo
	.type	_Z10SBROM_InitP8CartInfo, @function
_Z10SBROM_InitP8CartInfo:
	li	a4,0
	li	a3,0
	li	a2,64
	li	a1,128
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.size	_Z10SBROM_InitP8CartInfo, .-_Z10SBROM_InitP8CartInfo
	.section	.text._Z10SCROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SCROM_InitP8CartInfo
	.hidden	_Z10SCROM_InitP8CartInfo
	.type	_Z10SCROM_InitP8CartInfo, @function
_Z10SCROM_InitP8CartInfo:
	li	a4,0
	li	a3,0
	li	a2,128
	li	a1,128
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.size	_Z10SCROM_InitP8CartInfo, .-_Z10SCROM_InitP8CartInfo
	.section	.text._Z10SEROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SEROM_InitP8CartInfo
	.hidden	_Z10SEROM_InitP8CartInfo
	.type	_Z10SEROM_InitP8CartInfo, @function
_Z10SEROM_InitP8CartInfo:
	li	a4,0
	li	a3,0
	li	a2,64
	li	a1,32
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.size	_Z10SEROM_InitP8CartInfo, .-_Z10SEROM_InitP8CartInfo
	.section	.text._Z10SGROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SGROM_InitP8CartInfo
	.hidden	_Z10SGROM_InitP8CartInfo
	.type	_Z10SGROM_InitP8CartInfo, @function
_Z10SGROM_InitP8CartInfo:
	li	a4,0
	li	a3,0
	li	a2,0
	li	a1,256
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.size	_Z10SGROM_InitP8CartInfo, .-_Z10SGROM_InitP8CartInfo
	.section	.text._Z10SKROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SKROM_InitP8CartInfo
	.hidden	_Z10SKROM_InitP8CartInfo
	.type	_Z10SKROM_InitP8CartInfo, @function
_Z10SKROM_InitP8CartInfo:
	lw	a4,48(a0)
	li	a3,8
	li	a2,64
	snez	a4,a4
	slli	a4,a4,3
	li	a1,256
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.size	_Z10SKROM_InitP8CartInfo, .-_Z10SKROM_InitP8CartInfo
	.section	.text._Z10SLROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SLROM_InitP8CartInfo
	.hidden	_Z10SLROM_InitP8CartInfo
	.type	_Z10SLROM_InitP8CartInfo, @function
_Z10SLROM_InitP8CartInfo:
	li	a4,0
	li	a3,0
	li	a2,128
	li	a1,256
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.size	_Z10SLROM_InitP8CartInfo, .-_Z10SLROM_InitP8CartInfo
	.section	.text._Z11SL1ROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11SL1ROM_InitP8CartInfo
	.hidden	_Z11SL1ROM_InitP8CartInfo
	.type	_Z11SL1ROM_InitP8CartInfo, @function
_Z11SL1ROM_InitP8CartInfo:
	li	a4,0
	li	a3,0
	li	a2,128
	li	a1,128
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.size	_Z11SL1ROM_InitP8CartInfo, .-_Z11SL1ROM_InitP8CartInfo
	.section	.text._Z11SL2ROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11SL2ROM_InitP8CartInfo
	.hidden	_Z11SL2ROM_InitP8CartInfo
	.type	_Z11SL2ROM_InitP8CartInfo, @function
_Z11SL2ROM_InitP8CartInfo:
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,256
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.size	_Z11SL2ROM_InitP8CartInfo, .-_Z11SL2ROM_InitP8CartInfo
	.section	.text._Z10SFROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SFROM_InitP8CartInfo
	.hidden	_Z10SFROM_InitP8CartInfo
	.type	_Z10SFROM_InitP8CartInfo, @function
_Z10SFROM_InitP8CartInfo:
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,256
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.size	_Z10SFROM_InitP8CartInfo, .-_Z10SFROM_InitP8CartInfo
	.section	.text._Z10SHROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SHROM_InitP8CartInfo
	.hidden	_Z10SHROM_InitP8CartInfo
	.type	_Z10SHROM_InitP8CartInfo, @function
_Z10SHROM_InitP8CartInfo:
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,256
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.size	_Z10SHROM_InitP8CartInfo, .-_Z10SHROM_InitP8CartInfo
	.section	.text._Z10SNROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SNROM_InitP8CartInfo
	.hidden	_Z10SNROM_InitP8CartInfo
	.type	_Z10SNROM_InitP8CartInfo, @function
_Z10SNROM_InitP8CartInfo:
	lw	a4,48(a0)
	li	a3,8
	li	a2,0
	snez	a4,a4
	slli	a4,a4,3
	li	a1,256
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.size	_Z10SNROM_InitP8CartInfo, .-_Z10SNROM_InitP8CartInfo
	.section	.text._Z10SOROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SOROM_InitP8CartInfo
	.hidden	_Z10SOROM_InitP8CartInfo
	.type	_Z10SOROM_InitP8CartInfo, @function
_Z10SOROM_InitP8CartInfo:
	lw	a4,48(a0)
	li	a3,16
	li	a2,0
	snez	a4,a4
	slli	a4,a4,3
	li	a1,256
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.size	_Z10SOROM_InitP8CartInfo, .-_Z10SOROM_InitP8CartInfo
	.section	.sbss._ZL11BufferShift,"aw",@nobits
	.set	.LANCHOR10,. + 0
	.type	_ZL11BufferShift, @object
	.size	_ZL11BufferShift, 1
_ZL11BufferShift:
	.zero	1
	.section	.sbss._ZL11NONBRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL11NONBRAMSIZE, @object
	.size	_ZL11NONBRAMSIZE, 4
_ZL11NONBRAMSIZE:
	.zero	4
	.section	.sbss._ZL11NWCIRQCount,"aw",@nobits
	.align	2
	.set	.LANCHOR13,. + 0
	.type	_ZL11NWCIRQCount, @object
	.size	_ZL11NWCIRQCount, 4
_ZL11NWCIRQCount:
	.zero	4
	.section	.sbss._ZL12MMC1CHRHook4,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL12MMC1CHRHook4, @object
	.size	_ZL12MMC1CHRHook4, 4
_ZL12MMC1CHRHook4:
	.zero	4
	.section	.sbss._ZL13MMC1PRGHook16,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL13MMC1PRGHook16, @object
	.size	_ZL13MMC1PRGHook16, 4
_ZL13MMC1PRGHook16:
	.zero	4
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL5DRegs,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL5DRegs, @object
	.size	_ZL5DRegs, 4
_ZL5DRegs:
	.zero	4
	.section	.sbss._ZL5is155,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL5is155, @object
	.size	_ZL5is155, 4
_ZL5is155:
	.zero	4
	.section	.sbss._ZL5is171,"aw",@nobits
	.align	2
	.set	.LANCHOR11,. + 0
	.type	_ZL5is171, @object
	.size	_ZL5is171, 4
_ZL5is171:
	.zero	4
	.section	.sbss._ZL6Buffer,"aw",@nobits
	.set	.LANCHOR9,. + 0
	.type	_ZL6Buffer, @object
	.size	_ZL6Buffer, 1
_ZL6Buffer:
	.zero	1
	.section	.sbss._ZL6CHRRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	_ZL6CHRRAM, @object
	.size	_ZL6CHRRAM, 4
_ZL6CHRRAM:
	.zero	4
	.section	.sbss._ZL6NWCRec,"aw",@nobits
	.set	.LANCHOR12,. + 0
	.type	_ZL6NWCRec, @object
	.size	_ZL6NWCRec, 1
_ZL6NWCRec:
	.zero	1
	.section	.sbss._ZL6lreset,"aw",@nobits
	.align	3
	.set	.LANCHOR8,. + 0
	.type	_ZL6lreset, @object
	.size	_ZL6lreset, 8
_ZL6lreset:
	.zero	8
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
