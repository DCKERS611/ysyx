#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ks7012.cpp"
	.option nopic
	.text
	.section	.text._ZL14UNLKS7012Closev,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7012Closev, @function
_ZL14UNLKS7012Closev:
	la a0, .LANCHOR0; lw a0, 0(a0);
	beq	a0,zero,.L7
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR0; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L7:
	la a5, .LANCHOR0; sw zero, 0(a5);
	ret
	.size	_ZL14UNLKS7012Closev, .-_ZL14UNLKS7012Closev
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	addi	sp,sp,-12
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,8(sp)
	call	_Z8setprg8rijj
	la a1, .LANCHOR1; lbu a1, 0(a1);
	li	a0,32768
	andi	a1,a1,1
	call	_Z8setprg32jj
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL14UNLKS7012Resetv,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7012Resetv, @function
_ZL14UNLKS7012Resetv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	li	a5,-1
	lla	s0,.LANCHOR1
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,8(sp)
	sb	a5,0(s0)
	call	_Z8setprg8rijj
	lbu	a1,0(s0)
	li	a0,32768
	andi	a1,a1,1
	call	_Z8setprg32jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL14UNLKS7012Resetv, .-_ZL14UNLKS7012Resetv
	.section	.text._ZL14UNLKS7012Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7012Powerv, @function
_ZL14UNLKS7012Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	li	a5,-1
	sw	s0,4(sp)
	li	a2,0
	lla	s0,.LANCHOR1
	li	a1,24576
	li	a0,16
	sb	a5,0(s0)
	call	_Z8setprg8rijj
	lbu	a1,0(s0)
	li	a0,32768
	li	s0,32768
	andi	a1,a1,1
	call	_Z8setprg32jj
	li	a0,0
	call	_Z7setchr8j
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
	lla	a2,_ZL14UNLKS7012Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR2; lw a0, 0(a0);
	la a2, .LANCHOR0; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL14UNLKS7012Powerv, .-_ZL14UNLKS7012Powerv
	.section	.text._ZL14UNLKS7012Writejh,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7012Writejh, @function
_ZL14UNLKS7012Writejh:
	addi	sp,sp,-12
	li	a5,57344
	sw	ra,8(sp)
	sw	s0,4(sp)
	addi	a5,a5,160
	beq	a0,a5,.L18
	li	a5,61440
	addi	a5,a5,-458
	beq	a0,a5,.L19
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L18:
	li	a1,24576
	li	a2,0
	li	a0,16
	la a5, .LANCHOR1; sb zero, 0(a5);
	call	_Z8setprg8rijj
	la a1, .LANCHOR1; lbu a1, 0(a1);
.L23:
	li	a0,32768
	andi	a1,a1,1
	call	_Z8setprg32jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
.L19:
	lla	s0,.LANCHOR1
	li	a1,24576
	li	a5,1
	li	a2,0
	li	a0,16
	sb	a5,0(s0)
	call	_Z8setprg8rijj
	lbu	a1,0(s0)
	j	.L23
	.size	_ZL14UNLKS7012Writejh, .-_ZL14UNLKS7012Writejh
	.section	.rodata._Z14UNLKS7012_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z14UNLKS7012_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLKS7012_InitP8CartInfo
	.hidden	_Z14UNLKS7012_InitP8CartInfo
	.type	_Z14UNLKS7012_InitP8CartInfo, @function
_Z14UNLKS7012_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL14UNLKS7012Powerv
	sw	a5,0(a0)
	lla	a5,_ZL14UNLKS7012Resetv
	sw	a5,4(a0)
	lla	a5,_ZL14UNLKS7012Closev
	lla	s0,.LANCHOR2
	sw	a5,8(a0)
	li	a5,8192
	li	a0,8192
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
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR3
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14UNLKS7012_InitP8CartInfo, .-_Z14UNLKS7012_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"REGS"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL3reg
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL3reg,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
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
