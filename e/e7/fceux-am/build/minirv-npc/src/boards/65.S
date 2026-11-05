#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"65.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,.LANCHOR0
	lbu	a0,0(a5)
	lla	s0,.LANCHOR2
	li	s1,4096
	call	_Z9setmirrori
	lla	a5,.LANCHOR1
	lbu	a1,0(a5)
	li	a0,32768
	call	_Z7setprg8jj
	lla	a5,.LANCHOR1
	lbu	a1,1(a5)
	li	a0,40960
	call	_Z7setprg8jj
	lla	a5,.LANCHOR1
	lbu	a1,2(a5)
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
	lbu	a1,0(s0)
	li	a0,0
	call	_Z7setchr1jj
	lbu	a1,1(s0)
	li	a0,1024
	call	_Z7setchr1jj
	lbu	a1,2(s0)
	addi	a0,s1,-2048
	call	_Z7setchr1jj
	lbu	a1,3(s0)
	addi	a0,s1,-1024
	call	_Z7setchr1jj
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
	addi	a0,s1,-1024
	call	_Z7setchr1jj
	lla	a5,.LANCHOR0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lbu	a0,0(a5)
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M65Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M65Powerv, @function
_ZL8M65Powerv:
	addi	sp,sp,-12
	li	a5,-2
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a4, .LANCHOR1+2; sb a5, 0(a4);
	li	s0,65536
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL8M65Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL8M65Powerv, .-_ZL8M65Powerv
	.section	.text._ZL8M65Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M65Writejh, @function
_ZL8M65Writejh:
	li	a5,45056
	addi	a4,a5,7
	bgtu	a0,a4,.L8
	bgeu	a0,a5,.L9
	li	a5,36864
	addi	a4,a5,6
	bgtu	a0,a4,.L10
	bleu	a0,a5,.L31
	li	a5,-36864
	addi	a5,a5,-1
	add	a5,a0,a5
	li	a4,5
	bgtu	a5,a4,.L7
	lla	a4,.L24
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL8M65Writejh,"a",@progbits
	.align	2
	.align	2
.L24:
	.word	.L28-.L24
	.word	.L7-.L24
	.word	.L27-.L24
	.word	.L26-.L24
	.word	.L25-.L24
	.word	.L23-.L24
	.section	.text._ZL8M65Writejh
.L8:
	li	a5,49152
	bne	a0,a5,.L32
	la a5, .LANCHOR1+2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L31:
	li	a5,32768
	bne	a0,a5,.L33
	la a5, .LANCHOR1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L10:
	li	a5,40960
	bne	a0,a5,.L34
	la a5, .LANCHOR1+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L9:
	li	a5,-45056
	addi	a5,a5,-1
	add	a5,a0,a5
	li	a4,6
	bgtu	a5,a4,.L14
	lla	a4,.L16
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL8M65Writejh
	.align	2
	.align	2
.L16:
	.word	.L22-.L16
	.word	.L21-.L16
	.word	.L20-.L16
	.word	.L19-.L16
	.word	.L18-.L16
	.word	.L17-.L16
	.word	.L15-.L16
	.section	.text._ZL8M65Writejh
.L7:
	ret
.L32:
	ret
.L33:
	ret
.L34:
	ret
.L23:
	la a5, .LANCHOR5; sb a1, 0(a5);
	ret
.L28:
	srli	a1,a1,7
	xori	a1,a1,1
	la a5, .LANCHOR0; sb a1, 0(a5);
	tail	_ZL4Syncv
.L27:
	andi	a1,a1,-128
	li	a0,1
	la a5, .LANCHOR3; sb a1, 0(a5);
	tail	_Z12X6502_IRQEndi
.L26:
	la a5, .LANCHOR5; lhu a5, 0(a5);
	la a4, .LANCHOR4; sh a5, 0(a4);
	ret
.L25:
	lla	a4,.LANCHOR5
	lbu	a5,0(a4)
	slli	a1,a1,8
	or	a5,a5,a1
	sh	a5,0(a4)
	ret
.L15:
	la a5, .LANCHOR2+7; sb a1, 0(a5);
	tail	_ZL4Syncv
.L17:
	la a5, .LANCHOR2+6; sb a1, 0(a5);
	tail	_ZL4Syncv
.L22:
	la a5, .LANCHOR2+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L21:
	la a5, .LANCHOR2+2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L20:
	la a5, .LANCHOR2+3; sb a1, 0(a5);
	tail	_ZL4Syncv
.L19:
	la a5, .LANCHOR2+4; sb a1, 0(a5);
	tail	_ZL4Syncv
.L18:
	la a5, .LANCHOR2+5; sb a1, 0(a5);
	tail	_ZL4Syncv
.L14:
	la a5, .LANCHOR2; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL8M65Writejh, .-_ZL8M65Writejh
	.section	.text._Z6M65IRQi,"ax",@progbits
	.align	2
	.globl	_Z6M65IRQi
	.hidden	_Z6M65IRQi
	.type	_Z6M65IRQi, @function
_Z6M65IRQi:
	la a5, .LANCHOR3; lbu a5, 0(a5);
	beq	a5,zero,.L40
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR4
	lhu	a5,0(s0)
	sw	ra,8(sp)
	li	a4,-4
	sub	a0,a5,a0
	slli	a0,a0,16
	srai	a0,a0,16
	sh	a0,0(s0)
	blt	a0,a4,.L43
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L40:
	ret
.L43:
	li	a0,1
	call	_Z14X6502_IRQBegini
	la a5, .LANCHOR3; sb zero, 0(a5);
	li	a5,-1
	lw	ra,8(sp)
	sh	a5,0(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	_Z6M65IRQi, .-_Z6M65IRQi
	.section	.text._Z13Mapper65_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper65_InitP8CartInfo
	.hidden	_Z13Mapper65_InitP8CartInfo
	.type	_Z13Mapper65_InitP8CartInfo, @function
_Z13Mapper65_InitP8CartInfo:
	lla	a5,_ZL8M65Powerv
	sw	a5,0(a0)
	lla	a5,_Z6M65IRQi
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR6
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper65_InitP8CartInfo, .-_Z13Mapper65_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PREG"
	.align	2
.LC1:
	.string	"CREG"
	.align	2
.LC2:
	.string	"MIRR"
	.align	2
.LC3:
	.string	"IRQA"
	.align	2
.LC4:
	.string	"IRQC"
	.align	2
.LC5:
	.string	"IRQL"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR6,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 84
_ZL9StateRegs:
	.word	_ZL4preg
	.word	3
	.word	.LC0
	.word	_ZL4creg
	.word	8
	.word	.LC1
	.word	_ZL4mirr
	.word	1
	.word	.LC2
	.word	_ZL4IRQa
	.word	1
	.word	.LC3
	.word	_ZL8IRQCount
	.word	2
	.word	.LC4
	.word	_ZL8IRQLatch
	.word	2
	.word	.LC5
	.word	0
	.zero	8
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4creg,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL4creg, @object
	.size	_ZL4creg, 8
_ZL4creg:
	.zero	8
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL4preg,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL4preg, @object
	.size	_ZL4preg, 3
_ZL4preg:
	.zero	3
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
