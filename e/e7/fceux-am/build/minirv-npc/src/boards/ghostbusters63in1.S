#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ghostbusters63in1.cpp"
	.option nopic
	.text
	.section	.text._ZL25BMCGhostbusters63in1Resetv,"ax",@progbits
	.align	2
	.type	_ZL25BMCGhostbusters63in1Resetv, @function
_ZL25BMCGhostbusters63in1Resetv:
	la a5, .LANCHOR0; sh zero, 0(a5);
	ret
	.size	_ZL25BMCGhostbusters63in1Resetv, .-_ZL25BMCGhostbusters63in1Resetv
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	lla	s0,.LANCHOR0
	lla	a4,.LANCHOR2
	lbu	a2,0(s0)
	lbu	a5,0(a4)
	lla	s1,.LANCHOR1
	andi	a3,a2,32
	add	a5,s1,a5
	lbu	a0,0(a5)
	beq	a3,zero,.L4
	andi	a2,a2,31
	li	a1,32768
	call	_Z9setprg16rijj
	lla	a4,.LANCHOR2
	lbu	a5,0(a4)
	lbu	a2,0(s0)
	li	a1,49152
	add	s1,s1,a5
	lbu	a0,0(s1)
	andi	a2,a2,31
	call	_Z9setprg16rijj
	lbu	a5,1(s0)
	andi	a5,a5,2
	beq	a5,zero,.L6
.L9:
	li	a1,0
	li	a0,16
	call	_Z8setchr8rij
.L7:
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	srli	a0,a0,6
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L4:
	srli	a2,a2,1
	andi	a2,a2,15
	li	a1,32768
	call	_Z9setprg32rijj
	lbu	a5,1(s0)
	andi	a5,a5,2
	bne	a5,zero,.L9
.L6:
	li	a0,0
	call	_Z7setchr8j
	j	.L7
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL25BMCGhostbusters63in1Writejh,"ax",@progbits
	.align	2
	.type	_ZL25BMCGhostbusters63in1Writejh, @function
_ZL25BMCGhostbusters63in1Writejh:
	lla	a4,.LANCHOR0
	andi	a0,a0,1
	add	a0,a4,a0
	sb	a1,0(a0)
	lbu	a5,1(a4)
	lbu	a4,0(a4)
	slli	a5,a5,1
	srli	a4,a4,7
	andi	a5,a5,2
	or	a5,a5,a4
	la a4, .LANCHOR2; sb a5, 0(a4);
	tail	_ZL4Syncv
	.size	_ZL25BMCGhostbusters63in1Writejh, .-_ZL25BMCGhostbusters63in1Writejh
	.section	.text._ZL25BMCGhostbusters63in1Closev,"ax",@progbits
	.align	2
	.type	_ZL25BMCGhostbusters63in1Closev, @function
_ZL25BMCGhostbusters63in1Closev:
	la a0, .LANCHOR3; lw a0, 0(a0);
	beq	a0,zero,.L18
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR3; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L18:
	la a5, .LANCHOR3; sw zero, 0(a5);
	ret
	.size	_ZL25BMCGhostbusters63in1Closev, .-_ZL25BMCGhostbusters63in1Closev
	.section	.text._ZL25BMCGhostbusters63in1Powerv,"ax",@progbits
	.align	2
	.type	_ZL25BMCGhostbusters63in1Powerv, @function
_ZL25BMCGhostbusters63in1Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR0; sh zero, 0(a5);
	li	s0,65536
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_ZL24BMCGhostbusters63in1Readj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL25BMCGhostbusters63in1Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL25BMCGhostbusters63in1Powerv, .-_ZL25BMCGhostbusters63in1Powerv
	.section	.text._ZL24BMCGhostbusters63in1Readj,"ax",@progbits
	.align	2
	.type	_ZL24BMCGhostbusters63in1Readj, @function
_ZL24BMCGhostbusters63in1Readj:
	la a4, .LANCHOR2; lbu a4, 0(a4);
	li	a5,1
	beq	a4,a5,.L27
	tail	_Z6CartBRj
.L27:
	la a0, X+24; lbu a0, 0(a0);
	ret
	.size	_ZL24BMCGhostbusters63in1Readj, .-_ZL24BMCGhostbusters63in1Readj
	.section	.rodata._Z25BMCGhostbusters63in1_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CROM"
	.section	.text._Z25BMCGhostbusters63in1_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z25BMCGhostbusters63in1_InitP8CartInfo
	.hidden	_Z25BMCGhostbusters63in1_InitP8CartInfo
	.type	_Z25BMCGhostbusters63in1_InitP8CartInfo, @function
_Z25BMCGhostbusters63in1_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL25BMCGhostbusters63in1Resetv
	sw	a5,4(a0)
	lla	a5,_ZL25BMCGhostbusters63in1Powerv
	sw	a5,0(a0)
	lla	a5,_ZL25BMCGhostbusters63in1Closev
	lla	s0,.LANCHOR4
	sw	a5,8(a0)
	li	a5,8192
	li	a0,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR3
	li	a3,0
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s0)
	lw	a0,0(s1)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR5
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z25BMCGhostbusters63in1_InitP8CartInfo, .-_Z25BMCGhostbusters63in1_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"REGS"
	.align	2
.LC2:
	.string	"BANK"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL3reg
	.word	2
	.word	.LC1
	.word	_ZL4bank
	.word	1
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL10CHRROMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL10CHRROMSIZE, @object
	.size	_ZL10CHRROMSIZE, 4
_ZL10CHRROMSIZE:
	.zero	4
	.section	.sbss._ZL3reg,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 2
_ZL3reg:
	.zero	2
	.section	.sbss._ZL4bank,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL4bank, @object
	.size	_ZL4bank, 1
_ZL4bank:
	.zero	1
	.section	.sbss._ZL6CHRROM,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL6CHRROM, @object
	.size	_ZL6CHRROM, 4
_ZL6CHRROM:
	.zero	4
	.section	.srodata._ZL5banks,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL5banks, @object
	.size	_ZL5banks, 4
_ZL5banks:
	.string	""
	.string	""
	.ascii	"\001\002"
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
