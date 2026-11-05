#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"252.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-12
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	s0,.LANCHOR0
	call	_Z8setprg8rijj
	lbu	a1,0(s0)
	li	a0,32768
	lla	s1,.LANCHOR1
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	li	s0,0
	call	_Z7setprg8jj
	li	a1,-2
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
	j	.L4
.L2:
	mv	a1,a4
	call	_Z7setchr1jj
	addi	s0,s0,1024
	li	a5,8192
	addi	s1,s1,1
	beq	s0,a5,.L8
.L4:
	lbu	a4,0(s1)
	li	a3,1
	mv	a0,s0
	addi	a5,a4,-6
	andi	a5,a5,0xff
	mv	a1,s0
	andi	a2,a4,1
	bgtu	a5,a3,.L2
	li	a0,16
	call	_Z8setchr1rijj
	addi	s0,s0,1024
	li	a5,8192
	addi	s1,s1,1
	bne	s0,a5,.L4
.L8:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M252Closev,"ax",@progbits
	.align	2
	.type	_ZL9M252Closev, @function
_ZL9M252Closev:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a0, .LANCHOR2; lw a0, 0(a0);
	beq	a0,zero,.L11
	call	_Z10FCEU_gfreePv
.L11:
	la a0, .LANCHOR3; lw a0, 0(a0);
	beq	a0,zero,.L12
	call	_Z10FCEU_gfreePv
.L12:
	lw	ra,8(sp)
	la a5, .LANCHOR3; sw zero, 0(a5);
	la a5, .LANCHOR2; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
	.size	_ZL9M252Closev, .-_ZL9M252Closev
	.section	.text._ZL9M252Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M252Powerv, @function
_ZL9M252Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_ZL4Syncv
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL9M252Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR4; lw a0, 0(a0);
	la a2, .LANCHOR2; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL9M252Powerv, .-_ZL9M252Powerv
	.section	.text._ZL7M252IRQi,"ax",@progbits
	.align	2
	.type	_ZL7M252IRQi, @function
_ZL7M252IRQi:
	la a5, .LANCHOR5; lw a5, 0(a5);
	beq	a5,zero,.L35
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR6
	lw	a4,0(s0)
	slli	a5,a0,1
	add	a5,a5,a0
	add	a5,a5,a4
	sw	ra,8(sp)
	sw	s1,0(sp)
	sw	a5,0(s0)
	li	a4,340
	ble	a5,a4,.L22
	lla	s1,.LANCHOR7
	lw	a4,0(s1)
.L26:
	li	a2,0
	li	a1,340
.L27:
	ble	a5,a1,.L38
	addi	a4,a4,1
	andi	a3,a4,256
	addi	a5,a5,-341
	li	a2,1
	beq	a3,zero,.L27
	li	a0,1
	sw	a4,0(s1)
	sw	a5,0(s0)
	call	_Z14X6502_IRQBegini
	la a4, .LANCHOR8; lw a4, 0(a4);
	lw	a5,0(s0)
	sw	a4,0(s1)
	j	.L26
.L38:
	beq	a2,zero,.L22
	sw	a4,0(s1)
	sw	a5,0(s0)
.L22:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L35:
	ret
	.size	_ZL7M252IRQi, .-_ZL7M252IRQi
	.section	.text._ZL9M252Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M252Writejh, @function
_ZL9M252Writejh:
	addi	sp,sp,-12
	li	a5,-45056
	sw	s0,4(sp)
	sw	ra,8(sp)
	add	a5,a0,a5
	li	a4,16384
	mv	s0,a1
	bltu	a5,a4,.L53
	li	a5,61440
	addi	a4,a5,12
	and	a0,a0,a4
	beq	a0,a5,.L41
	bleu	a0,a5,.L54
	addi	a4,a5,4
	beq	a0,a4,.L49
	addi	a5,a5,8
	bne	a0,a5,.L39
	li	a0,1
	call	_Z12X6502_IRQEndi
	la a5, .LANCHOR6; sw zero, 0(a5);
	la a5, .LANCHOR8; lw a5, 0(a5);
	andi	s0,s0,2
	la a4, .LANCHOR7; sw a5, 0(a4);
	la a5, .LANCHOR5; sw s0, 0(a5);
.L39:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L54:
	li	a5,32768
	addi	a4,a5,12
	bleu	a0,a4,.L55
	li	a5,-40960
	add	a0,a0,a5
	li	a5,12
	bgtu	a0,a5,.L39
	li	a5,4096
	addi	a5,a5,273
	srl	a5,a5,a0
	andi	a5,a5,1
	beq	a5,zero,.L39
	la a5, .LANCHOR0+1; sb s0, 0(a5);
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
.L55:
	bltu	a0,a5,.L39
	sub	a0,a0,a5
	li	a5,4096
	addi	a5,a5,273
	srl	a5,a5,a0
	andi	a5,a5,1
	beq	a5,zero,.L39
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a5, .LANCHOR0; sb a1, 0(a5);
	addi	sp,sp,12
	tail	_ZL4Syncv
.L53:
	srli	a4,a0,8
	andi	a5,a0,8
	or	a5,a5,a4
	srli	a5,a5,3
	addi	a5,a5,2
	andi	a5,a5,7
	lla	a4,.LANCHOR1
	add	a4,a4,a5
	lbu	a5,0(a4)
	andi	a0,a0,4
	li	a3,240
	sra	a3,a3,a0
	andi	s0,a1,15
	sll	s0,s0,a0
	and	a5,a5,a3
	or	a5,a5,s0
	sb	a5,0(a4)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_ZL4Syncv
.L49:
	li	a0,1
	call	_Z12X6502_IRQEndi
	lla	a4,.LANCHOR8
	lw	a5,0(a4)
	slli	s0,s0,4
	lw	ra,8(sp)
	andi	a5,a5,15
	or	a5,a5,s0
	lw	s0,4(sp)
	sw	a5,0(a4)
	addi	sp,sp,12
	jr	ra
.L41:
	li	a0,1
	call	_Z12X6502_IRQEndi
	lla	a4,.LANCHOR8
	lw	a5,0(a4)
	andi	s0,s0,15
	lw	ra,8(sp)
	andi	a5,a5,240
	or	a5,a5,s0
	lw	s0,4(sp)
	sw	a5,0(a4)
	addi	sp,sp,12
	jr	ra
	.size	_ZL9M252Writejh, .-_ZL9M252Writejh
	.section	.rodata._Z14Mapper252_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CRAM"
	.align	2
.LC1:
	.string	"WRAM"
	.section	.text._Z14Mapper252_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper252_InitP8CartInfo
	.hidden	_Z14Mapper252_InitP8CartInfo
	.type	_Z14Mapper252_InitP8CartInfo, @function
_Z14Mapper252_InitP8CartInfo:
	addi	sp,sp,-16
	mv	a5,a0
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	lla	a4,_ZL9M252Powerv
	sw	a4,0(a5)
	li	a0,4096
	lla	a4,_ZL9M252Closev
	sw	a4,8(a5)
	lla	s0,.LANCHOR9
	lla	a4,_ZL7M252IRQi
	addi	a0,a0,-2048
	sw	a5,0(sp)
	la a3, MapIRQHook; sw a4, 0(a3);
	sw	a0,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR3
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a1,0(s0)
	lw	a0,0(s1)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	li	a4,8192
	lla	s0,.LANCHOR4
	li	a0,8192
	sw	a4,0(s0)
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
	lla	a3,.LC1
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	a5,0(sp)
	lw	a4,48(a5)
	beq	a4,zero,.L57
	lw	a3,0(s1)
	lw	a4,0(s0)
	sw	a3,12(a5)
	sw	a4,28(a5)
.L57:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR10
	addi	sp,sp,16
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper252_InitP8CartInfo, .-_Z14Mapper252_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"CREG"
	.align	2
.LC3:
	.string	"PREG"
	.align	2
.LC4:
	.string	"IRQA"
	.align	2
.LC5:
	.string	"IRQC"
	.align	2
.LC6:
	.string	"IRQL"
	.align	2
.LC7:
	.string	"IRQK"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR10,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 84
_ZL9StateRegs:
	.word	_ZL4creg
	.word	8
	.word	.LC2
	.word	_ZL4preg
	.word	2
	.word	.LC3
	.word	_ZL4IRQa
	.word	4
	.word	.LC4
	.word	_ZL8IRQCount
	.word	4
	.word	.LC5
	.word	_ZL8IRQLatch
	.word	4
	.word	.LC6
	.word	_ZL8IRQClock
	.word	4
	.word	.LC7
	.word	0
	.zero	8
	.section	.sbss._ZL10CHRRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR9,. + 0
	.type	_ZL10CHRRAMSIZE, @object
	.size	_ZL10CHRRAMSIZE, 4
_ZL10CHRRAMSIZE:
	.zero	4
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 4
_ZL4IRQa:
	.zero	4
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL4creg,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL4creg, @object
	.size	_ZL4creg, 8
_ZL4creg:
	.zero	8
	.section	.sbss._ZL4preg,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4preg, @object
	.size	_ZL4preg, 2
_ZL4preg:
	.zero	2
	.section	.sbss._ZL6CHRRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL6CHRRAM, @object
	.size	_ZL6CHRRAM, 4
_ZL6CHRRAM:
	.zero	4
	.section	.sbss._ZL8IRQClock,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	_ZL8IRQClock, @object
	.size	_ZL8IRQClock, 4
_ZL8IRQClock:
	.zero	4
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 4
_ZL8IRQLatch:
	.zero	4
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
