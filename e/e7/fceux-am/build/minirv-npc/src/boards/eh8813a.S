#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"eh8813a.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s1,0(sp)
	la a0, .LANCHOR1; lbu a0, 0(a0);
	lla	s1,.LANCHOR0
	sw	s0,4(sp)
	sw	ra,8(sp)
	lhu	s0,0(s1)
	call	_Z7setchr8j
	lhu	a5,0(s1)
	andi	s0,s0,7
	andi	a5,a5,128
	beq	a5,zero,.L2
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s0
	li	a0,49152
	call	_Z8setprg16jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L2:
	srli	a1,s0,1
	li	a0,32768
	call	_Z8setprg32jj
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
	.section	.text._ZL12EH8813AWritejh,"ax",@progbits
	.align	2
	.type	_ZL12EH8813AWritejh, @function
_ZL12EH8813AWritejh:
	lla	a4,.LANCHOR0
	lhu	a5,0(a4)
	andi	a5,a5,256
	bne	a5,zero,.L8
	andi	a0,a0,511
	andi	a1,a1,15
	sh	a0,0(a4)
	la a5, .LANCHOR1; sb a1, 0(a5);
.L8:
	tail	_ZL4Syncv
	.size	_ZL12EH8813AWritejh, .-_ZL12EH8813AWritejh
	.section	.text._ZL12EH8813APowerv,"ax",@progbits
	.align	2
	.type	_ZL12EH8813APowerv, @function
_ZL12EH8813APowerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR2; sb zero, 0(a5);
	li	s0,65536
	la a5, .LANCHOR1; sb zero, 0(a5);
	la a5, .LANCHOR0; sh zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_ZL11EH8813AReadj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL12EH8813AWritejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL12EH8813APowerv, .-_ZL12EH8813APowerv
	.section	.text._ZL11EH8813AReadj,"ax",@progbits
	.align	2
	.type	_ZL11EH8813AReadj, @function
_ZL11EH8813AReadj:
	la a5, .LANCHOR0; lhu a5, 0(a5);
	andi	a5,a5,64
	beq	a5,zero,.L12
	li	a5,65536
	addi	a5,a5,-16
	and	a0,a0,a5
	la a5, .LANCHOR2; lbu a5, 0(a5);
	add	a0,a5,a0
.L12:
	tail	_Z6CartBRj
	.size	_ZL11EH8813AReadj, .-_ZL11EH8813AReadj
	.section	.rodata._ZL12EH8813AResetv.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Hardware Switch is %01X\n"
	.section	.text._ZL12EH8813AResetv,"ax",@progbits
	.align	2
	.type	_ZL12EH8813AResetv, @function
_ZL12EH8813AResetv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,.LANCHOR2
	lbu	a1,0(a5)
	lla	a0,.LC0
	la a4, .LANCHOR1; sb zero, 0(a4);
	addi	a1,a1,1
	andi	a1,a1,15
	sb	a1,0(a5)
	la a5, .LANCHOR0; sh zero, 0(a5);
	call	printf
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
	.size	_ZL12EH8813AResetv, .-_ZL12EH8813AResetv
	.section	.text._Z15UNLEH8813A_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z15UNLEH8813A_InitP8CartInfo
	.hidden	_Z15UNLEH8813A_InitP8CartInfo
	.type	_Z15UNLEH8813A_InitP8CartInfo, @function
_Z15UNLEH8813A_InitP8CartInfo:
	lla	a5,_ZL12EH8813APowerv
	sw	a5,0(a0)
	lla	a5,_ZL12EH8813AResetv
	sw	a5,4(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR3
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z15UNLEH8813A_InitP8CartInfo, .-_Z15UNLEH8813A_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"ADRL"
	.align	2
.LC2:
	.string	"DATL"
	.align	2
.LC3:
	.string	"HWMO"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL9addrlatch
	.word	2
	.word	.LC1
	.word	_ZL9datalatch
	.word	1
	.word	.LC2
	.word	_ZL7hw_mode
	.word	1
	.word	.LC3
	.word	0
	.zero	8
	.section	.sbss._ZL7hw_mode,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL7hw_mode, @object
	.size	_ZL7hw_mode, 1
_ZL7hw_mode:
	.zero	1
	.section	.sbss._ZL9addrlatch,"aw",@nobits
	.align	1
	.set	.LANCHOR0,. + 0
	.type	_ZL9addrlatch, @object
	.size	_ZL9addrlatch, 2
_ZL9addrlatch:
	.zero	2
	.section	.sbss._ZL9datalatch,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL9datalatch, @object
	.size	_ZL9datalatch, 1
_ZL9datalatch:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
