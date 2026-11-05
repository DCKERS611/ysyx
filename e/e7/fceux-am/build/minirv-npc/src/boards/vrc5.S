#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"vrc5.cpp"
	.option nopic
	.text
	.section	.text._ZL8QTAiReadj,"ax",@progbits
	.align	2
	.type	_ZL8QTAiReadj, @function
_ZL8QTAiReadj:
	lla	a5,.LANCHOR0
	lbu	a3,12(a5)
	lbu	a4,13(a5)
	lbu	a2,11(a5)
	srli	t1,a3,2
	andi	t1,t1,24
	srli	a1,a4,4
	lla	a5,.LANCHOR1
	andi	a1,a1,7
	add	a5,a5,t1
	add	a5,a5,a1
	lbu	t1,0(a5)
	slli	a1,a2,5
	srli	a5,a4,1
	andi	a1,a1,-128
	andi	a5,a5,7
	or	a5,a5,a1
	andi	a1,t1,63
	or	a5,a5,a1
	andi	t0,t1,64
	mv	a1,a0
	andi	a5,a5,0xff
	beq	t0,zero,.L2
	andi	a5,a5,-5
	ori	a0,a5,64
.L3:
	li	a5,57344
	addi	t1,a5,-768
	beq	a1,t1,.L5
	addi	a5,a5,-1024
	li	a0,0
	beq	a1,a5,.L8
.L5:
	ret
.L8:
	slli	a0,a4,7
	andi	a2,a2,3
	slli	a3,a3,2
	or	a0,a0,a2
	andi	a3,a3,124
	or	a0,a0,a3
	andi	a0,a0,0xff
	ret
.L2:
	slli	t1,t1,24
	srai	t1,t1,24
	ori	a0,a5,68
	blt	t1,zero,.L3
	ori	a0,a5,64
	j	.L3
	.size	_ZL8QTAiReadj, .-_ZL8QTAiReadj
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lbu	a2,5(s0)
	li	a1,0
	li	a0,16
	andi	a2,a2,1
	sw	ra,8(sp)
	call	_Z8setchr4rijj
	li	a2,1
	li	a1,4096
	li	a0,16
	call	_Z8setchr4rijj
	lbu	a5,0(s0)
	li	a1,24576
	li	a0,16
	andi	a2,a5,1
	srli	a5,a5,2
	or	a2,a2,a5
	call	_Z8setprg4rijj
	lbu	a5,1(s0)
	li	a1,28672
	li	a0,16
	andi	a2,a5,1
	srli	a5,a5,2
	or	a2,a2,a5
	call	_Z8setprg4rijj
	la a5, PRGptr+4; lw a5, 0(a5);
	beq	a5,zero,.L13
	lbu	a2,2(s0)
	li	a1,32768
	srli	a0,a2,6
	andi	a0,a0,1
	andi	a2,a2,63
	call	_Z8setprg8rijj
	lbu	a2,3(s0)
	li	a1,40960
	srli	a0,a2,6
	andi	a0,a0,1
	andi	a2,a2,63
	call	_Z8setprg8rijj
	lbu	a2,4(s0)
	li	a1,49152
	srli	a0,a2,6
	andi	a0,a0,1
	andi	a2,a2,63
	call	_Z8setprg8rijj
	li	a2,-1
	li	a1,57344
	li	a0,1
	call	_Z8setprg8rijj
.L11:
	lbu	a0,10(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,1
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L13:
	lbu	a5,2(s0)
	li	a0,32768
	srli	a1,a5,2
	andi	a1,a1,16
	andi	a5,a5,63
	add	a1,a1,a5
	call	_Z7setprg8jj
	lbu	a5,3(s0)
	li	a0,40960
	srli	a1,a5,2
	andi	a1,a1,16
	andi	a5,a5,63
	add	a1,a1,a5
	call	_Z7setprg8jj
	lbu	a5,4(s0)
	li	a0,49152
	srli	a1,a5,2
	andi	a1,a1,16
	andi	a5,a5,63
	add	a1,a1,a5
	call	_Z7setprg8jj
	li	a1,79
	li	a0,57344
	call	_Z7setprg8jj
	j	.L11
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9QTAiClosev,"ax",@progbits
	.align	2
	.type	_ZL9QTAiClosev, @function
_ZL9QTAiClosev:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a0, .LANCHOR2; lw a0, 0(a0);
	beq	a0,zero,.L16
	call	_Z10FCEU_gfreePv
.L16:
	la a5, .LANCHOR2; sw zero, 0(a5);
	la a0, .LANCHOR3; lw a0, 0(a0);
	beq	a0,zero,.L17
	call	_Z10FCEU_gfreePv
.L17:
	lw	ra,8(sp)
	la a5, .LANCHOR3; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
	.size	_ZL9QTAiClosev, .-_ZL9QTAiClosev
	.section	.text._ZL9QTAiPowerv,"ax",@progbits
	.align	2
	.type	_ZL9QTAiPowerv, @function
_ZL9QTAiPowerv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	sw	ra,8(sp)
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	addi	a1,a1,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_ZL9QTAiWritejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,57344
	addi	a1,s0,-1024
	mv	a0,a1
	lla	a2,_ZL8QTAiReadj
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-768
	mv	a0,a1
	lla	a2,_ZL8QTAiReadj
	call	_Z14SetReadHandleriiPFhjE
	la a2, .LANCHOR3; lw a2, 0(a2);
	li	a1,24576
	li	a0,16
	call	_Z16FCEU_CheatAddRAMijPh
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
	.size	_ZL9QTAiPowerv, .-_ZL9QTAiPowerv
	.section	.text._ZL9QTAiWritejh,"ax",@progbits
	.align	2
	.type	_ZL9QTAiWritejh, @function
_ZL9QTAiWritejh:
	srli	a5,a0,8
	andi	a5,a5,15
	addi	sp,sp,-12
	lla	a3,.LANCHOR0
	add	a4,a3,a5
	sw	ra,8(sp)
	li	a5,57344
	sb	a1,0(a4)
	addi	a4,a5,-2048
	beq	a0,a4,.L28
	bleu	a0,a4,.L36
	addi	a4,a5,-1792
	beq	a0,a4,.L33
	addi	a5,a5,-1536
	bne	a0,a5,.L32
	lbu	a5,10(a3)
	andi	a5,a5,3
	la a4, qtaintramreg; sb a5, 0(a4);
.L32:
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
.L36:
	li	a5,53248
	addi	a4,a5,1536
	beq	a0,a4,.L30
	addi	a5,a5,1792
	bne	a0,a5,.L32
	lla	a4,.LANCHOR4
	lbu	a5,0(a4)
	slli	a1,a1,8
	lw	ra,8(sp)
	or	a5,a5,a1
	sw	a5,0(a4)
	addi	sp,sp,12
	tail	_ZL4Syncv
.L28:
	la a5, .LANCHOR7; lbu a5, 0(a5);
	li	a0,1
	la a4, .LANCHOR6; sb a5, 0(a4);
	call	_Z12X6502_IRQEndi
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
.L33:
	andi	a5,a1,2
	la a4, .LANCHOR4; lw a4, 0(a4);
	andi	a1,a1,1
	li	a0,1
	la a3, .LANCHOR5; sw a4, 0(a3);
	la a4, .LANCHOR6; sb a5, 0(a4);
	la a5, .LANCHOR7; sb a1, 0(a5);
	call	_Z12X6502_IRQEndi
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
.L30:
	lla	a3,.LANCHOR4
	lw	a5,0(a3)
	li	a4,65536
	addi	a4,a4,-256
	and	a5,a5,a4
	lw	ra,8(sp)
	or	a5,a5,a1
	sw	a5,0(a3)
	addi	sp,sp,12
	tail	_ZL4Syncv
	.size	_ZL9QTAiWritejh, .-_ZL9QTAiWritejh
	.section	.text._ZL7VRC5IRQi,"ax",@progbits
	.align	2
	.type	_ZL7VRC5IRQi, @function
_ZL7VRC5IRQi:
	la a5, .LANCHOR6; lbu a5, 0(a5);
	beq	a5,zero,.L45
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR5
	lw	a5,0(s0)
	sw	ra,8(sp)
	add	a0,a0,a5
	li	a5,65536
	sw	a0,0(s0)
	and	a0,a0,a5
	bne	a0,zero,.L48
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L45:
	ret
.L48:
	li	a0,1
	call	_Z14X6502_IRQBegini
	la a5, .LANCHOR4; lw a5, 0(a5);
	lw	ra,8(sp)
	sw	a5,0(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL7VRC5IRQi, .-_ZL7VRC5IRQi
	.section	.rodata._Z9QTAi_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CRAM"
	.align	2
.LC1:
	.string	"WRAM"
	.section	.text._Z9QTAi_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z9QTAi_InitP8CartInfo
	.hidden	_Z9QTAi_InitP8CartInfo
	.type	_Z9QTAi_InitP8CartInfo, @function
_Z9QTAi_InitP8CartInfo:
	addi	sp,sp,-12
	li	a5,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	la a4, QTAIHack; sw a5, 0(a4);
	lla	a5,_ZL9QTAiPowerv
	sw	a5,0(a0)
	lla	a5,_ZL9QTAiClosev
	sw	a5,8(a0)
	lla	a5,_ZL12StateRestorei
	mv	s0,a0
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a0,8192
	lla	a5,_ZL7VRC5IRQi
	la a4, MapIRQHook; sw a5, 0(a4);
	call	_Z12FCEU_gmallocj
	mv	a1,a0
	lla	s1,.LANCHOR2
	li	a3,1
	li	a2,8192
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a0,0(s1)
	lla	a3,.LC0
	li	a2,0
	li	a1,8192
	call	_Z10AddExStatePvjiPKc
	li	a0,16384
	call	_Z12FCEU_gmallocj
	mv	a1,a0
	lla	s1,.LANCHOR3
	li	a3,1
	li	a2,16384
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a0,0(s1)
	lla	a3,.LC1
	li	a2,0
	li	a1,16384
	call	_Z10AddExStatePvjiPKc
	lw	a5,48(s0)
	beq	a5,zero,.L50
	lw	a5,0(s1)
	li	a4,16384
	sw	a4,28(s0)
	sw	a5,12(s0)
.L50:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR8
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z9QTAi_InitP8CartInfo, .-_Z9QTAi_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"IRQC"
	.align	2
.LC3:
	.string	"IRQL"
	.align	2
.LC4:
	.string	"IRQA"
	.align	2
.LC5:
	.string	"KIRQ"
	.align	2
.LC6:
	.string	"REGS"
	.section	.bss._ZL4regs,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4regs, @object
	.size	_ZL4regs, 16
_ZL4regs:
	.zero	16
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR8,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 72
_ZL9StateRegs:
	.word	_ZL8IRQCount
	.word	1
	.word	.LC2
	.word	_ZL8IRQLatch
	.word	1
	.word	.LC3
	.word	_ZL4IRQa
	.word	1
	.word	.LC4
	.word	_ZL5K4IRQ
	.word	1
	.word	.LC5
	.word	_ZL4regs
	.word	16
	.word	.LC6
	.word	0
	.zero	8
	.section	.rodata._ZL8conv_tbl,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL8conv_tbl, @object
	.size	_ZL8conv_tbl, 32
_ZL8conv_tbl:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"@\020("
	.ascii	"\0300"
	.string	""
	.string	""
	.ascii	"H\0300\b 8"
	.string	""
	.string	""
	.ascii	"\200 8\020(\260"
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.set	.LANCHOR6,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL5K4IRQ,"aw",@nobits
	.set	.LANCHOR7,. + 0
	.type	_ZL5K4IRQ, @object
	.size	_ZL5K4IRQ, 1
_ZL5K4IRQ:
	.zero	1
	.section	.sbss._ZL6CHRRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL6CHRRAM, @object
	.size	_ZL6CHRRAM, 4
_ZL6CHRRAM:
	.zero	4
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 4
_ZL8IRQLatch:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
