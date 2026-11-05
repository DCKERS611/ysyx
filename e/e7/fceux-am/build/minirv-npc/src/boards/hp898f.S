#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"hp898f.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s1,0(sp)
	sw	s0,4(sp)
	lla	a4,.LANCHOR0
	lbu	a5,0(a4)
	lbu	s0,1(a4)
	slli	a0,a5,2
	andi	a3,a5,2
	andi	a0,a0,4
	or	a0,a0,a3
	srli	a5,a5,4
	andi	a5,a5,7
	not	a0,a0
	and	a0,a0,a5
	srli	s1,s0,4
	call	_Z7setchr8j
	andi	s1,s1,4
	srli	s0,s0,3
	andi	s0,s0,7
	not	a1,s1
	and	a1,a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	or	a1,s0,s1
	li	a0,49152
	call	_Z8setprg16jj
	lla	a4,.LANCHOR0
	lbu	a0,1(a4)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	srli	a0,a0,7
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL11HP898FWritejh,"ax",@progbits
	.align	2
	.type	_ZL11HP898FWritejh, @function
_ZL11HP898FWritejh:
	li	a5,24576
	and	a4,a0,a5
	beq	a4,a5,.L7
	ret
.L7:
	srli	a0,a0,2
	andi	a0,a0,1
	lla	a5,.LANCHOR0
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.size	_ZL11HP898FWritejh, .-_ZL11HP898FWritejh
	.section	.text._ZL11HP898FResetv,"ax",@progbits
	.align	2
	.type	_ZL11HP898FResetv, @function
_ZL11HP898FResetv:
	la a5, .LANCHOR0; sh zero, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL11HP898FResetv, .-_ZL11HP898FResetv
	.section	.text._ZL11HP898FPowerv,"ax",@progbits
	.align	2
	.type	_ZL11HP898FPowerv, @function
_ZL11HP898FPowerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR0; sh zero, 0(a5);
	li	s0,65536
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL11HP898FWritejh
	li	a0,24576
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL11HP898FPowerv, .-_ZL11HP898FPowerv
	.section	.text._Z14BMCHP898F_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14BMCHP898F_InitP8CartInfo
	.hidden	_Z14BMCHP898F_InitP8CartInfo
	.type	_Z14BMCHP898F_InitP8CartInfo, @function
_Z14BMCHP898F_InitP8CartInfo:
	lla	a5,_ZL11HP898FPowerv
	sw	a5,0(a0)
	lla	a5,_ZL11HP898FResetv
	sw	a5,4(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR1
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14BMCHP898F_InitP8CartInfo, .-_Z14BMCHP898F_InitP8CartInfo
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
	.word	2
	.word	.LC0
	.word	0
	.zero	8
	.section	.sbss._ZL4regs,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4regs, @object
	.size	_ZL4regs, 2
_ZL4regs:
	.zero	2
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
