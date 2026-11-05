#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ines.cpp"
	.option nopic
	.text
	.section	.text._ZL11TrainerReadj,"ax",@progbits
	.align	2
	.type	_ZL11TrainerReadj, @function
_ZL11TrainerReadj:
	andi	a0,a0,511
	la a5, .LANCHOR0; lw a5, 0(a5);
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
	.size	_ZL11TrainerReadj, .-_ZL11TrainerReadj
	.section	.text._Z6iNESGI2GI,"ax",@progbits
	.align	2
	.globl	_Z6iNESGI2GI
	.hidden	_Z6iNESGI2GI
	.type	_Z6iNESGI2GI, @function
_Z6iNESGI2GI:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	li	a5,2
	beq	a0,a5,.L4
	li	a5,3
	beq	a0,a5,.L5
	li	a5,1
	beq	a0,a5,.L40
.L3:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L4:
	la a1, .LANCHOR2; lw a1, 0(a1);
	li	a5,-1
	bne	a1,a5,.L41
	la a5, .LANCHOR1; lw a5, 0(a5);
	beq	a5,zero,.L9
.L42:
	jalr	a5
.L9:
	lla	s0,.LANCHOR0
	lw	a4,0(s0)
	beq	a4,zero,.L3
	li	s1,0
	j	.L12
.L11:
	beq	s1,a2,.L3
.L12:
	add	a4,a4,s1
	lbu	a1,0(a4)
	li	a5,28672
	add	a0,s1,a5
	sw	a0,0(sp)
	call	_Z9X6502_DMWjh
	lw	a0,0(sp)
	call	_Z9X6502_DMRj
	lw	a4,0(s0)
	li	a2,512
	add	a3,a4,s1
	lbu	a3,0(a3)
	addi	s1,s1,1
	beq	a3,a0,.L11
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	li	a5,28672
	lla	a2,_ZL11TrainerReadj
	addi	a1,a5,511
	li	a0,28672
	addi	sp,sp,16
	tail	_Z14SetReadHandleriiPFhjE
.L40:
	la a5, .LANCHOR1+4; lw a5, 0(a5);
	beq	a5,zero,.L3
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	a5
.L5:
	la a5, .LANCHOR1+8; lw a5, 0(a5);
	beq	a5,zero,.L13
	jalr	a5
.L13:
	la a0, .LANCHOR4; lw a0, 0(a0);
	beq	a0,zero,.L14
	call	free
	la a5, .LANCHOR4; sw zero, 0(a5);
.L14:
	la a0, .LANCHOR3; lw a0, 0(a0);
	beq	a0,zero,.L15
	call	free
	la a5, .LANCHOR3; sw zero, 0(a5);
.L15:
	la a0, .LANCHOR0; lw a0, 0(a0);
	beq	a0,zero,.L16
	call	free
	la a5, .LANCHOR0; sw zero, 0(a5);
.L16:
	la a0, .LANCHOR5; lw a0, 0(a0);
	beq	a0,zero,.L3
	call	free
	lw	ra,12(sp)
	lw	s0,8(sp)
	la a5, .LANCHOR5; sw zero, 0(a5);
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L41:
	li	a2,0
	la a0, .LANCHOR3; lw a0, 0(a0);
	call	_Z15FCEU_MemoryRandPhjb
	la a5, .LANCHOR1; lw a5, 0(a5);
	bne	a5,zero,.L42
	j	.L9
	.size	_Z6iNESGI2GI, .-_Z6iNESGI2GI
	.section	.rodata._Z8CheckBady.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"Ai Sensei no Oshiete"
	.align	2
.LC2:
	.string	"The copy game you have loaded, \"%s\", is bad, and will not work properly in FCEUX."
	.section	.text._Z8CheckBady,"ax",@progbits
	.align	2
	.globl	_Z8CheckBady
	.hidden	_Z8CheckBady
	.type	_Z8CheckBady, @function
_Z8CheckBady:
	lla	a5,.LC0
	lw	a4,0(a5)
	lw	a3,4(a5)
	mv	a2,a1
	lla	a5,.LANCHOR6+16
	lla	a1,.LC1
	beq	a4,a0,.L47
.L44:
	lw	a1,8(a5)
	beq	a1,zero,.L43
	lw	a4,0(a5)
	lw	a3,4(a5)
	addi	a5,a5,16
	bne	a4,a0,.L44
.L47:
	bne	a3,a2,.L44
	lla	a0,.LC2
	tail	printf
.L43:
	ret
	.size	_Z8CheckBady, .-_Z8CheckBady
	.section	.rodata._Z8iNESLoadPKcP8FCEUFILEi.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"Not Listed"
	.align	2
.LC4:
	.string	"Horizontal"
	.align	2
.LC5:
	.string	"None (Four-screen)"
	.align	2
.LC6:
	.string	"Vertical"
	.align	2
.LC7:
	.string	"Yes"
	.align	2
.LC8:
	.string	"No"
	.align	2
.LC12:
	.string	"NES\032"
	.align	2
.LC13:
	.string	"DiskDude"
	.align	2
.LC14:
	.string	"demiforce"
	.align	2
.LC15:
	.string	"Ni03"
	.align	2
.LC16:
	.string	"Dis"
	.align	2
.LC17:
	.string	" PRG ROM:  %3d x 16KiB\n"
	.align	2
.LC18:
	.string	" CHR ROM:  %3d x  8KiB\n"
	.align	2
.LC19:
	.string	" ROM MD5:  0x"
	.align	2
.LC20:
	.string	"%02x"
	.align	2
.LC21:
	.string	"\n"
	.align	2
.LC22:
	.string	" Mapper #:  %d\n"
	.align	2
.LC23:
	.string	" Mapper name: %s\n"
	.align	2
.LC24:
	.string	" Mirroring: %s\n"
	.align	2
.LC25:
	.string	" Battery-backed: %s\n"
	.align	2
.LC26:
	.string	" Trained: %s\n"
	.align	2
.LC27:
	.string	" NES2.0 Extensions\n"
	.align	2
.LC28:
	.string	" Sub Mapper #: %d\n"
	.align	2
.LC29:
	.string	" Total WRAM size: %d\n"
	.align	2
.LC30:
	.string	" Total VRAM size: %d\n"
	.align	2
.LC31:
	.string	" WRAM backed by battery: %d\n"
	.align	2
.LC32:
	.string	" VRAM backed by battery: %d\n"
	.align	2
.LC33:
	.string	"The iNES header contains incorrect information.  For now, the information will be corrected in RAM.  "
	.align	2
.LC34:
	.string	"The mapper number should be set to %d.  "
	.align	2
.LC35:
	.string	"Four-screen"
	.align	2
.LC36:
	.string	"Mirroring should be set to \"%s\".  "
	.align	2
.LC37:
	.string	"The battery-backed bit should be set.  "
	.align	2
.LC38:
	.string	"This game should not have any CHR ROM.  "
	.align	2
.LC39:
	.string	"%s"
	.align	2
.LC40:
	.string	"CHRR"
	.align	2
.LC41:
	.string	"EXNR"
	.align	2
.LC42:
	.string	"iNES mapper #%d is not supported at all."
	.section	.text._Z8iNESLoadPKcP8FCEUFILEi,"ax",@progbits
	.align	2
	.globl	_Z8iNESLoadPKcP8FCEUFILEi
	.hidden	_Z8iNESLoadPKcP8FCEUFILEi
	.type	_Z8iNESLoadPKcP8FCEUFILEi, @function
_Z8iNESLoadPKcP8FCEUFILEi:
	addi	sp,sp,-912
	mv	a5,a2
	mv	a4,a0
	sw	s0,904(sp)
	mv	a3,a1
	mv	s0,a1
	li	a2,16
	li	a1,1
	lla	a0,.LANCHOR7
	sw	a5,8(sp)
	sw	ra,908(sp)
	sw	s1,900(sp)
	sw	a4,4(sp)
	call	_Z10FCEU_freadPvjjP8FCEUFILE
	li	a5,16
	beq	a0,a5,.L258
.L52:
	sw	zero,0(sp)
.L48:
	lw	ra,908(sp)
	lw	s0,904(sp)
	lw	a0,0(sp)
	lw	s1,900(sp)
	addi	sp,sp,912
	jr	ra
.L258:
	bne	a1,zero,.L52
	li	a2,4
	lla	a1,.LC12
	lla	a0,.LANCHOR7
	call	memcmp
	sw	a0,0(sp)
	bne	a0,zero,.L52
	li	a2,8
	lla	a1,.LC13
	lla	a0,.LANCHOR7+7
	call	memcmp
	beq	a0,zero,.L55
	li	a2,9
	lla	a1,.LC14
	lla	a0,.LANCHOR7+7
	call	memcmp
	beq	a0,zero,.L55
.L54:
	li	a2,4
	lla	a1,.LC15
	lla	a0,.LANCHOR7+10
	call	memcmp
	beq	a0,zero,.L259
.L56:
	li	a2,96
	li	a1,0
	lla	a0,.LANCHOR1
	call	memset
	lla	a1,.LANCHOR7
	lbu	a5,7(a1)
	lla	a0,.LANCHOR8
	li	a2,8
	andi	a3,a5,12
	addi	a4,a3,-8
	seqz	a4,a4
	sw	a4,0(a0)
	bne	a3,a2,.L58
	lbu	a4,10(a1)
	li	a3,1
	lla	a2,.LANCHOR1
	sw	a3,52(a2)
	andi	a2,a4,15
	li	a3,0
	beq	a2,zero,.L59
	li	a3,64
	sll	a3,a3,a2
.L59:
	lla	a2,.LANCHOR1
	sw	a3,60(a2)
	andi	a3,a4,240
	li	a2,0
	beq	a3,zero,.L60
	srli	a4,a4,4
	li	a2,64
	sll	a2,a2,a4
.L60:
	lla	a4,.LANCHOR7
	lbu	a4,11(a4)
	lla	a3,.LANCHOR1
	sw	a2,64(a3)
	andi	a2,a4,15
	li	a3,0
	beq	a2,zero,.L61
	li	a3,64
	sll	a3,a3,a2
.L61:
	lla	a2,.LANCHOR1
	sw	a3,68(a2)
	andi	a3,a4,240
	li	a1,0
	beq	a3,zero,.L62
	srli	a4,a4,4
	li	a1,64
	sll	a1,a1,a4
.L62:
	lla	t1,.LANCHOR7
	lbu	a3,6(t1)
	lbu	a4,8(t1)
	andi	a0,a5,-16
	srli	a5,a3,4
	or	a5,a5,a0
	li	a0,4096
	slli	a2,a4,8
	addi	a0,a0,-256
	and	a2,a2,a0
	or	a5,a5,a2
	lla	a0,.LANCHOR9
	lla	a2,.LANCHOR1
	srli	a4,a4,4
	sw	a1,72(a2)
	sw	a4,56(a2)
	sw	a5,0(a0)
	sw	a0,12(sp)
	andi	a5,a3,8
	lbu	a2,4(t1)
	beq	a5,zero,.L260
	lla	a5,.LANCHOR12
	mv	a4,a5
	sw	a5,16(sp)
	li	a5,2
	sb	a5,0(a4)
	j	.L151
.L55:
	li	a2,9
	li	a1,0
	lla	a0,.LANCHOR7+7
	call	memset
	j	.L54
.L58:
	lla	a2,.LANCHOR7
	lbu	a4,6(a2)
	andi	a5,a5,-16
	lla	a1,.LANCHOR9
	srli	a3,a4,4
	or	a5,a3,a5
	sw	a5,0(a1)
	sw	a1,12(sp)
	andi	a3,a4,8
	lbu	a5,4(a2)
	beq	a3,zero,.L261
	lla	a4,.LANCHOR12
	mv	a3,a4
	sw	a4,16(sp)
	li	a4,2
	sw	a5,20(sp)
	sb	a4,0(a3)
.L150:
	bne	a5,zero,.L65
	lla	a5,.LANCHOR7
	lbu	a0,5(a5)
	lla	s1,.LANCHOR10
	li	a5,256
	sw	a5,0(s1)
	sw	zero,20(sp)
.L66:
	call	_Z6uppow2j
	lw	a5,12(sp)
	lla	a4,.LANCHOR11
	sw	a0,0(a4)
	lw	a5,0(a5)
	li	a4,53
	beq	a5,a4,.L160
	li	a4,198
	beq	a5,a4,.L160
	li	a4,228
	beq	a5,a4,.L160
	addi	a5,a5,-547
	snez	a5,a5
	sw	a5,24(sp)
.L67:
	lw	a0,0(s1)
	slli	a0,a0,14
	call	_Z11FCEU_mallocj
	lla	a4,.LANCHOR4
	sw	a0,0(a4)
	beq	a0,zero,.L52
	lw	a2,0(s1)
	li	a1,255
	slli	a2,a2,14
	call	memset
	lla	a5,.LANCHOR11
	lw	a0,0(a5)
	bne	a0,zero,.L262
.L68:
	lla	a5,.LANCHOR7
	lbu	a5,6(a5)
	andi	a5,a5,4
	bne	a5,zero,.L263
.L70:
	call	_Z16ResetCartMappingv
	lla	a5,.LANCHOR4
	lw	a2,0(s1)
	lw	a1,0(a5)
	li	a0,0
	slli	a2,a2,14
	li	a3,0
	call	_Z19SetupCartPRGMappingiPhji
	lla	a5,.LANCHOR4
	lw	a0,0(a5)
	lw	a5,24(sp)
	lw	a2,20(sp)
	beq	a5,zero,.L72
	lw	a2,0(s1)
.L72:
	mv	a3,s0
	li	a1,16384
	call	_Z10FCEU_freadPvjjP8FCEUFILE
	lla	a5,.LANCHOR11
	lw	a2,0(a5)
	bne	a2,zero,.L264
.L73:
	addi	a0,sp,44
	call	_Z10md5_startsP11md5_context
	lla	a5,.LANCHOR4
	lw	a2,0(s1)
	lw	a1,0(a5)
	addi	a0,sp,44
	slli	a2,a2,14
	call	_Z10md5_updateP11md5_contextPhj
	lla	a5,.LANCHOR11
	lw	a2,0(a5)
	bne	a2,zero,.L265
.L74:
	lla	a1,.LANCHOR1+76
	addi	a0,sp,44
	call	_Z10md5_finishP11md5_contextPh
	lla	a5,GameInfo
	lw	a0,0(a5)
	lla	a1,.LANCHOR1+76
	li	a2,16
	addi	a0,a0,32
	call	memcpy
	lw	a5,24(sp)
	lw	a1,20(sp)
	beq	a5,zero,.L76
	lw	a1,0(s1)
.L76:
	lla	a0,.LC17
	call	printf
	lla	a5,.LANCHOR7
	lbu	a1,5(a5)
	lla	a0,.LC18
	lla	s1,.LANCHOR1+76
	call	printf
	lla	a0,.LC19
	call	printf
	lla	s0,.LC20
.L77:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s1,s1,1
	call	printf
	lla	a5,.LANCHOR1+92
	bne	s1,a5,.L77
	lla	a0,.LC21
	call	printf
	lw	a5,12(sp)
	li	a4,0
	li	a2,224
	lw	a1,0(a5)
	lla	a5,bmap+4
	j	.L80
.L78:
	addi	a4,a4,1
	beq	a4,a2,.L266
.L80:
	lw	a3,0(a5)
	addi	a5,a5,12
	bne	a3,a1,.L78
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,2
	lla	a4,bmap
	add	a5,a4,a5
	lw	s0,0(a5)
	sw	a4,20(sp)
.L79:
	lla	a0,.LC22
	call	printf
	mv	a1,s0
	lla	a0,.LC23
	call	printf
	lw	a5,16(sp)
	li	a4,2
	lla	a1,.LC5
	lbu	a5,0(a5)
	beq	a5,a4,.L81
	lla	a1,.LC6
	bne	a5,zero,.L81
	lla	a1,.LC4
.L81:
	lla	a0,.LC24
	call	printf
	lla	a5,.LANCHOR7
	lbu	a5,6(a5)
	lla	a1,.LC7
	andi	a5,a5,2
	bne	a5,zero,.L82
	lla	a1,.LC8
.L82:
	lla	a0,.LC25
	call	printf
	lla	a5,.LANCHOR7
	lbu	a5,6(a5)
	lla	a1,.LC7
	andi	a5,a5,4
	bne	a5,zero,.L83
	lla	a1,.LC8
.L83:
	lla	a0,.LC26
	call	printf
	lla	a5,.LANCHOR8
	lw	a5,0(a5)
	bne	a5,zero,.L267
.L85:
	lla	a5,.LANCHOR13
	lla	a0,.LANCHOR14
	lw	a4,0(a5)
	li	a3,0
	mv	a5,a0
	li	a2,1
.L220:
	lw	a1,0(a5)
	addi	a5,a5,16
	beq	a1,a4,.L268
	lw	a2,4(a5)
	addi	a3,a3,1
	bge	a2,zero,.L220
	lw	a1,8(a5)
	bge	a1,zero,.L220
	lw	a1,12(a5)
	bge	a1,zero,.L220
.L88:
	lla	a3,.LANCHOR1+91
	li	a5,0
	li	a0,0
	li	a1,0
	li	t0,31
	li	t1,64
	j	.L92
.L270:
	li	s1,0
	sll	s0,a2,t2
	or	s1,a0,s1
	or	s0,a1,s0
	addi	a5,a5,8
	mv	a0,s1
	mv	a1,s0
	addi	a3,a3,-1
	beq	a5,t1,.L269
.L92:
	addi	t2,a5,-32
	lbu	a2,0(a3)
	sub	ra,t0,a5
	bge	t2,zero,.L270
	srli	t2,a2,1
	sll	s1,a2,a5
	srl	s0,t2,ra
	or	s1,a0,s1
	or	s0,a1,s0
	addi	a5,a5,8
	mv	a0,s1
	mv	a1,s0
	addi	a3,a3,-1
	bne	a5,t1,.L92
.L269:
	lla	a5,.LC0
	lw	a3,0(a5)
	lw	a2,4(a5)
	lla	a1,.LC1
	lla	a5,.LANCHOR6+16
.L95:
	beq	s1,a3,.L271
.L93:
	lw	a1,8(a5)
	beq	a1,zero,.L94
	lw	a3,0(a5)
	lw	a2,4(a5)
	addi	a5,a5,16
	j	.L95
.L259:
	li	a2,3
	lla	a1,.LC16
	lla	a0,.LANCHOR7+7
	call	memcmp
	bne	a0,zero,.L57
	li	a2,9
	li	a1,0
	lla	a0,.LANCHOR7+7
	call	memset
	j	.L56
.L261:
	lla	a3,.LANCHOR12
	andi	a4,a4,1
	sw	a3,16(sp)
	sb	a4,0(a3)
	sw	a5,20(sp)
	j	.L150
.L260:
	lla	a5,.LANCHOR12
	andi	a3,a3,1
	sw	a5,16(sp)
	sb	a3,0(a5)
.L151:
	lla	a5,.LANCHOR7
	lbu	a5,9(a5)
	li	a4,4096
	addi	a4,a4,-256
	slli	a5,a5,8
	and	a5,a5,a4
	or	a5,a5,a2
	sw	a5,20(sp)
.L65:
	lw	a0,20(sp)
	lla	s1,.LANCHOR10
	call	_Z6uppow2j
	lla	a5,.LANCHOR8
	lw	a5,0(a5)
	sw	a0,0(s1)
	lla	a4,.LANCHOR7
	lbu	a0,5(a4)
	beq	a5,zero,.L66
	lbu	a5,9(a4)
	li	a4,4096
	addi	a4,a4,-256
	slli	a5,a5,4
	and	a5,a5,a4
	or	a0,a0,a5
	j	.L66
.L57:
	li	a2,6
	li	a1,0
	lla	a0,.LANCHOR7+10
	call	memset
	j	.L56
.L271:
	bne	s0,a2,.L93
	lla	a0,.LC2
	call	printf
	lla	a5,.LANCHOR13
	lw	a4,0(a5)
.L94:
	lla	a5,.LC9
	lw	t1,0(a5)
	lw	a1,4(a5)
	lla	a3,.LANCHOR16
	la a5, .LANCHOR15; sw zero, 0(a5);
	mv	a2,a3
	li	a5,0
	li	a0,9
.L99:
	bne	s1,t1,.L177
	beq	s0,a1,.L250
.L177:
	addi	a5,a5,1
	addi	a2,a2,16
	beq	a5,a0,.L98
	lw	t1,0(a2)
	lw	a1,4(a2)
	j	.L99
.L250:
	slli	a5,a5,4
	add	a3,a3,a5
	la a5, .LANCHOR15; sw a3, 0(a5);
.L98:
	li	a5,-1352826880
	addi	a5,a5,-1374
	beq	a4,a5,.L165
	lla	a5,_ZZL10CheckHInfovE3moo+16
	li	a3,0
	li	a2,1
	j	.L101
.L110:
	lw	a2,0(a5)
	addi	a5,a5,16
	beq	a2,a4,.L272
	lw	a2,8(a5)
.L101:
	addi	a3,a3,1
	bge	a2,zero,.L110
	lw	a2,4(a5)
	bge	a2,zero,.L110
	lw	a5,12(sp)
	lw	ra,0(a5)
.L107:
	lla	a5,.LC11
	lla	a4,.LC10
	lla	a3,.LANCHOR7
	lbu	t0,6(a3)
	lw	a2,0(a5)
	lw	a3,0(a4)
	lw	a4,4(a4)
	lw	t1,4(a5)
	li	t2,0
	lla	a5,.LANCHOR17+16
	or	a1,a3,a4
	beq	s1,a2,.L273
.L111:
	beq	a1,zero,.L274
	lw	a1,4(a5)
	lw	a0,0(a5)
	mv	a2,a3
	mv	t1,a4
	mv	a3,a0
	mv	a4,a1
	addi	a5,a5,8
	or	a1,a3,a4
	bne	s1,a2,.L111
.L273:
	bne	s0,t1,.L111
	andi	a2,t0,2
	bne	a2,zero,.L111
	lw	a2,0(sp)
	ori	t0,t0,2
	li	t2,1
	ori	a2,a2,4
	sw	a2,0(sp)
	j	.L111
.L274:
	beq	t2,zero,.L115
	lla	a5,.LANCHOR7
	sb	t0,6(a5)
.L115:
	li	a5,118
	beq	ra,a5,.L116
	li	a5,24
	beq	ra,a5,.L116
	li	a5,26
	beq	ra,a5,.L275
	li	a5,99
	bne	ra,a5,.L121
.L119:
	lw	a4,16(sp)
	li	a5,2
	sb	a5,0(a4)
.L121:
	lw	a5,0(sp)
	bne	a5,zero,.L276
.L122:
	lla	a5,.LANCHOR11
	lw	a2,0(a5)
	bne	a2,zero,.L277
.L127:
	lw	a5,16(sp)
	lbu	a1,0(a5)
	li	a5,2
	beq	a1,a5,.L278
	li	a5,15
	andi	a0,a1,1
	bleu	a1,a5,.L130
	li	a2,0
	li	a1,1
	addi	a0,a0,2
	call	_Z18SetupCartMirroringiiPh
.L129:
	lla	a5,.LANCHOR7
	lbu	a4,6(a5)
	lw	a5,16(sp)
	lla	a1,.LANCHOR1
	lla	s1,.LANCHOR2
	lbu	a2,0(a5)
	lw	a5,20(sp)
	sw	a2,44(a1)
	lw	a3,8(a5)
	srai	a5,a4,1
	andi	a5,a5,1
	sw	a5,48(a1)
	li	a5,-1
	sw	a5,0(s1)
	lw	a5,12(sp)
	lw	a1,0(a5)
	beq	a3,zero,.L131
	lla	s0,bmap
	j	.L143
.L132:
	lw	a5,20(s0)
	addi	s0,s0,12
	beq	a5,zero,.L131
.L143:
	lw	a5,4(s0)
	bne	a1,a5,.L132
	lla	a5,.LANCHOR11
	lw	a5,0(a5)
	la a3, UNIFchrrama; sw zero, 0(a3);
	bne	a5,zero,.L133
	lla	a5,.LANCHOR1
	lw	a5,52(a5)
	bne	a5,zero,.L134
	li	a5,45
	beq	a1,a5,.L173
	bgt	a1,a5,.L136
	li	a5,13
	bne	a1,a5,.L279
	li	a0,16384
	li	a5,16384
.L135:
	lla	a4,.LANCHOR1
	sw	a5,0(s1)
	sw	a5,68(a4)
.L138:
	call	_Z12FCEU_dmallocj
	lla	a4,.LANCHOR3
	sw	a0,0(a4)
	beq	a0,zero,.L280
	lw	a1,0(s1)
	li	a2,0
	call	_Z15FCEU_MemoryRandPhjb
	lla	a4,.LANCHOR3
	lw	a1,0(a4)
	lw	a2,0(s1)
	la a5, UNIFchrrama; sw a1, 0(a5);
	bne	a2,zero,.L140
.L257:
	lla	a5,.LANCHOR7
	lbu	a4,6(a5)
.L133:
	andi	a4,a4,8
	bne	a4,zero,.L281
.L141:
	lw	a5,8(s0)
	lla	a0,.LANCHOR1
	jalr	a5
.L142:
	lw	a4,12(sp)
	lla	a5,GameInfo
	lw	a5,0(a5)
	lw	a4,0(a4)
	lw	a1,4(sp)
	lla	a0,LoadedRomFName
	sw	a4,4(a5)
	call	strcpy
	lla	a5,_Z6iNESGI2GI
	lla	a0,.LC21
	la a4, GameInterface; sw a5, 0(a4);
	call	printf
	lla	a5,.LANCHOR8
	lw	a5,0(a5)
	beq	a5,zero,.L144
	lla	a5,.LANCHOR7
	lbu	a0,12(a5)
	li	a5,1
	sw	a5,0(sp)
	andi	a0,a0,3
	addi	a0,a0,-1
	seqz	a0,a0
	call	_Z18FCEUI_SetVidSystemi
	j	.L48
.L268:
	slli	a3,a3,4
	add	a0,a0,a3
	lla	a5,GameInfo
	lw	a5,0(a5)
	lw	a1,8(a0)
	lw	a3,12(a0)
	sw	a2,16(a5)
	sw	a1,20(a5)
	sw	a3,24(a5)
	j	.L88
.L272:
	lla	a5,_ZZL10CheckHInfovE3moo
	slli	a3,a3,4
	add	a4,a5,a3
	lw	a2,4(a4)
	blt	a2,zero,.L100
	li	a4,4096
	addi	a4,a4,-2048
	and	a4,a2,a4
	beq	a4,zero,.L105
	lla	a4,.LANCHOR11
	lw	a1,0(a4)
	li	a4,0
	bne	a1,zero,.L282
.L105:
	li	a1,4096
	and	a0,a2,a1
	addi	a1,a1,-1
	bne	a0,zero,.L106
	li	a1,255
.L106:
	lw	t1,12(sp)
	and	ra,a1,a2
	sw	a4,0(sp)
	lw	a0,0(t1)
	beq	ra,a0,.L104
	ori	a4,a4,1
	sw	a4,0(sp)
	sw	ra,0(t1)
.L104:
	add	a5,a5,a3
	lw	a5,8(a5)
	blt	a5,zero,.L107
	lw	a4,16(sp)
	li	a3,8
	lbu	a4,0(a4)
	beq	a5,a3,.L283
	beq	a5,a4,.L107
	andi	a3,a5,-5
	beq	a4,a3,.L109
	li	a4,2
	bgt	a3,a4,.L109
	lw	a4,0(sp)
	ori	a4,a4,2
	sw	a4,0(sp)
.L109:
	lw	a4,16(sp)
	sb	a5,0(a4)
	j	.L107
.L116:
	lw	a5,16(sp)
	lbu	a4,0(a5)
	li	a5,2
	bne	a4,a5,.L121
	lw	a4,0(sp)
	la a5, .LANCHOR12; sb zero, 0(a5);
	li	a5,99
	ori	a4,a4,2
	sw	a4,0(sp)
	beq	ra,a5,.L119
.L120:
	addi	s0,sp,132
	lla	a1,.LC33
	mv	a0,s0
	call	strcpy
	lw	a5,0(sp)
	andi	a5,a5,1
	bne	a5,zero,.L284
.L153:
	lla	a5,.LC4
	sw	a5,32(sp)
	lla	a5,.LC6
	sw	a5,36(sp)
	mv	a0,s0
	lla	a5,.LC35
	sw	a5,40(sp)
	call	strlen
	lw	a5,16(sp)
	addi	a4,sp,32
	lla	a1,.LC36
	lbu	a5,0(a5)
	add	a0,s0,a0
	andi	a5,a5,3
	slli	a5,a5,2
	addi	a5,a5,868
	add	a5,a5,a4
	lw	a2,-868(a5)
	call	sprintf
.L124:
	lw	a5,0(sp)
	andi	a5,a5,4
	bne	a5,zero,.L285
.L125:
	lw	a5,0(sp)
	andi	a5,a5,8
	bne	a5,zero,.L286
.L126:
	lla	a1,.LC21
	mv	a0,s0
	call	strcat
	mv	a1,s0
	lla	a0,.LC39
	call	printf
	j	.L122
.L144:
	li	a5,1
	sw	a5,0(sp)
	lw	a5,8(sp)
	beq	a5,zero,.L48
	li	a0,0
	call	_Z18FCEUI_SetVidSystemi
	j	.L48
.L130:
	srli	a1,a1,2
	li	a2,0
	andi	a1,a1,1
	call	_Z18SetupCartMirroringiiPh
	j	.L129
.L262:
	slli	a0,a0,13
	call	_Z11FCEU_mallocj
	la a4, .LANCHOR3; sw a0, 0(a4);
	beq	a0,zero,.L287
	lla	a5,.LANCHOR11
	lw	a2,0(a5)
	li	a1,255
	slli	a2,a2,13
	call	memset
	j	.L68
.L280:
	lw	a5,12(sp)
	lw	a1,0(a5)
.L131:
	lla	a0,.LC42
	call	printf
	j	.L142
.L264:
	mv	a3,s0
	li	a1,8192
	la a0, .LANCHOR3; lw a0, 0(a0);
	call	_Z10FCEU_freadPvjjP8FCEUFILE
	j	.L73
.L263:
	li	a0,512
	call	_Z12FCEU_gmallocj
	mv	a3,s0
	li	a2,1
	li	a1,512
	la a4, .LANCHOR0; sw a0, 0(a4);
	call	_Z10FCEU_freadPvjjP8FCEUFILE
	j	.L70
.L265:
	slli	a2,a2,13
	la a1, .LANCHOR3; lw a1, 0(a1);
	addi	a0,sp,44
	call	_Z10md5_updateP11md5_contextPhj
	j	.L74
.L277:
	li	a3,0
	slli	a2,a2,13
	la a1, .LANCHOR3; lw a1, 0(a1);
	li	a0,0
	call	_Z19SetupCartCHRMappingiPhji
	j	.L127
.L267:
	lla	a0,.LC27
	lla	s0,.LANCHOR1
	call	printf
	lw	a1,56(s0)
	lla	a0,.LC28
	call	printf
	lw	a5,64(s0)
	lw	a1,60(s0)
	lla	a0,.LC29
	add	a1,a1,a5
	call	printf
	lw	a5,72(s0)
	lw	a1,68(s0)
	lla	a0,.LC30
	add	a1,a1,a5
	call	printf
	lla	a5,.LANCHOR7
	lbu	a5,6(a5)
	andi	a5,a5,2
	beq	a5,zero,.L85
	lw	a1,64(s0)
	lla	a0,.LC31
	call	printf
	lw	a1,72(s0)
	lla	a0,.LC32
	call	printf
	j	.L85
.L165:
	lla	a5,_ZZL10CheckHInfovE3moo
	li	a3,0
.L100:
	lw	a4,12(sp)
	lw	ra,0(a4)
	j	.L104
.L160:
	sw	zero,24(sp)
	j	.L67
.L278:
	li	a0,4096
	addi	a0,a0,-2048
	call	_Z12FCEU_gmallocj
	mv	a5,a0
	mv	a2,a0
	li	a1,1
	li	a0,4
	la a4, .LANCHOR5; sw a5, 0(a4);
	call	_Z18SetupCartMirroringiiPh
	j	.L129
.L288:
	li	a5,6
	bne	a1,a5,.L172
.L173:
	li	a0,32768
	li	a5,32768
	j	.L135
.L276:
	addi	s0,sp,132
	lla	a1,.LC33
	mv	a0,s0
	call	strcpy
	lw	a4,0(sp)
	andi	a5,a4,1
	andi	s1,a4,2
	bne	a5,zero,.L152
	beq	s1,zero,.L124
	j	.L153
.L284:
	li	s1,2
.L152:
	mv	a0,s0
	call	strlen
	lw	a5,12(sp)
	lla	a1,.LC34
	add	a0,s0,a0
	lw	a2,0(a5)
	call	sprintf
	beq	s1,zero,.L124
	j	.L153
.L134:
	lla	a5,.LANCHOR1
	lw	a0,72(a5)
	lw	a5,68(a5)
	add	a0,a0,a5
	sw	a0,0(s1)
	j	.L138
.L279:
	ble	a1,a5,.L288
	addi	a1,a1,-29
	li	a5,1
	bleu	a1,a5,.L173
.L172:
	li	a0,8192
	li	a5,8192
	j	.L135
.L136:
	li	a5,96
	beq	a1,a5,.L173
	li	a4,176
	li	a0,131072
	li	a5,131072
	beq	a1,a4,.L135
	j	.L172
.L266:
	lla	a5,bmap
	lla	s0,.LC3
	sw	a5,20(sp)
	j	.L79
.L275:
	lw	a5,16(sp)
	lbu	a4,0(a5)
	li	a5,2
	bne	a4,a5,.L121
	la a5, .LANCHOR12; sb zero, 0(a5);
	lw	a5,0(sp)
	ori	a5,a5,2
	sw	a5,0(sp)
	j	.L120
.L283:
	li	a5,2
	bne	a4,a5,.L107
	lw	a5,0(sp)
	ori	a5,a5,2
	sw	a5,0(sp)
	la a5, .LANCHOR12; sb zero, 0(a5);
	j	.L107
.L281:
	li	a1,4096
	lla	a3,.LC41
	li	a2,0
	addi	a1,a1,-2048
	la a0, .LANCHOR5; lw a0, 0(a0);
	call	_Z10AddExStatePvjiPKc
	j	.L141
.L286:
	lla	a1,.LC38
	mv	a0,s0
	call	strcat
	j	.L126
.L285:
	lla	a1,.LC37
	mv	a0,s0
	call	strcat
	j	.L125
.L282:
	la a0, .LANCHOR3; lw a0, 0(a0);
	sw	a5,28(sp)
	sw	a3,24(sp)
	sw	a2,0(sp)
	la a4, .LANCHOR11; sw zero, 0(a4);
	call	free
	la a4, .LANCHOR3; sw zero, 0(a4);
	lw	a5,28(sp)
	lw	a3,24(sp)
	lw	a2,0(sp)
	li	a4,8
	j	.L105
.L287:
	lla	a5,.LANCHOR4
	lw	a0,0(a5)
	call	free
	la a5, .LANCHOR4; sw zero, 0(a5);
	j	.L48
.L140:
	li	a3,1
	li	a0,0
	call	_Z19SetupCartCHRMappingiPhji
	lla	a4,.LANCHOR3
	lw	a1,0(s1)
	lw	a0,0(a4)
	lla	a3,.LC40
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	j	.L257
	.size	_Z8iNESLoadPKcP8FCEUFILEi, .-_Z8iNESLoadPKcP8FCEUFILEi
	.hidden	bmap
	.globl	bmap
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC43:
	.string	"NROM"
	.align	2
.LC44:
	.string	"MMC1"
	.align	2
.LC45:
	.string	"UNROM"
	.align	2
.LC46:
	.string	"CNROM"
	.align	2
.LC47:
	.string	"MMC3"
	.align	2
.LC48:
	.string	"MMC5"
	.align	2
.LC49:
	.string	"FFE Rev. A"
	.align	2
.LC50:
	.string	"ANROM"
	.align	2
.LC51:
	.string	""
	.align	2
.LC52:
	.string	"MMC2"
	.align	2
.LC53:
	.string	"MMC4"
	.align	2
.LC54:
	.string	"Color Dreams"
	.align	2
.LC55:
	.string	"REX DBZ 5"
	.align	2
.LC56:
	.string	"CPROM"
	.align	2
.LC57:
	.string	"REX SL-1632"
	.align	2
.LC58:
	.string	"100-in-1"
	.align	2
.LC59:
	.string	"BANDAI 24C02"
	.align	2
.LC60:
	.string	"FFE Rev. B"
	.align	2
.LC61:
	.string	"JALECO SS880006"
	.align	2
.LC62:
	.string	"Namcot 106"
	.align	2
.LC63:
	.string	"Konami VRC2/VRC4 A"
	.align	2
.LC64:
	.string	"Konami VRC2/VRC4 B"
	.align	2
.LC65:
	.string	"Konami VRC2/VRC4 C"
	.align	2
.LC66:
	.string	"Konami VRC6 Rev. A"
	.align	2
.LC67:
	.string	"Konami VRC2/VRC4 D"
	.align	2
.LC68:
	.string	"Konami VRC6 Rev. B"
	.align	2
.LC69:
	.string	"CC-21 MI HUN CHE"
	.align	2
.LC70:
	.string	"RET-CUFROM"
	.align	2
.LC71:
	.string	"UNROM 512"
	.align	2
.LC72:
	.string	"infiniteneslives-NSF"
	.align	2
.LC73:
	.string	"IREM G-101"
	.align	2
.LC74:
	.string	"TC0190FMC/TC0350FMR"
	.align	2
.LC75:
	.string	"IREM I-IM/BNROM"
	.align	2
.LC76:
	.string	"Wario Land 2"
	.align	2
.LC77:
	.string	"TXC Policeman"
	.align	2
.LC78:
	.string	"PAL-ZZ SMB/TETRIS/NWC"
	.align	2
.LC79:
	.string	"Bit Corp."
	.align	2
.LC80:
	.string	"SMB2j FDS"
	.align	2
.LC81:
	.string	"CALTRON 6-in-1"
	.align	2
.LC82:
	.string	"BIO MIRACLE FDS"
	.align	2
.LC83:
	.string	"FDS SMB2j LF36"
	.align	2
.LC84:
	.string	"MMC3 BMC PIRATE A"
	.align	2
.LC85:
	.string	"MMC3 BMC PIRATE B"
	.align	2
.LC86:
	.string	"RUMBLESTATION 15-in-1"
	.align	2
.LC87:
	.string	"NES-QJ SSVB/NWC"
	.align	2
.LC88:
	.string	"TAITO TCxxx"
	.align	2
.LC89:
	.string	"MMC3 BMC PIRATE C"
	.align	2
.LC90:
	.string	"SMB2j FDS Rev. A"
	.align	2
.LC91:
	.string	"11-in-1 BALL SERIES"
	.align	2
.LC92:
	.string	"MMC3 BMC PIRATE D"
	.align	2
.LC93:
	.string	"SUPERVISION 16-in-1"
	.align	2
.LC94:
	.string	"SIMBPLE BMC PIRATE A"
	.align	2
.LC95:
	.string	"SIMBPLE BMC PIRATE B"
	.align	2
.LC96:
	.string	"SIMBPLE BMC PIRATE C"
	.align	2
.LC97:
	.string	"20-in-1 KAISER Rev. A"
	.align	2
.LC98:
	.string	"700-in-1"
	.align	2
.LC99:
	.string	"TENGEN RAMBO1"
	.align	2
.LC100:
	.string	"IREM-H3001"
	.align	2
.LC101:
	.string	"MHROM"
	.align	2
.LC102:
	.string	"SUNSOFT-FZII"
	.align	2
.LC103:
	.string	"Sunsoft Mapper #4"
	.align	2
.LC104:
	.string	"SUNSOFT-5/FME-7"
	.align	2
.LC105:
	.string	"BA KAMEN DISCRETE"
	.align	2
.LC106:
	.string	"CAMERICA BF9093"
	.align	2
.LC107:
	.string	"JALECO JF-17"
	.align	2
.LC108:
	.string	"KONAMI VRC3"
	.align	2
.LC109:
	.string	"TW MMC3+VRAM Rev. A"
	.align	2
.LC110:
	.string	"KONAMI VRC1"
	.align	2
.LC111:
	.string	"NAMCOT 108 Rev. A"
	.align	2
.LC112:
	.string	"IREM LROG017"
	.align	2
.LC113:
	.string	"Irem 74HC161/32"
	.align	2
.LC114:
	.string	"AVE/C&E/TXC BOARD"
	.align	2
.LC115:
	.string	"TAITO X1-005 Rev. A"
	.align	2
.LC116:
	.string	"TAITO X1-017"
	.align	2
.LC117:
	.string	"YOKO VRC Rev. B"
	.align	2
.LC118:
	.string	"KONAMI VRC7"
	.align	2
.LC119:
	.string	"JALECO JF-13"
	.align	2
.LC120:
	.string	"74*139/74 DISCRETE"
	.align	2
.LC121:
	.string	"NAMCO 3433"
	.align	2
.LC122:
	.string	"SUNSOFT-3"
	.align	2
.LC123:
	.string	"HUMMER/JY BOARD"
	.align	2
.LC124:
	.string	"EARLY HUMMER/JY BOARD"
	.align	2
.LC125:
	.string	"JALECO JF-19"
	.align	2
.LC126:
	.string	"SUNSOFT-3R"
	.align	2
.LC127:
	.string	"HVC-UN1ROM"
	.align	2
.LC128:
	.string	"NAMCOT 108 Rev. B"
	.align	2
.LC129:
	.string	"BANDAI OEKAKIDS"
	.align	2
.LC130:
	.string	"IREM TAM-S1"
	.align	2
.LC131:
	.string	"VS Uni/Dual- system"
	.align	2
.LC132:
	.string	"FDS DOKIDOKI FULL"
	.align	2
.LC133:
	.string	"NES-EVENT NWC1990"
	.align	2
.LC134:
	.string	"SMB3 PIRATE A"
	.align	2
.LC135:
	.string	"MAGIC CORP A"
	.align	2
.LC136:
	.string	"FDS UNROM BOARD"
	.align	2
.LC137:
	.string	"Cheapocabra"
	.align	2
.LC138:
	.string	"ASDER/NTDEC BOARD"
	.align	2
.LC139:
	.string	"HACKER/SACHEN BOARD"
	.align	2
.LC140:
	.string	"MMC3 SG PROT. A"
	.align	2
.LC141:
	.string	"MMC3 PIRATE A"
	.align	2
.LC142:
	.string	"MMC1/MMC3/VRC PIRATE"
	.align	2
.LC143:
	.string	"FUTURE MEDIA BOARD"
	.align	2
.LC144:
	.string	"TSKROM"
	.align	2
.LC145:
	.string	"NES-TQROM"
	.align	2
.LC146:
	.string	"FDS TOBIDASE"
	.align	2
.LC147:
	.string	"MMC3 PIRATE PROT. A"
	.align	2
.LC148:
	.string	"MMC3 PIRATE H2288"
	.align	2
.LC149:
	.string	"FDS LH32"
	.align	2
.LC150:
	.string	"TXC/MGENIUS 22111"
	.align	2
.LC151:
	.string	"SA72008"
	.align	2
.LC152:
	.string	"MMC3 BMC PIRATE"
	.align	2
.LC153:
	.string	"TCU02"
	.align	2
.LC154:
	.string	"S8259D"
	.align	2
.LC155:
	.string	"S8259B"
	.align	2
.LC156:
	.string	"S8259C"
	.align	2
.LC157:
	.string	"JALECO JF-11/14"
	.align	2
.LC158:
	.string	"S8259A"
	.align	2
.LC159:
	.string	"UNLKS7032"
	.align	2
.LC160:
	.string	"TCA01"
	.align	2
.LC161:
	.string	"AGCI 50282"
	.align	2
.LC162:
	.string	"SA72007"
	.align	2
.LC163:
	.string	"SA0161M"
	.align	2
.LC164:
	.string	"TCU01"
	.align	2
.LC165:
	.string	"SA0037"
	.align	2
.LC166:
	.string	"SA0036"
	.align	2
.LC167:
	.string	"S74LS374N"
	.align	2
.LC168:
	.string	"BANDAI SRAM"
	.align	2
.LC169:
	.string	"BANDAI BARCODE"
	.align	2
.LC170:
	.string	"BANDAI 24C01"
	.align	2
.LC171:
	.string	"SA009"
	.align	2
.LC172:
	.string	"SUBOR Rev. A"
	.align	2
.LC173:
	.string	"SUBOR Rev. B"
	.align	2
.LC174:
	.string	"BMCFK23C"
	.align	2
.LC175:
	.string	"TW MMC3+VRAM Rev. B"
	.align	2
.LC176:
	.string	"NTDEC TC-112"
	.align	2
.LC177:
	.string	"TW MMC3+VRAM Rev. C"
	.align	2
.LC178:
	.string	"TW MMC3+VRAM Rev. D"
	.align	2
.LC179:
	.string	"TW MMC3+VRAM Rev. E"
	.align	2
.LC180:
	.string	"NAMCOT 108 Rev. C"
	.align	2
.LC181:
	.string	"TAITO X1-005 Rev. B"
	.align	2
.LC182:
	.string	"UNLA9746"
	.align	2
.LC183:
	.string	"Debug Mapper"
	.align	2
.LC184:
	.string	"UNLN625092"
	.align	2
.LC185:
	.string	"BMC 22+20-in-1"
	.align	2
.LC186:
	.string	"BMC Contra+22-in-1"
	.align	2
.LC187:
	.string	"BMC QUATTRO"
	.align	2
.LC188:
	.string	"BMC 22+20-in-1 RST"
	.align	2
.LC189:
	.string	"BMC MAXI"
	.align	2
.LC190:
	.string	"UNL6035052"
	.align	2
.LC191:
	.string	"S74LS374NA"
	.align	2
.LC192:
	.string	"DECATHLON"
	.align	2
.LC193:
	.string	"FONG SHEN BANG"
	.align	2
.LC194:
	.string	"SAN GUO ZHI PIRATE"
	.align	2
.LC195:
	.string	"DRAGON BALL PIRATE"
	.align	2
.LC196:
	.string	"ONE-BUS Systems"
	.align	2
.LC197:
	.string	"PEC-586 Computer"
	.align	2
.LC198:
	.string	"158B Prot Board"
	.align	2
.LC199:
	.string	"F-15 MMC3 Based"
	.align	2
.LC200:
	.string	"HP10xx/H20xx Boards"
	.align	2
.LC201:
	.string	"810544-CA-1"
	.align	2
.LC202:
	.string	"KONAMI QTAi Board"
	.hidden	MasterRomInfo
	.globl	MasterRomInfo
	.align	2
.LC203:
	.string	"bonus=0"
	.align	2
.LC204:
	.string	"busc=1"
	.align	2
.LC205:
	.string	"Akumajou Densetsu"
	.align	2
.LC206:
	.string	"Alien Syndrome"
	.align	2
.LC207:
	.string	"Banana"
	.align	2
.LC208:
	.string	"Bio Senshi Dan"
	.align	2
.LC209:
	.string	"Bucky O'Hare"
	.align	2
.LC210:
	.string	"Chibi Maruko Chan"
	.align	2
.LC211:
	.string	"Contra"
	.align	2
.LC212:
	.string	"Crisis Force"
	.align	2
.LC213:
	.string	"Crystalis (Prototype)"
	.align	2
.LC214:
	.string	"Digital Devil Story II"
	.align	2
.LC215:
	.string	"Dragon Ball"
	.align	2
.LC216:
	.string	"Dragon Warrior 4"
	.align	2
.LC217:
	.string	"Erika to Satoru no Yume Bouken"
	.align	2
.LC218:
	.string	"Famista 91"
	.align	2
.LC219:
	.string	"Famista 92"
	.align	2
.LC220:
	.string	"Famista 93"
	.align	2
.LC221:
	.string	"Famista 94"
	.align	2
.LC222:
	.string	"Fantasy Zone"
	.align	2
.LC223:
	.string	"Fire Emblem Gaiden"
	.align	2
.LC224:
	.string	"Fire Emblem"
	.align	2
.LC225:
	.string	"Ganbare Goemon 2"
	.align	2
.LC226:
	.string	"Ganbare Goemon Gaiden"
	.align	2
.LC227:
	.string	"Gegege no Kitarou 2"
	.align	2
.LC228:
	.string	"Goonies"
	.align	2
.LC229:
	.string	"Gradius 2"
	.align	2
.LC230:
	.string	"Highway Star"
	.align	2
.LC231:
	.string	"Kaiketsu Yanchamaru 3"
	.align	2
.LC232:
	.string	"Nobunaga no Yabou Zenkokuban"
	.align	2
.LC233:
	.string	"Salamander"
	.align	2
.LC234:
	.string	"Super Mario Bros."
	.align	2
.LC235:
	.string	"Sweet Home"
	.align	2
.LC236:
	.string	"110-in-1"
	.hidden	iNESGameCRC32
	.globl	iNESGameCRC32
	.hidden	iNES2
	.globl	iNES2
	.hidden	LoadedRomFName
	.globl	LoadedRomFName
	.hidden	VROM_size
	.globl	VROM_size
	.hidden	ROM_size
	.globl	ROM_size
	.hidden	Mirroring
	.globl	Mirroring
	.hidden	head
	.globl	head
	.hidden	ExtraNTARAM
	.globl	ExtraNTARAM
	.hidden	VROM
	.globl	VROM
	.hidden	ROM
	.globl	ROM
	.hidden	trainerpoo
	.globl	trainerpoo
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.word	329265318
	.word	-319320694
	.align	3
.LC9:
	.word	-1979592002
	.word	1656036112
	.align	3
.LC10:
	.word	2095929234
	.word	-1221664205
	.align	3
.LC11:
	.word	-1720417406
	.word	-1069325852
	.section	.bss.LoadedRomFName,"aw",@nobits
	.align	2
	.type	LoadedRomFName, @object
	.size	LoadedRomFName, 2048
LoadedRomFName:
	.zero	2048
	.section	.bss._ZL8iNESCart,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL8iNESCart, @object
	.size	_ZL8iNESCart, 96
_ZL8iNESCart:
	.zero	96
	.section	.bss.head,"aw",@nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	head, @object
	.size	head, 16
head:
	.zero	16
	.section	.data.bmap,"aw"
	.align	2
	.type	bmap, @object
	.size	bmap, 2700
bmap:
	.word	.LC43
	.word	0
	.word	_Z9NROM_InitP8CartInfo
	.word	.LC44
	.word	1
	.word	_Z12Mapper1_InitP8CartInfo
	.word	.LC45
	.word	2
	.word	_Z10UNROM_InitP8CartInfo
	.word	.LC46
	.word	3
	.word	_Z10CNROM_InitP8CartInfo
	.word	.LC47
	.word	4
	.word	_Z12Mapper4_InitP8CartInfo
	.word	.LC48
	.word	5
	.word	_Z12Mapper5_InitP8CartInfo
	.word	.LC49
	.word	6
	.word	_Z12Mapper6_InitP8CartInfo
	.word	.LC50
	.word	7
	.word	_Z10ANROM_InitP8CartInfo
	.word	.LC51
	.word	8
	.word	_Z12Mapper8_InitP8CartInfo
	.word	.LC52
	.word	9
	.word	_Z12Mapper9_InitP8CartInfo
	.word	.LC53
	.word	10
	.word	_Z13Mapper10_InitP8CartInfo
	.word	.LC54
	.word	11
	.word	_Z13Mapper11_InitP8CartInfo
	.word	.LC55
	.word	12
	.word	_Z13Mapper12_InitP8CartInfo
	.word	.LC56
	.word	13
	.word	_Z10CPROM_InitP8CartInfo
	.word	.LC57
	.word	14
	.word	_Z14UNLSL1632_InitP8CartInfo
	.word	.LC58
	.word	15
	.word	_Z13Mapper15_InitP8CartInfo
	.word	.LC59
	.word	16
	.word	_Z13Mapper16_InitP8CartInfo
	.word	.LC60
	.word	17
	.word	_Z13Mapper17_InitP8CartInfo
	.word	.LC61
	.word	18
	.word	_Z13Mapper18_InitP8CartInfo
	.word	.LC62
	.word	19
	.word	_Z13Mapper19_InitP8CartInfo
	.word	.LC63
	.word	21
	.word	_Z13Mapper21_InitP8CartInfo
	.word	.LC64
	.word	22
	.word	_Z13Mapper22_InitP8CartInfo
	.word	.LC65
	.word	23
	.word	_Z13Mapper23_InitP8CartInfo
	.word	.LC66
	.word	24
	.word	_Z13Mapper24_InitP8CartInfo
	.word	.LC67
	.word	25
	.word	_Z13Mapper25_InitP8CartInfo
	.word	.LC68
	.word	26
	.word	_Z13Mapper26_InitP8CartInfo
	.word	.LC69
	.word	27
	.word	_Z12UNLCC21_InitP8CartInfo
	.word	.LC51
	.word	28
	.word	_Z13Mapper28_InitP8CartInfo
	.word	.LC70
	.word	29
	.word	_Z13Mapper29_InitP8CartInfo
	.word	.LC71
	.word	30
	.word	_Z13UNROM512_InitP8CartInfo
	.word	.LC72
	.word	31
	.word	_Z13Mapper31_InitP8CartInfo
	.word	.LC73
	.word	32
	.word	_Z13Mapper32_InitP8CartInfo
	.word	.LC74
	.word	33
	.word	_Z13Mapper33_InitP8CartInfo
	.word	.LC75
	.word	34
	.word	_Z13Mapper34_InitP8CartInfo
	.word	.LC76
	.word	35
	.word	_Z13UNLSC127_InitP8CartInfo
	.word	.LC77
	.word	36
	.word	_Z13Mapper36_InitP8CartInfo
	.word	.LC78
	.word	37
	.word	_Z13Mapper37_InitP8CartInfo
	.word	.LC79
	.word	38
	.word	_Z13Mapper38_InitP8CartInfo
	.word	.LC80
	.word	40
	.word	_Z13Mapper40_InitP8CartInfo
	.word	.LC81
	.word	41
	.word	_Z13Mapper41_InitP8CartInfo
	.word	.LC82
	.word	42
	.word	_Z13Mapper42_InitP8CartInfo
	.word	.LC83
	.word	43
	.word	_Z13Mapper43_InitP8CartInfo
	.word	.LC84
	.word	44
	.word	_Z13Mapper44_InitP8CartInfo
	.word	.LC85
	.word	45
	.word	_Z13Mapper45_InitP8CartInfo
	.word	.LC86
	.word	46
	.word	_Z13Mapper46_InitP8CartInfo
	.word	.LC87
	.word	47
	.word	_Z13Mapper47_InitP8CartInfo
	.word	.LC88
	.word	48
	.word	_Z13Mapper48_InitP8CartInfo
	.word	.LC89
	.word	49
	.word	_Z13Mapper49_InitP8CartInfo
	.word	.LC90
	.word	50
	.word	_Z13Mapper50_InitP8CartInfo
	.word	.LC91
	.word	51
	.word	_Z13Mapper51_InitP8CartInfo
	.word	.LC92
	.word	52
	.word	_Z13Mapper52_InitP8CartInfo
	.word	.LC93
	.word	53
	.word	_Z18Supervision16_InitP8CartInfo
	.word	.LC94
	.word	57
	.word	_Z13Mapper57_InitP8CartInfo
	.word	.LC95
	.word	58
	.word	_Z13BMCGK192_InitP8CartInfo
	.word	.LC51
	.word	59
	.word	_Z13Mapper59_InitP8CartInfo
	.word	.LC96
	.word	60
	.word	_Z13BMCD1038_InitP8CartInfo
	.word	.LC97
	.word	61
	.word	_Z13Mapper61_InitP8CartInfo
	.word	.LC98
	.word	62
	.word	_Z13Mapper62_InitP8CartInfo
	.word	.LC99
	.word	64
	.word	_Z13Mapper64_InitP8CartInfo
	.word	.LC100
	.word	65
	.word	_Z13Mapper65_InitP8CartInfo
	.word	.LC101
	.word	66
	.word	_Z10MHROM_InitP8CartInfo
	.word	.LC102
	.word	67
	.word	_Z13Mapper67_InitP8CartInfo
	.word	.LC103
	.word	68
	.word	_Z13Mapper68_InitP8CartInfo
	.word	.LC104
	.word	69
	.word	_Z13Mapper69_InitP8CartInfo
	.word	.LC105
	.word	70
	.word	_Z13Mapper70_InitP8CartInfo
	.word	.LC106
	.word	71
	.word	_Z13Mapper71_InitP8CartInfo
	.word	.LC107
	.word	72
	.word	_Z13Mapper72_InitP8CartInfo
	.word	.LC108
	.word	73
	.word	_Z13Mapper73_InitP8CartInfo
	.word	.LC109
	.word	74
	.word	_Z13Mapper74_InitP8CartInfo
	.word	.LC110
	.word	75
	.word	_Z13Mapper75_InitP8CartInfo
	.word	.LC111
	.word	76
	.word	_Z13Mapper76_InitP8CartInfo
	.word	.LC112
	.word	77
	.word	_Z13Mapper77_InitP8CartInfo
	.word	.LC113
	.word	78
	.word	_Z13Mapper78_InitP8CartInfo
	.word	.LC114
	.word	79
	.word	_Z13Mapper79_InitP8CartInfo
	.word	.LC115
	.word	80
	.word	_Z13Mapper80_InitP8CartInfo
	.word	.LC116
	.word	82
	.word	_Z13Mapper82_InitP8CartInfo
	.word	.LC117
	.word	83
	.word	_Z13Mapper83_InitP8CartInfo
	.word	.LC118
	.word	85
	.word	_Z13Mapper85_InitP8CartInfo
	.word	.LC119
	.word	86
	.word	_Z13Mapper86_InitP8CartInfo
	.word	.LC120
	.word	87
	.word	_Z13Mapper87_InitP8CartInfo
	.word	.LC121
	.word	88
	.word	_Z13Mapper88_InitP8CartInfo
	.word	.LC122
	.word	89
	.word	_Z13Mapper89_InitP8CartInfo
	.word	.LC123
	.word	90
	.word	_Z13Mapper90_InitP8CartInfo
	.word	.LC124
	.word	91
	.word	_Z13Mapper91_InitP8CartInfo
	.word	.LC125
	.word	92
	.word	_Z13Mapper92_InitP8CartInfo
	.word	.LC126
	.word	93
	.word	_Z18SUNSOFT_UNROM_InitP8CartInfo
	.word	.LC127
	.word	94
	.word	_Z13Mapper94_InitP8CartInfo
	.word	.LC128
	.word	95
	.word	_Z13Mapper95_InitP8CartInfo
	.word	.LC129
	.word	96
	.word	_Z13Mapper96_InitP8CartInfo
	.word	.LC130
	.word	97
	.word	_Z13Mapper97_InitP8CartInfo
	.word	.LC131
	.word	99
	.word	_Z13Mapper99_InitP8CartInfo
	.word	.LC51
	.word	101
	.word	_Z14Mapper101_InitP8CartInfo
	.word	.LC132
	.word	103
	.word	_Z14Mapper103_InitP8CartInfo
	.word	.LC133
	.word	105
	.word	_Z14Mapper105_InitP8CartInfo
	.word	.LC134
	.word	106
	.word	_Z14Mapper106_InitP8CartInfo
	.word	.LC135
	.word	107
	.word	_Z14Mapper107_InitP8CartInfo
	.word	.LC136
	.word	108
	.word	_Z14Mapper108_InitP8CartInfo
	.word	.LC137
	.word	111
	.word	_Z14Mapper111_InitP8CartInfo
	.word	.LC138
	.word	112
	.word	_Z14Mapper112_InitP8CartInfo
	.word	.LC139
	.word	113
	.word	_Z14Mapper113_InitP8CartInfo
	.word	.LC140
	.word	114
	.word	_Z14Mapper114_InitP8CartInfo
	.word	.LC141
	.word	115
	.word	_Z14Mapper115_InitP8CartInfo
	.word	.LC142
	.word	116
	.word	_Z12UNLSL12_InitP8CartInfo
	.word	.LC143
	.word	117
	.word	_Z14Mapper117_InitP8CartInfo
	.word	.LC144
	.word	118
	.word	_Z11TKSROM_InitP8CartInfo
	.word	.LC145
	.word	119
	.word	_Z14Mapper119_InitP8CartInfo
	.word	.LC146
	.word	120
	.word	_Z14Mapper120_InitP8CartInfo
	.word	.LC147
	.word	121
	.word	_Z14Mapper121_InitP8CartInfo
	.word	.LC148
	.word	123
	.word	_Z13UNLH2288_InitP8CartInfo
	.word	.LC149
	.word	125
	.word	_Z9LH32_InitP8CartInfo
	.word	.LC150
	.word	132
	.word	_Z13UNL22211_InitP8CartInfo
	.word	.LC151
	.word	133
	.word	_Z12SA72008_InitP8CartInfo
	.word	.LC152
	.word	134
	.word	_Z14Mapper134_InitP8CartInfo
	.word	.LC153
	.word	136
	.word	_Z10TCU02_InitP8CartInfo
	.word	.LC154
	.word	137
	.word	_Z11S8259D_InitP8CartInfo
	.word	.LC155
	.word	138
	.word	_Z11S8259B_InitP8CartInfo
	.word	.LC156
	.word	139
	.word	_Z11S8259C_InitP8CartInfo
	.word	.LC157
	.word	140
	.word	_Z14Mapper140_InitP8CartInfo
	.word	.LC158
	.word	141
	.word	_Z11S8259A_InitP8CartInfo
	.word	.LC159
	.word	142
	.word	_Z14UNLKS7032_InitP8CartInfo
	.word	.LC160
	.word	143
	.word	_Z10TCA01_InitP8CartInfo
	.word	.LC161
	.word	144
	.word	_Z14Mapper144_InitP8CartInfo
	.word	.LC162
	.word	145
	.word	_Z12SA72007_InitP8CartInfo
	.word	.LC163
	.word	146
	.word	_Z12SA0161M_InitP8CartInfo
	.word	.LC164
	.word	147
	.word	_Z10TCU01_InitP8CartInfo
	.word	.LC165
	.word	148
	.word	_Z11SA0037_InitP8CartInfo
	.word	.LC166
	.word	149
	.word	_Z11SA0036_InitP8CartInfo
	.word	.LC167
	.word	150
	.word	_Z14S74LS374N_InitP8CartInfo
	.word	.LC51
	.word	151
	.word	_Z14Mapper151_InitP8CartInfo
	.word	.LC51
	.word	152
	.word	_Z14Mapper152_InitP8CartInfo
	.word	.LC168
	.word	153
	.word	_Z14Mapper153_InitP8CartInfo
	.word	.LC51
	.word	154
	.word	_Z14Mapper154_InitP8CartInfo
	.word	.LC51
	.word	155
	.word	_Z14Mapper155_InitP8CartInfo
	.word	.LC51
	.word	156
	.word	_Z14Mapper156_InitP8CartInfo
	.word	.LC169
	.word	157
	.word	_Z14Mapper157_InitP8CartInfo
	.word	.LC170
	.word	159
	.word	_Z14Mapper159_InitP8CartInfo
	.word	.LC171
	.word	160
	.word	_Z10SA009_InitP8CartInfo
	.word	.LC51
	.word	162
	.word	_Z13UNLFS304_InitP8CartInfo
	.word	.LC51
	.word	163
	.word	_Z14Mapper163_InitP8CartInfo
	.word	.LC51
	.word	164
	.word	_Z14Mapper164_InitP8CartInfo
	.word	.LC51
	.word	165
	.word	_Z14Mapper165_InitP8CartInfo
	.word	.LC172
	.word	166
	.word	_Z14Mapper166_InitP8CartInfo
	.word	.LC173
	.word	167
	.word	_Z14Mapper167_InitP8CartInfo
	.word	.LC51
	.word	168
	.word	_Z14Mapper168_InitP8CartInfo
	.word	.LC51
	.word	170
	.word	_Z14Mapper170_InitP8CartInfo
	.word	.LC51
	.word	171
	.word	_Z14Mapper171_InitP8CartInfo
	.word	.LC51
	.word	172
	.word	_Z14Mapper172_InitP8CartInfo
	.word	.LC51
	.word	173
	.word	_Z14Mapper173_InitP8CartInfo
	.word	.LC51
	.word	175
	.word	_Z14Mapper175_InitP8CartInfo
	.word	.LC174
	.word	176
	.word	_Z13BMCFK23C_InitP8CartInfo
	.word	.LC51
	.word	177
	.word	_Z14Mapper177_InitP8CartInfo
	.word	.LC51
	.word	178
	.word	_Z14Mapper178_InitP8CartInfo
	.word	.LC51
	.word	180
	.word	_Z14Mapper180_InitP8CartInfo
	.word	.LC51
	.word	181
	.word	_Z14Mapper181_InitP8CartInfo
	.word	.LC51
	.word	183
	.word	_Z14Mapper183_InitP8CartInfo
	.word	.LC51
	.word	184
	.word	_Z14Mapper184_InitP8CartInfo
	.word	.LC51
	.word	185
	.word	_Z14Mapper185_InitP8CartInfo
	.word	.LC51
	.word	186
	.word	_Z14Mapper186_InitP8CartInfo
	.word	.LC51
	.word	187
	.word	_Z14Mapper187_InitP8CartInfo
	.word	.LC51
	.word	188
	.word	_Z14Mapper188_InitP8CartInfo
	.word	.LC51
	.word	189
	.word	_Z14Mapper189_InitP8CartInfo
	.word	.LC51
	.word	190
	.word	_Z14Mapper190_InitP8CartInfo
	.word	.LC51
	.word	191
	.word	_Z14Mapper191_InitP8CartInfo
	.word	.LC175
	.word	192
	.word	_Z14Mapper192_InitP8CartInfo
	.word	.LC176
	.word	193
	.word	_Z14Mapper193_InitP8CartInfo
	.word	.LC177
	.word	194
	.word	_Z14Mapper194_InitP8CartInfo
	.word	.LC178
	.word	195
	.word	_Z14Mapper195_InitP8CartInfo
	.word	.LC51
	.word	196
	.word	_Z14Mapper196_InitP8CartInfo
	.word	.LC51
	.word	197
	.word	_Z14Mapper197_InitP8CartInfo
	.word	.LC179
	.word	198
	.word	_Z14Mapper198_InitP8CartInfo
	.word	.LC51
	.word	199
	.word	_Z14Mapper199_InitP8CartInfo
	.word	.LC51
	.word	200
	.word	_Z14Mapper200_InitP8CartInfo
	.word	.LC51
	.word	201
	.word	_Z14Mapper201_InitP8CartInfo
	.word	.LC51
	.word	202
	.word	_Z14Mapper202_InitP8CartInfo
	.word	.LC51
	.word	203
	.word	_Z14Mapper203_InitP8CartInfo
	.word	.LC51
	.word	204
	.word	_Z14Mapper204_InitP8CartInfo
	.word	.LC51
	.word	205
	.word	_Z14Mapper205_InitP8CartInfo
	.word	.LC180
	.word	206
	.word	_Z14Mapper206_InitP8CartInfo
	.word	.LC181
	.word	207
	.word	_Z14Mapper207_InitP8CartInfo
	.word	.LC51
	.word	208
	.word	_Z14Mapper208_InitP8CartInfo
	.word	.LC51
	.word	209
	.word	_Z14Mapper209_InitP8CartInfo
	.word	.LC51
	.word	210
	.word	_Z14Mapper210_InitP8CartInfo
	.word	.LC51
	.word	211
	.word	_Z14Mapper211_InitP8CartInfo
	.word	.LC51
	.word	212
	.word	_Z14Mapper212_InitP8CartInfo
	.word	.LC51
	.word	213
	.word	_Z14Mapper213_InitP8CartInfo
	.word	.LC51
	.word	214
	.word	_Z14Mapper214_InitP8CartInfo
	.word	.LC51
	.word	215
	.word	_Z12UNL8237_InitP8CartInfo
	.word	.LC51
	.word	216
	.word	_Z14Mapper216_InitP8CartInfo
	.word	.LC51
	.word	217
	.word	_Z14Mapper217_InitP8CartInfo
	.word	.LC182
	.word	219
	.word	_Z13UNLA9746_InitP8CartInfo
	.word	.LC183
	.word	220
	.word	_Z9QTAi_InitP8CartInfo
	.word	.LC184
	.word	221
	.word	_Z15UNLN625092_InitP8CartInfo
	.word	.LC51
	.word	222
	.word	_Z14Mapper222_InitP8CartInfo
	.word	.LC51
	.word	225
	.word	_Z14Mapper225_InitP8CartInfo
	.word	.LC185
	.word	226
	.word	_Z14Mapper226_InitP8CartInfo
	.word	.LC51
	.word	227
	.word	_Z14Mapper227_InitP8CartInfo
	.word	.LC51
	.word	228
	.word	_Z14Mapper228_InitP8CartInfo
	.word	.LC51
	.word	229
	.word	_Z14Mapper229_InitP8CartInfo
	.word	.LC186
	.word	230
	.word	_Z14Mapper230_InitP8CartInfo
	.word	.LC51
	.word	231
	.word	_Z14Mapper231_InitP8CartInfo
	.word	.LC187
	.word	232
	.word	_Z14Mapper232_InitP8CartInfo
	.word	.LC188
	.word	233
	.word	_Z14Mapper233_InitP8CartInfo
	.word	.LC189
	.word	234
	.word	_Z14Mapper234_InitP8CartInfo
	.word	.LC51
	.word	235
	.word	_Z14Mapper235_InitP8CartInfo
	.word	.LC190
	.word	238
	.word	_Z15UNL6035052_InitP8CartInfo
	.word	.LC51
	.word	240
	.word	_Z14Mapper240_InitP8CartInfo
	.word	.LC51
	.word	241
	.word	_Z14Mapper241_InitP8CartInfo
	.word	.LC51
	.word	242
	.word	_Z14Mapper242_InitP8CartInfo
	.word	.LC191
	.word	243
	.word	_Z15S74LS374NA_InitP8CartInfo
	.word	.LC192
	.word	244
	.word	_Z14Mapper244_InitP8CartInfo
	.word	.LC51
	.word	245
	.word	_Z14Mapper245_InitP8CartInfo
	.word	.LC193
	.word	246
	.word	_Z14Mapper246_InitP8CartInfo
	.word	.LC51
	.word	249
	.word	_Z14Mapper249_InitP8CartInfo
	.word	.LC51
	.word	250
	.word	_Z14Mapper250_InitP8CartInfo
	.word	.LC194
	.word	252
	.word	_Z14Mapper252_InitP8CartInfo
	.word	.LC195
	.word	253
	.word	_Z14Mapper253_InitP8CartInfo
	.word	.LC51
	.word	254
	.word	_Z14Mapper254_InitP8CartInfo
	.word	.LC196
	.word	256
	.word	_Z14UNLOneBus_InitP8CartInfo
	.word	.LC197
	.word	257
	.word	_Z13UNLPEC586InitP8CartInfo
	.word	.LC198
	.word	258
	.word	_Z12UNL158B_InitP8CartInfo
	.word	.LC199
	.word	259
	.word	_Z11BMCF15_InitP8CartInfo
	.word	.LC200
	.word	260
	.word	_Z12BMCHPxx_InitP8CartInfo
	.word	.LC201
	.word	261
	.word	_Z17BMC810544CA1_InitP8CartInfo
	.word	.LC202
	.word	547
	.word	_Z9QTAi_InitP8CartInfo
	.word	.LC51
	.word	0
	.word	0
	.section	.rodata._ZL12BadROMImages,"a"
	.align	3
	.set	.LANCHOR6,. + 0
	.type	_ZL12BadROMImages, @object
	.size	_ZL12BadROMImages, 656
_ZL12BadROMImages:
	.word	329265318
	.word	-319320694
	.word	.LC1
	.word	4
	.word	1041429023
	.word	1192396141
	.word	.LC205
	.word	4
	.word	-1118453202
	.word	284756901
	.word	.LC206
	.word	4
	.word	-762654270
	.word	225028922
	.word	.LC207
	.word	1
	.word	-1587425857
	.word	-2049785016
	.word	.LC208
	.word	4
	.word	1789447004
	.word	419280833
	.word	.LC209
	.word	2
	.word	554225947
	.word	-495171536
	.word	.LC210
	.word	4
	.word	1805977535
	.word	-1658892196
	.word	.LC211
	.word	4
	.word	-739636554
	.word	1620272182
	.word	.LC212
	.word	4
	.word	-609207203
	.word	-818869891
	.word	.LC213
	.word	2
	.word	-381550358
	.word	-1844966772
	.word	.LC214
	.word	4
	.word	-1023521938
	.word	1814704021
	.word	.LC215
	.word	4
	.word	694404495
	.word	1987751926
	.word	.LC215
	.word	4
	.word	-1139005221
	.word	-1745800232
	.word	.LC215
	.word	4
	.word	-1154338811
	.word	1342908026
	.word	.LC216
	.word	2
	.word	1459910731
	.word	45993783
	.word	.LC217
	.word	4
	.word	1664848262
	.word	-721507886
	.word	.LC218
	.word	4
	.word	-2086968848
	.word	-34027502
	.word	.LC219
	.word	4
	.word	-1266874288
	.word	-1246028529
	.word	.LC220
	.word	4
	.word	1065147529
	.word	809967223
	.word	.LC221
	.word	4
	.word	-79033385
	.word	1992672335
	.word	.LC222
	.word	4
	.word	237703241
	.word	-1267679303
	.word	.LC223
	.word	4
	.word	1343079238
	.word	668609292
	.word	.LC224
	.word	4
	.word	1459331790
	.word	589385700
	.word	.LC225
	.word	4
	.word	1317218777
	.word	-1081400750
	.word	.LC226
	.word	4
	.word	-637455133
	.word	-1452260925
	.word	.LC227
	.word	1
	.word	-2032446391
	.word	-2141342566
	.word	.LC228
	.word	4
	.word	1522834283
	.word	-978593114
	.word	.LC229
	.word	4
	.word	-729759460
	.word	78622282
	.word	.LC229
	.word	4
	.word	-1253471854
	.word	-1689539273
	.word	.LC229
	.word	4
	.word	284132494
	.word	-1335307092
	.word	.LC230
	.word	4
	.word	508565955
	.word	-1085180633
	.word	.LC231
	.word	4
	.word	1426724145
	.word	-2118001052
	.word	.LC232
	.word	4
	.word	594262947
	.word	-78950262
	.word	.LC233
	.word	4
	.word	-286102403
	.word	412463046
	.word	.LC234
	.word	4
	.word	-1081584828
	.word	924239038
	.word	.LC234
	.word	4
	.word	2105575514
	.word	-154560
	.word	.LC235
	.word	2
	.word	-1752463845
	.word	272615517
	.word	.LC235
	.word	2
	.word	-628690529
	.word	2038029393
	.word	.LC236
	.word	2
	.word	-1017633494
	.word	1838009
	.word	.LC236
	.word	2
	.word	0
	.word	0
	.word	0
	.word	0
	.section	.rodata._ZL14sMasterRomInfo,"a"
	.align	3
	.set	.LANCHOR16,. + 0
	.type	_ZL14sMasterRomInfo, @object
	.size	_ZL14sMasterRomInfo, 144
_ZL14sMasterRomInfo:
	.word	-1979592002
	.word	1656036112
	.word	.LC203
	.zero	4
	.word	-657316079
	.word	-1951103856
	.word	.LC203
	.zero	4
	.word	-1265839240
	.word	-950499113
	.word	.LC203
	.zero	4
	.word	-1521492631
	.word	-132499601
	.word	.LC203
	.zero	4
	.word	1040194118
	.word	-1551976170
	.word	.LC203
	.zero	4
	.word	1612922750
	.word	-564338088
	.word	.LC203
	.zero	4
	.word	-997941112
	.word	1530569933
	.word	.LC203
	.zero	4
	.word	-1373865590
	.word	-1824342117
	.word	.LC203
	.zero	4
	.word	-1750998253
	.word	374270560
	.word	.LC204
	.zero	4
	.section	.rodata._ZZL10CheckHInfovE3moo,"a"
	.align	2
	.type	_ZZL10CheckHInfovE3moo, @object
	.size	_ZZL10CheckHInfovE3moo, 4448
_ZZL10CheckHInfovE3moo:
	.word	-1352828254
	.word	-1
	.word	0
	.zero	4
	.word	-810408730
	.word	-1
	.word	1
	.zero	4
	.word	1328486470
	.word	-1
	.word	1
	.zero	4
	.word	-2098068306
	.word	-1
	.word	1
	.zero	4
	.word	1749744845
	.word	-1
	.word	1
	.zero	4
	.word	-1382259742
	.word	-1
	.word	1
	.zero	4
	.word	-514694616
	.word	-1
	.word	1
	.zero	4
	.word	-1352828254
	.word	-1
	.word	0
	.zero	4
	.word	-810408730
	.word	-1
	.word	1
	.zero	4
	.word	1328486470
	.word	-1
	.word	1
	.zero	4
	.word	-52770176
	.word	0
	.word	0
	.zero	4
	.word	-1067829669
	.word	0
	.word	0
	.zero	4
	.word	855254127
	.word	0
	.word	0
	.zero	4
	.word	-1279063062
	.word	0
	.word	0
	.zero	4
	.word	-460139430
	.word	0
	.word	0
	.zero	4
	.word	-493935210
	.word	0
	.word	1
	.zero	4
	.word	-655460759
	.word	1
	.word	8
	.zero	4
	.word	1535344269
	.word	1
	.word	8
	.zero	4
	.word	934949473
	.word	1
	.word	8
	.zero	4
	.word	1533847124
	.word	1
	.word	8
	.zero	4
	.word	1638421226
	.word	1
	.word	8
	.zero	4
	.word	-151370669
	.word	1
	.word	8
	.zero	4
	.word	958046648
	.word	1
	.word	8
	.zero	4
	.word	-1511468339
	.word	1
	.word	8
	.zero	4
	.word	1062642578
	.word	1
	.word	8
	.zero	4
	.word	126676272
	.word	1
	.word	8
	.zero	4
	.word	-29996059
	.word	1
	.word	8
	.zero	4
	.word	1472275072
	.word	1
	.word	8
	.zero	4
	.word	-795118372
	.word	1
	.word	8
	.zero	4
	.word	-390420606
	.word	1
	.word	8
	.zero	4
	.word	-1760831038
	.word	1
	.word	8
	.zero	4
	.word	-847630377
	.word	1
	.word	8
	.zero	4
	.word	1665569686
	.word	1
	.word	8
	.zero	4
	.word	-380808831
	.word	1
	.word	8
	.zero	4
	.word	1901513549
	.word	1
	.word	8
	.zero	4
	.word	1895201463
	.word	1
	.word	8
	.zero	4
	.word	689687933
	.word	1
	.word	8
	.zero	4
	.word	-1448809908
	.word	1
	.word	8
	.zero	4
	.word	-868924240
	.word	1
	.word	8
	.zero	4
	.word	-1823624886
	.word	1
	.word	-1
	.zero	4
	.word	-145884015
	.word	1
	.word	-1
	.zero	4
	.word	-1633559434
	.word	2
	.word	0
	.zero	4
	.word	1835387590
	.word	2
	.word	0
	.zero	4
	.word	-508403494
	.word	2
	.word	1
	.zero	4
	.word	487542123
	.word	2
	.word	1
	.zero	4
	.word	644669848
	.word	2
	.word	1
	.zero	4
	.word	-2142271094
	.word	2
	.word	1
	.zero	4
	.word	1433876608
	.word	2
	.word	1
	.zero	4
	.word	1846457406
	.word	2
	.word	1
	.zero	4
	.word	733389048
	.word	2
	.word	1
	.zero	4
	.word	683744548
	.word	2
	.word	1
	.zero	4
	.word	42350084
	.word	2
	.word	1
	.zero	4
	.word	1100243408
	.word	2
	.word	1
	.zero	4
	.word	-604436622
	.word	3
	.word	0
	.zero	4
	.word	-665320643
	.word	3
	.word	0
	.zero	4
	.word	-1679936921
	.word	3
	.word	1
	.zero	4
	.word	-655363873
	.word	3
	.word	1
	.zero	4
	.word	490851468
	.word	3
	.word	1
	.zero	4
	.word	-818795597
	.word	3
	.word	1
	.zero	4
	.word	-1244492126
	.word	3
	.word	1
	.zero	4
	.word	46938483
	.word	3
	.word	1
	.zero	4
	.word	-1140432957
	.word	3
	.word	1
	.zero	4
	.word	-907143769
	.word	3
	.word	-1
	.zero	4
	.word	333487482
	.word	4
	.word	0
	.zero	4
	.word	584504765
	.word	4
	.word	1
	.zero	4
	.word	-646172240
	.word	4
	.word	1
	.zero	4
	.word	1078668939
	.word	4
	.word	2
	.zero	4
	.word	353637377
	.word	4
	.word	8
	.zero	4
	.word	1288493176
	.word	4
	.word	8
	.zero	4
	.word	1495796716
	.word	4
	.word	8
	.zero	4
	.word	1953803410
	.word	4
	.word	8
	.zero	4
	.word	1396176700
	.word	4
	.word	8
	.zero	4
	.word	-1628457804
	.word	4
	.word	8
	.zero	4
	.word	564548551
	.word	4
	.word	-1
	.zero	4
	.word	-1665475547
	.word	5
	.word	8
	.zero	4
	.word	-182919848
	.word	7
	.word	8
	.zero	4
	.word	-2076696015
	.word	9
	.word	0
	.zero	4
	.word	-1097621554
	.word	9
	.word	1
	.zero	4
	.word	878524954
	.word	11
	.word	1
	.zero	4
	.word	1583803114
	.word	13
	.word	1
	.zero	4
	.word	-852018262
	.word	14
	.word	-1
	.zero	4
	.word	-1077435671
	.word	16
	.word	8
	.zero	4
	.word	1852367642
	.word	16
	.word	8
	.zero	4
	.word	867736009
	.word	16
	.word	-1
	.zero	4
	.word	-1570592737
	.word	16
	.word	-1
	.zero	4
	.word	-459107890
	.word	23
	.word	-1
	.zero	4
	.word	1374276915
	.word	23
	.word	-1
	.zero	4
	.word	274584966
	.word	27
	.word	-1
	.zero	4
	.word	-1130645823
	.word	27
	.word	-1
	.zero	4
	.word	1131755654
	.word	27
	.word	-1
	.zero	4
	.word	1530782673
	.word	27
	.word	-1
	.zero	4
	.word	1360950264
	.word	27
	.word	-1
	.zero	4
	.word	1431698595
	.word	32
	.word	8
	.zero	4
	.word	674943524
	.word	32
	.word	8
	.zero	4
	.word	607815477
	.word	32
	.word	20
	.zero	4
	.word	-1132782321
	.word	33
	.word	-1
	.zero	4
	.word	-1032647632
	.word	34
	.word	0
	.zero	4
	.word	1283201779
	.word	34
	.word	1
	.zero	4
	.word	-1825574802
	.word	34
	.word	1
	.zero	4
	.word	-194055270
	.word	37
	.word	-1
	.zero	4
	.word	2093683363
	.word	43
	.word	-1
	.zero	4
	.word	1819410094
	.word	45
	.word	-1
	.zero	4
	.word	-490124350
	.word	48
	.word	-1
	.zero	4
	.word	-1363319479
	.word	48
	.word	8
	.zero	4
	.word	1826360537
	.word	48
	.word	8
	.zero	4
	.word	-1715235335
	.word	48
	.word	8
	.zero	4
	.word	-1481616532
	.word	48
	.word	8
	.zero	4
	.word	1086369095
	.word	48
	.word	8
	.zero	4
	.word	352380981
	.word	48
	.word	8
	.zero	4
	.word	-1458392988
	.word	2099
	.word	8
	.zero	4
	.word	-1315285539
	.word	64
	.word	8
	.zero	4
	.word	-114564116
	.word	64
	.word	-1
	.zero	4
	.word	-398297915
	.word	66
	.word	1
	.zero	4
	.word	-1109152101
	.word	66
	.word	1
	.zero	4
	.word	-1789728545
	.word	66
	.word	1
	.zero	4
	.word	-2128673063
	.word	66
	.word	1
	.zero	4
	.word	-764478088
	.word	66
	.word	1
	.zero	4
	.word	-577842953
	.word	70
	.word	1
	.zero	4
	.word	-1146778651
	.word	70
	.word	-1
	.zero	4
	.word	923593573
	.word	70
	.word	-1
	.zero	4
	.word	-433179774
	.word	71
	.word	-1
	.zero	4
	.word	-1401223358
	.word	71
	.word	-1
	.zero	4
	.word	88855529
	.word	74
	.word	-1
	.zero	4
	.word	1231735031
	.word	74
	.word	-1
	.zero	4
	.word	-1366995729
	.word	74
	.word	-1
	.zero	4
	.word	-1169052561
	.word	78
	.word	2
	.zero	4
	.word	1025257783
	.word	78
	.word	8
	.zero	4
	.word	-1527008200
	.word	79
	.word	0
	.zero	4
	.word	-727225593
	.word	79
	.word	0
	.zero	4
	.word	515156256
	.word	79
	.word	1
	.zero	4
	.word	1041396181
	.word	79
	.word	1
	.zero	4
	.word	-764831597
	.word	88
	.word	0
	.zero	4
	.word	-1149476998
	.word	89
	.word	8
	.zero	4
	.word	228975406
	.word	101
	.word	-1
	.zero	4
	.word	-1901381604
	.word	113
	.word	1
	.zero	4
	.word	1778635763
	.word	114
	.word	-1
	.zero	4
	.word	228121427
	.word	114
	.word	-1
	.zero	4
	.word	1316432383
	.word	114
	.word	-1
	.zero	4
	.word	-974797390
	.word	115
	.word	-1
	.zero	4
	.word	-1579411776
	.word	116
	.word	-1
	.zero	4
	.word	-468845698
	.word	116
	.word	-1
	.zero	4
	.word	-919134533
	.word	116
	.word	-1
	.zero	4
	.word	-873187729
	.word	118
	.word	8
	.zero	4
	.word	2025215916
	.word	118
	.word	-1
	.zero	4
	.word	-1865976895
	.word	118
	.word	-1
	.zero	4
	.word	-1179330080
	.word	118
	.word	-1
	.zero	4
	.word	131673137
	.word	118
	.word	-1
	.zero	4
	.word	934685956
	.word	118
	.word	-1
	.zero	4
	.word	831411458
	.word	121
	.word	-1
	.zero	4
	.word	-573591464
	.word	121
	.word	-1
	.zero	4
	.word	1525660820
	.word	133
	.word	-1
	.zero	4
	.word	-1025570304
	.word	140
	.word	1
	.zero	4
	.word	-462742435
	.word	140
	.word	1
	.zero	4
	.word	848539626
	.word	140
	.word	1
	.zero	4
	.word	1808162174
	.word	140
	.word	1
	.zero	4
	.word	1554660961
	.word	144
	.word	1
	.zero	4
	.word	1210293058
	.word	146
	.word	-1
	.zero	4
	.word	-1230559238
	.word	146
	.word	-1
	.zero	4
	.word	-1507100191
	.word	146
	.word	-1
	.zero	4
	.word	-863597234
	.word	149
	.word	-1
	.zero	4
	.word	693644449
	.word	150
	.word	-1
	.zero	4
	.word	1088157602
	.word	150
	.word	-1
	.zero	4
	.word	1945851308
	.word	150
	.word	-1
	.zero	4
	.word	-573842922
	.word	150
	.word	-1
	.zero	4
	.word	1200721284
	.word	150
	.word	-1
	.zero	4
	.word	252974373
	.word	152
	.word	8
	.zero	4
	.word	-1112999708
	.word	152
	.word	8
	.zero	4
	.word	-1314305150
	.word	152
	.word	8
	.zero	4
	.word	40656842
	.word	152
	.word	8
	.zero	4
	.word	1058394637
	.word	153
	.word	8
	.zero	4
	.word	-781643736
	.word	154
	.word	8
	.zero	4
	.word	-808148351
	.word	155
	.word	8
	.zero	4
	.word	791137775
	.word	155
	.word	8
	.zero	4
	.word	-859818944
	.word	156
	.word	-1
	.zero	4
	.word	-1740799627
	.word	157
	.word	8
	.zero	4
	.word	-1991311940
	.word	157
	.word	8
	.zero	4
	.word	434639969
	.word	157
	.word	8
	.zero	4
	.word	-1106868929
	.word	157
	.word	8
	.zero	4
	.word	199271208
	.word	157
	.word	8
	.zero	4
	.word	1531278913
	.word	157
	.word	8
	.zero	4
	.word	-182812858
	.word	157
	.word	8
	.zero	4
	.word	-512737204
	.word	159
	.word	-1
	.zero	4
	.word	661309218
	.word	159
	.word	-1
	.zero	4
	.word	217329257
	.word	159
	.word	-1
	.zero	4
	.word	-591826226
	.word	159
	.word	-1
	.zero	4
	.word	-1208841963
	.word	159
	.word	-1
	.zero	4
	.word	406346194
	.word	159
	.word	-1
	.zero	4
	.word	1477782338
	.word	160
	.word	1
	.zero	4
	.word	470387010
	.word	162
	.word	-1
	.zero	4
	.word	136096511
	.word	163
	.word	-1
	.zero	4
	.word	46404664
	.word	176
	.word	-1
	.zero	4
	.word	1435241923
	.word	178
	.word	-1
	.zero	4
	.word	-964467722
	.word	180
	.word	0
	.zero	4
	.word	252051210
	.word	181
	.word	-1
	.zero	4
	.word	-1764861842
	.word	189
	.word	8
	.zero	4
	.word	1431983454
	.word	191
	.word	-1
	.zero	4
	.word	751010294
	.word	191
	.word	-1
	.zero	4
	.word	-1589249306
	.word	192
	.word	-1
	.zero	4
	.word	-1458480191
	.word	192
	.word	-1
	.zero	4
	.word	1283177230
	.word	192
	.word	-1
	.zero	4
	.word	-1732129461
	.word	192
	.word	-1
	.zero	4
	.word	-293532331
	.word	192
	.word	-1
	.zero	4
	.word	1143937577
	.word	192
	.word	-1
	.zero	4
	.word	1668363496
	.word	193
	.word	1
	.zero	4
	.word	-1457184148
	.word	194
	.word	-1
	.zero	4
	.word	2134753051
	.word	195
	.word	0
	.zero	4
	.word	-1240037284
	.word	195
	.word	0
	.zero	4
	.word	868605842
	.word	195
	.word	-1
	.zero	4
	.word	465616492
	.word	195
	.word	-1
	.zero	4
	.word	-719171618
	.word	195
	.word	-1
	.zero	4
	.word	-34848353
	.word	196
	.word	-1
	.zero	4
	.word	1879508468
	.word	198
	.word	-1
	.zero	4
	.word	-1708330964
	.word	198
	.word	-1
	.zero	4
	.word	-659291737
	.word	198
	.word	-1
	.zero	4
	.word	672736665
	.word	198
	.word	-1
	.zero	4
	.word	431613746
	.word	198
	.word	-1
	.zero	4
	.word	-582804569
	.word	198
	.word	-1
	.zero	4
	.word	-663628826
	.word	199
	.word	-1
	.zero	4
	.word	-314041476
	.word	199
	.word	-1
	.zero	4
	.word	1153565728
	.word	199
	.word	-1
	.zero	4
	.word	1310465596
	.word	206
	.word	0
	.zero	4
	.word	660748211
	.word	206
	.word	0
	.zero	4
	.word	1987637717
	.word	207
	.word	8
	.zero	4
	.word	132852754
	.word	208
	.word	-1
	.zero	4
	.word	-577966799
	.word	209
	.word	-1
	.zero	4
	.word	104534353
	.word	209
	.word	-1
	.zero	4
	.word	-582116766
	.word	209
	.word	-1
	.zero	4
	.word	206017645
	.word	210
	.word	1
	.zero	4
	.word	-1035481984
	.word	210
	.word	1
	.zero	4
	.word	1858412005
	.word	210
	.word	1
	.zero	4
	.word	-1375742385
	.word	210
	.word	1
	.zero	4
	.word	1116799945
	.word	210
	.word	1
	.zero	4
	.word	-2118651480
	.word	210
	.word	1
	.zero	4
	.word	608690235
	.word	210
	.word	1
	.zero	4
	.word	499185472
	.word	210
	.word	1
	.zero	4
	.word	-752633850
	.word	210
	.word	1
	.zero	4
	.word	-1118687215
	.word	210
	.word	0
	.zero	4
	.word	1571481242
	.word	211
	.word	-1
	.zero	4
	.word	516022251
	.word	217
	.word	-1
	.zero	4
	.word	74281164
	.word	217
	.word	-1
	.zero	4
	.word	318270029
	.word	217
	.word	-1
	.zero	4
	.word	-794855539
	.word	217
	.word	-1
	.zero	4
	.word	1659858041
	.word	232
	.word	8
	.zero	4
	.word	654699243
	.word	234
	.word	-1
	.zero	4
	.word	1863495621
	.word	235
	.word	-1
	.zero	4
	.word	-81040624
	.word	241
	.word	-1
	.zero	4
	.word	-1243071334
	.word	241
	.word	-1
	.zero	4
	.word	624407526
	.word	241
	.word	-1
	.zero	4
	.word	291577481
	.word	241
	.word	-1
	.zero	4
	.word	-2119993305
	.word	241
	.word	-1
	.zero	4
	.word	-1032647632
	.word	241
	.word	-1
	.zero	4
	.word	915151272
	.word	241
	.word	-1
	.zero	4
	.word	-1575065764
	.word	241
	.word	-1
	.zero	4
	.word	1423543161
	.word	241
	.word	-1
	.zero	4
	.word	1810502197
	.word	245
	.word	-1
	.zero	4
	.word	878634266
	.word	245
	.word	-1
	.zero	4
	.word	1464945772
	.word	245
	.word	-1
	.zero	4
	.word	494271797
	.word	4352
	.word	-1
	.zero	4
	.word	1861192631
	.word	4353
	.word	-1
	.zero	4
	.word	-1400989445
	.word	4353
	.word	-1
	.zero	4
	.word	-1924029893
	.word	4353
	.word	-1
	.zero	4
	.word	633825139
	.word	4353
	.word	-1
	.zero	4
	.word	480887586
	.word	4354
	.word	-1
	.zero	4
	.word	610910638
	.word	4355
	.word	-1
	.zero	4
	.word	-1714141617
	.word	4356
	.word	-1
	.zero	4
	.word	-1221907212
	.word	4356
	.word	-1
	.zero	4
	.word	1304825981
	.word	4356
	.word	-1
	.zero	4
	.word	7592920
	.word	4356
	.word	-1
	.zero	4
	.word	990479172
	.word	4356
	.word	-1
	.zero	4
	.word	533086400
	.word	4356
	.word	-1
	.zero	4
	.word	790286844
	.word	4356
	.word	-1
	.zero	4
	.word	-1574824773
	.word	4356
	.word	-1
	.zero	4
	.word	1574504251
	.word	4356
	.word	-1
	.zero	4
	.word	648244418
	.word	4356
	.word	-1
	.zero	4
	.word	-773510345
	.word	4356
	.word	-1
	.zero	4
	.word	1296698907
	.word	4356
	.word	-1
	.zero	4
	.word	-1227019107
	.word	4356
	.word	-1
	.zero	4
	.word	0
	.word	-1
	.word	-1
	.zero	4
	.section	.rodata._ZZL10CheckHInfovE5savie,"a"
	.align	3
	.set	.LANCHOR17,. + 0
	.type	_ZZL10CheckHInfovE5savie, @object
	.size	_ZZL10CheckHInfovE5savie, 264
_ZZL10CheckHInfovE5savie:
	.word	-1720417406
	.word	-1069325852
	.word	2095929234
	.word	-1221664205
	.word	-1568942289
	.word	728826807
	.word	1178402453
	.word	1233916124
	.word	-1558741161
	.word	-2058520249
	.word	-1201122890
	.word	1243566902
	.word	-2076435591
	.word	-1329807316
	.word	-946635742
	.word	768555672
	.word	-540248781
	.word	-1729798647
	.word	-1221647248
	.word	1932535478
	.word	-902986650
	.word	1763180490
	.word	-1834877708
	.word	-1918603851
	.word	-1000305376
	.word	-306571358
	.word	839050198
	.word	-1851358099
	.word	-491581068
	.word	19789206
	.word	542416589
	.word	-156018265
	.word	-1689586851
	.word	1513151005
	.word	-1028519204
	.word	-700593048
	.word	-1464428794
	.word	786645371
	.word	1291054272
	.word	-339941979
	.word	1371153310
	.word	1787137445
	.word	1813035301
	.word	767096273
	.word	-561971797
	.word	77796935
	.word	1654811834
	.word	-1799796664
	.word	192750334
	.word	-1543084428
	.word	-263556677
	.word	-2113926811
	.word	1979778233
	.word	2008551858
	.word	-269980020
	.word	297177378
	.word	-1067549211
	.word	-1700668394
	.word	-796423216
	.word	453525767
	.word	351588469
	.word	-1492432557
	.word	-203395515
	.word	-2090070028
	.word	0
	.word	0
	.section	.rodata._ZZL8SetInputvE3moo,"a"
	.align	2
	.set	.LANCHOR14,. + 0
	.type	_ZZL8SetInputvE3moo, @object
	.size	_ZZL8SetInputvE3moo, 1088
_ZZL8SetInputvE3moo:
	.word	431008241
	.word	1
	.word	2
	.word	0
	.word	702449583
	.word	1
	.word	1
	.word	11
	.word	-660710809
	.word	-1
	.word	-1
	.word	1
	.word	252974373
	.word	-1
	.word	-1
	.word	1
	.word	855311747
	.word	-1
	.word	5
	.word	0
	.word	1621952778
	.word	1
	.word	1
	.word	10
	.word	1221201633
	.word	1
	.word	1
	.word	13
	.word	1125688056
	.word	-1
	.word	2
	.word	0
	.word	1825184799
	.word	1
	.word	1
	.word	11
	.word	609847185
	.word	-1
	.word	2
	.word	0
	.word	-707335484
	.word	-1
	.word	-1
	.word	5
	.word	-374866274
	.word	-1
	.word	6
	.word	0
	.word	-1887758743
	.word	-1
	.word	-1
	.word	5
	.word	-144676848
	.word	-1
	.word	-1
	.word	4
	.word	-1991231556
	.word	-1
	.word	-1
	.word	4
	.word	-1303180548
	.word	-1
	.word	-1
	.word	4
	.word	-359599134
	.word	1
	.word	1
	.word	11
	.word	-1146778651
	.word	1
	.word	1
	.word	11
	.word	1045997694
	.word	-1
	.word	2
	.word	0
	.word	-638297111
	.word	1
	.word	1
	.word	9
	.word	356891923
	.word	1
	.word	1
	.word	9
	.word	1318424947
	.word	-1
	.word	2
	.word	0
	.word	-1095193855
	.word	-1
	.word	2
	.word	0
	.word	-14362732
	.word	-1
	.word	2
	.word	0
	.word	569923201
	.word	1
	.word	1
	.word	7
	.word	-1744049866
	.word	1
	.word	1
	.word	7
	.word	-1856351321
	.word	1
	.word	1
	.word	7
	.word	-1615966906
	.word	1
	.word	1
	.word	8
	.word	2068118314
	.word	1
	.word	1
	.word	8
	.word	789742866
	.word	1
	.word	1
	.word	10
	.word	-1154279057
	.word	-1
	.word	-1
	.word	4
	.word	-2054689280
	.word	-1
	.word	-1
	.word	4
	.word	1413133618
	.word	-1
	.word	-1
	.word	5
	.word	915151272
	.word	-1
	.word	-1
	.word	5
	.word	1592131726
	.word	-1
	.word	2
	.word	0
	.word	923593573
	.word	1
	.word	1
	.word	11
	.word	974558457
	.word	1
	.word	1
	.word	3
	.word	-1660645724
	.word	1
	.word	1
	.word	12
	.word	711285153
	.word	-1
	.word	2
	.word	0
	.word	-305961429
	.word	-1
	.word	2
	.word	0
	.word	-1859548708
	.word	-1
	.word	-1
	.word	4
	.word	-1874569970
	.word	1
	.word	1
	.word	10
	.word	-359599134
	.word	1
	.word	1
	.word	11
	.word	-2061583938
	.word	1
	.word	2
	.word	0
	.word	1681244309
	.word	1
	.word	4
	.word	-1
	.word	-1069307681
	.word	-1
	.word	6
	.word	0
	.word	754309893
	.word	-1
	.word	6
	.word	0
	.word	-1382259742
	.word	1
	.word	-1
	.word	2
	.word	1641570663
	.word	1
	.word	4
	.word	-1
	.word	-1414334092
	.word	-1
	.word	-1
	.word	5
	.word	1106221764
	.word	-1
	.word	-1
	.word	5
	.word	-1960421278
	.word	-1
	.word	-1
	.word	5
	.word	-2098070634
	.word	-1
	.word	-1
	.word	5
	.word	-1618010102
	.word	1
	.word	1
	.word	10
	.word	-682940647
	.word	1
	.word	4
	.word	-1
	.word	1958651474
	.word	1
	.word	2
	.word	0
	.word	1577531931
	.word	-1
	.word	-1
	.word	5
	.word	1486580493
	.word	-1
	.word	-1
	.word	5
	.word	1094720621
	.word	-1
	.word	-1
	.word	5
	.word	600932190
	.word	1
	.word	2
	.word	0
	.word	-1010794211
	.word	1
	.word	1
	.word	12
	.word	-560998091
	.word	-1
	.word	2
	.word	0
	.word	1193486137
	.word	1
	.word	1
	.word	14
	.word	-1978488871
	.word	1
	.word	1
	.word	11
	.word	-1195791197
	.word	-1
	.word	2
	.word	0
	.word	1360190497
	.word	-1
	.word	2
	.word	0
	.word	-1354755862
	.word	1
	.word	4
	.word	-1
	.word	0
	.word	-1
	.word	-1
	.word	-1
	.section	.sbss.ExtraNTARAM,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	ExtraNTARAM, @object
	.size	ExtraNTARAM, 4
ExtraNTARAM:
	.zero	4
	.section	.sbss.MasterRomInfo,"aw",@nobits
	.align	2
	.set	.LANCHOR15,. + 0
	.type	MasterRomInfo, @object
	.size	MasterRomInfo, 4
MasterRomInfo:
	.zero	4
	.section	.sbss.Mirroring,"aw",@nobits
	.set	.LANCHOR12,. + 0
	.type	Mirroring, @object
	.size	Mirroring, 1
Mirroring:
	.zero	1
	.section	.sbss.ROM,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	ROM, @object
	.size	ROM, 4
ROM:
	.zero	4
	.section	.sbss.ROM_size,"aw",@nobits
	.align	2
	.set	.LANCHOR10,. + 0
	.type	ROM_size, @object
	.size	ROM_size, 4
ROM_size:
	.zero	4
	.section	.sbss.VROM,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	VROM, @object
	.size	VROM, 4
VROM:
	.zero	4
	.section	.sbss.VROM_size,"aw",@nobits
	.align	2
	.set	.LANCHOR11,. + 0
	.type	VROM_size, @object
	.size	VROM_size, 4
VROM_size:
	.zero	4
	.section	.sbss._ZL8MapperNo,"aw",@nobits
	.align	2
	.set	.LANCHOR9,. + 0
	.type	_ZL8MapperNo, @object
	.size	_ZL8MapperNo, 4
_ZL8MapperNo:
	.zero	4
	.section	.sbss.iNES2,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	iNES2, @object
	.size	iNES2, 4
iNES2:
	.zero	4
	.section	.sbss.iNESGameCRC32,"aw",@nobits
	.align	2
	.set	.LANCHOR13,. + 0
	.type	iNESGameCRC32, @object
	.size	iNESGameCRC32, 4
iNESGameCRC32:
	.zero	4
	.section	.sbss.trainerpoo,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	trainerpoo, @object
	.size	trainerpoo, 4
trainerpoo:
	.zero	4
	.section	.sdata._ZL10CHRRAMSize,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL10CHRRAMSize, @object
	.size	_ZL10CHRRAMSize, 4
_ZL10CHRRAMSize:
	.word	-1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
