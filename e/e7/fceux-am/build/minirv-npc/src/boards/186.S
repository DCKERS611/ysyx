#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"186.cpp"
	.option nopic
	.text
	.section	.text._ZL8M186Readj,"ax",@progbits
	.align	2
	.type	_ZL8M186Readj, @function
_ZL8M186Readj:
	li	a5,16384
	addi	a5,a5,514
	beq	a0,a5,.L4
	bleu	a0,a5,.L6
	li	a5,-16384
	addi	a5,a5,-515
	add	a0,a0,a5
	snez	a0,a0
	neg	a0,a0
	andi	a0,a0,0xff
	ret
.L6:
	li	a5,-16384
	addi	a5,a5,-512
	add	a0,a0,a5
	sltiu	a0,a0,2
	addi	a0,a0,-1
	andi	a0,a0,0xff
	ret
.L4:
	li	a0,64
	ret
	.size	_ZL8M186Readj, .-_ZL8M186Readj
	.section	.text._ZL6ASWRAMj,"ax",@progbits
	.align	2
	.type	_ZL6ASWRAMj, @function
_ZL6ASWRAMj:
	lla	a5,_ZL5SWRAM-16384
	add	a0,a0,a5
	lbu	a0,-1024(a0)
	ret
	.size	_ZL6ASWRAMj, .-_ZL6ASWRAMj
	.section	.text._ZL6BSWRAMjh,"ax",@progbits
	.align	2
	.type	_ZL6BSWRAMjh, @function
_ZL6BSWRAMjh:
	lla	a5,_ZL5SWRAM-16384
	add	a0,a0,a5
	sb	a1,-1024(a0)
	ret
	.size	_ZL6BSWRAMjh, .-_ZL6BSWRAMjh
	.section	.text._ZL9M186Closev,"ax",@progbits
	.align	2
	.type	_ZL9M186Closev, @function
_ZL9M186Closev:
	la a0, .LANCHOR0; lw a0, 0(a0);
	beq	a0,zero,.L15
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR0; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L15:
	la a5, .LANCHOR0; sw zero, 0(a5);
	ret
	.size	_ZL9M186Closev, .-_ZL9M186Closev
	.section	.text._ZL9M186Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M186Powerv, @function
_ZL9M186Powerv:
	addi	sp,sp,-12
	li	a0,0
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	li	s0,65536
	call	_Z7setchr8j
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	li	s0,16384
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,1023
	addi	a0,s0,512
	lla	a2,_ZL8M186Readj
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,1023
	addi	a0,s0,512
	lla	a2,_ZL9M186Writejh
	call	_Z15SetWriteHandleriiPFvjhE
	li	s1,20480
	addi	a1,s1,-1
	addi	a0,s0,1024
	lla	a2,_ZL6ASWRAMj
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s1,-1
	addi	a0,s0,1024
	lla	a2,_ZL6BSWRAMjh
	call	_Z15SetWriteHandleriiPFvjhE
	la a2, .LANCHOR0; lw a2, 0(a2);
	li	a1,24576
	li	a0,32
	call	_Z16FCEU_CheatAddRAMijPh
	lla	s0,.LANCHOR1
	lbu	a5,3(s0)
	li	a1,24576
	li	a0,16
	sb	a5,2(s0)
	sb	a5,1(s0)
	sb	a5,0(s0)
	srli	a2,a5,6
	call	_Z8setprg8rijj
	lbu	a1,1(s0)
	li	a0,32768
	call	_Z8setprg16jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a1,0
	li	a0,49152
	addi	sp,sp,12
	tail	_Z8setprg16jj
	.size	_ZL9M186Powerv, .-_ZL9M186Powerv
	.section	.text._ZL11M186Restorei,"ax",@progbits
	.align	2
	.type	_ZL11M186Restorei, @function
_ZL11M186Restorei:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR1
	lbu	a2,0(s0)
	li	a1,24576
	li	a0,16
	srli	a2,a2,6
	sw	ra,8(sp)
	call	_Z8setprg8rijj
	lbu	a1,1(s0)
	li	a0,32768
	call	_Z8setprg16jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a1,0
	li	a0,49152
	addi	sp,sp,12
	tail	_Z8setprg16jj
	.size	_ZL11M186Restorei, .-_ZL11M186Restorei
	.section	.text._ZL9M186Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M186Writejh, @function
_ZL9M186Writejh:
	li	a5,16384
	addi	sp,sp,-12
	addi	a5,a5,515
	sw	s0,4(sp)
	sw	ra,8(sp)
	and	a5,a0,a5
	lla	s0,.LANCHOR1
	beq	a5,zero,.L23
	andi	a0,a0,3
	add	a0,s0,a0
	sb	a1,0(a0)
.L23:
	lbu	a2,0(s0)
	li	a1,24576
	li	a0,16
	srli	a2,a2,6
	call	_Z8setprg8rijj
	lbu	a1,1(s0)
	li	a0,32768
	call	_Z8setprg16jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a1,0
	li	a0,49152
	addi	sp,sp,12
	tail	_Z8setprg16jj
	.size	_ZL9M186Writejh, .-_ZL9M186Writejh
	.section	.rodata._Z14Mapper186_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z14Mapper186_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper186_InitP8CartInfo
	.hidden	_Z14Mapper186_InitP8CartInfo
	.type	_Z14Mapper186_InitP8CartInfo, @function
_Z14Mapper186_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	lla	a5,_ZL9M186Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M186Closev
	sw	a5,8(a0)
	lla	a5,_ZL11M186Restorei
	li	a0,32768
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z12FCEU_gmallocj
	mv	a1,a0
	lla	s0,.LANCHOR0
	li	a3,1
	li	a2,32768
	li	a0,16
	sw	a1,0(s0)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a0,0(s0)
	lla	a3,.LC0
	li	a2,0
	li	a1,32768
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR2
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper186_InitP8CartInfo, .-_Z14Mapper186_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"DREG"
	.align	2
.LC2:
	.string	"SWRM"
	.section	.bss._ZL5SWRAM,"aw",@nobits
	.align	2
	.type	_ZL5SWRAM, @object
	.size	_ZL5SWRAM, 3072
_ZL5SWRAM:
	.zero	3072
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL4regs
	.word	4
	.word	.LC1
	.word	_ZL5SWRAM
	.word	3072
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL4regs,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL4regs, @object
	.size	_ZL4regs, 4
_ZL4regs:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
