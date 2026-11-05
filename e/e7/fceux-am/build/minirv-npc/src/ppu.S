#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ppu.cpp"
	.option nopic
	.text
	.section	.text._ZL5B2002jh,"ax",@progbits
	.align	2
	.type	_ZL5B2002jh, @function
_ZL5B2002jh:
	la a5, .LANCHOR0; sb a1, 0(a5);
	ret
	.size	_ZL5B2002jh, .-_ZL5B2002jh
	.section	.text._ZL5B2003jh,"ax",@progbits
	.align	2
	.type	_ZL5B2003jh, @function
_ZL5B2003jh:
	andi	a5,a1,7
	la a4, .LANCHOR0; sb a1, 0(a4);
	la a4, .LANCHOR1+3; sb a1, 0(a4);
	la a4, .LANCHOR2; sb a5, 0(a4);
	ret
	.size	_ZL5B2003jh, .-_ZL5B2003jh
	.section	.text._ZL14CheckSpriteHiti,"ax",@progbits
	.align	2
	.type	_ZL14CheckSpriteHiti, @function
_ZL14CheckSpriteHiti:
	addi	sp,sp,-8
	sw	s0,4(sp)
	lla	s0,.LANCHOR3
	lw	a5,0(s0)
	sw	s1,0(sp)
	li	a4,256
	beq	a5,a4,.L4
	addi	a0,a0,-16
	bge	a5,a0,.L4
	la t0, .LANCHOR4; lbu t0, 0(t0);
	la t1, .LANCHOR5; lw t1, 0(t1);
	li	a3,0
	li	a1,128
	li	s1,254
	li	t2,7
	j	.L7
.L14:
	addi	a3,a3,1
	beq	a0,a5,.L4
.L7:
	sra	a4,a1,a3
	and	a4,a4,t0
	add	a2,t1,a5
	beq	a4,zero,.L6
	lbu	a4,0(a2)
	andi	a4,a4,64
	bne	a4,zero,.L6
	ble	a5,s1,.L13
.L6:
	addi	a5,a5,1
	bne	a3,t2,.L14
.L4:
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,8
	jr	ra
.L13:
	lla	a4,.LANCHOR1
	lbu	a5,2(a4)
	li	a3,256
	sw	a3,0(s0)
	ori	a5,a5,64
	sb	a5,2(a4)
	j	.L4
	.size	_ZL14CheckSpriteHiti, .-_ZL14CheckSpriteHiti
	.section	.text._ZL5B4014jh,"ax",@progbits
	.align	2
	.type	_ZL5B4014jh, @function
_ZL5B4014jh:
	addi	sp,sp,-20
	sw	s1,8(sp)
	slli	s1,a1,8
	sw	s0,12(sp)
	addi	a5,s1,256
	li	s0,8192
	sw	ra,16(sp)
	sw	a1,4(sp)
	sw	a5,0(sp)
	addi	s0,s0,4
.L16:
	mv	a0,s1
	call	_Z9X6502_DMRj
	mv	a1,a0
	mv	a0,s0
	call	_Z9X6502_DMWjh
	lw	a5,0(sp)
	addi	s1,s1,1
	bne	s1,a5,.L16
	lw	a4,4(sp)
	lw	ra,16(sp)
	lw	s0,12(sp)
	la a5, .LANCHOR6; sb a4, 0(a5);
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
	.size	_ZL5B4014jh, .-_ZL5B4014jh
	.section	.text._Z22FFCEUX_PPURead_Defaultj,"ax",@progbits
	.align	2
	.globl	_Z22FFCEUX_PPURead_Defaultj
	.hidden	_Z22FFCEUX_PPURead_Defaultj
	.type	_Z22FFCEUX_PPURead_Defaultj, @function
_Z22FFCEUX_PPURead_Defaultj:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	la a5, .LANCHOR7; lw a5, 0(a5);
	mv	s0,a0
	beq	a5,zero,.L20
	jalr	a5
.L20:
	li	a5,8192
	bltu	s0,a5,.L43
	li	a5,16384
	addi	a5,a5,-257
	bgtu	s0,a5,.L23
	srli	a4,s0,8
	andi	a4,a4,12
	lla	a5,.LANCHOR8
	add	a5,a5,a4
	lw	a5,0(a5)
	andi	s0,s0,1023
	add	s0,a5,s0
	lbu	a0,0(s0)
.L22:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L23:
	la a4, .LANCHOR1+1; lbu a4, 0(a4);
	andi	a5,s0,3
	andi	a4,a4,1
	bne	a5,zero,.L24
	andi	a5,s0,12
	bne	a5,zero,.L25
	la a0, .LANCHOR9; lbu a0, 0(a0);
	beq	a4,zero,.L22
	andi	a0,a0,48
.L44:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L43:
	srli	a4,s0,10
	slli	a4,a4,2
	lla	a5,VPage
	add	a5,a5,a4
	lw	a5,0(a5)
	lw	ra,8(sp)
	add	a5,a5,s0
	lw	s0,4(sp)
	lbu	a0,0(a5)
	addi	sp,sp,12
	jr	ra
.L24:
	andi	s0,s0,31
	lla	a5,.LANCHOR9
	add	a5,a5,s0
	lbu	a0,0(a5)
	beq	a4,zero,.L22
	andi	a0,a0,48
	j	.L44
.L25:
	srli	s0,s0,2
	andi	s0,s0,3
	lla	a5,.LANCHOR10
	add	a5,a5,s0
	lbu	a0,-1(a5)
	beq	a4,zero,.L22
	andi	a0,a0,48
	j	.L44
	.size	_Z22FFCEUX_PPURead_Defaultj, .-_Z22FFCEUX_PPURead_Defaultj
	.section	.text._ZL5B2004jh,"ax",@progbits
	.align	2
	.type	_ZL5B2004jh, @function
_ZL5B2004jh:
	lla	a3,.LANCHOR1
	la a5, .LANCHOR0; sb a1, 0(a5);
	la a4, .LANCHOR11; lw a4, 0(a4);
	lbu	a5,3(a3)
	beq	a4,zero,.L46
	andi	a4,a5,3
	li	a2,2
	beq	a4,a2,.L51
	lla	a4,.LANCHOR12
	add	a4,a4,a5
	addi	a5,a5,1
	sb	a1,0(a4)
	sb	a5,3(a3)
	ret
.L46:
	lla	a2,.LANCHOR2
	lbu	a4,0(a2)
	li	a0,7
	bgtu	a4,a0,.L52
	lla	a0,.LANCHOR12
	add	a0,a0,a4
	sb	a1,0(a0)
.L50:
	addi	a5,a5,1
	addi	a4,a4,1
	sb	a5,3(a3)
	sb	a4,0(a2)
	ret
.L52:
	bleu	a5,a0,.L50
	lla	a0,.LANCHOR12
	add	a0,a0,a5
	sb	a1,0(a0)
	addi	a5,a5,1
	addi	a4,a4,1
	sb	a5,3(a3)
	sb	a4,0(a2)
	ret
.L51:
	lla	a4,.LANCHOR12
	add	a4,a4,a5
	andi	a1,a1,227
	addi	a5,a5,1
	sb	a1,0(a4)
	sb	a5,3(a3)
	ret
	.size	_ZL5B2004jh, .-_ZL5B2004jh
	.section	.rodata._ZL11RefreshLinei.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `!PPU_hook' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/fceux-am/src/ppu.cpp:1119  \n"
	.align	2
.LC3:
	.string	"Assertion `!PEC586Hack' failed"
	.align	2
.LC4:
	.string	" @ /home/ysyx/ysyx-workbench/fceux-am/src/ppu.cpp:1120  \n"
	.align	2
.LC5:
	.string	"Assertion `!MMC5Hack' failed"
	.align	2
.LC6:
	.string	" @ /home/ysyx/ysyx-workbench/fceux-am/src/ppu.cpp:1121  \n"
	.align	2
.LC7:
	.string	"Assertion `!QTAIHack' failed"
	.align	2
.LC8:
	.string	" @ /home/ysyx/ysyx-workbench/fceux-am/src/ppu.cpp:1122  \n"
	.section	.text._ZL11RefreshLinei,"ax",@progbits
	.align	2
	.type	_ZL11RefreshLinei, @function
_ZL11RefreshLinei:
	addi	sp,sp,-64
	lla	a1,.LANCHOR14
	sw	s1,52(sp)
	lw	s1,0(a1)
	srai	a1,a0,3
	lla	a5,.LANCHOR13
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	a0,24(sp)
	la a4, .LANCHOR3; lw a4, 0(a4);
	li	a3,256
	sw	a1,16(sp)
	lw	a5,0(a5)
	beq	a4,a3,.L54
	la a3, .LANCHOR1+2; lbu a3, 0(a3);
	andi	a3,a3,64
	beq	a3,zero,.L132
.L54:
	lw	a3,16(sp)
	li	a4,34
	sw	a3,4(sp)
	ble	a3,a4,.L55
	sw	a4,4(sp)
.L55:
	lla	a4,.LANCHOR15
	lw	a4,0(a4)
	lw	a3,4(sp)
	sw	a4,20(sp)
	sub	a4,a3,a4
	sw	a4,28(sp)
	ble	a4,zero,.L53
	la a4, .LANCHOR7; lw a4, 0(a4);
	bne	a4,zero,.L133
	la a4, .LANCHOR16; lw a4, 0(a4);
	bne	a4,zero,.L134
	la a4, .LANCHOR17; lw a4, 0(a4);
	bne	a4,zero,.L135
	la a4, .LANCHOR18; lw a4, 0(a4);
	bne	a4,zero,.L136
	lla	a4,.LANCHOR1
	lla	a2,.LANCHOR9
	lbu	a3,1(a4)
	sw	a2,0(sp)
	lbu	a4,0(a4)
	lbu	a2,0(a2)
	sw	a3,12(sp)
	sw	a4,32(sp)
	sw	a2,8(sp)
	slli	a4,a2,24
	andi	a3,a3,1
	srai	a4,a4,24
	beq	a3,zero,.L75
	andi	a4,a4,48
.L75:
	lw	a3,12(sp)
	ori	a4,a4,64
	andi	a4,a4,0xff
	andi	a3,a3,24
	sw	a4,36(sp)
	beq	a3,zero,.L137
	la a4, .LANCHOR20; lw a4, 0(a4);
	beq	a4,zero,.L78
	lw	a1,0(sp)
	lw	a2,8(sp)
	lla	s0,.LANCHOR9
	lbu	a4,4(a1)
	lbu	a0,12(a1)
	lbu	a3,8(a1)
	ori	ra,a2,64
	sw	a4,40(sp)
	ori	a2,a4,64
	sw	a3,44(sp)
	ori	a4,a0,64
	ori	a3,a3,64
	sw	a0,48(sp)
	sb	ra,0(a1)
	sb	a2,4(a1)
	sb	a3,8(a1)
	sb	a4,12(a1)
	mv	t2,s0
	sw	s0,0(sp)
	lla	t0,.LANCHOR21
	mv	a1,ra
	li	t1,0
	lla	a0,.LANCHOR9+16
.L79:
	slli	a1,a1,8
	slli	a1,a1,16
	srai	a1,a1,16
	mv	a3,s0
	mv	a2,t0
	mv	a4,ra
	j	.L82
.L80:
	lbu	a4,0(a3)
.L82:
	or	a4,a1,a4
	sh	a4,0(a2)
	addi	a3,a3,1
	addi	a2,a2,2
	bne	a0,a3,.L80
	addi	t1,t1,16
	li	a4,256
	addi	t2,t2,1
	addi	t0,t0,32
	beq	t1,a4,.L81
	lbu	a1,0(t2)
	j	.L79
.L130:
	lla	a4,.LANCHOR1
	lbu	a4,1(a4)
	sw	a4,12(sp)
	lla	a4,.LANCHOR23
	sw	a1,0(a4)
	lla	a4,.LANCHOR22
	sw	t0,4(a4)
	sw	ra,0(a4)
.L84:
	lla	a4,.LANCHOR13
	sw	a5,0(a4)
	lw	a4,20(sp)
	li	a5,2
	bgt	a4,a5,.L90
	lw	a4,16(sp)
	bgt	a4,a5,.L138
.L90:
	lw	a5,12(sp)
	andi	a5,a5,8
	bne	a5,zero,.L91
	lw	a5,20(sp)
	addi	a5,a5,-2
	bge	a5,zero,.L92
	lw	a5,4(sp)
	addi	a5,a5,-2
	sw	a5,28(sp)
	bgt	a5,zero,.L139
.L91:
	lw	a4,24(sp)
	li	a5,267
	ble	a4,a5,.L93
	la a5, .LANCHOR19; lw a5, 0(a5);
	bne	a5,zero,.L140
.L93:
	lw	a0,24(sp)
	call	_ZL14CheckSpriteHiti
	lw	a4,4(sp)
	lla	a5,.LANCHOR14
	sw	s1,0(a5)
	lla	a5,.LANCHOR15
	sw	a4,0(a5)
.L53:
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	addi	sp,sp,64
	jr	ra
.L132:
	addi	a3,a0,-16
	bge	a4,a3,.L54
	addi	a3,a1,-2
	slli	a3,a3,3
	slt	a4,a4,a3
	xori	a4,a4,1
	add	a4,a1,a4
	sw	a4,16(sp)
	j	.L54
.L137:
	lw	a5,28(sp)
	mv	a1,a4
	mv	a0,s1
	slli	s0,a5,3
	mv	a2,s0
	call	memset
	lw	a4,4(sp)
	lla	a5,.LANCHOR14
	add	s0,s1,s0
	sw	s0,0(a5)
	lla	a5,.LANCHOR15
	sw	a4,0(a5)
	lw	a4,24(sp)
	li	a5,267
	ble	a4,a5,.L53
	la a5, .LANCHOR19; lw a5, 0(a5);
	beq	a5,zero,.L53
	la a5, .LANCHOR19; sw zero, 0(a5);
	j	.L53
.L81:
	lw	a3,40(sp)
	lw	a4,8(sp)
	lw	a0,0(sp)
	andi	a1,a3,63
	lw	a3,44(sp)
	andi	a4,a4,63
	sb	a4,0(a0)
	andi	a2,a3,63
	lw	a3,48(sp)
	sb	a1,4(a0)
	sb	a2,8(a0)
	andi	a3,a3,63
	sb	a3,12(a0)
	la a4, .LANCHOR20; sw zero, 0(a4);
.L78:
	srli	a4,a5,8
	andi	a4,a4,12
	lla	a3,.LANCHOR8
	add	a4,a3,a4
	lw	a1,0(a4)
	andi	t2,a5,3
	sw	t2,8(sp)
	sw	a1,0(sp)
	beq	t2,zero,.L83
	srli	a4,a5,2
	andi	a3,a4,0xff
	srli	a3,a3,2
	andi	a2,a3,56
	andi	a4,a4,7
	or	a4,a4,a2
	ori	a4,a4,960
	add	a4,a1,a4
	lbu	a4,0(a4)
	andi	a3,a3,4
	slli	a4,a4,2
	sra	a4,a4,a3
	sw	a4,8(sp)
.L83:
	lw	a4,4(sp)
	lw	t0,20(sp)
	ble	a4,t0,.L84
	lw	a4,32(sp)
	lla	a2,.LANCHOR22
	lw	a3,0(a2)
	slli	a0,a4,8
	lw	a2,4(a2)
	srli	a4,a5,12
	li	t1,4096
	and	t1,a0,t1
	andi	a4,a4,7
	lla	a1,.LANCHOR23
	or	a4,t1,a4
	mv	a0,t0
	lw	a1,0(a1)
	sw	a4,12(sp)
	lla	s0,.LANCHOR21
	mv	ra,a3
	mv	t0,a2
	j	.L89
.L87:
	addi	a5,a5,1
.L88:
	lw	a4,4(sp)
	addi	a0,a0,1
	beq	a4,a0,.L130
	andi	t2,a5,3
.L89:
	li	a4,1
	ble	a0,a4,.L85
	lla	a4,.LANCHOR24
	lbu	t1,0(a4)
	li	a4,8
	slli	a3,a1,3
	sub	a4,a4,t1
	srl	a2,ra,a4
	andi	a2,a2,255
	srl	a4,t0,a4
	or	a3,a3,t1
	andi	a4,a4,255
	lla	t1,.LANCHOR25
	slli	a2,a2,2
	add	a2,t1,a2
	slli	a4,a4,2
	lla	t1,.LANCHOR26
	add	a4,t1,a4
	slli	a3,a3,2
	lla	t1,.LANCHOR27
	lw	a2,0(a2)
	lw	a4,0(a4)
	add	a3,t1,a3
	lw	a3,0(a3)
	or	a4,a2,a4
	addi	s1,s1,8
	or	a4,a4,a3
	andi	a3,a4,255
	slli	a3,a3,1
	add	a3,s0,a3
	lhu	a2,0(a3)
	srli	a3,a4,7
	andi	a3,a3,510
	sh	a2,-8(s1)
	add	a3,s0,a3
	lhu	a2,0(a3)
	srli	a3,a4,15
	andi	a3,a3,510
	sh	a2,-6(s1)
	add	a3,s0,a3
	lhu	a3,0(a3)
	srli	a4,a4,24
	slli	a4,a4,1
	sh	a3,-4(s1)
	add	a4,s0,a4
	lhu	a4,0(a4)
	sh	a4,-2(s1)
.L85:
	lw	a3,0(sp)
	andi	a4,a5,1023
	add	a4,a3,a4
	lbu	a3,0(a4)
	lw	a4,12(sp)
	slli	a3,a3,4
	add	a3,a3,a4
	bne	t2,zero,.L86
	srli	a4,a5,2
	andi	a2,a4,0xff
	srli	a2,a2,2
	andi	t1,a2,56
	andi	a4,a4,7
	or	a4,a4,t1
	lw	t1,0(sp)
	ori	a4,a4,960
	andi	a2,a2,4
	add	a4,t1,a4
	lbu	a4,0(a4)
	slli	a4,a4,2
	sra	a4,a4,a2
	sw	a4,8(sp)
.L86:
	srli	a4,a3,10
	lla	a2,VPage
	slli	a4,a4,2
	add	a4,a2,a4
	lw	a2,0(a4)
	lw	t1,8(sp)
	andi	a4,a5,2
	add	a3,a2,a3
	lbu	t2,0(a3)
	srl	a4,t1,a4
	lbu	t1,8(a3)
	andi	a4,a4,12
	srli	a1,a1,2
	slli	ra,ra,8
	slli	t0,t0,8
	andi	a3,a5,31
	li	a2,31
	or	a1,a4,a1
	or	ra,ra,t2
	or	t0,t0,t1
	bne	a3,a2,.L87
	xori	a5,a5,1055
	srli	a4,a5,8
	andi	a4,a4,12
	lla	a3,.LANCHOR8
	add	a4,a3,a4
	lw	a4,0(a4)
	sw	a4,0(sp)
	j	.L88
.L139:
	li	a5,0
.L92:
	lw	a4,28(sp)
	lw	a1,36(sp)
	slli	a5,a5,3
	la a0, .LANCHOR5; lw a0, 0(a0);
	slli	a2,a4,3
	add	a0,a0,a5
	call	memset
	j	.L91
.L138:
	lw	a5,12(sp)
	andi	a5,a5,2
	bne	a5,zero,.L90
	lw	a3,36(sp)
	slli	a4,a3,16
	slli	a5,a3,8
	or	a5,a5,a4
	or	a5,a5,a3
	slli	a4,a3,24
	or	a5,a5,a4
	la a4, .LANCHOR5; lw a4, 0(a4);
	sw	a5,0(a4)
	lla	a3,.LANCHOR1
	lbu	a3,1(a3)
	sw	a5,4(a4)
	sw	a3,12(sp)
	j	.L90
.L140:
	lla	a5,.LANCHOR1
	lbu	a5,1(a5)
	andi	a5,a5,24
	beq	a5,zero,.L94
	lla	a5,.LANCHOR13
	lw	a4,0(a5)
	li	a2,28672
	li	a5,4096
	and	a3,a4,a2
	add	a5,a4,a5
	beq	a3,a2,.L141
.L97:
	lla	a4,.LANCHOR13
	sw	a5,0(a4)
.L94:
	la a5, .LANCHOR19; sw zero, 0(a5);
	j	.L93
.L141:
	andi	a2,a4,992
	li	a1,928
	xor	a5,a4,a3
	beq	a2,a1,.L142
	li	a1,992
	addi	a5,a5,32
	bne	a2,a1,.L97
	addi	a3,a3,992
	xor	a5,a4,a3
	j	.L97
.L142:
	li	a5,32768
	addi	a5,a5,-1120
	xor	a5,a4,a5
	j	.L97
.L136:
	lla	s0,.LC0
	li	a0,65
.L72:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L72
	lla	s0,.LC7
	li	a0,65
.L73:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L73
	lla	s0,.LC8
	li	a0,32
.L74:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L74
.L66:
	li	a0,1
	call	halt
.L135:
	lla	s0,.LC0
	li	a0,65
.L68:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L68
	lla	s0,.LC5
	li	a0,65
.L69:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L69
	lla	s0,.LC6
	li	a0,32
.L70:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L70
	j	.L66
.L133:
	lla	s0,.LC0
	li	a0,65
.L59:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L59
	lla	s0,.LC1
	li	a0,65
.L60:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L60
	lla	s0,.LC2
	li	a0,32
.L61:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L61
	j	.L66
.L134:
	lla	s0,.LC0
	li	a0,65
.L63:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L63
	lla	s0,.LC3
	li	a0,65
.L64:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L64
	lla	s0,.LC4
	li	a0,32
.L65:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L65
	j	.L66
	.size	_ZL11RefreshLinei, .-_ZL11RefreshLinei
	.globl	__udivsi3
	.section	.text._ZL5A200xj,"ax",@progbits
	.align	2
	.type	_ZL5A200xj, @function
_ZL5A200xj:
	la a5, .LANCHOR11; lw a5, 0(a5);
	bne	a5,zero,.L152
	la a5, .LANCHOR14; lw a5, 0(a5);
	beq	a5,zero,.L152
	la a4, timestamp; lw a4, 0(a4);
	slli	a5,a4,1
	add	a5,a5,a4
	addi	sp,sp,-12
	la a4, .LANCHOR28; lw a4, 0(a4);
	slli	a5,a5,4
	sub	a5,a5,a4
	sw	ra,8(sp)
	la a4, PAL; lbu a4, 0(a4);
	srli	a0,a5,4
	beq	a4,zero,.L146
	li	a1,15
	mv	a0,a5
	call	__udivsi3
.L146:
	call	_ZL11RefreshLinei
	lw	ra,8(sp)
	la a0, .LANCHOR0; lbu a0, 0(a0);
	addi	sp,sp,12
	jr	ra
.L152:
	la a0, .LANCHOR0; lbu a0, 0(a0);
	ret
	.size	_ZL5A200xj, .-_ZL5A200xj
	.section	.text._ZL5A2002j,"ax",@progbits
	.align	2
	.type	_ZL5A2002j, @function
_ZL5A2002j:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a5, .LANCHOR11; lw a5, 0(a5);
	bne	a5,zero,.L156
	la a5, .LANCHOR14; lw a5, 0(a5);
	beq	a5,zero,.L156
	la a4, timestamp; lw a4, 0(a4);
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,4
	la a4, .LANCHOR28; lw a4, 0(a4);
	sub	a5,a5,a4
	la a4, PAL; lbu a4, 0(a4);
	srli	a0,a5,4
	beq	a4,zero,.L158
	li	a1,15
	mv	a0,a5
	call	__udivsi3
.L158:
	call	_ZL11RefreshLinei
.L156:
	lla	a4,.LANCHOR0
	lbu	a0,0(a4)
	lla	a3,.LANCHOR1
	lbu	a5,2(a3)
	andi	a0,a0,31
	la a2, .LANCHOR29; sb zero, 0(a2);
	or	a0,a5,a0
	andi	a5,a5,127
	sb	a5,2(a3)
	sb	a0,0(a4)
	lw	ra,8(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL5A2002j, .-_ZL5A2002j
	.section	.text._ZL7ResetRLPh,"ax",@progbits
	.align	2
	.type	_ZL7ResetRLPh, @function
_ZL7ResetRLPh:
	addi	sp,sp,-12
	li	a2,256
	li	a1,255
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	memset
	la a4, timestamp; lw a4, 0(a4);
	slli	a5,a4,1
	add	a5,a5,a4
	la a0, X+16; lw a0, 0(a0);
	slli	a5,a5,4
	add	a5,a5,a0
	la a4, .LANCHOR28; sw a5, 0(a4);
	la a5, .LANCHOR19; sw zero, 0(a5);
	la a4, .LANCHOR5; sw s0, 0(a4);
	la a4, .LANCHOR14; sw s0, 0(a4);
	la a4, .LANCHOR15; sw zero, 0(a4);
	la a5, .LANCHOR11; lw a5, 0(a5);
	bne	a5,zero,.L165
	beq	s0,zero,.L165
	neg	a5,a0
	la a4, PAL; lbu a4, 0(a4);
	srli	a0,a5,4
	beq	a4,zero,.L167
	li	a1,15
	mv	a0,a5
	call	__udivsi3
.L167:
	call	_ZL11RefreshLinei
.L165:
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a5,1
	la a4, .LANCHOR19; sw a5, 0(a4);
	addi	sp,sp,12
	jr	ra
	.size	_ZL7ResetRLPh, .-_ZL7ResetRLPh
	.section	.text._ZL5B2001jh,"ax",@progbits
	.align	2
	.type	_ZL5B2001jh, @function
_ZL5B2001jh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	la a5, .LANCHOR11; lw a5, 0(a5);
	mv	s0,a1
	bne	a5,zero,.L174
	la a5, .LANCHOR14; lw a5, 0(a5);
	beq	a5,zero,.L174
	la a4, timestamp; lw a4, 0(a4);
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,4
	la a4, .LANCHOR28; lw a4, 0(a4);
	sub	a5,a5,a4
	la a4, PAL; lbu a4, 0(a4);
	srli	a0,a5,4
	beq	a4,zero,.L176
	li	a1,15
	mv	a0,a5
	call	__udivsi3
.L176:
	call	_ZL11RefreshLinei
.L174:
	la a5, paldeemphswap; lbu a5, 0(a5);
	beq	a5,zero,.L177
	srli	a5,s0,1
	andi	a4,s0,-97
	andi	a5,a5,32
	slli	s0,s0,1
	or	a5,a5,a4
	andi	s0,s0,64
	or	s0,a5,s0
.L177:
	la a5, .LANCHOR0; sb s0, 0(a5);
	la a5, .LANCHOR1+1; sb s0, 0(a5);
	andi	a5,s0,224
	beq	a5,zero,.L173
	srli	s0,s0,5
	la a5, .LANCHOR30; sb s0, 0(a5);
.L173:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL5B2001jh, .-_ZL5B2001jh
	.section	.text._Z19newppu_get_scanlinev,"ax",@progbits
	.align	2
	.globl	_Z19newppu_get_scanlinev
	.hidden	_Z19newppu_get_scanlinev
	.type	_Z19newppu_get_scanlinev, @function
_Z19newppu_get_scanlinev:
	la a0, .LANCHOR31+52; lw a0, 0(a0);
	ret
	.size	_Z19newppu_get_scanlinev, .-_Z19newppu_get_scanlinev
	.section	.text._Z14newppu_get_dotv,"ax",@progbits
	.align	2
	.globl	_Z14newppu_get_dotv
	.hidden	_Z14newppu_get_dotv
	.type	_Z14newppu_get_dotv, @function
_Z14newppu_get_dotv:
	la a0, .LANCHOR31+56; lw a0, 0(a0);
	ret
	.size	_Z14newppu_get_dotv, .-_Z14newppu_get_dotv
	.section	.text._Z28newppu_hacky_emergency_resetv,"ax",@progbits
	.align	2
	.globl	_Z28newppu_hacky_emergency_resetv
	.hidden	_Z28newppu_hacky_emergency_resetv
	.type	_Z28newppu_hacky_emergency_resetv, @function
_Z28newppu_hacky_emergency_resetv:
	lla	a5,.LANCHOR31
	lw	a4,60(a5)
	bne	a4,zero,.L192
	la a4, .LANCHOR31+16; sw zero, 0(a4);
	la a4, .LANCHOR31+12; sw zero, 0(a4);
	la a4, .LANCHOR31+8; sw zero, 0(a4);
	la a4, .LANCHOR31+4; sw zero, 0(a4);
	la a4, .LANCHOR31; sw zero, 0(a4);
	la a4, .LANCHOR31+44; sw zero, 0(a4);
	la a4, .LANCHOR31+48; sw zero, 0(a4);
	la a4, .LANCHOR31+40; sw zero, 0(a4);
	la a4, .LANCHOR31+36; sw zero, 0(a4);
	la a4, .LANCHOR31+32; sw zero, 0(a4);
	la a4, .LANCHOR31+28; sw zero, 0(a4);
	la a4, .LANCHOR31+24; sw zero, 0(a4);
	la a4, .LANCHOR31+20; sw zero, 0(a4);
	la a4, .LANCHOR31+56; sw zero, 0(a4);
	li	a4,341
	sw	a4,60(a5)
	li	a4,241
	sw	a4,52(a5)
.L192:
	ret
	.size	_Z28newppu_hacky_emergency_resetv, .-_Z28newppu_hacky_emergency_resetv
	.section	.text._Z19READPAL_MOTHEROFALLj,"ax",@progbits
	.align	2
	.globl	_Z19READPAL_MOTHEROFALLj
	.hidden	_Z19READPAL_MOTHEROFALLj
	.type	_Z19READPAL_MOTHEROFALLj, @function
_Z19READPAL_MOTHEROFALLj:
	la a5, .LANCHOR1+1; lbu a5, 0(a5);
	andi	a4,a0,3
	andi	a5,a5,1
	bne	a4,zero,.L195
	andi	a4,a0,12
	bne	a4,zero,.L196
	la a0, .LANCHOR9; lbu a0, 0(a0);
	beq	a5,zero,.L198
	andi	a0,a0,48
.L198:
	ret
.L196:
	srli	a0,a0,2
	andi	a0,a0,3
	lla	a4,.LANCHOR10
	add	a4,a4,a0
	lbu	a0,-1(a4)
	beq	a5,zero,.L198
	andi	a0,a0,48
	j	.L198
.L195:
	andi	a0,a0,31
	lla	a4,.LANCHOR9
	add	a4,a4,a0
	lbu	a0,0(a4)
	beq	a5,zero,.L198
	andi	a0,a0,48
	j	.L198
	.size	_Z19READPAL_MOTHEROFALLj, .-_Z19READPAL_MOTHEROFALLj
	.section	.text._Z14FCEUPPU_GetCHRjj,"ax",@progbits
	.align	2
	.globl	_Z14FCEUPPU_GetCHRjj
	.hidden	_Z14FCEUPPU_GetCHRjj
	.type	_Z14FCEUPPU_GetCHRjj, @function
_Z14FCEUPPU_GetCHRjj:
	la a5, .LANCHOR17; lw a5, 0(a5);
	beq	a5,zero,.L212
	la a3, .LANCHOR32; lbu a3, 0(a3);
	li	a5,1
	beq	a3,a5,.L215
	tail	_Z13MMC5BGVRAMADRj
.L215:
	andi	a1,a1,1023
	la a5, .LANCHOR34; lw a5, 0(a5);
	add	a5,a5,a1
	lbu	a5,0(a5)
	la a3, .LANCHOR35; lw a3, 0(a3);
	la a4, .LANCHOR36; lbu a4, 0(a4);
	and	a5,a5,a3
	slli	a5,a5,12
	li	a3,258048
	slli	a0,a0,20
	and	a5,a5,a3
	srli	a0,a0,20
	li	a3,786432
	slli	a4,a4,18
	or	a5,a5,a0
	and	a4,a4,a3
	add	a5,a5,a4
	la a0, .LANCHOR33; lw a0, 0(a0);
	add	a0,a0,a5
	ret
.L212:
	srli	a3,a0,10
	slli	a3,a3,2
	lla	a5,VPage
	add	a5,a5,a3
	lw	a5,0(a5)
	add	a0,a5,a0
	ret
	.size	_Z14FCEUPPU_GetCHRjj, .-_Z14FCEUPPU_GetCHRjj
	.section	.text._Z15FCEUPPU_GetAttriii,"ax",@progbits
	.align	2
	.globl	_Z15FCEUPPU_GetAttriii
	.hidden	_Z15FCEUPPU_GetAttriii
	.type	_Z15FCEUPPU_GetAttriii, @function
_Z15FCEUPPU_GetAttriii:
	srai	a5,a2,2
	slli	a5,a5,3
	slli	a4,a2,1
	addi	a5,a5,960
	srai	t0,a1,2
	andi	a4,a4,4
	andi	t1,a1,2
	la a3, .LANCHOR17; lw a3, 0(a3);
	add	a5,a5,t0
	or	a4,a4,t1
	beq	a3,zero,.L217
	la t1, .LANCHOR32; lbu t1, 0(t1);
	li	a3,1
	beq	t1,a3,.L222
.L217:
	slli	a0,a0,2
	lla	a3,.LANCHOR8
	add	a3,a3,a0
	lw	a2,0(a3)
	li	a3,3
	sll	a3,a3,a4
	add	a5,a2,a5
	lbu	a0,0(a5)
	and	a0,a0,a3
	sra	a0,a0,a4
	ret
.L222:
	slli	a2,a2,5
	add	a1,a2,a1
	andi	a2,a1,1023
	la a5, .LANCHOR34; lw a5, 0(a5);
	add	a5,a5,a2
	lbu	a0,0(a5)
	srli	a0,a0,6
	ret
	.size	_Z15FCEUPPU_GetAttriii, .-_Z15FCEUPPU_GetAttriii
	.section	.text._Z23FFCEUX_PPUWrite_Defaultjh,"axG",@progbits,_Z23FFCEUX_PPUWrite_Defaultjh,comdat
	.align	2
	.weak	_Z23FFCEUX_PPUWrite_Defaultjh
	.hidden	_Z23FFCEUX_PPUWrite_Defaultjh
	.type	_Z23FFCEUX_PPUWrite_Defaultjh, @function
_Z23FFCEUX_PPUWrite_Defaultjh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	la a5, .LANCHOR7; lw a5, 0(a5);
	mv	s0,a0
	mv	s1,a1
	beq	a5,zero,.L224
	jalr	a5
.L224:
	li	a5,8192
	bgeu	s0,a5,.L225
	srli	a4,s0,10
	la a5, .LANCHOR37; lbu a5, 0(a5);
	sra	a5,a5,a4
	andi	a5,a5,1
	beq	a5,zero,.L223
	slli	a4,a4,2
	lla	a5,VPage
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,s0
	sb	s1,0(a5)
.L223:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L225:
	li	a5,16384
	addi	a5,a5,-257
	bgtu	s0,a5,.L227
	srli	a5,s0,10
	la a4, .LANCHOR18; lw a4, 0(a4);
	andi	a5,a5,3
	beq	a4,zero,.L228
	la a4, .LANCHOR38; lbu a4, 0(a4);
	andi	a3,a4,1
	beq	a3,zero,.L228
	srli	a4,a4,1
	srl	a5,a5,a4
	slli	a5,a5,10
	andi	a5,a5,1024
	andi	s0,s0,1023
	or	a5,a5,s0
	lla	a4,QTAINTRAM
	add	a5,a4,a5
	sb	s1,0(a5)
	j	.L223
.L227:
	andi	a5,s0,3
	andi	s1,s1,63
	bne	a5,zero,.L229
	andi	a5,s0,12
	bne	a5,zero,.L230
	lla	a5,.LANCHOR9
	sb	s1,12(a5)
	sb	s1,8(a5)
	sb	s1,4(a5)
	sb	s1,0(a5)
	sb	s1,28(a5)
	sb	s1,24(a5)
	sb	s1,20(a5)
	sb	s1,16(a5)
	li	a5,1
	la a4, .LANCHOR20; sw a5, 0(a4);
	j	.L223
.L228:
	la a4, .LANCHOR39; lbu a4, 0(a4);
	sra	a4,a4,a5
	andi	a4,a4,1
	beq	a4,zero,.L223
	slli	a5,a5,2
	lla	a4,.LANCHOR8
	add	a5,a4,a5
	lw	a5,0(a5)
	andi	s0,s0,1023
	add	a5,a5,s0
	sb	s1,0(a5)
	j	.L223
.L229:
	andi	s0,s0,31
	lla	a5,.LANCHOR9
	add	a5,a5,s0
	sb	s1,0(a5)
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a5,1
	la a4, .LANCHOR20; sw a5, 0(a4);
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L230:
	srli	s0,s0,2
	andi	s0,s0,3
	lla	a5,.LANCHOR10
	add	a5,a5,s0
	sb	s1,-1(a5)
	j	.L223
	.size	_Z23FFCEUX_PPUWrite_Defaultjh, .-_Z23FFCEUX_PPUWrite_Defaultjh
	.section	.text._ZL5B2007jh,"ax",@progbits
	.align	2
	.type	_ZL5B2007jh, @function
_ZL5B2007jh:
	addi	sp,sp,-12
	sw	s1,0(sp)
	sw	ra,8(sp)
	lla	s1,.LANCHOR13
	sw	s0,4(sp)
	la a5, .LANCHOR11; lw a5, 0(a5);
	lw	a3,0(s1)
	mv	a4,a1
	beq	a5,zero,.L248
	lla	s0,.LANCHOR31
	lw	a5,4(s0)
	lw	a2,8(s0)
	lw	t1,16(s0)
	lw	a3,12(s0)
	lw	a0,0(s0)
	slli	a5,a5,11
	slli	a2,a2,10
	or	a5,a5,a2
	or	a5,a5,t1
	slli	a3,a3,5
	or	a5,a5,a3
	slli	a0,a0,12
	or	a0,a0,a5
	slli	a0,a0,18
	srli	a0,a0,18
	la a5, .LANCHOR0; sb a1, 0(a5);
	sw	a0,0(s1)
	la a5, .LANCHOR40; lw a5, 0(a5);
	beq	a5,zero,.L249
	jalr	a5
.L250:
	lw	a4,52(s0)
	li	a5,240
	lw	a1,12(s0)
	lw	a0,4(s0)
	lw	t1,0(s0)
	bleu	a4,a5,.L288
	lla	a5,.LANCHOR1
.L251:
	lbu	a4,0(a5)
	lw	a2,16(s0)
	addi	a5,a1,1
	andi	a4,a4,4
	beq	a4,zero,.L291
.L257:
	lw	a4,8(s0)
	srli	a3,a5,5
	andi	a1,a5,31
	add	a3,a3,a4
	srli	a5,a3,1
	add	a5,a5,a0
	srli	a4,a5,1
	add	a4,a4,t1
	andi	a2,a2,31
	andi	a3,a3,1
	andi	a5,a5,1
	andi	a4,a4,7
	sw	a1,12(s0)
	sw	a2,16(s0)
	sw	a3,8(s0)
	sw	a5,4(s0)
	sw	a4,0(s0)
	slli	a1,a1,5
.L256:
	slli	a5,a5,11
	or	a2,a2,a1
	slli	a3,a3,10
	or	a5,a5,a2
	or	a5,a5,a3
	slli	a4,a4,12
	li	a3,12288
	and	a4,a4,a3
	or	a5,a5,a4
	sw	a5,0(s1)
.L247:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L248:
	la a2, .LANCHOR0; sb a4, 0(a2);
	li	a1,16384
	li	a2,8192
	addi	a5,a1,-1
	and	a2,a3,a2
	and	a5,a3,a5
	bne	a2,zero,.L259
	srli	a1,a5,10
	la a2, .LANCHOR37; lbu a2, 0(a2);
	sra	a2,a2,a1
	andi	a2,a2,1
	bne	a2,zero,.L292
.L260:
	la a5, .LANCHOR1; lbu a5, 0(a5);
	andi	a5,a5,4
	addi	a0,a3,1
	beq	a5,zero,.L266
	addi	a0,a3,32
.L266:
	sw	a0,0(s1)
	la a5, .LANCHOR7; lw a5, 0(a5);
	beq	a5,zero,.L247
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	slli	a0,a0,18
	srli	a0,a0,18
	addi	sp,sp,12
	jr	a5
.L259:
	addi	a1,a1,-257
	bgtu	a5,a1,.L261
	srli	a5,a5,10
	la a2, .LANCHOR18; lw a2, 0(a2);
	andi	a5,a5,3
	beq	a2,zero,.L262
	la a2, .LANCHOR38; lbu a2, 0(a2);
	andi	a1,a2,1
	beq	a1,zero,.L262
	srli	a2,a2,1
	srl	a5,a5,a2
	slli	a5,a5,10
	andi	a2,a3,1023
	andi	a5,a5,1024
	or	a5,a5,a2
	lla	a2,QTAINTRAM
	add	a5,a2,a5
	sb	a4,0(a5)
	j	.L260
.L288:
	lla	a5,.LANCHOR1
	lbu	a4,1(a5)
	andi	a4,a4,24
	beq	a4,zero,.L251
	addi	t1,t1,1
	srli	a5,t1,3
	add	a1,a5,a1
	andi	a1,a1,31
	sw	a1,12(s0)
	li	a4,30
	beq	a1,a4,.L252
	slli	a1,a1,5
.L253:
	andi	a4,t1,7
	andi	a5,a0,1
	lw	a3,8(s0)
	lw	a2,16(s0)
	sw	a4,0(s0)
	sw	a5,4(s0)
	j	.L256
.L291:
	addi	a2,a2,1
	srli	a5,a2,5
	andi	a5,a5,1
	add	a5,a5,a1
	j	.L257
.L292:
	slli	a1,a1,2
	lla	a3,VPage
	add	a3,a3,a1
	lw	a3,0(a3)
	add	a5,a3,a5
	sb	a4,0(a5)
	lw	a3,0(s1)
	j	.L260
.L261:
	andi	a2,a3,3
	andi	a4,a4,63
	bne	a2,zero,.L263
	andi	a2,a3,12
	bne	a2,zero,.L264
	lla	a5,.LANCHOR9
	sb	a4,12(a5)
	sb	a4,8(a5)
	sb	a4,4(a5)
	sb	a4,0(a5)
	li	a5,1
	la a4, .LANCHOR20; sw a5, 0(a4);
	j	.L260
.L249:
	call	_Z23FFCEUX_PPUWrite_Defaultjh
	j	.L250
.L262:
	la a2, .LANCHOR39; lbu a2, 0(a2);
	sra	a2,a2,a5
	andi	a2,a2,1
	beq	a2,zero,.L260
	slli	a5,a5,2
	lla	a2,.LANCHOR8
	add	a5,a2,a5
	lw	a5,0(a5)
	andi	a3,a3,1023
	add	a5,a5,a3
	sb	a4,0(a5)
	lw	a3,0(s1)
	j	.L260
.L263:
	andi	a2,a3,31
	lla	a5,.LANCHOR9
	add	a5,a5,a2
	sb	a4,0(a5)
	li	a5,1
	la a4, .LANCHOR20; sw a5, 0(a4);
	j	.L260
.L264:
	srli	a5,a5,2
	andi	a5,a5,3
	lla	a2,.LANCHOR10
	add	a5,a2,a5
	sb	a4,-1(a5)
	j	.L260
.L252:
	li	a4,1
	li	a1,960
	bne	a5,a4,.L253
	addi	a0,a0,1
	la a5, .LANCHOR31+12; sw zero, 0(a5);
	li	a1,0
	j	.L253
	.size	_ZL5B2007jh, .-_ZL5B2007jh
	.section	.text._Z13GetCHRAddressi,"ax",@progbits
	.align	2
	.globl	_Z13GetCHRAddressi
	.hidden	_Z13GetCHRAddressi
	.type	_Z13GetCHRAddressi, @function
_Z13GetCHRAddressi:
	la a5, .LANCHOR41; lw a5, 0(a5);
	beq	a5,zero,.L294
	srai	a3,a0,10
	slli	a3,a3,2
	lla	a4,VPage
	add	a4,a4,a3
	lw	a4,0(a4)
	add	a4,a4,a0
	la a0, CHRptr; lw a0, 0(a0);
	sub	a0,a4,a0
	blt	a0,zero,.L296
	bge	a0,a5,.L296
.L293:
	ret
.L294:
	li	a5,8192
	blt	a0,a5,.L293
.L296:
	li	a0,-1
	ret
	.size	_Z13GetCHRAddressi, .-_Z13GetCHRAddressi
	.section	.text._Z12GetCHROffsetPh,"ax",@progbits
	.align	2
	.globl	_Z12GetCHROffsetPh
	.hidden	_Z12GetCHROffsetPh
	.type	_Z12GetCHROffsetPh, @function
_Z12GetCHROffsetPh:
	la a4, CHRptr; lw a4, 0(a4);
	la a5, .LANCHOR41; lw a5, 0(a5);
	sub	a0,a0,a4
	beq	a5,zero,.L301
	blt	a0,zero,.L303
	ble	a5,a0,.L303
.L300:
	ret
.L301:
	li	a5,8192
	bltu	a0,a5,.L300
.L303:
	li	a0,-1
	ret
	.size	_Z12GetCHROffsetPh, .-_Z12GetCHROffsetPh
	.section	.text._Z13ppu_getScrollRiS_,"ax",@progbits
	.align	2
	.globl	_Z13ppu_getScrollRiS_
	.hidden	_Z13ppu_getScrollRiS_
	.type	_Z13ppu_getScrollRiS_, @function
_Z13ppu_getScrollRiS_:
	la a5, .LANCHOR11; lw a5, 0(a5);
	beq	a5,zero,.L305
	lla	a4,.LANCHOR31
	lw	a5,24(a4)
	lw	a2,32(a4)
	lw	a3,20(a4)
	slli	a5,a5,5
	add	a5,a5,a2
	slli	a5,a5,3
	add	a5,a5,a3
	sw	a5,0(a1)
	lw	a5,28(a4)
	lw	a3,36(a4)
	lw	a4,40(a4)
	slli	a5,a5,5
	add	a5,a5,a3
	slli	a5,a5,3
	add	a5,a5,a4
	sw	a5,0(a0)
	ret
.L305:
	lla	a3,.LANCHOR13
	lw	a4,0(a3)
	la a2, .LANCHOR24; lbu a2, 0(a2);
	srli	a5,a4,2
	slli	a4,a4,3
	andi	a4,a4,255
	andi	a5,a5,256
	or	a5,a5,a4
	or	a5,a5,a2
	sw	a5,0(a0)
	lw	a4,0(a3)
	srli	a5,a4,2
	srli	a4,a4,12
	andi	a4,a4,7
	andi	a5,a5,248
	or	a5,a5,a4
	sw	a5,0(a1)
	lw	a4,0(a3)
	srli	a4,a4,11
	andi	a4,a4,1
	beq	a4,zero,.L304
	addi	a5,a5,240
	sw	a5,0(a1)
.L304:
	ret
	.size	_Z13ppu_getScrollRiS_, .-_Z13ppu_getScrollRiS_
	.section	.text._Z18FCEUPPU_LineUpdatev,"ax",@progbits
	.align	2
	.globl	_Z18FCEUPPU_LineUpdatev
	.hidden	_Z18FCEUPPU_LineUpdatev
	.type	_Z18FCEUPPU_LineUpdatev, @function
_Z18FCEUPPU_LineUpdatev:
	la a5, .LANCHOR11; lw a5, 0(a5);
	bne	a5,zero,.L310
	la a5, .LANCHOR14; lw a5, 0(a5);
	beq	a5,zero,.L310
	la a4, timestamp; lw a4, 0(a4);
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,4
	la a4, .LANCHOR28; lw a4, 0(a4);
	sub	a5,a5,a4
	la a4, PAL; lbu a4, 0(a4);
	srli	a0,a5,4
	beq	a4,zero,.L319
	addi	sp,sp,-12
	li	a1,15
	mv	a0,a5
	sw	ra,8(sp)
	call	__udivsi3
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL11RefreshLinei
.L310:
	ret
.L319:
	tail	_ZL11RefreshLinei
	.size	_Z18FCEUPPU_LineUpdatev, .-_Z18FCEUPPU_LineUpdatev
	.section	.text._ZL5A2007j,"ax",@progbits
	.align	2
	.type	_ZL5A2007j, @function
_ZL5A2007j:
	addi	sp,sp,-28
	sw	s0,20(sp)
	sw	s1,16(sp)
	lla	s0,.LANCHOR11
	lla	s1,.LANCHOR13
	lw	a3,0(s1)
	lw	a5,0(s0)
	li	a4,16384
	addi	a0,a4,-1
	sw	ra,24(sp)
	and	a2,a3,a0
	beq	a5,zero,.L323
	lla	s0,.LANCHOR31
	lw	a5,4(s0)
	lw	t2,8(s0)
	lw	t0,16(s0)
	lw	t1,12(s0)
	slli	t2,t2,10
	lw	a1,0(s0)
	slli	a5,a5,11
	or	a5,a5,t2
	slli	t1,t1,5
	or	a5,a5,t0
	or	a5,a5,t1
	slli	a1,a1,12
	li	t1,12288
	and	a1,a1,t1
	or	a5,a5,a1
	and	a0,a5,a0
	addi	a1,a4,-256
	lla	t1,.LANCHOR42
	sw	a0,0(s1)
	and	a5,a5,a1
	lbu	a4,0(t1)
	la t2, .LANCHOR43; lw t2, 0(t2);
	beq	a5,a1,.L402
	sw	t1,4(sp)
	sw	a4,0(sp)
	jalr	t2
	lw	t1,4(sp)
	lw	a4,0(sp)
	lla	a1,.LANCHOR1
.L331:
	lw	t0,52(s0)
	sb	a0,0(t1)
	li	a3,240
	lw	a2,12(s0)
	lw	a5,4(s0)
	lw	t1,0(s0)
	bgtu	t0,a3,.L332
	lbu	a3,1(a1)
	andi	a3,a3,24
	bne	a3,zero,.L403
.L332:
	lbu	a3,0(a1)
	lw	a0,16(s0)
	addi	a1,a2,1
	andi	a3,a3,4
	bne	a3,zero,.L338
	addi	a0,a0,1
	srli	a1,a0,5
	andi	a1,a1,1
	add	a1,a1,a2
.L338:
	lw	a3,8(s0)
	srli	a2,a1,5
	andi	a0,a0,31
	add	a2,a2,a3
	srli	a3,a2,1
	add	a5,a3,a5
	srli	a3,a5,1
	add	a3,a3,t1
	andi	a1,a1,31
	andi	a2,a2,1
	andi	a5,a5,1
	andi	a3,a3,7
	sw	a1,12(s0)
	sw	a0,16(s0)
	sw	a2,8(s0)
	sw	a5,4(s0)
	sw	a3,0(s0)
	slli	a1,a1,5
.L337:
	slli	a5,a5,11
	or	a1,a1,a0
	slli	a2,a2,10
	or	a5,a5,a1
	or	a5,a5,a2
	slli	a3,a3,12
	li	a2,12288
	and	a3,a3,a2
	or	a5,a5,a3
	sw	a5,0(s1)
.L339:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	mv	a0,a4
	addi	sp,sp,28
	jr	ra
.L402:
	lla	a1,.LANCHOR1
	lbu	a5,1(a1)
	andi	a4,a3,3
	andi	a5,a5,1
	bne	a4,zero,.L325
	andi	a3,a3,12
	bne	a3,zero,.L326
	la a4, .LANCHOR9; lbu a4, 0(a4);
	beq	a5,zero,.L328
	andi	a4,a4,48
.L328:
	li	a5,-4096
	add	a0,a0,a5
	sw	a1,8(sp)
	sw	t1,4(sp)
	sw	a4,0(sp)
	jalr	t2
	lw	a4,0(sp)
	lw	t1,4(sp)
	lw	a1,8(sp)
	j	.L331
.L323:
	sw	a2,4(sp)
	sw	a3,0(sp)
	call	_Z18FCEUPPU_LineUpdatev
	lw	a2,4(sp)
	li	a4,16384
	addi	a4,a4,-257
	lw	a3,0(sp)
	bgtu	a2,a4,.L404
	lla	t1,.LANCHOR42
	lla	a5,.LANCHOR7
	lbu	a4,0(t1)
	lw	t2,0(a5)
	mv	a1,a4
	beq	t2,zero,.L348
	mv	a0,a2
	sw	t1,12(sp)
	sw	a4,8(sp)
	sw	a3,4(sp)
	sw	a2,0(sp)
	jalr	t2
	lw	t1,12(sp)
	lw	a4,8(sp)
	lw	a3,4(sp)
	lbu	a1,0(t1)
	lw	a2,0(sp)
	lla	a5,.LANCHOR7
.L348:
	la a0, .LANCHOR0; sb a1, 0(a0);
	li	a1,8192
	and	a1,a3,a1
	bne	a1,zero,.L349
	la a3, .LANCHOR17; lw a3, 0(a3);
	bne	a3,zero,.L405
.L350:
	srli	a1,a2,10
	slli	a1,a1,2
	lla	a3,VPage
	add	a3,a3,a1
	lw	a3,0(a3)
	lw	a5,0(a5)
	lla	a1,.LANCHOR1
	add	a3,a3,a2
	lbu	a3,0(a3)
	sb	a3,0(t1)
.L347:
	lbu	a3,1(a1)
	lw	a2,0(s1)
	andi	a3,a3,24
	beq	a3,zero,.L351
.L407:
	la a0, .LANCHOR44; lw a0, 0(a0);
	li	a3,239
	bgt	a0,a3,.L351
	li	a3,28672
	li	a0,4096
	and	a1,a2,a3
	add	a0,a2,a0
	beq	a1,a3,.L406
.L356:
	sw	a0,0(s1)
	beq	a5,zero,.L339
	slli	a0,a0,18
	srli	a0,a0,18
	sw	a4,0(sp)
	jalr	a5
	lw	a4,0(sp)
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	mv	a0,a4
	addi	sp,sp,28
	jr	ra
.L403:
	addi	t1,t1,1
	srli	a3,t1,3
	add	a1,a3,a2
	andi	a1,a1,31
	sw	a1,12(s0)
	li	a2,30
	beq	a1,a2,.L333
	slli	a1,a1,5
.L334:
	andi	a3,t1,7
	andi	a5,a5,1
	lw	a2,8(s0)
	lw	a0,16(s0)
	sw	a3,0(s0)
	sw	a5,4(s0)
	j	.L337
.L404:
	lla	a1,.LANCHOR1
	lbu	a4,1(a1)
	andi	a5,a3,3
	andi	a0,a4,1
	bne	a5,zero,.L341
	andi	a5,a3,12
	bne	a5,zero,.L342
	la a4, .LANCHOR9; lbu a4, 0(a4);
	bne	a0,zero,.L401
.L344:
	andi	a3,a3,1023
	la a5, .LANCHOR8+12; lw a5, 0(a5);
	add	a5,a5,a3
	lbu	a3,0(a5)
	lla	s0,.LANCHOR7
	lw	a5,0(s0)
	la a0, .LANCHOR42; sb a3, 0(a0);
	beq	a5,zero,.L347
	mv	a0,a2
	sw	a1,4(sp)
	sw	a4,0(sp)
	jalr	a5
	lw	a1,4(sp)
	lw	a5,0(s0)
	lw	a4,0(sp)
	lbu	a3,1(a1)
	lw	a2,0(s1)
	andi	a3,a3,24
	bne	a3,zero,.L407
.L351:
	lbu	a3,0(a1)
	addi	a0,a2,1
	andi	a3,a3,4
	beq	a3,zero,.L356
	addi	a0,a2,32
	j	.L356
.L325:
	andi	a3,a3,31
	lla	a4,.LANCHOR9
	add	a4,a4,a3
	lbu	a4,0(a4)
	beq	a5,zero,.L328
	andi	a4,a4,48
	j	.L328
.L349:
	srli	a2,a2,8
	lla	a1,.LANCHOR8
	andi	a2,a2,12
	add	a2,a1,a2
	lw	a2,0(a2)
	andi	a3,a3,1023
	lw	a5,0(a5)
	add	a3,a2,a3
	lbu	a3,0(a3)
	lla	a1,.LANCHOR1
	sb	a3,0(t1)
	j	.L347
.L341:
	andi	a4,a3,31
	lla	a5,.LANCHOR9
	add	a5,a5,a4
	lbu	a4,0(a5)
	beq	a0,zero,.L344
.L401:
	andi	a4,a4,48
	j	.L344
.L326:
	srli	a2,a2,2
	andi	a2,a2,3
	lla	a4,.LANCHOR10
	add	a4,a4,a2
	lbu	a4,-1(a4)
	beq	a5,zero,.L328
	andi	a4,a4,48
	j	.L328
.L342:
	srli	a4,a2,2
	andi	a4,a4,3
	lla	a5,.LANCHOR10
	add	a5,a5,a4
	lbu	a4,-1(a5)
	beq	a0,zero,.L344
	andi	a4,a4,48
	j	.L344
.L405:
	lw	a3,0(s0)
	beq	a3,zero,.L350
	mv	a0,a2
	sw	t1,4(sp)
	sw	a4,0(sp)
	call	_Z13MMC5BGVRAMADRj
	lbu	a3,0(a0)
	lw	t1,4(sp)
	lla	a5,.LANCHOR7
	lw	a5,0(a5)
	lw	a4,0(sp)
	lla	a1,.LANCHOR1
	sb	a3,0(t1)
	j	.L347
.L333:
	li	a2,1
	li	a1,960
	bne	a3,a2,.L334
	addi	a5,a5,1
	la a3, .LANCHOR31+12; sw zero, 0(a3);
	li	a1,0
	j	.L334
.L406:
	andi	a3,a2,992
	li	t1,928
	xor	a0,a2,a1
	beq	a3,t1,.L408
	li	t1,992
	addi	a0,a0,32
	bne	a3,t1,.L356
	addi	a1,a1,992
	xor	a0,a2,a1
	j	.L356
.L408:
	li	a0,32768
	addi	a0,a0,-1120
	xor	a0,a2,a0
	j	.L356
	.size	_ZL5A2007j, .-_ZL5A2007j
	.section	.text._ZL5B2006jh,"ax",@progbits
	.align	2
	.type	_ZL5B2006jh, @function
_ZL5B2006jh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a1
	sw	ra,8(sp)
	lla	s1,.LANCHOR29
	call	_Z18FCEUPPU_LineUpdatev
	lbu	a4,0(s1)
	la a5, .LANCHOR0; sb s0, 0(a5);
	bne	a4,zero,.L410
	lla	a5,.LANCHOR31
	li	a1,16384
	lw	t1,32(a5)
	lla	t0,.LANCHOR45
	slli	a2,s0,8
	addi	a1,a1,-256
	lbu	t2,0(t0)
	slli	a3,s0,3
	and	a2,a2,a1
	srli	a0,s0,2
	srli	a1,s0,3
	srli	s0,s0,4
	andi	s0,s0,3
	lw	ra,8(sp)
	sw	s0,20(a5)
	andi	t1,t1,7
	lw	s0,4(sp)
	andi	a3,a3,24
	or	a2,t2,a2
	or	a3,t1,a3
	andi	a0,a0,1
	andi	a1,a1,1
	xori	a4,a4,1
	sb	a4,0(s1)
	sw	a2,0(t0)
	sw	a3,32(a5)
	sw	a0,28(a5)
	sw	a1,24(a5)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L410:
	lla	a3,.LANCHOR45
	lw	a0,0(a3)
	li	a5,65536
	addi	a5,a5,-256
	and	a0,a0,a5
	or	a0,a0,s0
	la a5, .LANCHOR13; sw a0, 0(a5);
	li	a5,1
	sw	a0,0(a3)
	la a3, .LANCHOR46; sw a5, 0(a3);
	la a5, .LANCHOR7; lw a5, 0(a5);
	beq	a5,zero,.L412
	jalr	a5
	lbu	a4,0(s1)
.L412:
	lla	a5,.LANCHOR31
	lw	a3,32(a5)
	lw	a0,20(a5)
	lw	a1,24(a5)
	lw	a2,28(a5)
	srli	t1,s0,5
	andi	s0,s0,31
	lw	ra,8(sp)
	sw	s0,36(a5)
	sw	s0,16(a5)
	andi	a3,a3,24
	lw	s0,4(sp)
	or	a3,a3,t1
	xori	a4,a4,1
	sb	a4,0(s1)
	sw	a3,32(a5)
	sw	a0,0(a5)
	sw	a1,4(a5)
	sw	a2,8(a5)
	sw	a3,12(a5)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL5B2006jh, .-_ZL5B2006jh
	.section	.text._ZL5B2005jh,"ax",@progbits
	.align	2
	.type	_ZL5B2005jh, @function
_ZL5B2005jh:
	addi	sp,sp,-16
	sw	s1,4(sp)
	lla	s1,.LANCHOR45
	lw	a0,0(s1)
	sw	s0,8(sp)
	sw	ra,12(sp)
	mv	s0,a1
	sw	a0,0(sp)
	call	_Z18FCEUPPU_LineUpdatev
	lla	a3,.LANCHOR29
	lbu	a4,0(a3)
	la a5, .LANCHOR0; sb s0, 0(a5);
	lw	a0,0(sp)
	srli	a1,s0,3
	andi	a2,s0,7
	bne	a4,zero,.L418
	li	a5,65536
	xori	a4,a4,1
	sb	a4,0(a3)
	addi	a5,a5,-32
	lw	ra,12(sp)
	lw	s0,8(sp)
	and	a5,a0,a5
	lla	t1,.LANCHOR31
	or	a5,a5,a1
	sw	a5,0(s1)
	la a0, .LANCHOR24; sb a2, 0(a0);
	sw	a1,36(t1)
	sw	a2,40(t1)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L418:
	slli	a5,s0,2
	li	t1,28672
	slli	s0,s0,12
	li	t0,36864
	xori	a4,a4,1
	sb	a4,0(a3)
	and	s0,s0,t1
	andi	a5,a5,-32
	addi	t0,t0,-993
	lw	ra,12(sp)
	or	a5,a5,s0
	and	a0,a0,t0
	lw	s0,8(sp)
	lla	t1,.LANCHOR31
	or	a5,a5,a0
	sw	a5,0(s1)
	sw	a1,32(t1)
	sw	a2,20(t1)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	_ZL5B2005jh, .-_ZL5B2005jh
	.section	.text._ZL5A2004j,"ax",@progbits
	.align	2
	.type	_ZL5A2004j, @function
_ZL5A2004j:
	addi	sp,sp,-72
	sw	ra,68(sp)
	sw	s0,64(sp)
	sw	s1,60(sp)
	la a5, .LANCHOR11; lw a5, 0(a5);
	beq	a5,zero,.L422
	lla	a3,.LANCHOR31
	lw	a1,52(a3)
	li	a5,240
	lla	a4,.LANCHOR1
	bgt	a1,a5,.L423
	lbu	a5,1(a4)
	andi	a5,a5,24
	beq	a5,zero,.L423
	lw	a3,56(a3)
	li	a5,63
	bgt	a3,a5,.L424
	lw	ra,68(sp)
	lw	s0,64(sp)
	li	a5,255
	la a4, .LANCHOR47+48; sw a5, 0(a4);
	lw	s1,60(sp)
	li	a0,255
	addi	sp,sp,72
	jr	ra
.L423:
	lbu	a4,3(a4)
	lw	ra,68(sp)
	lw	s0,64(sp)
	lla	a5,.LANCHOR12
	add	a5,a5,a4
	lbu	a0,0(a5)
	lw	s1,60(sp)
	addi	sp,sp,72
	jr	ra
.L422:
	call	_Z18FCEUPPU_LineUpdatev
	lw	ra,68(sp)
	lw	s0,64(sp)
	lw	s1,60(sp)
	la a0, .LANCHOR0; lbu a0, 0(a0);
	addi	sp,sp,72
	jr	ra
.L424:
	lla	s1,.LANCHOR47
	lw	a5,52(s1)
	beq	a3,a5,.L630
	lbu	t0,0(a4)
	lbu	a4,3(a4)
	lla	t2,.LANCHOR12
	andi	t0,t0,32
	andi	a4,a4,248
	sw	a4,12(sp)
	lw	a4,8(s1)
	seqz	t0,t0
	lw	a0,12(s1)
	sw	a4,20(sp)
	slli	a4,t0,3
	addi	a4,a4,-16
	lw	t0,12(sp)
	sw	a4,40(sp)
	lw	a4,12(sp)
	ori	t0,t0,1
	sw	t0,24(sp)
	add	a4,t2,a4
	sw	a4,56(sp)
	lw	a4,24(sp)
	lw	t1,0(s1)
	sw	a0,36(sp)
	add	a4,t2,a4
	lw	t0,36(sp)
	lbu	a0,252(t2)
	sw	a4,52(sp)
	addi	a4,a1,-1
	sw	t1,4(sp)
	sw	a4,44(sp)
	lw	s0,4(s1)
	lw	t1,56(s1)
	lw	a4,20(sp)
	sw	t0,0(sp)
	sw	zero,16(sp)
	sw	zero,8(sp)
	li	t0,0
	sw	zero,48(sp)
	sw	zero,28(sp)
	sw	zero,32(sp)
	sw	a0,24(sp)
.L489:
	li	a1,255
	bgt	a5,a1,.L430
	li	a1,4
	bgtu	t1,a1,.L431
	lla	a1,.L433
	slli	t1,t1,2
	add	t1,t1,a1
	lw	a2,0(t1)
	add	a2,a2,a1
	jr	a2
	.section	.rodata._ZL5A2004j,"a",@progbits
	.align	2
	.align	2
.L433:
	.word	.L580-.L433
	.word	.L436-.L433
	.word	.L435-.L433
	.word	.L434-.L433
	.word	.L432-.L433
	.section	.text._ZL5A2004j
.L580:
	slli	a1,s0,2
.L437:
	li	a2,1
	bgt	s0,a2,.L438
	lw	a2,12(sp)
	add	a1,a1,a2
.L438:
	lw	t0,0(sp)
	add	a0,t2,a1
	andi	t1,a5,1
	addi	a2,t0,4
	slli	a2,a2,2
	add	a2,s1,a2
	sw	a1,0(a2)
	lbu	a2,0(a0)
	beq	t1,zero,.L625
	lw	a1,44(sp)
	lw	a0,40(sp)
	sub	a1,a1,a2
	and	a1,a1,a0
	bne	a1,zero,.L439
	addi	a4,t0,1
	addi	a1,a5,1
	sw	a4,0(sp)
	beq	a3,a1,.L631
	li	a4,255
	bgt	a1,a4,.L484
	li	a2,1
	mv	a4,t1
	mv	a5,a1
	sw	a2,8(sp)
	sw	a2,48(sp)
	sw	a2,32(sp)
.L436:
	lw	a2,12(sp)
	slli	a1,s0,2
	li	a0,1
	add	a2,a2,a1
	sw	a2,20(sp)
	li	t1,255
.L485:
	andi	t0,a5,1
	beq	t0,zero,.L444
	addi	a4,a4,1
	li	a2,4
	beq	a4,a2,.L632
	li	a2,1
	sw	a2,8(sp)
.L444:
	ble	s0,a0,.L453
	or	a2,a1,a4
	add	a2,t2,a2
	addi	a5,a5,1
	lbu	a2,0(a2)
	beq	a3,a5,.L514
.L628:
	ble	a5,t1,.L485
	li	t1,1
	j	.L500
.L443:
	addi	a1,a5,1
	beq	a3,a1,.L557
	li	a4,255
	bgt	a1,a4,.L633
	mv	a5,a1
.L623:
	li	a4,1
	li	a2,1
	sw	a4,8(sp)
	sw	a2,28(sp)
	li	a4,0
	sw	a2,32(sp)
.L435:
	li	t1,64
	li	a0,255
.L486:
	andi	a1,a5,1
	beq	a1,zero,.L457
	slli	a2,s0,2
	or	a2,a2,a4
	add	a2,t2,a2
	lw	t0,44(sp)
	lbu	a2,0(a2)
	sub	a2,t0,a2
	lw	t0,40(sp)
	and	a2,a2,t0
	bne	a2,zero,.L458
	addi	a0,a5,1
	beq	a3,a0,.L515
	li	a4,255
	bgt	a0,a4,.L459
	li	a2,1
	mv	a4,a1
	mv	a5,a0
	sw	a2,8(sp)
	sw	a2,32(sp)
.L434:
	or	a0,a4,s0
	li	t1,255
	li	t0,4
.L460:
	add	a2,t2,a0
	andi	a1,a5,1
	lbu	a2,0(a2)
	beq	a1,zero,.L464
	addi	a4,a4,1
	beq	a4,t0,.L634
	addi	a5,a5,1
	beq	a3,a5,.L560
	li	a2,1
	sw	a2,8(sp)
	bgt	a5,t1,.L635
	or	a0,a4,s0
	j	.L460
.L555:
	li	a4,1
	mv	a5,a1
	sw	a4,28(sp)
	sw	a4,32(sp)
	li	s0,0
.L432:
	li	a4,255
.L487:
	andi	a2,a5,1
	beq	a2,zero,.L467
	addi	s0,s0,1
	li	a2,1
	andi	s0,s0,63
	sw	a2,28(sp)
.L467:
	slli	a2,s0,2
	add	a2,t2,a2
	addi	a5,a5,1
	lbu	a2,0(a2)
	beq	a3,a5,.L636
	ble	a5,a4,.L487
	li	a4,1
	sw	a4,8(sp)
	li	t1,4
	li	a4,0
.L500:
	lw	a1,0(sp)
	srai	a2,a5,3
	andi	a2,a2,7
	blt	a2,a1,.L473
.L470:
	lw	a2,4(sp)
	beq	a2,zero,.L552
	lw	a2,24(sp)
	li	a1,1
	sw	a1,16(sp)
	sw	zero,4(sp)
	li	t0,1
.L431:
	addi	a5,a5,1
	bne	a3,a5,.L489
	sw	a4,20(sp)
.L454:
	lw	a5,16(sp)
	beq	a5,zero,.L490
.L496:
	lw	a5,4(sp)
	sw	a5,0(s1)
.L490:
	lw	a5,8(sp)
	beq	a5,zero,.L491
.L497:
	lw	a5,20(sp)
	sw	a5,8(s1)
.L491:
	beq	t0,zero,.L637
	sw	a2,48(s1)
.L493:
	lw	a5,48(sp)
	bne	a5,zero,.L638
.L494:
	lw	a5,28(sp)
	beq	a5,zero,.L495
	sw	s0,4(s1)
.L495:
	lw	a5,32(sp)
	andi	a0,a2,0xff
	beq	a5,zero,.L427
	sw	t1,56(s1)
.L427:
	sw	a3,52(s1)
.L640:
	lw	ra,68(sp)
	lw	s0,64(sp)
	lw	s1,60(sp)
	addi	sp,sp,72
	jr	ra
.L635:
	li	t1,3
.L430:
	li	a2,319
	ble	a5,a2,.L500
	lw	a0,24(sp)
	sw	a4,20(sp)
.L469:
	lw	a5,16(sp)
	beq	a5,zero,.L475
.L498:
	lw	a5,4(sp)
	sw	a5,0(s1)
.L475:
	lw	a5,8(sp)
	beq	a5,zero,.L476
.L499:
	lw	a5,20(sp)
	sw	a5,8(s1)
.L476:
	lw	a5,48(sp)
	bne	a5,zero,.L639
.L477:
	lw	a5,28(sp)
	beq	a5,zero,.L478
	sw	s0,4(s1)
.L478:
	lw	a5,32(sp)
	beq	a5,zero,.L479
	sw	t1,56(s1)
.L479:
	lw	a5,36(sp)
	beq	a5,zero,.L626
	lw	a5,16(s1)
	add	a5,t2,a5
	lbu	a0,0(a5)
.L626:
	sw	a0,48(s1)
	sw	a3,52(s1)
	j	.L640
.L473:
	andi	a1,a5,4
	bne	a1,zero,.L474
.L471:
	addi	a2,a2,4
	slli	a2,a2,2
	add	a2,s1,a2
	lw	a2,0(a2)
	addi	a1,a4,1
	li	a0,4
	or	a2,a4,a2
	add	a2,t2,a2
	lbu	a2,0(a2)
	beq	a1,a0,.L553
	mv	a4,a1
	li	a1,1
	sw	a1,8(sp)
	li	t0,1
	j	.L431
.L552:
	li	t0,1
	li	a2,255
	j	.L431
.L474:
	ori	a2,a2,3
	addi	a2,a2,4
	slli	a2,a2,2
	add	a2,s1,a2
	lw	a2,0(a2)
	li	t0,1
	add	a2,t2,a2
	lbu	a2,0(a2)
	j	.L431
.L553:
	li	a4,1
	sw	a4,8(sp)
	li	a4,0
.L625:
	li	t0,1
	j	.L431
.L458:
	addi	s0,s0,1
	addi	a4,a4,1
	beq	s0,t1,.L641
	li	a2,1
	andi	a4,a4,3
	sw	a2,8(sp)
	sw	a2,28(sp)
.L457:
	addi	a5,a5,1
	beq	a3,a5,.L642
	ble	a5,a0,.L486
	li	t1,2
	j	.L500
.L464:
	addi	a5,a5,1
	beq	a3,a5,.L559
	ble	a5,t1,.L460
	li	t1,3
	j	.L500
.L453:
	lw	a2,20(sp)
	addi	a5,a5,1
	or	a2,a2,a4
	add	a2,t2,a2
	lbu	a2,0(a2)
	bne	a3,a5,.L628
.L514:
	sw	a4,20(sp)
	li	t0,1
	li	t1,1
	j	.L454
.L439:
	addi	s0,s0,1
	li	a1,64
	beq	s0,a1,.L442
	lw	a0,0(sp)
	li	a1,8
	beq	a0,a1,.L443
	li	a1,1
	li	t0,1
	sw	a1,28(sp)
	li	t1,0
	j	.L431
.L634:
	addi	a0,s0,1
	addi	a1,a5,1
	andi	s0,a0,63
	beq	a3,a1,.L643
	li	a2,255
	bgt	a1,a2,.L644
	li	a4,1
	mv	a5,a1
	sw	a4,28(sp)
	sw	a4,32(sp)
	j	.L432
.L632:
	addi	s0,s0,1
	li	a4,64
	beq	s0,a4,.L645
	lw	a2,0(sp)
	li	a4,8
	beq	a2,a4,.L447
	li	a4,1
	slli	a1,s0,2
	ble	s0,a4,.L448
	ori	a4,a1,1
	add	a4,t2,a4
	addi	a5,a5,1
	lbu	a2,0(a4)
	beq	a3,a5,.L505
	li	a2,1
	li	a4,255
	sw	a2,32(sp)
	sw	a2,28(sp)
	sw	a2,8(sp)
	ble	a5,a4,.L506
	mv	a4,t0
	li	t1,0
	j	.L430
.L459:
	li	a4,319
	bgt	a0,a4,.L537
	lw	a4,0(sp)
	srai	a2,a0,3
	andi	a2,a2,7
	bge	a2,a4,.L538
	andi	a4,a0,4
	beq	a4,zero,.L539
	ori	a4,a2,3
	addi	a4,a4,4
	slli	a4,a4,2
	add	a4,s1,a4
	lw	a4,0(a4)
	addi	a5,a5,2
	add	a4,t2,a4
	lbu	a2,0(a4)
	beq	a3,a5,.L646
	li	a2,1
	mv	a4,a1
	sw	a2,8(sp)
	li	t1,3
	sw	a2,32(sp)
	j	.L430
.L484:
	li	a4,319
	bgt	a1,a4,.L522
	lw	a4,0(sp)
	srai	a2,a1,3
	andi	a2,a2,7
	ble	a4,a2,.L523
	andi	a4,a1,4
	beq	a4,zero,.L524
	ori	a4,a2,3
	addi	a4,a4,4
	slli	a4,a4,2
	add	a4,s1,a4
	lw	a4,0(a4)
	addi	a5,a5,2
	add	a4,t2,a4
	lbu	a2,0(a4)
	beq	a3,a5,.L647
	li	a2,1
	mv	a4,t1
	sw	a2,8(sp)
	sw	a2,48(sp)
	sw	a2,32(sp)
	j	.L430
.L637:
	lw	a2,48(s1)
	j	.L493
.L641:
	addi	a1,a5,1
	andi	a4,a4,3
	beq	a3,a1,.L516
	li	a2,255
	ble	a1,a2,.L555
	li	a2,319
	bgt	a1,a2,.L533
	lw	a0,0(sp)
	srai	a2,a1,3
	andi	a2,a2,7
	bge	a2,a0,.L534
	andi	s0,a1,4
	beq	s0,zero,.L535
	ori	a2,a2,3
	addi	a2,a2,4
	slli	a2,a2,2
	add	a2,s1,a2
	lw	a2,0(a2)
	addi	a5,a5,2
	add	a2,t2,a2
	lbu	a2,0(a2)
	beq	a3,a5,.L648
	li	a2,1
	sw	a2,8(sp)
	sw	a2,28(sp)
	li	t1,4
	sw	a2,32(sp)
	li	s0,0
	j	.L430
.L442:
	addi	a1,a5,1
	beq	a3,a1,.L554
	li	a2,255
	ble	a1,a2,.L555
	li	a2,319
	bgt	a1,a2,.L518
	lw	a0,0(sp)
	srai	a2,a1,3
	andi	a2,a2,7
	bge	a2,a0,.L519
	andi	s0,a1,4
	beq	s0,zero,.L535
	ori	a2,a2,3
	addi	a2,a2,4
	slli	a2,a2,2
	add	a2,s1,a2
	lw	a2,0(a2)
	addi	a5,a5,2
	add	a2,t2,a2
	lbu	a2,0(a2)
	beq	a3,a5,.L554
	li	a2,1
	sw	a2,28(sp)
	li	t1,4
	sw	a2,32(sp)
	li	s0,0
	j	.L430
.L644:
	li	a2,319
	bgt	a1,a2,.L529
	lw	a0,0(sp)
	srai	a2,a1,3
	andi	a2,a2,7
	bge	a2,a0,.L530
	andi	a0,a1,4
	beq	a0,zero,.L531
	ori	a2,a2,3
	addi	a2,a2,4
	slli	a2,a2,2
	add	a2,s1,a2
	lw	a2,0(a2)
	addi	a5,a5,2
	add	a2,t2,a2
	lbu	a2,0(a2)
	beq	a3,a5,.L649
	li	a2,1
	li	t1,4
	sw	a2,8(sp)
	sw	a2,28(sp)
	sw	a2,32(sp)
	j	.L430
.L645:
	lw	a4,52(sp)
	addi	a1,a5,1
	lbu	a2,0(a4)
	beq	a3,a1,.L503
	li	a4,255
	ble	a1,a4,.L555
	li	a4,319
	bgt	a1,a4,.L548
	lw	a4,0(sp)
	srai	a2,a1,3
	andi	a2,a2,7
	ble	a4,a2,.L549
	andi	s0,a1,4
	beq	s0,zero,.L550
	ori	a4,a2,3
	addi	a4,a4,4
	slli	a4,a4,2
	add	a4,s1,a4
	lw	a4,0(a4)
	addi	a5,a5,2
	add	a4,t2,a4
	lbu	a2,0(a4)
	beq	a3,a5,.L551
	li	a2,1
	li	t1,4
	mv	a4,t0
	sw	a2,8(sp)
	sw	a2,28(sp)
	sw	a2,32(sp)
	li	s0,0
	j	.L430
.L630:
	lbu	a0,48(s1)
	sw	a3,52(s1)
	j	.L640
.L538:
	li	a2,1
	mv	a4,a1
	mv	a5,a0
	sw	a2,8(sp)
	li	t1,3
	sw	a2,32(sp)
	j	.L470
.L523:
	li	a2,1
	mv	a4,t1
	mv	a5,a1
	sw	a2,8(sp)
	sw	a2,48(sp)
	sw	a2,32(sp)
	j	.L470
.L636:
	lw	t0,16(sp)
	sw	zero,20(sp)
	li	t1,4
.L449:
	lw	a5,16(sp)
	sw	a5,8(sp)
	bne	a5,zero,.L496
	li	t0,1
	j	.L497
.L638:
	lw	a5,0(sp)
	sw	a5,12(s1)
	j	.L494
.L530:
	li	a2,1
	li	t1,4
	mv	a5,a1
	sw	a2,8(sp)
	sw	a2,28(sp)
	sw	a2,32(sp)
	j	.L470
.L447:
	li	a4,1
	slli	a1,s0,2
	ble	s0,a4,.L451
	add	a1,t2,a1
	addi	a5,a5,1
	lbu	a2,0(a1)
	beq	a3,a5,.L509
	li	a4,255
	ble	a5,a4,.L623
.L543:
	li	a4,1
	li	a2,1
	sw	a4,8(sp)
	sw	a2,28(sp)
	li	a4,0
	li	t1,2
	sw	a2,32(sp)
	j	.L430
.L642:
	sw	a4,20(sp)
	mv	a2,s0
	li	t0,1
	li	t1,2
	j	.L454
.L448:
	lw	a4,12(sp)
	addi	a0,a5,1
	add	a4,a4,a1
	ori	a4,a4,1
	add	a4,t2,a4
	lbu	a2,0(a4)
	beq	a3,a0,.L507
	li	a2,1
	li	a4,255
	sw	a2,32(sp)
	sw	a2,28(sp)
	sw	a2,8(sp)
	bgt	a0,a4,.L650
	mv	a4,t0
	mv	a5,a0
	j	.L437
.L559:
	sw	a4,20(sp)
	li	t0,1
	li	t1,3
	j	.L454
.L539:
	mv	a4,a1
	li	a1,1
	mv	a5,a0
	li	t1,3
	sw	a1,32(sp)
	j	.L471
.L524:
	mv	a5,a1
	li	a1,1
	mv	a4,t1
	sw	a1,48(sp)
	sw	a1,32(sp)
	j	.L471
.L633:
	li	a4,319
	bgt	a1,a4,.L541
	srai	a2,a1,3
	andi	a4,a1,4
	andi	a2,a2,7
	beq	a4,zero,.L527
.L629:
	ori	a4,a2,3
	addi	a4,a4,4
	slli	a4,a4,2
	add	a4,s1,a4
	lw	a4,0(a4)
	addi	a5,a5,2
	add	a4,t2,a4
	lbu	a2,0(a4)
	bne	a3,a5,.L543
.L509:
	li	a5,1
	lw	t0,16(sp)
	sw	zero,20(sp)
	sw	a5,28(sp)
	li	t1,2
	sw	a5,32(sp)
	j	.L449
.L639:
	lw	a5,0(sp)
	sw	a5,12(s1)
	sw	a5,36(sp)
	j	.L477
.L506:
	mv	a4,t0
	j	.L437
.L531:
	mv	a5,a1
	li	a1,1
	li	t1,4
	sw	a1,28(sp)
	sw	a1,32(sp)
	j	.L471
.L519:
	li	a2,1
	mv	a5,a1
	sw	a2,28(sp)
	li	t1,4
	sw	a2,32(sp)
	li	s0,0
	j	.L470
.L535:
	mv	a5,a1
	li	a1,1
	sw	a1,28(sp)
	li	t1,4
	sw	a1,32(sp)
	j	.L471
.L534:
	li	a2,1
	mv	a5,a1
	sw	a2,8(sp)
	sw	a2,28(sp)
	li	t1,4
	sw	a2,32(sp)
	li	s0,0
	j	.L470
.L560:
	lw	t0,16(sp)
	sw	a4,20(sp)
	li	t1,3
	j	.L449
.L515:
	lw	a5,16(sp)
	sw	a1,20(sp)
	mv	a2,s0
	sw	a5,32(sp)
	li	t1,3
.L441:
	lw	a5,16(sp)
	sw	a5,8(sp)
	mv	t0,a5
	bne	a5,zero,.L496
	li	a5,1
	li	t0,1
	sw	a5,32(sp)
	j	.L497
.L631:
	lw	a5,16(sp)
	sw	t1,20(sp)
	sw	a5,32(sp)
	li	a5,1
	sw	a5,48(sp)
	j	.L441
.L451:
	lw	a4,56(sp)
	addi	a0,a5,1
	add	a1,a4,a1
	lbu	a2,0(a1)
	beq	a3,a0,.L557
	li	a4,255
	bgt	a0,a4,.L651
	mv	a5,a0
	j	.L623
.L549:
	li	a2,1
	li	t1,4
	mv	a4,t0
	mv	a5,a1
	sw	a2,8(sp)
	sw	a2,28(sp)
	sw	a2,32(sp)
	li	s0,0
	j	.L470
.L527:
	mv	a5,a1
	li	a1,1
	sw	a1,28(sp)
	li	t1,2
	sw	a1,32(sp)
	j	.L471
.L650:
	li	a4,319
	bgt	a0,a4,.L544
	lw	a4,0(sp)
	srai	a2,a0,3
	andi	a2,a2,7
	ble	a4,a2,.L545
	andi	t1,a0,4
	beq	t1,zero,.L546
	ori	a4,a2,3
	addi	a4,a4,4
	slli	a4,a4,2
	add	a4,s1,a4
	lw	a4,0(a4)
	addi	a5,a5,2
	add	a4,t2,a4
	lbu	a2,0(a4)
	beq	a3,a5,.L505
	li	a2,1
	mv	a4,t0
	sw	a2,8(sp)
	sw	a2,28(sp)
	li	t1,0
	sw	a2,32(sp)
	j	.L430
.L643:
	lw	a5,16(sp)
	sw	a4,20(sp)
	li	t1,4
	sw	a5,32(sp)
	li	a5,1
	sw	a5,28(sp)
	j	.L441
.L550:
	mv	a5,a1
	li	a1,1
	li	t1,4
	mv	a4,t0
	sw	a1,28(sp)
	sw	a1,32(sp)
	j	.L471
.L651:
	li	a4,319
	bgt	a0,a4,.L541
	srai	a2,a0,3
	andi	a4,a0,4
	andi	a2,a2,7
	bne	a4,zero,.L629
	li	a1,1
	mv	a5,a0
	sw	a1,28(sp)
	li	t1,2
	sw	a1,32(sp)
	j	.L471
.L522:
	lw	a5,16(sp)
	lw	a0,24(sp)
	sw	t1,20(sp)
	sw	a5,32(sp)
	li	a5,1
	sw	a5,48(sp)
.L472:
	lw	a5,16(sp)
	sw	a5,8(sp)
	bne	a5,zero,.L498
	li	a5,1
	sw	a5,32(sp)
	j	.L499
.L537:
	lw	a5,16(sp)
	lw	a0,24(sp)
	sw	a1,20(sp)
	sw	a5,32(sp)
	li	t1,3
	j	.L472
.L545:
	mv	a4,t0
	mv	a5,a0
	li	t1,0
	j	.L470
.L554:
	li	a5,1
	sw	a4,20(sp)
	li	t0,1
	sw	a5,28(sp)
	li	t1,4
	sw	a5,32(sp)
	li	s0,0
	j	.L454
.L516:
	lw	a5,16(sp)
	sw	a4,20(sp)
	li	a2,0
	sw	a5,32(sp)
	li	a5,1
	sw	a5,28(sp)
	li	t1,4
	li	s0,0
	j	.L441
.L557:
	lw	a5,16(sp)
	sw	zero,20(sp)
	li	t1,2
	sw	a5,32(sp)
	li	a5,1
	sw	a5,28(sp)
	j	.L441
.L503:
	lw	a5,16(sp)
	li	t1,4
	sw	t0,20(sp)
	sw	a5,32(sp)
	li	a5,1
	sw	a5,28(sp)
	li	s0,0
	j	.L441
.L529:
	lw	a5,16(sp)
	lw	a0,24(sp)
	sw	a4,20(sp)
	sw	a5,32(sp)
	li	a5,1
	li	t1,4
	sw	a5,28(sp)
	j	.L472
.L518:
	li	a5,1
	lw	a0,24(sp)
	sw	a4,20(sp)
	sw	a5,28(sp)
	li	t1,4
	sw	a5,32(sp)
	li	s0,0
	j	.L469
.L533:
	lw	a5,16(sp)
	lw	a0,24(sp)
	sw	a4,20(sp)
	sw	a5,32(sp)
	li	a5,1
	sw	a5,28(sp)
	li	t1,4
	li	s0,0
	j	.L472
.L505:
	mv	a1,t0
	li	a5,1
	lw	t0,16(sp)
	sw	a1,20(sp)
	sw	a5,28(sp)
	li	t1,0
	sw	a5,32(sp)
	j	.L449
.L546:
	li	a1,1
	mv	a4,t0
	mv	a5,a0
	sw	a1,28(sp)
	sw	a1,32(sp)
	j	.L471
.L649:
	li	a5,1
	lw	t0,16(sp)
	sw	a4,20(sp)
	li	t1,4
	sw	a5,28(sp)
	sw	a5,32(sp)
	j	.L449
.L544:
	lw	a5,16(sp)
	lw	a0,24(sp)
	sw	t0,20(sp)
	sw	a5,32(sp)
	li	t1,0
	j	.L472
.L507:
	lw	a5,16(sp)
	sw	t0,20(sp)
	li	t1,0
	sw	a5,32(sp)
	li	a5,1
	sw	a5,28(sp)
	j	.L441
.L646:
	li	a5,1
	lw	t0,16(sp)
	sw	a1,20(sp)
	li	t1,3
	sw	a5,32(sp)
	j	.L449
.L647:
	li	a5,1
	lw	t0,16(sp)
	sw	t1,20(sp)
	sw	a5,48(sp)
	sw	a5,32(sp)
	j	.L449
.L548:
	lw	a5,16(sp)
	lw	a0,24(sp)
	li	t1,4
	sw	a5,32(sp)
	li	a5,1
	sw	t0,20(sp)
	sw	a5,28(sp)
	li	s0,0
	j	.L472
.L541:
	lw	a5,16(sp)
	lw	a0,24(sp)
	sw	zero,20(sp)
	sw	a5,32(sp)
	li	a5,1
	sw	a5,28(sp)
	li	t1,2
	j	.L472
.L648:
	li	a5,1
	lw	t0,16(sp)
	sw	a4,20(sp)
	sw	a5,28(sp)
	li	t1,4
	sw	a5,32(sp)
	li	s0,0
	j	.L449
.L551:
	mv	a1,t0
	li	a5,1
	lw	t0,16(sp)
	li	t1,4
	sw	a1,20(sp)
	sw	a5,28(sp)
	sw	a5,32(sp)
	li	s0,0
	j	.L449
	.size	_ZL5A2004j, .-_ZL5A2004j
	.section	.text._ZL5B2000jh,"ax",@progbits
	.align	2
	.type	_ZL5B2000jh, @function
_ZL5B2000jh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a1
	sw	ra,8(sp)
	lla	s1,.LANCHOR1
	call	_Z18FCEUPPU_LineUpdatev
	lb	a5,0(s1)
	la a4, .LANCHOR0; sb s0, 0(a4);
	blt	a5,zero,.L653
	slli	a5,s0,24
	srai	a5,a5,24
	blt	a5,zero,.L655
.L653:
	lla	a1,.LANCHOR45
	lw	a5,0(a1)
	li	a4,61440
	addi	a4,a4,1023
	and	a5,a5,a4
	li	a4,4096
	slli	a0,s0,10
	addi	a4,a4,-1024
	and	a0,a0,a4
	sb	s0,0(s1)
	lw	ra,8(sp)
	srli	a2,s0,1
	srli	a3,s0,4
	or	a5,a5,a0
	andi	a0,s0,1
	lw	s0,4(sp)
	lla	a4,.LANCHOR31
	andi	a2,a2,1
	andi	a3,a3,1
	sw	a5,0(a1)
	sw	a0,28(a4)
	sw	a2,24(a4)
	sw	a3,44(a4)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L655:
	lb	a5,2(s1)
	bge	a5,zero,.L653
	call	_Z11TriggerNMI2v
	j	.L653
	.size	_ZL5B2000jh, .-_ZL5B2000jh
	.section	.text._Z21FCEUI_SetRenderPlanesbb,"ax",@progbits
	.align	2
	.globl	_Z21FCEUI_SetRenderPlanesbb
	.hidden	_Z21FCEUI_SetRenderPlanesbb
	.type	_Z21FCEUI_SetRenderPlanesbb, @function
_Z21FCEUI_SetRenderPlanesbb:
	la a5, .LANCHOR48; sb a0, 0(a5);
	la a5, .LANCHOR49; sb a1, 0(a5);
	ret
	.size	_Z21FCEUI_SetRenderPlanesbb, .-_Z21FCEUI_SetRenderPlanesbb
	.section	.text._Z21FCEUI_GetRenderPlanesRbS_,"ax",@progbits
	.align	2
	.globl	_Z21FCEUI_GetRenderPlanesRbS_
	.hidden	_Z21FCEUI_GetRenderPlanesRbS_
	.type	_Z21FCEUI_GetRenderPlanesRbS_, @function
_Z21FCEUI_GetRenderPlanesRbS_:
	la a5, .LANCHOR48; lbu a5, 0(a5);
	sb	a5,0(a0)
	la a5, .LANCHOR49; lbu a5, 0(a5);
	sb	a5,0(a1)
	ret
	.size	_Z21FCEUI_GetRenderPlanesRbS_, .-_Z21FCEUI_GetRenderPlanesRbS_
	.section	.text._Z29FCEUI_DisableSpriteLimitationi,"ax",@progbits
	.align	2
	.globl	_Z29FCEUI_DisableSpriteLimitationi
	.hidden	_Z29FCEUI_DisableSpriteLimitationi
	.type	_Z29FCEUI_DisableSpriteLimitationi, @function
_Z29FCEUI_DisableSpriteLimitationi:
	snez	a0,a0
	neg	a0,a0
	andi	a0,a0,56
	addi	a0,a0,8
	la a5, .LANCHOR50; sw a0, 0(a5);
	ret
	.size	_Z29FCEUI_DisableSpriteLimitationi, .-_Z29FCEUI_DisableSpriteLimitationi
	.section	.text._Z22FCEUPPU_SetVideoSystemi,"ax",@progbits
	.align	2
	.globl	_Z22FCEUPPU_SetVideoSystemi
	.hidden	_Z22FCEUPPU_SetVideoSystemi
	.type	_Z22FCEUPPU_SetVideoSystemi, @function
_Z22FCEUPPU_SetVideoSystemi:
	lla	a5,FSettings
	beq	a0,zero,.L662
	la a4, dendy; lw a4, 0(a4);
	snez	a4,a4
	lw	a2,48(a5)
	lw	a3,56(a5)
	neg	a4,a4
	andi	a4,a4,-50
	addi	a4,a4,312
	la a1, .LANCHOR51; sw a4, 0(a1);
	sw	a2,36(a5)
	sw	a3,40(a5)
	ret
.L662:
	lw	a4,44(a5)
	lw	a3,52(a5)
	li	a2,262
	la a1, .LANCHOR51; sw a2, 0(a1);
	sw	a4,36(a5)
	sw	a3,40(a5)
	ret
	.size	_Z22FCEUPPU_SetVideoSystemi, .-_Z22FCEUPPU_SetVideoSystemi
	.section	.text._Z12FCEUPPU_Initv,"ax",@progbits
	.align	2
	.globl	_Z12FCEUPPU_Initv
	.hidden	_Z12FCEUPPU_Initv
	.type	_Z12FCEUPPU_Initv, @function
_Z12FCEUPPU_Initv:
	addi	sp,sp,-8
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a2,.LANCHOR25
	lla	a3,.LANCHOR26
	li	a4,0
	li	t2,7
	li	t0,8
	li	t1,256
.L668:
	li	a5,0
	li	a1,0
.L667:
	sub	a0,t2,a1
	sra	a0,a4,a0
	slli	s0,a1,2
	andi	a0,a0,1
	sll	a0,a0,s0
	addi	a1,a1,1
	or	a5,a5,a0
	bne	a1,t0,.L667
	slli	a1,a5,1
	sw	a5,0(a2)
	sw	a1,0(a3)
	addi	a4,a4,1
	addi	a2,a2,4
	addi	a3,a3,4
	bne	a4,t1,.L668
	li	a5,0
	lla	s1,.LANCHOR27
	li	s0,34
	li	a3,16
.L669:
	slli	a2,a5,3
	li	a4,0
.L671:
	or	a0,a2,a4
	mv	t2,a4
	li	t1,2
	li	t0,0
.L670:
	srai	a1,t2,3
	slli	a1,a1,1
	sra	a1,a5,a1
	andi	a1,a1,3
	sll	a1,a1,t1
	addi	t1,t1,4
	or	t0,t0,a1
	addi	t2,t2,1
	bne	t1,s0,.L670
	slli	a1,a0,2
	add	a1,s1,a1
	sw	t0,0(a1)
	addi	a4,a4,1
	li	a1,8
	bne	a4,a1,.L671
	addi	a5,a5,1
	bne	a5,a3,.L669
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,8
	jr	ra
	.size	_Z12FCEUPPU_Initv, .-_Z12FCEUPPU_Initv
	.section	.text._Z14PPU_ResetHooksv,"ax",@progbits
	.align	2
	.globl	_Z14PPU_ResetHooksv
	.hidden	_Z14PPU_ResetHooksv
	.type	_Z14PPU_ResetHooksv, @function
_Z14PPU_ResetHooksv:
	lla	a5,_Z22FFCEUX_PPURead_Defaultj
	la a4, .LANCHOR43; sw a5, 0(a4);
	ret
	.size	_Z14PPU_ResetHooksv, .-_Z14PPU_ResetHooksv
	.section	.text._Z13FCEUPPU_Resetv,"ax",@progbits
	.align	2
	.globl	_Z13FCEUPPU_Resetv
	.hidden	_Z13FCEUPPU_Resetv
	.type	_Z13FCEUPPU_Resetv, @function
_Z13FCEUPPU_Resetv:
	la a4, .LANCHOR1; sw zero, 0(a4);
	la a4, .LANCHOR42; sb zero, 0(a4);
	la a4, .LANCHOR2; sb zero, 0(a4);
	la a4, .LANCHOR0; sb zero, 0(a4);
	la a4, .LANCHOR45; sw zero, 0(a4);
	la a4, .LANCHOR13; sw zero, 0(a4);
	la a4, .LANCHOR29; sb zero, 0(a4);
	li	a4,2
	li	a5,1
	la a3, .LANCHOR52; sw a4, 0(a3);
	la a4, .LANCHOR53; sw zero, 0(a4);
	la a4, .LANCHOR54; sb a5, 0(a4);
	la a4, .LANCHOR55; sb a5, 0(a4);
	ret
	.size	_Z13FCEUPPU_Resetv, .-_Z13FCEUPPU_Resetv
	.section	.text._Z13FCEUPPU_Powerv,"ax",@progbits
	.align	2
	.globl	_Z13FCEUPPU_Powerv
	.hidden	_Z13FCEUPPU_Powerv
	.type	_Z13FCEUPPU_Powerv, @function
_Z13FCEUPPU_Powerv:
	li	a2,4096
	addi	sp,sp,-16
	addi	a2,a2,-2048
	li	a1,0
	lla	a0,NTARAM
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	call	memset
	li	a2,32
	li	a1,0
	lla	a0,.LANCHOR9
	call	memset
	li	a2,3
	li	a1,0
	lla	a0,.LANCHOR10
	call	memset
	li	a2,256
	li	a1,0
	lla	a0,.LANCHOR12
	call	memset
	la a4, .LANCHOR1; sw zero, 0(a4);
	la a4, .LANCHOR42; sb zero, 0(a4);
	la a4, .LANCHOR2; sb zero, 0(a4);
	la a4, .LANCHOR0; sb zero, 0(a4);
	la a4, .LANCHOR45; sw zero, 0(a4);
	la a4, .LANCHOR13; sw zero, 0(a4);
	la a4, .LANCHOR29; sb zero, 0(a4);
	li	a4,2
	li	a5,1
	la a3, .LANCHOR52; sw a4, 0(a3);
	li	s0,8192
	la a4, .LANCHOR53; sw zero, 0(a4);
	la a4, .LANCHOR54; sb a5, 0(a4);
	la a4, .LANCHOR55; sb a5, 0(a4);
	lla	s1,_ZL5A200xj
.L681:
	mv	a0,s0
	mv	a1,s1
	call	_Z17SetOneReadHandleriPFhjE
	mv	a0,s0
	lla	a1,_ZL5B2000jh
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	a0,s0,1
	mv	a1,s1
	sw	a0,0(sp)
	call	_Z17SetOneReadHandleriPFhjE
	lw	a0,0(sp)
	lla	a1,_ZL5B2001jh
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	a0,s0,2
	lla	a1,_ZL5A2002j
	sw	a0,0(sp)
	call	_Z17SetOneReadHandleriPFhjE
	lw	a0,0(sp)
	lla	a1,_ZL5B2002jh
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	a0,s0,3
	mv	a1,s1
	sw	a0,0(sp)
	call	_Z17SetOneReadHandleriPFhjE
	lw	a0,0(sp)
	lla	a1,_ZL5B2003jh
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	a0,s0,4
	lla	a1,_ZL5A2004j
	sw	a0,0(sp)
	call	_Z17SetOneReadHandleriPFhjE
	lw	a0,0(sp)
	lla	a1,_ZL5B2004jh
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	a0,s0,5
	mv	a1,s1
	sw	a0,0(sp)
	call	_Z17SetOneReadHandleriPFhjE
	lw	a0,0(sp)
	lla	a1,_ZL5B2005jh
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	a0,s0,6
	mv	a1,s1
	sw	a0,0(sp)
	call	_Z17SetOneReadHandleriPFhjE
	lw	a0,0(sp)
	lla	a1,_ZL5B2006jh
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	a0,s0,7
	lla	a1,_ZL5A2007j
	sw	a0,0(sp)
	call	_Z17SetOneReadHandleriPFhjE
	lw	a0,0(sp)
	lla	a1,_ZL5B2007jh
	addi	s0,s0,8
	call	_Z18SetOneWriteHandleriPFvjhE
	li	a5,16384
	bne	s0,a5,.L681
	addi	a0,s0,20
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	lla	a1,_ZL5B4014jh
	addi	sp,sp,16
	tail	_Z18SetOneWriteHandleriPFvjhE
	.size	_Z13FCEUPPU_Powerv, .-_Z13FCEUPPU_Powerv
	.section	.text._Z17FCEUPPU_LoadStatei,"ax",@progbits
	.align	2
	.globl	_Z17FCEUPPU_LoadStatei
	.hidden	_Z17FCEUPPU_LoadStatei
	.type	_Z17FCEUPPU_LoadStatei, @function
_Z17FCEUPPU_LoadStatei:
	la a4, .LANCHOR56; lhu a4, 0(a4);
	la a5, .LANCHOR57; lhu a5, 0(a5);
	la a3, .LANCHOR45; sw a4, 0(a3);
	la a4, .LANCHOR13; sw a5, 0(a4);
	ret
	.size	_Z17FCEUPPU_LoadStatei, .-_Z17FCEUPPU_LoadStatei
	.section	.text._Z17FCEUPPU_SaveStatev,"ax",@progbits
	.align	2
	.globl	_Z17FCEUPPU_SaveStatev
	.hidden	_Z17FCEUPPU_SaveStatev
	.type	_Z17FCEUPPU_SaveStatev, @function
_Z17FCEUPPU_SaveStatev:
	la a5, .LANCHOR45; lw a5, 0(a5);
	la a4, .LANCHOR56; sh a5, 0(a4);
	la a5, .LANCHOR13; lw a5, 0(a5);
	la a4, .LANCHOR57; sh a5, 0(a4);
	ret
	.size	_Z17FCEUPPU_SaveStatev, .-_Z17FCEUPPU_SaveStatev
	.section	.text._Z19FCEUPPU_PeekAddressv,"ax",@progbits
	.align	2
	.globl	_Z19FCEUPPU_PeekAddressv
	.hidden	_Z19FCEUPPU_PeekAddressv
	.type	_Z19FCEUPPU_PeekAddressv, @function
_Z19FCEUPPU_PeekAddressv:
	la a5, .LANCHOR11; lw a5, 0(a5);
	beq	a5,zero,.L687
	lla	a4,.LANCHOR31
	lw	a5,4(a4)
	lw	a2,8(a4)
	lw	a1,16(a4)
	lw	a3,12(a4)
	lw	a0,0(a4)
	slli	a5,a5,11
	slli	a4,a2,10
	or	a5,a5,a4
	or	a5,a5,a1
	slli	a4,a3,5
	or	a5,a5,a4
	slli	a0,a0,12
	or	a0,a0,a5
	slli	a0,a0,18
	srli	a0,a0,18
	ret
.L687:
	la a0, .LANCHOR13; lw a0, 0(a0);
	slli	a0,a0,18
	srli	a0,a0,18
	ret
	.size	_Z19FCEUPPU_PeekAddressv, .-_Z19FCEUPPU_PeekAddressv
	.globl	__modsi3
	.section	.text._Z6runppui,"ax",@progbits
	.align	2
	.globl	_Z6runppui
	.hidden	_Z6runppui
	.type	_Z6runppui, @function
_Z6runppui:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR31
	lw	a5,56(s1)
	lw	a1,60(s1)
	sw	s0,4(sp)
	mv	s0,a0
	add	a0,a0,a5
	sw	ra,8(sp)
	call	__modsi3
	sw	a0,56(s1)
	la a5, .LANCHOR55; lbu a5, 0(a5);
	beq	a5,zero,.L692
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L692:
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_Z14X6502_RunDebugi
	.size	_Z6runppui, .-_Z6runppui
	.section	.text._ZN6BGData6Record4ReadEv,"axG",@progbits,_ZN6BGData6Record4ReadEv,comdat
	.align	2
	.weak	_ZN6BGData6Record4ReadEv
	.hidden	_ZN6BGData6Record4ReadEv
	.type	_ZN6BGData6Record4ReadEv, @function
_ZN6BGData6Record4ReadEv:
	addi	sp,sp,-16
	sw	s1,4(sp)
	lla	s1,.LANCHOR31
	lw	a3,8(s1)
	lw	a2,4(s1)
	lw	a1,16(s1)
	lw	a4,12(s1)
	slli	a2,a2,11
	slli	a3,a3,10
	or	a3,a3,a2
	or	a3,a3,a1
	slli	a4,a4,5
	lla	a5,.LANCHOR16
	lw	a2,0(a5)
	or	a3,a3,a4
	li	a4,8192
	sw	s0,8(sp)
	or	a4,a3,a4
	sw	ra,12(sp)
	lla	a5,.LANCHOR13
	sw	a4,0(a5)
	la a1, .LANCHOR58; sw a4, 0(a1);
	mv	s0,a0
	beq	a2,zero,.L694
	srli	a3,a4,9
	andi	a3,a3,1
	sw	a3,44(s1)
.L695:
	slli	a4,a4,3
	andi	a4,a4,8
	sb	a4,1(s0)
	lla	a5,.LANCHOR43
	lw	a4,0(a5)
	lla	a5,.LANCHOR13
	lw	a0,0(a5)
	jalr	a4
	sb	a0,0(s0)
	lw	a0,56(s1)
	lw	a1,60(s1)
	addi	a0,a0,2
	call	__modsi3
	lla	a5,.LANCHOR55
	lbu	a4,0(a5)
	sw	a0,56(s1)
	beq	a4,zero,.L734
.L696:
	lw	a0,4(s1)
	lw	a2,8(s1)
	lw	a3,16(s1)
	lw	a4,12(s1)
	slli	a2,a2,10
	slli	a0,a0,11
	srli	a3,a3,2
	or	a0,a0,a2
	andi	a3,a3,7
	slli	a4,a4,1
	or	a0,a0,a3
	andi	a4,a4,56
	or	a0,a0,a4
	lla	a5,.LANCHOR43
	li	a4,8192
	lw	a3,0(a5)
	addi	a4,a4,960
	or	a0,a0,a4
	lla	a5,.LANCHOR13
	sw	a0,0(a5)
	jalr	a3
	sb	a0,2(s0)
	lw	a4,12(s1)
	andi	a4,a4,2
	beq	a4,zero,.L697
	srli	a0,a0,4
	sb	a0,2(s0)
.L697:
	lw	a4,16(s1)
	andi	a4,a4,2
	beq	a4,zero,.L698
	srli	a0,a0,2
	andi	a0,a0,0xff
.L698:
	slli	a0,a0,2
	andi	a0,a0,12
	sb	a0,2(s0)
	lw	a0,56(s1)
	lw	a1,60(s1)
	addi	a0,a0,1
	sw	a1,0(sp)
	call	__modsi3
	lla	a5,.LANCHOR55
	lbu	a3,0(a5)
	sw	a0,56(s1)
	lw	a1,0(sp)
	beq	a3,zero,.L735
.L699:
	la a4, .LANCHOR1+1; lbu a4, 0(a4);
	andi	a4,a4,24
	beq	a4,zero,.L701
	lw	a4,16(s1)
	lw	t0,8(s1)
	li	t1,251
	addi	a4,a4,1
	srli	a2,a4,5
	add	a2,a2,t0
	andi	a4,a4,31
	andi	a2,a2,1
	sw	a4,16(s1)
	sw	a2,8(s1)
	beq	a0,t1,.L736
.L701:
	addi	a0,a0,1
	sw	a3,0(sp)
	call	__modsi3
	lw	a3,0(sp)
	sw	a0,56(s1)
	beq	a3,zero,.L737
.L704:
	lw	a0,44(s1)
	lbu	a4,0(s0)
	lw	a3,0(s1)
	lla	a5,.LANCHOR16
	slli	a0,a0,12
	or	a0,a0,a3
	slli	a2,a4,4
	lw	a3,0(a5)
	or	a0,a0,a2
	lla	a5,.LANCHOR13
	sw	a4,48(s1)
	sw	a0,0(a5)
	beq	a3,zero,.L705
	lla	a5,.LANCHOR43
	lbu	a3,1(s0)
	lw	a4,0(a5)
	or	a0,a3,a0
	jalr	a4
	sb	a0,3(s0)
	lw	a0,56(s1)
	lw	a1,60(s1)
	addi	a0,a0,2
	call	__modsi3
	lla	a5,.LANCHOR55
	lbu	a4,0(a5)
	sw	a0,56(s1)
	beq	a4,zero,.L738
.L706:
	lla	a5,.LANCHOR13
	lw	a3,0(a5)
	lbu	a0,1(s0)
	lla	a5,.LANCHOR43
	lw	a4,0(a5)
	or	a0,a0,a3
.L733:
	jalr	a4
	sb	a0,4(s0)
	lw	a0,56(s1)
	lw	a1,60(s1)
	addi	a0,a0,2
	call	__modsi3
	lla	a5,.LANCHOR55
	lbu	a4,0(a5)
	sw	a0,56(s1)
	beq	a4,zero,.L707
.L693:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L705:
	la a4, .LANCHOR18; lw a4, 0(a4);
	beq	a4,zero,.L709
	lbu	a4,5(s0)
	andi	a4,a4,64
	bne	a4,zero,.L739
.L709:
	lla	a5,.LANCHOR43
	lw	a4,0(a5)
	jalr	a4
	sb	a0,3(s0)
	lw	a0,56(s1)
	lw	a1,60(s1)
	addi	a0,a0,2
	call	__modsi3
	lla	a5,.LANCHOR55
	lbu	a4,0(a5)
	sw	a0,56(s1)
	beq	a4,zero,.L740
.L712:
	lla	a5,.LANCHOR13
	lw	a0,0(a5)
	lla	a4,.LANCHOR43
	lw	a4,0(a4)
	ori	a0,a0,8
	sw	a0,0(a5)
	j	.L733
.L694:
	la a2, .LANCHOR18; lw a2, 0(a2);
	beq	a2,zero,.L695
	srli	a2,a4,10
	la a1, .LANCHOR38; lbu a1, 0(a1);
	andi	a2,a2,3
	srli	a1,a1,1
	srl	a2,a2,a1
	slli	a2,a2,10
	andi	a2,a2,1024
	andi	a3,a3,1023
	or	a3,a2,a3
	lla	a2,QTAINTRAM
	add	a3,a2,a3
	lbu	a3,0(a3)
	sb	a3,5(a0)
	andi	a3,a3,63
	sw	a3,44(s1)
	j	.L695
.L742:
	li	a0,2
	call	_Z14X6502_RunDebugi
	lla	a2,.LANCHOR13
	lw	a4,0(a2)
	lla	a5,CHRptr
	lw	a3,0(a5)
	ori	a4,a4,8
	sw	a4,0(a2)
	add	a4,a3,a4
	lbu	a4,0(a4)
	lla	a5,.LANCHOR55
	lbu	a5,0(a5)
	sb	a4,4(s0)
	lw	a0,56(s1)
	lw	a1,60(s1)
	sw	a5,0(sp)
	addi	a0,a0,2
	call	__modsi3
	lw	a5,0(sp)
	sw	a0,56(s1)
	bne	a5,zero,.L693
.L707:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	li	a0,2
	addi	sp,sp,16
	tail	_Z14X6502_RunDebugi
.L737:
	li	a0,1
	call	_Z14X6502_RunDebugi
	j	.L704
.L735:
	li	a0,1
	call	_Z14X6502_RunDebugi
	lla	a5,.LANCHOR55
	lw	a0,56(s1)
	lw	a1,60(s1)
	lbu	a3,0(a5)
	j	.L699
.L734:
	li	a0,2
	call	_Z14X6502_RunDebugi
	j	.L696
.L738:
	li	a0,2
	call	_Z14X6502_RunDebugi
	j	.L706
.L736:
	lw	a4,0(s1)
	lw	a2,12(s1)
	li	t0,30
	addi	a4,a4,1
	srli	t1,a4,3
	add	a2,t1,a2
	andi	a2,a2,31
	sw	a2,12(s1)
	lw	t2,4(s1)
	beq	a2,t0,.L741
.L703:
	andi	a4,a4,7
	andi	t2,t2,1
	sw	a4,0(s1)
	sw	t2,4(s1)
	j	.L701
.L739:
	lla	a5,CHRptr
	lw	a4,0(a5)
	add	a4,a4,a0
	lbu	a4,0(a4)
	sb	a4,3(s0)
	lw	a0,56(s1)
	lw	a1,60(s1)
	addi	a0,a0,2
	call	__modsi3
	lla	a5,.LANCHOR55
	lbu	a4,0(a5)
	sw	a0,56(s1)
	lla	a5,CHRptr
	beq	a4,zero,.L742
	lla	a2,.LANCHOR13
	lw	a4,0(a2)
	lw	a3,0(a5)
	ori	a4,a4,8
	sw	a4,0(a2)
	add	a4,a3,a4
	lbu	a4,0(a4)
	sb	a4,4(s0)
	lw	a0,56(s1)
	lw	a1,60(s1)
	addi	a0,a0,2
	call	__modsi3
	sw	a0,56(s1)
	j	.L693
.L740:
	li	a0,2
	call	_Z14X6502_RunDebugi
	j	.L712
.L741:
	li	a2,1
	bne	t1,a2,.L703
	addi	t2,t2,1
	la a2, .LANCHOR31+12; sw zero, 0(a2);
	j	.L703
	.size	_ZN6BGData6Record4ReadEv, .-_ZN6BGData6Record4ReadEv
	.section	.text._Z14FCEUX_PPU_Loopi,"ax",@progbits
	.align	2
	.globl	_Z14FCEUX_PPU_Loopi
	.hidden	_Z14FCEUX_PPU_Loopi
	.type	_Z14FCEUX_PPU_Loopi, @function
_Z14FCEUX_PPU_Loopi:
	lla	a5,.LANCHOR55
	lbu	a5,0(a5)
	addi	sp,sp,-108
	sw	ra,104(sp)
	sw	s0,100(sp)
	sw	s1,96(sp)
	lla	t1,.LANCHOR31
	bne	a5,zero,.L744
	lla	s0,.LANCHOR52
	lw	a5,0(s0)
	lw	a0,56(t1)
	lw	a1,60(t1)
	bne	a5,zero,.L952
.L746:
	lla	a3,.LANCHOR1
	lbu	a5,2(a3)
	li	s1,0
	addi	a0,a0,1
	ori	a5,a5,-128
	sb	a5,2(a3)
	la a5, .LANCHOR2; sb zero, 0(a5);
	la a5, .LANCHOR1+3; sb zero, 0(a5);
	li	a5,241
	sw	a5,52(t1)
	mv	a5,s1
	sw	a5,0(sp)
	mv	s1,t1
	la a4, .LANCHOR59; sw zero, 0(a4);
	call	__modsi3
	lw	a5,0(sp)
	li	s0,20
	sw	a0,56(s1)
	addi	s0,s0,-1
	beq	a5,zero,.L953
.L751:
	beq	s0,zero,.L752
.L954:
	lw	a0,56(s1)
	lla	a5,.LANCHOR55
	lbu	a5,0(a5)
	lw	a1,60(s1)
	addi	a0,a0,1
	sw	a5,0(sp)
	call	__modsi3
	lw	a5,0(sp)
	sw	a0,56(s1)
	addi	s0,s0,-1
	bne	a5,zero,.L751
.L953:
	li	a0,1
	call	_Z14X6502_RunDebugi
	bne	s0,zero,.L954
.L752:
	lla	a5,.LANCHOR1
	lb	a5,0(a5)
	mv	t1,s1
	blt	a5,zero,.L955
.L754:
	lla	a5,PAL
	lbu	a4,0(a5)
	li	s1,20
	sw	zero,4(sp)
	snez	a4,a4
	neg	a4,a4
	andi	a5,a4,50
	addi	a5,a5,20
	sw	a5,8(sp)
	li	s0,341
	mv	a5,s1
	mv	s1,t1
.L757:
	lw	a0,56(s1)
	lw	a1,60(s1)
	addi	a5,a5,1
	addi	a0,a0,1
	sw	a5,0(sp)
	call	__modsi3
	lla	a5,.LANCHOR55
	lbu	a4,0(a5)
	sw	a0,56(s1)
	lw	a5,0(sp)
	beq	a4,zero,.L956
	bne	a5,s0,.L757
.L961:
	lw	a4,52(s1)
	lw	a5,4(sp)
	addi	a4,a4,1
	sw	a4,52(s1)
	lw	a4,8(sp)
	addi	a3,a5,1
	sw	a3,4(sp)
	li	a5,0
	bne	a4,a3,.L757
	lla	a5,normalscanlines
	lw	a5,0(a5)
	la a4, .LANCHOR1+2; sb zero, 0(a4);
	mv	t1,s1
	ble	a5,zero,.L957
	li	a5,-1
	sw	a5,76(sp)
	lla	a5,.LANCHOR17
	sw	zero,24(sp)
	sw	a5,92(sp)
	sw	s1,16(sp)
.L759:
	lla	a5,timestamp
	lw	a3,0(a5)
	lla	a5,X
	lw	a2,16(a5)
	slli	a5,a3,1
	add	a5,a5,a3
	slli	a5,a5,4
	la a3, .LANCHOR47+12; sw zero, 0(a3);
	la a3, .LANCHOR47+4; sw zero, 0(a3);
	li	a3,64
	add	a5,a5,a2
	lla	a2,.LANCHOR47
	sw	a3,52(a2)
	li	a4,1
	la a3, .LANCHOR47+56; sw zero, 0(a3);
	la a3, .LANCHOR47+28; sw zero, 0(a3);
	la a3, .LANCHOR47+24; sw zero, 0(a3);
	la a3, .LANCHOR47+20; sw zero, 0(a3);
	la a3, .LANCHOR47+16; sw zero, 0(a3);
	la a3, .LANCHOR47+44; sw zero, 0(a3);
	la a3, .LANCHOR47+40; sw zero, 0(a3);
	la a3, .LANCHOR47+36; sw zero, 0(a3);
	la a3, .LANCHOR47+32; sw zero, 0(a3);
	la a3, .LANCHOR60; sw zero, 0(a3);
	sw	a4,0(a2)
	lw	a3,24(sp)
	sw	a4,8(a2)
	lw	a2,16(sp)
	sw	a3,52(a2)
	lla	a2,.LANCHOR28
	sw	a5,0(a2)
	lla	a5,.LANCHOR59
	sw	a4,0(a5)
	beq	a3,zero,.L762
	lw	a5,92(sp)
	lw	a5,0(a5)
	bne	a5,zero,.L958
.L762:
	lla	a1,.LANCHOR61
	lw	a5,0(a1)
	lla	a3,.LANCHOR64+12
	lw	a4,24(sp)
	lla	a2,.LANCHOR63
	sw	a3,4(sp)
	slli	a3,a5,2
	sw	a3,84(sp)
	add	a3,a2,a3
	xori	a0,a5,1
	lw	a2,0(a3)
	slli	a4,a4,8
	slli	a3,a5,9
	slli	a5,a5,6
	sw	a5,80(sp)
	addi	a5,a4,-256
	sw	a5,56(sp)
	lla	a5,.LANCHOR65
	sw	a0,0(a1)
	add	a5,a5,a3
	lla	a1,.LANCHOR62
	lw	s0,16(sp)
	sw	a0,88(sp)
	sw	a2,0(a1)
	sw	a5,64(sp)
	sw	zero,8(sp)
	j	.L790
.L763:
	lw	a4,24(sp)
	beq	a4,zero,.L765
	li	a5,240
	ble	a4,a5,.L959
.L765:
	lw	a5,8(sp)
	lw	a3,4(sp)
	addi	a4,a5,1
	addi	a3,a3,6
	sw	a4,8(sp)
	li	a5,32
	sw	a3,4(sp)
	beq	a4,a5,.L960
.L790:
	lw	a0,4(sp)
	call	_ZN6BGData6Record4ReadEv
	lla	a5,.LANCHOR66
	lbu	a5,0(a5)
	mv	a4,a5
	sw	a5,12(sp)
	li	a5,255
	bne	a4,a5,.L763
	lla	a5,.LANCHOR1
	lla	a4,.LANCHOR9
	lbu	a5,1(a5)
	lbu	a4,0(a4)
	andi	a5,a5,1
	sw	a4,12(sp)
	beq	a5,zero,.L763
	andi	a5,a4,48
	sw	a5,12(sp)
	j	.L763
.L956:
	li	a0,1
	call	_Z14X6502_RunDebugi
	lw	a5,0(sp)
	bne	a5,s0,.L757
	j	.L961
.L959:
	lw	a4,84(sp)
	lla	a5,.LANCHOR63
	lw	a1,8(sp)
	add	a5,a5,a4
	lw	a2,0(a5)
	lla	a4,.LANCHOR1
	lbu	a4,1(a4)
	lla	a0,.LANCHOR62
	sw	a2,28(sp)
	sw	a2,0(a0)
	la a2, XBuf; lw a2, 0(a2);
	slli	a5,a1,3
	andi	a3,a4,16
	sw	a2,40(sp)
	mv	t1,a4
	mv	t2,a5
	andi	a4,a4,8
	beq	a3,zero,.L766
	beq	a1,zero,.L962
	bne	a4,zero,.L864
	li	a4,1
	sw	a4,0(sp)
.L769:
	sw	zero,32(sp)
.L770:
	lw	a3,80(sp)
	lw	a4,28(sp)
	addi	a5,a5,8
	sw	a5,48(sp)
	add	a4,a4,a3
	la a3, .LANCHOR49; lbu a3, 0(a3);
	sw	a3,44(sp)
	li	a5,16384
	la a3, .LANCHOR48; lbu a3, 0(a3);
	slli	a4,a4,3
	addi	a5,a5,-256
	sw	a3,68(sp)
	lla	a3,.LANCHOR65
	add	t0,a3,a4
	sw	a5,72(sp)
	mv	a2,t1
	mv	a5,s0
	andi	a4,a2,24
	mv	s0,t0
	mv	t0,a5
	lw	a5,40(t0)
	mv	s1,t2
	bne	a4,zero,.L850
.L965:
	lw	a3,4(t0)
	lw	a1,8(t0)
	lw	a0,16(t0)
	lw	t1,12(t0)
	slli	a1,a1,10
	lw	t2,0(t0)
	slli	a3,a3,11
	or	a3,a3,a1
	or	a3,a3,a0
	slli	a1,t1,5
	or	a3,a3,a1
	lw	t1,72(sp)
	li	a1,12288
	slli	a0,t2,12
	and	a0,a0,a1
	or	a3,a3,a0
	and	a1,a3,t1
	li	a0,0
	bne	a1,t1,.L772
	andi	a4,a3,31
	mv	a0,a4
.L772:
	sw	t0,60(sp)
	sw	a2,52(sp)
	sw	a4,36(sp)
	sw	a5,20(sp)
	call	_Z19READPAL_MOTHEROFALLj
	lw	a5,20(sp)
	lw	a4,36(sp)
	lw	a2,52(sp)
	lw	t0,60(sp)
.L771:
	lw	a3,32(sp)
	beq	a3,zero,.L773
	add	a5,s1,a5
	srai	a3,a5,3
	slli	a4,a3,1
	add	a4,a4,a3
	slli	a4,a4,1
	addi	a3,a4,3
	lla	t2,.LANCHOR64
	add	a3,t2,a3
	lbu	t1,1(a3)
	lbu	a1,0(a3)
	not	a5,a5
	andi	a3,a5,7
	sra	a5,t1,a3
	add	a4,t2,a4
	lbu	t1,2(a4)
	sra	a1,a1,a3
	slli	a4,a5,1
	andi	a4,a4,2
	andi	a1,a1,1
	or	a4,a4,a1
	or	a4,a4,t1
.L773:
	lw	a5,44(sp)
	beq	a5,zero,.L774
	lla	a5,.LANCHOR9
	add	a3,a5,a4
	andi	a5,a2,1
	lbu	a0,0(a3)
	beq	a5,zero,.L774
	andi	a0,a0,48
.L774:
	lw	a5,28(sp)
	ble	a5,zero,.L784
	lla	a3,.LANCHOR1
	lbu	a3,2(a3)
	andi	a5,a2,1
	sw	a3,52(sp)
	li	a3,-1
	beq	a5,zero,.L777
	li	a3,48
.L777:
	andi	a5,a3,0xff
	sw	a5,36(sp)
	lw	a5,64(sp)
	andi	a4,a4,3
	li	ra,0
	li	t2,0
	sw	a4,20(sp)
.L782:
	lbu	a4,3(a5)
	bgt	a4,s1,.L778
	addi	a4,a4,7
	blt	a4,s1,.L778
	lbu	a3,5(a5)
	lbu	a4,4(a5)
	srli	a1,a3,1
	sb	a1,5(a5)
	lw	a1,0(sp)
	srli	t1,a4,1
	sb	t1,4(a5)
	beq	a1,zero,.L778
	bne	t2,zero,.L778
	slli	a3,a3,1
	andi	a4,a4,1
	andi	a3,a3,2
	or	a4,a4,a3
	beq	a4,zero,.L778
	lbu	a3,2(a5)
	lbu	t1,6(a5)
	andi	a1,a3,32
	bne	t1,zero,.L779
	lw	t1,20(sp)
	beq	t1,zero,.L780
	li	t1,254
	bgt	s1,t1,.L781
	lw	t1,52(sp)
	lw	ra,0(sp)
	ori	t1,t1,64
	sw	t1,52(sp)
.L781:
	lw	t2,0(sp)
	bne	a1,zero,.L778
.L780:
	lw	a1,68(sp)
	lw	t2,0(sp)
	beq	a1,zero,.L778
	slli	a3,a3,2
	andi	a3,a3,12
	or	a4,a4,a3
	lla	a3,.LANCHOR9
	add	a4,a3,a4
	lbu	a0,16(a4)
	lw	a4,36(sp)
	mv	t2,a1
	and	a0,a4,a0
.L778:
	addi	a5,a5,8
	bne	a5,s0,.L782
	bne	ra,zero,.L963
.L784:
	srli	a5,a2,5
	li	a4,7
	beq	a5,a4,.L964
	andi	a2,a2,224
	beq	a2,zero,.L788
	ori	a0,a0,64
	andi	a0,a0,0xff
.L787:
	lw	a5,56(sp)
	lw	a4,40(sp)
	add	a5,s1,a5
	add	a5,a4,a5
	sb	a0,0(a5)
	lla	a4,.LANCHOR60
	lw	a5,0(a4)
	addi	s1,s1,1
	addi	a5,a5,1
	sw	a5,0(a4)
	lw	a5,48(sp)
	beq	s1,a5,.L948
	lla	a5,.LANCHOR1
	lbu	a2,1(a5)
	lw	a5,40(t0)
	andi	a4,a2,24
	beq	a4,zero,.L965
.L850:
	lw	a0,12(sp)
	li	a4,0
	j	.L771
.L788:
	andi	a0,a0,63
	ori	a0,a0,128
	j	.L787
.L779:
	beq	a1,zero,.L780
	lw	a1,20(sp)
	beq	a1,zero,.L780
	lw	t2,0(sp)
	j	.L778
.L964:
	ori	a0,a0,-64
	andi	a0,a0,0xff
	j	.L787
.L948:
	lw	a5,8(sp)
	lw	a3,4(sp)
	mv	s0,t0
	addi	a4,a5,1
	addi	a3,a3,6
	sw	a4,8(sp)
	li	a5,32
	sw	a3,4(sp)
	bne	a4,a5,.L790
.L960:
	lla	a4,.LANCHOR1
	lbu	t1,0(a4)
	lbu	a5,1(a4)
	lbu	a4,2(a4)
	lw	a2,88(sp)
	srli	t1,t1,2
	sw	a4,0(sp)
	lla	a4,.LANCHOR50
	lw	a4,0(a4)
	andi	t1,t1,8
	slli	a3,a2,2
	addi	t1,t1,8
	sw	a4,8(sp)
	lla	a4,.LANCHOR63
	add	a4,a4,a3
	mv	s0,t1
	lw	t1,76(sp)
	sw	zero,0(a4)
	andi	a5,a5,24
	la a4, .LANCHOR62; sw zero, 0(a4);
	sw	a3,20(sp)
	sw	a5,4(sp)
	lla	a4,.LANCHOR12
	li	a1,0
	li	a3,0
	sw	zero,12(sp)
	li	ra,0
	slli	a0,a2,6
	li	t0,64
.L796:
	add	a5,a0,a1
	lla	t2,.LANCHOR65
	lbu	a2,0(a4)
	slli	a5,a5,3
	add	a5,t2,a5
	sb	zero,7(a5)
	mv	s1,t2
	add	t2,a2,s0
	bgt	a2,t1,.L792
	add	a5,a0,a1
	slli	a5,a5,3
	add	a5,s1,a5
	ble	t2,t1,.L792
	li	t2,7
	ble	a1,t2,.L793
	lw	t2,4(sp)
	beq	t2,zero,.L793
	lw	t2,0(sp)
	li	s1,8
	ori	t2,t2,32
	sw	t2,0(sp)
	lw	t2,8(sp)
	beq	t2,s1,.L966
	li	t2,1
	sw	t2,12(sp)
.L793:
	lbu	t2,1(a4)
	lbu	ra,2(a4)
	sb	a2,0(a5)
	mv	s1,t2
	lbu	t2,3(a4)
	li	a2,1
	sb	ra,2(a5)
	sb	a3,6(a5)
	sb	s1,1(a5)
	sb	t2,3(a5)
	sb	a2,7(a5)
	addi	a1,a1,1
	li	ra,1
.L792:
	addi	a3,a3,1
	addi	a4,a4,4
	bne	a3,t0,.L796
	lw	a5,12(sp)
	mv	t1,s0
	beq	a5,zero,.L797
	lw	a4,0(sp)
	lla	a5,.LANCHOR1
	sb	a4,2(a5)
.L797:
	beq	ra,zero,.L856
	lla	a5,.LANCHOR62
	sw	a1,0(a5)
.L798:
	lw	a4,20(sp)
	lla	a5,.LANCHOR63
	add	a5,a5,a4
	sw	a1,0(a5)
	lla	a4,.LANCHOR59
	li	a5,2
	sw	a5,0(a4)
	lw	a5,8(sp)
	ble	a5,zero,.L799
.L795:
	lw	a5,88(sp)
	slli	a4,a5,9
	lla	a5,.LANCHOR65
	add	s0,a5,a4
	li	a4,0
	addi	a5,t1,-1
	mv	s1,s0
	sw	a5,8(sp)
	mv	s0,a4
	beq	s0,a1,.L967
.L800:
	lbu	a2,0(s1)
	lw	a4,76(sp)
	lb	a5,2(s1)
	sub	a2,a4,a2
	bge	a5,zero,.L801
	lw	a5,8(sp)
	sub	a2,a5,a2
.L801:
	lbu	a5,7(s1)
	lbu	a0,1(s1)
	andi	a1,a2,7
	bne	a5,zero,.L802
	li	a1,0
	li	a0,0
	li	a2,0
.L802:
	lla	a5,.LANCHOR1
	lbu	a5,0(a5)
	andi	t1,a5,32
	beq	t1,zero,.L803
	andi	a5,a0,-2
	srli	a2,a2,3
	or	a2,a2,a5
	slli	a5,a0,12
	li	a0,4096
	slli	a2,a2,4
	and	a5,a5,a0
	or	a5,a2,a5
.L804:
	lla	a4,.LANCHOR1
	lbu	a2,1(a4)
	add	a5,a5,a1
	li	t1,2
	andi	a2,a2,24
	beq	a2,zero,.L805
	lw	a4,24(sp)
	bne	a4,zero,.L806
	lw	a4,16(sp)
	li	a2,304
	lw	a1,56(a4)
	beq	a1,a2,.L968
.L805:
	li	a2,7
	ble	s0,a2,.L969
.L814:
	lla	a4,.LANCHOR1
	lbu	a2,0(a4)
	li	a1,24
	andi	a2,a2,56
	beq	a2,a1,.L816
	li	a2,2
	beq	s0,a2,.L970
.L817:
	li	a2,7
	ble	s0,a2,.L818
	lla	a2,.LANCHOR43
	lw	t1,0(a2)
	lla	a1,.LANCHOR13
	sw	a5,0(a1)
	mv	a0,a5
	jalr	t1
	lla	a1,.LANCHOR13
	lw	a5,0(a1)
	lla	a2,.LANCHOR43
	lw	a2,0(a2)
	sb	a0,4(s1)
	addi	a0,a5,8
	sw	a0,0(a1)
	jalr	a2
	sb	a0,5(s1)
.L836:
	lbu	a5,2(s1)
	andi	a5,a5,64
	bne	a5,zero,.L824
	lbu	a2,4(s1)
	lbu	a1,5(s1)
	lla	a5,.LANCHOR69
	add	a2,a5,a2
	add	a5,a5,a1
	lbu	a2,0(a2)
	lbu	a5,0(a5)
	sb	a2,4(s1)
	sb	a5,5(s1)
.L824:
	lla	a5,.LANCHOR50
	lw	a5,0(a5)
	addi	s0,s0,1
	addi	s1,s1,8
	ble	a5,s0,.L799
	lla	a5,.LANCHOR62
	lw	a1,0(a5)
	bne	s0,a1,.L800
.L967:
	li	a5,7
	ble	s0,a5,.L800
.L799:
	li	a5,1
	lla	a4,.LANCHOR59
	lla	a0,.LANCHOR64
	sw	a5,0(a4)
	call	_ZN6BGData6Record4ReadEv
	lla	a0,.LANCHOR64+6
	call	_ZN6BGData6Record4ReadEv
	lw	s1,16(sp)
	lw	a0,56(s1)
	lw	a1,60(s1)
	addi	a0,a0,2
	call	__modsi3
	lla	a5,.LANCHOR55
	lbu	s0,0(a5)
	sw	a0,56(s1)
	mv	a5,a0
	beq	s0,zero,.L971
	lw	a4,24(sp)
	beq	a4,zero,.L842
	lw	s0,16(sp)
	addi	a0,a5,2
	li	a5,341
	li	a1,341
	sw	a5,60(s0)
	call	__modsi3
	sw	a0,56(s0)
.L831:
	lw	s0,16(sp)
	li	a1,341
	lw	a0,56(s0)
	addi	a0,a0,1
	call	__modsi3
	lla	a5,.LANCHOR55
	lbu	a5,0(a5)
	sw	a0,56(s0)
	beq	a5,zero,.L972
.L832:
	lw	a4,24(sp)
	lw	a3,76(sp)
	lla	a5,normalscanlines
	lw	a5,0(a5)
	addi	a4,a4,1
	addi	a3,a3,1
	sw	a4,24(sp)
	sw	a3,76(sp)
	bgt	a5,a4,.L759
	lw	t1,16(sp)
.L834:
	lw	a5,92(sp)
	la a4, DMC_7bit; sb zero, 0(a4);
	lw	a5,0(a5)
	bne	a5,zero,.L973
.L761:
	lw	a0,56(t1)
	lw	a1,60(t1)
	sw	t1,0(sp)
	addi	a0,a0,341
	call	__modsi3
	lw	t1,0(sp)
	lla	a5,.LANCHOR55
	lbu	a5,0(a5)
	sw	a0,56(t1)
	beq	a5,zero,.L974
.L835:
.L750:
	lla	a4,.LANCHOR70
	lw	a5,0(a4)
	lw	ra,104(sp)
	lw	s0,100(sp)
	addi	a5,a5,1
	sw	a5,0(a4)
	lw	s1,96(sp)
	li	a0,0
	addi	sp,sp,108
	jr	ra
.L963:
	lw	a4,52(sp)
	lla	a5,.LANCHOR1
	sb	a4,2(a5)
	j	.L784
.L766:
	sw	zero,0(sp)
	beq	a4,zero,.L769
	li	a4,1
	sw	a4,32(sp)
	lw	a4,8(sp)
	bne	a4,zero,.L770
	li	a3,1
	andi	a4,t1,2
	sw	a3,32(sp)
	bne	a4,zero,.L770
	j	.L769
.L803:
	slli	a5,a5,9
	li	a2,4096
	and	a5,a5,a2
	slli	a0,a0,4
	or	a5,a5,a0
	j	.L804
.L816:
	li	a2,2
	bne	s0,a2,.L817
	lla	a4,.LANCHOR1
	lbu	a2,1(a4)
	andi	a2,a2,24
.L820:
	beq	a2,zero,.L818
.L819:
	la a2, .LANCHOR68; lw a2, 0(a2);
	beq	a2,zero,.L818
	sw	a5,0(sp)
	jalr	a2
	lw	a5,0(sp)
.L818:
	sw	a5,0(sp)
	lw	a5,16(sp)
	lw	a0,56(a5)
	lw	a1,60(a5)
	addi	a0,a0,2
	call	__modsi3
	lw	a5,16(sp)
	lla	a4,.LANCHOR55
	lbu	a2,0(a4)
	sw	a0,56(a5)
	lw	a5,0(sp)
	beq	a2,zero,.L975
.L822:
	lla	t1,.LANCHOR43
	lw	a1,0(t1)
	lla	a2,.LANCHOR13
	sw	a5,0(a2)
	mv	a0,a5
	jalr	a1
	lw	a4,16(sp)
	sb	a0,4(s1)
	lw	a5,56(a4)
	lw	a1,60(a4)
	addi	a0,a5,2
	call	__modsi3
	lw	a4,16(sp)
	lla	a5,.LANCHOR55
	lbu	a5,0(a5)
	sw	a0,56(a4)
	lla	a2,.LANCHOR13
	lla	t1,.LANCHOR43
	beq	a5,zero,.L976
.L823:
	lw	a0,0(a2)
	lw	a5,0(t1)
	addi	a0,a0,8
	sw	a0,0(a2)
	jalr	a5
	lw	a4,16(sp)
	sb	a0,5(s1)
	lw	a5,56(a4)
	lw	a1,60(a4)
	addi	a0,a5,2
	call	__modsi3
	lw	a4,16(sp)
	lla	a5,.LANCHOR55
	lbu	a5,0(a5)
	sw	a0,56(a4)
	bne	a5,zero,.L836
	li	a0,2
	call	_Z14X6502_RunDebugi
	j	.L836
.L969:
	sw	a5,4(sp)
	lw	a5,16(sp)
	sw	t1,0(sp)
	lw	a0,56(a5)
	lw	a1,60(a5)
	add	a0,t1,a0
	call	__modsi3
	lw	a5,16(sp)
	lla	a4,.LANCHOR55
	lbu	a2,0(a4)
	sw	a0,56(a5)
	lw	t1,0(sp)
	lw	a5,4(sp)
	bne	a2,zero,.L814
	mv	a0,t1
	sw	a5,0(sp)
	call	_Z14X6502_RunDebugi
	lw	a5,0(sp)
	j	.L814
.L806:
	lw	a4,24(sp)
	li	a2,240
	bgt	a4,a2,.L805
	lw	a4,16(sp)
	li	a2,256
	lw	a1,56(a4)
	bne	a1,a2,.L805
	lw	a1,60(a4)
	li	a0,257
	sw	a5,4(sp)
	sw	a1,0(sp)
	call	__modsi3
	lw	a5,16(sp)
	lla	a4,.LANCHOR55
	lbu	a2,0(a4)
	sw	a0,56(a5)
	lw	a1,0(sp)
	lw	a5,4(sp)
	beq	a2,zero,.L977
.L811:
	lw	a4,16(sp)
	lw	t0,36(a4)
	lw	t1,28(a4)
	sw	t0,16(a4)
	sw	t1,8(a4)
.L812:
	addi	a0,a0,1
	sw	a2,4(sp)
	sw	a5,0(sp)
	call	__modsi3
	lw	a5,16(sp)
	lw	a2,4(sp)
	li	t1,0
	sw	a0,56(a5)
	lw	a5,0(sp)
	bne	a2,zero,.L805
	li	a0,1
	sw	a5,4(sp)
	sw	t1,0(sp)
	call	_Z14X6502_RunDebugi
	lw	a5,4(sp)
	lw	t1,0(sp)
	j	.L805
.L970:
	lbu	a2,1(a4)
	andi	a2,a2,24
	beq	a2,zero,.L818
	la a2, .LANCHOR67; lw a2, 0(a2);
	beq	a2,zero,.L819
	sw	a5,0(sp)
	jalr	a2
	lla	a4,.LANCHOR1
	lbu	a2,1(a4)
	lw	a5,0(sp)
	andi	a2,a2,24
	j	.L820
.L976:
	li	a0,2
	call	_Z14X6502_RunDebugi
	lla	t1,.LANCHOR43
	lla	a2,.LANCHOR13
	j	.L823
.L975:
	li	a0,2
	sw	a5,0(sp)
	call	_Z14X6502_RunDebugi
	lw	a5,0(sp)
	j	.L822
.L962:
	srli	a3,t1,2
	andi	a3,a3,1
	sw	a3,0(sp)
	beq	a4,zero,.L769
	li	a3,1
	andi	a4,t1,2
	sw	a3,32(sp)
	bne	a4,zero,.L770
	j	.L769
.L864:
	li	a4,1
	sw	a4,0(sp)
	sw	a4,32(sp)
	j	.L770
.L968:
	lw	a1,60(a4)
	li	a0,305
	sw	a5,0(sp)
	call	__modsi3
	lw	a5,16(sp)
	lla	a4,.LANCHOR55
	lbu	a2,0(a4)
	sw	a0,56(a5)
	lw	a5,0(sp)
	beq	a2,zero,.L978
.L808:
	lw	a4,16(sp)
	lw	t2,20(a4)
	lw	t0,24(a4)
	lw	t1,28(a4)
	lw	a1,32(a4)
	lw	a2,36(a4)
	sw	t2,0(a4)
	sw	t0,4(a4)
	sw	t1,8(a4)
	sw	a1,12(a4)
	sw	a2,16(a4)
.L810:
	sw	a5,4(sp)
	lw	a5,16(sp)
	li	t1,0
	addi	a0,a0,1
	lw	a1,60(a5)
	sw	t1,0(sp)
	call	__modsi3
	lw	a5,16(sp)
	lla	a4,.LANCHOR55
	lbu	a2,0(a4)
	sw	a0,56(a5)
	li	t1,0
	lw	a5,4(sp)
	bne	a2,zero,.L805
	li	a0,1
	call	_Z14X6502_RunDebugi
	lw	t1,0(sp)
	lw	a5,4(sp)
	j	.L805
.L842:
	lla	a4,.LANCHOR54
	lbu	a5,0(a4)
	beq	a5,zero,.L828
	lla	a3,.LANCHOR1
	lbu	a3,1(a3)
	andi	a3,a3,24
	beq	a3,zero,.L828
	lla	a3,PAL
	lbu	a3,0(a3)
	beq	a3,zero,.L829
.L828:
	lw	s1,16(sp)
	xori	a5,a5,1
	li	a3,341
	li	a1,341
	addi	a0,a0,2
	sw	a3,60(s1)
	sb	a5,0(a4)
	call	__modsi3
	sw	a0,56(s1)
	bne	s0,zero,.L831
.L830:
	li	a0,2
	call	_Z14X6502_RunDebugi
	lw	a5,16(sp)
	lw	a4,60(a5)
	li	a5,341
	bne	a4,a5,.L832
	j	.L831
.L971:
	li	a0,2
	call	_Z14X6502_RunDebugi
	lw	a5,16(sp)
	lw	a0,56(a5)
	lla	a5,.LANCHOR55
	lbu	s0,0(a5)
	lw	a5,24(sp)
	beq	a5,zero,.L842
	lw	s1,16(sp)
	li	a5,341
	li	a1,341
	addi	a0,a0,2
	sw	a5,60(s1)
	call	__modsi3
	sw	a0,56(s1)
	beq	s0,zero,.L830
	j	.L831
.L966:
	lw	a4,0(sp)
	lla	a5,.LANCHOR1
	mv	t1,s0
	sb	a4,2(a5)
	lw	a4,20(sp)
	lla	a5,.LANCHOR63
	add	a5,a5,a4
	beq	ra,zero,.L794
	lla	a4,.LANCHOR62
	sw	a1,0(a4)
	sw	a1,0(a5)
	lla	a4,.LANCHOR59
	li	a5,2
	sw	a5,0(a4)
	j	.L795
.L978:
	li	a0,1
	call	_Z14X6502_RunDebugi
	lla	a5,.LANCHOR1
	lbu	a2,1(a5)
	lw	a4,16(sp)
	lw	a5,0(sp)
	andi	a2,a2,24
	lw	a0,56(a4)
	beq	a2,zero,.L810
	j	.L808
.L856:
	li	a1,0
	j	.L798
.L958:
	lw	a0,76(sp)
	call	_Z7MMC5_hbi
	j	.L762
.L977:
	li	a0,1
	sw	a5,0(sp)
	call	_Z14X6502_RunDebugi
	lla	a5,.LANCHOR1
	lbu	t1,1(a5)
	lw	a5,16(sp)
	andi	t1,t1,24
	lw	a0,56(a5)
	lw	a1,60(a5)
	lla	a5,.LANCHOR55
	lbu	a2,0(a5)
	lw	a5,0(sp)
	beq	t1,zero,.L812
	j	.L811
.L744:
	la a5, .LANCHOR31+16; sw zero, 0(a5);
	la a5, .LANCHOR31+12; sw zero, 0(a5);
	la a5, .LANCHOR31+8; sw zero, 0(a5);
	la a5, .LANCHOR31+4; sw zero, 0(a5);
	la a5, .LANCHOR31; sw zero, 0(a5);
	la a5, .LANCHOR31+44; sw zero, 0(a5);
	la a5, .LANCHOR31+48; sw zero, 0(a5);
	la a5, .LANCHOR31+40; sw zero, 0(a5);
	la a5, .LANCHOR31+36; sw zero, 0(a5);
	la a5, .LANCHOR31+32; sw zero, 0(a5);
	la a5, .LANCHOR31+28; sw zero, 0(a5);
	la a5, .LANCHOR31+24; sw zero, 0(a5);
	la a5, .LANCHOR31+20; sw zero, 0(a5);
	la a5, .LANCHOR31+56; sw zero, 0(a5);
	li	a5,341
	sw	a5,60(t1)
	lla	s0,.LANCHOR52
	la a5, .LANCHOR47+56; sw zero, 0(a5);
	la a5, .LANCHOR47+52; sw zero, 0(a5);
	la a5, .LANCHOR47+48; sw zero, 0(a5);
	la a5, .LANCHOR47+12; sw zero, 0(a5);
	la a5, .LANCHOR47+8; sw zero, 0(a5);
	la a5, .LANCHOR47+4; sw zero, 0(a5);
	la a5, .LANCHOR47; sw zero, 0(a5);
	la a5, .LANCHOR47+28; sw zero, 0(a5);
	la a5, .LANCHOR47+24; sw zero, 0(a5);
	la a5, .LANCHOR47+20; sw zero, 0(a5);
	la a5, .LANCHOR47+16; sw zero, 0(a5);
	la a5, .LANCHOR47+44; sw zero, 0(a5);
	la a5, .LANCHOR47+40; sw zero, 0(a5);
	la a5, .LANCHOR47+36; sw zero, 0(a5);
	la a5, .LANCHOR47+32; sw zero, 0(a5);
	la a5, .LANCHOR55; sb zero, 0(a5);
	lw	a5,0(s0)
	li	a1,341
	li	a0,0
	beq	a5,zero,.L746
.L952:
	li	a5,241
	sw	a5,52(t1)
	sw	t1,0(sp)
	la a5, PAL; lbu a5, 0(a5);
	bne	a5,zero,.L979
	li	s1,8192
	addi	s1,s1,-1372
.L950:
	add	a0,a0,s1
	call	__modsi3
	lw	t1,0(sp)
	mv	a5,a0
	mv	a0,s1
	sw	a5,56(t1)
	call	_Z14X6502_RunDebugi
	lw	t1,0(sp)
	lla	a5,.LANCHOR55
	lbu	a5,0(a5)
	lw	a0,56(t1)
	lw	a1,60(t1)
	li	s1,81920
	addi	s1,s1,602
	add	a0,a0,s1
	sw	t1,4(sp)
	sw	a5,0(sp)
	la a4, .LANCHOR31+52; sw zero, 0(a4);
	call	__modsi3
	lw	t1,4(sp)
	lw	a5,0(sp)
	sw	a0,56(t1)
	beq	a5,zero,.L980
.L749:
	lw	a5,0(s0)
	lw	ra,104(sp)
	lw	s1,96(sp)
	addi	a5,a5,-1
	sw	a5,0(s0)
	lw	s0,100(sp)
	li	a0,0
	addi	sp,sp,108
	jr	ra
.L829:
	lw	s1,16(sp)
	xori	a5,a5,1
	li	a3,340
	li	a1,340
	addi	a0,a0,2
	sw	a3,60(s1)
	sb	a5,0(a4)
	call	__modsi3
	sw	a0,56(s1)
	bne	s0,zero,.L832
	j	.L830
.L974:
	li	a0,341
	call	_Z14X6502_RunDebugi
	j	.L835
.L973:
	li	a0,240
	sw	t1,0(sp)
	call	_Z7MMC5_hbi
	lw	t1,0(sp)
	j	.L761
.L794:
	sw	zero,0(a5)
	lla	a4,.LANCHOR59
	li	a5,2
	sw	a5,0(a4)
	li	a1,0
	j	.L795
.L972:
	li	a0,1
	call	_Z14X6502_RunDebugi
	j	.L832
.L979:
	li	s1,24576
	addi	s1,s1,-706
	j	.L950
.L955:
	sw	s1,0(sp)
	call	_Z10TriggerNMIv
	lw	t1,0(sp)
	j	.L754
.L980:
	mv	a0,s1
	call	_Z14X6502_RunDebugi
	j	.L749
.L957:
	lla	a5,.LANCHOR17
	sw	a5,92(sp)
	j	.L834
	.size	_Z14FCEUX_PPU_Loopi, .-_Z14FCEUX_PPU_Loopi
	.section	.rodata._Z12FCEUPPU_Loopi.str1.4,"aMS",@progbits,1
	.align	2
.LC9:
	.string	"Assertion `0' failed"
	.align	2
.LC10:
	.string	" @ /home/ysyx/ysyx-workbench/fceux-am/src/ppu.cpp:1680  \n"
	.section	.text._Z12FCEUPPU_Loopi,"ax",@progbits
	.align	2
	.globl	_Z12FCEUPPU_Loopi
	.hidden	_Z12FCEUPPU_Loopi
	.type	_Z12FCEUPPU_Loopi, @function
_Z12FCEUPPU_Loopi:
	addi	sp,sp,-76
	sw	ra,72(sp)
	sw	s0,68(sp)
	sw	s1,64(sp)
	la a5, .LANCHOR11; lw a5, 0(a5);
	sw	a0,48(sp)
	sw	zero,52(sp)
	beq	a5,zero,.L982
	la a5, GameInfo; lw a5, 0(a5);
	lw	a4,8(a5)
	li	a5,3
	bne	a4,a5,.L1359
.L982:
	lla	s0,.LANCHOR52
	lw	a5,0(s0)
	sw	a5,0(sp)
	beq	a5,zero,.L983
	li	a2,61440
	li	a1,128
	la a0, XBuf; lw a0, 0(a0);
	call	memset
	la a0, .LANCHOR51; lw a0, 0(a0);
	slli	a5,a0,2
	add	a5,a5,a0
	slli	a4,a5,4
	add	a5,a5,a4
	slli	a5,a5,2
	add	a0,a5,a0
	call	_Z14X6502_RunDebugi
	lw	a5,0(s0)
	addi	a5,a5,-1
	sw	a5,0(s0)
.L984:
	call	_Z7ShowFPSv
	lw	a5,48(sp)
	lw	ra,72(sp)
	lw	s0,68(sp)
	seqz	a5,a5
	sw	a5,0(sp)
	lw	a0,0(sp)
	lw	s1,64(sp)
	addi	sp,sp,76
	jr	ra
.L983:
	li	a0,341
	call	_Z14X6502_RunDebugi
	lla	a4,.LANCHOR1
	lbu	a5,2(a4)
	li	a0,12
	ori	a5,a5,-128
	sb	a5,2(a4)
	la a5, .LANCHOR2; sb zero, 0(a5);
	la a5, .LANCHOR1+3; sb zero, 0(a5);
	call	_Z14X6502_RunDebugi
	lla	a5,GameInfo
	lw	a4,0(a5)
	li	a5,3
	lw	a4,8(a4)
	beq	a4,a5,.L1360
	lla	a5,.LANCHOR1
	lb	a5,0(a5)
	blt	a5,zero,.L1361
.L989:
	la a4, .LANCHOR51; lw a4, 0(a4);
	slli	a5,a4,2
	add	a5,a5,a4
	slli	a3,a5,4
	add	a5,a5,a3
	slli	a5,a5,2
	li	a0,-81920
	add	a5,a5,a4
	addi	a0,a0,-614
	add	a0,a5,a0
	call	_Z14X6502_RunDebugi
	lla	a5,overclock_enabled
	lbu	a5,0(a5)
	beq	a5,zero,.L990
	la a4, vblankscanlines; lw a4, 0(a4);
	beq	a4,zero,.L990
	la a5, DMC_7bit; lbu a5, 0(a5);
	beq	a5,zero,.L991
	la a5, skip_7bit_overclocking; lbu a5, 0(a5);
	bne	a5,zero,.L990
.L991:
	slli	a5,a4,2
	add	a5,a5,a4
	slli	a3,a5,4
	add	a0,a5,a3
	slli	a0,a0,2
	add	a0,a0,a4
	li	a5,1
	addi	a0,a0,-12
	la a4, overclocking; sb a5, 0(a4);
	call	_Z14X6502_RunDebugi
	la a5, overclocking; sb zero, 0(a5);
.L990:
	lla	a3,.LANCHOR1
	lbu	a5,2(a3)
	li	a0,256
	mv	s0,a3
	andi	a5,a5,31
	sb	a5,2(a3)
	call	_Z14X6502_RunDebugi
	lbu	a5,1(s0)
	andi	a5,a5,24
	beq	a5,zero,.L993
	la a4, .LANCHOR67; lw a4, 0(a4);
	beq	a4,zero,.L994
	lbu	a5,0(s0)
	li	a3,24
	andi	a5,a5,56
	beq	a5,a3,.L994
	jalr	a4
.L994:
	lla	s1,.LANCHOR7
	lw	a5,0(s1)
	beq	a5,zero,.L995
	li	s0,42
	j	.L996
.L1362:
	lw	a5,0(s1)
.L996:
	li	a0,8192
	jalr	a5
	lw	a5,0(s1)
	addi	s0,s0,-1
	li	a0,0
	jalr	a5
	bne	s0,zero,.L1362
.L995:
	la a5, .LANCHOR68; lw a5, 0(a5);
	beq	a5,zero,.L993
	jalr	a5
.L993:
	li	a0,69
	call	_Z14X6502_RunDebugi
	lla	a5,.LANCHOR1
	lbu	a5,1(a5)
	andi	a5,a5,24
	beq	a5,zero,.L999
	la a5, .LANCHOR45; lw a5, 0(a5);
	la a4, .LANCHOR13; sw a5, 0(a4);
	la a4, .LANCHOR7; lw a4, 0(a4);
	beq	a4,zero,.L999
	slli	a5,a5,18
	srli	a0,a5,18
	jalr	a4
.L999:
	lla	a5,XBuf
	lw	a0,0(a5)
	lla	s0,.LANCHOR53
	la a5, .LANCHOR71; sb zero, 0(a5);
	la a5, .LANCHOR72; sw zero, 0(a5);
	call	_ZL7ResetRLPh
	lw	a5,0(s0)
	li	a0,16
	sub	a0,a0,a5
	call	_Z14X6502_RunDebugi
	lla	a5,GameInfo
	lw	a3,0(a5)
	lw	a5,0(s0)
	li	a4,3
	lw	a3,8(a3)
	xori	a5,a5,1
	sw	a5,0(s0)
	beq	a3,a4,.L1363
	lw	a5,48(sp)
	beq	a5,zero,.L1002
	lla	a2,.LANCHOR1
	lbu	a5,2(a2)
	lla	s1,.LANCHOR67
	la a3, .LANCHOR12; lbu a3, 0(a3);
	ori	a5,a5,32
	lw	a4,0(s1)
	sb	a5,2(a2)
	addi	a5,a3,1
	sw	a5,4(sp)
	beq	a4,zero,.L1003
	li	a0,256
	call	_Z14X6502_RunDebugi
	lla	a4,.LANCHOR44
	sw	s1,8(sp)
	la a5, .LANCHOR44; sw zero, 0(a5);
	li	s0,239
	mv	s1,a4
	j	.L1007
.L1005:
	li	a0,85
	beq	a5,s0,.L1006
	li	a0,341
.L1006:
	call	_Z14X6502_RunDebugi
	lw	a5,0(s1)
	addi	a5,a5,1
	sw	a5,0(s1)
	bgt	a5,s0,.L1008
.L1007:
	lla	a5,.LANCHOR1
	lbu	a5,1(a5)
	andi	a5,a5,24
	beq	a5,zero,.L1004
	lw	a5,8(sp)
	lw	a5,0(a5)
	jalr	a5
.L1004:
	lw	a5,0(s1)
	lw	a4,4(sp)
	bne	a5,a4,.L1005
	lla	a4,.LANCHOR1
	lbu	a3,1(a4)
	andi	a3,a3,16
	beq	a3,zero,.L1005
	lbu	a3,2(a4)
	ori	a3,a3,64
	sb	a3,2(a4)
	j	.L1005
.L1359:
	lw	s0,68(sp)
	lw	ra,72(sp)
	lw	s1,64(sp)
	addi	sp,sp,76
	tail	_Z14FCEUX_PPU_Loopi
.L1002:
	lla	a5,.LANCHOR1
	lbu	a5,1(a5)
	lla	a4,DMC_7bit
	lbu	a3,0(a4)
	srli	a5,a5,5
	lla	a4,.LANCHOR30
	sb	a5,0(a4)
	lla	a4,normalscanlines
	lw	a4,0(a4)
	beq	a3,zero,.L1011
	la a3, skip_7bit_overclocking; lbu a3, 0(a3);
	beq	a3,zero,.L1011
.L1012:
	lla	a3,totalscanlines
	sw	a4,0(a3)
	la a3, .LANCHOR44; sw zero, 0(a3);
	ble	a4,zero,.L1364
	lla	a4,.LANCHOR44
	sw	a4,16(sp)
	lla	a4,.LANCHOR17
	li	a0,0
	sw	a4,44(sp)
	j	.L1117
.L1365:
	beq	a0,a5,.L1116
	lla	a4,DMC_7bit
	lbu	a4,0(a4)
	beq	a4,zero,.L1130
	la a3, skip_7bit_overclocking; lbu a3, 0(a3);
	bne	a3,zero,.L1014
.L1115:
	la a3, overclocking; sb a4, 0(a3);
	bge	a0,a5,.L1014
	lla	a5,.LANCHOR30
	lbu	a5,0(a5)
.L1117:
	lla	a4,.LANCHOR73
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,0(a5)
	li	a3,239
	addi	a4,a4,1
	sw	a4,0(a5)
	ble	a0,a3,.L1015
	li	a0,325
	call	_Z14X6502_RunDebugi
	lw	a4,16(sp)
	li	a0,16
	lw	a5,0(a4)
	addi	a5,a5,1
	sw	a5,0(a4)
	call	_Z14X6502_RunDebugi
.L1016:
	lw	a5,16(sp)
	lw	a0,0(a5)
	lla	a5,normalscanlines
	lw	a4,0(a5)
	lla	a5,totalscanlines
	lw	a5,0(a5)
	bge	a0,a4,.L1365
	li	a4,0
	j	.L1115
.L1011:
	lla	a3,overclock_enabled
	lbu	a2,0(a3)
	li	a3,0
	beq	a2,zero,.L1013
	la a3, postrenderscanlines; lw a3, 0(a3);
.L1013:
	add	a4,a4,a3
	j	.L1012
.L1015:
	lla	a5,XBuf
	lw	s0,0(a5)
	lw	a5,44(sp)
	slli	a4,a0,8
	add	s0,s0,a4
	lw	a5,0(a5)
	bne	a5,zero,.L1366
.L1017:
	li	a0,256
	call	_Z14X6502_RunDebugi
	li	a0,272
	call	_ZL11RefreshLinei
	lla	a5,.LANCHOR19
	lw	a5,0(a5)
	bne	a5,zero,.L1367
.L1018:
	li	a0,272
	call	_ZL14CheckSpriteHiti
	la a5, .LANCHOR14; sw zero, 0(a5);
	la a5, .LANCHOR49; lbu a5, 0(a5);
	bne	a5,zero,.L1023
	la a1, .LANCHOR66; lbu a1, 0(a1);
	li	a5,255
	beq	a1,a5,.L1368
.L1024:
	li	a2,256
	ori	a1,a1,64
	mv	a0,s0
	call	memset
.L1023:
	lla	a5,.LANCHOR1
	lbu	a4,1(a5)
	andi	a5,a4,16
	bne	a5,zero,.L1369
.L1026:
	andi	a3,a4,24
	addi	a5,s0,252
	beq	a3,zero,.L1030
	andi	a3,a4,1
	beq	a3,zero,.L1030
	li	a1,808464384
	mv	a4,a5
	addi	a1,a1,48
.L1031:
	lw	a3,0(a4)
	mv	a2,a4
	addi	a4,a4,-4
	and	a3,a3,a1
	sw	a3,4(a4)
	bne	s0,a2,.L1031
	lla	a4,.LANCHOR1
	lbu	a4,1(a4)
.L1030:
	srli	a3,a4,5
	li	a2,7
	beq	a3,a2,.L1370
	andi	a4,a4,224
	beq	a4,zero,.L1036
	li	a2,1077952512
	addi	a2,a2,64
.L1037:
	lw	a4,0(a5)
	mv	a3,a5
	addi	a5,a5,-4
	or	a4,a4,a2
	sw	a4,4(a5)
	bne	s0,a3,.L1037
.L1038:
	lla	a5,.LANCHOR1
	lbu	a5,1(a5)
	li	a4,256
	lla	a3,.LANCHOR3
	sw	a4,0(a3)
	andi	a5,a5,24
	lla	s0,.LANCHOR67
	bne	a5,zero,.L1371
.L1035:
	li	a0,6
	call	_Z14X6502_RunDebugi
	lla	a5,.LANCHOR1
	lbu	a5,1(a5)
	andi	a5,a5,24
	beq	a5,zero,.L1068
	lla	a3,.LANCHOR13
	lw	a4,0(a3)
	li	a5,65536
	addi	a5,a5,-1056
	and	a4,a4,a5
	la a5, .LANCHOR45; lw a5, 0(a5);
	andi	a5,a5,1055
	or	a5,a5,a4
	sw	a5,0(a3)
.L1068:
	li	a0,63
	call	_Z14X6502_RunDebugi
	lw	a4,0(s0)
	beq	a4,zero,.L1372
	lla	s0,.LANCHOR1
	lbu	a5,1(s0)
	andi	a3,a5,24
	beq	a3,zero,.L1067
	lbu	a3,0(s0)
	li	a2,24
	andi	a3,a3,56
	beq	a3,a2,.L1067
	jalr	a4
	lbu	a5,1(s0)
.L1067:
	andi	a5,a5,16
	bne	a5,zero,.L1373
.L1071:
	la a4, .LANCHOR68; lw a4, 0(a4);
	beq	a4,zero,.L1113
	lla	a5,.LANCHOR1
	lbu	a5,1(a5)
	andi	a5,a5,24
	beq	a5,zero,.L1113
	jalr	a4
.L1113:
	lw	a3,16(sp)
	li	a4,239
	lw	a5,0(a3)
	addi	a5,a5,1
	sw	a5,0(a3)
	ble	a5,a4,.L1374
.L1114:
	li	a0,16
	call	_Z14X6502_RunDebugi
	j	.L1016
.L1370:
	li	a2,-1061109760
	addi	a2,a2,192
.L1033:
	lw	a4,0(a5)
	mv	a3,a5
	addi	a5,a5,-4
	or	a4,a4,a2
	sw	a4,4(a5)
	bne	s0,a3,.L1033
	lla	a5,.LANCHOR1
	lbu	a5,1(a5)
	li	a4,256
	lla	a3,.LANCHOR3
	sw	a4,0(a3)
	andi	a5,a5,24
	lla	s0,.LANCHOR67
	beq	a5,zero,.L1035
.L1371:
	lla	a5,.LANCHOR1
	lbu	a2,0(a5)
	lw	a0,16(sp)
	lla	a1,.LANCHOR7
	xori	a5,a2,252
	srli	a5,a5,2
	and	a5,a2,a5
	lw	s1,0(a0)
	srli	a4,a2,1
	slli	a5,a5,9
	li	a0,4096
	and	a5,a5,a0
	andi	a4,a4,16
	lw	a3,0(a1)
	srli	t1,a2,2
	sw	a5,0(sp)
	addi	a5,a4,7
	andi	t1,t1,8
	sw	a5,36(sp)
	sw	zero,40(sp)
	addi	t1,t1,8
	beq	a3,zero,.L1375
	li	a4,0
	sw	t1,4(sp)
	sw	a1,12(sp)
	lw	t1,16(sp)
	lw	a1,44(sp)
	li	a3,63
	lla	s0,.LANCHOR12
	lla	t0,.LANCHOR50
	mv	s1,a4
	j	.L1040
.L1378:
	lla	a0,MMC5SPRVPage
	add	a0,a0,a5
	lw	a5,0(a0)
	add	a5,a5,a4
.L1060:
	lbu	t2,0(a5)
	sw	a4,8(sp)
	li	a0,7
	sb	t2,60(sp)
	bgtu	s1,a0,.L1061
	sw	a5,20(sp)
	lw	a5,12(sp)
	li	a0,8192
	sw	a1,32(sp)
	lw	a2,0(a5)
	sw	t1,28(sp)
	sw	a3,24(sp)
	jalr	a2
	lw	a5,12(sp)
	lw	a4,8(sp)
	lw	a2,0(a5)
	mv	a0,a4
	jalr	a2
	lbu	a2,2(s0)
	lw	a1,32(sp)
	lw	t1,28(sp)
	lw	a3,24(sp)
	lw	a5,20(sp)
	lla	t0,.LANCHOR50
.L1061:
	lbu	a4,8(a5)
	lbu	a5,3(s0)
	sb	a2,62(sp)
	sb	a4,61(sp)
	sb	a5,63(sp)
	slli	a4,s1,2
	lla	a5,.LANCHOR75
	add	a5,a5,a4
	lw	a4,60(sp)
	addi	s1,s1,1
	andi	s1,s1,0xff
	sw	a4,0(a5)
.L1052:
	addi	s0,s0,4
	lla	a5,.LANCHOR12+256
	addi	a3,a3,-1
	beq	s0,a5,.L1376
.L1040:
	lbu	a4,0(s0)
	lw	a5,0(t1)
	sub	a5,a5,a4
	lw	a4,4(sp)
	bgeu	a5,a4,.L1052
	lw	a4,0(t0)
	bge	s1,a4,.L1053
	li	a4,63
	beq	a3,a4,.L1377
.L1054:
	lla	a2,.LANCHOR1
	lbu	t2,0(a2)
	lbu	a4,1(s0)
	lw	a0,0(sp)
	andi	t2,t2,32
	slli	a2,a4,4
	add	a0,a0,a2
	beq	t2,zero,.L1056
	li	a0,4096
	addi	t2,a0,-32
	slli	a4,a4,12
	and	a4,a4,a0
	and	a2,a2,t2
	or	a0,a4,a2
.L1056:
	lbu	a2,2(s0)
	andi	t2,a5,8
	add	a4,a5,t2
	slli	ra,a2,24
	srai	ra,ra,24
	add	a4,a4,a0
	bge	ra,zero,.L1058
	lw	a4,36(sp)
	sub	a5,a4,a5
	sub	a5,a5,t2
	add	a4,a5,a0
.L1058:
	lw	a0,0(a1)
	srli	a5,a4,10
	slli	a5,a5,2
	bne	a0,zero,.L1378
	lla	a0,VPage
	add	a0,a0,a5
	lw	a5,0(a0)
	add	a5,a5,a4
	j	.L1060
.L1373:
	lla	s0,.LANCHOR71
	lbu	a5,0(s0)
	la a4, .LANCHOR72; sw zero, 0(a4);
	beq	a5,zero,.L1071
	li	a2,256
	li	a1,128
	lla	a0,.LANCHOR74
	call	memset
	lbu	a3,0(s0)
	lla	a4,.LANCHOR1
	lbu	a2,2(a4)
	addi	a3,a3,-1
	lbu	a5,1(a4)
	andi	a3,a3,0xff
	slli	a1,a3,2
	lla	a4,.LANCHOR75
	andi	a2,a2,64
	add	a4,a4,a1
	la a1, .LANCHOR76; lbu a1, 0(a1);
	sw	a2,20(sp)
	sb	a3,0(s0)
	andi	a5,a5,1
	sw	a1,12(sp)
	li	a2,-1
	beq	a5,zero,.L1074
	li	a2,48
.L1074:
	slli	a5,a2,24
	srai	a5,a5,24
	andi	ra,a2,0xff
	sw	a5,0(sp)
	sw	zero,8(sp)
	lla	s0,.LANCHOR9
	li	s1,-1
	sw	ra,4(sp)
.L1111:
	lbu	a2,0(a4)
	lbu	a1,1(a4)
	or	a5,a2,a1
	beq	a5,zero,.L1075
	lla	a0,.LANCHOR25
	slli	a2,a2,2
	add	a2,a0,a2
	slli	a1,a1,2
	lla	a0,.LANCHOR26
	lbu	t0,2(a4)
	add	a1,a0,a1
	lw	a0,0(a1)
	lw	a2,0(a2)
	lbu	t2,3(a4)
	slli	a1,t0,2
	andi	a1,a1,12
	or	a2,a2,a0
	lla	a0,.LANCHOR74
	andi	t1,t0,32
	add	a0,a0,t2
	addi	a1,a1,16
	andi	t0,t0,64
	beq	a3,zero,.L1379
.L1076:
	beq	t1,zero,.L1080
	beq	t0,zero,.L1081
.L1078:
	slli	t1,a5,24
	srai	t1,t1,24
	bge	t1,zero,.L1082
	andi	t1,a2,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,0(sp)
	and	t1,t0,t1
	ori	t1,t1,64
	sb	t1,7(a0)
.L1082:
	andi	t1,a5,64
	beq	t1,zero,.L1083
	srli	t1,a2,4
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,0(sp)
	and	t1,t0,t1
	ori	t1,t1,64
	sb	t1,6(a0)
.L1083:
	andi	t1,a5,32
	beq	t1,zero,.L1084
	srli	t1,a2,8
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,0(sp)
	and	t1,t0,t1
	ori	t1,t1,64
	sb	t1,5(a0)
.L1084:
	andi	t1,a5,16
	beq	t1,zero,.L1085
	srli	t1,a2,12
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,0(sp)
	and	t1,t0,t1
	ori	t1,t1,64
	sb	t1,4(a0)
.L1085:
	andi	t1,a5,8
	beq	t1,zero,.L1086
	srli	t1,a2,16
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,0(sp)
	and	t1,t0,t1
	ori	t1,t1,64
	sb	t1,3(a0)
.L1086:
	andi	t1,a5,4
	beq	t1,zero,.L1087
	srli	t1,a2,20
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,0(sp)
	and	t1,t0,t1
	ori	t1,t1,64
	sb	t1,2(a0)
.L1087:
	andi	t1,a5,2
	beq	t1,zero,.L1088
	srli	t1,a2,24
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,0(sp)
	and	t1,t0,t1
	ori	t1,t1,64
	sb	t1,1(a0)
.L1088:
	andi	a5,a5,1
	beq	a5,zero,.L1075
	srli	a5,a2,28
	or	a5,a5,a1
	add	a5,s0,a5
	lbu	a5,0(a5)
	lw	a2,0(sp)
	and	a5,a2,a5
	ori	a5,a5,64
	sb	a5,0(a0)
.L1075:
	addi	a3,a3,-1
	addi	a4,a4,-4
	bne	a3,s1,.L1111
	lw	a5,8(sp)
	beq	a5,zero,.L1112
	lw	a4,52(sp)
	la a5, .LANCHOR4; sb a4, 0(a5);
	lw	a4,56(sp)
	lla	a5,.LANCHOR3
	sw	a4,0(a5)
.L1112:
	la a5, .LANCHOR76; sb zero, 0(a5);
	li	a5,1
	la a4, .LANCHOR72; sw a5, 0(a4);
	j	.L1071
.L1379:
	lw	ra,12(sp)
	beq	ra,zero,.L1076
	lw	ra,20(sp)
	bne	ra,zero,.L1076
	sw	t2,56(sp)
	beq	t0,zero,.L1077
	srli	t2,a5,1
	srli	t0,a5,3
	slli	ra,a5,7
	andi	t0,t0,4
	andi	t2,t2,8
	or	t2,t2,ra
	mv	ra,t0
	srli	t0,a5,5
	andi	t0,t0,2
	or	t2,t2,ra
	mv	ra,t0
	slli	t0,a5,5
	andi	t0,t0,64
	or	t2,t2,ra
	mv	ra,t0
	slli	t0,a5,3
	andi	t0,t0,32
	or	t2,t2,ra
	mv	ra,t0
	slli	t0,a5,1
	or	t2,t2,ra
	andi	t0,t0,16
	or	t0,t2,t0
	srli	t2,a5,7
	or	t0,t0,t2
	andi	t0,t0,0xff
	sw	t0,52(sp)
	bne	t1,zero,.L1380
	slli	t1,a5,24
	li	t0,1
	srai	t1,t1,24
	sw	t0,8(sp)
.L1124:
	bge	t1,zero,.L1097
	andi	t1,a2,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,4(sp)
	and	t1,t0,t1
	sb	t1,7(a0)
.L1097:
	andi	t1,a5,64
	beq	t1,zero,.L1098
	srli	t1,a2,4
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,4(sp)
	and	t1,t0,t1
	sb	t1,6(a0)
.L1098:
	andi	t1,a5,32
	beq	t1,zero,.L1099
	srli	t1,a2,8
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,4(sp)
	and	t1,t0,t1
	sb	t1,5(a0)
.L1099:
	andi	t1,a5,16
	beq	t1,zero,.L1100
	srli	t1,a2,12
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,4(sp)
	and	t1,t0,t1
	sb	t1,4(a0)
.L1100:
	andi	t1,a5,8
	beq	t1,zero,.L1101
	srli	t1,a2,16
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,4(sp)
	and	t1,t0,t1
	sb	t1,3(a0)
.L1101:
	andi	t1,a5,4
	beq	t1,zero,.L1102
	srli	t1,a2,20
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,4(sp)
	and	t1,t0,t1
	sb	t1,2(a0)
.L1102:
	andi	t1,a5,2
	beq	t1,zero,.L1103
	srli	t1,a2,24
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,4(sp)
	and	t1,t0,t1
	sb	t1,1(a0)
.L1103:
	andi	a5,a5,1
	beq	a5,zero,.L1075
	srli	a5,a2,28
	or	a5,a5,a1
	add	a5,s0,a5
	lbu	a5,0(a5)
	lw	a2,4(sp)
	and	a5,a2,a5
	sb	a5,0(a0)
	j	.L1075
.L1369:
	la a5, .LANCHOR72; lw a5, 0(a5);
	beq	a5,zero,.L1026
	la a5, .LANCHOR72; sw zero, 0(a5);
	la a5, .LANCHOR48; lbu a5, 0(a5);
	beq	a5,zero,.L1026
	lla	a5,.LANCHOR74
	mv	a3,s0
	lla	a1,.LANCHOR74+256
.L1029:
	lbu	a4,0(a5)
	slli	a2,a4,24
	srai	a2,a2,24
	blt	a2,zero,.L1027
	andi	a2,a4,64
	beq	a2,zero,.L1028
	lbu	a2,0(a3)
	andi	a2,a2,64
	beq	a2,zero,.L1027
.L1028:
	sb	a4,0(a3)
.L1027:
	addi	a5,a5,1
	addi	a3,a3,1
	bne	a1,a5,.L1029
	lla	a5,.LANCHOR1
	lbu	a4,1(a5)
	j	.L1026
.L1377:
	li	a4,1
	sw	a4,40(sp)
	j	.L1054
.L1036:
	li	a1,1061109760
	li	a2,-2139062272
	mv	a4,a5
	addi	a1,a1,-193
	addi	a2,a2,128
.L1039:
	lw	a5,0(a4)
	mv	a3,a4
	addi	a4,a4,-4
	and	a5,a5,a1
	or	a5,a5,a2
	sw	a5,4(a4)
	bne	s0,a3,.L1039
	j	.L1038
.L1374:
	lla	a4,XBuf
	lw	a0,0(a4)
	slli	a5,a5,8
	add	a0,a0,a5
	call	_ZL7ResetRLPh
	j	.L1114
.L1366:
	call	_Z7MMC5_hbi
	j	.L1017
.L1367:
	lla	a5,.LANCHOR1
	lbu	a5,1(a5)
	andi	a5,a5,24
	beq	a5,zero,.L1018
	lla	a3,.LANCHOR13
	lw	a4,0(a3)
	li	a2,28672
	li	a5,4096
	and	a1,a4,a2
	add	a5,a4,a5
	beq	a1,a2,.L1381
.L1021:
	sw	a5,0(a3)
	j	.L1018
.L1381:
	andi	a2,a4,992
	li	a0,928
	xor	a5,a4,a1
	beq	a2,a0,.L1382
	li	a0,992
	addi	a5,a5,32
	bne	a2,a0,.L1021
	addi	a1,a1,992
	xor	a5,a4,a1
	sw	a5,0(a3)
	j	.L1018
.L1080:
	slli	t1,a5,24
	srai	t1,t1,24
	bne	t0,zero,.L1124
.L1096:
	bge	t1,zero,.L1104
	andi	t1,a2,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,4(sp)
	and	t1,t0,t1
	sb	t1,0(a0)
.L1104:
	andi	t1,a5,64
	beq	t1,zero,.L1105
	srli	t1,a2,4
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,4(sp)
	and	t1,t0,t1
	sb	t1,1(a0)
.L1105:
	andi	t1,a5,32
	beq	t1,zero,.L1106
	srli	t1,a2,8
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,4(sp)
	and	t1,t0,t1
	sb	t1,2(a0)
.L1106:
	andi	t1,a5,16
	beq	t1,zero,.L1107
	srli	t1,a2,12
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,4(sp)
	and	t1,t0,t1
	sb	t1,3(a0)
.L1107:
	andi	t1,a5,8
	beq	t1,zero,.L1108
	srli	t1,a2,16
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,4(sp)
	and	t1,t0,t1
	sb	t1,4(a0)
.L1108:
	andi	t1,a5,4
	beq	t1,zero,.L1109
	srli	t1,a2,20
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,4(sp)
	and	t1,t0,t1
	sb	t1,5(a0)
.L1109:
	andi	t1,a5,2
	beq	t1,zero,.L1110
	srli	t1,a2,24
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,4(sp)
	and	t1,t0,t1
	sb	t1,6(a0)
.L1110:
	andi	a5,a5,1
	beq	a5,zero,.L1075
	srli	a5,a2,28
	or	a5,a5,a1
	add	a5,s0,a5
	lbu	a5,0(a5)
	lw	a2,4(sp)
	and	a5,a2,a5
	sb	a5,7(a0)
	j	.L1075
.L1372:
	lla	a5,.LANCHOR1
	lbu	a5,1(a5)
	j	.L1067
.L1130:
	li	a4,1
	j	.L1115
.L1368:
	lla	a5,.LANCHOR1
	lbu	a5,1(a5)
	la a1, .LANCHOR9; lbu a1, 0(a1);
	andi	a5,a5,1
	beq	a5,zero,.L1024
	andi	a1,a1,48
	j	.L1024
.L1077:
	beq	t1,zero,.L1356
	li	t1,1
	sw	a5,52(sp)
	sw	t1,8(sp)
.L1081:
	slli	t1,a5,24
	srai	t1,t1,24
	bge	t1,zero,.L1089
	andi	t1,a2,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,0(sp)
	and	t1,t0,t1
	ori	t1,t1,64
	sb	t1,0(a0)
.L1089:
	andi	t1,a5,64
	beq	t1,zero,.L1090
	srli	t1,a2,4
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,0(sp)
	and	t1,t0,t1
	ori	t1,t1,64
	sb	t1,1(a0)
.L1090:
	andi	t1,a5,32
	beq	t1,zero,.L1091
	srli	t1,a2,8
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,0(sp)
	and	t1,t0,t1
	ori	t1,t1,64
	sb	t1,2(a0)
.L1091:
	andi	t1,a5,16
	beq	t1,zero,.L1092
	srli	t1,a2,12
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,0(sp)
	and	t1,t0,t1
	ori	t1,t1,64
	sb	t1,3(a0)
.L1092:
	andi	t1,a5,8
	beq	t1,zero,.L1093
	srli	t1,a2,16
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,0(sp)
	and	t1,t0,t1
	ori	t1,t1,64
	sb	t1,4(a0)
.L1093:
	andi	t1,a5,4
	beq	t1,zero,.L1094
	srli	t1,a2,20
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,0(sp)
	and	t1,t0,t1
	ori	t1,t1,64
	sb	t1,5(a0)
.L1094:
	andi	t1,a5,2
	beq	t1,zero,.L1095
	srli	t1,a2,24
	andi	t1,t1,3
	or	t1,t1,a1
	add	t1,s0,t1
	lbu	t1,0(t1)
	lw	t0,0(sp)
	and	t1,t0,t1
	ori	t1,t1,64
	sb	t1,6(a0)
.L1095:
	andi	a5,a5,1
	beq	a5,zero,.L1075
	srli	a5,a2,28
	or	a5,a5,a1
	add	a5,s0,a5
	lbu	a5,0(a5)
	lw	a2,0(sp)
	and	a5,a2,a5
	ori	a5,a5,64
	sb	a5,7(a0)
	j	.L1075
.L1053:
	lla	a3,.LANCHOR1
	lbu	a5,2(a3)
	lw	a1,12(sp)
	mv	a4,s1
	ori	a5,a5,32
	sb	a5,2(a3)
.L1062:
	li	a3,8
	bgtu	a4,a3,.L1123
	lw	a5,0(a1)
	beq	a5,zero,.L1064
	sub	s1,a3,a4
	beq	a3,a4,.L1064
	sw	s1,4(sp)
	li	s0,0
	sw	a4,8(sp)
	mv	s1,a1
	j	.L1065
.L1383:
	lw	a5,0(s1)
.L1065:
	li	a0,8192
	jalr	a5
	lw	a5,0(s1)
	lw	a0,0(sp)
	addi	s0,s0,1
	jalr	a5
	lw	a5,4(sp)
	bne	s0,a5,.L1383
	lw	a4,8(sp)
.L1064:
	la a3, .LANCHOR71; sb a4, 0(a3);
	lw	a3,40(sp)
	lla	s0,.LANCHOR67
	lw	a5,0(s0)
	la a4, .LANCHOR76; sb a3, 0(a4);
	beq	a5,zero,.L1035
	lla	s1,.LANCHOR1
	lbu	a5,1(s1)
	andi	a5,a5,24
	beq	a5,zero,.L1035
	lbu	a5,0(s1)
	li	a4,24
	andi	a5,a5,56
	beq	a5,a4,.L1035
	li	a0,6
	call	_Z14X6502_RunDebugi
	lbu	a5,1(s1)
	andi	a5,a5,24
	beq	a5,zero,.L1066
	lla	a3,.LANCHOR13
	lw	a4,0(a3)
	li	a5,65536
	addi	a5,a5,-1056
	and	a4,a4,a5
	la a5, .LANCHOR45; lw a5, 0(a5);
	andi	a5,a5,1055
	or	a5,a5,a4
	sw	a5,0(a3)
.L1066:
	li	a0,4
	call	_Z14X6502_RunDebugi
	lw	a5,0(s0)
	jalr	a5
	li	a0,59
	call	_Z14X6502_RunDebugi
	lla	a5,.LANCHOR1
	lbu	a5,1(a5)
	j	.L1067
.L1042:
	lla	a3,.LANCHOR1
	lbu	a5,2(a3)
	ori	a5,a5,32
	sb	a5,2(a3)
.L1050:
	li	a5,8
	bleu	a4,a5,.L1064
.L1123:
	lla	a3,.LANCHOR1
	lbu	a5,2(a3)
	ori	a5,a5,32
	sb	a5,2(a3)
	j	.L1064
.L1375:
	andi	a5,a2,32
	sw	t1,4(sp)
	li	a1,63
	lw	t1,44(sp)
	li	a4,0
	lla	a3,.LANCHOR12
	lla	s0,.LANCHOR50
	sw	a5,8(sp)
	j	.L1051
.L1385:
	lla	t0,MMC5SPRVPage
	add	t0,t0,a5
	lw	a5,0(t0)
	add	a5,a5,a2
.L1049:
	lbu	t0,0(a5)
	lbu	a2,8(a5)
	lbu	a5,3(a3)
	sb	t0,60(sp)
	sb	a2,61(sp)
	sb	a5,63(sp)
	lla	a2,.LANCHOR75
	slli	a5,a4,2
	sb	a0,62(sp)
	add	a5,a2,a5
	lw	a2,60(sp)
	addi	a4,a4,1
	andi	a4,a4,0xff
	sw	a2,0(a5)
.L1041:
	addi	a3,a3,4
	lla	a5,.LANCHOR12+256
	addi	a1,a1,-1
	beq	a3,a5,.L1050
.L1051:
	lbu	a5,0(a3)
	lw	a2,4(sp)
	sub	a5,s1,a5
	bgeu	a5,a2,.L1041
	lw	a2,0(s0)
	bge	a4,a2,.L1042
	li	a2,63
	beq	a1,a2,.L1384
.L1043:
	lbu	a2,1(a3)
	lw	t0,0(sp)
	lw	t2,8(sp)
	slli	a0,a2,4
	add	t0,t0,a0
	beq	t2,zero,.L1045
	li	t0,4096
	slli	a2,a2,12
	and	a2,a2,t0
	addi	t0,t0,-32
	and	a0,a0,t0
	or	t0,a2,a0
.L1045:
	lbu	a0,2(a3)
	andi	t2,a5,8
	add	a2,a5,t2
	slli	ra,a0,24
	srai	ra,ra,24
	add	a2,a2,t0
	bge	ra,zero,.L1047
	lw	a2,36(sp)
	sub	a5,a2,a5
	sub	a5,a5,t2
	add	a2,a5,t0
.L1047:
	lw	t0,0(t1)
	srli	a5,a2,10
	slli	a5,a5,2
	bne	t0,zero,.L1385
	lla	t0,VPage
	add	a5,t0,a5
	lw	a5,0(a5)
	add	a5,a5,a2
	j	.L1049
.L1384:
	li	a2,1
	sw	a2,40(sp)
	j	.L1043
.L1116:
	la a5, overclocking; sb zero, 0(a5);
.L1014:
	lw	a5,44(sp)
	la a4, DMC_7bit; sb zero, 0(a4);
	lw	a5,0(a5)
	bne	a5,zero,.L1386
.L1118:
	lw	a0,48(sp)
	lla	a5,.LANCHOR73
	li	a2,0
	li	a4,1
	li	a1,7
.L1120:
	lw	a3,4(a5)
	ble	a3,a2,.L1119
	mv	a2,a3
	mv	a0,a4
.L1119:
	sw	zero,4(a5)
	addi	a4,a4,1
	addi	a5,a5,4
	bne	a4,a1,.L1120
	andi	a0,a0,0xff
	li	a1,0
	call	_Z21SetNESDeemph_OldHackyhi
	li	a5,1
	sw	a5,0(sp)
	call	_Z7ShowFPSv
	lw	ra,72(sp)
	lw	s0,68(sp)
	lw	a0,0(sp)
	lw	s1,64(sp)
	addi	sp,sp,76
	jr	ra
.L1003:
	lw	a3,4(sp)
	li	a5,239
	bgt	a3,a5,.L1009
	slli	a5,a3,2
	add	a5,a5,a3
	slli	a4,a5,4
	add	a5,a5,a4
	slli	a0,a5,2
	add	a0,a0,a3
	call	_Z14X6502_RunDebugi
	lla	a4,.LANCHOR1
	lbu	a5,1(a4)
	andi	a5,a5,16
	beq	a5,zero,.L1010
	lbu	a5,2(a4)
	ori	a5,a5,64
	sb	a5,2(a4)
.L1010:
	lw	a5,4(sp)
	li	a0,240
	sub	a0,a0,a5
	slli	a5,a0,2
	add	a5,a5,a0
	slli	a4,a5,4
	add	a5,a5,a4
	slli	a5,a5,2
	add	a0,a5,a0
	call	_Z14X6502_RunDebugi
.L1008:
	call	_Z7ShowFPSv
	lw	ra,72(sp)
	lw	s0,68(sp)
	lw	a0,0(sp)
	lw	s1,64(sp)
	addi	sp,sp,76
	jr	ra
.L1376:
	lw	a1,12(sp)
	mv	a4,s1
	j	.L1062
.L1361:
	call	_Z10TriggerNMIv
	j	.L989
.L1363:
	la a0, normalscanlines; lw a0, 0(a0);
	slli	a5,a0,2
	add	a5,a5,a0
	slli	a4,a5,4
	add	a5,a5,a4
	slli	a5,a5,2
	add	a0,a5,a0
	call	_Z14X6502_RunDebugi
	j	.L984
.L1009:
	li	a0,81920
	addi	a0,a0,-80
	call	_Z14X6502_RunDebugi
	j	.L1008
.L1380:
	li	t1,1
	sw	t1,8(sp)
	j	.L1078
.L1356:
	slli	t1,a5,24
	li	t0,1
	srai	t1,t1,24
	sw	a5,52(sp)
	sw	t0,8(sp)
	j	.L1096
.L1386:
	la a0, .LANCHOR44; lw a0, 0(a0);
	call	_Z7MMC5_hbi
	j	.L1118
.L1382:
	li	a5,32768
	addi	a5,a5,-1120
	xor	a5,a4,a5
	sw	a5,0(a3)
	j	.L1018
.L1364:
	lla	a5,.LANCHOR17
	sw	a5,44(sp)
	j	.L1014
.L1360:
	lla	s0,.LC0
	li	a0,65
.L986:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L986
	lla	s0,.LC9
	li	a0,65
.L987:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L987
	lla	s0,.LC10
	li	a0,32
.L988:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L988
	li	a0,1
	call	halt
	.size	_Z12FCEUPPU_Loopi, .-_Z12FCEUPPU_Loopi
	.section	.text.startup._GLOBAL__sub_I_test,"ax",@progbits
	.align	2
	.type	_GLOBAL__sub_I_test, @function
_GLOBAL__sub_I_test:
	addi	sp,sp,-4
	sw	s0,0(sp)
	li	a5,32768
	lla	s0,.LANCHOR69
	sw	a5,0(s0)
	li	t0,7
	li	a2,2
	li	t2,128
	li	t1,1
.L1391:
	slli	t1,t1,1
	srai	t2,t2,1
	ble	t1,zero,.L1388
	andi	a0,t2,0xff
	lla	a5,.LANCHOR69
	add	a1,t1,s0
	li	a4,0
	j	.L1390
.L1389:
	lbu	a4,0(a5)
.L1390:
	add	a3,a5,a2
	add	a4,a0,a4
	sb	a4,0(a3)
	addi	a5,a5,1
	bne	a5,a1,.L1389
	add	a2,t1,a2
.L1388:
	addi	t0,t0,-1
	bne	t0,zero,.L1391
	lw	s0,0(sp)
	addi	sp,sp,4
	jr	ra
	.size	_GLOBAL__sub_I_test, .-_GLOBAL__sub_I_test
	.section	.init_array,"aw"
	.align	2
	.word	_GLOBAL__sub_I_test
	.hidden	framectr
	.globl	framectr
	.hidden	bgdata
	.globl	bgdata
	.hidden	totpputime
	.globl	totpputime
	.hidden	pputime
	.globl	pputime
	.hidden	FCEU_NEWPPU_STATEINFO
	.globl	FCEU_NEWPPU_STATEINFO
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC11:
	.string	"IDLS"
	.align	2
.LC12:
	.string	"SR_0"
	.align	2
.LC13:
	.string	"SR_1"
	.align	2
.LC14:
	.string	"SR_2"
	.align	2
.LC15:
	.string	"SR_3"
	.align	2
.LC16:
	.string	"SRx0"
	.align	2
.LC17:
	.string	"SRx1"
	.align	2
.LC18:
	.string	"SRx2"
	.align	2
.LC19:
	.string	"SRx3"
	.align	2
.LC20:
	.string	"SRx4"
	.align	2
.LC21:
	.string	"SRx5"
	.align	2
.LC22:
	.string	"SRx6"
	.align	2
.LC23:
	.string	"SRx7"
	.align	2
.LC24:
	.string	"SR_4"
	.align	2
.LC25:
	.string	"SR_5"
	.align	2
.LC26:
	.string	"SR_6"
	.align	2
.LC27:
	.string	"PFVx"
	.align	2
.LC28:
	.string	"PVxx"
	.align	2
.LC29:
	.string	"PHxx"
	.align	2
.LC30:
	.string	"PVTx"
	.align	2
.LC31:
	.string	"PHTx"
	.align	2
.LC32:
	.string	"P_FV"
	.align	2
.LC33:
	.string	"P_Vx"
	.align	2
.LC34:
	.string	"P_Hx"
	.align	2
.LC35:
	.string	"P_VT"
	.align	2
.LC36:
	.string	"P_HT"
	.align	2
.LC37:
	.string	"PFHx"
	.align	2
.LC38:
	.string	"PSxx"
	.align	2
.LC39:
	.string	"PST0"
	.align	2
.LC40:
	.string	"PST1"
	.align	2
.LC41:
	.string	"PST2"
	.hidden	FCEUPPU_STATEINFO
	.globl	FCEUPPU_STATEINFO
	.align	2
.LC42:
	.string	"NTAR"
	.align	2
.LC43:
	.string	"PRAM"
	.align	2
.LC44:
	.string	"SPRA"
	.align	2
.LC45:
	.string	"PPUR"
	.align	2
.LC46:
	.string	"KOOK"
	.align	2
.LC47:
	.string	"DEAD"
	.align	2
.LC48:
	.string	"PSPL"
	.align	2
.LC49:
	.string	"XOFF"
	.align	2
.LC50:
	.string	"VTGL"
	.align	2
.LC51:
	.string	"RADD"
	.align	2
.LC52:
	.string	"TADD"
	.align	2
.LC53:
	.string	"VBUF"
	.align	2
.LC54:
	.string	"PGEN"
	.hidden	PPU_MASTER
	.globl	PPU_MASTER
	.hidden	linestartts
	.globl	linestartts
	.hidden	newppu
	.globl	newppu
	.hidden	FFCEUX_PPUWrite
	.globl	FFCEUX_PPUWrite
	.hidden	FFCEUX_PPURead
	.globl	FFCEUX_PPURead
	.hidden	cdloggerVideoDataSize
	.globl	cdloggerVideoDataSize
	.hidden	cdloggervdata
	.globl	cdloggervdata
	.hidden	LogAddress
	.globl	LogAddress
	.hidden	undefinedvromcount
	.globl	undefinedvromcount
	.hidden	vromreadcount
	.globl	vromreadcount
	.hidden	rendercount
	.globl	rendercount
	.hidden	UPALRAM
	.globl	UPALRAM
	.hidden	SPRBUF
	.globl	SPRBUF
	.hidden	SPRAM
	.globl	SPRAM
	.hidden	PALRAM
	.globl	PALRAM
	.hidden	NTARAM
	.globl	NTARAM
	.hidden	PPUSPL
	.globl	PPUSPL
	.hidden	PPU
	.globl	PPU
	.hidden	g_rasterpos
	.globl	g_rasterpos
	.hidden	scanline
	.globl	scanline
	.hidden	NTRefreshAddr
	.globl	NTRefreshAddr
	.hidden	DummyRead
	.globl	DummyRead
	.hidden	RefreshAddr
	.globl	RefreshAddr
	.hidden	TempAddr
	.globl	TempAddr
	.hidden	SpriteDMA
	.globl	SpriteDMA
	.hidden	XOffset
	.globl	XOffset
	.hidden	vtoggle
	.globl	vtoggle
	.hidden	PPU_hook
	.globl	PPU_hook
	.hidden	GameHBIRQHook2
	.globl	GameHBIRQHook2
	.hidden	GameHBIRQHook
	.globl	GameHBIRQHook
	.hidden	PPUCHRRAM
	.globl	PPUCHRRAM
	.hidden	PPUNTARAM
	.globl	PPUNTARAM
	.hidden	vnapage
	.globl	vnapage
	.hidden	PPUGenLatch
	.globl	PPUGenLatch
	.hidden	VRAMBuffer
	.globl	VRAMBuffer
	.hidden	qtaintramreg
	.globl	qtaintramreg
	.hidden	QTAINTRAM
	.globl	QTAINTRAM
	.hidden	QTAIHack
	.globl	QTAIHack
	.hidden	PEC586Hack
	.globl	PEC586Hack
	.hidden	MMC5HackSPPage
	.globl	MMC5HackSPPage
	.hidden	MMC5HackSPScroll
	.globl	MMC5HackSPScroll
	.hidden	MMC50x5130
	.globl	MMC50x5130
	.hidden	MMC5HackSPMode
	.globl	MMC5HackSPMode
	.hidden	MMC5HackCHRMode
	.globl	MMC5HackCHRMode
	.hidden	MMC5HackVROMPTR
	.globl	MMC5HackVROMPTR
	.hidden	MMC5HackExNTARAMPtr
	.globl	MMC5HackExNTARAMPtr
	.hidden	MMC5HackVROMMask
	.globl	MMC5HackVROMMask
	.hidden	MMC5Hack
	.globl	MMC5Hack
	.hidden	gNoBGFillColor
	.globl	gNoBGFillColor
	.hidden	fceuindbg
	.globl	fceuindbg
	.hidden	ppur
	.globl	ppur
	.hidden	idleSynch
	.globl	idleSynch
	.hidden	spr_read
	.globl	spr_read
	.hidden	ppuphase
	.globl	ppuphase
	.hidden	bitrevlut
	.globl	bitrevlut
	.hidden	test
	.globl	test
	.section	.bss.NTARAM,"aw",@nobits
	.align	2
	.type	NTARAM, @object
	.size	NTARAM, 2048
NTARAM:
	.zero	2048
	.section	.bss.PALRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR9,. + 0
	.type	PALRAM, @object
	.size	PALRAM, 32
PALRAM:
	.zero	32
	.section	.bss.QTAINTRAM,"aw",@nobits
	.align	2
	.type	QTAINTRAM, @object
	.size	QTAINTRAM, 2048
QTAINTRAM:
	.zero	2048
	.section	.bss.SPRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR12,. + 0
	.type	SPRAM, @object
	.size	SPRAM, 256
SPRAM:
	.zero	256
	.section	.bss.SPRBUF,"aw",@nobits
	.align	2
	.set	.LANCHOR75,. + 0
	.type	SPRBUF, @object
	.size	SPRBUF, 256
SPRBUF:
	.zero	256
	.section	.bss._ZL10sprlinebuf,"aw",@nobits
	.align	2
	.set	.LANCHOR74,. + 0
	.type	_ZL10sprlinebuf, @object
	.size	_ZL10sprlinebuf, 264
_ZL10sprlinebuf:
	.zero	264
	.section	.bss._ZL7ppulut1,"aw",@nobits
	.align	2
	.set	.LANCHOR25,. + 0
	.type	_ZL7ppulut1, @object
	.size	_ZL7ppulut1, 1024
_ZL7ppulut1:
	.zero	1024
	.section	.bss._ZL7ppulut2,"aw",@nobits
	.align	2
	.set	.LANCHOR26,. + 0
	.type	_ZL7ppulut2, @object
	.size	_ZL7ppulut2, 1024
_ZL7ppulut2:
	.zero	1024
	.section	.bss._ZL7ppulut3,"aw",@nobits
	.align	2
	.set	.LANCHOR27,. + 0
	.type	_ZL7ppulut3, @object
	.size	_ZL7ppulut3, 512
_ZL7ppulut3:
	.zero	512
	.section	.bss._ZL8PALcache,"aw",@nobits
	.align	2
	.set	.LANCHOR21,. + 0
	.type	_ZL8PALcache, @object
	.size	_ZL8PALcache, 512
_ZL8PALcache:
	.zero	512
	.section	.bss._ZL8deempcnt,"aw",@nobits
	.align	2
	.set	.LANCHOR73,. + 0
	.type	_ZL8deempcnt, @object
	.size	_ZL8deempcnt, 32
_ZL8deempcnt:
	.zero	32
	.section	.bss._ZZ14FCEUX_PPU_LoopiE4oams,"aw",@nobits
	.align	2
	.set	.LANCHOR65,. + 0
	.type	_ZZ14FCEUX_PPU_LoopiE4oams, @object
	.size	_ZZ14FCEUX_PPU_LoopiE4oams, 1024
_ZZ14FCEUX_PPU_LoopiE4oams:
	.zero	1024
	.section	.bss.bgdata,"aw",@nobits
	.align	2
	.set	.LANCHOR64,. + 0
	.type	bgdata, @object
	.size	bgdata, 204
bgdata:
	.zero	204
	.section	.bss.bitrevlut,"aw",@nobits
	.align	2
	.set	.LANCHOR69,. + 0
	.type	bitrevlut, @object
	.size	bitrevlut, 256
bitrevlut:
	.zero	256
	.section	.bss.ppur,"aw",@nobits
	.align	2
	.set	.LANCHOR31,. + 0
	.type	ppur, @object
	.size	ppur, 64
ppur:
	.zero	64
	.section	.bss.spr_read,"aw",@nobits
	.align	2
	.set	.LANCHOR47,. + 0
	.type	spr_read, @object
	.size	spr_read, 60
spr_read:
	.zero	60
	.section	.bss.vnapage,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	vnapage, @object
	.size	vnapage, 16
vnapage:
	.zero	16
	.section	.data.FCEUPPU_STATEINFO,"aw"
	.align	2
	.type	FCEUPPU_STATEINFO, @object
	.size	FCEUPPU_STATEINFO, 168
FCEUPPU_STATEINFO:
	.word	NTARAM
	.word	2048
	.word	.LC42
	.word	PALRAM
	.word	32
	.word	.LC43
	.word	SPRAM
	.word	256
	.word	.LC44
	.word	PPU
	.word	4
	.word	.LC45
	.word	_ZL4kook
	.word	1
	.word	.LC46
	.word	_ZL7ppudead
	.word	1
	.word	.LC47
	.word	PPUSPL
	.word	1
	.word	.LC48
	.word	XOffset
	.word	1
	.word	.LC49
	.word	vtoggle
	.word	1
	.word	.LC50
	.word	_ZL12RefreshAddrT
	.word	-2147483646
	.word	.LC51
	.word	_ZL9TempAddrT
	.word	-2147483646
	.word	.LC52
	.word	VRAMBuffer
	.word	1
	.word	.LC53
	.word	PPUGenLatch
	.word	1
	.word	.LC54
	.word	0
	.zero	8
	.section	.data.FCEU_NEWPPU_STATEINFO,"aw"
	.align	2
	.type	FCEU_NEWPPU_STATEINFO, @object
	.size	FCEU_NEWPPU_STATEINFO, 384
FCEU_NEWPPU_STATEINFO:
	.word	idleSynch
	.word	1
	.word	.LC11
	.word	spr_read
	.word	-2147483644
	.word	.LC12
	.word	spr_read+4
	.word	-2147483644
	.word	.LC13
	.word	spr_read+8
	.word	-2147483644
	.word	.LC14
	.word	spr_read+12
	.word	-2147483644
	.word	.LC15
	.word	spr_read+16
	.word	-2147483644
	.word	.LC16
	.word	spr_read+16
	.word	-2147483644
	.word	.LC17
	.word	spr_read+16
	.word	-2147483644
	.word	.LC18
	.word	spr_read+16
	.word	-2147483644
	.word	.LC19
	.word	spr_read+16
	.word	-2147483644
	.word	.LC20
	.word	spr_read+16
	.word	-2147483644
	.word	.LC21
	.word	spr_read+16
	.word	-2147483644
	.word	.LC22
	.word	spr_read+16
	.word	-2147483644
	.word	.LC23
	.word	spr_read+48
	.word	-2147483644
	.word	.LC24
	.word	spr_read+52
	.word	-2147483644
	.word	.LC25
	.word	spr_read+56
	.word	-2147483644
	.word	.LC26
	.word	ppur
	.word	-2147483644
	.word	.LC27
	.word	ppur+4
	.word	-2147483644
	.word	.LC28
	.word	ppur+8
	.word	-2147483644
	.word	.LC29
	.word	ppur+12
	.word	-2147483644
	.word	.LC30
	.word	ppur+16
	.word	-2147483644
	.word	.LC31
	.word	ppur+20
	.word	-2147483644
	.word	.LC32
	.word	ppur+24
	.word	-2147483644
	.word	.LC33
	.word	ppur+28
	.word	-2147483644
	.word	.LC34
	.word	ppur+32
	.word	-2147483644
	.word	.LC35
	.word	ppur+36
	.word	-2147483644
	.word	.LC36
	.word	ppur+40
	.word	-2147483644
	.word	.LC37
	.word	ppur+44
	.word	-2147483644
	.word	.LC38
	.word	ppur+52
	.word	-2147483644
	.word	.LC39
	.word	ppur+56
	.word	-2147483644
	.word	.LC40
	.word	ppur+60
	.word	-2147483644
	.word	.LC41
	.word	0
	.zero	8
	.section	.sbss.DummyRead,"aw",@nobits
	.align	2
	.set	.LANCHOR46,. + 0
	.type	DummyRead, @object
	.size	DummyRead, 4
DummyRead:
	.zero	4
	.section	.sbss.FFCEUX_PPURead,"aw",@nobits
	.align	2
	.set	.LANCHOR43,. + 0
	.type	FFCEUX_PPURead, @object
	.size	FFCEUX_PPURead, 4
FFCEUX_PPURead:
	.zero	4
	.section	.sbss.FFCEUX_PPUWrite,"aw",@nobits
	.align	2
	.set	.LANCHOR40,. + 0
	.type	FFCEUX_PPUWrite, @object
	.size	FFCEUX_PPUWrite, 4
FFCEUX_PPUWrite:
	.zero	4
	.section	.sbss.GameHBIRQHook,"aw",@nobits
	.align	2
	.set	.LANCHOR67,. + 0
	.type	GameHBIRQHook, @object
	.size	GameHBIRQHook, 4
GameHBIRQHook:
	.zero	4
	.section	.sbss.GameHBIRQHook2,"aw",@nobits
	.align	2
	.set	.LANCHOR68,. + 0
	.type	GameHBIRQHook2, @object
	.size	GameHBIRQHook2, 4
GameHBIRQHook2:
	.zero	4
	.section	.sbss.MMC50x5130,"aw",@nobits
	.set	.LANCHOR36,. + 0
	.type	MMC50x5130, @object
	.size	MMC50x5130, 1
MMC50x5130:
	.zero	1
	.section	.sbss.MMC5Hack,"aw",@nobits
	.align	2
	.set	.LANCHOR17,. + 0
	.type	MMC5Hack, @object
	.size	MMC5Hack, 4
MMC5Hack:
	.zero	4
	.section	.sbss.MMC5HackCHRMode,"aw",@nobits
	.set	.LANCHOR32,. + 0
	.type	MMC5HackCHRMode, @object
	.size	MMC5HackCHRMode, 1
MMC5HackCHRMode:
	.zero	1
	.section	.sbss.MMC5HackExNTARAMPtr,"aw",@nobits
	.align	2
	.set	.LANCHOR34,. + 0
	.type	MMC5HackExNTARAMPtr, @object
	.size	MMC5HackExNTARAMPtr, 4
MMC5HackExNTARAMPtr:
	.zero	4
	.section	.sbss.MMC5HackSPMode,"aw",@nobits
	.type	MMC5HackSPMode, @object
	.size	MMC5HackSPMode, 1
MMC5HackSPMode:
	.zero	1
	.section	.sbss.MMC5HackSPPage,"aw",@nobits
	.type	MMC5HackSPPage, @object
	.size	MMC5HackSPPage, 1
MMC5HackSPPage:
	.zero	1
	.section	.sbss.MMC5HackSPScroll,"aw",@nobits
	.type	MMC5HackSPScroll, @object
	.size	MMC5HackSPScroll, 1
MMC5HackSPScroll:
	.zero	1
	.section	.sbss.MMC5HackVROMMask,"aw",@nobits
	.align	2
	.set	.LANCHOR35,. + 0
	.type	MMC5HackVROMMask, @object
	.size	MMC5HackVROMMask, 4
MMC5HackVROMMask:
	.zero	4
	.section	.sbss.MMC5HackVROMPTR,"aw",@nobits
	.align	2
	.set	.LANCHOR33,. + 0
	.type	MMC5HackVROMPTR, @object
	.size	MMC5HackVROMPTR, 4
MMC5HackVROMPTR:
	.zero	4
	.section	.sbss.NTRefreshAddr,"aw",@nobits
	.align	2
	.set	.LANCHOR58,. + 0
	.type	NTRefreshAddr, @object
	.size	NTRefreshAddr, 4
NTRefreshAddr:
	.zero	4
	.section	.sbss.PEC586Hack,"aw",@nobits
	.align	2
	.set	.LANCHOR16,. + 0
	.type	PEC586Hack, @object
	.size	PEC586Hack, 4
PEC586Hack:
	.zero	4
	.section	.sbss.PPU,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	PPU, @object
	.size	PPU, 4
PPU:
	.zero	4
	.section	.sbss.PPUCHRRAM,"aw",@nobits
	.set	.LANCHOR37,. + 0
	.type	PPUCHRRAM, @object
	.size	PPUCHRRAM, 1
PPUCHRRAM:
	.zero	1
	.section	.sbss.PPUGenLatch,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	PPUGenLatch, @object
	.size	PPUGenLatch, 1
PPUGenLatch:
	.zero	1
	.section	.sbss.PPUNTARAM,"aw",@nobits
	.set	.LANCHOR39,. + 0
	.type	PPUNTARAM, @object
	.size	PPUNTARAM, 1
PPUNTARAM:
	.zero	1
	.section	.sbss.PPUSPL,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	PPUSPL, @object
	.size	PPUSPL, 1
PPUSPL:
	.zero	1
	.section	.sbss.PPU_hook,"aw",@nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	PPU_hook, @object
	.size	PPU_hook, 4
PPU_hook:
	.zero	4
	.section	.sbss.QTAIHack,"aw",@nobits
	.align	2
	.set	.LANCHOR18,. + 0
	.type	QTAIHack, @object
	.size	QTAIHack, 4
QTAIHack:
	.zero	4
	.section	.sbss.RefreshAddr,"aw",@nobits
	.align	2
	.set	.LANCHOR13,. + 0
	.type	RefreshAddr, @object
	.size	RefreshAddr, 4
RefreshAddr:
	.zero	4
	.section	.sbss.SpriteDMA,"aw",@nobits
	.set	.LANCHOR6,. + 0
	.type	SpriteDMA, @object
	.size	SpriteDMA, 1
SpriteDMA:
	.zero	1
	.section	.sbss.TempAddr,"aw",@nobits
	.align	2
	.set	.LANCHOR45,. + 0
	.type	TempAddr, @object
	.size	TempAddr, 4
TempAddr:
	.zero	4
	.section	.sbss.UPALRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR10,. + 0
	.type	UPALRAM, @object
	.size	UPALRAM, 3
UPALRAM:
	.zero	3
	.section	.sbss.VRAMBuffer,"aw",@nobits
	.set	.LANCHOR42,. + 0
	.type	VRAMBuffer, @object
	.size	VRAMBuffer, 1
VRAMBuffer:
	.zero	1
	.section	.sbss.XOffset,"aw",@nobits
	.set	.LANCHOR24,. + 0
	.type	XOffset, @object
	.size	XOffset, 1
XOffset:
	.zero	1
	.section	.sbss._ZL10numsprites,"aw",@nobits
	.set	.LANCHOR71,. + 0
	.type	_ZL10numsprites, @object
	.size	_ZL10numsprites, 1
_ZL10numsprites:
	.zero	1
	.section	.sbss._ZL11SpriteBlurp,"aw",@nobits
	.set	.LANCHOR76,. + 0
	.type	_ZL11SpriteBlurp, @object
	.size	_ZL11SpriteBlurp, 1
_ZL11SpriteBlurp:
	.zero	1
	.section	.sbss._ZL12RefreshAddrT,"aw",@nobits
	.align	1
	.set	.LANCHOR57,. + 0
	.type	_ZL12RefreshAddrT, @object
	.size	_ZL12RefreshAddrT, 2
_ZL12RefreshAddrT:
	.zero	2
	.section	.sbss._ZL13new_ppu_reset,"aw",@nobits
	.set	.LANCHOR55,. + 0
	.type	_ZL13new_ppu_reset, @object
	.size	_ZL13new_ppu_reset, 1
_ZL13new_ppu_reset:
	.zero	1
	.section	.sbss._ZL16PALcache_outdate,"aw",@nobits
	.align	2
	.set	.LANCHOR20,. + 0
	.type	_ZL16PALcache_outdate, @object
	.size	_ZL16PALcache_outdate, 4
_ZL16PALcache_outdate:
	.zero	4
	.section	.sbss._ZL19scanlines_per_frame,"aw",@nobits
	.align	2
	.set	.LANCHOR51,. + 0
	.type	_ZL19scanlines_per_frame, @object
	.size	_ZL19scanlines_per_frame, 4
_ZL19scanlines_per_frame:
	.zero	4
	.section	.sbss._ZL4kook,"aw",@nobits
	.align	2
	.set	.LANCHOR53,. + 0
	.type	_ZL4kook, @object
	.size	_ZL4kook, 4
_ZL4kook:
	.zero	4
	.section	.sbss._ZL5Pline,"aw",@nobits
	.align	2
	.set	.LANCHOR14,. + 0
	.type	_ZL5Pline, @object
	.size	_ZL5Pline, 4
_ZL5Pline:
	.zero	4
	.section	.sbss._ZL5deemp,"aw",@nobits
	.set	.LANCHOR30,. + 0
	.type	_ZL5deemp, @object
	.size	_ZL5deemp, 1
_ZL5deemp:
	.zero	1
	.section	.sbss._ZL5spork,"aw",@nobits
	.align	2
	.set	.LANCHOR72,. + 0
	.type	_ZL5spork, @object
	.size	_ZL5spork, 4
_ZL5spork:
	.zero	4
	.section	.sbss._ZL5tofix,"aw",@nobits
	.align	2
	.set	.LANCHOR19,. + 0
	.type	_ZL5tofix, @object
	.size	_ZL5tofix, 4
_ZL5tofix:
	.zero	4
	.section	.sbss._ZL6Plinef,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL6Plinef, @object
	.size	_ZL6Plinef, 4
_ZL6Plinef:
	.zero	4
	.section	.sbss._ZL6sphitx,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL6sphitx, @object
	.size	_ZL6sphitx, 4
_ZL6sphitx:
	.zero	4
	.section	.sbss._ZL9TempAddrT,"aw",@nobits
	.align	1
	.set	.LANCHOR56,. + 0
	.type	_ZL9TempAddrT, @object
	.size	_ZL9TempAddrT, 2
_ZL9TempAddrT:
	.zero	2
	.section	.sbss._ZL9firsttile,"aw",@nobits
	.align	2
	.set	.LANCHOR15,. + 0
	.type	_ZL9firsttile, @object
	.size	_ZL9firsttile, 4
_ZL9firsttile:
	.zero	4
	.section	.sbss._ZL9sphitdata,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL9sphitdata, @object
	.size	_ZL9sphitdata, 1
_ZL9sphitdata:
	.zero	1
	.section	.sbss._ZZ14FCEUX_PPU_LoopiE7oamslot,"aw",@nobits
	.align	2
	.set	.LANCHOR61,. + 0
	.type	_ZZ14FCEUX_PPU_LoopiE7oamslot, @object
	.size	_ZZ14FCEUX_PPU_LoopiE7oamslot, 4
_ZZ14FCEUX_PPU_LoopiE7oamslot:
	.zero	4
	.section	.sbss._ZZ14FCEUX_PPU_LoopiE8oamcount,"aw",@nobits
	.align	2
	.set	.LANCHOR62,. + 0
	.type	_ZZ14FCEUX_PPU_LoopiE8oamcount, @object
	.size	_ZZ14FCEUX_PPU_LoopiE8oamcount, 4
_ZZ14FCEUX_PPU_LoopiE8oamcount:
	.zero	4
	.section	.sbss._ZZ14FCEUX_PPU_LoopiE9oamcounts,"aw",@nobits
	.align	2
	.set	.LANCHOR63,. + 0
	.type	_ZZ14FCEUX_PPU_LoopiE9oamcounts, @object
	.size	_ZZ14FCEUX_PPU_LoopiE9oamcounts, 8
_ZZ14FCEUX_PPU_LoopiE9oamcounts:
	.zero	8
	.section	.sbss._ZZL11RefreshLineiE6pshift,"aw",@nobits
	.align	2
	.set	.LANCHOR22,. + 0
	.type	_ZZL11RefreshLineiE6pshift, @object
	.size	_ZZL11RefreshLineiE6pshift, 8
_ZZL11RefreshLineiE6pshift:
	.zero	8
	.section	.sbss._ZZL11RefreshLineiE7atlatch,"aw",@nobits
	.align	2
	.set	.LANCHOR23,. + 0
	.type	_ZZL11RefreshLineiE7atlatch, @object
	.size	_ZZL11RefreshLineiE7atlatch, 4
_ZZL11RefreshLineiE7atlatch:
	.zero	4
	.section	.sbss.cdloggerVideoDataSize,"aw",@nobits
	.align	2
	.set	.LANCHOR41,. + 0
	.type	cdloggerVideoDataSize, @object
	.size	cdloggerVideoDataSize, 4
cdloggerVideoDataSize:
	.zero	4
	.section	.sbss.cdloggervdata,"aw",@nobits
	.align	2
	.type	cdloggervdata, @object
	.size	cdloggervdata, 4
cdloggervdata:
	.zero	4
	.section	.sbss.fceuindbg,"aw",@nobits
	.align	2
	.type	fceuindbg, @object
	.size	fceuindbg, 4
fceuindbg:
	.zero	4
	.section	.sbss.framectr,"aw",@nobits
	.align	2
	.set	.LANCHOR70,. + 0
	.type	framectr, @object
	.size	framectr, 4
framectr:
	.zero	4
	.section	.sbss.g_rasterpos,"aw",@nobits
	.align	2
	.set	.LANCHOR60,. + 0
	.type	g_rasterpos, @object
	.size	g_rasterpos, 4
g_rasterpos:
	.zero	4
	.section	.sbss.linestartts,"aw",@nobits
	.align	2
	.set	.LANCHOR28,. + 0
	.type	linestartts, @object
	.size	linestartts, 4
linestartts:
	.zero	4
	.section	.sbss.newppu,"aw",@nobits
	.align	2
	.set	.LANCHOR11,. + 0
	.type	newppu, @object
	.size	newppu, 4
newppu:
	.zero	4
	.section	.sbss.ppuphase,"aw",@nobits
	.align	2
	.set	.LANCHOR59,. + 0
	.type	ppuphase, @object
	.size	ppuphase, 4
ppuphase:
	.zero	4
	.section	.sbss.pputime,"aw",@nobits
	.align	2
	.type	pputime, @object
	.size	pputime, 4
pputime:
	.zero	4
	.section	.sbss.qtaintramreg,"aw",@nobits
	.set	.LANCHOR38,. + 0
	.type	qtaintramreg, @object
	.size	qtaintramreg, 1
qtaintramreg:
	.zero	1
	.section	.sbss.rendercount,"aw",@nobits
	.align	2
	.type	rendercount, @object
	.size	rendercount, 4
rendercount:
	.zero	4
	.section	.sbss.scanline,"aw",@nobits
	.align	2
	.set	.LANCHOR44,. + 0
	.type	scanline, @object
	.size	scanline, 4
scanline:
	.zero	4
	.section	.sbss.test,"aw",@nobits
	.align	2
	.type	test, @object
	.size	test, 4
test:
	.zero	4
	.section	.sbss.totpputime,"aw",@nobits
	.align	2
	.type	totpputime, @object
	.size	totpputime, 4
totpputime:
	.zero	4
	.section	.sbss.undefinedvromcount,"aw",@nobits
	.align	2
	.type	undefinedvromcount, @object
	.size	undefinedvromcount, 4
undefinedvromcount:
	.zero	4
	.section	.sbss.vromreadcount,"aw",@nobits
	.align	2
	.type	vromreadcount, @object
	.size	vromreadcount, 4
vromreadcount:
	.zero	4
	.section	.sbss.vtoggle,"aw",@nobits
	.set	.LANCHOR29,. + 0
	.type	vtoggle, @object
	.size	vtoggle, 1
vtoggle:
	.zero	1
	.section	.sdata.LogAddress,"aw"
	.align	2
	.type	LogAddress, @object
	.size	LogAddress, 4
LogAddress:
	.word	-1
	.section	.sdata.PPU_MASTER,"aw"
	.align	2
	.type	PPU_MASTER, @object
	.size	PPU_MASTER, 4
PPU_MASTER:
	.word	_Z12FCEUPPU_Loopi
	.section	.sdata._ZL10maxsprites,"aw"
	.align	2
	.set	.LANCHOR50,. + 0
	.type	_ZL10maxsprites, @object
	.size	_ZL10maxsprites, 4
_ZL10maxsprites:
	.word	8
	.section	.sdata._ZL13rendersprites,"aw"
	.set	.LANCHOR48,. + 0
	.type	_ZL13rendersprites, @object
	.size	_ZL13rendersprites, 1
_ZL13rendersprites:
	.byte	1
	.section	.sdata._ZL7ppudead,"aw"
	.align	2
	.set	.LANCHOR52,. + 0
	.type	_ZL7ppudead, @object
	.size	_ZL7ppudead, 4
_ZL7ppudead:
	.word	1
	.section	.sdata._ZL8renderbg,"aw"
	.set	.LANCHOR49,. + 0
	.type	_ZL8renderbg, @object
	.size	_ZL8renderbg, 1
_ZL8renderbg:
	.byte	1
	.section	.sdata.gNoBGFillColor,"aw"
	.set	.LANCHOR66,. + 0
	.type	gNoBGFillColor, @object
	.size	gNoBGFillColor, 1
gNoBGFillColor:
	.byte	-1
	.section	.sdata.idleSynch,"aw"
	.set	.LANCHOR54,. + 0
	.type	idleSynch, @object
	.size	idleSynch, 1
idleSynch:
	.byte	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
