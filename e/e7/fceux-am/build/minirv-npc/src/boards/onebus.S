#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"onebus.cpp"
	.option nopic
	.text
	.section	.text._ZL20UNLOneBusReadAPU40XXj,"ax",@progbits
	.align	2
	.type	_ZL20UNLOneBusReadAPU40XXj, @function
_ZL20UNLOneBusReadAPU40XXj:
	addi	sp,sp,-12
	sw	s0,4(sp)
	andi	s0,a0,63
	slli	a4,s0,2
	lla	a5,.LANCHOR0
	add	a5,a5,a4
	lw	a5,0(a5)
	sw	ra,8(sp)
	jalr	a5
	li	a5,21
	beq	s0,a5,.L8
.L2:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L8:
	la a5, .LANCHOR1+48; lbu a5, 0(a5);
	andi	a5,a5,16
	beq	a5,zero,.L2
	lw	ra,8(sp)
	lw	s0,4(sp)
	la a5, .LANCHOR2; lbu a5, 0(a5);
	andi	a0,a0,127
	or	a0,a0,a5
	addi	sp,sp,12
	jr	ra
	.size	_ZL20UNLOneBusReadAPU40XXj, .-_ZL20UNLOneBusReadAPU40XXj
	.section	.text._ZL5PSyncv,"ax",@progbits
	.align	2
	.type	_ZL5PSyncv, @function
_ZL5PSyncv:
	addi	sp,sp,-28
	sw	ra,24(sp)
	sw	s0,20(sp)
	sw	s1,16(sp)
	lla	a5,.LANCHOR3
	lbu	a0,11(a5)
	li	a3,7
	andi	a4,a0,7
	beq	a4,a3,.L12
	li	a3,63
	sra	a3,a3,a4
	li	t2,-64
	andi	a2,a3,0xff
	sra	t2,t2,a4
.L10:
	lbu	s0,0(a5)
	lbu	t1,10(a5)
	lbu	s1,5(a5)
	li	t0,4096
	la a4, .LANCHOR4; lbu a4, 0(a4);
	slli	s0,s0,4
	addi	t0,t0,-256
	xori	a1,a4,7
	and	t1,t1,t2
	xori	a4,a4,8
	and	s0,s0,t0
	slli	s1,s1,8
	add	a1,a5,a1
	add	a4,a5,a4
	add	s0,s0,t1
	andi	a0,a0,64
	li	t1,16384
	and	s1,s1,t1
	lbu	a1,0(a1)
	lbu	a4,0(a4)
	li	t1,254
	beq	a0,zero,.L11
	lbu	t1,9(a5)
.L11:
	and	a1,a2,a1
	li	a0,32768
	or	a1,a1,s0
	or	a0,s1,a0
	sw	a3,12(sp)
	sw	t1,4(sp)
	sw	a4,8(sp)
	sw	a2,0(sp)
	call	_Z7setprg8jj
	lw	a2,0(sp)
	lw	a4,8(sp)
	li	a0,40960
	and	a1,a2,a4
	or	a1,a1,s0
	call	_Z7setprg8jj
	lw	a2,0(sp)
	lw	t1,4(sp)
	li	a0,49152
	xor	a0,s1,a0
	and	a1,a2,t1
	or	a1,a1,s0
	call	_Z7setprg8jj
	lw	a3,12(sp)
	lw	ra,24(sp)
	lw	s1,16(sp)
	or	a1,s0,a3
	lw	s0,20(sp)
	li	a0,57344
	addi	sp,sp,28
	tail	_Z7setprg8jj
.L12:
	li	a3,255
	li	t2,-256
	li	a2,255
	j	.L10
	.size	_ZL5PSyncv, .-_ZL5PSyncv
	.section	.text._ZL5CSyncv,"ax",@progbits
	.align	2
	.type	_ZL5CSyncv, @function
_ZL5CSyncv:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s1,36(sp)
	sw	s0,40(sp)
	lla	t2,.LANCHOR5
	lbu	t0,10(t2)
	lla	a2,.LANCHOR3
	lla	a5,.LANCHOR6
	andi	a4,t0,7
	lbu	a0,0(a2)
	lbu	a1,8(t2)
	add	a5,a5,a4
	lbu	s1,0(a5)
	li	a4,32768
	lbu	a3,6(t2)
	addi	a4,a4,-2048
	slli	a0,a0,11
	slli	a1,a1,4
	li	t1,-256
	and	a0,a0,a4
	andi	a1,a1,1792
	sra	t1,t1,s1
	li	a5,255
	sra	a5,a5,s1
	or	a0,a0,a1
	and	t1,t1,t0
	lbu	s0,5(a2)
	and	a1,a5,a3
	sw	a3,32(sp)
	add	a3,a0,t1
	lbu	t1,3(t2)
	lbu	a4,7(t2)
	lbu	t0,2(t2)
	li	s1,4096
	sw	t1,8(sp)
	slli	s0,s0,5
	lbu	t1,4(t2)
	lbu	t2,5(t2)
	and	s0,s0,s1
	andi	a1,a1,254
	andi	a2,a5,0xff
	or	a1,a1,a3
	and	a5,a5,a4
	mv	a0,s0
	sw	t2,20(sp)
	sw	t1,24(sp)
	sw	t0,28(sp)
	sw	a4,16(sp)
	sw	a5,12(sp)
	sw	a3,0(sp)
	sw	a2,4(sp)
	call	_Z7setchr1jj
	lw	a3,32(sp)
	lw	a2,4(sp)
	xori	a0,s0,1024
	ori	a1,a3,1
	lw	a3,0(sp)
	and	a1,a2,a1
	or	a1,a1,a3
	call	_Z7setchr1jj
	lw	a5,12(sp)
	lw	a3,0(sp)
	addi	a0,s1,-2048
	andi	a1,a5,254
	or	a1,a1,a3
	xor	a0,s0,a0
	call	_Z7setchr1jj
	lw	a4,16(sp)
	lw	a5,4(sp)
	lw	a3,0(sp)
	ori	a1,a4,1
	and	a1,a5,a1
	addi	a0,s1,-1024
	or	a1,a1,a3
	xor	a0,s0,a0
	call	_Z7setchr1jj
	lw	t0,28(sp)
	lw	a5,4(sp)
	lw	a3,0(sp)
	xor	a0,s0,s1
	and	a1,a5,t0
	or	a1,a1,a3
	call	_Z7setchr1jj
	lw	a5,4(sp)
	lw	t1,8(sp)
	lw	a3,0(sp)
	addi	a0,s1,1024
	and	a1,a5,t1
	or	a1,a1,a3
	xor	a0,s0,a0
	call	_Z7setchr1jj
	lw	a5,4(sp)
	lw	t1,24(sp)
	lw	a3,0(sp)
	li	s1,8192
	and	a1,a5,t1
	addi	a0,s1,-2048
	or	a1,a1,a3
	xor	a0,s0,a0
	call	_Z7setchr1jj
	lw	a5,4(sp)
	lw	t2,20(sp)
	lw	a3,0(sp)
	addi	a0,s1,-1024
	and	a1,a5,t2
	xor	a0,s0,a0
	or	a1,a1,a3
	call	_Z7setchr1jj
	lla	a2,.LANCHOR3
	lbu	a0,6(a2)
	lw	s0,40(sp)
	lw	ra,44(sp)
	lw	s1,36(sp)
	not	a0,a0
	andi	a0,a0,1
	addi	sp,sp,48
	tail	_Z9setmirrori
	.size	_ZL5CSyncv, .-_ZL5CSyncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_ZL5PSyncv
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL5CSyncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL21UNLOneBusWritePPU201Xjh,"ax",@progbits
	.align	2
	.type	_ZL21UNLOneBusWritePPU201Xjh, @function
_ZL21UNLOneBusWritePPU201Xjh:
	addi	sp,sp,-12
	andi	a0,a0,15
	lla	a5,.LANCHOR5
	sw	ra,8(sp)
	add	a5,a5,a0
	sb	a1,0(a5)
	call	_ZL5PSyncv
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL5CSyncv
	.size	_ZL21UNLOneBusWritePPU201Xjh, .-_ZL21UNLOneBusWritePPU201Xjh
	.section	.text._ZL14UNLOneBusResetv,"ax",@progbits
	.align	2
	.type	_ZL14UNLOneBusResetv, @function
_ZL14UNLOneBusResetv:
	addi	sp,sp,-12
	li	a2,16
	li	a1,0
	lla	a0,.LANCHOR3
	sw	ra,8(sp)
	la a5, .LANCHOR7; sb zero, 0(a5);
	la a5, .LANCHOR8; sb zero, 0(a5);
	la a5, .LANCHOR9; sb zero, 0(a5);
	call	memset
	li	a2,16
	li	a1,0
	lla	a0,.LANCHOR5
	call	memset
	li	a2,64
	li	a1,0
	lla	a0,.LANCHOR1
	call	memset
	call	_ZL5PSyncv
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL5CSyncv
	.size	_ZL14UNLOneBusResetv, .-_ZL14UNLOneBusResetv
	.section	.text._ZL14UNLOneBusPowerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLOneBusPowerv, @function
_ZL14UNLOneBusPowerv:
	addi	sp,sp,-20
	li	a2,16
	li	a1,0
	lla	a0,.LANCHOR3
	sw	ra,16(sp)
	sw	s0,12(sp)
	sw	s1,8(sp)
	la a5, .LANCHOR7; sb zero, 0(a5);
	la a5, .LANCHOR8; sb zero, 0(a5);
	la a5, .LANCHOR9; sb zero, 0(a5);
	call	memset
	li	a2,16
	li	a1,0
	lla	a0,.LANCHOR5
	call	memset
	li	a2,64
	li	a1,0
	lla	a0,.LANCHOR1
	call	memset
	li	a3,0
	la a2, PRGsize; lw a2, 0(a2);
	la a1, PRGptr; lw a1, 0(a1);
	li	a0,0
	call	_Z19SetupCartCHRMappingiPhji
	lla	s0,.LANCHOR0
	lla	a4,.LANCHOR10
	li	s1,0
.L25:
	li	a5,16384
	or	a3,s1,a5
	mv	a0,a3
	sw	a4,4(sp)
	sw	a3,0(sp)
	call	_Z14GetReadHandleri
	lw	a3,0(sp)
	mv	a2,a0
	sw	a2,0(s0)
	mv	a0,a3
	call	_Z15GetWriteHandleri
	lw	a4,4(sp)
	addi	s1,s1,1
	li	a3,64
	sw	a0,0(a4)
	addi	s0,s0,4
	addi	a4,a4,4
	bne	s1,a3,.L25
	li	s1,16384
	addi	a1,s1,63
	lla	a2,_ZL20UNLOneBusReadAPU40XXj
	li	a0,16384
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s1,63
	lla	a2,_ZL21UNLOneBusWriteAPU40XXjh
	li	a0,16384
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a0,8192
	addi	a1,a0,31
	lla	a2,_ZL21UNLOneBusWritePPU201Xjh
	addi	a0,a0,16
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s1,271
	addi	a0,s1,256
	lla	a2,_ZL21UNLOneBusWriteCPU410Xjh
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_ZL18UNLOneBusWriteMMC3jh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	call	_ZL5PSyncv
	lw	s0,12(sp)
	lw	ra,16(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	tail	_ZL5CSyncv
	.size	_ZL14UNLOneBusPowerv, .-_ZL14UNLOneBusPowerv
	.section	.text._ZL18UNLOneBusWriteMMC3jh,"ax",@progbits
	.align	2
	.type	_ZL18UNLOneBusWriteMMC3jh, @function
_ZL18UNLOneBusWriteMMC3jh:
	li	a3,57344
	addi	a4,a3,1
	and	a0,a0,a4
	li	a5,49152
	beq	a0,a5,.L29
	addi	sp,sp,-12
	sw	ra,8(sp)
	bgtu	a0,a5,.L30
	li	a5,32768
	addi	a4,a5,1
	beq	a0,a4,.L31
	li	a4,40960
	bne	a0,a4,.L51
	lw	ra,8(sp)
	la a5, .LANCHOR3+6; sb a1, 0(a5);
	addi	sp,sp,12
	tail	_ZL5CSyncv
.L30:
	beq	a0,a3,.L35
	bne	a0,a4,.L52
	li	a5,1
	la a4, .LANCHOR7; sb a5, 0(a4);
.L28:
	lw	ra,8(sp)
	addi	sp,sp,12
	jr	ra
.L52:
	addi	a5,a5,1
	bne	a0,a5,.L28
	lw	ra,8(sp)
	li	a5,1
	la a4, .LANCHOR9; sb a5, 0(a4);
	addi	sp,sp,12
	jr	ra
.L51:
	bne	a0,a5,.L28
	lla	a4,.LANCHOR3
	lbu	a5,5(a4)
	andi	a1,a1,-57
	andi	a5,a5,56
	or	a1,a5,a1
	sb	a1,5(a4)
	call	_ZL5PSyncv
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL5CSyncv
.L29:
	andi	a1,a1,-2
	la a5, .LANCHOR3+1; sb a1, 0(a5);
	ret
.L31:
	lla	a3,.LANCHOR3
	lbu	a5,5(a3)
	lla	a4,.L40
	andi	a5,a5,7
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL18UNLOneBusWriteMMC3jh,"a",@progbits
	.align	2
	.align	2
.L40:
	.word	.L38-.L40
	.word	.L46-.L40
	.word	.L45-.L40
	.word	.L44-.L40
	.word	.L43-.L40
	.word	.L42-.L40
	.word	.L41-.L40
	.word	.L39-.L40
	.section	.text._ZL18UNLOneBusWriteMMC3jh
.L35:
	li	a0,1
	call	_Z12X6502_IRQEndi
	lw	ra,8(sp)
	la a5, .LANCHOR7; sb zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L39:
	sb	a1,8(a3)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL5PSyncv
.L41:
	sb	a1,7(a3)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL5PSyncv
.L42:
	lw	ra,8(sp)
	la a5, .LANCHOR5+5; sb a1, 0(a5);
	addi	sp,sp,12
	tail	_ZL5CSyncv
.L43:
	lw	ra,8(sp)
	la a5, .LANCHOR5+4; sb a1, 0(a5);
	addi	sp,sp,12
	tail	_ZL5CSyncv
.L44:
	lw	ra,8(sp)
	la a5, .LANCHOR5+3; sb a1, 0(a5);
	addi	sp,sp,12
	tail	_ZL5CSyncv
.L45:
	lw	ra,8(sp)
	la a5, .LANCHOR5+2; sb a1, 0(a5);
	addi	sp,sp,12
	tail	_ZL5CSyncv
.L46:
	lw	ra,8(sp)
	la a5, .LANCHOR5+7; sb a1, 0(a5);
	addi	sp,sp,12
	tail	_ZL5CSyncv
.L38:
	lw	ra,8(sp)
	la a5, .LANCHOR5+6; sb a1, 0(a5);
	addi	sp,sp,12
	tail	_ZL5CSyncv
	.size	_ZL18UNLOneBusWriteMMC3jh, .-_ZL18UNLOneBusWriteMMC3jh
	.section	.text._ZL21UNLOneBusWriteAPU40XXjh,"ax",@progbits
	.align	2
	.type	_ZL21UNLOneBusWriteAPU40XXjh, @function
_ZL21UNLOneBusWriteAPU40XXjh:
	addi	sp,sp,-16
	sw	s0,8(sp)
	lla	a5,.LANCHOR1
	andi	s0,a0,63
	sw	s1,4(sp)
	add	a4,a5,s0
	sw	ra,12(sp)
	sb	a1,0(a4)
	li	a4,19
	mv	s1,a0
	beq	s0,a4,.L54
	li	a4,21
	beq	s0,a4,.L55
	li	a4,18
	beq	s0,a4,.L75
.L56:
	slli	s0,s0,2
	lla	a5,.LANCHOR10
	add	a5,a5,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	a5,0(a5)
	mv	a0,s1
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	a5
.L54:
	lbu	a5,48(a5)
	andi	a5,a5,16
	beq	a5,zero,.L56
	slli	a5,a1,4
	addi	a5,a5,1
	la a4, .LANCHOR12; sh a5, 0(a4);
	j	.L56
.L75:
	lbu	a5,48(a5)
	andi	a5,a5,16
	beq	a5,zero,.L56
	slli	a5,a1,6
	la a4, .LANCHOR11; sh a5, 0(a4);
	j	.L56
.L55:
	lbu	a5,48(a5)
	andi	a5,a5,16
	beq	a5,zero,.L56
	andi	a5,a1,16
	lla	a4,.LANCHOR13
	sb	a5,0(a4)
	la a3, .LANCHOR2; lbu a3, 0(a3);
	bne	a3,zero,.L76
.L57:
	beq	a5,zero,.L58
	la a5, .LANCHOR15; lhu a5, 0(a5);
	la a4, .LANCHOR14; sh a5, 0(a4);
.L58:
	andi	a1,a1,239
	j	.L56
.L76:
	li	a0,1
	sw	a1,0(sp)
	call	_Z12X6502_IRQEndi
	lla	a4,.LANCHOR13
	lbu	a5,0(a4)
	lw	a1,0(sp)
	la a4, .LANCHOR2; sb zero, 0(a4);
	j	.L57
	.size	_ZL21UNLOneBusWriteAPU40XXjh, .-_ZL21UNLOneBusWriteAPU40XXjh
	.section	.text._ZL16UNLOneBusIRQHookv,"ax",@progbits
	.align	2
	.type	_ZL16UNLOneBusIRQHookv, @function
_ZL16UNLOneBusIRQHookv:
	lla	a4,.LANCHOR8
	lbu	a5,0(a4)
	beq	a5,zero,.L78
	la a3, .LANCHOR9; lbu a3, 0(a3);
	beq	a3,zero,.L85
	la a5, .LANCHOR3+1; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, .LANCHOR9; sb zero, 0(a4);
.L81:
	bne	a5,zero,.L77
	la a5, .LANCHOR7; lbu a5, 0(a5);
	bne	a5,zero,.L86
.L77:
	ret
.L78:
	la a5, .LANCHOR3+1; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a5, .LANCHOR9; sb zero, 0(a5);
	ret
.L85:
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	j	.L81
.L86:
	li	a0,1
	tail	_Z14X6502_IRQBegini
	.size	_ZL16UNLOneBusIRQHookv, .-_ZL16UNLOneBusIRQHookv
	.section	.text._ZL16UNLOneBusCpuHooki,"ax",@progbits
	.align	2
	.type	_ZL16UNLOneBusCpuHooki, @function
_ZL16UNLOneBusCpuHooki:
	la a5, .LANCHOR13; lbu a5, 0(a5);
	beq	a5,zero,.L93
	lla	a4,.LANCHOR14
	lhu	a5,0(a4)
	sub	a0,a5,a0
	slli	a5,a0,16
	srai	a5,a5,16
	slli	a0,a0,16
	sh	a5,0(a4)
	srli	a0,a0,16
	ble	a5,zero,.L95
.L93:
	ret
.L95:
	lla	a3,.LANCHOR12
	lhu	a5,0(a3)
	la a2, .LANCHOR15; lhu a2, 0(a2);
	add	a0,a0,a2
	addi	a5,a5,-1
	slli	a5,a5,16
	srai	a5,a5,16
	sh	a0,0(a4)
	sh	a5,0(a3)
	blt	a5,zero,.L96
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR11
	lhu	a5,0(s0)
	la a0, .LANCHOR1+48; lbu a0, 0(a0);
	xori	a0,a0,3
	slli	a0,a0,14
	or	a0,a0,a5
	slli	a0,a0,16
	srli	a0,a0,16
	sw	ra,8(sp)
	call	_Z5readbi
	srli	a1,a0,1
	li	a0,16384
	la a5, .LANCHOR10+68; lw a5, 0(a5);
	andi	a1,a1,0xff
	addi	a0,a0,17
	jalr	a5
	lhu	a5,0(s0)
	lw	ra,8(sp)
	addi	a5,a5,1
	slli	a5,a5,17
	srli	a5,a5,17
	sh	a5,0(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L96:
	li	a5,-128
	la a4, .LANCHOR2; sb a5, 0(a4);
	li	a0,1
	la a5, .LANCHOR13; sb zero, 0(a5);
	tail	_Z14X6502_IRQBegini
	.size	_ZL16UNLOneBusCpuHooki, .-_ZL16UNLOneBusCpuHooki
	.section	.text._ZL21UNLOneBusWriteCPU410Xjh,"ax",@progbits
	.align	2
	.type	_ZL21UNLOneBusWriteCPU410Xjh, @function
_ZL21UNLOneBusWriteCPU410Xjh:
	addi	sp,sp,-12
	sw	ra,8(sp)
	andi	a5,a0,15
	li	a4,3
	beq	a5,a4,.L98
	andi	a0,a0,12
	bne	a0,zero,.L99
	li	a4,1
	beq	a5,a4,.L100
	li	a3,2
	bne	a5,a3,.L102
	lw	ra,8(sp)
	la a5, .LANCHOR9; sb a4, 0(a5);
	addi	sp,sp,12
	jr	ra
.L99:
	li	a4,4
	bne	a5,a4,.L102
	lw	ra,8(sp)
	li	a5,1
	la a4, .LANCHOR7; sb a5, 0(a4);
	addi	sp,sp,12
	jr	ra
.L98:
	li	a0,1
	call	_Z12X6502_IRQEndi
	lw	ra,8(sp)
	la a5, .LANCHOR7; sb zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L102:
	lla	a4,.LANCHOR3
	add	a5,a4,a5
	sb	a1,0(a5)
	call	_ZL5PSyncv
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL5CSyncv
.L100:
	lw	ra,8(sp)
	andi	a1,a1,-2
	la a5, .LANCHOR3+1; sb a1, 0(a5);
	addi	sp,sp,12
	jr	ra
	.size	_ZL21UNLOneBusWriteCPU410Xjh, .-_ZL21UNLOneBusWriteCPU410Xjh
	.section	.text._Z14UNLOneBus_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLOneBus_InitP8CartInfo
	.hidden	_Z14UNLOneBus_InitP8CartInfo
	.type	_Z14UNLOneBus_InitP8CartInfo, @function
_Z14UNLOneBus_InitP8CartInfo:
	lla	a5,_ZL14UNLOneBusPowerv
	sw	a5,0(a0)
	lw	a4,76(a0)
	lla	a5,_ZL14UNLOneBusResetv
	sw	a5,4(a0)
	li	a5,811585536
	addi	a5,a5,-573
	beq	a4,a5,.L107
	li	a5,1790955520
	addi	a5,a5,-370
	beq	a4,a5,.L107
.L108:
	lla	a5,_ZL16UNLOneBusIRQHookv
	la a4, GameHBIRQHook; sw a5, 0(a4);
	lla	a5,_ZL16UNLOneBusCpuHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR16
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
.L107:
	li	a5,15
	la a4, .LANCHOR4; sb a5, 0(a4);
	j	.L108
	.size	_Z14UNLOneBus_InitP8CartInfo, .-_Z14UNLOneBus_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REGC"
	.align	2
.LC1:
	.string	"REGS"
	.align	2
.LC2:
	.string	"REGA"
	.align	2
.LC3:
	.string	"IRQR"
	.align	2
.LC4:
	.string	"IRQC"
	.align	2
.LC5:
	.string	"IRQA"
	.align	2
.LC6:
	.string	"PCME"
	.align	2
.LC7:
	.string	"PCMI"
	.align	2
.LC8:
	.string	"PCMA"
	.align	2
.LC9:
	.string	"PCMS"
	.align	2
.LC10:
	.string	"PCML"
	.align	2
.LC11:
	.string	"PCMC"
	.section	.bss._ZL10defapuread,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL10defapuread, @object
	.size	_ZL10defapuread, 256
_ZL10defapuread:
	.zero	256
	.section	.bss._ZL11defapuwrite,"aw",@nobits
	.align	2
	.set	.LANCHOR10,. + 0
	.type	_ZL11defapuwrite, @object
	.size	_ZL11defapuwrite, 256
_ZL11defapuwrite:
	.zero	256
	.section	.bss._ZL7apu40xx,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL7apu40xx, @object
	.size	_ZL7apu40xx, 64
_ZL7apu40xx:
	.zero	64
	.section	.bss._ZL7cpu410x,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL7cpu410x, @object
	.size	_ZL7cpu410x, 16
_ZL7cpu410x:
	.zero	16
	.section	.bss._ZL7ppu201x,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL7ppu201x, @object
	.size	_ZL7ppu201x, 16
_ZL7ppu201x:
	.zero	16
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR16,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 156
_ZL9StateRegs:
	.word	_ZL7cpu410x
	.word	16
	.word	.LC0
	.word	_ZL7ppu201x
	.word	16
	.word	.LC1
	.word	_ZL7apu40xx
	.word	64
	.word	.LC2
	.word	_ZL9IRQReload
	.word	1
	.word	.LC3
	.word	_ZL8IRQCount
	.word	1
	.word	.LC4
	.word	_ZL4IRQa
	.word	1
	.word	.LC5
	.word	_ZL10pcm_enable
	.word	1
	.word	.LC6
	.word	_ZL7pcm_irq
	.word	1
	.word	.LC7
	.word	_ZL8pcm_addr
	.word	2
	.word	.LC8
	.word	_ZL8pcm_size
	.word	2
	.word	.LC9
	.word	_ZL9pcm_latch
	.word	2
	.word	.LC10
	.word	_ZL9pcm_clock
	.word	2
	.word	.LC11
	.word	0
	.zero	8
	.section	.sbss._ZL10pcm_enable,"aw",@nobits
	.set	.LANCHOR13,. + 0
	.type	_ZL10pcm_enable, @object
	.size	_ZL10pcm_enable, 1
_ZL10pcm_enable:
	.zero	1
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR7,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL7pcm_irq,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL7pcm_irq, @object
	.size	_ZL7pcm_irq, 1
_ZL7pcm_irq:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.set	.LANCHOR8,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 1
_ZL8IRQCount:
	.zero	1
	.section	.sbss._ZL8inv_hack,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL8inv_hack, @object
	.size	_ZL8inv_hack, 1
_ZL8inv_hack:
	.zero	1
	.section	.sbss._ZL8pcm_addr,"aw",@nobits
	.align	1
	.set	.LANCHOR11,. + 0
	.type	_ZL8pcm_addr, @object
	.size	_ZL8pcm_addr, 2
_ZL8pcm_addr:
	.zero	2
	.section	.sbss._ZL8pcm_size,"aw",@nobits
	.align	1
	.set	.LANCHOR12,. + 0
	.type	_ZL8pcm_size, @object
	.size	_ZL8pcm_size, 2
_ZL8pcm_size:
	.zero	2
	.section	.sbss._ZL9IRQReload,"aw",@nobits
	.set	.LANCHOR9,. + 0
	.type	_ZL9IRQReload, @object
	.size	_ZL9IRQReload, 1
_ZL9IRQReload:
	.zero	1
	.section	.sbss._ZL9pcm_latch,"aw",@nobits
	.align	1
	.set	.LANCHOR14,. + 0
	.type	_ZL9pcm_latch, @object
	.size	_ZL9pcm_latch, 2
_ZL9pcm_latch:
	.zero	2
	.section	.sdata._ZL9pcm_clock,"aw"
	.align	1
	.set	.LANCHOR15,. + 0
	.type	_ZL9pcm_clock, @object
	.size	_ZL9pcm_clock, 2
_ZL9pcm_clock:
	.half	225
	.section	.srodata._ZZL5CSyncvE4midx,"a"
	.align	2
	.set	.LANCHOR6,. + 0
	.type	_ZZL5CSyncvE4midx, @object
	.size	_ZZL5CSyncvE4midx, 8
_ZZL5CSyncvE4midx:
	.string	""
	.string	"\001\002"
	.string	"\003\004\005"
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
