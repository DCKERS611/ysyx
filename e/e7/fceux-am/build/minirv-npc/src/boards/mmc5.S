#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"mmc5.cpp"
	.option nopic
	.text
	.section	.text._ZL13mmc5_PPUWritejh,"ax",@progbits
	.align	2
	.type	_ZL13mmc5_PPUWritejh, @function
_ZL13mmc5_PPUWritejh:
	li	a5,16384
	addi	a5,a5,-257
	bleu	a0,a5,.L2
	andi	a5,a0,3
	andi	a1,a1,63
	bne	a5,zero,.L3
	andi	a5,a0,12
	bne	a5,zero,.L4
	lla	a5,PALRAM
	sb	a1,12(a5)
	sb	a1,8(a5)
	sb	a1,4(a5)
	sb	a1,0(a5)
	sb	a1,28(a5)
	sb	a1,24(a5)
	sb	a1,20(a5)
	sb	a1,16(a5)
	ret
.L2:
	li	a4,8192
	srli	a5,a0,10
	bgeu	a0,a4,.L6
	la a4, PPUCHRRAM; lbu a4, 0(a4);
	sra	a4,a4,a5
	andi	a4,a4,1
	beq	a4,zero,.L1
	slli	a5,a5,2
	lla	a4,VPage
	add	a5,a4,a5
	lw	a5,0(a5)
	add	a5,a5,a0
	sb	a1,0(a5)
	ret
.L6:
	andi	a5,a5,3
	la a4, PPUNTARAM; lbu a4, 0(a4);
	sra	a4,a4,a5
	andi	a4,a4,1
	beq	a4,zero,.L1
	slli	a5,a5,2
	lla	a4,vnapage
	add	a5,a4,a5
	lw	a5,0(a5)
	andi	a0,a0,1023
	add	a5,a5,a0
	sb	a1,0(a5)
.L1:
	ret
.L3:
	andi	a0,a0,31
	lla	a5,PALRAM
	add	a5,a5,a0
	sb	a1,0(a5)
	ret
.L4:
	srli	a0,a0,2
	andi	a0,a0,3
	lla	a5,UPALRAM
	add	a5,a5,a0
	sb	a1,-1(a5)
	ret
	.size	_ZL13mmc5_PPUWritejh, .-_ZL13mmc5_PPUWritejh
	.section	.text._ZL12MMC5_ExRAMWrjh,"ax",@progbits
	.align	2
	.type	_ZL12MMC5_ExRAMWrjh, @function
_ZL12MMC5_ExRAMWrjh:
	la a4, MMC5HackCHRMode; lbu a4, 0(a4);
	li	a5,3
	beq	a4,a5,.L14
	andi	a0,a0,1023
	la a5, .LANCHOR0; lw a5, 0(a5);
	add	a5,a5,a0
	sb	a1,0(a5)
.L14:
	ret
	.size	_ZL12MMC5_ExRAMWrjh, .-_ZL12MMC5_ExRAMWrjh
	.section	.text._ZL12MMC5_ExRAMRdj,"ax",@progbits
	.align	2
	.type	_ZL12MMC5_ExRAMRdj, @function
_ZL12MMC5_ExRAMRdj:
	andi	a0,a0,1023
	la a5, .LANCHOR0; lw a5, 0(a5);
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
	.size	_ZL12MMC5_ExRAMRdj, .-_ZL12MMC5_ExRAMRdj
	.section	.text._ZL10Mapper5_SWjh,"ax",@progbits
	.align	2
	.type	_ZL10Mapper5_SWjh, @function
_ZL10Mapper5_SWjh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	a5,GameExpSound
	sw	ra,8(sp)
	sw	s1,0(sp)
	lla	a4,_Z12MMC5RunSoundi
	sw	a4,0(a5)
	lla	a4,_Z14MMC5RunSoundHQv
	sw	a4,8(a5)
	andi	a5,a0,24
	mv	s0,a1
	andi	a0,a0,31
	bne	a5,zero,.L18
	li	a3,1
	sll	a5,a3,a0
	andi	a4,a5,136
	bne	a4,zero,.L19
	andi	a4,a5,68
	bne	a4,zero,.L20
	andi	a5,a5,17
	beq	a5,zero,.L17
	la a5, .LANCHOR3; lw a5, 0(a5);
	srli	s1,a0,2
	beq	a5,zero,.L27
	mv	a0,s1
	jalr	a5
.L27:
	lla	a5,.LANCHOR2
	add	a5,a5,s1
	sb	s0,4(a5)
.L17:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L18:
	li	a5,17
	beq	a0,a5,.L23
	li	a5,21
	bne	a0,a5,.L46
	lla	s1,.LANCHOR3
	lw	a5,0(s1)
	beq	a5,zero,.L29
	li	a0,0
	jalr	a5
	lw	a5,0(s1)
	li	a0,1
	jalr	a5
.L29:
	lla	a5,.LANCHOR2
	lbu	a4,7(a5)
	sb	s0,6(a5)
	and	s0,s0,a4
	sb	s0,7(a5)
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L46:
	li	a5,16
	bne	a0,a5,.L17
	la a5, .LANCHOR1; lw a5, 0(a5);
	beq	a5,zero,.L25
	jalr	a5
.L25:
	lw	ra,8(sp)
	la a5, .LANCHOR2+9; sb s0, 0(a5);
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L20:
	la a5, .LANCHOR3; lw a5, 0(a5);
	srli	s1,a0,2
	beq	a5,zero,.L28
	mv	a0,s1
	jalr	a5
.L28:
	slli	a0,s1,1
	lla	a5,.LANCHOR2
	add	a5,a5,a0
	lw	ra,8(sp)
	sb	s0,0(a5)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L23:
	la a5, .LANCHOR1; lw a5, 0(a5);
	beq	a5,zero,.L26
	jalr	a5
.L26:
	lw	ra,8(sp)
	la a5, .LANCHOR2+8; sb s0, 0(a5);
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L19:
	srli	a0,a0,2
	lla	a1,.LANCHOR2
	slli	a2,a0,1
	lbu	t1,7(a1)
	add	a2,a1,a2
	lhu	a4,0(a2)
	sll	a5,a3,a0
	slli	s0,s0,8
	or	a5,t1,a5
	sb	a5,7(a1)
	andi	s0,s0,1792
	andi	a4,a4,-1793
	lw	ra,8(sp)
	or	a4,a4,s0
	lw	s0,4(sp)
	sh	a4,0(a2)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL10Mapper5_SWjh, .-_ZL10Mapper5_SWjh
	.section	.text._ZL5Do5SQi,"ax",@progbits
	.align	2
	.type	_ZL5Do5SQi, @function
_ZL5Do5SQi:
	ret
	.size	_ZL5Do5SQi, .-_ZL5Do5SQi
	.section	.text._Z14MMC5RunSoundHQv,"ax",@progbits
	.align	2
	.globl	_Z14MMC5RunSoundHQv
	.hidden	_Z14MMC5RunSoundHQv
	.type	_Z14MMC5RunSoundHQv, @function
_Z14MMC5RunSoundHQv:
	ret
	.size	_Z14MMC5RunSoundHQv, .-_Z14MMC5RunSoundHQv
	.section	.text._Z12MMC5RunSoundi,"ax",@progbits
	.align	2
	.globl	_Z12MMC5RunSoundi
	.hidden	_Z12MMC5RunSoundi
	.type	_Z12MMC5RunSoundi, @function
_Z12MMC5RunSoundi:
	lla	a5,.LANCHOR2
	sw	a0,20(a5)
	sw	a0,24(a5)
	sw	a0,28(a5)
	ret
	.size	_Z12MMC5RunSoundi, .-_Z12MMC5RunSoundi
	.section	.text._Z12mmc5_PPUReadj,"ax",@progbits
	.align	2
	.globl	_Z12mmc5_PPUReadj
	.hidden	_Z12mmc5_PPUReadj
	.type	_Z12mmc5_PPUReadj, @function
_Z12mmc5_PPUReadj:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	la a5, newppu; lw a5, 0(a5);
	mv	s0,a0
	beq	a5,zero,.L54
	la a5, MMC5HackSPMode; lbu a5, 0(a5);
	slli	a4,a5,24
	srai	a4,a4,24
	blt	a4,zero,.L90
.L54:
	li	a5,8192
	bgeu	s0,a5,.L91
.L75:
	li	a2,0
.L52:
	lla	a4,PPU
	lbu	a5,0(a4)
	la a3, ppuphase; lw a3, 0(a3);
	andi	a5,a5,32
	beq	a5,zero,.L61
	lbu	a5,1(a4)
	li	a4,2
	andi	a5,a5,24
	beq	a3,a4,.L92
	li	a4,1
	beq	a3,a4,.L93
.L63:
	srli	a5,s0,10
	la a4, .LANCHOR4; lbu a4, 0(a4);
	slli	a5,a5,2
	bne	a4,zero,.L67
	lla	a4,MMC5SPRVPage
	add	a5,a4,a5
	lw	a5,0(a5)
	add	a5,a5,s0
	lbu	a0,0(a5)
	j	.L64
.L91:
	la a4, MMC5HackCHRMode; lbu a4, 0(a4);
.L58:
	li	a5,1
	andi	a3,s0,1023
	bne	a4,a5,.L71
	li	a5,959
	bleu	a3,a5,.L71
	la a4, NTRefreshAddr; lw a4, 0(a4);
	andi	a4,a4,1023
	la a5, .LANCHOR0; lw a5, 0(a5);
	add	a5,a5,a4
	lbu	a0,0(a5)
	srli	a0,a0,6
	slli	a5,a0,2
	add	a0,a0,a5
	slli	a5,a0,4
	add	a0,a0,a5
	andi	a0,a0,0xff
	j	.L64
.L90:
	la a4, MMC5HackCHRMode; lbu a4, 0(a4);
	andi	a3,a4,2
	bne	a3,zero,.L55
	andi	a2,a5,64
	la a3, NTRefreshAddr; lw a3, 0(a3);
	andi	a5,a5,31
	andi	a3,a3,31
	bne	a2,zero,.L56
	ble	a5,a3,.L89
.L57:
	li	a5,8192
	bltu	s0,a5,.L74
	call	_Z19newppu_get_scanlinev
	addi	a0,a0,-1
	srai	a5,a0,31
	andi	a5,a5,7
	add	a5,a5,a0
	srai	a5,a5,3
	la a2, MMC5HackSPScroll; lbu a2, 0(a2);
	andi	a4,s0,1023
	li	a3,959
	add	a5,a5,a2
	bleu	a4,a3,.L70
	slli	a5,a5,1
	andi	a5,a5,56
	andi	s0,s0,967
	or	s0,s0,a5
	la a5, .LANCHOR0; lw a5, 0(a5);
	add	a5,a5,s0
	lbu	a0,0(a5)
	j	.L64
.L55:
	li	a5,8192
	bltu	a0,a5,.L75
	andi	a3,a0,1023
.L71:
	srli	s0,s0,8
	andi	s0,s0,12
	lla	a5,vnapage
	add	a5,a5,s0
	lw	a5,0(a5)
	add	a5,a5,a3
	lbu	a0,0(a5)
.L64:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L61:
	li	a5,1
	bne	a3,a5,.L68
	lbu	a5,1(a4)
	andi	a5,a5,8
	beq	a5,zero,.L68
	bne	a2,zero,.L94
	la a5, MMC5HackCHRMode; lbu a5, 0(a5);
	beq	a5,a3,.L88
.L68:
	srli	a4,s0,10
	slli	a4,a4,2
	lla	a5,MMC5SPRVPage
	add	a5,a5,a4
	lw	a5,0(a5)
	lw	ra,8(sp)
	add	a5,a5,s0
	lw	s0,4(sp)
	lbu	a0,0(a5)
	addi	sp,sp,12
	jr	ra
.L92:
	beq	a5,zero,.L63
	j	.L68
.L56:
	ble	a5,a3,.L57
.L89:
	li	a5,8192
	bltu	s0,a5,.L75
	j	.L58
.L67:
	lla	a4,MMC5BGVPage
	add	a5,a4,a5
	lw	a5,0(a5)
	add	a5,a5,s0
	lbu	a0,0(a5)
	j	.L64
.L70:
	slli	a5,a5,5
	andi	a5,a5,992
	andi	s0,s0,31
	or	s0,s0,a5
	la a5, .LANCHOR0; lw a5, 0(a5);
	add	a5,a5,s0
	lbu	a0,0(a5)
	j	.L64
.L93:
	beq	a5,zero,.L63
	bne	a2,zero,.L95
	la a5, MMC5HackCHRMode; lbu a5, 0(a5);
	beq	a5,a3,.L88
	srli	a4,s0,10
	slli	a4,a4,2
	lla	a5,MMC5BGVPage
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,s0
	lbu	a0,0(a5)
	j	.L64
.L74:
	li	a2,1
	j	.L52
.L88:
	la a1, NTRefreshAddr; lw a1, 0(a1);
	mv	a0,s0
	call	_Z14FCEUPPU_GetCHRjj
	lbu	a0,0(a0)
	j	.L64
.L94:
	la a4, MMC5HackSPPage; lbu a4, 0(a4);
	slli	s0,s0,20
	slli	a4,a4,12
	la a5, MMC5HackVROMPTR; lw a5, 0(a5);
	srli	s0,s0,20
	add	a5,a5,a4
	add	a5,a5,s0
	lbu	a0,0(a5)
	j	.L64
.L95:
	la a3, MMC5HackSPPage; lbu a3, 0(a3);
	slli	a4,s0,20
	slli	a3,a3,12
	la a5, MMC5HackVROMPTR; lw a5, 0(a5);
	srli	a4,a4,20
	add	a5,a5,a3
	add	a5,a5,a4
	lbu	a0,0(a5)
	j	.L64
	.size	_Z12mmc5_PPUReadj, .-_Z12mmc5_PPUReadj
	.section	.text._ZL8MMC5WRAMjj,"ax",@progbits
	.align	2
	.type	_ZL8MMC5WRAMjj, @function
_ZL8MMC5WRAMjj:
	addi	sp,sp,-12
	lla	a5,.LANCHOR5
	sw	s0,4(sp)
	add	a1,a5,a1
	sw	ra,8(sp)
	sw	s1,0(sp)
	lbu	s1,0(a1)
	li	s0,-24576
	add	s0,a0,s0
	li	a5,255
	srli	s0,s0,13
	li	a4,0
	beq	s1,a5,.L97
	mv	a2,s1
	mv	a1,a0
	li	a0,16
	call	_Z8setprg8rijj
	la a2, .LANCHOR7; lw a2, 0(a2);
	addi	a2,a2,-1
	slli	s1,s1,13
	la a5, .LANCHOR6; lw a5, 0(a5);
	and	a2,a2,s1
	add	a2,a5,a2
	li	a1,24576
	li	a0,8
	call	_Z16FCEU_CheatAddRAMijPh
	li	a4,1
.L97:
	lla	a5,.LANCHOR8
	add	a5,a5,s0
	sb	a4,0(a5)
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL8MMC5WRAMjj, .-_ZL8MMC5WRAMjj
	.section	.text._ZL7MMC5PRGv,"ax",@progbits
	.align	2
	.type	_ZL7MMC5PRGv, @function
_ZL7MMC5PRGv:
	addi	sp,sp,-24
	la a5, .LANCHOR9; lbu a5, 0(a5);
	sw	ra,20(sp)
	sw	s0,16(sp)
	sw	s1,12(sp)
	andi	a5,a5,3
	li	a4,2
	beq	a5,a4,.L102
	li	a4,3
	beq	a5,a4,.L103
	li	s0,1
	beq	a5,s0,.L104
	la a1, .LANCHOR11+1; lbu a1, 0(a1);
	srli	a1,a1,2
	li	a5,16842752
	addi	a5,a5,257
	andi	a1,a1,31
	li	a0,32768
	la a4, .LANCHOR10; sw a5, 0(a4);
	call	_Z8setprg32jj
	lla	a5,.LANCHOR8
	li	a4,257
	sb	s0,1(a5)
	sh	a4,2(a5)
	sb	s0,4(a5)
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L102:
	lla	s0,.LANCHOR11
	lbu	a1,1(s0)
	slli	a5,a1,24
	srai	a5,a5,24
	blt	a5,zero,.L119
	andi	a1,a1,126
	li	a0,32768
	la a5, .LANCHOR10; sh zero, 0(a5);
	call	_ZL8MMC5WRAMjj
	lbu	a1,1(s0)
	lla	a5,.LANCHOR10
	li	a0,40960
	andi	a1,a1,126
	addi	a1,a1,1
	sw	a5,0(sp)
	call	_ZL8MMC5WRAMjj
	lbu	a1,2(s0)
	lla	s1,.LANCHOR8
	slli	a5,a1,24
	srai	a5,a5,24
	blt	a5,zero,.L120
.L110:
	li	a0,49152
	la a5, .LANCHOR10+2; sb zero, 0(a5);
	call	_ZL8MMC5WRAMjj
.L118:
	lw	a4,0(sp)
	li	a5,1
	lbu	a1,3(s0)
	sb	a5,3(a4)
	lw	s0,16(sp)
	lw	ra,20(sp)
	sb	a5,4(s1)
	lw	s1,12(sp)
	li	a0,57344
	andi	a1,a1,127
	addi	sp,sp,24
	tail	_Z7setprg8jj
.L104:
	lla	s0,.LANCHOR11
	lbu	a1,1(s0)
	sw	a5,4(sp)
	slli	a4,a1,24
	srai	a4,a4,24
	blt	a4,zero,.L121
	andi	a1,a1,126
	li	a0,32768
	la a5, .LANCHOR10; sh zero, 0(a5);
	call	_ZL8MMC5WRAMjj
	lbu	a1,1(s0)
	lla	a5,.LANCHOR10
	li	a0,40960
	andi	a1,a1,126
	addi	a1,a1,1
	sw	a5,0(sp)
	lla	s1,.LANCHOR8
	call	_ZL8MMC5WRAMjj
.L107:
	lw	a4,0(sp)
	li	a5,1
	sb	a5,4(s1)
	sb	a5,3(s1)
	li	a5,257
	sh	a5,2(a4)
	lbu	a1,3(s0)
	lw	s0,16(sp)
	lw	ra,20(sp)
	lw	s1,12(sp)
	srli	a1,a1,1
	andi	a1,a1,63
	li	a0,49152
	addi	sp,sp,24
	tail	_Z8setprg16jj
.L103:
	lla	a5,.LANCHOR10
	sw	a5,0(sp)
	mv	a2,a5
	li	a4,0
	lla	s0,.LANCHOR11
	lla	s1,.LANCHOR8
.L114:
	add	a5,s0,a4
	lbu	a5,0(a5)
	addi	a4,a4,1
	slli	a0,a4,13
	slli	t0,a5,24
	li	a3,24576
	srai	t0,t0,24
	sw	a4,8(sp)
	li	t1,1
	andi	a1,a5,127
	add	a0,a0,a3
	blt	t0,zero,.L122
	sb	zero,0(a2)
	mv	a1,a5
	sw	a2,4(sp)
	call	_ZL8MMC5WRAMjj
	lw	a4,8(sp)
	lw	a2,4(sp)
.L113:
	li	a5,3
	addi	a2,a2,1
	bne	a4,a5,.L114
	j	.L118
.L122:
	sb	t1,0(a2)
	sw	a2,4(sp)
	call	_Z7setprg8jj
	lw	a4,8(sp)
	li	t1,1
	lw	a2,4(sp)
	add	a5,s1,a4
	sb	t1,0(a5)
	j	.L113
.L121:
	lla	a5,.LANCHOR10
	li	a4,257
	sh	a4,0(a5)
	srli	a1,a1,1
	li	a0,32768
	sw	a5,0(sp)
	call	_Z8setprg16jj
	lw	a5,4(sp)
	lla	s1,.LANCHOR8
	sb	a5,2(s1)
	sb	a5,1(s1)
	j	.L107
.L119:
	li	a5,1
	lla	s1,.LANCHOR8
	lla	a4,.LANCHOR10
	sb	a5,2(s1)
	sb	a5,1(s1)
	srli	a1,a1,1
	li	a5,257
	andi	a1,a1,63
	sh	a5,0(a4)
	li	a0,32768
	sw	a4,0(sp)
	call	_Z8setprg16jj
	lbu	a1,2(s0)
	slli	a5,a1,24
	srai	a5,a5,24
	bge	a5,zero,.L110
.L120:
	lw	a4,0(sp)
	li	a5,1
	andi	a1,a1,127
	li	a0,49152
	sb	a5,2(a4)
	sb	a5,3(s1)
	call	_Z7setprg8jj
	j	.L118
	.size	_ZL7MMC5PRGv, .-_ZL7MMC5PRGv
	.section	.text._Z11Mapper5_ESIv,"ax",@progbits
	.align	2
	.globl	_Z11Mapper5_ESIv
	.hidden	_Z11Mapper5_ESIv
	.type	_Z11Mapper5_ESIv, @function
_Z11Mapper5_ESIv:
	lla	a5,FSettings
	addi	sp,sp,-12
	lw	a4,60(a5)
	sw	s0,4(sp)
	lla	a3,_Z11Mapper5_ESIv
	lla	s0,GameExpSound
	sw	ra,8(sp)
	sw	a3,16(s0)
	beq	a4,zero,.L125
	lw	a5,64(a5)
	ble	a5,zero,.L126
	lla	a4,_ZL7Do5SQHQi
	lla	a5,_ZL8Do5PCMHQv
	j	.L124
.L125:
	li	a4,0
	li	a5,0
.L124:
	li	a2,12
	li	a1,0
	lla	a0,.LANCHOR2+20
	la a3, .LANCHOR3; sw a4, 0(a3);
	la a4, .LANCHOR1; sw a5, 0(a4);
	call	memset
	li	a2,8
	li	a1,0
	lla	a0,.LANCHOR2+32
	call	memset
	lla	a5,_Z10MMC5HiSynci
	lw	ra,8(sp)
	sw	a5,12(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L126:
	lla	a4,_ZL5Do5SQi
	lla	a5,_ZL6Do5PCMv
	j	.L124
	.size	_Z11Mapper5_ESIv, .-_Z11Mapper5_ESIv
	.section	.rodata._ZL12GenMMC5_InitP8CartInfoii.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.align	2
.LC1:
	.string	"ERAM"
	.align	2
.LC2:
	.string	"SPLM"
	.align	2
.LC3:
	.string	"SPLS"
	.align	2
.LC4:
	.string	"SPLP"
	.align	2
.LC5:
	.string	"5130"
	.section	.text._ZL12GenMMC5_InitP8CartInfoii,"ax",@progbits
	.align	2
	.type	_ZL12GenMMC5_InitP8CartInfoii, @function
_ZL12GenMMC5_InitP8CartInfoii:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	sw	a2,0(sp)
	mv	s1,a1
	mv	s0,a0
	bne	a1,zero,.L168
.L129:
	li	a0,1024
	call	_Z12FCEU_gmallocj
	mv	a4,a0
	lla	a5,.LANCHOR12
	li	a0,1024
	sw	a4,0(a5)
	call	_Z12FCEU_gmallocj
	lla	a5,.LANCHOR12
	lw	a5,0(a5)
	lbu	a1,960(a5)
	lbu	t1,0(a5)
	addi	a3,a5,956
	andi	a1,a1,3
	slli	t0,t1,8
	slli	t2,a1,2
	slli	a2,a1,4
	slli	a4,t1,16
	or	a4,t0,a4
	or	a2,t2,a2
	or	a4,a4,t1
	or	a2,a2,a1
	lla	t0,.LANCHOR0
	slli	a1,a1,6
	slli	t1,t1,24
	sw	a0,0(t0)
	or	t0,a2,a1
	or	a1,a4,t1
	mv	a4,a3
.L130:
	sw	a1,0(a4)
	mv	a2,a4
	addi	a4,a4,-4
	bne	a5,a2,.L130
	slli	a4,t0,8
	slli	a2,t0,16
	or	a4,a4,a2
	or	a4,a4,t0
	slli	t0,t0,24
	or	a4,a4,t0
	addi	a5,a5,1020
.L131:
	sw	a4,0(a5)
	addi	a5,a5,-4
	bne	a3,a5,.L131
	lla	a3,.LC1
	li	a2,0
	li	a1,1024
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC2
	li	a2,0
	li	a1,1
	lla	a0,MMC5HackSPMode
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,MMC5HackSPScroll
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC4
	li	a2,0
	li	a1,1
	lla	a0,MMC5HackSPPage
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC5
	li	a2,0
	li	a1,1
	lla	a0,MMC50x5130
	call	_Z10AddExStatePvjiPKc
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR13
	li	a3,0
	call	_Z10AddExStatePvjiPKc
	srai	t1,s1,31
	andi	t1,t1,7
	add	t1,t1,s1
	srai	t1,t1,3
	andi	a1,t1,0xff
	lla	a5,.LANCHOR5
	slli	t0,a1,2
	lla	t2,.L134
	la a4, .LANCHOR14; sb a1, 0(a4);
	mv	a2,a5
	li	ra,0
	li	a4,0
	li	a0,8
	add	t0,t0,t2
	sw	t1,4(sp)
.L141:
	bgtu	a1,a0,.L132
	lw	a3,0(t0)
	add	a3,a3,t2
	jr	a3
	.section	.rodata._ZL12GenMMC5_InitP8CartInfoii,"a",@progbits
	.align	2
	.align	2
.L134:
	.word	.L154-.L134
	.word	.L137-.L134
	.word	.L136-.L134
	.word	.L132-.L134
	.word	.L135-.L134
	.word	.L132-.L134
	.word	.L132-.L134
	.word	.L132-.L134
	.word	.L133-.L134
	.section	.text._ZL12GenMMC5_InitP8CartInfoii
.L132:
	andi	a3,a4,0xff
	li	ra,1
.L138:
	sb	a3,0(a2)
	addi	a4,a4,1
	addi	a2,a2,1
	bne	a4,a0,.L141
	lw	t1,4(sp)
	beq	ra,zero,.L142
	andi	a2,t1,255
	lla	a3,.LANCHOR5
	li	a4,0
	li	a1,128
.L143:
	beq	a2,a4,.L147
	sb	a4,0(a3)
	addi	a4,a4,1
	addi	a3,a3,1
	bne	a4,a1,.L143
.L147:
	andi	t1,t1,128
	lla	a4,.LANCHOR5
	sub	a5,a2,a5
	li	a0,127
	bne	t1,zero,.L145
.L144:
	lbu	a1,0(a4)
	add	a3,a4,a2
	addi	a4,a4,1
	sb	a1,0(a3)
	add	a3,a5,a4
	ble	a3,a0,.L144
.L145:
	lla	a5,_Z17MMC5_StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL12GenMMC5Resetv
	sw	a5,0(s0)
	lw	a5,0(sp)
	beq	a5,zero,.L149
	lw	a5,52(s0)
	la a4, .LANCHOR6; lw a4, 0(a4);
	sw	a4,12(s0)
	beq	a5,zero,.L151
	lw	a5,64(s0)
	sw	a5,28(s0)
.L149:
	lla	a5,.LANCHOR0
	lw	a5,0(a5)
	la a4, CHRmask4; lw a4, 0(a4);
	la a3, MMC5HackVROMMask; sw a4, 0(a3);
	la a4, MMC5HackExNTARAMPtr; sw a5, 0(a4);
	li	a5,1
	la a4, MMC5Hack; sw a5, 0(a4);
	la a5, CHRptr; lw a5, 0(a5);
	la a4, MMC5HackVROMPTR; sw a5, 0(a4);
	la a5, MMC5HackCHRMode; sb zero, 0(a5);
	la a5, MMC5HackSPPage; sb zero, 0(a5);
	la a5, MMC5HackSPScroll; sb zero, 0(a5);
	la a5, MMC5HackSPMode; sb zero, 0(a5);
	call	_Z11Mapper5_ESIv
	lw	ra,16(sp)
	lw	s0,12(sp)
	lla	a5,_Z12mmc5_PPUReadj
	la a4, FFCEUX_PPURead; sw a5, 0(a4);
	lla	a5,_ZL13mmc5_PPUWritejh
	la a4, FFCEUX_PPUWrite; sw a5, 0(a4);
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L133:
	andi	a3,a4,0xff
	j	.L138
.L135:
	li	t1,3
	li	a3,255
	bgt	a4,t1,.L138
	sb	a4,0(a2)
	addi	a4,a4,1
	addi	a2,a2,1
	j	.L141
.L136:
	srai	a3,a4,2
	andi	a3,a3,0xff
	j	.L138
.L137:
	slti	a3,a4,4
	addi	a3,a3,-1
	andi	a3,a3,0xff
	j	.L138
.L154:
	li	a3,255
	j	.L138
.L142:
	li	a2,8
	lla	a1,.LANCHOR5+120
	lla	a3,.LANCHOR5
	sub	a2,a2,a5
.L150:
	add	a4,a2,a3
	andi	a4,a4,7
	add	a4,a5,a4
	lbu	a4,0(a4)
	addi	a3,a3,1
	sb	a4,7(a3)
	bne	a1,a3,.L150
	j	.L145
.L151:
	li	a5,16
	ble	s1,a5,.L169
	li	a5,64
	beq	s1,a5,.L170
	li	a5,32768
	sw	a5,28(s0)
	j	.L149
.L168:
	slli	a5,a1,10
	mv	a0,a5
	sw	a5,4(sp)
	call	_Z12FCEU_gmallocj
	lw	a5,4(sp)
	mv	a1,a0
	lla	a4,.LANCHOR6
	mv	a2,a5
	li	a3,1
	li	a0,16
	sw	a1,0(a4)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a5,4(sp)
	lla	a4,.LANCHOR6
	lw	a0,0(a4)
	lla	a3,.LC0
	li	a2,0
	mv	a1,a5
	call	_Z10AddExStatePvjiPKc
	j	.L129
.L169:
	li	a5,8192
	sw	a5,28(s0)
	j	.L149
.L170:
	li	a5,65536
	sw	a5,28(s0)
	j	.L149
	.size	_ZL12GenMMC5_InitP8CartInfoii, .-_ZL12GenMMC5_InitP8CartInfoii
	.section	.text._ZL15MMC5_ReadROMRAMj,"ax",@progbits
	.align	2
	.type	_ZL15MMC5_ReadROMRAMj, @function
_ZL15MMC5_ReadROMRAMj:
	li	a5,-24576
	add	a5,a0,a5
	srli	a5,a5,13
	lla	a4,.LANCHOR8
	add	a5,a4,a5
	lbu	a5,0(a5)
	beq	a5,zero,.L172
	srli	a4,a0,11
	slli	a4,a4,2
	lla	a5,Page
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
.L172:
	la a0, X+24; lbu a0, 0(a0);
	ret
	.size	_ZL15MMC5_ReadROMRAMj, .-_ZL15MMC5_ReadROMRAMj
	.section	.text._ZL16MMC5_WriteROMRAMjh,"ax",@progbits
	.align	2
	.type	_ZL16MMC5_WriteROMRAMjh, @function
_ZL16MMC5_WriteROMRAMjh:
	li	a5,32768
	bltu	a0,a5,.L175
	sub	a5,a0,a5
	srli	a5,a5,13
	lla	a4,.LANCHOR10
	add	a5,a4,a5
	lbu	a5,0(a5)
	bne	a5,zero,.L174
.L175:
	li	a5,-24576
	add	a5,a0,a5
	srli	a5,a5,13
	lla	a4,.LANCHOR8
	add	a5,a4,a5
	lbu	a5,0(a5)
	beq	a5,zero,.L174
	lla	a4,.LANCHOR15
	lbu	a5,1(a4)
	lbu	a4,0(a4)
	li	a3,6
	slli	a5,a5,2
	andi	a5,a5,12
	andi	a4,a4,3
	or	a5,a5,a4
	beq	a5,a3,.L180
.L174:
	ret
.L180:
	srli	a4,a0,11
	slli	a4,a4,2
	lla	a5,Page
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a0
	sb	a1,0(a5)
	ret
	.size	_ZL16MMC5_WriteROMRAMjh, .-_ZL16MMC5_WriteROMRAMjh
	.globl	__mulsi3
	.section	.text._ZL9MMC5_readj,"ax",@progbits
	.align	2
	.type	_ZL9MMC5_readj, @function
_ZL9MMC5_readj:
	addi	sp,sp,-12
	li	a5,20480
	sw	ra,8(sp)
	addi	a4,a5,517
	beq	a0,a4,.L182
	addi	a4,a5,518
	beq	a0,a4,.L183
	addi	a5,a5,516
	beq	a0,a5,.L187
	lw	ra,8(sp)
	la a0, X+24; lbu a0, 0(a0);
	addi	sp,sp,12
	jr	ra
.L182:
	lla	a5,.LANCHOR17
	lbu	a1,1(a5)
	lbu	a0,0(a5)
	call	__mulsi3
	lw	ra,8(sp)
	andi	a0,a0,0xff
	addi	sp,sp,12
	jr	ra
.L187:
	li	a0,1
	call	_Z12X6502_IRQEndi
	lla	a5,.LANCHOR16
	lbu	a0,0(a5)
	andi	a4,a0,64
	sb	a4,0(a5)
	lw	ra,8(sp)
	addi	sp,sp,12
	jr	ra
.L183:
	lla	a5,.LANCHOR17
	lbu	a1,1(a5)
	lbu	a0,0(a5)
	call	__mulsi3
	lw	ra,8(sp)
	srai	a0,a0,8
	andi	a0,a0,0xff
	addi	sp,sp,12
	jr	ra
	.size	_ZL9MMC5_readj, .-_ZL9MMC5_readj
	.section	.text._ZL7Do5SQHQi,"ax",@progbits
	.align	2
	.type	_ZL7Do5SQHQi, @function
_ZL7Do5SQHQi:
	ret
	.size	_ZL7Do5SQHQi, .-_ZL7Do5SQHQi
	.section	.text._ZL6Do5PCMv,"ax",@progbits
	.align	2
	.type	_ZL6Do5PCMv, @function
_ZL6Do5PCMv:
	ret
	.size	_ZL6Do5PCMv, .-_ZL6Do5PCMv
	.section	.text._ZL8Do5PCMHQv,"ax",@progbits
	.align	2
	.type	_ZL8Do5PCMHQv, @function
_ZL8Do5PCMHQv:
	ret
	.size	_ZL8Do5PCMHQv, .-_ZL8Do5PCMHQv
	.section	.text._Z10MMC5HiSynci,"ax",@progbits
	.align	2
	.globl	_Z10MMC5HiSynci
	.hidden	_Z10MMC5HiSynci
	.type	_Z10MMC5HiSynci, @function
_Z10MMC5HiSynci:
	lla	a5,.LANCHOR2
	sw	a0,20(a5)
	sw	a0,24(a5)
	sw	a0,28(a5)
	ret
	.size	_Z10MMC5HiSynci, .-_Z10MMC5HiSynci
	.section	.text._ZL8MMC5CHRBv,"ax",@progbits
	.align	2
	.type	_ZL8MMC5CHRBv, @function
_ZL8MMC5CHRBv:
	addi	sp,sp,-16
	la a5, .LANCHOR18; lbu a5, 0(a5);
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	andi	a5,a5,3
	li	a4,2
	beq	a5,a4,.L193
	li	a4,3
	beq	a5,a4,.L199
	li	a4,1
	lla	s0,.LANCHOR19
	beq	a5,a4,.L195
	lhu	a0,6(s0)
	call	_Z7setchr8j
	la a5, CHRptr; lw a5, 0(a5);
	lhu	a4,6(s0)
	beq	a5,zero,.L192
	la a3, CHRmask8; lw a3, 0(a3);
	and	a4,a4,a3
	slli	a4,a4,13
	add	a5,a5,a4
	lla	a4,MMC5BGVPage
	sw	a5,28(a4)
	sw	a5,24(a4)
	sw	a5,20(a4)
	sw	a5,16(a4)
	sw	a5,12(a4)
	sw	a5,8(a4)
	sw	a5,4(a4)
	sw	a5,0(a4)
.L192:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L199:
	li	s0,0
.L194:
	andi	a5,s0,3
	lla	a4,.LANCHOR19
	slli	a5,a5,1
	add	a5,a4,a5
	lhu	a1,0(a5)
	slli	s1,s0,10
	mv	a0,s1
	sw	a5,0(sp)
	call	_Z7setchr1jj
	lla	a5,CHRptr
	lw	a3,0(a5)
	srli	a2,s1,8
	lla	a5,MMC5BGVPage
	addi	s0,s0,1
	li	a1,8
	add	a2,a5,a2
	beq	a3,zero,.L198
	lw	a5,0(sp)
	la t1, CHRmask1; lw t1, 0(t1);
	lhu	a5,0(a5)
	and	a5,a5,t1
	slli	a5,a5,10
	sub	a5,a5,s1
	add	a3,a3,a5
	sw	a3,0(a2)
.L198:
	bne	s0,a1,.L194
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L195:
	lhu	a1,6(s0)
	li	a0,0
	call	_Z7setchr4jj
	lhu	a1,6(s0)
	li	a0,4096
	call	_Z7setchr4jj
	la a4, CHRptr; lw a4, 0(a4);
	lhu	a5,6(s0)
	beq	a4,zero,.L192
	la a3, CHRmask4; lw a3, 0(a3);
	and	a5,a5,a3
	slli	a5,a5,12
	li	a2,-4096
	lw	ra,12(sp)
	lw	s0,8(sp)
	add	a2,a5,a2
	lla	a3,MMC5BGVPage
	add	a5,a4,a5
	add	a4,a4,a2
	sw	a5,12(a3)
	sw	a5,8(a3)
	sw	a5,4(a3)
	sw	a5,0(a3)
	sw	a4,28(a3)
	sw	a4,24(a3)
	sw	a4,20(a3)
	sw	a4,16(a3)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L193:
	lla	s1,.LANCHOR19
	lhu	a1,2(s1)
	li	a0,0
	li	s0,4096
	call	_Z7setchr2jj
	lhu	a1,6(s1)
	addi	a0,s0,-2048
	call	_Z7setchr2jj
	lhu	a1,2(s1)
	li	a0,4096
	call	_Z7setchr2jj
	lhu	a1,6(s1)
	li	a0,8192
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	la a4, CHRptr; lw a4, 0(a4);
	lhu	a5,2(s1)
	beq	a4,zero,.L192
	lhu	a3,6(s1)
	la a2, CHRmask2; lw a2, 0(a2);
	and	a5,a5,a2
	and	a3,a3,a2
	slli	a5,a5,11
	li	a2,-4096
	slli	a3,a3,11
	sub	s0,a5,s0
	addi	a2,a2,-2048
	add	s0,a4,s0
	addi	a1,a3,-2048
	add	a2,a3,a2
	lla	a3,MMC5BGVPage
	lw	ra,12(sp)
	sw	s0,20(a3)
	sw	s0,16(a3)
	lw	s0,8(sp)
	add	a5,a4,a5
	add	a1,a4,a1
	add	a4,a4,a2
	sw	a5,4(a3)
	sw	a5,0(a3)
	sw	a1,12(a3)
	sw	a1,8(a3)
	sw	a4,28(a3)
	sw	a4,24(a3)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	_ZL8MMC5CHRBv, .-_ZL8MMC5CHRBv
	.section	.text._ZL8MMC5CHRAv,"ax",@progbits
	.align	2
	.type	_ZL8MMC5CHRAv, @function
_ZL8MMC5CHRAv:
	addi	sp,sp,-12
	la a5, .LANCHOR18; lbu a5, 0(a5);
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	andi	a5,a5,3
	li	a4,2
	beq	a5,a4,.L215
	li	a4,3
	beq	a5,a4,.L216
	li	a4,1
	lla	s0,.LANCHOR20
	beq	a5,a4,.L217
	lhu	a0,14(s0)
	call	_Z7setchr8j
	la a5, CHRptr; lw a5, 0(a5);
	lhu	a4,14(s0)
	beq	a5,zero,.L214
	la a3, CHRmask8; lw a3, 0(a3);
	and	a4,a4,a3
	slli	a4,a4,13
	add	a5,a5,a4
	lla	a4,MMC5SPRVPage
	sw	a5,28(a4)
	sw	a5,24(a4)
	sw	a5,20(a4)
	sw	a5,16(a4)
	sw	a5,12(a4)
	sw	a5,8(a4)
	sw	a5,4(a4)
	sw	a5,0(a4)
.L214:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L217:
	lhu	a1,6(s0)
	li	a0,0
	call	_Z7setchr4jj
	lhu	a1,14(s0)
	li	a0,4096
	call	_Z7setchr4jj
	la a4, CHRptr; lw a4, 0(a4);
	lhu	a5,6(s0)
	beq	a4,zero,.L214
	lhu	a2,14(s0)
	la a3, CHRmask4; lw a3, 0(a3);
	and	a5,a5,a3
	and	a2,a2,a3
	slli	a2,a2,12
	li	a3,-4096
	lw	ra,8(sp)
	lw	s0,4(sp)
	add	a2,a2,a3
	slli	a5,a5,12
	lla	a3,MMC5SPRVPage
	add	a5,a4,a5
	add	a4,a4,a2
	sw	a5,12(a3)
	sw	a5,8(a3)
	sw	a5,4(a3)
	sw	a5,0(a3)
	sw	a4,28(a3)
	sw	a4,24(a3)
	sw	a4,20(a3)
	sw	a4,16(a3)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L216:
	lla	s1,.LANCHOR20
	li	s0,0
.L221:
	lhu	a1,0(s1)
	mv	a0,s0
	call	_Z7setchr1jj
	lla	a5,CHRptr
	lw	a2,0(a5)
	srli	a5,s0,10
	slli	a5,a5,2
	lla	a4,MMC5SPRVPage
	li	a1,8192
	add	a5,a4,a5
	beq	a2,zero,.L220
	lhu	a4,0(s1)
	la t1, CHRmask1; lw t1, 0(t1);
	and	a4,a4,t1
	slli	a4,a4,10
	sub	a4,a4,s0
	add	a2,a2,a4
	sw	a2,0(a5)
.L220:
	addi	s0,s0,1024
	addi	s1,s1,2
	bne	s0,a1,.L221
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L215:
	lla	s0,.LANCHOR20
	lhu	a1,2(s0)
	li	a0,0
	li	s1,4096
	call	_Z7setchr2jj
	lhu	a1,6(s0)
	addi	a0,s1,-2048
	call	_Z7setchr2jj
	lhu	a1,10(s0)
	li	a0,4096
	call	_Z7setchr2jj
	lhu	a1,14(s0)
	li	a0,8192
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	la a4, CHRptr; lw a4, 0(a4);
	lhu	a0,2(s0)
	beq	a4,zero,.L214
	lhu	a3,6(s0)
	lhu	a5,10(s0)
	lhu	a2,14(s0)
	la a1, CHRmask2; lw a1, 0(a1);
	and	a3,a3,a1
	and	a5,a5,a1
	and	a2,a2,a1
	slli	a3,a3,11
	li	t1,-4096
	and	a0,a0,a1
	slli	a5,a5,11
	addi	a1,a3,-2048
	slli	a2,a2,11
	addi	a3,t1,-2048
	lw	ra,8(sp)
	lw	s0,4(sp)
	sub	a5,a5,s1
	add	a2,a2,a3
	slli	a0,a0,11
	lla	a3,MMC5SPRVPage
	add	a0,a4,a0
	add	a1,a4,a1
	add	a5,a4,a5
	add	a4,a4,a2
	sw	a0,4(a3)
	sw	a0,0(a3)
	sw	a1,12(a3)
	sw	a1,8(a3)
	sw	a5,20(a3)
	sw	a5,16(a3)
	sw	a4,28(a3)
	sw	a4,24(a3)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL8MMC5CHRAv, .-_ZL8MMC5CHRAv
	.section	.text._ZL13Mapper5_writejh,"ax",@progbits
	.align	2
	.type	_ZL13Mapper5_writejh, @function
_ZL13Mapper5_writejh:
	addi	sp,sp,-16
	li	a5,20480
	sw	s0,8(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	addi	a4,a5,304
	mv	s0,a1
	bgtu	a0,a4,.L237
	addi	a5,a5,255
	bleu	a0,a5,.L236
	li	a5,-20480
	addi	a5,a5,-256
	add	a5,a0,a5
	li	a4,48
	bgtu	a5,a4,.L236
	lla	a4,.L249
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL13Mapper5_writejh,"a",@progbits
	.align	2
	.align	2
.L249:
	.word	.L261-.L249
	.word	.L260-.L249
	.word	.L259-.L249
	.word	.L258-.L249
	.word	.L257-.L249
	.word	.L256-.L249
	.word	.L255-.L249
	.word	.L254-.L249
	.word	.L236-.L249
	.word	.L236-.L249
	.word	.L236-.L249
	.word	.L236-.L249
	.word	.L236-.L249
	.word	.L236-.L249
	.word	.L236-.L249
	.word	.L236-.L249
	.word	.L236-.L249
	.word	.L236-.L249
	.word	.L236-.L249
	.word	.L253-.L249
	.word	.L252-.L249
	.word	.L252-.L249
	.word	.L252-.L249
	.word	.L252-.L249
	.word	.L236-.L249
	.word	.L236-.L249
	.word	.L236-.L249
	.word	.L236-.L249
	.word	.L236-.L249
	.word	.L236-.L249
	.word	.L236-.L249
	.word	.L236-.L249
	.word	.L251-.L249
	.word	.L251-.L249
	.word	.L251-.L249
	.word	.L251-.L249
	.word	.L251-.L249
	.word	.L251-.L249
	.word	.L251-.L249
	.word	.L251-.L249
	.word	.L250-.L249
	.word	.L250-.L249
	.word	.L250-.L249
	.word	.L250-.L249
	.word	.L236-.L249
	.word	.L236-.L249
	.word	.L236-.L249
	.word	.L236-.L249
	.word	.L248-.L249
	.section	.text._ZL13Mapper5_writejh
.L241:
	la a5, .LANCHOR17+1; sb s0, 0(a5);
.L236:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L237:
	li	a5,-20480
	addi	a4,a5,-512
	add	a4,a0,a4
	li	a3,6
	bgtu	a4,a3,.L236
	addi	a5,a5,-513
	add	a0,a0,a5
	li	a5,5
	bgtu	a0,a5,.L240
	lla	a4,.L242
	slli	a0,a0,2
	add	a0,a0,a4
	lw	a5,0(a0)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL13Mapper5_writejh
	.align	2
	.align	2
.L242:
	.word	.L247-.L242
	.word	.L246-.L242
	.word	.L245-.L242
	.word	.L244-.L242
	.word	.L243-.L242
	.word	.L241-.L242
	.section	.text._ZL13Mapper5_writejh
.L251:
	la a5, MMC50x5130; lbu a5, 0(a5);
	andi	a3,a0,7
	slli	a5,a5,8
	slli	a3,a3,1
	andi	a5,a5,768
	lla	a4,.LANCHOR20
	add	a4,a4,a3
	or	a5,a5,a1
	la a3, .LANCHOR4; sb zero, 0(a3);
	sh	a5,0(a4)
.L280:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	_ZL8MMC5CHRAv
.L244:
	li	a0,1
	andi	s0,s0,-128
	call	_Z12X6502_IRQEndi
	la a5, .LANCHOR27; sb s0, 0(a5);
	j	.L236
.L245:
	li	a0,1
	call	_Z12X6502_IRQEndi
	la a5, .LANCHOR26; sb s0, 0(a5);
	j	.L236
.L246:
	andi	s0,s0,63
	la a5, MMC5HackSPPage; sb s0, 0(a5);
	j	.L236
.L247:
	srli	s0,s0,3
	la a5, MMC5HackSPScroll; sb s0, 0(a5);
	j	.L236
.L243:
	la a5, .LANCHOR17; sb s0, 0(a5);
	j	.L236
.L250:
	la a4, MMC50x5130; lbu a4, 0(a4);
	andi	a5,a0,3
	slli	a4,a4,8
	slli	a5,a5,1
	andi	a4,a4,768
	lla	a3,.LANCHOR19
	add	a3,a3,a5
	or	a5,a4,a1
	li	a4,1
	la a2, .LANCHOR4; sb a4, 0(a2);
	sh	a5,0(a3)
.L281:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	_ZL8MMC5CHRBv
.L252:
	andi	a0,a0,3
	lla	a5,.LANCHOR11
	add	a5,a5,a0
	sb	a1,0(a5)
.L279:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	_ZL7MMC5PRGv
.L261:
	la a5, .LANCHOR9; sb a1, 0(a5);
	j	.L279
.L259:
	la a5, .LANCHOR15; sb a1, 0(a5);
	j	.L236
.L260:
	la a5, .LANCHOR18; sb a1, 0(a5);
	la a5, .LANCHOR4; lbu a5, 0(a5);
	bne	a5,zero,.L263
	call	_ZL8MMC5CHRBv
	j	.L280
.L248:
	la a5, MMC50x5130; sb a1, 0(a5);
	j	.L236
.L255:
	lla	a1,.LANCHOR23
	lbu	a5,0(a1)
	beq	a5,s0,.L271
	slli	a5,s0,16
	slli	a3,s0,8
	or	a3,a3,a5
	la a2, .LANCHOR12; lw a2, 0(a2);
	slli	a5,s0,24
	or	a3,a3,s0
	or	a3,a3,a5
	addi	a5,a2,956
.L270:
	sw	a3,0(a5)
	mv	a4,a5
	addi	a5,a5,-4
	bne	a2,a4,.L270
.L271:
	sb	s0,0(a1)
	j	.L236
.L256:
	lla	t2,PPUNTARAM
	lbu	a4,0(t2)
	la a5, .LANCHOR12; lw a5, 0(a5);
	la s1, .LANCHOR0; lw s1, 0(s1);
	sw	a5,0(sp)
	lla	a1,vnapage
	li	a2,0
	li	a0,1
	li	t0,2
	li	t1,3
.L268:
	slli	a5,a2,1
	sra	a5,s0,a5
	andi	a5,a5,3
	sll	a3,a0,a2
	beq	a5,t0,.L264
	beq	a5,t1,.L265
	or	a3,a4,a3
	andi	a4,a3,0xff
	beq	a5,a0,.L266
	lla	a5,NTARAM
.L267:
	sw	a5,0(a1)
	addi	a2,a2,1
	li	a5,4
	addi	a1,a1,4
	bne	a2,a5,.L268
	sb	a4,0(t2)
	la a5, .LANCHOR22; sb s0, 0(a5);
	j	.L236
.L257:
	andi	a5,a1,3
	la a4, .LANCHOR21; sb a1, 0(a4);
	la a4, MMC5HackCHRMode; sb a5, 0(a4);
	j	.L236
.L258:
	la a5, .LANCHOR15+1; sb a1, 0(a5);
	j	.L236
.L253:
	la a5, .LANCHOR25; sb s0, 0(a5);
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	andi	a1,a1,127
	li	a0,24576
	addi	sp,sp,16
	tail	_ZL8MMC5WRAMjj
.L254:
	lla	a2,.LANCHOR24
	lbu	a5,0(a2)
	beq	a5,a1,.L274
	slli	a4,a1,4
	slli	a5,a1,2
	or	a5,a5,a4
	or	a5,a5,a1
	slli	a4,a1,6
	or	a5,a5,a4
	andi	a5,a5,0xff
	slli	a3,a5,16
	slli	a4,a5,8
	or	a4,a4,a3
	or	a4,a4,a5
	la a3, .LANCHOR12; lw a3, 0(a3);
	slli	a5,a5,24
	or	a4,a4,a5
	addi	a5,a3,1020
	addi	a3,a3,956
.L273:
	sw	a4,0(a5)
	addi	a5,a5,-4
	bne	a5,a3,.L273
.L274:
	sb	s0,0(a2)
	j	.L236
.L266:
	lla	a5,NTARAM+1024
	j	.L267
.L265:
	not	a3,a3
	lw	a5,0(sp)
	and	a4,a4,a3
	j	.L267
.L264:
	or	a3,a4,a3
	andi	a4,a3,0xff
	mv	a5,s1
	j	.L267
.L240:
	la a5, MMC5HackSPMode; sb s0, 0(a5);
	j	.L236
.L263:
	call	_ZL8MMC5CHRAv
	j	.L281
	.size	_ZL13Mapper5_writejh, .-_ZL13Mapper5_writejh
	.section	.text._Z13MMC5BGVRAMADRj,"ax",@progbits
	.align	2
	.globl	_Z13MMC5BGVRAMADRj
	.hidden	_Z13MMC5BGVRAMADRj
	.type	_Z13MMC5BGVRAMADRj, @function
_Z13MMC5BGVRAMADRj:
	lla	a3,PPU
	lbu	a5,0(a3)
	la a2, newppu; lw a2, 0(a2);
	srli	a4,a0,10
	andi	a5,a5,32
	beq	a2,zero,.L283
	beq	a5,zero,.L284
	lbu	a5,1(a3)
	li	a2,2
	la a3, ppuphase; lw a3, 0(a3);
	andi	a5,a5,24
	beq	a3,a2,.L301
	li	a2,1
	beq	a3,a2,.L283
.L300:
	la a5, .LANCHOR4; lbu a5, 0(a5);
	slli	a4,a4,2
	bne	a5,zero,.L297
	lla	a5,MMC5SPRVPage
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a0,a5,a0
	ret
.L283:
	beq	a5,zero,.L300
	slli	a4,a4,2
.L297:
	lla	a5,MMC5BGVPage
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a0,a5,a0
	ret
.L301:
	beq	a5,zero,.L300
.L284:
	slli	a4,a4,2
	lla	a5,MMC5SPRVPage
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a0,a5,a0
	ret
	.size	_Z13MMC5BGVRAMADRj, .-_Z13MMC5BGVRAMADRj
	.section	.rodata._Z18DetectMMC5WRAMSizej.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	" >8KB external WRAM present.  Use UNIF if you hack the ROM image.\n"
	.section	.text._Z18DetectMMC5WRAMSizej,"ax",@progbits
	.align	2
	.globl	_Z18DetectMMC5WRAMSizej
	.hidden	_Z18DetectMMC5WRAMSizej
	.type	_Z18DetectMMC5WRAMSizej, @function
_Z18DetectMMC5WRAMSizej:
	lla	a1,.LANCHOR28
	mv	a4,a1
	li	a5,0
	li	a2,26
	j	.L306
.L303:
	addi	a5,a5,1
	beq	a5,a2,.L312
.L306:
	lw	a3,0(a4)
	addi	a4,a4,8
	bne	a3,a0,.L303
	addi	sp,sp,-12
	slli	a5,a5,3
	sw	s0,4(sp)
	sw	ra,8(sp)
	add	s0,a1,a5
	lbu	a0,4(s0)
	li	a5,1
	bgtu	a0,a5,.L313
	lw	ra,8(sp)
	lw	s0,4(sp)
	slli	a0,a0,3
	addi	sp,sp,12
	jr	ra
.L313:
	lla	a0,.LC6
	call	printf
	lbu	a0,4(s0)
	lw	ra,8(sp)
	lw	s0,4(sp)
	slli	a0,a0,3
	addi	sp,sp,12
	jr	ra
.L312:
	li	a0,64
	ret
	.size	_Z18DetectMMC5WRAMSizej, .-_Z18DetectMMC5WRAMSizej
	.section	.text._Z9MMC5Syncov,"ax",@progbits
	.align	2
	.globl	_Z9MMC5Syncov
	.hidden	_Z9MMC5Syncov
	.type	_Z9MMC5Syncov, @function
_Z9MMC5Syncov:
	addi	sp,sp,-20
	sw	ra,16(sp)
	sw	s0,12(sp)
	sw	s1,8(sp)
	lla	s0,.LANCHOR12
	call	_ZL7MMC5PRGv
	lw	a5,0(s0)
	lla	t2,PPUNTARAM
	lbu	a4,0(t2)
	sw	a5,4(sp)
	la a5, .LANCHOR0; lw a5, 0(a5);
	la ra, .LANCHOR22; lbu ra, 0(ra);
	sw	a5,0(sp)
	lla	a1,vnapage
	li	a3,0
	li	a0,1
	li	t0,2
	li	t1,3
.L319:
	slli	a5,a3,1
	sra	a5,ra,a5
	andi	a5,a5,3
	sll	a2,a0,a3
	beq	a5,t0,.L315
	or	s1,a4,a2
	beq	a5,t1,.L316
	beq	a5,a0,.L317
	andi	a4,s1,0xff
	lla	a5,NTARAM
.L318:
	sw	a5,0(a1)
	addi	a3,a3,1
	li	a5,4
	addi	a1,a1,4
	bne	a3,a5,.L319
	la a1, .LANCHOR25; lbu a1, 0(a1);
	andi	a1,a1,127
	li	a0,24576
	sb	a4,0(t2)
	call	_ZL8MMC5WRAMjj
	la a5, .LANCHOR4; lbu a5, 0(a5);
	bne	a5,zero,.L320
	call	_ZL8MMC5CHRBv
	call	_ZL8MMC5CHRAv
.L322:
	lw	a1,0(s0)
	lla	a0,.LANCHOR23
	addi	t1,a1,956
	mv	a3,t1
.L321:
	lbu	a4,0(a0)
	mv	a2,a3
	addi	a3,a3,-4
	slli	a5,a4,8
	slli	t0,a4,16
	or	a5,a5,t0
	or	a5,a5,a4
	slli	a4,a4,24
	or	a5,a5,a4
	sw	a5,4(a3)
	bne	a1,a2,.L321
	la a5, .LANCHOR24; lbu a5, 0(a5);
	slli	a3,a5,4
	slli	a4,a5,2
	or	a4,a4,a3
	or	a4,a4,a5
	slli	a5,a5,6
	or	a4,a4,a5
	andi	a4,a4,0xff
	slli	a5,a4,8
	slli	a3,a4,16
	or	a5,a5,a3
	or	a5,a5,a4
	slli	a4,a4,24
	or	a5,a5,a4
	addi	a1,a1,1020
.L323:
	sw	a5,0(a1)
	addi	a1,a1,-4
	bne	t1,a1,.L323
	lw	ra,16(sp)
	lw	s0,12(sp)
	la a5, .LANCHOR21; lbu a5, 0(a5);
	andi	a5,a5,3
	la a4, MMC5HackCHRMode; sb a5, 0(a4);
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L317:
	or	a2,a4,a2
	andi	a4,a2,0xff
	lla	a5,NTARAM+1024
	j	.L318
.L316:
	not	a2,a2
	lw	a5,4(sp)
	and	a4,a4,a2
	j	.L318
.L315:
	or	a2,a4,a2
	lw	a5,0(sp)
	andi	a4,a2,0xff
	j	.L318
.L320:
	call	_ZL8MMC5CHRAv
	call	_ZL8MMC5CHRBv
	j	.L322
	.size	_Z9MMC5Syncov, .-_Z9MMC5Syncov
	.section	.text._Z17MMC5_StateRestorei,"ax",@progbits
	.align	2
	.globl	_Z17MMC5_StateRestorei
	.hidden	_Z17MMC5_StateRestorei
	.type	_Z17MMC5_StateRestorei, @function
_Z17MMC5_StateRestorei:
	tail	_Z9MMC5Syncov
	.size	_Z17MMC5_StateRestorei, .-_Z17MMC5_StateRestorei
	.section	.text._ZL12GenMMC5Resetv,"ax",@progbits
	.align	2
	.type	_ZL12GenMMC5Resetv, @function
_ZL12GenMMC5Resetv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	li	a5,-1
	lla	a4,.LANCHOR20
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a2,.LANCHOR19
	sw	a5,0(a4)
	sw	a5,4(a4)
	sw	a5,8(a4)
	sw	a5,12(a4)
	li	a3,3
	sw	a5,0(a2)
	sw	a5,4(a2)
	la a1, .LANCHOR11; sw a5, 0(a1);
	la a4, .LANCHOR15; sh a5, 0(a4);
	la a4, .LANCHOR18; sb a3, 0(a4);
	la a4, .LANCHOR9; sb a3, 0(a4);
	la a4, .LANCHOR24; sb a5, 0(a4);
	la a4, .LANCHOR23; sb a5, 0(a4);
	la a4, .LANCHOR22; sb a5, 0(a4);
	li	s0,24576
	li	s1,16384
	la a4, .LANCHOR21; sb zero, 0(a4);
	call	_Z9MMC5Syncov
	addi	a1,s0,-1025
	addi	a0,s1,32
	lla	a2,_ZL13Mapper5_writejh
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1025
	addi	a0,s1,32
	lla	a2,_ZL9MMC5_readj
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	addi	a0,s0,-1024
	lla	a2,_ZL12MMC5_ExRAMWrjh
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	addi	a0,s0,-1024
	lla	a2,_ZL12MMC5_ExRAMRdj
	call	_Z14SetReadHandleriiPFhjE
	li	s1,65536
	addi	a1,s1,-1
	lla	a2,_ZL16MMC5_WriteROMRAMjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s1,-1
	lla	a2,_ZL15MMC5_ReadROMRAMj
	li	a0,24576
	li	s1,20480
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s1,21
	lla	a2,_ZL10Mapper5_SWjh
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s1,518
	addi	a0,s1,517
	lla	a2,_ZL13Mapper5_writejh
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s1,518
	addi	a0,s1,517
	lla	a2,_ZL9MMC5_readj
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1024
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	la a2, .LANCHOR0; lw a2, 0(a2);
	li	a0,1
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL12GenMMC5Resetv, .-_ZL12GenMMC5Resetv
	.section	.text._Z7MMC5_hbi,"ax",@progbits
	.align	2
	.globl	_Z7MMC5_hbi
	.hidden	_Z7MMC5_hbi
	.type	_Z7MMC5_hbi, @function
_Z7MMC5_hbi:
	la a5, PPU+1; lbu a5, 0(a5);
	lla	a3,.LANCHOR16
	andi	a4,a5,24
	lbu	a5,0(a3)
	beq	a4,zero,.L332
	li	a4,239
	bgt	a0,a4,.L332
	andi	a4,a5,64
	beq	a4,zero,.L341
	lla	a2,.LANCHOR29
	lbu	a4,0(a2)
	la a1, .LANCHOR26; lbu a1, 0(a1);
	addi	a4,a4,1
	andi	a4,a4,0xff
	sb	a4,0(a2)
	beq	a1,a4,.L342
.L331:
	ret
.L332:
	andi	a5,a5,63
	sb	a5,0(a3)
	li	a0,1
	la a5, .LANCHOR29; sb zero, 0(a5);
	tail	_Z12X6502_IRQEndi
.L341:
	andi	a5,a5,127
	ori	a5,a5,64
	sb	a5,0(a3)
	li	a0,1
	la a5, .LANCHOR29; sb zero, 0(a5);
	tail	_Z12X6502_IRQEndi
.L342:
	ori	a5,a5,-128
	sb	a5,0(a3)
	la a5, .LANCHOR27; lb a5, 0(a5);
	bge	a5,zero,.L331
	li	a0,1
	tail	_Z14X6502_IRQBegini
	.size	_Z7MMC5_hbi, .-_Z7MMC5_hbi
	.section	.text._Z12NSFMMC5_Initv,"ax",@progbits
	.align	2
	.globl	_Z12NSFMMC5_Initv
	.hidden	_Z12NSFMMC5_Initv
	.type	_Z12NSFMMC5_Initv, @function
_Z12NSFMMC5_Initv:
	addi	sp,sp,-12
	li	a2,40
	li	a1,0
	lla	a0,.LANCHOR2
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	memset
	li	a0,1024
	la a5, .LANCHOR17; sh zero, 0(a5);
	call	_Z12FCEU_gmallocj
	li	s0,24576
	la a5, .LANCHOR0; sw a0, 0(a5);
	call	_Z11Mapper5_ESIv
	addi	a1,s0,-17
	addi	a0,s0,-1024
	lla	a2,_ZL12MMC5_ExRAMWrjh
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-17
	addi	a0,s0,-1024
	lla	a2,_ZL12MMC5_ExRAMRdj
	call	_Z14SetReadHandleriiPFhjE
	li	s0,20480
	addi	a1,s0,21
	li	a5,2
	lla	a2,_ZL10Mapper5_SWjh
	li	a0,20480
	la a4, MMC5HackCHRMode; sb a5, 0(a4);
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,518
	addi	a0,s0,517
	lla	a2,_ZL13Mapper5_writejh
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,518
	addi	a0,s0,517
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL9MMC5_readj
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_Z12NSFMMC5_Initv, .-_Z12NSFMMC5_Initv
	.section	.text._Z13NSFMMC5_Closev,"ax",@progbits
	.align	2
	.globl	_Z13NSFMMC5_Closev
	.hidden	_Z13NSFMMC5_Closev
	.type	_Z13NSFMMC5_Closev, @function
_Z13NSFMMC5_Closev:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a0, .LANCHOR6; lw a0, 0(a0);
	beq	a0,zero,.L346
	call	_Z10FCEU_gfreePv
.L346:
	la a0, .LANCHOR0; lw a0, 0(a0);
	la a5, .LANCHOR6; sw zero, 0(a5);
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR0; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
	.size	_Z13NSFMMC5_Closev, .-_Z13NSFMMC5_Closev
	.section	.text._Z12Mapper5_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12Mapper5_InitP8CartInfo
	.hidden	_Z12Mapper5_InitP8CartInfo
	.type	_Z12Mapper5_InitP8CartInfo, @function
_Z12Mapper5_InitP8CartInfo:
	lw	a5,52(a0)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	mv	s0,a0
	beq	a5,zero,.L352
	lw	a5,60(a0)
	lw	a4,64(a0)
	add	a5,a5,a4
	srai	a1,a5,31
	andi	a1,a1,1023
	add	a1,a1,a5
	srai	a1,a1,10
	mv	a5,a1
.L353:
	lw	a2,48(s0)
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	la a4, .LANCHOR7; sw a5, 0(a4);
	addi	sp,sp,12
	tail	_ZL12GenMMC5_InitP8CartInfoii
.L352:
	lw	a2,92(a0)
	lla	a0,.LANCHOR28
	mv	a4,a0
	li	a1,26
	j	.L357
.L354:
	addi	a5,a5,1
	beq	a5,a1,.L360
.L357:
	lw	a3,0(a4)
	addi	a4,a4,8
	bne	a2,a3,.L354
	slli	a5,a5,3
	add	s1,a0,a5
	lbu	a1,4(s1)
	li	a5,1
	bleu	a1,a5,.L355
	lla	a0,.LC6
	call	printf
	lbu	a1,4(s1)
.L355:
	slli	a1,a1,3
	mv	a5,a1
	j	.L353
.L360:
	li	a5,64
	li	a1,64
	j	.L353
	.size	_Z12Mapper5_InitP8CartInfo, .-_Z12Mapper5_InitP8CartInfo
	.section	.text._Z10ELROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10ELROM_InitP8CartInfo
	.hidden	_Z10ELROM_InitP8CartInfo
	.type	_Z10ELROM_InitP8CartInfo, @function
_Z10ELROM_InitP8CartInfo:
	li	a2,0
	li	a1,0
	tail	_ZL12GenMMC5_InitP8CartInfoii
	.size	_Z10ELROM_InitP8CartInfo, .-_Z10ELROM_InitP8CartInfo
	.section	.text._Z10EKROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10EKROM_InitP8CartInfo
	.hidden	_Z10EKROM_InitP8CartInfo
	.type	_Z10EKROM_InitP8CartInfo, @function
_Z10EKROM_InitP8CartInfo:
	lw	a2,48(a0)
	li	a1,8
	tail	_ZL12GenMMC5_InitP8CartInfoii
	.size	_Z10EKROM_InitP8CartInfo, .-_Z10EKROM_InitP8CartInfo
	.section	.text._Z10ETROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10ETROM_InitP8CartInfo
	.hidden	_Z10ETROM_InitP8CartInfo
	.type	_Z10ETROM_InitP8CartInfo, @function
_Z10ETROM_InitP8CartInfo:
	lw	a2,48(a0)
	li	a1,16
	tail	_ZL12GenMMC5_InitP8CartInfoii
	.size	_Z10ETROM_InitP8CartInfo, .-_Z10ETROM_InitP8CartInfo
	.section	.text._Z10EWROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10EWROM_InitP8CartInfo
	.hidden	_Z10EWROM_InitP8CartInfo
	.type	_Z10EWROM_InitP8CartInfo, @function
_Z10EWROM_InitP8CartInfo:
	lw	a2,48(a0)
	li	a1,32
	tail	_ZL12GenMMC5_InitP8CartInfoii
	.size	_Z10EWROM_InitP8CartInfo, .-_Z10EWROM_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"PRGB"
	.align	2
.LC8:
	.string	"CHRA"
	.align	2
.LC9:
	.string	"CHRB"
	.align	2
.LC10:
	.string	"WRMP"
	.align	2
.LC11:
	.string	"WRME"
	.align	2
.LC12:
	.string	"ABMD"
	.align	2
.LC13:
	.string	"IRQS"
	.align	2
.LC14:
	.string	"IRQE"
	.align	2
.LC15:
	.string	"CHRM"
	.align	2
.LC16:
	.string	"NTAM"
	.align	2
.LC17:
	.string	"NTFL"
	.align	2
.LC18:
	.string	"ATFL"
	.align	2
.LC19:
	.string	"IRQR"
	.align	2
.LC20:
	.string	"LCTR"
	.align	2
.LC21:
	.string	"PSIZ"
	.align	2
.LC22:
	.string	"VSIZ"
	.align	2
.LC23:
	.string	"MUL2"
	.align	2
.LC24:
	.string	"WRPR"
	.align	2
.LC25:
	.string	"MEMI"
	.align	2
.LC26:
	.string	"SDW0"
	.align	2
.LC27:
	.string	"SDW1"
	.align	2
.LC28:
	.string	"SDEV"
	.align	2
.LC29:
	.string	"SDEN"
	.align	2
.LC30:
	.string	"SDRU"
	.align	2
.LC31:
	.string	"SDRW"
	.align	2
.LC32:
	.string	"SDRC"
	.align	2
.LC33:
	.string	"DCT0"
	.align	2
.LC34:
	.string	"DCT1"
	.align	2
.LC35:
	.string	"BC00"
	.align	2
.LC36:
	.string	"BC01"
	.align	2
.LC37:
	.string	"BC02"
	.align	2
.LC38:
	.string	"VCT0"
	.align	2
.LC39:
	.string	"VCT1"
	.hidden	MMC5CartList
	.globl	MMC5CartList
	.hidden	mmc5ABMode
	.globl	mmc5ABMode
	.section	.bss._ZL13MMC5WRAMIndex,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL13MMC5WRAMIndex, @object
	.size	_ZL13MMC5WRAMIndex, 128
_ZL13MMC5WRAMIndex:
	.zero	128
	.section	.bss._ZL9CHRBanksA,"aw",@nobits
	.align	2
	.set	.LANCHOR20,. + 0
	.type	_ZL9CHRBanksA, @object
	.size	_ZL9CHRBanksA, 16
_ZL9CHRBanksA:
	.zero	16
	.section	.bss._ZL9MMC5Sound,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9MMC5Sound, @object
	.size	_ZL9MMC5Sound, 40
_ZL9MMC5Sound:
	.zero	40
	.section	.data.MMC5CartList,"aw"
	.align	2
	.set	.LANCHOR28,. + 0
	.type	MMC5CartList, @object
	.size	MMC5CartList, 208
MMC5CartList:
	.word	1867399954
	.byte	4
	.zero	3
	.word	368995599
	.byte	2
	.zero	3
	.word	1730093992
	.byte	0
	.zero	3
	.word	-850496464
	.byte	0
	.zero	3
	.word	-316381762
	.byte	0
	.zero	3
	.word	-30111535
	.byte	2
	.zero	3
	.word	247906339
	.byte	1
	.zero	3
	.word	184236382
	.byte	0
	.zero	3
	.word	485296239
	.byte	2
	.zero	3
	.word	-1665475547
	.byte	1
	.zero	3
	.word	1670822280
	.byte	2
	.zero	3
	.word	-1676118485
	.byte	2
	.zero	3
	.word	-1337455895
	.byte	0
	.zero	3
	.word	-1267507284
	.byte	0
	.zero	3
	.word	-180328581
	.byte	4
	.zero	3
	.word	-286677374
	.byte	2
	.zero	3
	.word	-105634801
	.byte	2
	.zero	3
	.word	-1931183909
	.byte	2
	.zero	3
	.word	-267262832
	.byte	4
	.zero	3
	.word	-1132397742
	.byte	1
	.zero	3
	.word	407642404
	.byte	4
	.zero	3
	.word	-292657837
	.byte	4
	.zero	3
	.word	-718083697
	.byte	1
	.zero	3
	.word	972213835
	.byte	2
	.zero	3
	.word	-1149271398
	.byte	0
	.zero	3
	.word	-1398712765
	.byte	2
	.zero	3
	.section	.data._ZL14MMC5_StateRegs,"aw"
	.align	2
	.set	.LANCHOR13,. + 0
	.type	_ZL14MMC5_StateRegs, @object
	.size	_ZL14MMC5_StateRegs, 408
_ZL14MMC5_StateRegs:
	.word	_ZL8PRGBanks
	.word	4
	.word	.LC7
	.word	_ZL9CHRBanksA
	.word	16
	.word	.LC8
	.word	_ZL9CHRBanksB
	.word	8
	.word	.LC9
	.word	_ZL8WRAMPage
	.word	1
	.word	.LC10
	.word	_ZL14WRAMMaskEnable
	.word	2
	.word	.LC11
	.word	mmc5ABMode
	.word	1
	.word	.LC12
	.word	_ZL11IRQScanline
	.word	1
	.word	.LC13
	.word	_ZL9IRQEnable
	.word	1
	.word	.LC14
	.word	_ZL7CHRMode
	.word	1
	.word	.LC15
	.word	_ZL12NTAMirroring
	.word	1
	.word	.LC16
	.word	_ZL6NTFill
	.word	1
	.word	.LC17
	.word	_ZL6ATFill
	.word	1
	.word	.LC18
	.word	_ZL8MMC5IRQR
	.word	1
	.word	.LC19
	.word	_ZL15MMC5LineCounter
	.word	1
	.word	.LC20
	.word	_ZL9mmc5psize
	.word	1
	.word	.LC21
	.word	_ZL9mmc5vsize
	.word	1
	.word	.LC22
	.word	_ZL3mul
	.word	2
	.word	.LC23
	.word	_ZL16MMC5ROMWrProtect
	.word	4
	.word	.LC24
	.word	_ZL9MMC5MemIn
	.word	5
	.word	.LC25
	.word	_ZL9MMC5Sound
	.word	-2147483646
	.word	.LC26
	.word	_ZL9MMC5Sound+2
	.word	-2147483646
	.word	.LC27
	.word	_ZL9MMC5Sound+4
	.word	2
	.word	.LC28
	.word	_ZL9MMC5Sound+6
	.word	1
	.word	.LC29
	.word	_ZL9MMC5Sound+7
	.word	1
	.word	.LC30
	.word	_ZL9MMC5Sound+8
	.word	1
	.word	.LC31
	.word	_ZL9MMC5Sound+9
	.word	1
	.word	.LC32
	.word	_ZL9MMC5Sound+12
	.word	-2147483644
	.word	.LC33
	.word	_ZL9MMC5Sound+16
	.word	-2147483644
	.word	.LC34
	.word	_ZL9MMC5Sound+20
	.word	-2147483644
	.word	.LC35
	.word	_ZL9MMC5Sound+24
	.word	-2147483644
	.word	.LC36
	.word	_ZL9MMC5Sound+28
	.word	-2147483644
	.word	.LC37
	.word	_ZL9MMC5Sound+32
	.word	-2147483644
	.word	.LC38
	.word	_ZL9MMC5Sound+36
	.word	-2147483644
	.word	.LC39
	.word	0
	.zero	8
	.section	.sbss._ZL11IRQScanline,"aw",@nobits
	.set	.LANCHOR26,. + 0
	.type	_ZL11IRQScanline, @object
	.size	_ZL11IRQScanline, 1
_ZL11IRQScanline:
	.zero	1
	.section	.sbss._ZL12MMC5WRAMsize,"aw",@nobits
	.set	.LANCHOR14,. + 0
	.type	_ZL12MMC5WRAMsize, @object
	.size	_ZL12MMC5WRAMsize, 1
_ZL12MMC5WRAMsize:
	.zero	1
	.section	.sbss._ZL12NTAMirroring,"aw",@nobits
	.set	.LANCHOR22,. + 0
	.type	_ZL12NTAMirroring, @object
	.size	_ZL12NTAMirroring, 1
_ZL12NTAMirroring:
	.zero	1
	.section	.sbss._ZL14WRAMMaskEnable,"aw",@nobits
	.align	2
	.set	.LANCHOR15,. + 0
	.type	_ZL14WRAMMaskEnable, @object
	.size	_ZL14WRAMMaskEnable, 2
_ZL14WRAMMaskEnable:
	.zero	2
	.section	.sbss._ZL15MMC5LineCounter,"aw",@nobits
	.set	.LANCHOR29,. + 0
	.type	_ZL15MMC5LineCounter, @object
	.size	_ZL15MMC5LineCounter, 1
_ZL15MMC5LineCounter:
	.zero	1
	.section	.sbss._ZL16MMC5ROMWrProtect,"aw",@nobits
	.align	2
	.set	.LANCHOR10,. + 0
	.type	_ZL16MMC5ROMWrProtect, @object
	.size	_ZL16MMC5ROMWrProtect, 4
_ZL16MMC5ROMWrProtect:
	.zero	4
	.section	.sbss._ZL3mul,"aw",@nobits
	.align	2
	.set	.LANCHOR17,. + 0
	.type	_ZL3mul, @object
	.size	_ZL3mul, 2
_ZL3mul:
	.zero	2
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL4sfun,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL4sfun, @object
	.size	_ZL4sfun, 4
_ZL4sfun:
	.zero	4
	.section	.sbss._ZL5ExRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL5ExRAM, @object
	.size	_ZL5ExRAM, 4
_ZL5ExRAM:
	.zero	4
	.section	.sbss._ZL5psfun,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL5psfun, @object
	.size	_ZL5psfun, 4
_ZL5psfun:
	.zero	4
	.section	.sbss._ZL6ATFill,"aw",@nobits
	.set	.LANCHOR24,. + 0
	.type	_ZL6ATFill, @object
	.size	_ZL6ATFill, 1
_ZL6ATFill:
	.zero	1
	.section	.sbss._ZL6NTFill,"aw",@nobits
	.set	.LANCHOR23,. + 0
	.type	_ZL6NTFill, @object
	.size	_ZL6NTFill, 1
_ZL6NTFill:
	.zero	1
	.section	.sbss._ZL7CHRMode,"aw",@nobits
	.set	.LANCHOR21,. + 0
	.type	_ZL7CHRMode, @object
	.size	_ZL7CHRMode, 1
_ZL7CHRMode:
	.zero	1
	.section	.sbss._ZL8MMC5IRQR,"aw",@nobits
	.set	.LANCHOR16,. + 0
	.type	_ZL8MMC5IRQR, @object
	.size	_ZL8MMC5IRQR, 1
_ZL8MMC5IRQR:
	.zero	1
	.section	.sbss._ZL8MMC5fill,"aw",@nobits
	.align	2
	.set	.LANCHOR12,. + 0
	.type	_ZL8MMC5fill, @object
	.size	_ZL8MMC5fill, 4
_ZL8MMC5fill:
	.zero	4
	.section	.sbss._ZL8PRGBanks,"aw",@nobits
	.align	2
	.set	.LANCHOR11,. + 0
	.type	_ZL8PRGBanks, @object
	.size	_ZL8PRGBanks, 4
_ZL8PRGBanks:
	.zero	4
	.section	.sbss._ZL8WRAMPage,"aw",@nobits
	.set	.LANCHOR25,. + 0
	.type	_ZL8WRAMPage, @object
	.size	_ZL8WRAMPage, 1
_ZL8WRAMPage:
	.zero	1
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.section	.sbss._ZL9CHRBanksB,"aw",@nobits
	.align	2
	.set	.LANCHOR19,. + 0
	.type	_ZL9CHRBanksB, @object
	.size	_ZL9CHRBanksB, 8
_ZL9CHRBanksB:
	.zero	8
	.section	.sbss._ZL9IRQEnable,"aw",@nobits
	.set	.LANCHOR27,. + 0
	.type	_ZL9IRQEnable, @object
	.size	_ZL9IRQEnable, 1
_ZL9IRQEnable:
	.zero	1
	.section	.sbss._ZL9MMC5MemIn,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	_ZL9MMC5MemIn, @object
	.size	_ZL9MMC5MemIn, 5
_ZL9MMC5MemIn:
	.zero	5
	.section	.sbss._ZL9mmc5psize,"aw",@nobits
	.set	.LANCHOR9,. + 0
	.type	_ZL9mmc5psize, @object
	.size	_ZL9mmc5psize, 1
_ZL9mmc5psize:
	.zero	1
	.section	.sbss._ZL9mmc5vsize,"aw",@nobits
	.set	.LANCHOR18,. + 0
	.type	_ZL9mmc5vsize, @object
	.size	_ZL9mmc5vsize, 1
_ZL9mmc5vsize:
	.zero	1
	.section	.sbss.mmc5ABMode,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	mmc5ABMode, @object
	.size	mmc5ABMode, 1
mmc5ABMode:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
