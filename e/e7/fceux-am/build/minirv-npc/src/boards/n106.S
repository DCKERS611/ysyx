#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"n106.cpp"
	.option nopic
	.text
	.section	.text._ZL5AWRAMj,"ax",@progbits
	.align	2
	.type	_ZL5AWRAMj, @function
_ZL5AWRAMj:
	lla	a5,_ZL4WRAM-24576
	add	a0,a0,a5
	lbu	a0,0(a0)
	ret
	.size	_ZL5AWRAMj, .-_ZL5AWRAMj
	.section	.text._ZL5BWRAMjh,"ax",@progbits
	.align	2
	.type	_ZL5BWRAMjh, @function
_ZL5BWRAMjh:
	lla	a5,_ZL4WRAM-24576
	add	a0,a0,a5
	sb	a1,0(a0)
	ret
	.size	_ZL5BWRAMjh, .-_ZL5BWRAMjh
	.section	.text._ZL14Namco_Read4800j,"ax",@progbits
	.align	2
	.type	_ZL14Namco_Read4800j, @function
_ZL14Namco_Read4800j:
	lla	a3,.LANCHOR0
	lbu	a5,0(a3)
	lla	a4,.LANCHOR1
	andi	a2,a5,127
	add	a4,a4,a2
	slli	a2,a5,24
	srai	a2,a2,24
	lbu	a0,0(a4)
	blt	a2,zero,.L6
	ret
.L6:
	addi	a5,a5,1
	ori	a5,a5,-128
	sb	a5,0(a3)
	ret
	.size	_ZL14Namco_Read4800j, .-_ZL14Namco_Read4800j
	.section	.text._ZL14Namco_Read5000j,"ax",@progbits
	.align	2
	.type	_ZL14Namco_Read5000j, @function
_ZL14Namco_Read5000j:
	la a0, .LANCHOR2; lbu a0, 0(a0);
	ret
	.size	_ZL14Namco_Read5000j, .-_ZL14Namco_Read5000j
	.section	.text._ZL14Namco_Read5800j,"ax",@progbits
	.align	2
	.type	_ZL14Namco_Read5800j, @function
_ZL14Namco_Read5800j:
	la a0, .LANCHOR2; lhu a0, 0(a0);
	srli	a0,a0,8
	ret
	.size	_ZL14Namco_Read5800j, .-_ZL14Namco_Read5800j
	.section	.text._ZL8FixCacheii,"ax",@progbits
	.align	2
	.type	_ZL8FixCacheii, @function
_ZL8FixCacheii:
	srai	a5,a0,3
	li	a4,2
	andi	a0,a0,7
	andi	a5,a5,7
	beq	a0,a4,.L10
	li	a4,4
	beq	a0,a4,.L11
	beq	a0,zero,.L13
	ret
.L13:
	slli	a5,a5,2
	lla	a4,.LANCHOR3
	add	a4,a4,a5
	lw	a5,0(a4)
	andi	a5,a5,-256
	or	a5,a5,a1
	sw	a5,0(a4)
	ret
.L11:
	slli	a5,a5,2
	lla	a4,.LANCHOR3
	add	a4,a4,a5
	lw	a5,0(a4)
	li	a3,-196608
	addi	a3,a3,-1
	and	a5,a5,a3
	slli	a1,a1,16
	li	a3,196608
	and	a1,a1,a3
	or	a5,a5,a1
	sw	a5,0(a4)
	ret
.L10:
	slli	a5,a5,2
	lla	a4,.LANCHOR3
	add	a4,a4,a5
	lw	a5,0(a4)
	li	a3,-65536
	addi	a3,a3,255
	and	a5,a5,a3
	slli	a1,a1,8
	or	a1,a5,a1
	sw	a1,0(a4)
	ret
	.size	_ZL8FixCacheii, .-_ZL8FixCacheii
	.section	.text._ZL10NamcoSoundi,"ax",@progbits
	.align	2
	.type	_ZL10NamcoSoundi, @function
_ZL10NamcoSoundi:
	ret
	.size	_ZL10NamcoSoundi, .-_ZL10NamcoSoundi
	.section	.text._ZL6SyncHQi,"ax",@progbits
	.align	2
	.type	_ZL6SyncHQi, @function
_ZL6SyncHQi:
	ret
	.size	_ZL6SyncHQi, .-_ZL6SyncHQi
	.section	.text._ZL14DoNamcoSoundHQv,"ax",@progbits
	.align	2
	.type	_ZL14DoNamcoSoundHQv, @function
_ZL14DoNamcoSoundHQv:
	ret
	.size	_ZL14DoNamcoSoundHQv, .-_ZL14DoNamcoSoundHQv
	.section	.text._ZL10SyncMirrorv,"ax",@progbits
	.align	2
	.type	_ZL10SyncMirrorv, @function
_ZL10SyncMirrorv:
	la a5, .LANCHOR4; lbu a5, 0(a5);
	li	a4,2
	beq	a5,a4,.L18
	bgtu	a5,a4,.L19
	beq	a5,zero,.L20
	li	a0,1
	tail	_Z9setmirrori
.L19:
	li	a4,3
	bne	a5,a4,.L17
.L20:
	li	a0,2
	tail	_Z9setmirrori
.L18:
	li	a0,0
	tail	_Z9setmirrori
.L17:
	ret
	.size	_ZL10SyncMirrorv, .-_ZL10SyncMirrorv
	.section	.text._ZL12NamcoIRQHooki,"ax",@progbits
	.align	2
	.type	_ZL12NamcoIRQHooki, @function
_ZL12NamcoIRQHooki:
	la a5, .LANCHOR5; lbu a5, 0(a5);
	beq	a5,zero,.L32
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR2
	lhu	a5,0(s0)
	li	a4,32768
	sw	ra,8(sp)
	add	a0,a5,a0
	slli	a0,a0,16
	srli	a0,a0,16
	addi	a4,a4,-2
	sh	a0,0(s0)
	bgtu	a0,a4,.L35
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L32:
	ret
.L35:
	li	a0,1
	call	_Z14X6502_IRQBegini
	la a5, .LANCHOR5; sb zero, 0(a5);
	li	a5,-32768
	xori	a5,a5,-1
	lw	ra,8(sp)
	sh	a5,0(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL12NamcoIRQHooki, .-_ZL12NamcoIRQHooki
	.section	.text._ZL6FixCRRv,"ax",@progbits
	.align	2
	.type	_ZL6FixCRRv, @function
_ZL6FixCRRv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	li	s1,0
	lla	s0,.LANCHOR8
.L39:
	lla	a5,.LANCHOR7
	lbu	a5,0(a5)
	srai	a3,s1,2
	lw	a1,0(s0)
	addi	a3,a3,6
	sra	a5,a5,a3
	andi	a5,a5,1
	lla	a4,.LANCHOR6
	add	a3,a4,s1
	or	a5,a5,a1
	slli	a0,s1,10
	lbu	a1,0(a3)
	addi	s1,s1,1
	bne	a5,zero,.L37
	li	a5,223
	bgtu	a1,a5,.L38
.L37:
	call	_Z7setchr1jj
.L38:
	li	a5,8
	bne	s1,a5,.L39
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL6FixCRRv, .-_ZL6FixCRRv
	.section	.text._ZL18Mapper19C0D8_writejh,"ax",@progbits
	.align	2
	.type	_ZL18Mapper19C0D8_writejh, @function
_ZL18Mapper19C0D8_writejh:
	li	a5,-49152
	add	a2,a0,a5
	srli	a2,a2,11
	lla	a5,.LANCHOR9
	add	a5,a5,a2
	sb	a1,0(a5)
	li	a5,223
	bleu	a1,a5,.L43
	slli	a1,a1,10
	andi	a5,a1,1024
	lla	a0,NTARAM
	li	a1,1
	add	a0,a0,a5
	tail	_Z9setntamemPhij
.L43:
	la a5, CHRmask1; lw a5, 0(a5);
	and	a1,a1,a5
	slli	a5,a1,10
	la a0, CHRptr; lw a0, 0(a0);
	li	a1,0
	add	a0,a0,a5
	tail	_Z9setntamemPhij
	.size	_ZL18Mapper19C0D8_writejh, .-_ZL18Mapper19C0D8_writejh
	.section	.text._ZL5M19SCv,"ax",@progbits
	.align	2
	.type	_ZL5M19SCv, @function
_ZL5M19SCv:
	la a5, FSettings+60; lw a5, 0(a5);
	bne	a5,zero,.L49
	ret
.L49:
	addi	sp,sp,-12
	li	a2,32
	li	a1,0
	lla	a5,_ZL5M19SCv
	lla	a0,.LANCHOR10
	sw	ra,8(sp)
	la a4, GameExpSound+16; sw a5, 0(a4);
	call	memset
	lw	ra,8(sp)
	li	a2,32
	li	a1,0
	lla	a0,.LANCHOR11
	addi	sp,sp,12
	tail	memset
	.size	_ZL5M19SCv, .-_ZL5M19SCv
	.section	.text._ZL22Mapper210_StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL22Mapper210_StateRestorei, @function
_ZL22Mapper210_StateRestorei:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR12
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,63
	li	a0,57344
	call	_Z7setprg8jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL6FixCRRv
	.size	_ZL22Mapper210_StateRestorei, .-_ZL22Mapper210_StateRestorei
	.section	.text._ZL21Mapper19_StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL21Mapper19_StateRestorei, @function
_ZL21Mapper19_StateRestorei:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	s1,.LANCHOR12
	lbu	a1,0(s1)
	li	a0,32768
	li	s0,0
	call	_Z7setprg8jj
	lbu	a1,1(s1)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s1)
	li	a0,49152
	lla	s1,CHRptr
	call	_Z7setprg8jj
	li	a1,63
	li	a0,57344
	call	_Z7setprg8jj
.L55:
	lla	a5,.LANCHOR9
	add	a4,a5,s0
	lbu	a4,0(a4)
	lla	a0,NTARAM
	li	t1,223
	slli	a3,a4,10
	andi	a3,a3,1024
	mv	a2,s0
	li	a1,1
	add	a0,a0,a3
	bgtu	a4,t1,.L60
	lw	a0,0(s1)
	la a3, CHRmask1; lw a3, 0(a3);
	and	a4,a4,a3
	slli	a4,a4,10
	li	a1,0
	add	a0,a0,a4
.L60:
	call	_Z9setntamemPhij
	addi	s0,s0,1
	li	a4,4
	bne	s0,a4,.L55
	call	_ZL6FixCRRv
	li	s0,64
	call	_ZL10SyncMirrorv
	lla	s1,.LANCHOR1
.L56:
	add	a4,s1,s0
	lbu	a1,0(a4)
	mv	a0,s0
	addi	s0,s0,1
	call	_ZL8FixCacheii
	li	a5,128
	bne	s0,a5,.L56
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL21Mapper19_StateRestorei, .-_ZL21Mapper19_StateRestorei
	.section	.text._ZL10N106_Powerv,"ax",@progbits
	.align	2
	.type	_ZL10N106_Powerv, @function
_ZL10N106_Powerv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	sw	ra,8(sp)
	sw	s1,0(sp)
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL14Mapper19_writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,24576
	li	a0,16384
	lla	a2,_ZL14Mapper19_writejh
	addi	a1,s0,-1
	addi	a0,a0,32
	call	_Z15SetWriteHandleriiPFvjhE
	la s1, .LANCHOR8; lw s1, 0(s1);
	beq	s1,zero,.L71
.L62:
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_ZL5AWRAMj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL5BWRAMjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a2,_ZL4WRAM
	li	a1,24576
	li	a0,8
	call	_Z16FCEU_CheatAddRAMijPh
	lla	s0,.LANCHOR12
	lbu	a1,0(s0)
	li	a5,-1
	li	a0,32768
	la a4, .LANCHOR7; sb a5, 0(a4);
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,63
	li	a0,57344
	call	_Z7setprg8jj
	call	_ZL6FixCRRv
	la a5, .LANCHOR13; lw a5, 0(a5);
	beq	a5,zero,.L72
.L66:
	li	s0,64
	lla	s1,.LANCHOR1
.L67:
	add	a4,s1,s0
	lbu	a1,0(a4)
	mv	a0,s0
	addi	s0,s0,1
	call	_ZL8FixCacheii
	li	a5,128
	bne	s0,a5,.L67
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L71:
	li	a1,57344
	lla	a2,_ZL18Mapper19C0D8_writejh
	addi	a1,a1,-1
	li	a0,49152
	call	_Z15SetWriteHandleriiPFvjhE
	li	a5,20480
	addi	a1,a5,-1
	addi	a0,a5,-2048
	lla	a2,_ZL14Namco_Read4800j
	call	_Z14SetReadHandleriiPFhjE
	li	a5,20480
	addi	a1,a5,2047
	lla	a2,_ZL14Namco_Read5000j
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	addi	a0,s0,-2048
	lla	a2,_ZL14Namco_Read5800j
	call	_Z14SetReadHandleriiPFhjE
	li	a4,-1
	lla	s0,.LANCHOR9
	li	a3,255
	sw	a4,0(s0)
	slli	a4,a3,10
	andi	a4,a4,1024
	lla	a0,NTARAM
	li	t1,223
	mv	a2,s1
	li	a1,1
	add	a0,a0,a4
	bgtu	a3,t1,.L70
.L63:
	lla	a5,CHRptr
	lw	a0,0(a5)
	la a4, CHRmask1; lw a4, 0(a4);
	and	a4,a3,a4
	slli	a4,a4,10
	li	a1,0
	add	a0,a0,a4
.L70:
	call	_Z9setntamemPhij
	addi	s1,s1,1
	li	a4,4
	add	a3,s0,s1
	beq	s1,a4,.L62
	lbu	a3,0(a3)
	lla	a0,NTARAM
	li	t1,223
	slli	a4,a3,10
	andi	a4,a4,1024
	mv	a2,s1
	li	a1,1
	add	a0,a0,a4
	bleu	a3,t1,.L63
	j	.L70
.L72:
	li	a2,1
	li	a1,8192
	lla	a0,_ZL4WRAM
	call	_Z15FCEU_MemoryRandPhjb
	li	a2,1
	li	a1,128
	lla	a0,.LANCHOR1
	call	_Z15FCEU_MemoryRandPhjb
	j	.L66
	.size	_ZL10N106_Powerv, .-_ZL10N106_Powerv
	.section	.text._ZL14Mapper19_writejh,"ax",@progbits
	.align	2
	.type	_ZL14Mapper19_writejh, @function
_ZL14Mapper19_writejh:
	li	a4,65536
	addi	a4,a4,-2048
	addi	sp,sp,-12
	and	a0,a0,a4
	li	a5,-32768
	li	a3,16384
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	add	a5,a0,a5
	addi	a3,a3,-2048
	mv	s0,a1
	bleu	a5,a3,.L101
	li	a5,57344
	beq	a0,a5,.L77
	bgtu	a0,a5,.L78
	li	a5,20480
	beq	a0,a5,.L79
	li	a4,24576
	addi	a4,a4,-2048
	bne	a0,a4,.L102
	lla	a2,.LANCHOR2
	lbu	a5,0(a2)
	li	a3,32768
	slli	a4,a1,8
	addi	a3,a3,-256
	and	a4,a4,a3
	or	a5,a5,a4
	andi	s0,a1,-128
	sh	a5,0(a2)
	li	a0,1
	la a5, .LANCHOR5; sb s0, 0(a5);
	j	.L99
.L78:
	li	a5,61440
	beq	a0,a5,.L82
	bne	a0,a4,.L103
	la a5, .LANCHOR0; sb a1, 0(a5);
.L73:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L103:
	addi	a5,a5,-2048
	bne	a0,a5,.L73
	andi	a5,a1,-64
	lla	s1,.LANCHOR12
	la a4, .LANCHOR7; sb a5, 0(a4);
	call	_ZL6FixCRRv
	lbu	a1,0(s1)
	andi	s0,s0,63
	li	a0,32768
	sb	s0,1(s1)
.L100:
	call	_Z7setprg8jj
	lbu	a1,1(s1)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s1)
	li	a0,49152
	call	_Z7setprg8jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a1,63
	li	a0,57344
	addi	sp,sp,12
	tail	_Z7setprg8jj
.L102:
	addi	a5,a5,-2048
	bne	a0,a5,.L73
	lla	s1,.LANCHOR0
	lbu	a0,0(s1)
	andi	a5,a0,64
	beq	a5,zero,.L85
	la a5, FSettings+60; lw a5, 0(a5);
	beq	a5,zero,.L86
	lla	a5,GameExpSound
	lla	a4,_ZL10NamcoSoundi
	sw	a4,0(a5)
	lla	a4,_ZL14DoNamcoSoundHQv
	sw	a4,8(a5)
	lla	a4,_ZL6SyncHQi
	sw	a4,12(a5)
.L86:
	mv	a1,s0
	call	_ZL8FixCacheii
	lbu	a0,0(s1)
.L85:
	andi	a4,a0,127
	lla	a5,.LANCHOR1
	add	a5,a5,a4
	sb	s0,0(a5)
	slli	a5,a0,24
	srai	a5,a5,24
	bge	a5,zero,.L73
	addi	a0,a0,1
	ori	a0,a0,-128
	sb	a0,0(s1)
	j	.L73
.L101:
	srli	a5,a5,11
	srai	a3,a5,2
	addi	a3,a3,6
	la a4, .LANCHOR7; lbu a4, 0(a4);
	sra	a4,a4,a3
	lla	a3,.LANCHOR6
	add	a3,a3,a5
	andi	a4,a4,1
	sb	a1,0(a3)
	la a3, .LANCHOR8; lw a3, 0(a3);
	or	a4,a4,a3
	bne	a4,zero,.L75
	li	a4,223
	bgtu	a1,a4,.L73
.L75:
	mv	a1,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	slli	a0,a5,10
	addi	sp,sp,12
	tail	_Z7setchr1jj
.L79:
	li	a0,1
	la a5, .LANCHOR2; sb a1, 0(a5);
.L99:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_Z12X6502_IRQEndi
.L82:
	lla	s1,.LANCHOR12
	andi	s0,s0,63
	lbu	a1,0(s1)
	li	a0,32768
	sb	s0,2(s1)
	j	.L100
.L77:
	andi	a1,a1,63
	lla	s1,.LANCHOR12
	sb	a1,0(s1)
	la a5, .LANCHOR8; lw a5, 0(a5);
	bne	a5,zero,.L104
	li	a0,32768
	j	.L100
.L104:
	srli	s0,s0,6
	la a5, .LANCHOR4; sb s0, 0(a5);
	call	_ZL10SyncMirrorv
	lbu	a1,0(s1)
	li	a0,32768
	j	.L100
	.size	_ZL14Mapper19_writejh, .-_ZL14Mapper19_writejh
	.section	.text._Z12Mapper19_ESIv,"ax",@progbits
	.align	2
	.globl	_Z12Mapper19_ESIv
	.hidden	_Z12Mapper19_ESIv
	.type	_Z12Mapper19_ESIv, @function
_Z12Mapper19_ESIv:
	addi	sp,sp,-12
	li	a2,32
	li	a1,0
	lla	a5,_ZL5M19SCv
	lla	a0,.LANCHOR10
	sw	ra,8(sp)
	la a4, GameExpSound+16; sw a5, 0(a4);
	call	memset
	lw	ra,8(sp)
	li	a2,32
	li	a1,0
	lla	a0,.LANCHOR11
	addi	sp,sp,12
	tail	memset
	.size	_Z12Mapper19_ESIv, .-_Z12Mapper19_ESIv
	.section	.text._Z12NSFN106_Initv,"ax",@progbits
	.align	2
	.globl	_Z12NSFN106_Initv
	.hidden	_Z12NSFN106_Initv
	.type	_Z12NSFN106_Initv, @function
_Z12NSFN106_Initv:
	li	a0,65536
	addi	sp,sp,-12
	addi	a1,a0,-1
	lla	a2,_ZL14Mapper19_writejh
	addi	a0,a0,-2048
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,20480
	addi	a1,s0,-1
	addi	a0,s0,-2048
	lla	a2,_ZL14Mapper19_writejh
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	addi	a0,s0,-2048
	lla	a2,_ZL14Namco_Read4800j
	call	_Z14SetReadHandleriiPFhjE
	li	a2,32
	li	a1,0
	lla	a5,_ZL5M19SCv
	lla	a0,.LANCHOR10
	la a4, GameExpSound+16; sw a5, 0(a4);
	call	memset
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a2,32
	li	a1,0
	lla	a0,.LANCHOR11
	addi	sp,sp,12
	tail	memset
	.size	_Z12NSFN106_Initv, .-_Z12NSFN106_Initv
	.section	.rodata._Z13Mapper19_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.align	2
.LC1:
	.string	"IRAM"
	.section	.text._Z13Mapper19_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper19_InitP8CartInfo
	.hidden	_Z13Mapper19_InitP8CartInfo
	.type	_Z13Mapper19_InitP8CartInfo, @function
_Z13Mapper19_InitP8CartInfo:
	lw	a5,48(a0)
	addi	sp,sp,-12
	lla	a4,_ZL10N106_Powerv
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	sw	a4,0(a0)
	la a4, .LANCHOR13; sw a5, 0(a4);
	lla	a5,_ZL12NamcoIRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL21Mapper19_StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL5M19SCv
	la a4, GameExpSound+16; sw a5, 0(a4);
	la a4, .LANCHOR8; sw zero, 0(a4);
	la a5, FSettings+60; lw a5, 0(a5);
	mv	s0,a0
	bne	a5,zero,.L119
.L110:
	li	a2,1
	li	a1,8192
	lla	a0,_ZL4WRAM
	call	_Z15FCEU_MemoryRandPhjb
	lla	s1,.LANCHOR1
	li	a2,1
	li	a1,128
	mv	a0,s1
	call	_Z15FCEU_MemoryRandPhjb
	lla	a3,.LC0
	li	a2,0
	li	a1,8192
	lla	a0,_ZL4WRAM
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC1
	li	a2,0
	li	a1,128
	mv	a0,s1
	call	_Z10AddExStatePvjiPKc
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR14
	call	_Z10AddExStatePvjiPKc
	lw	a5,48(s0)
	beq	a5,zero,.L109
	lla	a5,_ZL4WRAM
	sw	a5,12(s0)
	li	a5,8192
	sw	a5,28(s0)
	li	a5,128
	sw	s1,16(s0)
	sw	a5,32(s0)
.L109:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L119:
	li	a2,32
	li	a1,0
	lla	a0,.LANCHOR10
	call	memset
	li	a2,32
	li	a1,0
	lla	a0,.LANCHOR11
	call	memset
	j	.L110
	.size	_Z13Mapper19_InitP8CartInfo, .-_Z13Mapper19_InitP8CartInfo
	.section	.text._Z14Mapper210_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper210_InitP8CartInfo
	.hidden	_Z14Mapper210_InitP8CartInfo
	.type	_Z14Mapper210_InitP8CartInfo, @function
_Z14Mapper210_InitP8CartInfo:
	addi	sp,sp,-12
	lla	a4,_ZL22Mapper210_StateRestorei
	sw	ra,8(sp)
	la a3, GameStateRestore; sw a4, 0(a3);
	mv	a5,a0
	lla	a4,_ZL10N106_Powerv
	sw	a4,0(a5)
	li	a2,1
	li	a5,1
	li	a1,8192
	lla	a0,_ZL4WRAM
	la a4, .LANCHOR8; sw a5, 0(a4);
	call	_Z15FCEU_MemoryRandPhjb
	lla	a3,.LC0
	li	a2,0
	li	a1,8192
	lla	a0,_ZL4WRAM
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR14
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper210_InitP8CartInfo, .-_Z14Mapper210_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"PRG"
	.align	2
.LC3:
	.string	"CHR"
	.align	2
.LC4:
	.string	"NTA"
	.align	2
.LC5:
	.string	"GORF"
	.align	2
.LC6:
	.string	"DOPO"
	.align	2
.LC7:
	.string	"GORK"
	.section	.bss._ZL4IRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL4IRAM, @object
	.size	_ZL4IRAM, 128
_ZL4IRAM:
	.zero	128
	.section	.bss._ZL4WRAM,"aw",@nobits
	.align	2
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 8192
_ZL4WRAM:
	.zero	8192
	.section	.bss._ZL6vcount,"aw",@nobits
	.align	2
	.set	.LANCHOR10,. + 0
	.type	_ZL6vcount, @object
	.size	_ZL6vcount, 32
_ZL6vcount:
	.zero	32
	.section	.bss._ZL9FreqCache,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL9FreqCache, @object
	.size	_ZL9FreqCache, 32
_ZL9FreqCache:
	.zero	32
	.section	.bss._ZL9PlayIndex,"aw",@nobits
	.align	2
	.set	.LANCHOR11,. + 0
	.type	_ZL9PlayIndex, @object
	.size	_ZL9PlayIndex, 32
_ZL9PlayIndex:
	.zero	32
	.section	.data._ZL14N106_StateRegs,"aw"
	.align	2
	.set	.LANCHOR14,. + 0
	.type	_ZL14N106_StateRegs, @object
	.size	_ZL14N106_StateRegs, 84
_ZL14N106_StateRegs:
	.word	_ZL3PRG
	.word	3
	.word	.LC2
	.word	_ZL3CHR
	.word	8
	.word	.LC3
	.word	_ZL7NTAPage
	.word	4
	.word	.LC4
	.word	_ZL6gorfus
	.word	1
	.word	.LC5
	.word	_ZL5dopol
	.word	1
	.word	.LC6
	.word	_ZL5gorko
	.word	1
	.word	.LC7
	.word	0
	.zero	8
	.section	.sbss._ZL3CHR,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	_ZL3CHR, @object
	.size	_ZL3CHR, 8
_ZL3CHR:
	.zero	8
	.section	.sbss._ZL3PRG,"aw",@nobits
	.align	2
	.set	.LANCHOR12,. + 0
	.type	_ZL3PRG, @object
	.size	_ZL3PRG, 3
_ZL3PRG:
	.zero	3
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR5,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL5dopol,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL5dopol, @object
	.size	_ZL5dopol, 1
_ZL5dopol:
	.zero	1
	.section	.sbss._ZL5gorko,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL5gorko, @object
	.size	_ZL5gorko, 1
_ZL5gorko:
	.zero	1
	.section	.sbss._ZL5is210,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	_ZL5is210, @object
	.size	_ZL5is210, 4
_ZL5is210:
	.zero	4
	.section	.sbss._ZL6gorfus,"aw",@nobits
	.set	.LANCHOR7,. + 0
	.type	_ZL6gorfus, @object
	.size	_ZL6gorfus, 1
_ZL6gorfus:
	.zero	1
	.section	.sbss._ZL7NTAPage,"aw",@nobits
	.align	2
	.set	.LANCHOR9,. + 0
	.type	_ZL7NTAPage, @object
	.size	_ZL7NTAPage, 4
_ZL7NTAPage:
	.zero	4
	.section	.sbss._ZL7battery,"aw",@nobits
	.align	2
	.set	.LANCHOR13,. + 0
	.type	_ZL7battery, @object
	.size	_ZL7battery, 4
_ZL7battery:
	.zero	4
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	1
	.set	.LANCHOR2,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 2
_ZL8IRQCount:
	.zero	2
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
