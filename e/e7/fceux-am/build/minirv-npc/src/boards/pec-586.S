#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"pec-586.cpp"
	.option nopic
	.text
	.section	.text._ZL13UNLPEC586Readj,"ax",@progbits
	.align	2
	.type	_ZL13UNLPEC586Readj, @function
_ZL13UNLPEC586Readj:
	la a4, .LANCHOR1+4; lbu a4, 0(a4);
	srli	a4,a4,4
	lla	a5,.LANCHOR0
	add	a5,a5,a4
	lbu	a0,0(a5)
	la a5, X+24; lbu a5, 0(a5);
	andi	a5,a5,-40
	or	a0,a0,a5
	ret
	.size	_ZL13UNLPEC586Readj, .-_ZL13UNLPEC586Readj
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	li	a0,0
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	call	_Z7setchr8j
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	la a4, PRGsize; lw a4, 0(a4);
	li	a5,524288
	bne	a4,a5,.L4
	lla	s0,.LANCHOR1
	lbu	a1,0(s0)
	andi	a5,a1,16
	bne	a5,zero,.L14
	andi	a5,a1,64
	bne	a5,zero,.L15
.L6:
	andi	a1,a1,24
	li	a5,24
	li	a0,0
	beq	a1,a5,.L12
.L13:
	li	a0,1
.L12:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_Z9setmirrori
.L4:
	lla	s1,.LANCHOR1
	lbu	a5,0(s1)
	lla	s0,.LANCHOR2
	li	a0,32768
	andi	a5,a5,127
	add	a5,s0,a5
	lbu	a1,0(a5)
	srli	a1,a1,4
	call	_Z8setprg16jj
	lbu	a5,0(s1)
	li	a0,49152
	andi	a5,a5,127
	add	s0,s0,a5
	lbu	a1,0(s0)
	andi	a1,a1,15
	call	_Z8setprg16jj
	j	.L13
.L14:
	andi	a1,a1,7
	li	a0,32768
	call	_Z8setprg32jj
	lbu	a1,0(s0)
	j	.L6
.L15:
	srli	a5,a1,1
	andi	a5,a5,16
	andi	a1,a1,15
	or	a1,a5,a1
	ori	a1,a1,32
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,0(s0)
	j	.L6
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL14UNLPEC586Writejh,"ax",@progbits
	.align	2
	.type	_ZL14UNLPEC586Writejh, @function
_ZL14UNLPEC586Writejh:
	srli	a0,a0,8
	lla	a5,.LANCHOR1
	andi	a0,a0,7
	add	a0,a5,a0
	sb	a1,0(a0)
	lbu	a5,0(a5)
	srli	a5,a5,7
	la a4, PEC586Hack; sw a5, 0(a4);
	tail	_ZL4Syncv
	.size	_ZL14UNLPEC586Writejh, .-_ZL14UNLPEC586Writejh
	.section	.text._ZL14UNLPEC586Closev,"ax",@progbits
	.align	2
	.type	_ZL14UNLPEC586Closev, @function
_ZL14UNLPEC586Closev:
	la a0, .LANCHOR3; lw a0, 0(a0);
	beq	a0,zero,.L24
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR3; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L24:
	la a5, .LANCHOR3; sw zero, 0(a5);
	ret
	.size	_ZL14UNLPEC586Closev, .-_ZL14UNLPEC586Closev
	.section	.text._ZL14UNLPEC586Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLPEC586Powerv, @function
_ZL14UNLPEC586Powerv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,PRGsize
	lw	a3,0(s0)
	sw	ra,8(sp)
	sw	s1,0(sp)
	li	a4,524288
	li	a5,14
	bne	a3,a4,.L28
	li	a5,0
.L28:
	la a4, .LANCHOR1; sb a5, 0(a4);
	li	s1,32768
	call	_ZL4Syncv
	lla	a2,_Z6CartBRj
	addi	a1,s1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	lla	a2,_Z6CartBWjh
	addi	a1,s1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	lw	a4,0(s0)
	li	a5,524288
	beq	a4,a5,.L34
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
.L30:
	li	s0,24576
	addi	a1,s0,-1
	lla	a2,_ZL14UNLPEC586Writejh
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_ZL13UNLPEC586Readj
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	la a0, .LANCHOR4; lw a0, 0(a0);
	la a2, .LANCHOR3; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
.L34:
	li	a1,65536
	lla	a2,_ZL15UNLPEC586ReadHij
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	j	.L30
	.size	_ZL14UNLPEC586Powerv, .-_ZL14UNLPEC586Powerv
	.section	.text._ZL15UNLPEC586ReadHij,"ax",@progbits
	.align	2
	.type	_ZL15UNLPEC586ReadHij, @function
_ZL15UNLPEC586ReadHij:
	la a5, .LANCHOR1; lbu a5, 0(a5);
	andi	a4,a5,16
	bne	a4,zero,.L36
	andi	a5,a5,64
	beq	a5,zero,.L37
	li	a5,40960
	bgeu	a0,a5,.L37
.L36:
	tail	_Z6CartBRj
.L37:
	slli	a5,a0,3
	li	a4,253952
	and	a5,a5,a4
	andi	a0,a0,1023
	li	a4,270336
	or	a5,a5,a0
	addi	a4,a4,-1024
	or	a5,a5,a4
	la a4, PRGptr; lw a4, 0(a4);
	add	a5,a4,a5
	lbu	a0,0(a5)
	ret
	.size	_ZL15UNLPEC586ReadHij, .-_ZL15UNLPEC586ReadHij
	.section	.rodata._Z13UNLPEC586InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z13UNLPEC586InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13UNLPEC586InitP8CartInfo
	.hidden	_Z13UNLPEC586InitP8CartInfo
	.type	_Z13UNLPEC586InitP8CartInfo, @function
_Z13UNLPEC586InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL14UNLPEC586Powerv
	sw	a5,0(a0)
	lla	a5,_ZL14UNLPEC586Closev
	sw	a5,8(a0)
	lla	a5,_ZL12StateRestorei
	lla	s0,.LANCHOR4
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR3
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
	.size	_Z13UNLPEC586InitP8CartInfo, .-_Z13UNLPEC586InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"REG"
	.align	2
.LC2:
	.string	"LNT"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL3reg
	.word	2
	.word	.LC1
	.word	_ZL6lastnt
	.word	4
	.word	.LC2
	.word	0
	.zero	8
	.section	.rodata._ZL6br_tbl,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL6br_tbl, @object
	.size	_ZL6br_tbl, 16
_ZL6br_tbl:
	.string	""
	.string	"\t"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	" \004"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.ascii	"\002"
	.section	.rodata._ZL6bs_tbl,"a"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL6bs_tbl, @object
	.size	_ZL6bs_tbl, 128
_ZL6bs_tbl:
	.string	"\003\023#3\003\023#3\003\023#3\003\023#3EgEgEgEgEgEgEgEg\003\023#3\003\023#3\003\023#3\003\023#3GgGgGgGgGgGgGgGg\002\022\"2\002\022\"2\002\022\"2\002\022\"2EgEgEgEgEgEgEgEg\002\022\"2\002\022\"2\002\022\"2"
	.ascii	"\020 0GgGgGgGgGgGgGgGg"
	.section	.sbss._ZL3reg,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 8
_ZL3reg:
	.zero	8
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL6lastnt,"aw",@nobits
	.align	2
	.type	_ZL6lastnt, @object
	.size	_ZL6lastnt, 4
_ZL6lastnt:
	.zero	4
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
