#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"yoko.cpp"
	.option nopic
	.text
	.section	.text._ZL14UNLYOKOReadDipj,"ax",@progbits
	.align	2
	.type	_ZL14UNLYOKOReadDipj, @function
_ZL14UNLYOKOReadDipj:
	la a5, X+24; lbu a5, 0(a5);
	andi	a5,a5,-4
	la a0, .LANCHOR0; lbu a0, 0(a0);
	or	a0,a5,a0
	ret
	.size	_ZL14UNLYOKOReadDipj, .-_ZL14UNLYOKOReadDipj
	.section	.text._ZL14UNLYOKOReadLowj,"ax",@progbits
	.align	2
	.type	_ZL14UNLYOKOReadLowj, @function
_ZL14UNLYOKOReadLowj:
	andi	a0,a0,3
	lla	a5,.LANCHOR1
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
	.size	_ZL14UNLYOKOReadLowj, .-_ZL14UNLYOKOReadLowj
	.section	.text._ZL15UNLYOKOWriteLowjh,"ax",@progbits
	.align	2
	.type	_ZL15UNLYOKOWriteLowjh, @function
_ZL15UNLYOKOWriteLowjh:
	andi	a0,a0,3
	lla	a5,.LANCHOR1
	add	a5,a5,a0
	sb	a1,0(a5)
	ret
	.size	_ZL15UNLYOKOWriteLowjh, .-_ZL15UNLYOKOWriteLowjh
	.section	.text._ZL11UNLYOKOSyncv,"ax",@progbits
	.align	2
	.type	_ZL11UNLYOKOSyncv, @function
_ZL11UNLYOKOSyncv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	s1,.LANCHOR2
	lbu	a0,0(s1)
	lla	s0,.LANCHOR3
	not	a0,a0
	andi	a0,a0,1
	call	_Z9setmirrori
	lbu	a1,3(s0)
	li	a0,0
	call	_Z7setchr2jj
	lbu	a1,4(s0)
	li	a0,4096
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lbu	a1,5(s0)
	li	a0,4096
	call	_Z7setchr2jj
	lbu	a1,6(s0)
	li	a0,8192
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lbu	a5,0(s1)
	andi	a4,a5,16
	bne	a4,zero,.L9
	andi	a5,a5,8
	la a1, .LANCHOR4; lbu a1, 0(a1);
	beq	a5,zero,.L7
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	srli	a1,a1,1
	li	a0,32768
	addi	sp,sp,12
	tail	_Z8setprg32jj
.L7:
	li	a0,32768
	call	_Z8setprg16jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a1,-1
	li	a0,49152
	addi	sp,sp,12
	tail	_Z8setprg16jj
.L9:
	lbu	a1,0(s0)
	la s1, .LANCHOR4; lbu s1, 0(s1);
	slli	s1,s1,1
	andi	s1,s1,16
	andi	a1,a1,15
	or	a1,a1,s1
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	andi	a1,a1,15
	or	a1,a1,s1
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	andi	a1,a1,15
	or	a1,a1,s1
	call	_Z7setprg8jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	ori	a1,s1,15
	lw	s1,0(sp)
	li	a0,57344
	addi	sp,sp,12
	tail	_Z7setprg8jj
	.size	_ZL11UNLYOKOSyncv, .-_ZL11UNLYOKOSyncv
	.section	.text._ZL19UNLYOKOStateRestorei,"ax",@progbits
	.align	2
	.type	_ZL19UNLYOKOStateRestorei, @function
_ZL19UNLYOKOStateRestorei:
	tail	_ZL11UNLYOKOSyncv
	.size	_ZL19UNLYOKOStateRestorei, .-_ZL19UNLYOKOStateRestorei
	.section	.text._ZL12UNLYOKOResetv,"ax",@progbits
	.align	2
	.type	_ZL12UNLYOKOResetv, @function
_ZL12UNLYOKOResetv:
	lla	a4,.LANCHOR0
	lbu	a5,0(a4)
	la a3, .LANCHOR4; sb zero, 0(a3);
	la a3, .LANCHOR2; sb zero, 0(a3);
	addi	a5,a5,1
	andi	a5,a5,3
	sb	a5,0(a4)
	tail	_ZL11UNLYOKOSyncv
	.size	_ZL12UNLYOKOResetv, .-_ZL12UNLYOKOResetv
	.section	.text._ZL12UNLYOKOPowerv,"ax",@progbits
	.align	2
	.type	_ZL12UNLYOKOPowerv, @function
_ZL12UNLYOKOPowerv:
	la a5, .LANCHOR4; sb zero, 0(a5);
	la a5, .LANCHOR2; sb zero, 0(a5);
	addi	sp,sp,-12
	li	a5,3
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	la a4, .LANCHOR0; sb a5, 0(a4);
	li	s0,20480
	call	_ZL11UNLYOKOSyncv
	addi	a1,s0,1023
	lla	a2,_ZL14UNLYOKOReadDipj
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	li	s1,24576
	addi	a1,s1,-1
	addi	a0,s0,1024
	lla	a2,_ZL14UNLYOKOReadLowj
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s1,-1
	addi	a0,s0,1024
	lla	a2,_ZL15UNLYOKOWriteLowjh
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a2,_ZL12UNLYOKOWritejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL12UNLYOKOPowerv, .-_ZL12UNLYOKOPowerv
	.section	.text._ZL12UNLYOKOWritejh,"ax",@progbits
	.align	2
	.type	_ZL12UNLYOKOWritejh, @function
_ZL12UNLYOKOWritejh:
	li	a5,36864
	addi	a4,a5,-1001
	and	a0,a0,a4
	addi	a4,a5,-1025
	bleu	a0,a4,.L30
	li	a5,-36864
	addi	a5,a5,1024
	add	a0,a0,a5
	li	a5,23
	bgtu	a0,a5,.L14
	lla	a4,.L22
	slli	a0,a0,2
	add	a0,a0,a4
	lw	a5,0(a0)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL12UNLYOKOWritejh,"a",@progbits
	.align	2
	.align	2
.L22:
	.word	.L28-.L22
	.word	.L27-.L22
	.word	.L26-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L25-.L22
	.word	.L24-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L23-.L22
	.word	.L21-.L22
	.section	.text._ZL12UNLYOKOWritejh
.L30:
	addi	a4,a5,-2048
	beq	a0,a4,.L16
	bleu	a0,a4,.L31
	addi	a5,a5,-2047
	bne	a0,a5,.L32
	lla	a3,.LANCHOR5
	lbu	a5,0(a3)
	la a4, .LANCHOR2; lbu a4, 0(a4);
	slli	a1,a1,8
	andi	a4,a4,-128
	or	a5,a5,a1
	la a2, .LANCHOR6; sb a4, 0(a2);
	sw	a5,0(a3)
	ret
.L31:
	li	a5,32768
	beq	a0,a5,.L18
	addi	a5,a5,1024
	bne	a0,a5,.L33
	la a5, .LANCHOR2; sb a1, 0(a5);
	tail	_ZL11UNLYOKOSyncv
.L32:
	ret
.L14:
	ret
.L28:
	la a5, .LANCHOR3; sb a1, 0(a5);
	tail	_ZL11UNLYOKOSyncv
.L27:
	la a5, .LANCHOR3+1; sb a1, 0(a5);
	tail	_ZL11UNLYOKOSyncv
.L26:
	la a5, .LANCHOR3+2; sb a1, 0(a5);
	tail	_ZL11UNLYOKOSyncv
.L25:
	la a5, .LANCHOR3+3; sb a1, 0(a5);
	tail	_ZL11UNLYOKOSyncv
.L24:
	la a5, .LANCHOR3+4; sb a1, 0(a5);
	tail	_ZL11UNLYOKOSyncv
.L23:
	la a5, .LANCHOR3+5; sb a1, 0(a5);
	tail	_ZL11UNLYOKOSyncv
.L21:
	la a5, .LANCHOR3+6; sb a1, 0(a5);
	tail	_ZL11UNLYOKOSyncv
.L18:
	la a5, .LANCHOR4; sb a1, 0(a5);
	tail	_ZL11UNLYOKOSyncv
.L16:
	lla	a3,.LANCHOR5
	lw	a5,0(a3)
	li	a4,65536
	addi	a4,a4,-256
	and	a5,a5,a4
	or	a5,a5,a1
	li	a0,1
	sw	a5,0(a3)
	tail	_Z12X6502_IRQEndi
.L33:
	ret
	.size	_ZL12UNLYOKOWritejh, .-_ZL12UNLYOKOWritejh
	.section	.text._ZL7M83Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M83Syncv, @function
_ZL7M83Syncv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,.LANCHOR2
	lbu	a5,0(a5)
	li	a4,2
	andi	a5,a5,3
	beq	a5,a4,.L35
	li	a4,3
	beq	a5,a4,.L36
	li	a4,1
	beq	a5,a4,.L37
	li	a0,1
	call	_Z9setmirrori
.L38:
	lla	a4,.LANCHOR3
	la a5, .LANCHOR7; lbu a5, 0(a5);
	lbu	a1,0(a4)
	beq	a5,zero,.L39
	la a5, .LANCHOR8; lbu a5, 0(a5);
	beq	a5,zero,.L48
.L39:
	lla	s1,.LANCHOR3
	li	s0,0
.L41:
	lla	a5,.LANCHOR4
	lbu	a5,0(a5)
	lbu	a1,0(s1)
	mv	a0,s0
	slli	a5,a5,4
	andi	a5,a5,768
	or	a1,a5,a1
	call	_Z7setchr1jj
	addi	s0,s0,1024
	li	a5,8192
	addi	s1,s1,1
	bne	s0,a5,.L41
.L40:
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	lla	a5,.LANCHOR2
	lbu	a5,0(a5)
	andi	a5,a5,64
	beq	a5,zero,.L42
	lla	s0,.LANCHOR4
	lbu	a1,0(s0)
	li	a0,32768
	andi	a1,a1,63
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	andi	a1,a1,48
	li	a0,49152
	ori	a1,a1,15
	addi	sp,sp,12
	tail	_Z8setprg16jj
.L42:
	lla	a5,.LANCHOR3
	lbu	a1,8(a5)
	li	a0,32768
	mv	s0,a5
	call	_Z7setprg8jj
	lbu	a1,9(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,10(s0)
	li	a0,49152
	call	_Z7setprg8jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a1,-1
	li	a0,57344
	addi	sp,sp,12
	tail	_Z7setprg8jj
.L35:
	li	a0,2
	call	_Z9setmirrori
	j	.L38
.L37:
	li	a0,0
	call	_Z9setmirrori
	j	.L38
.L36:
	li	a0,3
	call	_Z9setmirrori
	j	.L38
.L48:
	li	a0,0
	call	_Z7setchr2jj
	lla	s0,.LANCHOR3
	lbu	a1,1(s0)
	li	a0,4096
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lbu	a1,6(s0)
	li	a0,4096
	call	_Z7setchr2jj
	lbu	a1,7(s0)
	li	a0,8192
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	j	.L40
	.size	_ZL7M83Syncv, .-_ZL7M83Syncv
	.section	.text._ZL15M83StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL15M83StateRestorei, @function
_ZL15M83StateRestorei:
	tail	_ZL7M83Syncv
	.size	_ZL15M83StateRestorei, .-_ZL15M83StateRestorei
	.section	.text._ZL8M83Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M83Resetv, @function
_ZL8M83Resetv:
	lla	a4,.LANCHOR0
	lbu	a5,0(a4)
	xori	a5,a5,1
	sb	a5,0(a4)
	tail	_ZL7M83Syncv
	.size	_ZL8M83Resetv, .-_ZL8M83Resetv
	.section	.text._ZL8M83Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M83Writejh, @function
_ZL8M83Writejh:
	li	a5,32768
	addi	a4,a5,791
	bgtu	a0,a4,.L52
	addi	a4,a5,767
	bleu	a0,a4,.L73
	li	a5,-32768
	addi	a5,a5,-768
	add	a5,a0,a5
	li	a4,23
	bgtu	a5,a4,.L51
	lla	a4,.L60
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL8M83Writejh,"a",@progbits
	.align	2
	.align	2
.L60:
	.word	.L70-.L60
	.word	.L69-.L60
	.word	.L68-.L60
	.word	.L51-.L60
	.word	.L51-.L60
	.word	.L51-.L60
	.word	.L51-.L60
	.word	.L51-.L60
	.word	.L51-.L60
	.word	.L51-.L60
	.word	.L51-.L60
	.word	.L51-.L60
	.word	.L51-.L60
	.word	.L51-.L60
	.word	.L51-.L60
	.word	.L51-.L60
	.word	.L67-.L60
	.word	.L66-.L60
	.word	.L65-.L60
	.word	.L64-.L60
	.word	.L63-.L60
	.word	.L62-.L60
	.word	.L61-.L60
	.word	.L59-.L60
	.section	.text._ZL8M83Writejh
.L52:
	li	a4,45056
	andi	a5,a0,-257
	addi	a3,a4,255
	beq	a5,a3,.L72
	bne	a0,a4,.L74
.L72:
	lla	a4,.LANCHOR2
	lbu	a5,0(a4)
	la a3, .LANCHOR4; sb a1, 0(a3);
	ori	a5,a5,64
	sb	a5,0(a4)
	tail	_ZL7M83Syncv
.L73:
	addi	a4,a5,512
	beq	a0,a4,.L54
	bleu	a0,a4,.L75
	addi	a5,a5,513
	bne	a0,a5,.L76
	lla	a3,.LANCHOR5
	lbu	a5,0(a3)
	la a4, .LANCHOR2; lbu a4, 0(a4);
	slli	a1,a1,8
	andi	a4,a4,-128
	or	a5,a5,a1
	la a2, .LANCHOR6; sb a4, 0(a2);
	sw	a5,0(a3)
	ret
.L75:
	beq	a0,a5,.L56
	addi	a5,a5,256
	bne	a0,a5,.L77
	lla	a4,.LANCHOR2
	lbu	a5,0(a4)
	andi	a5,a5,64
	or	a5,a1,a5
	sb	a5,0(a4)
	tail	_ZL7M83Syncv
.L74:
	ret
.L76:
	ret
.L51:
	ret
.L68:
	lla	a4,.LANCHOR2
	lbu	a5,0(a4)
	la a3, .LANCHOR3+10; sb a1, 0(a3);
	andi	a5,a5,-65
	sb	a5,0(a4)
	tail	_ZL7M83Syncv
.L67:
	la a5, .LANCHOR3; sb a1, 0(a5);
	tail	_ZL7M83Syncv
.L66:
	la a5, .LANCHOR3+1; sb a1, 0(a5);
	tail	_ZL7M83Syncv
.L65:
	la a5, .LANCHOR3+2; sb a1, 0(a5);
	li	a5,1
	la a4, .LANCHOR8; sb a5, 0(a4);
	tail	_ZL7M83Syncv
.L70:
	lla	a4,.LANCHOR2
	lbu	a5,0(a4)
	la a3, .LANCHOR3+8; sb a1, 0(a3);
	andi	a5,a5,-65
	sb	a5,0(a4)
	tail	_ZL7M83Syncv
.L69:
	lla	a4,.LANCHOR2
	lbu	a5,0(a4)
	la a3, .LANCHOR3+9; sb a1, 0(a3);
	andi	a5,a5,-65
	sb	a5,0(a4)
	tail	_ZL7M83Syncv
.L59:
	la a5, .LANCHOR3+7; sb a1, 0(a5);
	tail	_ZL7M83Syncv
.L64:
	la a5, .LANCHOR3+3; sb a1, 0(a5);
	li	a5,1
	la a4, .LANCHOR8; sb a5, 0(a4);
	tail	_ZL7M83Syncv
.L63:
	la a5, .LANCHOR3+4; sb a1, 0(a5);
	li	a5,1
	la a4, .LANCHOR8; sb a5, 0(a4);
	tail	_ZL7M83Syncv
.L62:
	la a5, .LANCHOR3+5; sb a1, 0(a5);
	li	a5,1
	la a4, .LANCHOR8; sb a5, 0(a4);
	tail	_ZL7M83Syncv
.L61:
	la a5, .LANCHOR3+6; sb a1, 0(a5);
	tail	_ZL7M83Syncv
.L54:
	lla	a3,.LANCHOR5
	lw	a5,0(a3)
	li	a4,65536
	addi	a4,a4,-256
	and	a5,a5,a4
	or	a5,a5,a1
	li	a0,1
	sw	a5,0(a3)
	tail	_Z12X6502_IRQEndi
.L56:
	li	a5,1
	la a4, .LANCHOR7; sb a5, 0(a4);
	j	.L72
.L77:
	ret
	.size	_ZL8M83Writejh, .-_ZL8M83Writejh
	.section	.text._ZL8M83Closev,"ax",@progbits
	.align	2
	.type	_ZL8M83Closev, @function
_ZL8M83Closev:
	la a0, .LANCHOR9; lw a0, 0(a0);
	beq	a0,zero,.L84
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR9; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L84:
	la a5, .LANCHOR9; sw zero, 0(a5);
	ret
	.size	_ZL8M83Closev, .-_ZL8M83Closev
	.section	.text._ZL8M83Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M83Powerv, @function
_ZL8M83Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR7; sb zero, 0(a5);
	la a5, .LANCHOR8; sb zero, 0(a5);
	la a5, .LANCHOR4; sb zero, 0(a5);
	la a5, .LANCHOR2; sb zero, 0(a5);
	la a5, .LANCHOR0; sb zero, 0(a5);
	call	_ZL7M83Syncv
	lla	a2,_ZL14UNLYOKOReadDipj
	li	a1,20480
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	li	s0,20480
	addi	a1,s0,259
	addi	a0,s0,256
	lla	a2,_ZL14UNLYOKOReadLowj
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,259
	addi	a0,s0,256
	lla	a2,_ZL15UNLYOKOWriteLowjh
	call	_Z15SetWriteHandleriiPFvjhE
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
	lla	a2,_ZL8M83Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR10; lw a0, 0(a0);
	la a2, .LANCHOR9; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL8M83Powerv, .-_ZL8M83Powerv
	.section	.text._ZL14UNLYOKOIRQHooki,"ax",@progbits
	.align	2
	.type	_ZL14UNLYOKOIRQHooki, @function
_ZL14UNLYOKOIRQHooki:
	la a5, .LANCHOR6; lbu a5, 0(a5);
	beq	a5,zero,.L94
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR5
	lw	a5,0(s0)
	sw	ra,8(sp)
	sub	a5,a5,a0
	sw	a5,0(s0)
	blt	a5,zero,.L97
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L94:
	ret
.L97:
	li	a0,1
	call	_Z14X6502_IRQBegini
	la a5, .LANCHOR6; sb zero, 0(a5);
	li	a5,65536
	addi	a5,a5,-1
	lw	ra,8(sp)
	sw	a5,0(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL14UNLYOKOIRQHooki, .-_ZL14UNLYOKOIRQHooki
	.section	.text._Z12UNLYOKO_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12UNLYOKO_InitP8CartInfo
	.hidden	_Z12UNLYOKO_InitP8CartInfo
	.type	_Z12UNLYOKO_InitP8CartInfo, @function
_Z12UNLYOKO_InitP8CartInfo:
	lla	a5,_ZL12UNLYOKOPowerv
	sw	a5,0(a0)
	lla	a5,_ZL12UNLYOKOResetv
	sw	a5,4(a0)
	lla	a5,_ZL14UNLYOKOIRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL19UNLYOKOStateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR11
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z12UNLYOKO_InitP8CartInfo, .-_Z12UNLYOKO_InitP8CartInfo
	.section	.rodata._Z13Mapper83_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z13Mapper83_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper83_InitP8CartInfo
	.hidden	_Z13Mapper83_InitP8CartInfo
	.type	_Z13Mapper83_InitP8CartInfo, @function
_Z13Mapper83_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL8M83Powerv
	sw	a5,0(a0)
	lla	a5,_ZL8M83Resetv
	sw	a5,4(a0)
	lla	a5,_ZL8M83Closev
	sw	a5,8(a0)
	lla	a5,_ZL14UNLYOKOIRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL15M83StateRestorei
	lla	s0,.LANCHOR10
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR9
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s0)
	lw	a0,0(s1)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR11
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper83_InitP8CartInfo, .-_Z13Mapper83_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"MODE"
	.align	2
.LC2:
	.string	"BANK"
	.align	2
.LC3:
	.string	"IRQC"
	.align	2
.LC4:
	.string	"IRQA"
	.align	2
.LC5:
	.string	"REGS"
	.align	2
.LC6:
	.string	"LOWR"
	.align	2
.LC7:
	.string	"IS2K"
	.align	2
.LC8:
	.string	"NT2K"
	.section	.bss._ZL3reg,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 11
_ZL3reg:
	.zero	11
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR11,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 108
_ZL9StateRegs:
	.word	_ZL4mode
	.word	1
	.word	.LC1
	.word	_ZL4bank
	.word	1
	.word	.LC2
	.word	_ZL8IRQCount
	.word	4
	.word	.LC3
	.word	_ZL4IRQa
	.word	1
	.word	.LC4
	.word	_ZL3reg
	.word	11
	.word	.LC5
	.word	_ZL3low
	.word	4
	.word	.LC6
	.word	_ZL8is2kbank
	.word	1
	.word	.LC7
	.word	_ZL11isnot2kbank
	.word	1
	.word	.LC8
	.word	0
	.zero	8
	.section	.sbss._ZL11isnot2kbank,"aw",@nobits
	.set	.LANCHOR8,. + 0
	.type	_ZL11isnot2kbank, @object
	.size	_ZL11isnot2kbank, 1
_ZL11isnot2kbank:
	.zero	1
	.section	.sbss._ZL3dip,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL3dip, @object
	.size	_ZL3dip, 1
_ZL3dip:
	.zero	1
	.section	.sbss._ZL3low,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL3low, @object
	.size	_ZL3low, 4
_ZL3low:
	.zero	4
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR6,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR9,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL4bank,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL4bank, @object
	.size	_ZL4bank, 1
_ZL4bank:
	.zero	1
	.section	.sbss._ZL4mode,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL4mode, @object
	.size	_ZL4mode, 1
_ZL4mode:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR10,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.section	.sbss._ZL8is2kbank,"aw",@nobits
	.set	.LANCHOR7,. + 0
	.type	_ZL8is2kbank, @object
	.size	_ZL8is2kbank, 1
_ZL8is2kbank:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
