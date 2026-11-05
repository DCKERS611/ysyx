#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"164.cpp"
	.option nopic
	.text
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	la a5, .LANCHOR0; lw a5, 0(a5);
	jr	a5
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL5Writejh,"ax",@progbits
	.align	2
	.type	_ZL5Writejh, @function
_ZL5Writejh:
	li	a4,28672
	addi	a4,a4,768
	li	a5,20480
	and	a0,a0,a4
	addi	a4,a5,512
	beq	a0,a4,.L4
	bgtu	a0,a4,.L5
	beq	a0,a5,.L6
	addi	a5,a5,256
	bne	a0,a5,.L10
	la a5, .LANCHOR1; sb a1, 0(a5);
	la a5, .LANCHOR0; lw a5, 0(a5);
	jr	a5
.L5:
	addi	a5,a5,768
	bne	a0,a5,.L11
	la a5, .LANCHOR1+2; sb a1, 0(a5);
	ret
.L11:
	ret
.L6:
	la a5, .LANCHOR1+1; sb a1, 0(a5);
	la a5, .LANCHOR0; lw a5, 0(a5);
	jr	a5
.L4:
	la a5, .LANCHOR1+3; sb a1, 0(a5);
	la a5, .LANCHOR0; lw a5, 0(a5);
	jr	a5
.L10:
	ret
	.size	_ZL5Writejh, .-_ZL5Writejh
	.section	.text._ZL6Write3jh,"ax",@progbits
	.align	2
	.type	_ZL6Write3jh, @function
_ZL6Write3jh:
	srli	a0,a0,8
	andi	a0,a0,3
	lla	a5,.LANCHOR1
	add	a5,a5,a0
	sb	a1,0(a5)
	la a5, .LANCHOR0; lw a5, 0(a5);
	jr	a5
	.size	_ZL6Write3jh, .-_ZL6Write3jh
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,8(sp)
	call	_Z8setprg8rijj
	lla	a5,.LANCHOR1
	lbu	a1,0(a5)
	lbu	a5,1(a5)
	li	a0,32768
	slli	a1,a1,4
	andi	a5,a5,15
	or	a1,a1,a5
	call	_Z8setprg32jj
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL5Sync3v,"ax",@progbits
	.align	2
	.type	_ZL5Sync3v, @function
_ZL5Sync3v:
	addi	sp,sp,-12
	li	a0,0
	sw	ra,8(sp)
	call	_Z7setchr8j
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	lla	a4,.LANCHOR1
	lbu	a3,3(a4)
	li	a5,1
	andi	a3,a3,7
	sll	a5,a5,a3
	andi	a3,a5,160
	bne	a3,zero,.L16
	andi	a3,a5,80
	bne	a3,zero,.L17
	andi	a5,a5,10
	beq	a5,zero,.L22
	lbu	a5,2(a4)
	lbu	a1,0(a4)
	lw	ra,8(sp)
	slli	a5,a5,4
	andi	a5,a5,255
	andi	a1,a1,12
	li	a0,32768
	or	a1,a5,a1
	addi	sp,sp,12
	tail	_Z8setprg32jj
.L17:
	lbu	a5,1(a4)
	lbu	a1,2(a4)
	lbu	a3,0(a4)
	srli	a5,a5,1
	lw	ra,8(sp)
	andi	a5,a5,1
	andi	a4,a3,14
	slli	a1,a1,4
	or	a5,a5,a4
	andi	a1,a1,255
	or	a1,a5,a1
	li	a0,32768
	addi	sp,sp,12
	tail	_Z8setprg32jj
.L16:
	lbu	a5,2(a4)
	lbu	a1,0(a4)
	lw	ra,8(sp)
	slli	a5,a5,4
	andi	a5,a5,255
	andi	a1,a1,15
	li	a0,32768
	or	a1,a5,a1
	addi	sp,sp,12
	tail	_Z8setprg32jj
.L22:
	lbu	a1,0(a4)
	lbu	a5,2(a4)
	lbu	a3,1(a4)
	lw	ra,8(sp)
	andi	a1,a1,12
	andi	a4,a3,2
	slli	a5,a5,4
	or	a1,a1,a4
	andi	a5,a5,255
	or	a1,a5,a1
	li	a0,32768
	addi	sp,sp,12
	tail	_Z8setprg32jj
	.size	_ZL5Sync3v, .-_ZL5Sync3v
	.section	.text._ZL5Closev,"ax",@progbits
	.align	2
	.type	_ZL5Closev, @function
_ZL5Closev:
	la a0, .LANCHOR2; lw a0, 0(a0);
	beq	a0,zero,.L29
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR2; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L29:
	la a5, .LANCHOR2; sw zero, 0(a5);
	ret
	.size	_ZL5Closev, .-_ZL5Closev
	.section	.text._ZL5Powerv,"ax",@progbits
	.align	2
	.type	_ZL5Powerv, @function
_ZL5Powerv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR1
	li	a2,8
	li	a1,0
	mv	a0,s0
	sw	ra,8(sp)
	call	memset
	li	a1,24576
	li	a5,-1
	lla	a2,_ZL5Writejh
	addi	a1,a1,-1
	li	a0,20480
	sb	a5,1(s0)
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	la a0, .LANCHOR3; lw a0, 0(a0);
	la a2, .LANCHOR2; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	call	_Z16FCEU_CheatAddRAMijPh
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a5, .LANCHOR0; lw a5, 0(a5);
	addi	sp,sp,12
	jr	a5
	.size	_ZL5Powerv, .-_ZL5Powerv
	.section	.text._ZL6Power3v,"ax",@progbits
	.align	2
	.type	_ZL6Power3v, @function
_ZL6Power3v:
	li	a1,24576
	li	a5,117440512
	addi	sp,sp,-12
	addi	a5,a5,3
	lla	a2,_ZL6Write3jh
	addi	a1,a1,-1
	li	a0,20480
	sw	ra,8(sp)
	la a4, .LANCHOR1; sw a5, 0(a4);
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	la a0, .LANCHOR3; lw a0, 0(a0);
	la a2, .LANCHOR2; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	call	_Z16FCEU_CheatAddRAMijPh
	lw	ra,8(sp)
	la a5, .LANCHOR0; lw a5, 0(a5);
	addi	sp,sp,12
	jr	a5
	.size	_ZL6Power3v, .-_ZL6Power3v
	.section	.text._ZL6Power2v,"ax",@progbits
	.align	2
	.type	_ZL6Power2v, @function
_ZL6Power2v:
	addi	sp,sp,-12
	li	a2,8
	li	a1,0
	lla	a0,.LANCHOR1
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	memset
	li	a0,16384
	li	a5,1
	addi	a0,a0,17
	la a4, .LANCHOR4; sb a5, 0(a4);
	li	s0,24576
	call	_Z15GetWriteHandleri
	addi	a1,s0,-1
	lla	a2,_ZL7ReadLowj
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL6Write2jh
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	la a0, .LANCHOR3; lw a0, 0(a0);
	la a2, .LANCHOR2; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	call	_Z16FCEU_CheatAddRAMijPh
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a5, .LANCHOR0; lw a5, 0(a5);
	addi	sp,sp,12
	jr	a5
	.size	_ZL6Power2v, .-_ZL6Power2v
	.section	.text._ZL7ReadLowj,"ax",@progbits
	.align	2
	.type	_ZL7ReadLowj, @function
_ZL7ReadLowj:
	li	a4,28672
	addi	a4,a4,1792
	li	a5,20480
	and	a0,a0,a4
	addi	a4,a5,256
	beq	a0,a4,.L39
	addi	a5,a5,1280
	bne	a0,a5,.L45
	la a0, .LANCHOR5; lbu a0, 0(a0);
	beq	a0,zero,.L41
	lla	a5,.LANCHOR1
	lbu	a0,2(a5)
	lbu	a5,1(a5)
	or	a0,a0,a5
.L41:
	ret
.L45:
	li	a0,4
	ret
.L39:
	lla	a5,.LANCHOR1
	lbu	a0,2(a5)
	lbu	a3,0(a5)
	lbu	a4,1(a5)
	lbu	a5,3(a5)
	or	a0,a0,a3
	or	a0,a0,a4
	not	a5,a5
	or	a0,a0,a5
	andi	a0,a0,0xff
	ret
	.size	_ZL7ReadLowj, .-_ZL7ReadLowj
	.section	.text._ZL6Write2jh,"ax",@progbits
	.align	2
	.type	_ZL6Write2jh, @function
_ZL6Write2jh:
	li	a5,20480
	addi	a4,a5,257
	beq	a0,a4,.L62
	addi	a3,a5,256
	beq	a0,a3,.L63
	li	a4,28672
	addi	a4,a4,768
	and	a0,a0,a4
	addi	a4,a5,512
	beq	a0,a4,.L52
	bgtu	a0,a4,.L53
	bne	a0,a5,.L64
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR1
	la a5, .LANCHOR0; lw a5, 0(a5);
	sw	ra,8(sp)
	sb	a1,1(s0)
	jalr	a5
	lb	a5,1(s0)
	blt	a5,zero,.L46
	la a4, scanline; lw a4, 0(a4);
	li	a5,127
	ble	a4,a5,.L65
.L46:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L63:
	li	a5,6
	beq	a1,a5,.L66
.L51:
	la a5, .LANCHOR1+3; sb a1, 0(a5);
	la a5, .LANCHOR0; lw a5, 0(a5);
	jr	a5
.L64:
	beq	a0,a3,.L51
	ret
.L53:
	addi	a5,a5,768
	bne	a0,a5,.L67
	la a5, .LANCHOR1+2; sb a1, 0(a5);
	ret
.L62:
	lla	a5,.LANCHOR4
	lbu	a4,0(a5)
	beq	a4,zero,.L48
	bne	a1,zero,.L48
	lla	a3,.LANCHOR5
	lbu	a4,0(a3)
	xori	a4,a4,1
	sb	a4,0(a3)
.L48:
	sb	a1,0(a5)
	ret
.L67:
	ret
.L52:
	la a5, .LANCHOR1; sb a1, 0(a5);
	la a5, .LANCHOR0; lw a5, 0(a5);
	jr	a5
.L66:
	li	a1,3
	li	a0,32768
	tail	_Z8setprg32jj
.L65:
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL6Write2jh, .-_ZL6Write2jh
	.section	.text._ZL6M163HBv,"ax",@progbits
	.align	2
	.type	_ZL6M163HBv, @function
_ZL6M163HBv:
	la a5, .LANCHOR1+1; lb a5, 0(a5);
	blt	a5,zero,.L76
	ret
.L76:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a5, scanline; lw a5, 0(a5);
	li	a4,239
	beq	a5,a4,.L77
	li	a4,127
	beq	a5,a4,.L78
	lw	ra,8(sp)
	addi	sp,sp,12
	jr	ra
.L77:
	li	a1,0
	li	a0,0
	call	_Z7setchr4jj
	li	a1,0
.L75:
	lw	ra,8(sp)
	li	a0,4096
	addi	sp,sp,12
	tail	_Z7setchr4jj
.L78:
	li	a1,1
	li	a0,0
	call	_Z7setchr4jj
	li	a1,1
	j	.L75
	.size	_ZL6M163HBv, .-_ZL6M163HBv
	.section	.rodata._Z14Mapper164_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z14Mapper164_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper164_InitP8CartInfo
	.hidden	_Z14Mapper164_InitP8CartInfo
	.type	_Z14Mapper164_InitP8CartInfo, @function
_Z14Mapper164_InitP8CartInfo:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	lla	a4,_ZL5Powerv
	sw	a4,0(a0)
	lla	a4,_ZL5Closev
	sw	a4,8(a0)
	lla	a4,_ZL4Syncv
	lla	s0,.LANCHOR3
	la a3, .LANCHOR0; sw a4, 0(a3);
	sw	a0,0(sp)
	li	a4,8192
	li	a0,8192
	sw	a4,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR2
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s0)
	lw	a0,0(s1)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	a5,0(sp)
	lw	a4,48(a5)
	beq	a4,zero,.L80
	lw	a3,0(s1)
	lw	a4,0(s0)
	sw	a3,12(a5)
	sw	a4,28(a5)
.L80:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR6
	addi	sp,sp,16
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper164_InitP8CartInfo, .-_Z14Mapper164_InitP8CartInfo
	.section	.text._Z14Mapper163_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper163_InitP8CartInfo
	.hidden	_Z14Mapper163_InitP8CartInfo
	.type	_Z14Mapper163_InitP8CartInfo, @function
_Z14Mapper163_InitP8CartInfo:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	lla	a4,_ZL6Power2v
	sw	a4,0(a0)
	lla	a4,_ZL5Closev
	sw	a4,8(a0)
	lla	a4,_ZL4Syncv
	la a3, .LANCHOR0; sw a4, 0(a3);
	lla	a4,_ZL6M163HBv
	lla	s0,.LANCHOR3
	la a3, GameHBIRQHook; sw a4, 0(a3);
	sw	a0,0(sp)
	li	a4,8192
	li	a0,8192
	sw	a4,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR2
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s0)
	lw	a0,0(s1)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	a5,0(sp)
	lw	a4,48(a5)
	beq	a4,zero,.L86
	lw	a3,0(s1)
	lw	a4,0(s0)
	sw	a3,12(a5)
	sw	a4,28(a5)
.L86:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR6
	addi	sp,sp,16
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper163_InitP8CartInfo, .-_Z14Mapper163_InitP8CartInfo
	.section	.text._Z13UNLFS304_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13UNLFS304_InitP8CartInfo
	.hidden	_Z13UNLFS304_InitP8CartInfo
	.type	_Z13UNLFS304_InitP8CartInfo, @function
_Z13UNLFS304_InitP8CartInfo:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	lla	a4,_ZL6Power3v
	sw	a4,0(a0)
	lla	a4,_ZL5Closev
	sw	a4,8(a0)
	lla	a4,_ZL5Sync3v
	lla	s0,.LANCHOR3
	la a3, .LANCHOR0; sw a4, 0(a3);
	sw	a0,0(sp)
	li	a4,8192
	li	a0,8192
	sw	a4,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR2
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s0)
	lw	a0,0(s1)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	a5,0(sp)
	lw	a4,48(a5)
	beq	a4,zero,.L92
	lw	a3,0(s1)
	lw	a4,0(s0)
	sw	a3,12(a5)
	sw	a4,28(a5)
.L92:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR6
	addi	sp,sp,16
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13UNLFS304_InitP8CartInfo, .-_Z13UNLFS304_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"STB"
	.align	2
.LC2:
	.string	"TRG"
	.align	2
.LC3:
	.string	"REGS"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR6,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL10laststrobe
	.word	1
	.word	.LC1
	.word	_ZL7trigger
	.word	1
	.word	.LC2
	.word	_ZL3reg
	.word	8
	.word	.LC3
	.word	0
	.zero	8
	.section	.sbss._ZL10laststrobe,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL10laststrobe, @object
	.size	_ZL10laststrobe, 1
_ZL10laststrobe:
	.zero	1
	.section	.sbss._ZL3reg,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 8
_ZL3reg:
	.zero	8
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL5WSync,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL5WSync, @object
	.size	_ZL5WSync, 4
_ZL5WSync:
	.zero	4
	.section	.sbss._ZL7trigger,"aw",@nobits
	.set	.LANCHOR5,. + 0
	.type	_ZL7trigger, @object
	.size	_ZL7trigger, 1
_ZL7trigger:
	.zero	1
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
