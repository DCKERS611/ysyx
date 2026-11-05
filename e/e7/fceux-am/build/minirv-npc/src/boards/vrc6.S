#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"vrc6.cpp"
	.option nopic
	.text
	.section	.text._ZL6VRC6SWjh,"ax",@progbits
	.align	2
	.type	_ZL6VRC6SWjh, @function
_ZL6VRC6SWjh:
	li	a5,61440
	addi	a5,a5,3
	and	a5,a0,a5
	li	a4,-36864
	add	a4,a5,a4
	li	a3,2
	bgtu	a4,a3,.L2
	lla	a5,.LANCHOR0
	andi	a0,a0,3
	add	a0,a5,a0
	sb	a1,0(a0)
	la a5, .LANCHOR1; lw a5, 0(a5);
	beq	a5,zero,.L1
.L13:
	jr	a5
.L2:
	li	a4,-40960
	add	a4,a5,a4
	bgtu	a4,a3,.L5
	andi	a0,a0,3
	ori	a0,a0,4
	lla	a5,.LANCHOR0
	add	a5,a5,a0
	sb	a1,0(a5)
	la a5, .LANCHOR1+4; lw a5, 0(a5);
	bne	a5,zero,.L13
.L1:
	ret
.L5:
	li	a4,-45056
	add	a5,a5,a4
	bgtu	a5,a3,.L1
	andi	a0,a0,3
	lla	a5,.LANCHOR2
	add	a5,a5,a0
	sb	a1,0(a5)
	la a5, .LANCHOR1+8; lw a5, 0(a5);
	bne	a5,zero,.L13
	j	.L1
	.size	_ZL6VRC6SWjh, .-_ZL6VRC6SWjh
	.section	.text._ZL6DoSQV1v,"ax",@progbits
	.align	2
	.type	_ZL6DoSQV1v, @function
_ZL6DoSQV1v:
	ret
	.size	_ZL6DoSQV1v, .-_ZL6DoSQV1v
	.section	.text._Z9VRC6Soundi,"ax",@progbits
	.align	2
	.globl	_Z9VRC6Soundi
	.hidden	_Z9VRC6Soundi
	.type	_Z9VRC6Soundi, @function
_Z9VRC6Soundi:
	lla	a5,.LANCHOR3
	sw	a0,0(a5)
	sw	a0,4(a5)
	sw	a0,8(a5)
	ret
	.size	_Z9VRC6Soundi, .-_Z9VRC6Soundi
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	la a5, .LANCHOR4; lbu a5, 0(a5);
	bne	a5,zero,.L29
.L18:
	lla	s0,.LANCHOR5
	lbu	a1,0(s0)
	li	a0,32768
	lla	s1,.LANCHOR6
	call	_Z8setprg16jj
	lbu	a1,1(s0)
	li	a0,49152
	li	s0,0
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
.L19:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	li	a5,8192
	addi	s1,s1,1
	bne	s0,a5,.L19
	la a5, .LANCHOR7; lbu a5, 0(a5);
	andi	a5,a5,3
	li	a4,2
	li	a0,2
	beq	a5,a4,.L28
	li	a4,3
	li	a0,3
	beq	a5,a4,.L28
	li	a4,1
	li	a0,1
	beq	a5,a4,.L30
.L28:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_Z9setmirrori
.L29:
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	j	.L18
.L30:
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
	.section	.text._ZL9VRC6Powerv,"ax",@progbits
	.align	2
	.type	_ZL9VRC6Powerv, @function
_ZL9VRC6Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_ZL4Syncv
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_ZL9VRC6Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR9; lw a0, 0(a0);
	la a2, .LANCHOR8; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL9VRC6Powerv, .-_ZL9VRC6Powerv
	.section	.text._ZL9VRC6Writejh,"ax",@progbits
	.align	2
	.type	_ZL9VRC6Writejh, @function
_ZL9VRC6Writejh:
	la a5, .LANCHOR4; lbu a5, 0(a5);
	beq	a5,zero,.L35
	srli	a5,a0,1
	slli	a3,a0,1
	li	a4,65536
	andi	a5,a5,1
	andi	a3,a3,2
	addi	a4,a4,-4
	and	a4,a0,a4
	or	a5,a5,a3
	or	a0,a4,a5
.L35:
	li	a4,-36864
	li	a5,8192
	add	a4,a0,a4
	addi	a5,a5,2
	bleu	a4,a5,.L62
	li	a5,61440
	addi	a4,a5,3
	and	a0,a0,a4
	li	a4,57344
	beq	a0,a4,.L37
	bgtu	a0,a4,.L38
	li	a5,53248
	beq	a0,a5,.L39
	bleu	a0,a5,.L63
	addi	a4,a5,2
	beq	a0,a4,.L45
	addi	a4,a5,3
	bne	a0,a4,.L64
	la a5, .LANCHOR6+3; sb a1, 0(a5);
	tail	_ZL4Syncv
.L38:
	beq	a0,a5,.L48
	bleu	a0,a5,.L65
	addi	a4,a5,1
	beq	a0,a4,.L53
	addi	a5,a5,2
	bne	a0,a5,.L66
	la a5, .LANCHOR12; lbu a5, 0(a5);
	li	a0,1
	la a4, .LANCHOR11; sb a5, 0(a4);
	tail	_Z12X6502_IRQEndi
.L65:
	addi	a5,a4,2
	beq	a0,a5,.L50
	addi	a5,a4,3
	bne	a0,a5,.L67
	la a5, .LANCHOR6+7; sb a1, 0(a5);
	tail	_ZL4Syncv
.L63:
	li	a5,45056
	addi	a5,a5,3
	beq	a0,a5,.L41
	li	a5,49152
	bne	a0,a5,.L68
	la a5, .LANCHOR5+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L64:
	addi	a5,a5,1
	bne	a0,a5,.L69
	la a5, .LANCHOR6+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L67:
	addi	a4,a4,1
	bne	a0,a4,.L70
	la a5, .LANCHOR6+5; sb a1, 0(a5);
	tail	_ZL4Syncv
.L68:
	li	a5,32768
	bne	a0,a5,.L71
	la a5, .LANCHOR5; sb a1, 0(a5);
	tail	_ZL4Syncv
.L62:
	tail	_ZL6VRC6SWjh
.L53:
	andi	a5,a1,2
	andi	a1,a1,1
	la a4, .LANCHOR11; sb a5, 0(a4);
	la a4, .LANCHOR12; sb a1, 0(a4);
	beq	a5,zero,.L55
	la a5, .LANCHOR10; lbu a5, 0(a5);
	la a4, .LANCHOR13; sw a5, 0(a4);
.L55:
	li	a0,1
	la a5, .LANCHOR14; sw zero, 0(a5);
	tail	_Z12X6502_IRQEndi
.L50:
	la a5, .LANCHOR6+6; sb a1, 0(a5);
	tail	_ZL4Syncv
.L41:
	srli	a1,a1,2
	andi	a1,a1,3
	la a5, .LANCHOR7; sb a1, 0(a5);
	tail	_ZL4Syncv
.L37:
	la a5, .LANCHOR6+4; sb a1, 0(a5);
	tail	_ZL4Syncv
.L48:
	li	a0,1
	la a5, .LANCHOR10; sb a1, 0(a5);
	tail	_Z12X6502_IRQEndi
.L39:
	la a5, .LANCHOR6; sb a1, 0(a5);
	tail	_ZL4Syncv
.L45:
	la a5, .LANCHOR6+2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L69:
	ret
.L66:
	ret
.L71:
	ret
.L70:
	ret
	.size	_ZL9VRC6Writejh, .-_ZL9VRC6Writejh
	.section	.text._ZL8VRC6_ESIv,"ax",@progbits
	.align	2
	.type	_ZL8VRC6_ESIv, @function
_ZL8VRC6_ESIv:
	addi	sp,sp,-12
	lla	a5,GameExpSound
	sw	ra,8(sp)
	lla	a4,_ZL8VRC6_ESIv
	sw	a4,16(a5)
	lla	a4,_Z9VRC6Soundi
	sw	a4,0(a5)
	lla	a4,_Z11VRC6SoundHQv
	sw	a4,8(a5)
	li	a2,12
	lla	a4,_Z10VRC6SyncHQi
	li	a1,0
	lla	a0,.LANCHOR3
	sw	a4,12(a5)
	call	memset
	li	a2,12
	li	a1,0
	lla	a0,.LANCHOR15
	call	memset
	li	a2,8
	li	a1,0
	lla	a0,.LANCHOR16
	call	memset
	lla	a5,FSettings
	lw	a4,60(a5)
	beq	a4,zero,.L73
	lw	a5,64(a5)
	ble	a5,zero,.L74
	lla	a5,.LANCHOR1
	lla	a4,_ZL8DoSQV1HQv
	sw	a4,0(a5)
	lla	a4,_ZL8DoSQV2HQv
	lw	ra,8(sp)
	sw	a4,4(a5)
	lla	a4,_ZL8DoSawVHQv
	sw	a4,8(a5)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR17
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
.L74:
	lla	a5,.LANCHOR1
	lla	a4,_ZL6DoSQV1v
	sw	a4,0(a5)
	lla	a4,_ZL6DoSQV2v
	lw	ra,8(sp)
	sw	a4,4(a5)
	lla	a4,_ZL6DoSawVv
	sw	a4,8(a5)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR17
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
.L73:
	li	a2,12
	li	a1,0
	lla	a0,.LANCHOR1
	call	memset
	lw	ra,8(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR17
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_ZL8VRC6_ESIv, .-_ZL8VRC6_ESIv
	.section	.text._ZL9VRC6Closev,"ax",@progbits
	.align	2
	.type	_ZL9VRC6Closev, @function
_ZL9VRC6Closev:
	la a0, .LANCHOR8; lw a0, 0(a0);
	beq	a0,zero,.L83
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR8; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L83:
	la a5, .LANCHOR8; sw zero, 0(a5);
	ret
	.size	_ZL9VRC6Closev, .-_ZL9VRC6Closev
	.section	.text._ZL11VRC6IRQHooki,"ax",@progbits
	.align	2
	.type	_ZL11VRC6IRQHooki, @function
_ZL11VRC6IRQHooki:
	la a5, .LANCHOR11; lbu a5, 0(a5);
	beq	a5,zero,.L98
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR14
	lw	a4,0(s0)
	slli	a5,a0,1
	add	a5,a5,a0
	add	a5,a5,a4
	sw	s1,0(sp)
	sw	ra,8(sp)
	sw	a5,0(s0)
	lla	s1,.LANCHOR13
.L89:
	lw	a4,0(s1)
	li	a3,0
	li	a2,340
	li	a1,256
.L90:
	ble	a5,a2,.L101
	addi	a4,a4,1
	addi	a5,a5,-341
	li	a3,1
	bne	a4,a1,.L90
	la a4, .LANCHOR10; lbu a4, 0(a4);
	li	a0,1
	sw	a5,0(s0)
	sw	a4,0(s1)
	call	_Z14X6502_IRQBegini
	lw	a5,0(s0)
	j	.L89
.L98:
	ret
.L101:
	beq	a3,zero,.L86
	sw	a4,0(s1)
	sw	a5,0(s0)
.L86:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL11VRC6IRQHooki, .-_ZL11VRC6IRQHooki
	.section	.text._Z11VRC6SoundHQv,"ax",@progbits
	.align	2
	.globl	_Z11VRC6SoundHQv
	.hidden	_Z11VRC6SoundHQv
	.type	_Z11VRC6SoundHQv, @function
_Z11VRC6SoundHQv:
	ret
	.size	_Z11VRC6SoundHQv, .-_Z11VRC6SoundHQv
	.section	.text._ZL6DoSQV2v,"ax",@progbits
	.align	2
	.type	_ZL6DoSQV2v, @function
_ZL6DoSQV2v:
	ret
	.size	_ZL6DoSQV2v, .-_ZL6DoSQV2v
	.section	.text._ZL6DoSawVv,"ax",@progbits
	.align	2
	.type	_ZL6DoSawVv, @function
_ZL6DoSawVv:
	ret
	.size	_ZL6DoSawVv, .-_ZL6DoSawVv
	.section	.text._ZL8DoSQV1HQv,"ax",@progbits
	.align	2
	.type	_ZL8DoSQV1HQv, @function
_ZL8DoSQV1HQv:
	ret
	.size	_ZL8DoSQV1HQv, .-_ZL8DoSQV1HQv
	.section	.text._ZL8DoSQV2HQv,"ax",@progbits
	.align	2
	.type	_ZL8DoSQV2HQv, @function
_ZL8DoSQV2HQv:
	ret
	.size	_ZL8DoSQV2HQv, .-_ZL8DoSQV2HQv
	.section	.text._ZL8DoSawVHQv,"ax",@progbits
	.align	2
	.type	_ZL8DoSawVHQv, @function
_ZL8DoSawVHQv:
	ret
	.size	_ZL8DoSawVHQv, .-_ZL8DoSawVHQv
	.section	.text._Z10VRC6SyncHQi,"ax",@progbits
	.align	2
	.globl	_Z10VRC6SyncHQi
	.hidden	_Z10VRC6SyncHQi
	.type	_Z10VRC6SyncHQi, @function
_Z10VRC6SyncHQi:
	lla	a5,.LANCHOR3
	sw	a0,0(a5)
	sw	a0,4(a5)
	sw	a0,8(a5)
	ret
	.size	_Z10VRC6SyncHQi, .-_Z10VRC6SyncHQi
	.section	.text._Z13Mapper24_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper24_InitP8CartInfo
	.hidden	_Z13Mapper24_InitP8CartInfo
	.type	_Z13Mapper24_InitP8CartInfo, @function
_Z13Mapper24_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,_ZL9VRC6Powerv
	sw	a5,0(a0)
	la a5, .LANCHOR4; sb zero, 0(a5);
	lla	a5,_ZL11VRC6IRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	call	_ZL8VRC6_ESIv
	lw	ra,8(sp)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR18
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper24_InitP8CartInfo, .-_Z13Mapper24_InitP8CartInfo
	.section	.rodata._Z13Mapper26_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z13Mapper26_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper26_InitP8CartInfo
	.hidden	_Z13Mapper26_InitP8CartInfo
	.type	_Z13Mapper26_InitP8CartInfo, @function
_Z13Mapper26_InitP8CartInfo:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	lla	a4,_ZL9VRC6Powerv
	sw	a4,0(a0)
	lla	a4,_ZL9VRC6Closev
	sw	a4,8(a0)
	li	a4,1
	la a3, .LANCHOR4; sb a4, 0(a3);
	lla	a4,_ZL11VRC6IRQHooki
	la a3, MapIRQHook; sw a4, 0(a3);
	sw	a0,0(sp)
	call	_ZL8VRC6_ESIv
	lla	a4,_ZL12StateRestorei
	lla	s0,.LANCHOR9
	la a3, GameStateRestore; sw a4, 0(a3);
	li	a0,8192
	li	a4,8192
	sw	a4,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR8
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
	beq	a4,zero,.L112
	lw	a3,0(s1)
	lw	a4,0(s0)
	sw	a3,12(a5)
	sw	a4,28(a5)
.L112:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR18
	addi	sp,sp,16
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper26_InitP8CartInfo, .-_Z13Mapper26_InitP8CartInfo
	.section	.text._Z12NSFVRC6_Initv,"ax",@progbits
	.align	2
	.globl	_Z12NSFVRC6_Initv
	.hidden	_Z12NSFVRC6_Initv
	.type	_Z12NSFVRC6_Initv, @function
_Z12NSFVRC6_Initv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_ZL8VRC6_ESIv
	lw	ra,8(sp)
	li	a1,49152
	lla	a2,_ZL6VRC6SWjh
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_Z12NSFVRC6_Initv, .-_Z12NSFVRC6_Initv
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"PSG1"
	.align	2
.LC2:
	.string	"PSG2"
	.align	2
.LC3:
	.string	"PRG"
	.align	2
.LC4:
	.string	"CHR"
	.align	2
.LC5:
	.string	"MIRR"
	.align	2
.LC6:
	.string	"IRQA"
	.align	2
.LC7:
	.string	"IRQD"
	.align	2
.LC8:
	.string	"IRQL"
	.align	2
.LC9:
	.string	"IRQC"
	.align	2
.LC10:
	.string	"CYCC"
	.section	.bss._ZL4cvbc,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL4cvbc, @object
	.size	_ZL4cvbc, 12
_ZL4cvbc:
	.zero	12
	.section	.bss._ZL4sfun,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL4sfun, @object
	.size	_ZL4sfun, 12
_ZL4sfun:
	.zero	12
	.section	.bss._ZL6vcount,"aw",@nobits
	.align	2
	.set	.LANCHOR15,. + 0
	.type	_ZL6vcount, @object
	.size	_ZL6vcount, 12
_ZL6vcount:
	.zero	12
	.section	.data._ZL10SStateRegs,"aw"
	.align	2
	.set	.LANCHOR17,. + 0
	.type	_ZL10SStateRegs, @object
	.size	_ZL10SStateRegs, 36
_ZL10SStateRegs:
	.word	_ZL5vpsg1
	.word	8
	.word	.LC1
	.word	_ZL5vpsg2
	.word	4
	.word	.LC2
	.word	0
	.zero	8
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR18,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 108
_ZL9StateRegs:
	.word	_ZL3prg
	.word	2
	.word	.LC3
	.word	_ZL3chr
	.word	8
	.word	.LC4
	.word	_ZL4mirr
	.word	1
	.word	.LC5
	.word	_ZL4IRQa
	.word	1
	.word	.LC6
	.word	_ZL4IRQd
	.word	1
	.word	.LC7
	.word	_ZL8IRQLatch
	.word	1
	.word	.LC8
	.word	_ZL8IRQCount
	.word	4
	.word	.LC9
	.word	_ZL10CycleCount
	.word	4
	.word	.LC10
	.word	0
	.zero	8
	.section	.sbss._ZL10CycleCount,"aw",@nobits
	.align	2
	.set	.LANCHOR14,. + 0
	.type	_ZL10CycleCount, @object
	.size	_ZL10CycleCount, 4
_ZL10CycleCount:
	.zero	4
	.section	.sbss._ZL3chr,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	_ZL3chr, @object
	.size	_ZL3chr, 8
_ZL3chr:
	.zero	8
	.section	.sbss._ZL3prg,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL3prg, @object
	.size	_ZL3prg, 2
_ZL3prg:
	.zero	2
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR11,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4IRQd,"aw",@nobits
	.set	.LANCHOR12,. + 0
	.type	_ZL4IRQd, @object
	.size	_ZL4IRQd, 1
_ZL4IRQd:
	.zero	1
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL4is26,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL4is26, @object
	.size	_ZL4is26, 1
_ZL4is26:
	.zero	1
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR7,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL5vpsg1,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL5vpsg1, @object
	.size	_ZL5vpsg1, 8
_ZL5vpsg1:
	.zero	8
	.section	.sbss._ZL5vpsg2,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL5vpsg2, @object
	.size	_ZL5vpsg2, 4
_ZL5vpsg2:
	.zero	4
	.section	.sbss._ZL6dcount,"aw",@nobits
	.align	2
	.set	.LANCHOR16,. + 0
	.type	_ZL6dcount, @object
	.size	_ZL6dcount, 8
_ZL6dcount:
	.zero	8
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.set	.LANCHOR13,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.set	.LANCHOR10,. + 0
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 1
_ZL8IRQLatch:
	.zero	1
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR9,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
