#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"225.cpp"
	.option nopic
	.text
	.section	.text._ZL11M225LoWritejh,"ax",@progbits
	.align	2
	.type	_ZL11M225LoWritejh, @function
_ZL11M225LoWritejh:
	ret
	.size	_ZL11M225LoWritejh, .-_ZL11M225LoWritejh
	.section	.text._ZL10M225LoReadj,"ax",@progbits
	.align	2
	.type	_ZL10M225LoReadj, @function
_ZL10M225LoReadj:
	li	a0,0
	ret
	.size	_ZL10M225LoReadj, .-_ZL10M225LoReadj
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LANCHOR0
	la a5, .LANCHOR1; lbu a5, 0(a5);
	lbu	a1,0(s0)
	beq	a5,zero,.L5
	li	a0,32768
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	li	a0,49152
	call	_Z8setprg16jj
.L6:
	la a0, .LANCHOR2; lbu a0, 0(a0);
	call	_Z7setchr8j
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR3; lbu a0, 0(a0);
	xori	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L5:
	srli	a1,a1,1
	li	a0,32768
	call	_Z8setprg32jj
	j	.L6
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M225Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M225Writejh, @function
_ZL9M225Writejh:
	srli	a5,a0,8
	srli	a2,a0,6
	andi	a5,a5,64
	srli	a3,a0,13
	srli	a4,a0,12
	andi	a2,a2,63
	andi	a0,a0,63
	andi	a4,a4,1
	andi	a3,a3,1
	or	a0,a5,a0
	or	a5,a5,a2
	la a2, .LANCHOR3; sb a3, 0(a2);
	la a3, .LANCHOR1; sb a4, 0(a3);
	la a4, .LANCHOR2; sb a0, 0(a4);
	la a4, .LANCHOR0; sb a5, 0(a4);
	tail	_ZL4Syncv
	.size	_ZL9M225Writejh, .-_ZL9M225Writejh
	.section	.text._ZL9M225Resetv,"ax",@progbits
	.align	2
	.type	_ZL9M225Resetv, @function
_ZL9M225Resetv:
	la a5, .LANCHOR0; sb zero, 0(a5);
	la a5, .LANCHOR1; sb zero, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL9M225Resetv, .-_ZL9M225Resetv
	.section	.text._ZL9M225Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M225Powerv, @function
_ZL9M225Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR0; sb zero, 0(a5);
	li	s0,24576
	la a5, .LANCHOR1; sb zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_ZL10M225LoReadj
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL11M225LoWritejh
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL9M225Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL9M225Powerv, .-_ZL9M225Powerv
	.section	.text._Z14Mapper225_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper225_InitP8CartInfo
	.hidden	_Z14Mapper225_InitP8CartInfo
	.type	_Z14Mapper225_InitP8CartInfo, @function
_Z14Mapper225_InitP8CartInfo:
	lla	a5,_ZL9M225Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M225Resetv
	sw	a5,4(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR4
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper225_InitP8CartInfo, .-_Z14Mapper225_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PROT"
	.align	2
.LC1:
	.string	"PRG"
	.align	2
.LC2:
	.string	"CHR"
	.align	2
.LC3:
	.string	"MODE"
	.align	2
.LC4:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 72
_ZL9StateRegs:
	.word	_ZL4prot
	.word	4
	.word	.LC0
	.word	_ZL3prg
	.word	1
	.word	.LC1
	.word	_ZL3chr
	.word	1
	.word	.LC2
	.word	_ZL4mode
	.word	1
	.word	.LC3
	.word	_ZL4mirr
	.word	1
	.word	.LC4
	.word	0
	.zero	8
	.section	.sbss._ZL3chr,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL3chr, @object
	.size	_ZL3chr, 1
_ZL3chr:
	.zero	1
	.section	.sbss._ZL3prg,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL3prg, @object
	.size	_ZL3prg, 1
_ZL3prg:
	.zero	1
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL4mode,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL4mode, @object
	.size	_ZL4mode, 1
_ZL4mode:
	.zero	1
	.section	.sbss._ZL4prot,"aw",@nobits
	.align	2
	.type	_ZL4prot, @object
	.size	_ZL4prot, 4
_ZL4prot:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
