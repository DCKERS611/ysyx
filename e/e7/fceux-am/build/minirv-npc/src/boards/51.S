#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"51.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR1
	lbu	a5,0(s1)
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lbu	a1,0(s0)
	sw	ra,8(sp)
	andi	a5,a5,2
	slli	a1,a1,2
	beq	a5,zero,.L2
	andi	a1,a1,28
	ori	a1,a1,35
	li	a0,24576
	call	_Z7setprg8jj
	lbu	a1,0(s0)
	li	a0,32768
	slli	a1,a1,1
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	li	a0,49152
	slli	a1,a1,1
	ori	a1,a1,1
	call	_Z8setprg16jj
	lbu	a4,0(s1)
	li	a5,18
	beq	a4,a5,.L8
.L4:
	li	a0,1
	call	_Z9setmirrori
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
.L2:
	andi	a1,a1,16
	ori	a1,a1,47
	li	a0,24576
	call	_Z7setprg8jj
	lbu	a1,0(s0)
	lbu	a5,0(s1)
	li	a0,32768
	slli	a1,a1,1
	srli	a5,a5,4
	or	a1,a1,a5
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	li	a0,49152
	slli	a1,a1,1
	andi	a1,a1,24
	ori	a1,a1,7
	call	_Z8setprg16jj
	lbu	a4,0(s1)
	li	a5,18
	bne	a4,a5,.L4
.L8:
	li	a0,0
	call	_Z9setmirrori
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M51Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M51Resetv, @function
_ZL8M51Resetv:
	la a5, .LANCHOR0; sb zero, 0(a5);
	li	a5,2
	la a4, .LANCHOR1; sb a5, 0(a4);
	tail	_ZL4Syncv
	.size	_ZL8M51Resetv, .-_ZL8M51Resetv
	.section	.text._ZL12M51WriteBankjh,"ax",@progbits
	.align	2
	.type	_ZL12M51WriteBankjh, @function
_ZL12M51WriteBankjh:
	andi	a5,a1,15
	la a4, .LANCHOR0; sb a5, 0(a4);
	li	a5,16384
	and	a0,a0,a5
	beq	a0,zero,.L12
	lla	a4,.LANCHOR1
	lbu	a5,0(a4)
	andi	a1,a1,16
	andi	a5,a5,2
	or	a5,a5,a1
	sb	a5,0(a4)
.L12:
	tail	_ZL4Syncv
	.size	_ZL12M51WriteBankjh, .-_ZL12M51WriteBankjh
	.section	.text._ZL12M51WriteModejh,"ax",@progbits
	.align	2
	.type	_ZL12M51WriteModejh, @function
_ZL12M51WriteModejh:
	andi	a1,a1,18
	la a5, .LANCHOR1; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL12M51WriteModejh, .-_ZL12M51WriteModejh
	.section	.text._ZL8M51Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M51Powerv, @function
_ZL8M51Powerv:
	la a5, .LANCHOR0; sb zero, 0(a5);
	addi	sp,sp,-12
	li	a5,2
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a4, .LANCHOR1; sb a5, 0(a4);
	call	_ZL4Syncv
	li	a1,32768
	lla	a2,_ZL12M51WriteModejh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL12M51WriteBankjh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_Z6CartBRj
	li	a0,24576
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL8M51Powerv, .-_ZL8M51Powerv
	.section	.text._Z13Mapper51_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper51_InitP8CartInfo
	.hidden	_Z13Mapper51_InitP8CartInfo
	.type	_Z13Mapper51_InitP8CartInfo, @function
_Z13Mapper51_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,_ZL8M51Powerv
	sw	a5,0(a0)
	lla	a5,_ZL8M51Resetv
	sw	a5,4(a0)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR2
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	addi	sp,sp,12
	jr	ra
	.size	_Z13Mapper51_InitP8CartInfo, .-_Z13Mapper51_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"BANK"
	.align	2
.LC1:
	.string	"MODE"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL4bank
	.word	1
	.word	.LC0
	.word	_ZL4mode
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL4bank,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL4bank, @object
	.size	_ZL4bank, 1
_ZL4bank:
	.zero	1
	.section	.sbss._ZL4mode,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL4mode, @object
	.size	_ZL4mode, 1
_ZL4mode:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
