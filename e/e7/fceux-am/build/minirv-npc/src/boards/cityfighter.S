#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"cityfighter.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	lla	s0,.LANCHOR0
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,2
	call	_Z8setprg32jj
	la a5, .LANCHOR1; lbu a5, 0(a5);
	beq	a5,zero,.L16
.L2:
	lla	s1,.LANCHOR2
	li	s0,0
.L3:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	li	a5,8192
	addi	s1,s1,1
	bne	s0,a5,.L3
	la a5, .LANCHOR3; lbu a5, 0(a5);
	li	a4,2
	beq	a5,a4,.L4
	bgtu	a5,a4,.L5
	li	a0,0
	beq	a5,zero,.L17
.L14:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_Z9setmirrori
.L5:
	li	a4,3
	li	a0,3
	beq	a5,a4,.L14
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L16:
	lbu	a1,0(s0)
	li	a0,49152
	call	_Z7setprg8jj
	j	.L2
.L17:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L4:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a0,2
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL17UNLCITYFIGHTPowerv,"ax",@progbits
	.align	2
	.type	_ZL17UNLCITYFIGHTPowerv, @function
_ZL17UNLCITYFIGHTPowerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR0; sb zero, 0(a5);
	call	_ZL4Syncv
	li	a0,16384
	addi	a0,a0,17
	call	_Z15GetWriteHandleri
	li	s0,65536
	mv	a5,a0
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	la a4, .LANCHOR4; sw a5, 0(a4);
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL17UNLCITYFIGHTWritejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL17UNLCITYFIGHTPowerv, .-_ZL17UNLCITYFIGHTPowerv
	.section	.text._ZL17UNLCITYFIGHTWritejh,"ax",@progbits
	.align	2
	.type	_ZL17UNLCITYFIGHTWritejh, @function
_ZL17UNLCITYFIGHTWritejh:
	li	a4,61440
	addi	a5,a4,12
	and	a5,a0,a5
	li	a2,53248
	beq	a5,a2,.L22
	addi	sp,sp,-12
	sw	ra,8(sp)
	bgtu	a5,a2,.L23
	li	a3,40960
	addi	a2,a3,12
	beq	a5,a2,.L24
	bleu	a5,a2,.L59
	li	a4,45056
	addi	a3,a4,8
	beq	a5,a3,.L34
	bleu	a5,a3,.L60
	addi	a4,a4,12
	beq	a5,a4,.L38
	li	a4,-49152
	add	a4,a5,a4
	li	a5,12
	bleu	a4,a5,.L61
.L29:
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
.L23:
	li	a3,57344
	addi	a0,a3,8
	beq	a5,a0,.L40
	bleu	a5,a0,.L62
	addi	a2,a4,4
	beq	a5,a2,.L48
	bleu	a5,a2,.L63
	addi	a4,a4,8
	bne	a5,a4,.L29
	andi	a1,a1,2
	li	a0,1
	la a5, .LANCHOR6; sb a1, 0(a5);
	call	_Z12X6502_IRQEndi
	j	.L29
.L61:
	li	a5,4096
	addi	a5,a5,273
	srl	a5,a5,a4
	andi	a5,a5,1
	beq	a5,zero,.L29
	andi	a1,a1,1
	la a5, .LANCHOR1; sb a1, 0(a5);
	j	.L29
.L63:
	addi	a3,a3,12
	beq	a5,a3,.L50
	bne	a5,a4,.L29
	lla	a4,.LANCHOR5
	lw	a5,0(a4)
	slli	a1,a1,1
	andi	a1,a1,30
	andi	a5,a5,480
	or	a5,a5,a1
	sw	a5,0(a4)
	j	.L29
.L62:
	addi	a4,a2,12
	beq	a5,a4,.L42
	bleu	a5,a4,.L64
	beq	a5,a3,.L46
	addi	a3,a3,4
	bne	a5,a3,.L29
	lla	a4,.LANCHOR2
	lbu	a5,6(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,6(a4)
	j	.L29
.L60:
	beq	a5,a4,.L36
	addi	a4,a4,4
	bne	a5,a4,.L29
	lla	a4,.LANCHOR2
	lbu	a5,4(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,4(a4)
	j	.L29
.L59:
	beq	a5,a3,.L26
	bleu	a5,a3,.L65
	addi	a4,a3,4
	beq	a5,a4,.L32
	addi	a3,a3,8
	bne	a5,a3,.L29
	lla	a4,.LANCHOR2
	lbu	a5,3(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,3(a4)
	j	.L29
.L64:
	addi	a4,a2,4
	beq	a5,a4,.L44
	addi	a2,a2,8
	bne	a5,a2,.L29
	lla	a4,.LANCHOR2
	lbu	a5,1(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,1(a4)
	j	.L29
.L65:
	li	a3,36864
	beq	a5,a3,.L28
	bltu	a5,a3,.L29
	addi	a2,a3,8
	beq	a5,a2,.L30
	addi	a4,a4,4
	and	a4,a0,a4
	addi	a3,a3,4
	bne	a4,a3,.L29
.L30:
	srli	a0,a0,11
	andi	a0,a0,1
	beq	a0,zero,.L53
	slli	a1,a1,3
	li	a0,16384
	andi	a1,a1,120
	addi	a0,a0,17
	la a5, .LANCHOR4; lw a5, 0(a5);
	jalr	a5
	j	.L29
.L53:
	andi	a1,a1,12
	la a5, .LANCHOR0; sb a1, 0(a5);
	j	.L29
.L48:
	lla	a4,.LANCHOR5
	lw	a5,0(a4)
	slli	a1,a1,5
	andi	a1,a1,480
	andi	a5,a5,30
	or	a5,a5,a1
	sw	a5,0(a4)
	j	.L29
.L40:
	lla	a4,.LANCHOR2
	lbu	a5,7(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,7(a4)
	j	.L29
.L38:
	lla	a4,.LANCHOR2
	lbu	a5,5(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,5(a4)
	j	.L29
.L34:
	lla	a4,.LANCHOR2
	lbu	a5,5(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,5(a4)
	j	.L29
.L24:
	lla	a4,.LANCHOR2
	lbu	a5,3(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,3(a4)
	j	.L29
.L22:
	lla	a4,.LANCHOR2
	lbu	a5,0(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,0(a4)
	tail	_ZL4Syncv
.L26:
	lla	a4,.LANCHOR2
	lbu	a5,2(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,2(a4)
	j	.L29
.L36:
	lla	a4,.LANCHOR2
	lbu	a5,4(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,4(a4)
	j	.L29
.L46:
	lla	a4,.LANCHOR2
	lbu	a5,6(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,6(a4)
	j	.L29
.L42:
	lla	a4,.LANCHOR2
	lbu	a5,1(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,1(a4)
	j	.L29
.L44:
	lla	a4,.LANCHOR2
	lbu	a5,0(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,0(a4)
	j	.L29
.L32:
	lla	a4,.LANCHOR2
	lbu	a5,2(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,2(a4)
	j	.L29
.L28:
	andi	a5,a1,12
	andi	a1,a1,3
	la a4, .LANCHOR0; sb a5, 0(a4);
	la a5, .LANCHOR3; sb a1, 0(a5);
	j	.L29
.L50:
	lla	a4,.LANCHOR2
	lbu	a5,7(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,7(a4)
	j	.L29
	.size	_ZL17UNLCITYFIGHTWritejh, .-_ZL17UNLCITYFIGHTWritejh
	.section	.text._ZL15UNLCITYFIGHTIRQi,"ax",@progbits
	.align	2
	.type	_ZL15UNLCITYFIGHTIRQi, @function
_ZL15UNLCITYFIGHTIRQi:
	la a5, .LANCHOR6; lbu a5, 0(a5);
	beq	a5,zero,.L66
	lla	a4,.LANCHOR5
	lw	a5,0(a4)
	sub	a5,a5,a0
	sw	a5,0(a4)
	ble	a5,zero,.L70
.L66:
	ret
.L70:
	li	a0,1
	tail	_Z14X6502_IRQBegini
	.size	_ZL15UNLCITYFIGHTIRQi, .-_ZL15UNLCITYFIGHTIRQi
	.section	.text._Z17UNLCITYFIGHT_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z17UNLCITYFIGHT_InitP8CartInfo
	.hidden	_Z17UNLCITYFIGHT_InitP8CartInfo
	.type	_Z17UNLCITYFIGHT_InitP8CartInfo, @function
_Z17UNLCITYFIGHT_InitP8CartInfo:
	lla	a5,_ZL17UNLCITYFIGHTPowerv
	sw	a5,0(a0)
	lla	a5,_ZL15UNLCITYFIGHTIRQi
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR7
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z17UNLCITYFIGHT_InitP8CartInfo, .-_Z17UNLCITYFIGHT_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"IRQC"
	.align	2
.LC1:
	.string	"IRQA"
	.align	2
.LC2:
	.string	"PREG"
	.align	2
.LC3:
	.string	"PMOD"
	.align	2
.LC4:
	.string	"MIRR"
	.align	2
.LC5:
	.string	"CREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR7,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 84
_ZL9StateRegs:
	.word	_ZL8IRQCount
	.word	4
	.word	.LC0
	.word	_ZL4IRQa
	.word	1
	.word	.LC1
	.word	_ZL7prg_reg
	.word	1
	.word	.LC2
	.word	_ZL8prg_mode
	.word	1
	.word	.LC3
	.word	_ZL4mirr
	.word	1
	.word	.LC4
	.word	_ZL7chr_reg
	.word	8
	.word	.LC5
	.word	0
	.zero	8
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR6,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL7chr_reg,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL7chr_reg, @object
	.size	_ZL7chr_reg, 8
_ZL7chr_reg:
	.zero	8
	.section	.sbss._ZL7prg_reg,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL7prg_reg, @object
	.size	_ZL7prg_reg, 1
_ZL7prg_reg:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.section	.sbss._ZL8pcmwrite,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL8pcmwrite, @object
	.size	_ZL8pcmwrite, 4
_ZL8pcmwrite:
	.zero	4
	.section	.sbss._ZL8prg_mode,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL8prg_mode, @object
	.size	_ZL8prg_mode, 1
_ZL8prg_mode:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
