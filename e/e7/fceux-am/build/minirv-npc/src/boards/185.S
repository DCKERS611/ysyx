#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"185.cpp"
	.option nopic
	.text
	.section	.text._ZL6MWritejh,"ax",@progbits
	.align	2
	.type	_ZL6MWritejh, @function
_ZL6MWritejh:
	la a5, .LANCHOR0; sb a1, 0(a5);
	la a5, .LANCHOR1; lw a5, 0(a5);
	jr	a5
	.size	_ZL6MWritejh, .-_ZL6MWritejh
	.section	.text._ZL8MRestorei,"ax",@progbits
	.align	2
	.type	_ZL8MRestorei, @function
_ZL8MRestorei:
	la a5, .LANCHOR1; lw a5, 0(a5);
	jr	a5
	.size	_ZL8MRestorei, .-_ZL8MRestorei
	.section	.text._ZL6MClosev,"ax",@progbits
	.align	2
	.type	_ZL6MClosev, @function
_ZL6MClosev:
	la a0, .LANCHOR2; lw a0, 0(a0);
	beq	a0,zero,.L10
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR2; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L10:
	la a5, .LANCHOR2; sw zero, 0(a5);
	ret
	.size	_ZL6MClosev, .-_ZL6MClosev
	.section	.text._ZL6MPowerv,"ax",@progbits
	.align	2
	.type	_ZL6MPowerv, @function
_ZL6MPowerv:
	addi	sp,sp,-12
	la a5, .LANCHOR0; sb zero, 0(a5);
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR1; lw a5, 0(a5);
	jalr	a5
	li	a1,0
	li	a0,32768
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL6MWritejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_Z6CartBRj
	li	a0,32768
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL6MPowerv, .-_ZL6MPowerv
	.section	.text._ZL7Sync181v,"ax",@progbits
	.align	2
	.type	_ZL7Sync181v, @function
_ZL7Sync181v:
	la a5, .LANCHOR0; lbu a5, 0(a5);
	andi	a5,a5,1
	bne	a5,zero,.L16
	li	a0,0
	tail	_Z7setchr8j
.L16:
	li	a1,0
	li	a0,16
	tail	_Z8setchr8rij
	.size	_ZL7Sync181v, .-_ZL7Sync181v
	.section	.text._ZL7Sync185v,"ax",@progbits
	.align	2
	.type	_ZL7Sync185v, @function
_ZL7Sync185v:
	la a5, .LANCHOR0; lbu a5, 0(a5);
	andi	a4,a5,3
	beq	a4,zero,.L18
	li	a4,19
	bne	a5,a4,.L22
.L18:
	li	a1,0
	li	a0,16
	tail	_Z8setchr8rij
.L22:
	li	a0,0
	tail	_Z7setchr8j
	.size	_ZL7Sync185v, .-_ZL7Sync185v
	.section	.text._Z14Mapper185_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper185_InitP8CartInfo
	.hidden	_Z14Mapper185_InitP8CartInfo
	.type	_Z14Mapper185_InitP8CartInfo, @function
_Z14Mapper185_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,_ZL6MPowerv
	sw	a5,0(a0)
	lla	a5,_ZL6MClosev
	sw	a5,8(a0)
	lla	a5,_ZL7Sync185v
	la a4, .LANCHOR1; sw a5, 0(a4);
	li	a0,8192
	lla	a5,_ZL8MRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z12FCEU_gmallocj
	la a5, .LANCHOR2; sw a0, 0(a5);
	li	a4,8192
	mv	a1,a0
	mv	a5,a0
	add	a4,a0,a4
	li	a3,-1
.L24:
	sb	a3,0(a5)
	addi	a5,a5,1
	bne	a5,a4,.L24
	li	a3,0
	li	a2,8192
	li	a0,16
	call	_Z19SetupCartCHRMappingiPhji
	lw	ra,8(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR3
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper185_InitP8CartInfo, .-_Z14Mapper185_InitP8CartInfo
	.section	.text._Z14Mapper181_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper181_InitP8CartInfo
	.hidden	_Z14Mapper181_InitP8CartInfo
	.type	_Z14Mapper181_InitP8CartInfo, @function
_Z14Mapper181_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,_ZL6MPowerv
	sw	a5,0(a0)
	lla	a5,_ZL6MClosev
	sw	a5,8(a0)
	lla	a5,_ZL7Sync181v
	la a4, .LANCHOR1; sw a5, 0(a4);
	li	a0,8192
	lla	a5,_ZL8MRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z12FCEU_gmallocj
	la a5, .LANCHOR2; sw a0, 0(a5);
	li	a4,8192
	mv	a1,a0
	mv	a5,a0
	add	a4,a0,a4
	li	a3,-1
.L28:
	sb	a3,0(a5)
	addi	a5,a5,1
	bne	a5,a4,.L28
	li	a3,0
	li	a2,8192
	li	a0,16
	call	_Z19SetupCartCHRMappingiPhji
	lw	ra,8(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR3
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper181_InitP8CartInfo, .-_Z14Mapper181_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"DREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL7datareg
	.word	1
	.word	.LC0
	.word	0
	.zero	8
	.section	.sbss._ZL4Sync,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL4Sync, @object
	.size	_ZL4Sync, 4
_ZL4Sync:
	.zero	4
	.section	.sbss._ZL7datareg,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL7datareg, @object
	.size	_ZL7datareg, 1
_ZL7datareg:
	.zero	1
	.section	.sbss._ZL8DummyCHR,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL8DummyCHR, @object
	.size	_ZL8DummyCHR, 4
_ZL8DummyCHR:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
