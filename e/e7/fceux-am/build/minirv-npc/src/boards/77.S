#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"77.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	andi	a1,a1,7
	call	_Z8setprg32jj
	lbu	a1,0(s0)
	li	a0,0
	srli	a1,a1,4
	call	_Z7setchr2jj
	li	a1,4096
	li	a2,2
	addi	a1,a1,-2048
	li	a0,16
	call	_Z8setchr2rijj
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a2,0
	li	a1,4096
	li	a0,16
	addi	sp,sp,12
	tail	_Z8setchr4rijj
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M77Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M77Writejh, @function
_ZL8M77Writejh:
	la a5, .LANCHOR0; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL8M77Writejh, .-_ZL8M77Writejh
	.section	.text._ZL8M77Closev,"ax",@progbits
	.align	2
	.type	_ZL8M77Closev, @function
_ZL8M77Closev:
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
	.size	_ZL8M77Closev, .-_ZL8M77Closev
	.section	.text._ZL8M77Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M77Powerv, @function
_ZL8M77Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR0; sb zero, 0(a5);
	li	s0,65536
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL8M77Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL8M77Powerv, .-_ZL8M77Powerv
	.section	.rodata._Z13Mapper77_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CRAM"
	.section	.text._Z13Mapper77_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper77_InitP8CartInfo
	.hidden	_Z13Mapper77_InitP8CartInfo
	.type	_Z13Mapper77_InitP8CartInfo, @function
_Z13Mapper77_InitP8CartInfo:
	addi	sp,sp,-12
	li	a5,8192
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	a4,a0
	addi	a0,a5,-2048
	lla	a5,_ZL8M77Powerv
	sw	a5,0(a4)
	lla	a5,_ZL8M77Closev
	sw	a5,8(a4)
	lla	s0,.LANCHOR2
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	sw	a0,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR1
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartCHRMappingiPhji
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
	lla	a0,.LANCHOR3
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper77_InitP8CartInfo, .-_Z13Mapper77_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"LATC"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL6latche
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL10CHRRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL10CHRRAMSIZE, @object
	.size	_ZL10CHRRAMSIZE, 4
_ZL10CHRRAMSIZE:
	.zero	4
	.section	.sbss._ZL6CHRRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL6CHRRAM, @object
	.size	_ZL6CHRRAM, 4
_ZL6CHRRAM:
	.zero	4
	.section	.sbss._ZL6latche,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL6latche, @object
	.size	_ZL6latche, 1
_ZL6latche:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
