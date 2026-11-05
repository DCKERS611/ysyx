#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lh53.cpp"
	.option nopic
	.text
	.section	.text._ZL12LH53RamWritejh,"ax",@progbits
	.align	2
	.type	_ZL12LH53RamWritejh, @function
_ZL12LH53RamWritejh:
	li	a5,-45056
	addi	a5,a5,-2048
	add	a0,a0,a5
	slli	a0,a0,19
	srli	a0,a0,19
	la a5, .LANCHOR0; lw a5, 0(a5);
	add	a5,a5,a0
	sb	a1,0(a5)
	ret
	.size	_ZL12LH53RamWritejh, .-_ZL12LH53RamWritejh
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	li	a0,0
	sw	ra,8(sp)
	call	_Z7setchr8j
	la a1, .LANCHOR1; lbu a1, 0(a1);
	li	a0,24576
	call	_Z7setprg8jj
	li	a1,12
	li	a0,32768
	call	_Z7setprg8jj
	li	a1,26
	li	a0,40960
	call	_Z7setprg4jj
	li	a1,54
	li	a0,45056
	call	_Z7setprg2jj
	li	a1,49152
	li	a2,4
	addi	a1,a1,-2048
	li	a0,16
	call	_Z8setprg2rijj
	li	a2,5
	li	a1,49152
	li	a0,16
	call	_Z8setprg2rijj
	li	a1,53248
	li	a2,6
	addi	a1,a1,-2048
	li	a0,16
	call	_Z8setprg2rijj
	li	a2,7
	li	a1,53248
	li	a0,16
	call	_Z8setprg2rijj
	li	a0,57344
	li	a1,59
	addi	a0,a0,-2048
	call	_Z7setprg2jj
	lw	ra,8(sp)
	li	a1,15
	li	a0,57344
	addi	sp,sp,12
	tail	_Z7setprg8jj
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9LH53Writejh,"ax",@progbits
	.align	2
	.type	_ZL9LH53Writejh, @function
_ZL9LH53Writejh:
	la a5, .LANCHOR1; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL9LH53Writejh, .-_ZL9LH53Writejh
	.section	.text._ZL9LH53Closev,"ax",@progbits
	.align	2
	.type	_ZL9LH53Closev, @function
_ZL9LH53Closev:
	la a0, .LANCHOR0; lw a0, 0(a0);
	beq	a0,zero,.L13
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR0; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L13:
	la a5, .LANCHOR0; sw zero, 0(a5);
	ret
	.size	_ZL9LH53Closev, .-_ZL9LH53Closev
	.section	.text._ZL9LH53Powerv,"ax",@progbits
	.align	2
	.type	_ZL9LH53Powerv, @function
_ZL9LH53Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_ZL4Syncv
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,53248
	li	a0,49152
	lla	a2,_ZL12LH53RamWritejh
	addi	a1,a1,2047
	addi	a0,a0,-2048
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,61440
	lla	a2,_ZL13LH53IRQaWritejh
	addi	a1,a1,-1
	li	a0,57344
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_ZL9LH53Writejh
	li	a0,61440
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR2; lw a0, 0(a0);
	la a2, .LANCHOR0; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL9LH53Powerv, .-_ZL9LH53Powerv
	.section	.text._ZL13LH53IRQaWritejh,"ax",@progbits
	.align	2
	.type	_ZL13LH53IRQaWritejh, @function
_ZL13LH53IRQaWritejh:
	andi	a1,a1,2
	la a5, .LANCHOR3; sb a1, 0(a5);
	la a5, .LANCHOR4; sw zero, 0(a5);
	beq	a1,zero,.L20
	ret
.L20:
	li	a0,1
	tail	_Z12X6502_IRQEndi
	.size	_ZL13LH53IRQaWritejh, .-_ZL13LH53IRQaWritejh
	.section	.text._ZL7LH53IRQi,"ax",@progbits
	.align	2
	.type	_ZL7LH53IRQi, @function
_ZL7LH53IRQi:
	la a5, .LANCHOR3; lbu a5, 0(a5);
	beq	a5,zero,.L21
	lla	a4,.LANCHOR4
	lw	a3,0(a4)
	li	a5,8192
	addi	a5,a5,-632
	add	a0,a0,a3
	sw	a0,0(a4)
	bgt	a0,a5,.L25
.L21:
	ret
.L25:
	li	a0,1
	tail	_Z14X6502_IRQBegini
	.size	_ZL7LH53IRQi, .-_ZL7LH53IRQi
	.section	.rodata._Z9LH53_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z9LH53_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z9LH53_InitP8CartInfo
	.hidden	_Z9LH53_InitP8CartInfo
	.type	_Z9LH53_InitP8CartInfo, @function
_Z9LH53_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL9LH53Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9LH53Closev
	sw	a5,8(a0)
	lla	a5,_ZL7LH53IRQi
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	s0,.LANCHOR2
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR0
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
	lla	a0,.LANCHOR5
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z9LH53_InitP8CartInfo, .-_Z9LH53_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"REG"
	.align	2
.LC2:
	.string	"IRQA"
	.align	2
.LC3:
	.string	"IRQC"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL3reg
	.word	1
	.word	.LC1
	.word	_ZL4IRQa
	.word	1
	.word	.LC2
	.word	_ZL8IRQCount
	.word	4
	.word	.LC3
	.word	0
	.zero	8
	.section	.sbss._ZL3reg,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
