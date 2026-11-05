#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"sb-2000.cpp"
	.option nopic
	.text
	.section	.text._ZL14UNLSB2000Resetv,"ax",@progbits
	.align	2
	.type	_ZL14UNLSB2000Resetv, @function
_ZL14UNLSB2000Resetv:
	li	a5,50462720
	lla	a4,.LANCHOR0
	addi	a5,a5,256
	sw	a5,0(a4)
	li	a5,117833728
	addi	a5,a5,1284
	sw	a5,4(a4)
	la a5, .LANCHOR1; sb zero, 0(a5);
	ret
	.size	_ZL14UNLSB2000Resetv, .-_ZL14UNLSB2000Resetv
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	li	a0,0
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z7setchr8j
	li	a1,24576
	li	a2,0
	li	a0,16
	call	_Z8setprg8rijj
	lla	s0,.LANCHOR0
	lbu	a1,0(s0)
	slli	a5,a1,24
	srai	a5,a5,24
	blt	a5,zero,.L13
	li	a0,32768
	call	_Z7setprg4jj
	lbu	a1,1(s0)
	slli	a5,a1,24
	srai	a5,a5,24
	blt	a5,zero,.L14
.L6:
	li	a0,36864
	call	_Z7setprg4jj
	lbu	a1,2(s0)
	slli	a5,a1,24
	srai	a5,a5,24
	blt	a5,zero,.L15
.L8:
	li	a0,40960
	call	_Z7setprg4jj
	lbu	a1,3(s0)
	slli	a5,a1,24
	srai	a5,a5,24
	blt	a5,zero,.L16
.L10:
	li	a0,45056
	call	_Z7setprg4jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a1,1
	li	a0,49152
	addi	sp,sp,12
	tail	_Z8setprg16jj
.L13:
	andi	a2,a1,127
	li	a0,16
	li	a1,32768
	call	_Z8setprg4rijj
	lbu	a1,1(s0)
	slli	a5,a1,24
	srai	a5,a5,24
	bge	a5,zero,.L6
.L14:
	andi	a2,a1,127
	li	a0,16
	li	a1,36864
	call	_Z8setprg4rijj
	lbu	a1,2(s0)
	slli	a5,a1,24
	srai	a5,a5,24
	bge	a5,zero,.L8
.L15:
	andi	a2,a1,127
	li	a0,16
	li	a1,40960
	call	_Z8setprg4rijj
	lbu	a1,3(s0)
	slli	a5,a1,24
	srai	a5,a5,24
	bge	a5,zero,.L10
.L16:
	andi	a2,a1,127
	li	a0,16
	li	a1,45056
	call	_Z8setprg4rijj
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a1,1
	li	a0,49152
	addi	sp,sp,12
	tail	_Z8setprg16jj
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL14UNLSB2000Closev,"ax",@progbits
	.align	2
	.type	_ZL14UNLSB2000Closev, @function
_ZL14UNLSB2000Closev:
	la a0, .LANCHOR2; lw a0, 0(a0);
	beq	a0,zero,.L24
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR2; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L24:
	la a5, .LANCHOR2; sw zero, 0(a5);
	ret
	.size	_ZL14UNLSB2000Closev, .-_ZL14UNLSB2000Closev
	.section	.rodata._ZL13UNLSB2000Readj.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"unk read: %04x\n"
	.section	.text._ZL13UNLSB2000Readj,"ax",@progbits
	.align	2
	.type	_ZL13UNLSB2000Readj, @function
_ZL13UNLSB2000Readj:
	addi	sp,sp,-12
	li	a5,16384
	sw	ra,8(sp)
	addi	a5,a5,51
	beq	a0,a5,.L31
	mv	a1,a0
	lla	a0,.LC0
	call	printf
	lw	ra,8(sp)
	li	a0,255
	addi	sp,sp,12
	jr	ra
.L31:
	li	a0,512
	call	_Z12X6502_IRQEndi
	lw	ra,8(sp)
	li	a0,255
	addi	sp,sp,12
	jr	ra
	.size	_ZL13UNLSB2000Readj, .-_ZL13UNLSB2000Readj
	.section	.text._ZL14UNLSB2000Writejh,"ax",@progbits
	.align	2
	.type	_ZL14UNLSB2000Writejh, @function
_ZL14UNLSB2000Writejh:
	addi	sp,sp,-12
	sw	s1,0(sp)
	li	s1,16384
	sw	s0,4(sp)
	sw	ra,8(sp)
	addi	a5,s1,50
	mv	s0,a1
	beq	a0,a5,.L33
	bgtu	a0,a5,.L34
	addi	a5,s1,39
	bne	a0,a5,.L32
	addi	a0,s1,21
	li	a1,16
	call	_Z6writebih
	srli	a1,s0,1
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	a0,s1,17
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_Z6writebih
.L34:
	li	a5,-16384
	addi	a5,a5,-64
	add	a5,a0,a5
	li	a4,7
	bgtu	a5,a4,.L32
	andi	a0,a0,7
	lla	a5,.LANCHOR0
	add	a5,a5,a0
	sb	a1,0(a5)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
.L33:
	lla	a4,.LANCHOR1
	lbu	a5,0(a4)
	not	s0,a1
	and	a5,a5,s0
	sb	a5,0(a4)
.L32:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL14UNLSB2000Writejh, .-_ZL14UNLSB2000Writejh
	.section	.text._ZL14UNLSB2000Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLSB2000Powerv, @function
_ZL14UNLSB2000Powerv:
	addi	sp,sp,-12
	li	a5,50462720
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a4,.LANCHOR0
	addi	a5,a5,256
	sw	a5,0(a4)
	li	a5,117833728
	addi	a5,a5,1284
	sw	a5,4(a4)
	li	s0,32768
	la a5, .LANCHOR1; sb zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,49152
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	s1,24576
	li	s0,16384
	addi	a1,s1,-1
	addi	a0,s0,32
	lla	a2,_ZL14UNLSB2000Writejh
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a0,s0,32
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	a1,s1,-1
	lw	s1,0(sp)
	lla	a2,_ZL13UNLSB2000Readj
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL14UNLSB2000Powerv, .-_ZL14UNLSB2000Powerv
	.section	.rodata._Z14UNLSB2000_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"WRAM"
	.section	.text._Z14UNLSB2000_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLSB2000_InitP8CartInfo
	.hidden	_Z14UNLSB2000_InitP8CartInfo
	.type	_Z14UNLSB2000_InitP8CartInfo, @function
_Z14UNLSB2000_InitP8CartInfo:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	lla	a4,_ZL14UNLSB2000Powerv
	sw	a4,0(a0)
	lla	a4,_ZL14UNLSB2000Resetv
	sw	a4,4(a0)
	lla	a4,_ZL14UNLSB2000Closev
	sw	a4,8(a0)
	lla	a4,_ZL12StateRestorei
	lla	s0,.LANCHOR3
	la a3, GameStateRestore; sw a4, 0(a3);
	sw	a0,0(sp)
	li	a4,524288
	li	a0,524288
	sw	a4,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR2
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s0)
	lw	a0,0(s1)
	lla	a3,.LC1
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	a5,0(sp)
	lw	a4,48(a5)
	beq	a4,zero,.L43
	lw	a3,0(s1)
	lw	a4,0(s0)
	sw	a3,12(a5)
	sw	a4,28(a5)
.L43:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR4
	addi	sp,sp,16
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14UNLSB2000_InitP8CartInfo, .-_Z14UNLSB2000_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"PREG"
	.align	2
.LC3:
	.string	"IRQA"
	.align	2
.LC4:
	.string	"IRQC"
	.align	2
.LC5:
	.string	"IRQL"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 60
_ZL9StateRegs:
	.word	_ZL4preg
	.word	8
	.word	.LC2
	.word	_ZL4IRQa
	.word	1
	.word	.LC3
	.word	_ZL8IRQCount
	.word	2
	.word	.LC4
	.word	_ZL8IRQLatch
	.word	2
	.word	.LC5
	.word	0
	.zero	8
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL4preg,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4preg, @object
	.size	_ZL4preg, 8
_ZL4preg:
	.zero	8
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	1
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 2
_ZL8IRQCount:
	.zero	2
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.align	1
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 2
_ZL8IRQLatch:
	.zero	2
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
