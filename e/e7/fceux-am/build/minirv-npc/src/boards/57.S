#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"57.cpp"
	.option nopic
	.text
	.section	.text._ZL7M57Readj,"ax",@progbits
	.align	2
	.type	_ZL7M57Readj, @function
_ZL7M57Readj:
	la a0, .LANCHOR0; lbu a0, 0(a0);
	ret
	.size	_ZL7M57Readj, .-_ZL7M57Readj
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR1
	lbu	a1,0(s0)
	sw	ra,8(sp)
	slli	a5,a1,24
	srai	a5,a5,24
	blt	a5,zero,.L7
	srli	a1,a1,5
	li	a0,32768
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	li	a0,49152
	srli	a1,a1,5
	andi	a1,a1,3
	call	_Z8setprg16jj
.L5:
	lbu	a0,0(s0)
	srli	a0,a0,3
	andi	a0,a0,1
	call	_Z9setmirrori
	lbu	a5,0(s0)
	la a0, .LANCHOR2; lbu a0, 0(a0);
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a4,a5,7
	andi	a0,a0,3
	srli	a5,a5,1
	or	a0,a0,a4
	andi	a5,a5,8
	or	a0,a0,a5
	addi	sp,sp,12
	tail	_Z7setchr8j
.L7:
	srli	a1,a1,6
	li	a0,32768
	call	_Z8setprg32jj
	j	.L5
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M57Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M57Writejh, @function
_ZL8M57Writejh:
	li	a5,36864
	addi	a5,a5,-2048
	and	a0,a0,a5
	beq	a0,a5,.L12
	la a5, .LANCHOR2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L12:
	la a5, .LANCHOR1; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL8M57Writejh, .-_ZL8M57Writejh
	.section	.rodata._ZL8M57Resetv.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Select Register = %02x\n"
	.section	.text._ZL8M57Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M57Resetv, @function
_ZL8M57Resetv:
	lla	a5,.LANCHOR0
	lbu	a1,0(a5)
	lla	a0,.LC0
	addi	a1,a1,1
	andi	a1,a1,3
	sb	a1,0(a5)
	tail	printf
	.size	_ZL8M57Resetv, .-_ZL8M57Resetv
	.section	.text._ZL8M57Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M57Powerv, @function
_ZL8M57Powerv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	sw	ra,8(sp)
	la a5, .LANCHOR1; sb zero, 0(a5);
	la a5, .LANCHOR2; sb zero, 0(a5);
	la a5, .LANCHOR0; sb zero, 0(a5);
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL8M57Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a2,_ZL7M57Readj
	li	a1,24576
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
	.size	_ZL8M57Powerv, .-_ZL8M57Powerv
	.section	.text._Z13Mapper57_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper57_InitP8CartInfo
	.hidden	_Z13Mapper57_InitP8CartInfo
	.type	_Z13Mapper57_InitP8CartInfo, @function
_Z13Mapper57_InitP8CartInfo:
	lla	a5,_ZL8M57Powerv
	sw	a5,0(a0)
	lla	a5,_ZL8M57Resetv
	sw	a5,4(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR3
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper57_InitP8CartInfo, .-_Z13Mapper57_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"DPSW"
	.align	2
.LC2:
	.string	"PRG"
	.align	2
.LC3:
	.string	"CHR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL8hrd_flag
	.word	1
	.word	.LC1
	.word	_ZL7prg_reg
	.word	1
	.word	.LC2
	.word	_ZL7chr_reg
	.word	1
	.word	.LC3
	.word	0
	.zero	8
	.section	.sbss._ZL7chr_reg,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL7chr_reg, @object
	.size	_ZL7chr_reg, 1
_ZL7chr_reg:
	.zero	1
	.section	.sbss._ZL7prg_reg,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL7prg_reg, @object
	.size	_ZL7prg_reg, 1
_ZL7prg_reg:
	.zero	1
	.section	.sbss._ZL8hrd_flag,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL8hrd_flag, @object
	.size	_ZL8hrd_flag, 1
_ZL8hrd_flag:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
