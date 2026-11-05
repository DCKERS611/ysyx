#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"33.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	la a0, .LANCHOR0; lbu a0, 0(a0);
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	s0,.LANCHOR1
	call	_Z9setmirrori
	lbu	a1,0(s0)
	li	a0,32768
	li	s1,4096
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	li	a1,-2
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,0
	call	_Z7setchr2jj
	lbu	a1,3(s0)
	addi	a0,s1,-2048
	call	_Z7setchr2jj
	lbu	a1,4(s0)
	li	a0,4096
	call	_Z7setchr1jj
	lbu	a1,5(s0)
	addi	a0,s1,1024
	call	_Z7setchr1jj
	lbu	a1,6(s0)
	li	a5,8192
	addi	a0,a5,-2048
	mv	s1,a5
	call	_Z7setchr1jj
	lbu	a1,7(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	a0,s1,-1024
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_Z7setchr1jj
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M33Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M33Writejh, @function
_ZL8M33Writejh:
	li	a5,61440
	addi	a5,a5,3
	and	a0,a0,a5
	li	a5,40960
	beq	a0,a5,.L6
	bgtu	a0,a5,.L7
	li	a5,32768
	addi	a4,a5,2
	beq	a0,a4,.L8
	bleu	a0,a4,.L19
	addi	a5,a5,3
	bne	a0,a5,.L20
	la a5, .LANCHOR1+3; sb a1, 0(a5);
	tail	_ZL4Syncv
.L7:
	addi	a4,a5,2
	beq	a0,a4,.L14
	addi	a4,a5,3
	bne	a0,a4,.L21
	la a5, .LANCHOR1+7; sb a1, 0(a5);
.L18:
	tail	_ZL4Syncv
.L19:
	beq	a0,a5,.L10
	addi	a5,a5,1
	bne	a0,a5,.L22
	andi	a1,a1,63
	la a5, .LANCHOR1+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L21:
	addi	a5,a5,1
	bne	a0,a5,.L23
	la a5, .LANCHOR1+5; sb a1, 0(a5);
	tail	_ZL4Syncv
.L20:
	ret
.L14:
	la a5, .LANCHOR1+6; sb a1, 0(a5);
	tail	_ZL4Syncv
.L10:
	andi	a5,a1,63
	la a4, .LANCHOR1; sb a5, 0(a4);
	la a5, .LANCHOR2; lbu a5, 0(a5);
	bne	a5,zero,.L18
	srli	a1,a1,6
	xori	a5,a1,1
	andi	a5,a5,1
	la a4, .LANCHOR0; sb a5, 0(a4);
	j	.L18
.L6:
	la a5, .LANCHOR1+4; sb a1, 0(a5);
	tail	_ZL4Syncv
.L8:
	la a5, .LANCHOR1+2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L22:
	ret
.L23:
	ret
	.size	_ZL8M33Writejh, .-_ZL8M33Writejh
	.section	.text._ZL8M33Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M33Powerv, @function
_ZL8M33Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_ZL4Syncv
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL8M33Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL8M33Powerv, .-_ZL8M33Powerv
	.section	.text._ZL8M48Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M48Powerv, @function
_ZL8M48Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_ZL4Syncv
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,49152
	lla	a2,_ZL8M33Writejh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL8M48Writejh
	li	a0,49152
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL8M48Powerv, .-_ZL8M48Powerv
	.section	.text._ZL6M48IRQv,"ax",@progbits
	.align	2
	.type	_ZL6M48IRQv, @function
_ZL6M48IRQv:
	la a5, .LANCHOR3; lbu a5, 0(a5);
	beq	a5,zero,.L33
	lla	a4,.LANCHOR4
	lhu	a5,0(a4)
	li	a3,256
	addi	a5,a5,1
	slli	a5,a5,16
	srai	a5,a5,16
	sh	a5,0(a4)
	beq	a5,a3,.L36
.L33:
	ret
.L36:
	addi	sp,sp,-12
	li	a0,1
	sw	ra,8(sp)
	call	_Z14X6502_IRQBegini
	lw	ra,8(sp)
	la a5, .LANCHOR3; sb zero, 0(a5);
	addi	sp,sp,12
	jr	ra
	.size	_ZL6M48IRQv, .-_ZL6M48IRQv
	.section	.text._ZL8M48Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M48Writejh, @function
_ZL8M48Writejh:
	li	a4,61440
	addi	a4,a4,3
	li	a5,49152
	and	a0,a0,a4
	addi	a4,a5,2
	beq	a0,a4,.L38
	bleu	a0,a4,.L45
	addi	a5,a5,3
	beq	a0,a5,.L43
	li	a5,57344
	bne	a0,a5,.L46
	srli	a1,a1,6
	xori	a1,a1,1
	andi	a1,a1,1
	la a5, .LANCHOR0; sb a1, 0(a5);
	tail	_ZL4Syncv
.L45:
	beq	a0,a5,.L40
	addi	a5,a5,1
	bne	a0,a5,.L47
	la a5, .LANCHOR5; lhu a5, 0(a5);
	la a4, .LANCHOR4; sh a5, 0(a4);
	ret
.L38:
	li	a5,1
	la a4, .LANCHOR3; sb a5, 0(a4);
	ret
.L43:
	li	a0,1
	la a5, .LANCHOR3; sb zero, 0(a5);
	tail	_Z12X6502_IRQEndi
.L40:
	la a5, .LANCHOR5; sh a1, 0(a5);
	ret
.L46:
	ret
.L47:
	ret
	.size	_ZL8M48Writejh, .-_ZL8M48Writejh
	.section	.text._Z13Mapper33_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper33_InitP8CartInfo
	.hidden	_Z13Mapper33_InitP8CartInfo
	.type	_Z13Mapper33_InitP8CartInfo, @function
_Z13Mapper33_InitP8CartInfo:
	lla	a5,_ZL8M33Powerv
	sw	a5,0(a0)
	la a5, .LANCHOR2; sb zero, 0(a5);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR6
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper33_InitP8CartInfo, .-_Z13Mapper33_InitP8CartInfo
	.section	.text._Z13Mapper48_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper48_InitP8CartInfo
	.hidden	_Z13Mapper48_InitP8CartInfo
	.type	_Z13Mapper48_InitP8CartInfo, @function
_Z13Mapper48_InitP8CartInfo:
	lla	a5,_ZL8M48Powerv
	sw	a5,0(a0)
	li	a5,1
	la a4, .LANCHOR2; sb a5, 0(a4);
	lla	a5,_ZL6M48IRQv
	la a4, GameHBIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR6
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper48_InitP8CartInfo, .-_Z13Mapper48_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PREG"
	.align	2
.LC1:
	.string	"MIRR"
	.align	2
.LC2:
	.string	"IRQA"
	.align	2
.LC3:
	.string	"IRQC"
	.align	2
.LC4:
	.string	"IRQL"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR6,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 72
_ZL9StateRegs:
	.word	_ZL4regs
	.word	8
	.word	.LC0
	.word	_ZL4mirr
	.word	1
	.word	.LC1
	.word	_ZL4IRQa
	.word	1
	.word	.LC2
	.word	_ZL8IRQCount
	.word	2
	.word	.LC3
	.word	_ZL8IRQLatch
	.word	2
	.word	.LC4
	.word	0
	.zero	8
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4is48,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL4is48, @object
	.size	_ZL4is48, 1
_ZL4is48:
	.zero	1
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL4regs,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL4regs, @object
	.size	_ZL4regs, 8
_ZL4regs:
	.zero	8
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	1
	.set	.LANCHOR4,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 2
_ZL8IRQCount:
	.zero	2
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.align	1
	.set	.LANCHOR5,. + 0
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 2
_ZL8IRQLatch:
	.zero	2
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
