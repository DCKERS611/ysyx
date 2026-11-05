#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"bmc13in1jy110.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	la a5, .LANCHOR0; lbu a5, 0(a5);
	andi	a5,a5,7
	li	a4,5
	bgtu	a5,a4,.L1
	lla	a4,.L4
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	addi	sp,sp,-12
	sw	ra,8(sp)
	add	a5,a5,a4
	sw	s0,4(sp)
	sw	s1,0(sp)
	jr	a5
	.section	.rodata._ZL4Syncv,"a",@progbits
	.align	2
	.align	2
.L4:
	.word	.L9-.L4
	.word	.L8-.L4
	.word	.L10-.L4
	.word	.L6-.L4
	.word	.L11-.L4
	.word	.L3-.L4
	.section	.text._ZL4Syncv
.L11:
	lla	s0,.LANCHOR1
.L5:
	lbu	a1,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	andi	a1,a1,7
	li	a0,32768
	addi	a1,a1,8
	addi	sp,sp,12
	tail	_Z8setprg32jj
.L10:
	lla	s0,.LANCHOR2
.L7:
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,2
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	call	_Z7setprg8jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a1,-1
	li	a0,57344
	addi	sp,sp,12
	tail	_Z7setprg8jj
.L6:
	lla	s0,.LANCHOR2
	lbu	a1,0(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	call	_Z7setprg8jj
	lbu	a1,3(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,57344
	addi	sp,sp,12
	tail	_Z7setprg8jj
.L3:
	lla	s1,.LANCHOR1
	lbu	a5,0(s1)
	lla	s0,.LANCHOR2
	lbu	a1,1(s0)
	andi	a5,a5,7
	addi	a5,a5,8
	srai	a5,a5,1
	add	a1,a5,a1
	li	a0,32768
	call	_Z8setprg16jj
	lbu	a5,0(s1)
	lbu	a1,3(s0)
	li	a0,49152
	andi	a5,a5,7
	addi	a5,a5,8
	srai	a5,a5,1
	add	a1,a5,a1
	call	_Z8setprg16jj
	j	.L7
.L9:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	la a1, .LANCHOR1; lbu a1, 0(a1);
	andi	a1,a1,7
	li	a0,32768
	addi	sp,sp,12
	tail	_Z8setprg32jj
.L8:
	lla	s0,.LANCHOR1
	lbu	a5,0(s0)
	la a1, .LANCHOR2+1; lbu a1, 0(a1);
	li	a0,32768
	andi	a5,a5,7
	addi	a5,a5,8
	srai	a5,a5,1
	add	a1,a5,a1
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	li	a0,49152
	srli	a1,a1,1
	andi	a1,a1,3
	call	_Z8setprg16jj
	j	.L5
.L1:
	ret
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL18BMC13in1JY110Powerv,"ax",@progbits
	.align	2
	.type	_ZL18BMC13in1JY110Powerv, @function
_ZL18BMC13in1JY110Powerv:
	addi	sp,sp,-12
	li	a1,0
	li	a0,32768
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR2; sw zero, 0(a5);
	la a5, .LANCHOR0; sb zero, 0(a5);
	la a5, .LANCHOR1; sb zero, 0(a5);
	call	_Z8setprg32jj
	li	a0,0
	call	_Z7setchr8j
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL18BMC13in1JY110Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_Z6CartBRj
	li	a0,32768
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL18BMC13in1JY110Powerv, .-_ZL18BMC13in1JY110Powerv
	.section	.text._ZL18BMC13in1JY110Writejh,"ax",@progbits
	.align	2
	.type	_ZL18BMC13in1JY110Writejh, @function
_ZL18BMC13in1JY110Writejh:
	li	a5,53248
	addi	a4,a5,1
	beq	a0,a4,.L22
	bgtu	a0,a4,.L23
	li	a4,32768
	addi	a3,a4,3
	bleu	a0,a3,.L32
	bne	a0,a5,.L30
	la a5, .LANCHOR0; sb a1, 0(a5);
.L30:
	tail	_ZL4Syncv
.L32:
	bltu	a0,a4,.L30
	andi	a0,a0,3
	lla	a5,.LANCHOR2
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
.L23:
	addi	a5,a5,3
	bne	a0,a5,.L30
	la a5, .LANCHOR1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L22:
	addi	sp,sp,-12
	andi	a0,a1,3
	sw	ra,8(sp)
	call	_Z9setmirrori
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
	.size	_ZL18BMC13in1JY110Writejh, .-_ZL18BMC13in1JY110Writejh
	.section	.text._Z18BMC13in1JY110_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z18BMC13in1JY110_InitP8CartInfo
	.hidden	_Z18BMC13in1JY110_InitP8CartInfo
	.type	_Z18BMC13in1JY110_InitP8CartInfo, @function
_Z18BMC13in1JY110_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,_ZL18BMC13in1JY110Powerv
	sw	a5,0(a0)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR3
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	addi	sp,sp,12
	jr	ra
	.size	_Z18BMC13in1JY110_InitP8CartInfo, .-_Z18BMC13in1JY110_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"BNM"
	.align	2
.LC1:
	.string	"BMV"
	.align	2
.LC2:
	.string	"PRGB"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL9bank_mode
	.word	1
	.word	.LC0
	.word	_ZL10bank_value
	.word	1
	.word	.LC1
	.word	_ZL4prgb
	.word	4
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL10bank_value,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL10bank_value, @object
	.size	_ZL10bank_value, 1
_ZL10bank_value:
	.zero	1
	.section	.sbss._ZL4prgb,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL4prgb, @object
	.size	_ZL4prgb, 4
_ZL4prgb:
	.zero	4
	.section	.sbss._ZL9bank_mode,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL9bank_mode, @object
	.size	_ZL9bank_mode, 1
_ZL9bank_mode:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
