#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"43.cpp"
	.option nopic
	.text
	.section	.text._ZL8M43Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M43Resetv, @function
_ZL8M43Resetv:
	ret
	.size	_ZL8M43Resetv, .-_ZL8M43Resetv
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	li	a1,16
	li	a0,20480
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z7setprg4jj
	lla	s0,.LANCHOR0
	lbu	a1,0(s0)
	li	a0,24576
	seqz	a1,a1
	slli	a1,a1,1
	call	_Z7setprg8jj
	li	a1,1
	li	a0,32768
	call	_Z7setprg8jj
	li	a1,0
	li	a0,40960
	call	_Z7setprg8jj
	la a1, .LANCHOR1; lbu a1, 0(a1);
	li	a0,49152
	call	_Z7setprg8jj
	lbu	a1,0(s0)
	li	a0,57344
	seqz	a1,a1
	addi	a1,a1,8
	call	_Z7setprg8jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M43Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M43Powerv, @function
_ZL8M43Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR0; sb zero, 0(a5);
	li	s0,65536
	la a5, .LANCHOR1; sb zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,16384
	lla	a2,_ZL8M43Writejh
	addi	a0,a0,32
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL8M43Powerv, .-_ZL8M43Powerv
	.section	.text._ZL8M43Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M43Writejh, @function
_ZL8M43Writejh:
	addi	sp,sp,-44
	lla	a5,.LANCHOR2
	lw	t2,4(a5)
	lw	t0,8(a5)
	lw	t1,12(a5)
	lw	a2,16(a5)
	lw	a3,20(a5)
	lw	a4,24(a5)
	sw	s0,36(sp)
	lw	s0,0(a5)
	lw	a5,28(a5)
	sw	s1,32(sp)
	li	s1,16384
	sw	a5,28(sp)
	li	a5,61440
	addi	a5,a5,511
	and	a0,a0,a5
	sw	ra,40(sp)
	sw	s0,0(sp)
	sw	t2,4(sp)
	sw	t0,8(sp)
	sw	t1,12(sp)
	sw	a2,16(sp)
	sw	a3,20(sp)
	sw	a4,24(sp)
	addi	a5,s1,288
	beq	a0,a5,.L11
	bgtu	a0,a5,.L12
	addi	s1,s1,34
	bne	a0,s1,.L10
	andi	a1,a1,7
	slli	a1,a1,2
	addi	a5,a1,32
	add	a1,a5,sp
	lw	a5,-32(a1)
	lw	s0,36(sp)
	lw	ra,40(sp)
	lw	s1,32(sp)
	la a4, .LANCHOR1; sb a5, 0(a4);
	addi	sp,sp,44
	tail	_ZL4Syncv
.L12:
	li	a5,-16384
	addi	a4,a5,-290
	add	a0,a0,a4
	addi	a5,a5,-1
	and	a0,a0,a5
	beq	a0,zero,.L18
.L10:
	lw	ra,40(sp)
	lw	s0,36(sp)
	lw	s1,32(sp)
	addi	sp,sp,44
	jr	ra
.L11:
	lw	s0,36(sp)
	lw	ra,40(sp)
	lw	s1,32(sp)
	andi	a1,a1,1
	la a5, .LANCHOR0; sb a1, 0(a5);
	addi	sp,sp,44
	tail	_ZL4Syncv
.L18:
	andi	a1,a1,1
	li	a0,1
	la a5, .LANCHOR3; sw a1, 0(a5);
	call	_Z12X6502_IRQEndi
	lw	ra,40(sp)
	lw	s0,36(sp)
	la a5, .LANCHOR4; sw zero, 0(a5);
	lw	s1,32(sp)
	addi	sp,sp,44
	jr	ra
	.size	_ZL8M43Writejh, .-_ZL8M43Writejh
	.section	.text._ZL10M43IRQHooki,"ax",@progbits
	.align	2
	.type	_ZL10M43IRQHooki, @function
_ZL10M43IRQHooki:
	lla	a5,.LANCHOR4
	lw	a3,0(a5)
	la a4, .LANCHOR3; lw a4, 0(a4);
	add	a0,a0,a3
	sw	a0,0(a5)
	beq	a4,zero,.L19
	li	a5,4096
	bgeu	a0,a5,.L24
.L19:
	ret
.L24:
	li	a0,1
	la a5, .LANCHOR3; sw zero, 0(a5);
	tail	_Z14X6502_IRQBegini
	.size	_ZL10M43IRQHooki, .-_ZL10M43IRQHooki
	.section	.text._Z13Mapper43_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper43_InitP8CartInfo
	.hidden	_Z13Mapper43_InitP8CartInfo
	.type	_Z13Mapper43_InitP8CartInfo, @function
_Z13Mapper43_InitP8CartInfo:
	lla	a5,_ZL8M43Powerv
	sw	a5,0(a0)
	lla	a5,_ZL8M43Resetv
	sw	a5,4(a0)
	lla	a5,_ZL10M43IRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR5
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper43_InitP8CartInfo, .-_Z13Mapper43_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"IRQC"
	.align	2
.LC2:
	.string	"IRQA"
	.align	2
.LC3:
	.string	"REG"
	.align	2
.LC4:
	.string	"SWAP"
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
.LC0:
	.word	4
	.word	3
	.word	5
	.word	3
	.word	6
	.word	3
	.word	7
	.word	3
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 60
_ZL9StateRegs:
	.word	_ZL8IRQCount
	.word	4
	.word	.LC1
	.word	_ZL4IRQa
	.word	4
	.word	.LC2
	.word	_ZL3reg
	.word	1
	.word	.LC3
	.word	_ZL4swap
	.word	1
	.word	.LC4
	.word	0
	.zero	8
	.section	.sbss._ZL3reg,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 4
_ZL4IRQa:
	.zero	4
	.section	.sbss._ZL4swap,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL4swap, @object
	.size	_ZL4swap, 1
_ZL4swap:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
