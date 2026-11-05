#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"228.cpp"
	.option nopic
	.text
	.section	.text._ZL12M228RamWritejh,"ax",@progbits
	.align	2
	.type	_ZL12M228RamWritejh, @function
_ZL12M228RamWritejh:
	andi	a0,a0,3
	lla	a5,.LANCHOR0
	add	a5,a5,a0
	andi	a1,a1,15
	sb	a1,0(a5)
	ret
	.size	_ZL12M228RamWritejh, .-_ZL12M228RamWritejh
	.section	.text._ZL11M228RamReadj,"ax",@progbits
	.align	2
	.type	_ZL11M228RamReadj, @function
_ZL11M228RamReadj:
	andi	a0,a0,3
	lla	a5,.LANCHOR0
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
	.size	_ZL11M228RamReadj, .-_ZL11M228RamReadj
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	lla	a4,.LANCHOR1
	lhu	a0,0(a4)
	addi	sp,sp,-12
	sw	ra,8(sp)
	srli	a5,a0,7
	sw	s0,4(sp)
	sw	s1,0(sp)
	li	a2,48
	andi	a1,a5,48
	andi	a3,a5,63
	bne	a1,a2,.L5
	addi	a3,a3,-16
.L5:
	srli	a5,a0,5
	srli	s1,a0,6
	srli	a0,a0,13
	and	s1,s1,a5
	xori	a0,a0,1
	slli	a3,a3,1
	andi	a0,a0,1
	andi	s1,s1,1
	add	s1,s1,a3
	xori	s0,a5,1
	call	_Z9setmirrori
	mv	a1,s1
	li	a0,32768
	andi	s0,s0,1
	call	_Z8setprg16jj
	add	s0,s0,s1
	mv	a1,s0
	li	a0,49152
	call	_Z8setprg16jj
	lla	a4,.LANCHOR1
	lhu	a5,0(a4)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	la a0, .LANCHOR2; lbu a0, 0(a0);
	slli	a5,a5,2
	andi	a0,a0,3
	andi	a5,a5,60
	or	a0,a5,a0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M228Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M228Writejh, @function
_ZL9M228Writejh:
	la a5, .LANCHOR1; sh a0, 0(a5);
	la a5, .LANCHOR2; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL9M228Writejh, .-_ZL9M228Writejh
	.section	.text._ZL9M228Resetv,"ax",@progbits
	.align	2
	.type	_ZL9M228Resetv, @function
_ZL9M228Resetv:
	addi	sp,sp,-12
	li	a5,-32768
	li	a2,4
	li	a1,0
	lla	a0,.LANCHOR0
	sw	ra,8(sp)
	la a4, .LANCHOR1; sh a5, 0(a4);
	la a5, .LANCHOR2; sb zero, 0(a5);
	call	memset
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
	.size	_ZL9M228Resetv, .-_ZL9M228Resetv
	.section	.text._ZL9M228Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M228Powerv, @function
_ZL9M228Powerv:
	addi	sp,sp,-12
	li	a5,-32768
	li	a2,4
	li	a1,0
	lla	a0,.LANCHOR0
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a4, .LANCHOR1; sh a5, 0(a4);
	la a5, .LANCHOR2; sb zero, 0(a5);
	call	memset
	call	_ZL4Syncv
	li	s0,24576
	addi	a1,s0,-1
	lla	a2,_ZL11M228RamReadj
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL12M228RamWritejh
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
	lla	a2,_ZL9M228Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL9M228Powerv, .-_ZL9M228Powerv
	.section	.text._Z14Mapper228_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper228_InitP8CartInfo
	.hidden	_Z14Mapper228_InitP8CartInfo
	.type	_Z14Mapper228_InitP8CartInfo, @function
_Z14Mapper228_InitP8CartInfo:
	lla	a5,_ZL9M228Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M228Resetv
	sw	a5,4(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR3
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper228_InitP8CartInfo, .-_Z14Mapper228_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"MRAM"
	.align	2
.LC1:
	.string	"AREG"
	.align	2
.LC2:
	.string	"VREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL4mram
	.word	4
	.word	.LC0
	.word	_ZL4areg
	.word	2
	.word	.LC1
	.word	_ZL4vreg
	.word	1
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL4areg,"aw",@nobits
	.align	1
	.set	.LANCHOR1,. + 0
	.type	_ZL4areg, @object
	.size	_ZL4areg, 2
_ZL4areg:
	.zero	2
	.section	.sbss._ZL4mram,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4mram, @object
	.size	_ZL4mram, 4
_ZL4mram:
	.zero	4
	.section	.sbss._ZL4vreg,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL4vreg, @object
	.size	_ZL4vreg, 1
_ZL4vreg:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
