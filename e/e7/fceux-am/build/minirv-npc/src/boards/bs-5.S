#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"bs-5.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR0
	lbu	a1,0(s1)
	li	a0,32768
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z7setprg8jj
	lbu	a1,1(s1)
	li	a0,40960
	lla	s0,.LANCHOR1
	call	_Z7setprg8jj
	lbu	a1,2(s1)
	li	a0,49152
	call	_Z7setprg8jj
	lbu	a1,3(s1)
	li	a0,57344
	call	_Z7setprg8jj
	lbu	a1,0(s0)
	li	a0,0
	call	_Z7setchr2jj
	lbu	a1,1(s0)
	li	a0,4096
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lbu	a1,2(s0)
	li	a0,4096
	call	_Z7setchr2jj
	lbu	a1,3(s0)
	li	a0,8192
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9MBS5Resetv,"ax",@progbits
	.align	2
	.type	_ZL9MBS5Resetv, @function
_ZL9MBS5Resetv:
	lla	a4,.LANCHOR2
	lbu	a5,0(a4)
	li	a3,-1
	la a2, .LANCHOR0; sw a3, 0(a2);
	addi	a5,a5,1
	andi	a5,a5,3
	sb	a5,0(a4)
	tail	_ZL4Syncv
	.size	_ZL9MBS5Resetv, .-_ZL9MBS5Resetv
	.section	.text._ZL9MBS5Writejh,"ax",@progbits
	.align	2
	.type	_ZL9MBS5Writejh, @function
_ZL9MBS5Writejh:
	li	a5,61440
	srli	a3,a0,10
	and	a5,a0,a5
	li	a4,32768
	andi	a3,a3,3
	beq	a5,a4,.L7
	li	a4,40960
	bne	a5,a4,.L9
	la a4, .LANCHOR2; lbu a4, 0(a4);
	addi	a4,a4,4
	li	a5,1
	sll	a5,a5,a4
	and	a5,a5,a0
	beq	a5,zero,.L9
	lla	a5,.LANCHOR0
	add	a5,a5,a3
	andi	a0,a0,15
	sb	a0,0(a5)
.L9:
	tail	_ZL4Syncv
.L7:
	lla	a5,.LANCHOR1
	add	a5,a5,a3
	andi	a0,a0,31
	sb	a0,0(a5)
	tail	_ZL4Syncv
	.size	_ZL9MBS5Writejh, .-_ZL9MBS5Writejh
	.section	.text._ZL9MBS5Powerv,"ax",@progbits
	.align	2
	.type	_ZL9MBS5Powerv, @function
_ZL9MBS5Powerv:
	la a5, .LANCHOR2; sb zero, 0(a5);
	addi	sp,sp,-12
	li	a5,-1
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a4, .LANCHOR0; sw a5, 0(a4);
	li	s0,65536
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL9MBS5Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL9MBS5Powerv, .-_ZL9MBS5Powerv
	.section	.text._Z11BMCBS5_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11BMCBS5_InitP8CartInfo
	.hidden	_Z11BMCBS5_InitP8CartInfo
	.type	_Z11BMCBS5_InitP8CartInfo, @function
_Z11BMCBS5_InitP8CartInfo:
	lla	a5,_ZL9MBS5Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9MBS5Resetv
	sw	a5,4(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR3
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z11BMCBS5_InitP8CartInfo, .-_Z11BMCBS5_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PREG"
	.align	2
.LC1:
	.string	"CREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL7reg_prg
	.word	4
	.word	.LC0
	.word	_ZL7reg_chr
	.word	4
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL10dip_switch,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL10dip_switch, @object
	.size	_ZL10dip_switch, 1
_ZL10dip_switch:
	.zero	1
	.section	.sbss._ZL7reg_chr,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL7reg_chr, @object
	.size	_ZL7reg_chr, 4
_ZL7reg_chr:
	.zero	4
	.section	.sbss._ZL7reg_prg,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL7reg_prg, @object
	.size	_ZL7reg_prg, 4
_ZL7reg_prg:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
