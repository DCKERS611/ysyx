#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"244.cpp"
	.option nopic
	.text
	.section	.text._ZL9M244Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M244Writejh, @function
_ZL9M244Writejh:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	andi	a4,a1,8
	srli	a5,a1,4
	beq	a4,zero,.L2
	andi	a5,a5,7
	slli	a5,a5,3
	lla	a4,.LANCHOR1
	andi	a1,a1,7
	add	a5,a4,a5
	add	a5,a5,a1
	lbu	a5,0(a5)
	lla	s0,.LANCHOR0
	la a1, .LANCHOR2; lbu a1, 0(a1);
	sb	a5,0(s0)
.L3:
	li	a0,32768
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z7setchr8j
.L2:
	andi	a5,a5,3
	slli	a5,a5,2
	lla	a4,.LANCHOR3
	andi	a1,a1,3
	add	a5,a4,a5
	add	a5,a5,a1
	lbu	a1,0(a5)
	lla	s0,.LANCHOR0
	la a5, .LANCHOR2; sb a1, 0(a5);
	j	.L3
	.size	_ZL9M244Writejh, .-_ZL9M244Writejh
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	addi	sp,sp,-12
	li	a0,32768
	la a1, .LANCHOR2; lbu a1, 0(a1);
	sw	ra,8(sp)
	call	_Z8setprg32jj
	lw	ra,8(sp)
	la a0, .LANCHOR0; lbu a0, 0(a0);
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M244Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M244Powerv, @function
_ZL9M244Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	li	a1,0
	lla	s0,.LANCHOR0
	li	a0,32768
	sb	zero,0(s0)
	la a5, .LANCHOR2; sb zero, 0(a5);
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	li	s0,65536
	call	_Z7setchr8j
	addi	a1,s0,-1
	lla	a2,_ZL9M244Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_Z6CartBRj
	li	a0,32768
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL9M244Powerv, .-_ZL9M244Powerv
	.section	.text._Z14Mapper244_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper244_InitP8CartInfo
	.hidden	_Z14Mapper244_InitP8CartInfo
	.type	_Z14Mapper244_InitP8CartInfo, @function
_Z14Mapper244_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,_ZL9M244Powerv
	sw	a5,0(a0)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR4
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	addi	sp,sp,12
	jr	ra
	.size	_Z14Mapper244_InitP8CartInfo, .-_Z14Mapper244_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PREG"
	.align	2
.LC1:
	.string	"CREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL4preg
	.word	1
	.word	.LC0
	.word	_ZL4creg
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.rodata._ZL8chr_perm,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL8chr_perm, @object
	.size	_ZL8chr_perm, 64
_ZL8chr_perm:
	.string	""
	.ascii	"\001\002\003\004\005\006\007"
	.string	""
	.ascii	"\002\001\003\004\006\005\007"
	.string	""
	.ascii	"\001\004\005\002\003\006\007"
	.string	""
	.ascii	"\004\001\005\002\006\003\007"
	.string	""
	.ascii	"\004\002\006\001\005\003\007"
	.string	""
	.ascii	"\002\004\006\001\003\005\007"
	.string	"\007\006\005\004\003\002\001"
	.string	"\007\006\005\004\003\002\001"
	.section	.rodata._ZL8prg_perm,"a"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL8prg_perm, @object
	.size	_ZL8prg_perm, 16
_ZL8prg_perm:
	.string	""
	.ascii	"\001\002\003"
	.string	"\003\002\001"
	.string	""
	.ascii	"\002\001\003"
	.string	"\003\001\002"
	.section	.sbss._ZL4creg,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL4creg, @object
	.size	_ZL4creg, 1
_ZL4creg:
	.zero	1
	.section	.sbss._ZL4preg,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL4preg, @object
	.size	_ZL4preg, 1
_ZL4preg:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
