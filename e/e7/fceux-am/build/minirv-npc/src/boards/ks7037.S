#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ks7037.cpp"
	.option nopic
	.text
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	la a5, .LANCHOR0; lw a5, 0(a5);
	jr	a5
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL10SyncKS7037v,"ax",@progbits
	.align	2
	.type	_ZL10SyncKS7037v, @function
_ZL10SyncKS7037v:
	addi	sp,sp,-12
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z8setprg4rijj
	li	a1,15
	li	a0,28672
	lla	s0,.LANCHOR1
	call	_Z7setprg4jj
	lbu	a1,6(s0)
	li	a0,32768
	call	_Z7setprg8jj
	li	a1,-4
	li	a0,40960
	call	_Z7setprg4jj
	li	a2,1
	li	a1,45056
	li	a0,16
	call	_Z8setprg4rijj
	lbu	a1,7(s0)
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
	li	a0,0
	call	_Z7setchr8j
	lbu	a3,5(s0)
	lbu	a2,3(s0)
	lbu	a1,4(s0)
	lbu	a0,2(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a3,a3,1
	andi	a2,a2,1
	andi	a1,a1,1
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z10setmirrorwiiii
	.size	_ZL10SyncKS7037v, .-_ZL10SyncKS7037v
	.section	.text._ZL5Closev,"ax",@progbits
	.align	2
	.type	_ZL5Closev, @function
_ZL5Closev:
	la a0, .LANCHOR2; lw a0, 0(a0);
	beq	a0,zero,.L11
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR2; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L11:
	la a5, .LANCHOR2; sw zero, 0(a5);
	ret
	.size	_ZL5Closev, .-_ZL5Closev
	.section	.text._ZL14UNLKS7037Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7037Powerv, @function
_ZL14UNLKS7037Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	lla	a5,.LANCHOR1
	sw	zero,0(a5)
	sw	zero,4(a5)
	la a5, .LANCHOR0; lw a5, 0(a5);
	jalr	a5
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,40960
	lla	a2,_ZL14UNLKS7037Writejh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,49152
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,40960
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL14UNLKS7037Writejh
	li	a0,49152
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL14UNLKS7037Powerv, .-_ZL14UNLKS7037Powerv
	.section	.text._ZL8SyncLH10v,"ax",@progbits
	.align	2
	.type	_ZL8SyncLH10v, @function
_ZL8SyncLH10v:
	addi	sp,sp,-12
	li	a1,-2
	li	a0,24576
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z7setprg8jj
	lla	s0,.LANCHOR1
	lbu	a1,6(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,7(s0)
	li	a0,40960
	call	_Z7setprg8jj
	li	a2,0
	li	a1,49152
	li	a0,16
	call	_Z8setprg8rijj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
	li	a0,0
	call	_Z7setchr8j
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL8SyncLH10v, .-_ZL8SyncLH10v
	.section	.text._ZL9LH10Powerv,"ax",@progbits
	.align	2
	.type	_ZL9LH10Powerv, @function
_ZL9LH10Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	lla	a5,.LANCHOR1
	sw	zero,0(a5)
	sw	zero,4(a5)
	la a5, .LANCHOR0; lw a5, 0(a5);
	jalr	a5
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,49152
	lla	a2,_ZL14UNLKS7037Writejh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,57344
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,49152
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_ZL14UNLKS7037Writejh
	li	a0,57344
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR3; lw a0, 0(a0);
	la a2, .LANCHOR2; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL9LH10Powerv, .-_ZL9LH10Powerv
	.section	.text._ZL14UNLKS7037Writejh,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7037Writejh, @function
_ZL14UNLKS7037Writejh:
	li	a5,57344
	addi	a5,a5,1
	and	a0,a0,a5
	li	a5,32768
	beq	a0,a5,.L21
	addi	a5,a5,1
	bne	a0,a5,.L24
	la a4, .LANCHOR4; lbu a4, 0(a4);
	lla	a5,.LANCHOR1
	add	a5,a5,a4
	sb	a1,0(a5)
	la a5, .LANCHOR0; lw a5, 0(a5);
	jr	a5
.L24:
	ret
.L21:
	andi	a1,a1,7
	la a5, .LANCHOR4; sb a1, 0(a5);
	ret
	.size	_ZL14UNLKS7037Writejh, .-_ZL14UNLKS7037Writejh
	.section	.rodata._Z14UNLKS7037_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z14UNLKS7037_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLKS7037_InitP8CartInfo
	.hidden	_Z14UNLKS7037_InitP8CartInfo
	.type	_Z14UNLKS7037_InitP8CartInfo, @function
_Z14UNLKS7037_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL14UNLKS7037Powerv
	sw	a5,0(a0)
	lla	a5,_ZL5Closev
	sw	a5,8(a0)
	lla	a5,_ZL10SyncKS7037v
	lla	s0,.LANCHOR3
	la a4, .LANCHOR0; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR2
	li	a3,1
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
	.size	_Z14UNLKS7037_InitP8CartInfo, .-_Z14UNLKS7037_InitP8CartInfo
	.section	.text._Z9LH10_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z9LH10_InitP8CartInfo
	.hidden	_Z9LH10_InitP8CartInfo
	.type	_Z9LH10_InitP8CartInfo, @function
_Z9LH10_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL9LH10Powerv
	sw	a5,0(a0)
	lla	a5,_ZL5Closev
	sw	a5,8(a0)
	lla	a5,_ZL8SyncLH10v
	lla	s0,.LANCHOR3
	la a4, .LANCHOR0; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR2
	li	a3,1
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
	.size	_Z9LH10_InitP8CartInfo, .-_Z9LH10_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"CMD"
	.align	2
.LC2:
	.string	"REGS"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL3cmd
	.word	1
	.word	.LC1
	.word	_ZL3reg
	.word	8
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL3cmd,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL3cmd, @object
	.size	_ZL3cmd, 1
_ZL3cmd:
	.zero	1
	.section	.sbss._ZL3reg,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 8
_ZL3reg:
	.zero	8
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL5WSync,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL5WSync, @object
	.size	_ZL5WSync, 4
_ZL5WSync:
	.zero	4
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
