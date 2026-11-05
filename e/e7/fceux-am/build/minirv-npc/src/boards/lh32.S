#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lh32.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	la a1, .LANCHOR0; lbu a1, 0(a1);
	li	a0,24576
	sw	ra,8(sp)
	call	_Z7setprg8jj
	li	a1,-4
	li	a0,32768
	call	_Z7setprg8jj
	li	a1,-3
	li	a0,40960
	call	_Z7setprg8jj
	li	a2,0
	li	a1,49152
	li	a0,16
	call	_Z8setprg8rijj
	li	a0,57344
	li	a1,-1
	call	_Z7setprg8jj
	lw	ra,8(sp)
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
	.section	.text._ZL9LH32Writejh,"ax",@progbits
	.align	2
	.type	_ZL9LH32Writejh, @function
_ZL9LH32Writejh:
	la a5, .LANCHOR0; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL9LH32Writejh, .-_ZL9LH32Writejh
	.section	.text._ZL9LH32Closev,"ax",@progbits
	.align	2
	.type	_ZL9LH32Closev, @function
_ZL9LH32Closev:
	la a0, .LANCHOR1; lw a0, 0(a0);
	beq	a0,zero,.L12
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR1; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L12:
	la a5, .LANCHOR1; sw zero, 0(a5);
	ret
	.size	_ZL9LH32Closev, .-_ZL9LH32Closev
	.section	.text._ZL9LH32Powerv,"ax",@progbits
	.align	2
	.type	_ZL9LH32Powerv, @function
_ZL9LH32Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_ZL4Syncv
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,57344
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,49152
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a2,_ZL9LH32Writejh
	li	a1,24576
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	la a0, .LANCHOR2; lw a0, 0(a0);
	la a2, .LANCHOR1; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL9LH32Powerv, .-_ZL9LH32Powerv
	.section	.rodata._Z9LH32_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z9LH32_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z9LH32_InitP8CartInfo
	.hidden	_Z9LH32_InitP8CartInfo
	.type	_Z9LH32_InitP8CartInfo, @function
_Z9LH32_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL9LH32Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9LH32Closev
	lla	s0,.LANCHOR2
	sw	a5,8(a0)
	li	a5,8192
	li	a0,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR1
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
	.size	_Z9LH32_InitP8CartInfo, .-_Z9LH32_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"REG"
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
	.set	.LANCHOR0,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
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
