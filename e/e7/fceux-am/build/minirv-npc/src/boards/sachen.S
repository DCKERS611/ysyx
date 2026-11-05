#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"sachen.cpp"
	.option nopic
	.text
	.section	.text._ZL9SARestorei,"ax",@progbits
	.align	2
	.type	_ZL9SARestorei, @function
_ZL9SARestorei:
	la a5, .LANCHOR0; lw a5, 0(a5);
	jr	a5
	.size	_ZL9SARestorei, .-_ZL9SARestorei
	.section	.text._ZL8SADWritejh,"ax",@progbits
	.align	2
	.type	_ZL8SADWritejh, @function
_ZL8SADWritejh:
	la a5, .LANCHOR1; sb a1, 0(a5);
	la a5, .LANCHOR0; lw a5, 0(a5);
	jr	a5
	.size	_ZL8SADWritejh, .-_ZL8SADWritejh
	.section	.text._ZL9TCU02Readj,"ax",@progbits
	.align	2
	.type	_ZL9TCU02Readj, @function
_ZL9TCU02Readj:
	la a0, .LANCHOR1; lbu a0, 0(a0);
	la a5, X+24; lbu a5, 0(a5);
	andi	a5,a5,-64
	andi	a0,a0,63
	or	a0,a0,a5
	ret
	.size	_ZL9TCU02Readj, .-_ZL9TCU02Readj
	.section	.text._ZL12SA0161MSyncov,"ax",@progbits
	.align	2
	.type	_ZL12SA0161MSyncov, @function
_ZL12SA0161MSyncov:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR1
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	srli	a1,a1,3
	andi	a1,a1,1
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a0,a0,7
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL12SA0161MSyncov, .-_ZL12SA0161MSyncov
	.section	.text._ZL12SA72007Syncov,"ax",@progbits
	.align	2
	.type	_ZL12SA72007Syncov, @function
_ZL12SA72007Syncov:
	addi	sp,sp,-12
	li	a0,32768
	li	a1,0
	sw	ra,8(sp)
	call	_Z8setprg32jj
	lw	ra,8(sp)
	la a0, .LANCHOR1; lbu a0, 0(a0);
	srli	a0,a0,7
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL12SA72007Syncov, .-_ZL12SA72007Syncov
	.section	.text._ZL12SA72008Syncov,"ax",@progbits
	.align	2
	.type	_ZL12SA72008Syncov, @function
_ZL12SA72008Syncov:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR1
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	srli	a1,a1,2
	andi	a1,a1,1
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a0,a0,3
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL12SA72008Syncov, .-_ZL12SA72008Syncov
	.section	.text._ZL10SA009Syncov,"ax",@progbits
	.align	2
	.type	_ZL10SA009Syncov, @function
_ZL10SA009Syncov:
	addi	sp,sp,-12
	li	a0,32768
	li	a1,0
	sw	ra,8(sp)
	call	_Z8setprg32jj
	lw	ra,8(sp)
	la a0, .LANCHOR1; lbu a0, 0(a0);
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL10SA009Syncov, .-_ZL10SA009Syncov
	.section	.text._ZL10TCU01Writejh,"ax",@progbits
	.align	2
	.type	_ZL10TCU01Writejh, @function
_ZL10TCU01Writejh:
	andi	a0,a0,259
	li	a4,258
	beq	a0,a4,.L18
	ret
.L18:
	mv	a5,a1
	srli	a4,a5,2
	srli	a1,a1,6
	addi	sp,sp,-12
	andi	a4,a4,1
	andi	a1,a1,2
	sw	s0,4(sp)
	li	a0,32768
	lla	s0,.LANCHOR1
	or	a1,a1,a4
	sw	ra,8(sp)
	sb	a5,0(s0)
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,3
	andi	a0,a0,15
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL10TCU01Writejh, .-_ZL10TCU01Writejh
	.section	.text._ZL10TCU02Writejh,"ax",@progbits
	.align	2
	.type	_ZL10TCU02Writejh, @function
_ZL10TCU02Writejh:
	andi	a0,a0,259
	li	a5,258
	beq	a0,a5,.L24
	ret
.L24:
	addi	sp,sp,-12
	sw	s0,4(sp)
	addi	a5,a1,3
	lla	s0,.LANCHOR1
	li	a0,32768
	li	a1,0
	sw	ra,8(sp)
	sb	a5,0(s0)
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a0,a0,3
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL10TCU02Writejh, .-_ZL10TCU02Writejh
	.section	.text._ZL7SAPowerv,"ax",@progbits
	.align	2
	.type	_ZL7SAPowerv, @function
_ZL7SAPowerv:
	addi	sp,sp,-12
	la a5, .LANCHOR1; sb zero, 0(a5);
	sw	ra,8(sp)
	la a5, .LANCHOR0; lw a5, 0(a5);
	jalr	a5
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	ra,8(sp)
	li	a1,24576
	li	a0,16384
	lla	a2,_ZL7SAWritejh
	addi	a1,a1,-1
	addi	a0,a0,256
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL7SAPowerv, .-_ZL7SAPowerv
	.section	.text._ZL8SADPowerv,"ax",@progbits
	.align	2
	.type	_ZL8SADPowerv, @function
_ZL8SADPowerv:
	addi	sp,sp,-12
	la a5, .LANCHOR1; sb zero, 0(a5);
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR0; lw a5, 0(a5);
	jalr	a5
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL8SADWritejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL8SADPowerv, .-_ZL8SADPowerv
	.section	.text._ZL10TCA01Powerv,"ax",@progbits
	.align	2
	.type	_ZL10TCA01Powerv, @function
_ZL10TCA01Powerv:
	addi	sp,sp,-12
	li	a1,0
	li	a0,32768
	sw	ra,8(sp)
	call	_Z8setprg16jj
	li	a1,1
	li	a0,49152
	call	_Z8setprg16jj
	li	a0,0
	call	_Z7setchr8j
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	ra,8(sp)
	li	a1,24576
	li	a0,16384
	lla	a2,_ZL9TCA01Readj
	addi	a1,a1,-1
	addi	a0,a0,256
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL10TCA01Powerv, .-_ZL10TCA01Powerv
	.section	.text._ZL13S74LS374NReadj,"ax",@progbits
	.align	2
	.type	_ZL13S74LS374NReadj, @function
_ZL13S74LS374NReadj:
	li	a5,16384
	addi	a5,a5,256
	and	a0,a0,a5
	beq	a0,a5,.L34
	la a0, X+24; lbu a0, 0(a0);
	ret
.L34:
	la a0, .LANCHOR2; lbu a0, 0(a0);
	not	a0,a0
	la a5, .LANCHOR3; lbu a5, 0(a5);
	andi	a0,a0,63
	xor	a0,a0,a5
	ret
	.size	_ZL13S74LS374NReadj, .-_ZL13S74LS374NReadj
	.section	.text._ZL7SAWritejh,"ax",@progbits
	.align	2
	.type	_ZL7SAWritejh, @function
_ZL7SAWritejh:
	andi	a0,a0,256
	beq	a0,zero,.L35
	la a5, .LANCHOR1; sb a1, 0(a5);
	la a5, .LANCHOR0; lw a5, 0(a5);
	jr	a5
.L35:
	ret
	.size	_ZL7SAWritejh, .-_ZL7SAWritejh
	.section	.text._ZL9TCA01Readj,"ax",@progbits
	.align	2
	.type	_ZL9TCA01Readj, @function
_ZL9TCA01Readj:
	li	a4,16384
	addi	a4,a4,256
	and	a3,a0,a4
	mv	a5,a0
	la a0, X+24; lbu a0, 0(a0);
	beq	a3,a4,.L39
	ret
.L39:
	not	a5,a5
	andi	a5,a5,63
	andi	a0,a0,-64
	or	a0,a5,a0
	ret
	.size	_ZL9TCA01Readj, .-_ZL9TCA01Readj
	.section	.text._ZL13S74LS374MSynch,"ax",@progbits
	.align	2
	.type	_ZL13S74LS374MSynch, @function
_ZL13S74LS374MSynch:
	andi	a0,a0,3
	li	a5,2
	beq	a0,a5,.L41
	li	a5,3
	beq	a0,a5,.L42
	li	a5,1
	beq	a0,a5,.L43
	li	a0,1
	tail	_Z9setmirrori
.L41:
	li	a3,1
	li	a2,1
	li	a1,1
	li	a0,0
	tail	_Z10setmirrorwiiii
.L43:
	li	a0,0
	tail	_Z9setmirrori
.L42:
	li	a0,2
	tail	_Z9setmirrori
	.size	_ZL13S74LS374MSynch, .-_ZL13S74LS374MSynch
	.section	.text._ZL10S8259Syncov,"ax",@progbits
	.align	2
	.type	_ZL10S8259Syncov, @function
_ZL10S8259Syncov:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR1
	lbu	a1,5(s0)
	li	a0,32768
	sw	ra,8(sp)
	andi	a1,a1,7
	sw	s1,0(sp)
	call	_Z8setprg32jj
	lbu	a0,7(s0)
	la a5, UNIFchrrama; lw a5, 0(a5);
	andi	a2,a0,1
	beq	a5,zero,.L64
.L58:
	bne	a2,zero,.L59
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	srli	a0,a0,1
	addi	sp,sp,12
	tail	_ZL13S74LS374MSynch
.L59:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L64:
	lbu	t0,4(s0)
	andi	t1,a0,1
	li	s1,0
	slli	t2,t0,3
	li	a3,2
	andi	a2,t1,0xff
	andi	a1,t2,56
	beq	t1,zero,.L46
.L65:
	lbu	a5,0(s0)
	andi	a5,a5,7
	or	a1,a5,a1
	lla	a5,.LANCHOR4
	lw	a5,0(a5)
	beq	a5,a3,.L48
.L66:
	bgt	a5,a3,.L49
	beq	a5,zero,.L50
	li	t0,1
	bne	a5,t0,.L52
.L62:
	slli	a0,s1,11
	call	_Z7setchr2jj
	lbu	a0,7(s0)
	li	a3,2
	andi	t1,a0,1
	mv	a2,t1
.L52:
	addi	s1,s1,1
	li	a5,4
	beq	s1,a5,.L58
	lbu	t0,4(s0)
	andi	a2,t1,0xff
	slli	t2,t0,3
	andi	a1,t2,56
	bne	t1,zero,.L65
.L46:
	add	a5,s0,s1
	lbu	a5,0(a5)
	andi	a5,a5,7
	or	a1,a5,a1
	lla	a5,.LANCHOR4
	lw	a5,0(a5)
	bne	a5,a3,.L66
.L48:
	slli	a1,a1,2
	or	a1,a1,s1
	j	.L62
.L49:
	li	a1,3
	bne	a5,a1,.L52
	add	a2,s0,s1
	lbu	a1,0(a2)
	andi	a1,a1,7
	beq	s1,a3,.L54
	beq	s1,a5,.L55
	li	a5,1
	beq	s1,a5,.L67
.L56:
	slli	a0,s1,10
	call	_Z7setchr1jj
	li	a0,4096
	li	a1,-1
	call	_Z7setchr4jj
	lbu	a0,7(s0)
	li	a3,2
	andi	t1,a0,1
	mv	a2,t1
	j	.L52
.L50:
	slli	a1,a1,1
	andi	a5,s1,1
	or	a1,a5,a1
	j	.L62
.L67:
	slli	a5,t0,4
	andi	a5,a5,16
	or	a1,a1,a5
	j	.L56
.L55:
	lbu	a2,6(s0)
	slli	a5,t0,2
	andi	a5,a5,16
	slli	a2,a2,3
	andi	a2,a2,8
	or	a5,a2,a5
	or	a1,a1,a5
	j	.L56
.L54:
	andi	a5,t2,16
	or	a1,a1,a5
	j	.L56
	.size	_ZL10S8259Syncov, .-_ZL10S8259Syncov
	.section	.text._ZL12S8259Restorei,"ax",@progbits
	.align	2
	.type	_ZL12S8259Restorei, @function
_ZL12S8259Restorei:
	tail	_ZL10S8259Syncov
	.size	_ZL12S8259Restorei, .-_ZL12S8259Restorei
	.section	.text._ZL10S8259Resetv,"ax",@progbits
	.align	2
	.type	_ZL10S8259Resetv, @function
_ZL10S8259Resetv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,.LANCHOR1
	li	a0,0
	sw	zero,0(a5)
	sw	zero,4(a5)
	la a4, .LANCHOR2; sb zero, 0(a4);
	call	_Z7setchr8j
	call	_ZL10S8259Syncov
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	ra,8(sp)
	li	a1,32768
	li	a0,16384
	lla	a2,_ZL10S8259Writejh
	addi	a1,a1,-1
	addi	a0,a0,256
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL10S8259Resetv, .-_ZL10S8259Resetv
	.section	.text._ZL14S74LS374NWritejh,"ax",@progbits
	.align	2
	.type	_ZL14S74LS374NWritejh, @function
_ZL14S74LS374NWritejh:
	li	a5,16384
	addi	a4,a5,257
	and	a0,a0,a4
	addi	a5,a5,256
	mv	a4,a1
	beq	a0,a5,.L85
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR2; lbu a5, 0(a5);
	li	a3,7
	bgtu	a5,a3,.L74
	lla	a3,.L76
	slli	a5,a5,2
	add	a5,a5,a3
	lw	a5,0(a5)
	add	a5,a5,a3
	jr	a5
	.section	.rodata._ZL14S74LS374NWritejh,"a",@progbits
	.align	2
	.align	2
.L76:
	.word	.L74-.L76
	.word	.L74-.L76
	.word	.L80-.L76
	.word	.L74-.L76
	.word	.L79-.L76
	.word	.L78-.L76
	.word	.L77-.L76
	.word	.L75-.L76
	.section	.text._ZL14S74LS374NWritejh
.L85:
	andi	a5,a1,7
	la a4, .LANCHOR2; sb a5, 0(a4);
	ret
.L75:
	lla	s0,.LANCHOR1
	lbu	a1,0(s0)
	srli	a5,a4,1
	sb	a5,2(s0)
.L81:
	li	a0,32768
	call	_Z8setprg32jj
	lbu	a5,1(s0)
	lbu	a4,3(s0)
	lbu	a0,4(s0)
	or	a5,a5,a4
	or	a0,a5,a0
	call	_Z7setchr8j
	lbu	a0,2(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL13S74LS374MSynch
.L80:
	slli	a5,a1,3
	lla	s0,.LANCHOR1
	andi	a1,a1,1
	andi	a5,a5,8
	sb	a1,0(s0)
	sb	a5,3(s0)
	j	.L81
.L79:
	slli	a4,a1,2
	lla	s0,.LANCHOR1
	andi	a4,a4,4
	lbu	a1,0(s0)
	sb	a4,4(s0)
	j	.L81
.L78:
	andi	a1,a1,7
	lla	s0,.LANCHOR1
	sb	a1,0(s0)
	j	.L81
.L77:
	lla	s0,.LANCHOR1
	andi	a5,a1,3
	sb	a5,1(s0)
	lbu	a1,0(s0)
	j	.L81
.L74:
	lla	s0,.LANCHOR1
	lbu	a1,0(s0)
	j	.L81
	.size	_ZL14S74LS374NWritejh, .-_ZL14S74LS374NWritejh
	.section	.text._ZL15S74LS374NAWritejh,"ax",@progbits
	.align	2
	.type	_ZL15S74LS374NAWritejh, @function
_ZL15S74LS374NAWritejh:
	li	a5,16384
	addi	a4,a5,257
	and	a0,a0,a4
	addi	a5,a5,256
	mv	a4,a1
	beq	a0,a5,.L101
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR2; lbu a5, 0(a5);
	li	a3,7
	bgtu	a5,a3,.L89
	lla	a3,.L91
	slli	a5,a5,2
	add	a5,a5,a3
	lw	a5,0(a5)
	add	a5,a5,a3
	jr	a5
	.section	.rodata._ZL15S74LS374NAWritejh,"a",@progbits
	.align	2
	.align	2
.L91:
	.word	.L96-.L91
	.word	.L89-.L91
	.word	.L95-.L91
	.word	.L89-.L91
	.word	.L94-.L91
	.word	.L93-.L91
	.word	.L92-.L91
	.word	.L90-.L91
	.section	.text._ZL15S74LS374NAWritejh
.L101:
	andi	a1,a1,7
	la a5, .LANCHOR2; sb a1, 0(a5);
	ret
.L90:
	lla	s0,.LANCHOR1
	lbu	a1,0(s0)
	andi	a4,a4,1
	sb	a4,2(s0)
.L97:
	li	a0,32768
	call	_Z8setprg32jj
	lbu	a0,1(s0)
	call	_Z7setchr8j
	lbu	a0,2(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL13S74LS374MSynch
.L89:
	lla	s0,.LANCHOR1
	lbu	a1,0(s0)
	j	.L97
.L96:
	lla	s0,.LANCHOR1
	li	a5,768
	sh	a5,0(s0)
	li	a1,0
	j	.L97
.L95:
	slli	a4,a1,3
	lla	s0,.LANCHOR1
	andi	a4,a4,8
	lbu	a1,0(s0)
	sb	a4,3(s0)
	j	.L97
.L94:
	lla	s0,.LANCHOR1
	lbu	a5,1(s0)
	andi	a4,a1,3
	lbu	a1,0(s0)
	andi	a5,a5,6
	or	a5,a5,a4
	sb	a5,1(s0)
	j	.L97
.L93:
	andi	a1,a1,1
	lla	s0,.LANCHOR1
	sb	a1,0(s0)
	j	.L97
.L92:
	lla	s0,.LANCHOR1
	lbu	a5,1(s0)
	lbu	a3,3(s0)
	slli	a1,a1,1
	andi	a5,a5,1
	andi	a1,a1,6
	or	a5,a5,a3
	or	a5,a5,a1
	sb	a5,1(s0)
	lbu	a1,0(s0)
	j	.L97
	.size	_ZL15S74LS374NAWritejh, .-_ZL15S74LS374NAWritejh
	.section	.text._ZL10S8259Writejh,"ax",@progbits
	.align	2
	.type	_ZL10S8259Writejh, @function
_ZL10S8259Writejh:
	li	a5,16384
	addi	a4,a5,257
	and	a0,a0,a4
	addi	a5,a5,256
	bne	a0,a5,.L103
	la a5, .LANCHOR2; sb a1, 0(a5);
	ret
.L103:
	la a4, .LANCHOR2; lbu a4, 0(a4);
	andi	a4,a4,7
	lla	a5,.LANCHOR1
	add	a5,a5,a4
	sb	a1,0(a5)
	tail	_ZL10S8259Syncov
	.size	_ZL10S8259Writejh, .-_ZL10S8259Writejh
	.section	.text._ZL12TCU02Restorei,"ax",@progbits
	.align	2
	.type	_ZL12TCU02Restorei, @function
_ZL12TCU02Restorei:
	addi	sp,sp,-12
	li	a0,32768
	li	a1,0
	sw	ra,8(sp)
	call	_Z8setprg32jj
	lw	ra,8(sp)
	la a0, .LANCHOR1; lbu a0, 0(a0);
	andi	a0,a0,3
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL12TCU02Restorei, .-_ZL12TCU02Restorei
	.section	.text._ZL15S74LS374NAPowerv,"ax",@progbits
	.align	2
	.type	_ZL15S74LS374NAPowerv, @function
_ZL15S74LS374NAPowerv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	li	a5,768
	lla	s0,.LANCHOR1
	li	a1,0
	li	a0,32768
	sw	ra,8(sp)
	sw	a5,0(s0)
	sb	zero,4(s0)
	call	_Z8setprg32jj
	lbu	a0,1(s0)
	call	_Z7setchr8j
	lbu	a0,2(s0)
	call	_ZL13S74LS374MSynch
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a1,32768
	li	a0,16384
	lla	a2,_ZL15S74LS374NAWritejh
	addi	a1,a1,-1
	addi	a0,a0,256
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL15S74LS374NAPowerv, .-_ZL15S74LS374NAPowerv
	.section	.text._ZL10TCU02Powerv,"ax",@progbits
	.align	2
	.type	_ZL10TCU02Powerv, @function
_ZL10TCU02Powerv:
	addi	sp,sp,-12
	li	a5,65536
	sw	s0,4(sp)
	addi	a1,a5,-1
	lla	s0,.LANCHOR1
	lla	a2,_Z6CartBRj
	li	a0,32768
	sw	ra,8(sp)
	sw	s1,0(sp)
	sb	zero,0(s0)
	li	s1,16384
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s1,256
	mv	a0,a1
	lla	a2,_ZL9TCU02Readj
	call	_Z14SetReadHandleriiPFhjE
	li	a5,65536
	addi	a1,a5,-1
	addi	a0,s1,256
	lla	a2,_ZL10TCU02Writejh
	call	_Z15SetWriteHandleriiPFvjhE
	li	a0,32768
	li	a1,0
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	andi	a0,a0,3
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL10TCU02Powerv, .-_ZL10TCU02Powerv
	.section	.text._ZL12TCU01Restorei,"ax",@progbits
	.align	2
	.type	_ZL12TCU01Restorei, @function
_ZL12TCU01Restorei:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR1
	lbu	a5,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	srli	a1,a5,6
	srli	a5,a5,2
	andi	a5,a5,1
	andi	a1,a1,2
	or	a1,a1,a5
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,3
	andi	a0,a0,15
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL12TCU01Restorei, .-_ZL12TCU01Restorei
	.section	.text._ZL10TCU01Powerv,"ax",@progbits
	.align	2
	.type	_ZL10TCU01Powerv, @function
_ZL10TCU01Powerv:
	addi	sp,sp,-12
	sw	s1,0(sp)
	li	s1,65536
	sw	s0,4(sp)
	addi	a1,s1,-1
	lla	s0,.LANCHOR1
	lla	a2,_Z6CartBRj
	li	a0,32768
	sw	ra,8(sp)
	sb	zero,0(s0)
	call	_Z14SetReadHandleriiPFhjE
	li	a0,16384
	addi	a1,s1,-1
	lla	a2,_ZL10TCU01Writejh
	addi	a0,a0,256
	call	_Z15SetWriteHandleriiPFvjhE
	lbu	a5,0(s0)
	li	a0,32768
	srli	a1,a5,6
	srli	a5,a5,2
	andi	a5,a5,1
	andi	a1,a1,2
	or	a1,a1,a5
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	srli	a0,a0,3
	andi	a0,a0,15
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL10TCU01Powerv, .-_ZL10TCU01Powerv
	.section	.text._ZL16S74LS374NRestorei,"ax",@progbits
	.align	2
	.type	_ZL16S74LS374NRestorei, @function
_ZL16S74LS374NRestorei:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR1
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	call	_Z8setprg32jj
	lbu	a5,1(s0)
	lbu	a4,3(s0)
	lbu	a0,4(s0)
	or	a5,a5,a4
	or	a0,a5,a0
	call	_Z7setchr8j
	lbu	a0,2(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL13S74LS374MSynch
	.size	_ZL16S74LS374NRestorei, .-_ZL16S74LS374NRestorei
	.section	.text._ZL14S74LS374NResetv,"ax",@progbits
	.align	2
	.type	_ZL14S74LS374NResetv, @function
_ZL14S74LS374NResetv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	lla	a4,.LANCHOR3
	lbu	a5,0(a4)
	lla	s0,.LANCHOR1
	li	a1,0
	xori	a5,a5,1
	li	a0,32768
	sb	a5,0(a4)
	sw	zero,0(s0)
	sb	zero,4(s0)
	call	_Z8setprg32jj
	lbu	a5,1(s0)
	lbu	a4,3(s0)
	lbu	a0,4(s0)
	or	a5,a5,a4
	or	a0,a5,a0
	call	_Z7setchr8j
	lbu	a0,2(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL13S74LS374MSynch
	.size	_ZL14S74LS374NResetv, .-_ZL14S74LS374NResetv
	.section	.text._ZL14S74LS374NPowerv,"ax",@progbits
	.align	2
	.type	_ZL14S74LS374NPowerv, @function
_ZL14S74LS374NPowerv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	li	a1,0
	lla	s0,.LANCHOR1
	li	a0,32768
	sw	ra,8(sp)
	sw	s1,0(sp)
	la a5, .LANCHOR3; sb zero, 0(a5);
	sw	zero,0(s0)
	sb	zero,4(s0)
	call	_Z8setprg32jj
	lbu	a4,3(s0)
	lbu	a5,1(s0)
	lbu	a0,4(s0)
	li	s1,16384
	or	a5,a5,a4
	or	a0,a5,a0
	call	_Z7setchr8j
	lbu	a0,2(s0)
	call	_ZL13S74LS374MSynch
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	addi	a0,s1,256
	lla	a2,_ZL14S74LS374NWritejh
	addi	a1,a1,-1
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	a0,s1,256
	lw	s1,0(sp)
	li	a1,24576
	lla	a2,_ZL13S74LS374NReadj
	addi	a1,a1,-1
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL14S74LS374NPowerv, .-_ZL14S74LS374NPowerv
	.section	.rodata._Z14S74LS374N_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"LATC"
	.align	2
.LC1:
	.string	"CMD"
	.align	2
.LC2:
	.string	"DIP"
	.section	.text._Z14S74LS374N_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14S74LS374N_InitP8CartInfo
	.hidden	_Z14S74LS374N_InitP8CartInfo
	.type	_Z14S74LS374N_InitP8CartInfo, @function
_Z14S74LS374N_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a4,_ZL14S74LS374NPowerv
	sw	a4,0(a0)
	mv	a5,a0
	lla	a4,_ZL14S74LS374NResetv
	sw	a4,4(a5)
	lla	a3,.LC0
	lla	a5,_ZL16S74LS374NRestorei
	li	a2,0
	li	a1,5
	lla	a0,.LANCHOR1
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR2
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	lla	a3,.LC2
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR3
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14S74LS374N_InitP8CartInfo, .-_Z14S74LS374N_InitP8CartInfo
	.section	.text._Z15S74LS374NA_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z15S74LS374NA_InitP8CartInfo
	.hidden	_Z15S74LS374NA_InitP8CartInfo
	.type	_Z15S74LS374NA_InitP8CartInfo, @function
_Z15S74LS374NA_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,_ZL15S74LS374NAPowerv
	sw	a5,0(a0)
	lla	a3,.LC0
	li	a2,0
	li	a1,5
	lla	a0,.LANCHOR1
	lla	a5,_ZL16S74LS374NRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR2
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z15S74LS374NA_InitP8CartInfo, .-_Z15S74LS374NA_InitP8CartInfo
	.section	.text._Z11S8259A_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11S8259A_InitP8CartInfo
	.hidden	_Z11S8259A_InitP8CartInfo
	.type	_Z11S8259A_InitP8CartInfo, @function
_Z11S8259A_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,_ZL10S8259Resetv
	sw	a5,0(a0)
	lla	a3,.LC0
	lla	a5,_ZL12S8259Restorei
	li	a2,0
	li	a1,8
	lla	a0,.LANCHOR1
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR2
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	la a5, .LANCHOR4; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
	.size	_Z11S8259A_InitP8CartInfo, .-_Z11S8259A_InitP8CartInfo
	.section	.text._Z11S8259B_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11S8259B_InitP8CartInfo
	.hidden	_Z11S8259B_InitP8CartInfo
	.type	_Z11S8259B_InitP8CartInfo, @function
_Z11S8259B_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,_ZL10S8259Resetv
	sw	a5,0(a0)
	lla	a3,.LC0
	lla	a5,_ZL12S8259Restorei
	li	a2,0
	li	a1,8
	lla	a0,.LANCHOR1
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR2
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	li	a5,1
	la a4, .LANCHOR4; sw a5, 0(a4);
	addi	sp,sp,12
	jr	ra
	.size	_Z11S8259B_InitP8CartInfo, .-_Z11S8259B_InitP8CartInfo
	.section	.text._Z11S8259C_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11S8259C_InitP8CartInfo
	.hidden	_Z11S8259C_InitP8CartInfo
	.type	_Z11S8259C_InitP8CartInfo, @function
_Z11S8259C_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,_ZL10S8259Resetv
	sw	a5,0(a0)
	lla	a3,.LC0
	lla	a5,_ZL12S8259Restorei
	li	a2,0
	li	a1,8
	lla	a0,.LANCHOR1
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR2
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	li	a5,2
	la a4, .LANCHOR4; sw a5, 0(a4);
	addi	sp,sp,12
	jr	ra
	.size	_Z11S8259C_InitP8CartInfo, .-_Z11S8259C_InitP8CartInfo
	.section	.text._Z11S8259D_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11S8259D_InitP8CartInfo
	.hidden	_Z11S8259D_InitP8CartInfo
	.type	_Z11S8259D_InitP8CartInfo, @function
_Z11S8259D_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,_ZL10S8259Resetv
	sw	a5,0(a0)
	lla	a3,.LC0
	lla	a5,_ZL12S8259Restorei
	li	a2,0
	li	a1,8
	lla	a0,.LANCHOR1
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR2
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	li	a5,3
	la a4, .LANCHOR4; sw a5, 0(a4);
	addi	sp,sp,12
	jr	ra
	.size	_Z11S8259D_InitP8CartInfo, .-_Z11S8259D_InitP8CartInfo
	.section	.text._Z12SA0161M_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12SA0161M_InitP8CartInfo
	.hidden	_Z12SA0161M_InitP8CartInfo
	.type	_Z12SA0161M_InitP8CartInfo, @function
_Z12SA0161M_InitP8CartInfo:
	lla	a5,_ZL9SARestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL7SAPowerv
	sw	a5,0(a0)
	lla	a5,_ZL12SA0161MSyncov
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR1
	la a4, .LANCHOR0; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z12SA0161M_InitP8CartInfo, .-_Z12SA0161M_InitP8CartInfo
	.section	.text._Z12SA72007_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12SA72007_InitP8CartInfo
	.hidden	_Z12SA72007_InitP8CartInfo
	.type	_Z12SA72007_InitP8CartInfo, @function
_Z12SA72007_InitP8CartInfo:
	lla	a5,_ZL9SARestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL7SAPowerv
	sw	a5,0(a0)
	lla	a5,_ZL12SA72007Syncov
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR1
	la a4, .LANCHOR0; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z12SA72007_InitP8CartInfo, .-_Z12SA72007_InitP8CartInfo
	.section	.text._Z12SA72008_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12SA72008_InitP8CartInfo
	.hidden	_Z12SA72008_InitP8CartInfo
	.type	_Z12SA72008_InitP8CartInfo, @function
_Z12SA72008_InitP8CartInfo:
	lla	a5,_ZL9SARestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL7SAPowerv
	sw	a5,0(a0)
	lla	a5,_ZL12SA72008Syncov
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR1
	la a4, .LANCHOR0; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z12SA72008_InitP8CartInfo, .-_Z12SA72008_InitP8CartInfo
	.section	.text._Z10SA009_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SA009_InitP8CartInfo
	.hidden	_Z10SA009_InitP8CartInfo
	.type	_Z10SA009_InitP8CartInfo, @function
_Z10SA009_InitP8CartInfo:
	lla	a5,_ZL9SARestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL7SAPowerv
	sw	a5,0(a0)
	lla	a5,_ZL10SA009Syncov
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR1
	la a4, .LANCHOR0; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z10SA009_InitP8CartInfo, .-_Z10SA009_InitP8CartInfo
	.section	.text._Z11SA0036_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11SA0036_InitP8CartInfo
	.hidden	_Z11SA0036_InitP8CartInfo
	.type	_Z11SA0036_InitP8CartInfo, @function
_Z11SA0036_InitP8CartInfo:
	lla	a5,_ZL9SARestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL8SADPowerv
	sw	a5,0(a0)
	lla	a5,_ZL12SA72007Syncov
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR1
	la a4, .LANCHOR0; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z11SA0036_InitP8CartInfo, .-_Z11SA0036_InitP8CartInfo
	.section	.text._Z11SA0037_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11SA0037_InitP8CartInfo
	.hidden	_Z11SA0037_InitP8CartInfo
	.type	_Z11SA0037_InitP8CartInfo, @function
_Z11SA0037_InitP8CartInfo:
	lla	a5,_ZL9SARestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL8SADPowerv
	sw	a5,0(a0)
	lla	a5,_ZL12SA0161MSyncov
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR1
	la a4, .LANCHOR0; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z11SA0037_InitP8CartInfo, .-_Z11SA0037_InitP8CartInfo
	.section	.text._Z10TCU01_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TCU01_InitP8CartInfo
	.hidden	_Z10TCU01_InitP8CartInfo
	.type	_Z10TCU01_InitP8CartInfo, @function
_Z10TCU01_InitP8CartInfo:
	lla	a5,_ZL12TCU01Restorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL10TCU01Powerv
	sw	a5,0(a0)
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR1
	tail	_Z10AddExStatePvjiPKc
	.size	_Z10TCU01_InitP8CartInfo, .-_Z10TCU01_InitP8CartInfo
	.section	.text._Z10TCU02_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TCU02_InitP8CartInfo
	.hidden	_Z10TCU02_InitP8CartInfo
	.type	_Z10TCU02_InitP8CartInfo, @function
_Z10TCU02_InitP8CartInfo:
	lla	a5,_ZL12TCU02Restorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL10TCU02Powerv
	sw	a5,0(a0)
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR1
	tail	_Z10AddExStatePvjiPKc
	.size	_Z10TCU02_InitP8CartInfo, .-_Z10TCU02_InitP8CartInfo
	.section	.text._Z10TCA01_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TCA01_InitP8CartInfo
	.hidden	_Z10TCA01_InitP8CartInfo
	.type	_Z10TCA01_InitP8CartInfo, @function
_Z10TCA01_InitP8CartInfo:
	lla	a5,_ZL10TCA01Powerv
	sw	a5,0(a0)
	ret
	.size	_Z10TCA01_InitP8CartInfo, .-_Z10TCA01_InitP8CartInfo
	.section	.sbss._ZL3cmd,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL3cmd, @object
	.size	_ZL3cmd, 1
_ZL3cmd:
	.zero	1
	.section	.sbss._ZL3dip,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL3dip, @object
	.size	_ZL3dip, 1
_ZL3dip:
	.zero	1
	.section	.sbss._ZL4type,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL4type, @object
	.size	_ZL4type, 4
_ZL4type:
	.zero	4
	.section	.sbss._ZL5WSync,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL5WSync, @object
	.size	_ZL5WSync, 4
_ZL5WSync:
	.zero	4
	.section	.sbss._ZL5latch,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL5latch, @object
	.size	_ZL5latch, 8
_ZL5latch:
	.zero	8
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
