#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"bmc64in1nr.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lb	a4,0(s0)
	sw	ra,8(sp)
	sw	s1,0(sp)
	lbu	a5,1(s0)
	bge	a4,zero,.L2
	slli	a4,a5,24
	srai	a4,a4,24
	blt	a4,zero,.L9
	slli	s1,a5,1
	andi	s1,s1,62
	srli	a5,a5,6
	or	s1,s1,a5
	mv	a1,s1
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s1
	li	a0,49152
	call	_Z8setprg16jj
.L4:
	lbu	a5,0(s0)
	andi	a5,a5,32
	beq	a5,zero,.L5
.L10:
	li	a0,0
	call	_Z9setmirrori
.L6:
	lbu	a5,0(s0)
	lbu	a0,2(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	srli	a5,a5,1
	andi	a5,a5,3
	slli	a0,a0,2
	or	a0,a5,a0
	addi	sp,sp,12
	tail	_Z7setchr8j
.L9:
	andi	a1,a5,31
	li	a0,32768
	call	_Z8setprg32jj
	lbu	a5,0(s0)
	andi	a5,a5,32
	bne	a5,zero,.L10
.L5:
	li	a0,1
	call	_Z9setmirrori
	j	.L6
.L2:
	slli	a1,a5,1
	srli	a5,a5,6
	andi	a5,a5,1
	andi	a1,a1,62
	or	a1,a1,a5
	li	a0,49152
	call	_Z8setprg16jj
	j	.L4
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL17BMC64in1nrWriteHijh,"ax",@progbits
	.align	2
	.type	_ZL17BMC64in1nrWriteHijh, @function
_ZL17BMC64in1nrWriteHijh:
	la a5, .LANCHOR0+3; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL17BMC64in1nrWriteHijh, .-_ZL17BMC64in1nrWriteHijh
	.section	.text._ZL17BMC64in1nrWriteLojh,"ax",@progbits
	.align	2
	.type	_ZL17BMC64in1nrWriteLojh, @function
_ZL17BMC64in1nrWriteLojh:
	andi	a0,a0,3
	lla	a5,.LANCHOR0
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.size	_ZL17BMC64in1nrWriteLojh, .-_ZL17BMC64in1nrWriteLojh
	.section	.text._ZL15BMC64in1nrPowerv,"ax",@progbits
	.align	2
	.type	_ZL15BMC64in1nrPowerv, @function
_ZL15BMC64in1nrPowerv:
	li	a5,16384
	addi	sp,sp,-12
	addi	a5,a5,896
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a4, .LANCHOR0; sw a5, 0(a4);
	call	_ZL4Syncv
	li	a1,20480
	lla	a2,_ZL17BMC64in1nrWriteLojh
	addi	a1,a1,3
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL17BMC64in1nrWriteHijh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_Z6CartBRj
	li	a0,32768
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL15BMC64in1nrPowerv, .-_ZL15BMC64in1nrPowerv
	.section	.text._Z15BMC64in1nr_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z15BMC64in1nr_InitP8CartInfo
	.hidden	_Z15BMC64in1nr_InitP8CartInfo
	.type	_Z15BMC64in1nr_InitP8CartInfo, @function
_Z15BMC64in1nr_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,_ZL15BMC64in1nrPowerv
	sw	a5,0(a0)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR1
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	addi	sp,sp,12
	jr	ra
	.size	_Z15BMC64in1nr_InitP8CartInfo, .-_Z15BMC64in1nr_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REGS"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL4regs
	.word	4
	.word	.LC0
	.word	0
	.zero	8
	.section	.sbss._ZL4regs,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4regs, @object
	.size	_ZL4regs, 4
_ZL4regs:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
