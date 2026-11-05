#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ks7017.cpp"
	.option nopic
	.text
	.section	.text._ZL14UNLKS7017Closev,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7017Closev, @function
_ZL14UNLKS7017Closev:
	la a0, .LANCHOR0; lw a0, 0(a0);
	beq	a0,zero,.L7
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR0; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L7:
	la a5, .LANCHOR0; sw zero, 0(a5);
	ret
	.size	_ZL14UNLKS7017Closev, .-_ZL14UNLKS7017Closev
	.section	.text._ZL11FDSRead4030j,"ax",@progbits
	.align	2
	.type	_ZL11FDSRead4030j, @function
_ZL11FDSRead4030j:
	addi	sp,sp,-12
	li	a0,1
	sw	ra,8(sp)
	call	_Z12X6502_IRQEndi
	lw	ra,8(sp)
	la a0, X+20; lw a0, 0(a0);
	andi	a0,a0,1
	addi	sp,sp,12
	jr	ra
	.size	_ZL11FDSRead4030j, .-_ZL11FDSRead4030j
	.section	.text._ZL10UNL7017IRQi,"ax",@progbits
	.align	2
	.type	_ZL10UNL7017IRQi, @function
_ZL10UNL7017IRQi:
	la a5, .LANCHOR1; lw a5, 0(a5);
	beq	a5,zero,.L13
	lla	a4,.LANCHOR2
	lw	a5,0(a4)
	sub	a5,a5,a0
	sw	a5,0(a4)
	ble	a5,zero,.L17
.L13:
	ret
.L17:
	li	a0,1
	la a5, .LANCHOR1; sw zero, 0(a5);
	tail	_Z14X6502_IRQBegini
	.size	_ZL10UNL7017IRQi, .-_ZL10UNL7017IRQi
	.section	.text._ZL14UNLKS7017Writejh,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7017Writejh, @function
_ZL14UNLKS7017Writejh:
	addi	sp,sp,-16
	li	a5,65536
	sw	s0,8(sp)
	addi	s0,a5,-256
	li	a5,20480
	sw	ra,12(sp)
	and	a4,a0,s0
	addi	a3,a5,-1536
	beq	a4,a3,.L25
	addi	a5,a5,256
	beq	a4,a5,.L26
	li	a5,16384
	addi	a4,a5,32
	beq	a0,a4,.L27
	addi	a4,a5,33
	beq	a0,a4,.L28
	addi	a5,a5,37
	bne	a0,a5,.L18
	srli	a1,a1,3
	xori	a1,a1,1
	andi	a1,a1,1
	la a5, .LANCHOR4; sb a1, 0(a5);
.L18:
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L25:
	srli	a5,a0,2
	srli	a0,a0,4
	lw	ra,12(sp)
	lw	s0,8(sp)
	andi	a5,a5,3
	andi	a0,a0,4
	or	a5,a5,a0
	la a4, .LANCHOR3; sb a5, 0(a4);
	addi	sp,sp,16
	jr	ra
.L27:
	li	a0,1
	sw	a1,0(sp)
	call	_Z12X6502_IRQEndi
	lla	a4,.LANCHOR2
	lw	a5,0(a4)
	lw	a1,0(sp)
	lw	ra,12(sp)
	and	a5,a5,s0
	lw	s0,8(sp)
	or	a5,a5,a1
	sw	a5,0(a4)
	addi	sp,sp,16
	jr	ra
.L26:
	la a1, .LANCHOR3; lbu a1, 0(a1);
	li	a0,32768
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,2
	call	_Z8setprg16jj
	lw	s0,8(sp)
	lw	ra,12(sp)
	la a0, .LANCHOR4; lbu a0, 0(a0);
	addi	sp,sp,16
	tail	_Z9setmirrori
.L28:
	li	a0,1
	sw	a1,0(sp)
	call	_Z12X6502_IRQEndi
	lla	a4,.LANCHOR2
	lw	a1,0(sp)
	lbu	a5,0(a4)
	slli	a1,a1,8
	or	a5,a5,a1
	sw	a5,0(a4)
	li	a5,1
	la a4, .LANCHOR1; sw a5, 0(a4);
	j	.L18
	.size	_ZL14UNLKS7017Writejh, .-_ZL14UNLKS7017Writejh
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	addi	sp,sp,-12
	la a1, .LANCHOR3; lbu a1, 0(a1);
	li	a0,32768
	sw	ra,8(sp)
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,2
	call	_Z8setprg16jj
	lw	ra,8(sp)
	la a0, .LANCHOR4; lbu a0, 0(a0);
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL14UNLKS7017Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7017Powerv, @function
_ZL14UNLKS7017Powerv:
	addi	sp,sp,-12
	la a1, .LANCHOR3; lbu a1, 0(a1);
	li	a0,32768
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z8setprg16jj
	li	a1,2
	li	a0,49152
	call	_Z8setprg16jj
	la a0, .LANCHOR4; lbu a0, 0(a0);
	call	_Z9setmirrori
	li	a0,0
	call	_Z7setchr8j
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	s0,16384
	addi	a1,s0,48
	mv	a0,a1
	lla	a2,_ZL11FDSRead4030j
	call	_Z14SetReadHandleriiPFhjE
	li	a1,24576
	addi	a0,s0,32
	lla	a2,_ZL14UNLKS7017Writejh
	addi	a1,a1,-1
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR5; lw a0, 0(a0);
	la a2, .LANCHOR0; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL14UNLKS7017Powerv, .-_ZL14UNLKS7017Powerv
	.section	.rodata._Z14UNLKS7017_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z14UNLKS7017_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLKS7017_InitP8CartInfo
	.hidden	_Z14UNLKS7017_InitP8CartInfo
	.type	_Z14UNLKS7017_InitP8CartInfo, @function
_Z14UNLKS7017_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL14UNLKS7017Powerv
	sw	a5,0(a0)
	lla	a5,_ZL14UNLKS7017Closev
	sw	a5,8(a0)
	lla	a5,_ZL10UNL7017IRQi
	lla	s0,.LANCHOR5
	la a4, MapIRQHook; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR0
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
	lla	a0,.LANCHOR6
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14UNLKS7017_InitP8CartInfo, .-_Z14UNLKS7017_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"MIRR"
	.align	2
.LC2:
	.string	"REGS"
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
	.size	_ZL9StateRegs, 72
_ZL9StateRegs:
	.word	_ZL4mirr
	.word	1
	.word	.LC1
	.word	_ZL3reg
	.word	1
	.word	.LC2
	.word	_ZL4IRQa
	.word	4
	.word	.LC3
	.word	_ZL8IRQCount
	.word	4
	.word	.LC4
	.word	_ZL8IRQLatch
	.word	4
	.word	.LC5
	.word	0
	.zero	8
	.section	.sbss._ZL3reg,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 4
_ZL4IRQa:
	.zero	4
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL4mirr,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.align	2
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 4
_ZL8IRQLatch:
	.zero	4
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
