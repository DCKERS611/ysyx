#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"vrc7p.cpp"
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
	lbu	a1,0(a5)
	li	a0,32768
	lla	s1,.LANCHOR1
	call	_Z7setprg8jj
	lla	a5,.LANCHOR0
	lbu	a1,1(a5)
	li	a0,40960
	li	s0,0
	call	_Z7setprg8jj
	lla	a5,.LANCHOR0
	lbu	a1,2(a5)
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
.L2:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	li	a5,8192
	addi	s1,s1,1
	bne	s0,a5,.L2
	la a5, .LANCHOR2; lbu a5, 0(a5);
	andi	a5,a5,3
	li	a4,2
	li	a0,2
	beq	a5,a4,.L8
	li	a4,3
	li	a0,3
	beq	a5,a4,.L8
	li	a4,1
	li	a0,1
	beq	a5,a4,.L10
.L8:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_Z9setmirrori
.L10:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL12UNLVRC7Powerv,"ax",@progbits
	.align	2
	.type	_ZL12UNLVRC7Powerv, @function
_ZL12UNLVRC7Powerv:
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
	lla	a2,_ZL12UNLVRC7Writejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL12UNLVRC7Powerv, .-_ZL12UNLVRC7Powerv
	.section	.text._ZL12UNLVRC7Writejh,"ax",@progbits
	.align	2
	.type	_ZL12UNLVRC7Writejh, @function
_ZL12UNLVRC7Writejh:
	li	a2,61440
	addi	a3,a2,8
	and	a0,a0,a3
	li	a4,49152
	beq	a0,a4,.L15
	bgtu	a0,a4,.L16
	li	a5,40960
	beq	a0,a5,.L17
	bleu	a0,a5,.L38
	li	a4,45056
	beq	a0,a4,.L23
	addi	a4,a4,8
	bne	a0,a4,.L39
	la a5, .LANCHOR1+3; sb a1, 0(a5);
	tail	_ZL4Syncv
.L16:
	li	a5,57344
	beq	a0,a5,.L26
	bleu	a0,a5,.L40
	beq	a0,a2,.L31
	bne	a0,a3,.L41
	la a5, .LANCHOR5; lbu a5, 0(a5);
	snez	a5,a5
	li	a0,1
	la a4, .LANCHOR4; sb a5, 0(a4);
	tail	_Z12X6502_IRQEndi
.L39:
	addi	a5,a5,8
	bne	a0,a5,.L42
	la a5, .LANCHOR1+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L38:
	li	a5,32768
	addi	a4,a5,8
	beq	a0,a4,.L19
	li	a4,36864
	bne	a0,a4,.L43
	la a5, .LANCHOR0+2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L41:
	addi	a5,a5,8
	bne	a0,a5,.L44
	li	a0,1
	la a5, .LANCHOR3; sb a1, 0(a5);
	tail	_Z12X6502_IRQEndi
.L40:
	li	a5,53248
	beq	a0,a5,.L28
	addi	a5,a5,8
	bne	a0,a5,.L45
	la a5, .LANCHOR1+7; sb a1, 0(a5);
	tail	_ZL4Syncv
.L43:
	bne	a0,a5,.L46
	la a5, .LANCHOR0; sb a1, 0(a5);
	tail	_ZL4Syncv
.L45:
	addi	a4,a4,8
	bne	a0,a4,.L47
	la a5, .LANCHOR1+5; sb a1, 0(a5);
	tail	_ZL4Syncv
.L15:
	la a5, .LANCHOR1+4; sb a1, 0(a5);
	tail	_ZL4Syncv
.L17:
	la a5, .LANCHOR1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L23:
	la a5, .LANCHOR1+2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L26:
	la a5, .LANCHOR2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L31:
	andi	a5,a1,2
	andi	a1,a1,1
	la a4, .LANCHOR4; sb a5, 0(a4);
	la a4, .LANCHOR5; sb a1, 0(a4);
	beq	a5,zero,.L34
	la a5, .LANCHOR3; lbu a5, 0(a5);
	la a4, .LANCHOR6; sw a5, 0(a4);
.L34:
	li	a0,1
	la a5, .LANCHOR7; sw zero, 0(a5);
	tail	_Z12X6502_IRQEndi
.L19:
	la a5, .LANCHOR0+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L28:
	la a5, .LANCHOR1+6; sb a1, 0(a5);
	tail	_ZL4Syncv
.L44:
	ret
.L42:
	ret
.L47:
	ret
.L46:
	ret
	.size	_ZL12UNLVRC7Writejh, .-_ZL12UNLVRC7Writejh
	.section	.text._ZL14UNLVRC7IRQHooki,"ax",@progbits
	.align	2
	.type	_ZL14UNLVRC7IRQHooki, @function
_ZL14UNLVRC7IRQHooki:
	la a5, .LANCHOR4; lbu a5, 0(a5);
	beq	a5,zero,.L60
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR7
	lw	a4,0(s0)
	slli	a5,a0,1
	add	a5,a5,a0
	add	a5,a5,a4
	sw	s1,0(sp)
	sw	ra,8(sp)
	sw	a5,0(s0)
	lla	s1,.LANCHOR6
.L51:
	lw	a4,0(s1)
	li	a3,0
	li	a2,340
	li	a1,248
.L52:
	ble	a5,a2,.L63
	addi	a4,a4,1
	addi	a5,a5,-341
	li	a3,1
	bne	a4,a1,.L52
	la a4, .LANCHOR3; lbu a4, 0(a4);
	li	a0,1
	sw	a5,0(s0)
	sw	a4,0(s1)
	call	_Z14X6502_IRQBegini
	lw	a5,0(s0)
	j	.L51
.L60:
	ret
.L63:
	beq	a3,zero,.L48
	sw	a4,0(s1)
	sw	a5,0(s0)
.L48:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL14UNLVRC7IRQHooki, .-_ZL14UNLVRC7IRQHooki
	.section	.text._Z12UNLVRC7_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12UNLVRC7_InitP8CartInfo
	.hidden	_Z12UNLVRC7_InitP8CartInfo
	.type	_Z12UNLVRC7_InitP8CartInfo, @function
_Z12UNLVRC7_InitP8CartInfo:
	lla	a5,_ZL12UNLVRC7Powerv
	sw	a5,0(a0)
	lla	a5,_ZL14UNLVRC7IRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR8
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z12UNLVRC7_InitP8CartInfo, .-_Z12UNLVRC7_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PRG"
	.align	2
.LC1:
	.string	"CHR"
	.align	2
.LC2:
	.string	"MIRR"
	.align	2
.LC3:
	.string	"IRQA"
	.align	2
.LC4:
	.string	"IRQD"
	.align	2
.LC5:
	.string	"IRQL"
	.align	2
.LC6:
	.string	"IRQC"
	.align	2
.LC7:
	.string	"CYCC"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR8,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 108
_ZL9StateRegs:
	.word	_ZL3prg
	.word	3
	.word	.LC0
	.word	_ZL3chr
	.word	8
	.word	.LC1
	.word	_ZL4mirr
	.word	1
	.word	.LC2
	.word	_ZL4IRQa
	.word	1
	.word	.LC3
	.word	_ZL4IRQd
	.word	1
	.word	.LC4
	.word	_ZL8IRQLatch
	.word	1
	.word	.LC5
	.word	_ZL8IRQCount
	.word	4
	.word	.LC6
	.word	_ZL10CycleCount
	.word	4
	.word	.LC7
	.word	0
	.zero	8
	.section	.sbss._ZL10CycleCount,"aw",@nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	_ZL10CycleCount, @object
	.size	_ZL10CycleCount, 4
_ZL10CycleCount:
	.zero	4
	.section	.sbss._ZL3chr,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL3chr, @object
	.size	_ZL3chr, 8
_ZL3chr:
	.zero	8
	.section	.sbss._ZL3prg,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL3prg, @object
	.size	_ZL3prg, 3
_ZL3prg:
	.zero	3
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4IRQd,"aw",@nobits
	.set	.LANCHOR5,. + 0
	.type	_ZL4IRQd, @object
	.size	_ZL4IRQd, 1
_ZL4IRQd:
	.zero	1
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 1
_ZL8IRQLatch:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
