#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"90.cpp"
	.option nopic
	.text
	.section	.text._ZL11M90TekWritejh,"ax",@progbits
	.align	2
	.type	_ZL11M90TekWritejh, @function
_ZL11M90TekWritejh:
	li	a5,24576
	addi	a4,a5,-1021
	and	a0,a0,a4
	addi	a4,a5,-2047
	beq	a0,a4,.L2
	addi	a4,a5,-2045
	beq	a0,a4,.L3
	addi	a5,a5,-2048
	beq	a0,a5,.L6
	ret
.L6:
	la a5, .LANCHOR0; sb a1, 0(a5);
	ret
.L3:
	la a5, .LANCHOR1; sb a1, 0(a5);
	ret
.L2:
	la a5, .LANCHOR0+1; sb a1, 0(a5);
	ret
	.size	_ZL11M90TekWritejh, .-_ZL11M90TekWritejh
	.section	.text._ZL13M90DummyWritejh,"ax",@progbits
	.align	2
	.type	_ZL13M90DummyWritejh, @function
_ZL13M90DummyWritejh:
	ret
	.size	_ZL13M90DummyWritejh, .-_ZL13M90DummyWritejh
	.section	.text._ZL7tekpromv,"ax",@progbits
	.align	2
	.type	_ZL7tekpromv, @function
_ZL7tekpromv:
	addi	sp,sp,-16
	sw	s1,4(sp)
	lla	s1,.LANCHOR2
	lbu	a3,0(s1)
	lla	a2,.L11
	lbu	a4,3(s1)
	andi	a5,a3,7
	slli	a5,a5,2
	add	a5,a5,a2
	lw	a5,0(a5)
	sw	s0,8(sp)
	slli	a3,a3,24
	slli	s0,a4,5
	add	a5,a5,a2
	sw	ra,12(sp)
	andi	s0,s0,192
	srai	a3,a3,24
	jr	a5
	.section	.rodata._ZL7tekpromv,"a",@progbits
	.align	2
	.align	2
.L11:
	.word	.L9-.L11
	.word	.L15-.L11
	.word	.L14-.L11
	.word	.L14-.L11
	.word	.L13-.L11
	.word	.L12-.L11
	.word	.L10-.L11
	.word	.L10-.L11
	.section	.text._ZL7tekpromv
.L10:
	lla	a5,.LANCHOR3
	blt	a3,zero,.L31
.L21:
	lbu	a1,0(a5)
	li	a0,32768
	sw	a5,0(sp)
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	lw	a5,0(sp)
	li	a0,40960
	lbu	a1,1(a5)
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	lw	a5,0(sp)
	li	a0,49152
	lbu	a1,2(a5)
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	lw	a5,0(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	lbu	a1,3(a5)
	li	a0,57344
	andi	a1,a1,63
	or	a1,a1,s0
	lw	s0,8(sp)
	addi	sp,sp,16
	tail	_Z7setprg8jj
.L14:
	lla	a5,.LANCHOR3
	blt	a3,zero,.L32
.L18:
	lbu	a1,0(a5)
	li	a0,32768
	sw	a5,0(sp)
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	lw	a5,0(sp)
	li	a0,40960
	lbu	a1,1(a5)
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	lw	a5,0(sp)
	li	a0,49152
	lbu	a1,2(a5)
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	ori	a1,s0,63
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	li	a0,57344
	addi	sp,sp,16
	tail	_Z7setprg8jj
.L12:
	lla	a5,.LANCHOR3
	blt	a3,zero,.L33
.L20:
	lbu	a1,1(a5)
	slli	a4,a4,4
	andi	a4,a4,96
	andi	a1,a1,31
	or	a1,a1,a4
	li	a0,32768
	sw	a5,0(sp)
	call	_Z8setprg16jj
	lw	a5,0(sp)
	lbu	a1,3(s1)
	lw	s0,8(sp)
	lbu	a4,3(a5)
	lw	ra,12(sp)
	lw	s1,4(sp)
	slli	a5,a1,4
	andi	a5,a5,96
	andi	a1,a4,31
	li	a0,49152
	or	a1,a5,a1
	addi	sp,sp,16
	tail	_Z8setprg16jj
.L15:
	lla	a5,.LANCHOR3
	blt	a3,zero,.L34
.L17:
	lbu	a1,1(a5)
	slli	a4,a4,4
	andi	a4,a4,96
	andi	a1,a1,31
	or	a1,a1,a4
	li	a0,32768
	call	_Z8setprg16jj
	lbu	a1,3(s1)
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	slli	a1,a1,4
	andi	a1,a1,96
	li	a0,49152
	ori	a1,a1,31
	addi	sp,sp,16
	tail	_Z8setprg16jj
.L13:
	lla	a5,.LANCHOR3
	blt	a3,zero,.L35
.L19:
	lbu	a1,3(a5)
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	slli	a4,a4,3
	andi	a4,a4,48
	andi	a1,a1,15
	or	a1,a1,a4
	li	a0,32768
	addi	sp,sp,16
	tail	_Z8setprg32jj
.L9:
	blt	a3,zero,.L36
.L16:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	slli	a1,a4,3
	andi	a1,a1,48
	ori	a1,a1,15
	li	a0,32768
	addi	sp,sp,16
	tail	_Z8setprg32jj
.L31:
	lbu	a1,3(a5)
	li	a0,24576
	sw	a5,0(sp)
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	lw	a5,0(sp)
	j	.L21
.L36:
	la a1, .LANCHOR3+3; lbu a1, 0(a1);
	slli	a1,a1,2
	addi	a1,a1,3
	andi	a1,a1,63
	or	a1,a1,s0
	li	a0,24576
	call	_Z7setprg8jj
	lbu	a4,3(s1)
	j	.L16
.L35:
	lbu	a1,3(a5)
	li	a0,24576
	sw	a5,0(sp)
	slli	a1,a1,2
	addi	a1,a1,3
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	lbu	a4,3(s1)
	lw	a5,0(sp)
	j	.L19
.L34:
	lbu	a1,3(a5)
	li	a0,24576
	sw	a5,0(sp)
	slli	a1,a1,1
	addi	a1,a1,1
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	lbu	a4,3(s1)
	lw	a5,0(sp)
	j	.L17
.L33:
	lbu	a1,3(a5)
	li	a0,24576
	sw	a5,0(sp)
	slli	a1,a1,1
	addi	a1,a1,1
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	lbu	a4,3(s1)
	lw	a5,0(sp)
	j	.L20
.L32:
	lbu	a1,3(a5)
	li	a0,24576
	sw	a5,0(sp)
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	lw	a5,0(sp)
	j	.L18
	.size	_ZL7tekpromv, .-_ZL7tekpromv
	.section	.text._ZL11M90PRGWritejh,"ax",@progbits
	.align	2
	.type	_ZL11M90PRGWritejh, @function
_ZL11M90PRGWritejh:
	andi	a0,a0,3
	lla	a5,.LANCHOR3
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL7tekpromv
	.size	_ZL11M90PRGWritejh, .-_ZL11M90PRGWritejh
	.section	.text._ZL7tekvromv,"ax",@progbits
	.align	2
	.type	_ZL7tekvromv, @function
_ZL7tekvromv:
	addi	sp,sp,-24
	sw	ra,20(sp)
	sw	s0,16(sp)
	sw	s1,12(sp)
	lla	a5,.LANCHOR2
	lbu	a4,3(a5)
	lbu	a5,0(a5)
	andi	a3,a4,32
	andi	a5,a5,24
	beq	a3,zero,.L61
	li	a4,16
	beq	a5,a4,.L54
	bgtu	a5,a4,.L50
	beq	a5,zero,.L55
	li	a4,8
	bne	a5,a4,.L38
	li	s1,65536
	addi	s1,s1,-1
	li	s0,0
	j	.L47
.L61:
	srli	a0,a4,2
	andi	a0,a0,6
	andi	a4,a4,1
	li	a3,16
	or	a0,a0,a4
	beq	a5,a3,.L40
	bgtu	a5,a3,.L41
	beq	a5,zero,.L42
	li	a4,8
	slli	s0,a0,6
	li	s1,63
	bne	a5,a4,.L38
.L47:
	lla	a3,.LANCHOR6
	lbu	a2,0(a3)
	lla	a4,.LANCHOR4
	lla	a5,.LANCHOR5
	add	a1,a4,a2
	lbu	a1,0(a1)
	add	a2,a5,a2
	lbu	a2,0(a2)
	slli	a1,a1,8
	li	a0,0
	or	a1,a1,a2
	and	a1,a1,s1
	or	a1,a1,s0
	call	_Z7setchr4jj
	lla	a3,.LANCHOR6
	lbu	a3,1(a3)
	lla	a4,.LANCHOR4
	lla	a5,.LANCHOR5
	add	a4,a4,a3
	lbu	a1,0(a4)
	add	a5,a5,a3
	lbu	a5,0(a5)
	slli	a1,a1,8
	lw	ra,20(sp)
	or	a1,a1,a5
	and	a1,a1,s1
	or	a1,a1,s0
	lw	s0,16(sp)
	lw	s1,12(sp)
	li	a0,4096
	addi	sp,sp,24
	tail	_Z7setchr4jj
.L41:
	slli	a3,a0,8
	sw	a3,4(sp)
	li	a3,255
	li	a4,24
	sw	a3,8(sp)
	bne	a5,a4,.L38
.L49:
	lla	a5,.LANCHOR5
	li	s0,0
	lla	s1,.LANCHOR4
	sw	a5,0(sp)
.L52:
	lw	a5,0(sp)
	add	a4,s1,s0
	lbu	a1,0(a4)
	add	a4,a5,s0
	lbu	a4,0(a4)
	lw	a5,8(sp)
	slli	a1,a1,8
	or	a1,a1,a4
	and	a1,a1,a5
	lw	a5,4(sp)
	slli	a0,s0,10
	addi	s0,s0,1
	or	a1,a1,a5
	call	_Z7setchr1jj
	li	a5,8
	bne	s0,a5,.L52
.L38:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L50:
	li	a4,24
	bne	a5,a4,.L38
	li	a5,65536
	addi	a5,a5,-1
	sw	a5,8(sp)
	sw	zero,4(sp)
	j	.L49
.L55:
	li	a4,65536
	addi	a4,a4,-1
	li	a0,0
.L46:
	la a5, .LANCHOR4; lbu a5, 0(a5);
	lw	s0,16(sp)
	la a3, .LANCHOR5; lbu a3, 0(a3);
	slli	a5,a5,8
	lw	ra,20(sp)
	lw	s1,12(sp)
	or	a5,a5,a3
	and	a5,a5,a4
	or	a0,a5,a0
	addi	sp,sp,24
	tail	_Z7setchr8j
.L42:
	slli	a0,a0,5
	li	a4,31
	j	.L46
.L54:
	li	a5,65536
	addi	a5,a5,-1
	sw	a5,8(sp)
	sw	zero,4(sp)
.L48:
	lla	a5,.LANCHOR5
	li	s0,0
	lla	s1,.LANCHOR4
	sw	a5,0(sp)
.L51:
	lw	a5,0(sp)
	add	a4,s1,s0
	lbu	a1,0(a4)
	add	a4,a5,s0
	lbu	a4,0(a4)
	lw	a5,8(sp)
	slli	a1,a1,8
	or	a1,a1,a4
	and	a1,a1,a5
	lw	a5,4(sp)
	slli	a0,s0,10
	addi	s0,s0,2
	or	a1,a1,a5
	call	_Z7setchr2jj
	li	a5,8
	bne	s0,a5,.L51
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L40:
	slli	a5,a0,7
	sw	a5,4(sp)
	li	a5,127
	sw	a5,8(sp)
	j	.L48
	.size	_ZL7tekvromv, .-_ZL7tekvromv
	.section	.text._ZL13M90CHRhiWritejh,"ax",@progbits
	.align	2
	.type	_ZL13M90CHRhiWritejh, @function
_ZL13M90CHRhiWritejh:
	andi	a0,a0,7
	lla	a5,.LANCHOR4
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL7tekvromv
	.size	_ZL13M90CHRhiWritejh, .-_ZL13M90CHRhiWritejh
	.section	.text._ZL14M90CHRlowWritejh,"ax",@progbits
	.align	2
	.type	_ZL14M90CHRlowWritejh, @function
_ZL14M90CHRlowWritejh:
	andi	a0,a0,7
	lla	a5,.LANCHOR5
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL7tekvromv
	.size	_ZL14M90CHRlowWritejh, .-_ZL14M90CHRlowWritejh
	.section	.text._ZL4mirav,"ax",@progbits
	.align	2
	.type	_ZL4mirav, @function
_ZL4mirav:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	lla	s0,.LANCHOR2
	lbu	a5,0(s0)
	andi	a4,a5,32
	beq	a4,zero,.L65
	la a4, .LANCHOR7; lw a4, 0(a4);
	beq	a4,zero,.L65
.L66:
	andi	a5,a5,64
	bne	a5,zero,.L86
	lla	a3,.LANCHOR9
	li	s1,0
.L73:
	lhu	a4,0(a3)
	lbu	a5,1(s0)
	lla	t0,NTARAM
	slli	a0,a4,10
	xor	a5,a5,a4
	andi	a0,a0,1024
	andi	a5,a5,128
	sw	a3,0(sp)
	mv	a2,s1
	li	a1,1
	add	a0,t0,a0
	beq	a5,zero,.L84
	lla	a5,CHRptr
	lw	a0,0(a5)
	la a5, CHRmask1; lw a5, 0(a5);
	and	a4,a4,a5
	slli	a4,a4,10
	li	a1,0
	add	a0,a0,a4
.L84:
	call	_Z9setntamemPhij
	lw	a3,0(sp)
	addi	s1,s1,1
	li	a5,4
	addi	a3,a3,2
	bne	s1,a5,.L73
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L65:
	la a4, .LANCHOR8; lw a4, 0(a4);
	bne	a4,zero,.L66
	lbu	a5,1(s0)
	li	a4,2
	li	a0,2
	andi	a5,a5,3
	beq	a5,a4,.L85
	li	a4,3
	li	a0,3
	beq	a5,a4,.L85
	li	a4,1
	li	a0,1
	beq	a5,a4,.L87
.L85:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	_Z9setmirrori
.L86:
	lla	a4,.LANCHOR9
	li	s1,0
	lla	t1,CHRptr
	lla	s0,CHRmask1
.L69:
	lhu	a5,0(a4)
	lw	a1,0(s0)
	lw	a0,0(t1)
	mv	a2,s1
	and	a5,a5,a1
	slli	a5,a5,10
	add	a0,a0,a5
	li	a1,0
	sw	a4,0(sp)
	call	_Z9setntamemPhij
	lw	a4,0(sp)
	addi	s1,s1,1
	li	a5,4
	addi	a4,a4,2
	lla	t1,CHRptr
	bne	s1,a5,.L69
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L87:
	li	a0,0
	j	.L85
	.size	_ZL4mirav, .-_ZL4mirav
	.section	.text._ZL10M90Restorei,"ax",@progbits
	.align	2
	.type	_ZL10M90Restorei, @function
_ZL10M90Restorei:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_ZL7tekpromv
	call	_ZL7tekvromv
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4mirav
	.size	_ZL10M90Restorei, .-_ZL10M90Restorei
	.section	.text._ZL12M90ModeWritejh,"ax",@progbits
	.align	2
	.type	_ZL12M90ModeWritejh, @function
_ZL12M90ModeWritejh:
	addi	sp,sp,-12
	andi	a0,a0,3
	lla	a5,.LANCHOR2
	sw	ra,8(sp)
	add	a5,a5,a0
	sb	a1,0(a5)
	call	_ZL7tekpromv
	call	_ZL7tekvromv
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4mirav
	.size	_ZL12M90ModeWritejh, .-_ZL12M90ModeWritejh
	.section	.text._ZL10M90NTWritejh,"ax",@progbits
	.align	2
	.type	_ZL10M90NTWritejh, @function
_ZL10M90NTWritejh:
	andi	a3,a0,3
	lla	a4,.LANCHOR9
	slli	a3,a3,1
	add	a5,a4,a3
	andi	a0,a0,4
	lhu	a5,0(a5)
	beq	a0,zero,.L93
	andi	a5,a5,255
	slli	a1,a1,8
	or	a1,a5,a1
	add	a4,a4,a3
	sh	a1,0(a4)
	tail	_ZL4mirav
.L93:
	andi	a5,a5,-256
	or	a1,a5,a1
	add	a4,a4,a3
	sh	a1,0(a4)
	tail	_ZL4mirav
	.size	_ZL10M90NTWritejh, .-_ZL10M90NTWritejh
	.section	.text._ZL8M90Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M90Powerv, @function
_ZL8M90Powerv:
	addi	sp,sp,-12
	sw	s1,0(sp)
	li	s1,24576
	addi	a1,s1,-1
	lla	a2,_ZL11M90TekWritejh
	li	a0,20480
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,36864
	addi	a1,a1,-16
	lla	a2,_ZL11M90PRGWritejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,40960
	addi	a1,a1,-1
	lla	a2,_ZL14M90CHRlowWritejh
	li	a0,36864
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,45056
	addi	a1,a1,-1
	lla	a2,_ZL13M90CHRhiWritejh
	li	a0,40960
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,49152
	addi	a1,a1,-1
	lla	a2,_ZL10M90NTWritejh
	li	a0,45056
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,53248
	addi	a1,s0,-1
	lla	a2,_ZL11M90IRQWritejh
	li	a0,49152
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,1535
	lla	a2,_ZL12M90ModeWritejh
	li	a0,53248
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL13M90DummyWritejh
	li	a0,57344
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s1,-1
	lla	a2,_ZL10M90TekReadj
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a5,-1
	li	a2,4
	li	a1,0
	lla	a0,.LANCHOR2
	la a4, .LANCHOR1; sb a5, 0(a4);
	la a4, .LANCHOR0; sh a5, 0(a4);
	call	memset
	li	a2,4
	li	a1,255
	lla	a0,.LANCHOR3
	call	memset
	li	a2,8
	li	a1,255
	lla	a0,.LANCHOR5
	call	memset
	li	a2,8
	li	a1,255
	lla	a0,.LANCHOR4
	call	memset
	li	a2,8
	li	a1,0
	lla	a0,.LANCHOR9
	call	memset
	la a5, .LANCHOR8; lw a5, 0(a5);
	snez	a5,a5
	neg	a5,a5
	andi	a5,a5,192
	la a4, .LANCHOR10; sb a5, 0(a4);
	call	_ZL7tekpromv
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_ZL7tekvromv
	.size	_ZL8M90Powerv, .-_ZL8M90Powerv
	.section	.text._ZL11M90IRQWritejh,"ax",@progbits
	.align	2
	.type	_ZL11M90IRQWritejh, @function
_ZL11M90IRQWritejh:
	andi	a0,a0,7
	lla	a4,.L102
	slli	a0,a0,2
	add	a0,a0,a4
	lw	a5,0(a0)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL11M90IRQWritejh,"a",@progbits
	.align	2
	.align	2
.L102:
	.word	.L100-.L102
	.word	.L108-.L102
	.word	.L107-.L102
	.word	.L106-.L102
	.word	.L105-.L102
	.word	.L104-.L102
	.word	.L103-.L102
	.word	.L101-.L102
	.section	.text._ZL11M90IRQWritejh
.L101:
	la a5, .LANCHOR16; sb a1, 0(a5);
.L99:
	ret
.L108:
	la a5, .LANCHOR12; sb a1, 0(a5);
	ret
.L107:
	li	a0,1
	la a5, .LANCHOR11; sb zero, 0(a5);
	tail	_Z12X6502_IRQEndi
.L106:
	li	a5,1
	la a4, .LANCHOR11; sb a5, 0(a4);
	ret
.L105:
	la a5, .LANCHOR14; lbu a5, 0(a5);
	xor	a1,a1,a5
	la a5, .LANCHOR13; sb a1, 0(a5);
	ret
.L104:
	la a5, .LANCHOR14; lbu a5, 0(a5);
	xor	a1,a1,a5
	la a5, .LANCHOR15; sb a1, 0(a5);
	ret
.L103:
	la a5, .LANCHOR14; sb a1, 0(a5);
	ret
.L100:
	andi	a1,a1,1
	la a5, .LANCHOR11; sb a1, 0(a5);
	bne	a1,zero,.L99
	li	a0,1
	tail	_Z12X6502_IRQEndi
	.size	_ZL11M90IRQWritejh, .-_ZL11M90IRQWritejh
	.section	.rodata._ZL7toggliev.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"tekker=%02x\n"
	.section	.text._ZL7toggliev,"ax",@progbits
	.align	2
	.type	_ZL7toggliev, @function
_ZL7toggliev:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,.LANCHOR10
	lbu	a1,0(a5)
	lla	a0,.LC0
	addi	a1,a1,64
	andi	a1,a1,192
	sb	a1,0(a5)
	call	printf
	li	a2,4
	li	a1,0
	lla	a0,.LANCHOR2
	call	memset
	li	a2,4
	li	a1,255
	lla	a0,.LANCHOR3
	call	memset
	call	_ZL7tekpromv
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL7tekvromv
	.size	_ZL7toggliev, .-_ZL7toggliev
	.globl	__mulsi3
	.section	.text._ZL10M90TekReadj,"ax",@progbits
	.align	2
	.type	_ZL10M90TekReadj, @function
_ZL10M90TekReadj:
	li	a5,24576
	addi	a4,a5,-1021
	addi	sp,sp,-12
	and	a0,a0,a4
	sw	ra,8(sp)
	addi	a4,a5,-2047
	beq	a0,a4,.L113
	addi	a4,a5,-2045
	beq	a0,a4,.L114
	addi	a5,a5,-2048
	beq	a0,a5,.L118
	lw	ra,8(sp)
	la a0, .LANCHOR10; lbu a0, 0(a0);
	addi	sp,sp,12
	jr	ra
.L113:
	lla	a5,.LANCHOR0
	lbu	a1,1(a5)
	lbu	a0,0(a5)
	call	__mulsi3
	lw	ra,8(sp)
	srai	a0,a0,8
	andi	a0,a0,0xff
	addi	sp,sp,12
	jr	ra
.L118:
	lla	a5,.LANCHOR0
	lbu	a1,1(a5)
	lbu	a0,0(a5)
	call	__mulsi3
	lw	ra,8(sp)
	andi	a0,a0,0xff
	addi	sp,sp,12
	jr	ra
.L114:
	lw	ra,8(sp)
	la a0, .LANCHOR1; lbu a0, 0(a0);
	addi	sp,sp,12
	jr	ra
	.size	_ZL10M90TekReadj, .-_ZL10M90TekReadj
	.section	.text._ZL3CCLv,"ax",@progbits
	.align	2
	.type	_ZL3CCLv, @function
_ZL3CCLv:
	la a5, .LANCHOR12; lbu a5, 0(a5);
	srli	a5,a5,6
	li	a4,1
	beq	a5,a4,.L129
	li	a4,2
	beq	a5,a4,.L130
.L119:
	ret
.L130:
	lla	a4,.LANCHOR15
	lbu	a5,0(a4)
	li	a3,255
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	bne	a5,a3,.L119
	la a5, .LANCHOR11; lbu a5, 0(a5);
	beq	a5,zero,.L119
.L131:
	li	a0,1
	tail	_Z14X6502_IRQBegini
.L129:
	lla	a4,.LANCHOR15
	lbu	a5,0(a4)
	addi	a5,a5,1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	bne	a5,zero,.L119
	la a5, .LANCHOR11; lbu a5, 0(a5);
	beq	a5,zero,.L119
	j	.L131
	.size	_ZL3CCLv, .-_ZL3CCLv
	.section	.text._ZL12ClockCounterv,"ax",@progbits
	.align	2
	.type	_ZL12ClockCounterv, @function
_ZL12ClockCounterv:
	la a4, .LANCHOR12; lbu a4, 0(a4);
	slli	a5,a4,29
	srai	a5,a5,31
	andi	a5,a5,-248
	srli	a4,a4,6
	li	a3,1
	addi	a5,a5,255
	beq	a4,a3,.L143
	li	a3,2
	beq	a4,a3,.L144
.L132:
	ret
.L144:
	lla	a3,.LANCHOR13
	lbu	a4,0(a3)
	addi	a4,a4,-1
	andi	a4,a4,0xff
	sb	a4,0(a3)
	and	a4,a4,a5
	bne	a4,a5,.L132
.L135:
	tail	_ZL3CCLv
.L143:
	lla	a3,.LANCHOR13
	lbu	a4,0(a3)
	addi	a4,a4,1
	andi	a4,a4,0xff
	sb	a4,0(a3)
	and	a4,a4,a5
	beq	a4,zero,.L135
	ret
	.size	_ZL12ClockCounterv, .-_ZL12ClockCounterv
	.section	.text._ZL6M90PPUj,"ax",@progbits
	.align	2
	.type	_ZL6M90PPUj, @function
_ZL6M90PPUj:
	addi	sp,sp,-16
	la a5, .LANCHOR12; lbu a5, 0(a5);
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	andi	a5,a5,3
	li	a4,2
	beq	a5,a4,.L153
.L146:
	la a5, .LANCHOR7; lw a5, 0(a5);
	beq	a5,zero,.L148
	srli	a5,a0,8
	andi	a4,a5,0xff
	li	a3,31
	bgtu	a4,a3,.L145
	andi	a5,a5,15
	li	a3,15
	beq	a5,a3,.L154
.L145:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L148:
	lw	ra,12(sp)
	lw	s0,8(sp)
	li	a5,1024
	la a4, .LANCHOR6; sh a5, 0(a4);
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L153:
	lla	s1,.LANCHOR17
	lw	a5,0(s1)
	bne	a5,a0,.L155
	sw	a0,0(s1)
	j	.L146
.L155:
	sw	a0,0(sp)
	call	_ZL12ClockCounterv
	call	_ZL12ClockCounterv
	lw	a0,0(sp)
	sw	a0,0(s1)
	j	.L146
.L154:
	andi	s0,a0,240
	li	a5,208
	beq	s0,a5,.L156
	li	a5,224
	bne	s0,a5,.L145
	srli	a5,a4,2
	andi	a5,a5,4
	srli	a4,a4,4
	lla	a3,.LANCHOR6
	add	a4,a3,a4
	ori	a5,a5,2
	sb	a5,0(a4)
.L152:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	_ZL7tekvromv
.L156:
	srli	a3,a4,4
	lla	a5,.LANCHOR6
	srli	a4,a4,2
	add	a5,a5,a3
	andi	a4,a4,4
	sb	a4,0(a5)
	j	.L152
	.size	_ZL6M90PPUj, .-_ZL6M90PPUj
	.section	.text._Z7CPUWrapi,"ax",@progbits
	.align	2
	.globl	_Z7CPUWrapi
	.hidden	_Z7CPUWrapi
	.type	_Z7CPUWrapi, @function
_Z7CPUWrapi:
	lla	a3,.LANCHOR12
	lbu	a4,0(a3)
	andi	a5,a4,3
	bne	a5,zero,.L170
	addi	sp,sp,-12
	sw	s1,0(sp)
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s1,a0
	ble	a0,zero,.L157
	li	s0,0
	lla	a2,.LANCHOR13
	j	.L164
.L160:
	beq	a4,a0,.L173
.L162:
	addi	s0,s0,1
	beq	s1,s0,.L157
.L174:
	lbu	a4,0(a3)
.L164:
	slli	a5,a4,29
	srai	a5,a5,31
	andi	a5,a5,-248
	srli	a4,a4,6
	li	a1,1
	li	a0,2
	addi	a5,a5,255
	bne	a4,a1,.L160
	lbu	a4,0(a2)
	addi	a4,a4,1
	andi	a4,a4,0xff
	sb	a4,0(a2)
	and	a4,a4,a5
	bne	a4,zero,.L162
.L161:
	call	_ZL3CCLv
	addi	s0,s0,1
	lla	a3,.LANCHOR12
	lla	a2,.LANCHOR13
	bne	s1,s0,.L174
.L157:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L170:
	ret
.L173:
	lbu	a4,0(a2)
	addi	a4,a4,-1
	andi	a4,a4,0xff
	sb	a4,0(a2)
	and	a4,a5,a4
	bne	a5,a4,.L162
	j	.L161
	.size	_Z7CPUWrapi, .-_Z7CPUWrapi
	.section	.text._ZL6SLWrapv,"ax",@progbits
	.align	2
	.type	_ZL6SLWrapv, @function
_ZL6SLWrapv:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR12
	lbu	a4,0(s1)
	sw	ra,8(sp)
	sw	s0,4(sp)
	li	a5,1
	andi	a3,a4,3
	beq	a3,a5,.L191
.L175:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L191:
	li	s0,8
	lla	a3,.LANCHOR13
	j	.L182
.L178:
	beq	a4,a1,.L192
.L180:
	addi	s0,s0,-1
	beq	s0,zero,.L175
	lbu	a4,0(s1)
.L182:
	slli	a5,a4,29
	srai	a5,a5,31
	andi	a5,a5,-248
	srli	a4,a4,6
	li	a2,1
	li	a1,2
	addi	a5,a5,255
	bne	a4,a2,.L178
	lbu	a4,0(a3)
	addi	a4,a4,1
	andi	a4,a4,0xff
	sb	a4,0(a3)
	and	a4,a4,a5
	bne	a4,zero,.L180
.L179:
	call	_ZL3CCLv
	lla	a3,.LANCHOR13
	j	.L180
.L192:
	lbu	a4,0(a3)
	addi	a4,a4,-1
	andi	a4,a4,0xff
	sb	a4,0(a3)
	and	a4,a5,a4
	bne	a5,a4,.L180
	j	.L179
	.size	_ZL6SLWrapv, .-_ZL6SLWrapv
	.section	.text._Z13Mapper90_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper90_InitP8CartInfo
	.hidden	_Z13Mapper90_InitP8CartInfo
	.type	_Z13Mapper90_InitP8CartInfo, @function
_Z13Mapper90_InitP8CartInfo:
	lla	a5,_ZL8M90Powerv
	sw	a5,0(a0)
	lla	a5,_ZL7toggliev
	sw	a5,4(a0)
	la a5, .LANCHOR8; sw zero, 0(a5);
	la a5, .LANCHOR7; sw zero, 0(a5);
	lla	a5,_ZL6M90PPUj
	la a4, PPU_hook; sw a5, 0(a4);
	lla	a5,_Z7CPUWrapi
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL6SLWrapv
	la a4, GameHBIRQHook2; sw a5, 0(a4);
	lla	a5,_ZL10M90Restorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR18
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper90_InitP8CartInfo, .-_Z13Mapper90_InitP8CartInfo
	.section	.text._Z14Mapper209_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper209_InitP8CartInfo
	.hidden	_Z14Mapper209_InitP8CartInfo
	.type	_Z14Mapper209_InitP8CartInfo, @function
_Z14Mapper209_InitP8CartInfo:
	lla	a5,_ZL8M90Powerv
	sw	a5,0(a0)
	lla	a5,_ZL7toggliev
	sw	a5,4(a0)
	la a5, .LANCHOR8; sw zero, 0(a5);
	li	a5,1
	la a4, .LANCHOR7; sw a5, 0(a4);
	lla	a5,_ZL6M90PPUj
	la a4, PPU_hook; sw a5, 0(a4);
	lla	a5,_Z7CPUWrapi
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL6SLWrapv
	la a4, GameHBIRQHook2; sw a5, 0(a4);
	lla	a5,_ZL10M90Restorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR18
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper209_InitP8CartInfo, .-_Z14Mapper209_InitP8CartInfo
	.section	.text._Z14Mapper211_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper211_InitP8CartInfo
	.hidden	_Z14Mapper211_InitP8CartInfo
	.type	_Z14Mapper211_InitP8CartInfo, @function
_Z14Mapper211_InitP8CartInfo:
	lla	a5,_ZL8M90Powerv
	sw	a5,0(a0)
	lla	a5,_ZL7toggliev
	sw	a5,4(a0)
	li	a5,1
	la a4, .LANCHOR8; sw a5, 0(a4);
	lla	a5,_ZL6M90PPUj
	la a4, PPU_hook; sw a5, 0(a4);
	lla	a5,_Z7CPUWrapi
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL6SLWrapv
	la a4, GameHBIRQHook2; sw a5, 0(a4);
	lla	a5,_ZL10M90Restorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR18
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper211_InitP8CartInfo, .-_Z14Mapper211_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"IRQM"
	.align	2
.LC2:
	.string	"IRQP"
	.align	2
.LC3:
	.string	"IRQR"
	.align	2
.LC4:
	.string	"IRQC"
	.align	2
.LC5:
	.string	"IRQX"
	.align	2
.LC6:
	.string	"IRQA"
	.align	2
.LC7:
	.string	"MUL"
	.align	2
.LC8:
	.string	"REGI"
	.align	2
.LC9:
	.string	"TKCO"
	.align	2
.LC10:
	.string	"PRGB"
	.align	2
.LC11:
	.string	"CLTC"
	.align	2
.LC12:
	.string	"CHRL"
	.align	2
.LC13:
	.string	"CHRH"
	.align	2
.LC14:
	.string	"NMS0"
	.align	2
.LC15:
	.string	"NMS1"
	.align	2
.LC16:
	.string	"NMS2"
	.align	2
.LC17:
	.string	"NMS3"
	.align	2
.LC18:
	.string	"TEKR"
	.section	.data._ZL13Tek_StateRegs,"aw"
	.align	2
	.set	.LANCHOR18,. + 0
	.type	_ZL13Tek_StateRegs, @object
	.size	_ZL13Tek_StateRegs, 228
_ZL13Tek_StateRegs:
	.word	_ZL7IRQMode
	.word	1
	.word	.LC1
	.word	_ZL6IRQPre
	.word	1
	.word	.LC2
	.word	_ZL10IRQPreSize
	.word	1
	.word	.LC3
	.word	_ZL8IRQCount
	.word	1
	.word	.LC4
	.word	_ZL6IRQXOR
	.word	1
	.word	.LC5
	.word	_ZL4IRQa
	.word	1
	.word	.LC6
	.word	_ZL3mul
	.word	2
	.word	.LC7
	.word	_ZL5regie
	.word	1
	.word	.LC8
	.word	_ZL5tkcom
	.word	4
	.word	.LC9
	.word	_ZL4prgb
	.word	4
	.word	.LC10
	.word	_ZL3chr
	.word	2
	.word	.LC11
	.word	_ZL6chrlow
	.word	4
	.word	.LC12
	.word	_ZL7chrhigh
	.word	8
	.word	.LC13
	.word	_ZL5names
	.word	-2147483646
	.word	.LC14
	.word	_ZL5names+2
	.word	-2147483646
	.word	.LC15
	.word	_ZL5names+4
	.word	-2147483646
	.word	.LC16
	.word	_ZL5names+6
	.word	-2147483646
	.word	.LC17
	.word	_ZL6tekker
	.word	1
	.word	.LC18
	.word	0
	.zero	8
	.section	.sbss._ZL10IRQPreSize,"aw",@nobits
	.set	.LANCHOR16,. + 0
	.type	_ZL10IRQPreSize, @object
	.size	_ZL10IRQPreSize, 1
_ZL10IRQPreSize:
	.zero	1
	.section	.sbss._ZL3chr,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	_ZL3chr, @object
	.size	_ZL3chr, 2
_ZL3chr:
	.zero	2
	.section	.sbss._ZL3mul,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL3mul, @object
	.size	_ZL3mul, 2
_ZL3mul:
	.zero	2
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR11,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4prgb,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL4prgb, @object
	.size	_ZL4prgb, 4
_ZL4prgb:
	.zero	4
	.section	.sbss._ZL5is209,"aw",@nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	_ZL5is209, @object
	.size	_ZL5is209, 4
_ZL5is209:
	.zero	4
	.section	.sbss._ZL5is211,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	_ZL5is211, @object
	.size	_ZL5is211, 4
_ZL5is211:
	.zero	4
	.section	.sbss._ZL5names,"aw",@nobits
	.align	2
	.set	.LANCHOR9,. + 0
	.type	_ZL5names, @object
	.size	_ZL5names, 8
_ZL5names:
	.zero	8
	.section	.sbss._ZL5regie,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL5regie, @object
	.size	_ZL5regie, 1
_ZL5regie:
	.zero	1
	.section	.sbss._ZL5tkcom,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL5tkcom, @object
	.size	_ZL5tkcom, 4
_ZL5tkcom:
	.zero	4
	.section	.sbss._ZL6IRQPre,"aw",@nobits
	.set	.LANCHOR13,. + 0
	.type	_ZL6IRQPre, @object
	.size	_ZL6IRQPre, 1
_ZL6IRQPre:
	.zero	1
	.section	.sbss._ZL6IRQXOR,"aw",@nobits
	.set	.LANCHOR14,. + 0
	.type	_ZL6IRQXOR, @object
	.size	_ZL6IRQXOR, 1
_ZL6IRQXOR:
	.zero	1
	.section	.sbss._ZL6chrlow,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL6chrlow, @object
	.size	_ZL6chrlow, 8
_ZL6chrlow:
	.zero	8
	.section	.sbss._ZL6tekker,"aw",@nobits
	.set	.LANCHOR10,. + 0
	.type	_ZL6tekker, @object
	.size	_ZL6tekker, 1
_ZL6tekker:
	.zero	1
	.section	.sbss._ZL7IRQMode,"aw",@nobits
	.set	.LANCHOR12,. + 0
	.type	_ZL7IRQMode, @object
	.size	_ZL7IRQMode, 1
_ZL7IRQMode:
	.zero	1
	.section	.sbss._ZL7chrhigh,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL7chrhigh, @object
	.size	_ZL7chrhigh, 8
_ZL7chrhigh:
	.zero	8
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.set	.LANCHOR15,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 1
_ZL8IRQCount:
	.zero	1
	.section	.sbss._ZL8lastread,"aw",@nobits
	.align	2
	.set	.LANCHOR17,. + 0
	.type	_ZL8lastread, @object
	.size	_ZL8lastread, 4
_ZL8lastread:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
