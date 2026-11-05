#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"dance2000.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lbu	a0,0(s0)
	sw	ra,8(sp)
	not	a0,a0
	andi	a0,a0,1
	call	_Z9setmirrori
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	la a1, .LANCHOR1; lw a1, 0(a1);
	li	a0,0
	call	_Z7setchr4jj
	li	a1,1
	li	a0,4096
	call	_Z7setchr4jj
	lbu	a5,0(s0)
	la a1, .LANCHOR2; lbu a1, 0(a1);
	andi	a5,a5,4
	beq	a5,zero,.L2
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a1,a1,7
	li	a0,32768
	addi	sp,sp,12
	tail	_Z8setprg32jj
.L2:
	andi	a1,a1,15
	li	a0,32768
	call	_Z8setprg16jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a1,0
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
	.section	.text._ZL13UNLD2000Closev,"ax",@progbits
	.align	2
	.type	_ZL13UNLD2000Closev, @function
_ZL13UNLD2000Closev:
	la a0, .LANCHOR3; lw a0, 0(a0);
	beq	a0,zero,.L12
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR3; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L12:
	la a5, .LANCHOR3; sw zero, 0(a5);
	ret
	.size	_ZL13UNLD2000Closev, .-_ZL13UNLD2000Closev
	.section	.text._ZL12UNLD2000Readj,"ax",@progbits
	.align	2
	.type	_ZL12UNLD2000Readj, @function
_ZL12UNLD2000Readj:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	andi	a5,a5,64
	beq	a5,zero,.L20
	la a0, X+24; lbu a0, 0(a0);
	ret
.L20:
	tail	_Z6CartBRj
	.size	_ZL12UNLD2000Readj, .-_ZL12UNLD2000Readj
	.section	.text._ZL13UNLD2000Powerv,"ax",@progbits
	.align	2
	.type	_ZL13UNLD2000Powerv, @function
_ZL13UNLD2000Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR0; sb zero, 0(a5);
	li	s0,32768
	la a5, .LANCHOR2; sb zero, 0(a5);
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
	lla	a2,_ZL12UNLD2000Readj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,24576
	lla	a2,_ZL13UNLD2000Writejh
	addi	a1,a1,-1
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR4; lw a0, 0(a0);
	la a2, .LANCHOR3; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL13UNLD2000Powerv, .-_ZL13UNLD2000Powerv
	.section	.text._ZL11UNL2000Hookj,"ax",@progbits
	.align	2
	.type	_ZL11UNL2000Hookj, @function
_ZL11UNL2000Hookj:
	la a5, .LANCHOR0; lbu a5, 0(a5);
	andi	a5,a5,2
	beq	a5,zero,.L24
	li	a5,12288
	and	a5,a0,a5
	li	a4,8192
	beq	a5,a4,.L30
	ret
.L30:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR1
	li	a5,4096
	lw	a4,0(s1)
	addi	a5,a5,-2048
	sw	s0,4(sp)
	sw	ra,8(sp)
	and	s0,a0,a5
	bne	s0,a4,.L31
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L24:
	li	a1,0
	li	a0,0
	la a5, .LANCHOR1; sw zero, 0(a5);
	tail	_Z7setchr4jj
.L31:
	srli	a1,s0,11
	li	a0,0
	call	_Z7setchr4jj
	lw	ra,8(sp)
	sw	s0,0(s1)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL11UNL2000Hookj, .-_ZL11UNL2000Hookj
	.section	.text._ZL13UNLD2000Writejh,"ax",@progbits
	.align	2
	.type	_ZL13UNLD2000Writejh, @function
_ZL13UNLD2000Writejh:
	li	a5,20480
	beq	a0,a5,.L33
	addi	a5,a5,512
	bne	a0,a5,.L39
	la a5, .LANCHOR0; sb a1, 0(a5);
	andi	a1,a1,4
	bne	a1,zero,.L40
	ret
.L39:
	ret
.L33:
	la a5, .LANCHOR2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L40:
	tail	_ZL4Syncv
	.size	_ZL13UNLD2000Writejh, .-_ZL13UNLD2000Writejh
	.section	.rodata._Z13UNLD2000_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z13UNLD2000_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13UNLD2000_InitP8CartInfo
	.hidden	_Z13UNLD2000_InitP8CartInfo
	.type	_Z13UNLD2000_InitP8CartInfo, @function
_Z13UNLD2000_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL13UNLD2000Powerv
	sw	a5,0(a0)
	lla	a5,_ZL13UNLD2000Closev
	sw	a5,8(a0)
	lla	a5,_ZL11UNL2000Hookj
	la a4, PPU_hook; sw a5, 0(a4);
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
	.size	_Z13UNLD2000_InitP8CartInfo, .-_Z13UNLD2000_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"REGS"
	.align	2
.LC2:
	.string	"MODE"
	.align	2
.LC3:
	.string	"LSNT"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL3prg
	.word	1
	.word	.LC1
	.word	_ZL4mode
	.word	1
	.word	.LC2
	.word	_ZL6lastnt
	.word	4
	.word	.LC3
	.word	0
	.zero	8
	.section	.sbss._ZL3prg,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL3prg, @object
	.size	_ZL3prg, 1
_ZL3prg:
	.zero	1
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL4mode,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL4mode, @object
	.size	_ZL4mode, 1
_ZL4mode:
	.zero	1
	.section	.sbss._ZL6lastnt,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
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
