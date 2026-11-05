#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"246.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	li	a1,28672
	addi	sp,sp,-12
	li	a2,0
	addi	a1,a1,-2048
	li	a0,16
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z8setprg2rijj
	lla	s0,.LANCHOR0
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
	li	a0,57344
	call	_Z7setprg8jj
	lbu	a1,4(s0)
	li	a0,0
	call	_Z7setchr2jj
	lbu	a1,5(s0)
	li	a0,4096
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lbu	a1,6(s0)
	li	a0,4096
	call	_Z7setchr2jj
	lbu	a1,7(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,8192
	addi	a0,a0,-2048
	addi	sp,sp,12
	tail	_Z7setchr2jj
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M246Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M246Writejh, @function
_ZL9M246Writejh:
	andi	a0,a0,7
	lla	a5,.LANCHOR0
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.size	_ZL9M246Writejh, .-_ZL9M246Writejh
	.section	.text._ZL9M246Closev,"ax",@progbits
	.align	2
	.type	_ZL9M246Closev, @function
_ZL9M246Closev:
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
	.size	_ZL9M246Closev, .-_ZL9M246Closev
	.section	.text._ZL9M246Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M246Powerv, @function
_ZL9M246Powerv:
	addi	sp,sp,-12
	li	a5,-1
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a4, .LANCHOR0; sw a5, 0(a4);
	call	_ZL4Syncv
	li	a1,24576
	lla	a2,_ZL9M246Writejh
	addi	a1,a1,2047
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,28672
	addi	a1,s0,-1
	addi	a0,s0,-2048
	lla	a2,_Z6CartBRj
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	addi	a0,s0,-2048
	lla	a2,_Z6CartBWjh
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR2; lw a0, 0(a0);
	la a2, .LANCHOR1; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL9M246Powerv, .-_ZL9M246Powerv
	.section	.rodata._Z14Mapper246_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z14Mapper246_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper246_InitP8CartInfo
	.hidden	_Z14Mapper246_InitP8CartInfo
	.type	_Z14Mapper246_InitP8CartInfo, @function
_Z14Mapper246_InitP8CartInfo:
	addi	sp,sp,-16
	mv	a5,a0
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	lla	a4,_ZL9M246Powerv
	sw	a4,0(a5)
	li	a0,4096
	lla	a4,_ZL9M246Closev
	sw	a4,8(a5)
	lla	s0,.LANCHOR2
	lla	a4,_ZL12StateRestorei
	addi	a0,a0,-2048
	la a3, GameStateRestore; sw a4, 0(a3);
	sw	a5,0(sp)
	sw	a0,0(s0)
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
	lw	a5,0(sp)
	lw	a4,48(a5)
	beq	a4,zero,.L18
	lw	a3,0(s1)
	lw	a4,0(s0)
	sw	a3,12(a5)
	sw	a4,28(a5)
.L18:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR3
	addi	sp,sp,16
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper246_InitP8CartInfo, .-_Z14Mapper246_InitP8CartInfo
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
	.word	_ZL4regs
	.word	8
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL4regs,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4regs, @object
	.size	_ZL4regs, 8
_ZL4regs:
	.zero	8
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
