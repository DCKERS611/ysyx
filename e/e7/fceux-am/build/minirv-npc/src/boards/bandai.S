#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"bandai.cpp"
	.option nopic
	.text
	.section	.text._ZL10BandaiReadj,"ax",@progbits
	.align	2
	.type	_ZL10BandaiReadj, @function
_ZL10BandaiReadj:
	la a0, X+24; lbu a0, 0(a0);
	la a5, .LANCHOR0; lbu a5, 0(a5);
	slli	a5,a5,4
	andi	a0,a0,-17
	or	a0,a0,a5
	andi	a0,a0,0xff
	ret
	.size	_ZL10BandaiReadj, .-_ZL10BandaiReadj
	.section	.text._ZL11BarcodeReadj,"ax",@progbits
	.align	2
	.type	_ZL11BarcodeReadj, @function
_ZL11BarcodeReadj:
	la a0, .LANCHOR1; lbu a0, 0(a0);
	ret
	.size	_ZL11BarcodeReadj, .-_ZL11BarcodeReadj
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,.LANCHOR2
	sw	ra,8(sp)
	la a3, .LANCHOR3; lbu a3, 0(a3);
	lbu	a2,0(a5)
	mv	s0,a5
	li	s1,0
	bne	a3,zero,.L16
.L7:
	lbu	a1,0(s0)
	mv	a0,s1
	addi	s1,s1,1024
	call	_Z7setchr1jj
	li	a5,8192
	addi	s0,s0,1
	bne	s1,a5,.L7
	lla	a5,.LANCHOR2
	lbu	a1,8(a5)
	li	a0,32768
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
.L6:
	lla	a5,.LANCHOR2
	lbu	a5,9(a5)
	li	a4,2
	li	a0,2
	andi	a5,a5,3
	beq	a5,a4,.L15
	li	a4,3
	li	a0,3
	beq	a5,a4,.L15
	li	a4,1
	li	a0,1
	beq	a5,a4,.L17
.L15:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_Z9setmirrori
.L16:
	slli	a2,a2,4
	li	a0,0
	andi	s0,a2,16
	call	_Z7setchr8j
	lla	a5,.LANCHOR2
	lbu	a1,8(a5)
	li	a0,32768
	andi	a1,a1,15
	or	a1,a1,s0
	call	_Z8setprg16jj
	ori	a1,s0,15
	li	a0,49152
	call	_Z8setprg16jj
	j	.L6
.L17:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL11BandaiPowerv,"ax",@progbits
	.align	2
	.type	_ZL11BandaiPowerv, @function
_ZL11BandaiPowerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR4; sb zero, 0(a5);
	la a5, .LANCHOR5; sb zero, 0(a5);
	la a5, .LANCHOR6; sb zero, 0(a5);
	la a5, .LANCHOR7; sb zero, 0(a5);
	la a5, .LANCHOR8; sb zero, 0(a5);
	la a5, .LANCHOR9; sb zero, 0(a5);
	la a5, .LANCHOR10; sb zero, 0(a5);
	la a5, .LANCHOR11; sb zero, 0(a5);
	la a5, .LANCHOR12; sb zero, 0(a5);
	call	_ZL4Syncv
	li	a1,32768
	lla	a2,_ZL10BandaiReadj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL11BandaiWritejh
	li	a0,24576
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL11BandaiPowerv, .-_ZL11BandaiPowerv
	.section	.text._ZL9M157Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M157Powerv, @function
_ZL9M157Powerv:
	la a5, .LANCHOR4; sb zero, 0(a5);
	addi	sp,sp,-12
	li	a5,-1
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a4, .LANCHOR13; sb a5, 0(a4);
	li	s0,65536
	la a5, .LANCHOR14; sw zero, 0(a5);
	la a5, .LANCHOR1; sw zero, 0(a5);
	la a5, .LANCHOR15; sw zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_ZL11BandaiWritejh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,32768
	lla	a2,_ZL11BarcodeReadj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_Z6CartBRj
	li	a0,32768
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL9M157Powerv, .-_ZL9M157Powerv
	.section	.text._ZL11BandaiWritejh,"ax",@progbits
	.align	2
	.type	_ZL11BandaiWritejh, @function
_ZL11BandaiWritejh:
	andi	a0,a0,15
	li	a5,9
	bleu	a0,a5,.L65
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	li	a5,12
	beq	a0,a5,.L25
	bgtu	a0,a5,.L26
	li	a5,10
	beq	a0,a5,.L27
	li	a5,11
	bne	a0,a5,.L23
	la a5, .LANCHOR17; sb a1, 0(a5);
.L23:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L26:
	li	a5,13
	bne	a0,a5,.L23
	lla	a3,.LANCHOR6
	lbu	a4,0(a3)
	srli	a2,a1,7
	srli	a5,a1,6
	srli	s0,a1,5
	la a1, .LANCHOR5; sb a2, 0(a1);
	andi	a5,a5,1
	andi	s0,s0,1
	bne	a4,zero,.L66
	lla	a4,.LANCHOR7
	beq	s0,zero,.L33
	lla	a0,.LANCHOR12
	lbu	a2,0(a0)
	li	a1,3
	beq	a2,a1,.L36
	bgtu	a2,a1,.L37
	li	a4,1
	beq	a2,a4,.L38
	li	a4,2
	bne	a2,a4,.L63
	lla	a4,.LANCHOR8
	lbu	a2,0(a4)
	li	a1,8
	beq	a2,a1,.L67
	lla	t1,.LANCHOR10
	lbu	a1,0(t1)
	li	t0,16
	slli	a1,a1,1
	or	a1,a5,a1
	sb	a1,0(t1)
	beq	a2,t0,.L47
	addi	a2,a2,1
	andi	a2,a2,0xff
	sb	a2,0(a4)
.L63:
	lla	a4,.LANCHOR7
.L33:
	sb	a5,0(a4)
	sb	s0,0(a3)
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L65:
	lla	a5,.LANCHOR2
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
.L27:
	li	a0,1
	sw	a1,0(sp)
	call	_Z12X6502_IRQEndi
	lw	a1,0(sp)
	lw	ra,12(sp)
	la a5, .LANCHOR17; lhu a5, 0(a5);
	andi	s0,a1,1
	la a4, .LANCHOR4; sb s0, 0(a4);
	lw	s0,8(sp)
	la a4, .LANCHOR16; sh a5, 0(a4);
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L25:
	lla	a4,.LANCHOR17
	lbu	a5,0(a4)
	slli	s0,a1,8
	lw	ra,12(sp)
	or	a5,a5,s0
	lw	s0,8(sp)
	sh	a5,0(a4)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L66:
	lla	a4,.LANCHOR7
	beq	s0,zero,.L33
	lbu	a2,0(a4)
	bne	a2,zero,.L68
	beq	a5,zero,.L33
	la a2, .LANCHOR12; sb zero, 0(a2);
	j	.L33
.L37:
	li	a1,4
	bne	a2,a1,.L33
	lla	a4,.LANCHOR8
	lbu	a2,0(a4)
	li	a1,8
	beq	a2,a1,.L69
	lla	a0,.LANCHOR9
	lbu	a1,0(a0)
	addi	a2,a2,1
	andi	a2,a2,0xff
	slli	a1,a1,1
	or	a1,a5,a1
	andi	a1,a1,0xff
	sb	a1,0(a0)
	sb	a2,0(a4)
	li	a0,8
	lla	a4,.LANCHOR7
	bne	a2,a0,.L33
	lla	t1,.LANCHOR10
	lbu	a2,0(t1)
	lla	a0,.LANCHOR19
	add	a0,a0,a2
	addi	a2,a2,1
	sb	a1,0(a0)
	sb	a2,0(t1)
	j	.L33
.L68:
	bne	a5,zero,.L33
	li	a2,1
	la a1, .LANCHOR12; sb a2, 0(a1);
	la a2, .LANCHOR8; sb zero, 0(a2);
	la a2, .LANCHOR11; sb zero, 0(a2);
	j	.L33
.L38:
	lla	a4,.LANCHOR8
	lbu	a2,0(a4)
	li	a1,6
	bgtu	a2,a1,.L41
	lla	a0,.LANCHOR11
	lbu	a1,0(a0)
	addi	a2,a2,1
	slli	a1,a1,1
	or	a1,a5,a1
	sb	a1,0(a0)
.L71:
	sb	a2,0(a4)
	j	.L63
.L36:
	lla	t1,.LANCHOR8
	lbu	a2,0(t1)
	li	a0,8
	beq	a2,a0,.L70
	lla	t0,.LANCHOR9
	lbu	a1,0(t0)
	addi	a2,a2,1
	andi	a2,a2,0xff
	srli	t2,a1,7
	slli	a1,a1,1
	la s1, .LANCHOR0; sb t2, 0(s1);
	sb	a1,0(t0)
	sb	a2,0(t1)
	bne	a2,a0,.L33
	lla	a1,.LANCHOR10
	lbu	a2,0(a1)
	addi	a2,a2,1
	sb	a2,0(a1)
	j	.L33
.L41:
	la a1, .LANCHOR18; lbu a1, 0(a1);
	bne	a1,zero,.L43
	la a1, .LANCHOR11; lbu a1, 0(a1);
	la t1, .LANCHOR10; sb a1, 0(t1);
	bne	a5,zero,.L50
	li	a1,4
	sb	a1,0(a0)
	addi	a2,a2,1
	j	.L71
.L67:
	la a2, .LANCHOR10; sb zero, 0(a2);
	la a2, .LANCHOR0; sb zero, 0(a2);
	li	a2,9
	sb	a2,0(a4)
	j	.L63
.L69:
	la a4, .LANCHOR0; sb zero, 0(a4);
	la a4, .LANCHOR9; sb zero, 0(a4);
	la a4, .LANCHOR8; sb zero, 0(a4);
	lla	a4,.LANCHOR7
	j	.L33
.L70:
	la a1, .LANCHOR10; lbu a1, 0(a1);
	lla	a2,.LANCHOR19
	add	a2,a2,a1
	lbu	a2,0(a2)
	la a1, .LANCHOR0; sb zero, 0(a1);
	la a1, .LANCHOR8; sb zero, 0(a1);
	la a1, .LANCHOR9; sb a2, 0(a1);
	j	.L33
.L50:
	li	a1,3
	sb	a1,0(a0)
	addi	a2,a2,1
	j	.L71
.L43:
	bne	a5,zero,.L50
	li	a1,2
	sb	a1,0(a0)
	addi	a2,a2,1
	j	.L71
.L47:
	li	a2,4
	sb	a2,0(a0)
	li	a2,8
	sb	a2,0(a4)
	j	.L63
	.size	_ZL11BandaiWritejh, .-_ZL11BandaiWritejh
	.section	.text._ZL9M153Closev,"ax",@progbits
	.align	2
	.type	_ZL9M153Closev, @function
_ZL9M153Closev:
	la a0, .LANCHOR20; lw a0, 0(a0);
	beq	a0,zero,.L78
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR20; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L78:
	la a5, .LANCHOR20; sw zero, 0(a5);
	ret
	.size	_ZL9M153Closev, .-_ZL9M153Closev
	.section	.text._ZL9M153Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M153Powerv, @function
_ZL9M153Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_ZL4Syncv
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL11BandaiWritejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR21; lw a0, 0(a0);
	la a2, .LANCHOR20; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL9M153Powerv, .-_ZL9M153Powerv
	.section	.text._ZL13BandaiIRQHooki,"ax",@progbits
	.align	2
	.type	_ZL13BandaiIRQHooki, @function
_ZL13BandaiIRQHooki:
	la a5, .LANCHOR4; lbu a5, 0(a5);
	beq	a5,zero,.L88
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR16
	lhu	a5,0(s0)
	sw	ra,8(sp)
	sub	a0,a5,a0
	slli	a0,a0,16
	srai	a0,a0,16
	sh	a0,0(s0)
	blt	a0,zero,.L91
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L88:
	ret
.L91:
	li	a0,1
	call	_Z14X6502_IRQBegini
	la a5, .LANCHOR4; sb zero, 0(a5);
	li	a5,-1
	lw	ra,8(sp)
	sh	a5,0(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL13BandaiIRQHooki, .-_ZL13BandaiIRQHooki
	.section	.text._ZL14BarcodeIRQHooki,"ax",@progbits
	.align	2
	.type	_ZL14BarcodeIRQHooki, @function
_ZL14BarcodeIRQHooki:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	la a5, .LANCHOR4; lbu a5, 0(a5);
	mv	s0,a0
	beq	a5,zero,.L94
	lla	s1,.LANCHOR16
	lhu	a5,0(s1)
	sub	a5,a5,a0
	slli	a5,a5,16
	srai	a5,a5,16
	sh	a5,0(s1)
	blt	a5,zero,.L100
.L94:
	lla	a5,.LANCHOR15
	lw	a3,0(a5)
	li	a4,999
	add	a0,s0,a3
	bgt	a0,a4,.L96
	lw	ra,8(sp)
	lw	s0,4(sp)
	sw	a0,0(a5)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L96:
	lla	a2,.LANCHOR14
	lw	a3,0(a2)
	lla	a4,.LANCHOR13
	addi	a0,a0,-1000
	add	a4,a4,a3
	lbu	a4,0(a4)
	sw	a0,0(a5)
	li	a5,255
	beq	a4,a5,.L101
	lw	ra,8(sp)
	lw	s0,4(sp)
	xori	a4,a4,1
	slli	a4,a4,3
	addi	a3,a3,1
	la a5, .LANCHOR1; sw a4, 0(a5);
	sw	a3,0(a2)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L101:
	lw	ra,8(sp)
	lw	s0,4(sp)
	la a5, .LANCHOR1; sw zero, 0(a5);
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L100:
	li	a0,1
	call	_Z14X6502_IRQBegini
	la a5, .LANCHOR4; sb zero, 0(a5);
	li	a5,-1
	sh	a5,0(s1)
	j	.L94
	.size	_ZL14BarcodeIRQHooki, .-_ZL14BarcodeIRQHooki
	.section	.rodata._Z13Mapper16_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"DATA"
	.section	.text._Z13Mapper16_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper16_InitP8CartInfo
	.hidden	_Z13Mapper16_InitP8CartInfo
	.type	_Z13Mapper16_InitP8CartInfo, @function
_Z13Mapper16_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	mv	a5,a0
	li	a4,1
	lla	a0,.LANCHOR19
	li	t1,256
	lla	a3,_ZL11BandaiPowerv
	sw	a4,48(a5)
	sw	a3,0(a5)
	sw	a0,12(a5)
	sw	t1,28(a5)
	la a5, .LANCHOR18; sb a4, 0(a5);
	la a5, .LANCHOR3; sb zero, 0(a5);
	lla	a5,_ZL13BandaiIRQHooki
	lla	a3,.LC4
	li	a2,0
	li	a1,256
	la a4, MapIRQHook; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR22
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR23
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper16_InitP8CartInfo, .-_Z13Mapper16_InitP8CartInfo
	.section	.text._Z14Mapper159_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper159_InitP8CartInfo
	.hidden	_Z14Mapper159_InitP8CartInfo
	.type	_Z14Mapper159_InitP8CartInfo, @function
_Z14Mapper159_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	mv	a5,a0
	lla	a4,_ZL11BandaiPowerv
	sw	a4,0(a5)
	li	a4,1
	sw	a4,48(a5)
	lla	a0,.LANCHOR19
	li	a4,128
	sw	a4,28(a5)
	sw	a0,12(a5)
	la a5, .LANCHOR18; sb zero, 0(a5);
	la a5, .LANCHOR3; sb zero, 0(a5);
	lla	a5,_ZL13BandaiIRQHooki
	lla	a3,.LC4
	li	a2,0
	li	a1,128
	la a4, MapIRQHook; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR22
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR23
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper159_InitP8CartInfo, .-_Z14Mapper159_InitP8CartInfo
	.section	.rodata._Z14Mapper153_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"WRAM"
	.section	.text._Z14Mapper153_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper153_InitP8CartInfo
	.hidden	_Z14Mapper153_InitP8CartInfo
	.type	_Z14Mapper153_InitP8CartInfo, @function
_Z14Mapper153_InitP8CartInfo:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	lla	a4,_ZL9M153Powerv
	sw	a4,0(a0)
	lla	a4,_ZL9M153Closev
	sw	a4,8(a0)
	li	a4,1
	la a3, .LANCHOR3; sb a4, 0(a3);
	lla	a4,_ZL13BandaiIRQHooki
	lla	s0,.LANCHOR21
	la a3, MapIRQHook; sw a4, 0(a3);
	sw	a0,0(sp)
	li	a4,8192
	li	a0,8192
	sw	a4,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR20
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s0)
	lw	a0,0(s1)
	lla	a3,.LC5
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	a5,0(sp)
	lw	a4,48(a5)
	beq	a4,zero,.L107
	lw	a3,0(s1)
	lw	a4,0(s0)
	sw	a3,12(a5)
	sw	a4,28(a5)
.L107:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR23
	addi	sp,sp,16
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper153_InitP8CartInfo, .-_Z14Mapper153_InitP8CartInfo
	.globl	__mulsi3
	.globl	__umodsi3
	.globl	__modsi3
	.section	.text._Z15FCEUI_DatachSetPKh,"ax",@progbits
	.align	2
	.globl	_Z15FCEUI_DatachSetPKh
	.hidden	_Z15FCEUI_DatachSetPKh
	.type	_Z15FCEUI_DatachSetPKh, @function
_Z15FCEUI_DatachSetPKh:
	addi	sp,sp,-1120
	sw	ra,1116(sp)
	sw	s0,1112(sp)
	sw	s1,1108(sp)
	lla	a5,.LANCHOR24
	addi	a4,sp,28
	lla	t0,.LANCHOR24+240
.L113:
	lw	t1,0(a5)
	lw	a1,4(a5)
	lw	a2,8(a5)
	lw	a3,12(a5)
	sw	t1,0(a4)
	sw	a1,4(a4)
	sw	a2,8(a4)
	sw	a3,12(a4)
	addi	a5,a5,16
	addi	a4,a4,16
	bne	a5,t0,.L113
	lla	a5,.LANCHOR24+240
	addi	a4,sp,268
	lla	t2,.LANCHOR24+520
.L114:
	lw	t0,0(a5)
	lw	t1,4(a5)
	lw	a1,8(a5)
	lw	a2,12(a5)
	lw	a3,16(a5)
	sw	t0,0(a4)
	sw	t1,4(a4)
	sw	a1,8(a4)
	sw	a2,12(a4)
	sw	a3,16(a4)
	addi	a5,a5,20
	addi	a4,a4,20
	bne	a5,t2,.L114
	lla	a5,.LANCHOR24+520
	addi	a4,sp,548
	lla	t2,.LANCHOR24+800
.L115:
	lw	t0,0(a5)
	lw	t1,4(a5)
	lw	a1,8(a5)
	lw	a2,12(a5)
	lw	a3,16(a5)
	sw	t0,0(a4)
	sw	t1,4(a4)
	sw	a1,8(a4)
	sw	a2,12(a4)
	sw	a3,16(a4)
	addi	a5,a5,20
	addi	a4,a4,20
	bne	a5,t2,.L115
	lla	a5,.LANCHOR24+800
	addi	a4,sp,828
	lla	t2,.LANCHOR24+1080
.L116:
	lw	t0,0(a5)
	lw	t1,4(a5)
	lw	a1,8(a5)
	lw	a2,12(a5)
	lw	a3,16(a5)
	sw	t0,0(a4)
	sw	t1,4(a4)
	sw	a1,8(a4)
	sw	a2,12(a4)
	sw	a3,16(a4)
	addi	a5,a5,20
	addi	a4,a4,20
	bne	a5,t2,.L116
	addi	s0,sp,12
	mv	a1,s0
	li	a3,0
	li	t1,9
	li	t0,13
.L120:
	add	a5,a0,a3
	lbu	a2,0(a5)
	mv	a4,a3
	addi	a3,a3,1
	addi	a5,a2,-48
	andi	a5,a5,0xff
	beq	a2,zero,.L117
	sb	a5,0(a1)
	bgtu	a5,t1,.L122
	addi	a1,a1,1
	bne	a3,t0,.L120
	li	a2,1
	li	a4,13
.L121:
	lla	a3,.LANCHOR13+32
	lla	a5,.LANCHOR13
.L123:
	sb	zero,0(a5)
	addi	a5,a5,1
	bne	a5,a3,.L123
	li	a5,1
	lla	a3,.LANCHOR13
	sh	a5,32(a3)
	sb	a5,34(a3)
	bleu	a2,a5,.L171
	addi	a4,a4,-7
	li	a3,35
	bleu	a4,a5,.L172
.L136:
	lla	a1,.LANCHOR13
	add	a4,a1,a3
	li	a2,1
	addi	a5,a3,3
	sb	a2,0(a4)
	sb	zero,1(a4)
	sb	a2,2(a4)
	lla	a4,.LANCHOR13+35
	add	a5,a1,a5
	add	a4,a4,a3
.L147:
	sb	zero,0(a5)
	addi	a5,a5,1
	bne	a4,a5,.L147
	lla	a5,.LANCHOR13
	add	s1,a5,a3
	li	a5,-1
	sb	a5,35(s1)
	lw	ra,1116(sp)
	lw	s0,1112(sp)
	la a5, .LANCHOR14; sw zero, 0(a5);
	li	a5,8
	la a4, .LANCHOR1; sw a5, 0(a4);
	la a5, .LANCHOR15; sw zero, 0(a5);
	lw	s1,1108(sp)
	li	a0,1
	addi	sp,sp,1120
	jr	ra
.L171:
	lbu	a1,12(sp)
	addi	a4,sp,28
	lla	a3,.LANCHOR13+42
	slli	a5,a1,1
	add	a5,a5,a1
	slli	a5,a5,3
	mv	t1,s0
	add	a2,a4,a5
	li	a0,42
	li	t0,84
.L129:
	lw	a4,0(a2)
	lbu	a5,1(t1)
	beq	a4,zero,.L125
	slli	a4,a5,3
	sub	a4,a4,a5
	slli	a4,a4,2
	addi	a5,sp,548
	add	a4,a5,a4
	addi	a5,a3,-7
.L126:
	lw	t2,0(a4)
	addi	a5,a5,1
	addi	a4,a4,4
	sb	t2,-1(a5)
	bne	a3,a5,.L126
	addi	a0,a0,7
	addi	a2,a2,4
	addi	t1,t1,1
	addi	a3,a3,7
	bne	a0,t0,.L129
.L173:
	la a4, .LANCHOR13+77; sb zero, 0(a4);
	li	a5,1
	lla	a4,.LANCHOR13
	sh	a5,78(a4)
	sh	a5,80(a4)
	lla	a5,.LANCHOR13+7
	addi	a0,sp,19
	lla	a3,.LANCHOR13+89
	li	a2,82
	sw	a5,8(sp)
	li	t1,117
.L130:
	lbu	t0,0(a0)
	addi	a5,a3,-7
	slli	a4,t0,3
	sub	a4,a4,t0
	slli	a4,a4,2
	addi	t0,sp,828
	add	a4,t0,a4
.L131:
	lw	t0,0(a4)
	addi	a5,a5,1
	addi	a4,a4,4
	sb	t0,-1(a5)
	bne	a3,a5,.L131
	addi	a2,a2,7
	addi	a0,a0,1
	addi	a3,a3,7
	bne	a2,t1,.L130
	addi	a4,s0,11
	mv	s1,s0
	li	a5,1
	sw	a4,0(sp)
	sub	a4,a5,s1
	li	s0,0
	sw	a4,4(sp)
	j	.L132
.L134:
	lbu	a1,1(s1)
	addi	a5,a5,3
	addi	s1,s1,1
.L132:
	mv	a0,a5
	call	__mulsi3
	lw	a5,4(sp)
	lw	a4,0(sp)
	add	s0,s0,a0
	add	a5,a5,s1
	andi	a5,a5,1
	addi	a5,a5,-1
	andi	a5,a5,-2
	bne	a4,s1,.L134
	li	a1,10
	mv	a0,s0
	call	__umodsi3
	li	a5,10
	sub	a0,a5,a0
	li	a1,10
	call	__umodsi3
	slli	a5,a0,3
	sub	a4,a5,a0
	slli	a4,a4,2
	addi	a5,sp,828
	add	a4,a5,a4
	lla	a5,.LANCHOR13
.L135:
	lw	a3,0(a4)
	addi	a5,a5,1
	addi	a4,a4,4
	sb	a3,116(a5)
	lw	a3,8(sp)
	bne	a3,a5,.L135
	li	a3,124
	j	.L136
.L125:
	slli	a4,a5,3
	sub	a4,a4,a5
	slli	a4,a4,2
	addi	a5,sp,268
	add	a4,a5,a4
	addi	a5,a3,-7
.L128:
	lw	t2,0(a4)
	addi	a5,a5,1
	addi	a4,a4,4
	sb	t2,-1(a5)
	bne	a3,a5,.L128
	addi	a0,a0,7
	addi	a2,a2,4
	addi	t1,t1,1
	addi	a3,a3,7
	bne	a0,t0,.L129
	j	.L173
.L122:
	lw	ra,1116(sp)
	lw	s0,1112(sp)
	lw	s1,1108(sp)
	li	a0,0
	addi	sp,sp,1120
	jr	ra
.L117:
	li	a5,12288
	addi	a5,a5,384
	srl	a5,a5,a4
	andi	a5,a5,1
	beq	a5,zero,.L122
	addi	a2,a4,-12
	j	.L121
.L172:
	mv	a2,s0
	li	a0,0
	li	a4,0
	li	a1,7
.L139:
	andi	a3,a4,1
	lbu	a5,0(a2)
	bne	a3,zero,.L138
	slli	a3,a5,1
	add	a5,a3,a5
.L138:
	addi	a4,a4,1
	add	a0,a0,a5
	addi	a2,a2,1
	bne	a4,a1,.L139
	li	a1,10
	call	__umodsi3
	li	a5,10
	li	a1,10
	sub	a0,a5,a0
	call	__umodsi3
	lla	a5,.LANCHOR13+7
	lla	a3,.LANCHOR13+42
	mv	a1,s0
	li	a2,35
	sw	a5,8(sp)
	li	t1,63
.L140:
	lbu	t0,0(a1)
	addi	a5,a3,-7
	slli	a4,t0,3
	sub	a4,a4,t0
	slli	a4,a4,2
	addi	t0,sp,268
	add	a4,t0,a4
.L141:
	lw	t0,0(a4)
	addi	a5,a5,1
	addi	a4,a4,4
	sb	t0,-1(a5)
	bne	a5,a3,.L141
	addi	a2,a2,7
	addi	a1,a1,1
	addi	a3,a5,7
	bne	a2,t1,.L140
	la a5, .LANCHOR13+63; sb zero, 0(a5);
	li	a5,65536
	addi	a5,a5,1
	lla	a4,.LANCHOR13
	sw	a5,64(a4)
	lla	a3,.LANCHOR13+75
	li	a2,68
	li	a1,89
.L143:
	lbu	t1,4(s0)
	addi	a5,a3,-7
	slli	a4,t1,3
	sub	a4,a4,t1
	slli	a4,a4,2
	addi	t1,sp,828
	add	a4,t1,a4
.L144:
	lw	t1,0(a4)
	addi	a5,a5,1
	addi	a4,a4,4
	sb	t1,-1(a5)
	bne	a5,a3,.L144
	addi	a2,a2,7
	addi	s0,s0,1
	addi	a3,a5,7
	bne	a2,a1,.L143
	slli	a5,a0,3
	sub	a5,a5,a0
	addi	a4,sp,828
	slli	a5,a5,2
	add	a5,a4,a5
	lla	a4,.LANCHOR13
.L146:
	lw	a3,0(a5)
	addi	a4,a4,1
	addi	a5,a5,4
	sb	a3,88(a4)
	lw	a3,8(sp)
	bne	a3,a4,.L146
	li	a3,96
	j	.L136
	.size	_Z15FCEUI_DatachSetPKh, .-_Z15FCEUI_DatachSetPKh
	.section	.text._Z14Mapper157_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper157_InitP8CartInfo
	.hidden	_Z14Mapper157_InitP8CartInfo
	.type	_Z14Mapper157_InitP8CartInfo, @function
_Z14Mapper157_InitP8CartInfo:
	lla	a5,_ZL9M157Powerv
	sw	a5,0(a0)
	la a4, GameInfo; lw a4, 0(a4);
	li	a5,1
	sw	a5,28(a4)
	la a4, .LANCHOR3; sb a5, 0(a4);
	lla	a5,_ZL14BarcodeIRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR23
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper157_InitP8CartInfo, .-_Z14Mapper157_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	"ADDR"
	.align	2
.LC7:
	.string	"WORD"
	.align	2
.LC8:
	.string	"LATC"
	.align	2
.LC9:
	.string	"BITC"
	.align	2
.LC10:
	.string	"SDA"
	.align	2
.LC11:
	.string	"SCL"
	.align	2
.LC12:
	.string	"OUT"
	.align	2
.LC13:
	.string	"OE"
	.align	2
.LC14:
	.string	"STAT"
	.align	2
.LC15:
	.string	"REGS"
	.align	2
.LC16:
	.string	"IRQA"
	.align	2
.LC17:
	.string	"IRQC"
	.align	2
.LC18:
	.string	"IRQL"
	.section	.rodata
	.align	2
	.set	.LANCHOR24,. + 0
.LC0:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	0
.LC1:
	.word	0
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
.LC2:
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
.LC3:
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	0
	.word	0
	.section	.bss._ZL11BarcodeData,"aw",@nobits
	.align	2
	.set	.LANCHOR13,. + 0
	.type	_ZL11BarcodeData, @object
	.size	_ZL11BarcodeData, 256
_ZL11BarcodeData:
	.zero	256
	.section	.bss._ZL11x24c0x_data,"aw",@nobits
	.align	2
	.set	.LANCHOR19,. + 0
	.type	_ZL11x24c0x_data, @object
	.size	_ZL11x24c0x_data, 256
_ZL11x24c0x_data:
	.zero	256
	.section	.bss._ZL3reg,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 16
_ZL3reg:
	.zero	16
	.section	.data._ZL15x24c0xStateRegs,"aw"
	.align	2
	.set	.LANCHOR22,. + 0
	.type	_ZL15x24c0xStateRegs, @object
	.size	_ZL15x24c0xStateRegs, 120
_ZL15x24c0xStateRegs:
	.word	_ZL11x24c0x_addr
	.word	1
	.word	.LC6
	.word	_ZL11x24c0x_word
	.word	1
	.word	.LC7
	.word	_ZL12x24c0x_latch
	.word	1
	.word	.LC8
	.word	_ZL15x24c0x_bitcount
	.word	1
	.word	.LC9
	.word	_ZL10x24c0x_sda
	.word	1
	.word	.LC10
	.word	_ZL10x24c0x_scl
	.word	1
	.word	.LC11
	.word	_ZL10x24c0x_out
	.word	1
	.word	.LC12
	.word	_ZL9x24c0x_oe
	.word	1
	.word	.LC13
	.word	_ZL12x24c0x_state
	.word	1
	.word	.LC14
	.word	0
	.zero	8
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR23,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 60
_ZL9StateRegs:
	.word	_ZL3reg
	.word	16
	.word	.LC15
	.word	_ZL4IRQa
	.word	1
	.word	.LC16
	.word	_ZL8IRQCount
	.word	2
	.word	.LC17
	.word	_ZL8IRQLatch
	.word	2
	.word	.LC18
	.word	0
	.zero	8
	.section	.sbss._ZL10BarcodeOut,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL10BarcodeOut, @object
	.size	_ZL10BarcodeOut, 4
_ZL10BarcodeOut:
	.zero	4
	.section	.sbss._ZL10x24c0x_out,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL10x24c0x_out, @object
	.size	_ZL10x24c0x_out, 1
_ZL10x24c0x_out:
	.zero	1
	.section	.sbss._ZL10x24c0x_scl,"aw",@nobits
	.set	.LANCHOR6,. + 0
	.type	_ZL10x24c0x_scl, @object
	.size	_ZL10x24c0x_scl, 1
_ZL10x24c0x_scl:
	.zero	1
	.section	.sbss._ZL10x24c0x_sda,"aw",@nobits
	.set	.LANCHOR7,. + 0
	.type	_ZL10x24c0x_sda, @object
	.size	_ZL10x24c0x_sda, 1
_ZL10x24c0x_sda:
	.zero	1
	.section	.sbss._ZL11x24c0x_addr,"aw",@nobits
	.set	.LANCHOR11,. + 0
	.type	_ZL11x24c0x_addr, @object
	.size	_ZL11x24c0x_addr, 1
_ZL11x24c0x_addr:
	.zero	1
	.section	.sbss._ZL11x24c0x_word,"aw",@nobits
	.set	.LANCHOR10,. + 0
	.type	_ZL11x24c0x_word, @object
	.size	_ZL11x24c0x_word, 1
_ZL11x24c0x_word:
	.zero	1
	.section	.sbss._ZL12x24c0x_latch,"aw",@nobits
	.set	.LANCHOR9,. + 0
	.type	_ZL12x24c0x_latch, @object
	.size	_ZL12x24c0x_latch, 1
_ZL12x24c0x_latch:
	.zero	1
	.section	.sbss._ZL12x24c0x_state,"aw",@nobits
	.set	.LANCHOR12,. + 0
	.type	_ZL12x24c0x_state, @object
	.size	_ZL12x24c0x_state, 1
_ZL12x24c0x_state:
	.zero	1
	.section	.sbss._ZL14BarcodeReadPos,"aw",@nobits
	.align	2
	.set	.LANCHOR14,. + 0
	.type	_ZL14BarcodeReadPos, @object
	.size	_ZL14BarcodeReadPos, 4
_ZL14BarcodeReadPos:
	.zero	4
	.section	.sbss._ZL15x24c0x_bitcount,"aw",@nobits
	.set	.LANCHOR8,. + 0
	.type	_ZL15x24c0x_bitcount, @object
	.size	_ZL15x24c0x_bitcount, 1
_ZL15x24c0x_bitcount:
	.zero	1
	.section	.sbss._ZL17BarcodeCycleCount,"aw",@nobits
	.align	2
	.set	.LANCHOR15,. + 0
	.type	_ZL17BarcodeCycleCount, @object
	.size	_ZL17BarcodeCycleCount, 4
_ZL17BarcodeCycleCount:
	.zero	4
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR20,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL5is153,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL5is153, @object
	.size	_ZL5is153, 1
_ZL5is153:
	.zero	1
	.section	.sbss._ZL6x24c02,"aw",@nobits
	.set	.LANCHOR18,. + 0
	.type	_ZL6x24c02, @object
	.size	_ZL6x24c02, 1
_ZL6x24c02:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	1
	.set	.LANCHOR16,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 2
_ZL8IRQCount:
	.zero	2
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.align	1
	.set	.LANCHOR17,. + 0
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 2
_ZL8IRQLatch:
	.zero	2
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR21,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.section	.sbss._ZL9x24c0x_oe,"aw",@nobits
	.set	.LANCHOR5,. + 0
	.type	_ZL9x24c0x_oe, @object
	.size	_ZL9x24c0x_oe, 1
_ZL9x24c0x_oe:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
