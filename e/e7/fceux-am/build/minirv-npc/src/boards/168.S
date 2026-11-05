#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"168.cpp"
	.option nopic
	.text
	.section	.text._ZL9M168Dummyjh,"ax",@progbits
	.align	2
	.type	_ZL9M168Dummyjh, @function
_ZL9M168Dummyjh:
	ret
	.size	_ZL9M168Dummyjh, .-_ZL9M168Dummyjh
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	li	a2,0
	li	a1,0
	li	a0,16
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z8setchr4rijj
	lla	s0,.LANCHOR0
	lbu	a2,0(s0)
	li	a1,4096
	li	a0,16
	andi	a2,a2,15
	call	_Z8setchr4rijj
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,6
	call	_Z8setprg16jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a1,-1
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
	.section	.text._ZL9M168Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M168Writejh, @function
_ZL9M168Writejh:
	la a5, .LANCHOR0; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL9M168Writejh, .-_ZL9M168Writejh
	.section	.text._ZL9M168Closev,"ax",@progbits
	.align	2
	.type	_ZL9M168Closev, @function
_ZL9M168Closev:
	la a0, .LANCHOR1; lw a0, 0(a0);
	beq	a0,zero,.L13
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR1; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L13:
	la a5, .LANCHOR1; sw zero, 0(a5);
	ret
	.size	_ZL9M168Closev, .-_ZL9M168Closev
	.section	.text._ZL9M168Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M168Powerv, @function
_ZL9M168Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a5, .LANCHOR0; sb zero, 0(a5);
	call	_ZL4Syncv
	li	a1,32768
	li	a0,16384
	lla	a2,_ZL9M168Dummyjh
	addi	a1,a1,-1
	addi	a0,a0,32
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a2,_ZL9M168Writejh
	li	a1,45056
	li	a0,45056
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a2,_ZL9M168Dummyjh
	li	a1,61440
	li	a0,61440
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,61440
	addi	a1,a1,128
	mv	a0,a1
	lla	a2,_ZL9M168Dummyjh
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL9M168Powerv, .-_ZL9M168Powerv
	.section	.rodata._Z14Mapper168_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CRAM"
	.section	.text._Z14Mapper168_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper168_InitP8CartInfo
	.hidden	_Z14Mapper168_InitP8CartInfo
	.type	_Z14Mapper168_InitP8CartInfo, @function
_Z14Mapper168_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a4,_ZL9M168Powerv
	sw	a4,0(a0)
	mv	a5,a0
	lla	a4,_ZL9M168Closev
	sw	a4,8(a5)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a5,_ZL12StateRestorei
	lla	a0,.LANCHOR2
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lla	s0,.LANCHOR3
	li	a5,65536
	li	a0,65536
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR1
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a1,0(s0)
	lw	s0,4(sp)
	lw	a0,0(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a3,.LC0
	li	a2,0
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper168_InitP8CartInfo, .-_Z14Mapper168_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"REGS"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL3reg
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL10CHRRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL10CHRRAMSIZE, @object
	.size	_ZL10CHRRAMSIZE, 4
_ZL10CHRRAMSIZE:
	.zero	4
	.section	.sbss._ZL3reg,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.section	.sbss._ZL6CHRRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL6CHRRAM, @object
	.size	_ZL6CHRRAM, 4
_ZL6CHRRAM:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
