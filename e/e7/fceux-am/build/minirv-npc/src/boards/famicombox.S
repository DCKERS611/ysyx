#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"famicombox.cpp"
	.option nopic
	.text
	.section	.text._ZL12SSSNROMWritejh,"ax",@progbits
	.align	2
	.type	_ZL12SSSNROMWritejh, @function
_ZL12SSSNROMWritejh:
	ret
	.size	_ZL12SSSNROMWritejh, .-_ZL12SSSNROMWritejh
	.section	.text._ZL11SSSNROMReadj,"ax",@progbits
	.align	2
	.type	_ZL11SSSNROMReadj, @function
_ZL11SSSNROMReadj:
	andi	a5,a0,7
	li	a4,2
	beq	a5,a4,.L5
	li	a4,7
	li	a0,34
	beq	a5,a4,.L4
	li	a0,0
	beq	a5,zero,.L8
.L4:
	ret
.L8:
	li	a5,-1
	la a4, .LANCHOR0; sb a5, 0(a4);
	li	a0,255
	ret
.L5:
	li	a0,192
	ret
	.size	_ZL11SSSNROMReadj, .-_ZL11SSSNROMReadj
	.section	.text._ZL12SSSNROMResetv,"ax",@progbits
	.align	2
	.type	_ZL12SSSNROMResetv, @function
_ZL12SSSNROMResetv:
	lla	a5,.LANCHOR0
	sb	zero,1(a5)
	sh	zero,2(a5)
	sh	zero,4(a5)
	sb	zero,6(a5)
	ret
	.size	_ZL12SSSNROMResetv, .-_ZL12SSSNROMResetv
	.section	.text._ZL14SSSNROMIRQHookv,"ax",@progbits
	.align	2
	.type	_ZL14SSSNROMIRQHookv, @function
_ZL14SSSNROMIRQHookv:
	ret
	.size	_ZL14SSSNROMIRQHookv, .-_ZL14SSSNROMIRQHookv
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	li	a1,4096
	addi	sp,sp,-12
	li	a2,0
	addi	a1,a1,-2048
	li	a0,16
	sw	ra,8(sp)
	call	_Z8setprg2rijj
	li	a2,1
	li	a1,4096
	li	a0,16
	call	_Z8setprg2rijj
	li	a1,8192
	li	a2,2
	addi	a1,a1,-2048
	li	a0,16
	call	_Z8setprg2rijj
	li	a2,1
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	li	a1,0
	li	a0,32768
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,-1
	call	_Z8setprg16jj
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
	.section	.text._ZL12SSSNROMClosev,"ax",@progbits
	.align	2
	.type	_ZL12SSSNROMClosev, @function
_ZL12SSSNROMClosev:
	la a0, .LANCHOR1; lw a0, 0(a0);
	beq	a0,zero,.L20
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR1; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L20:
	la a5, .LANCHOR1; sw zero, 0(a5);
	ret
	.size	_ZL12SSSNROMClosev, .-_ZL12SSSNROMClosev
	.section	.text._ZL12SSSNROMPowerv,"ax",@progbits
	.align	2
	.type	_ZL12SSSNROMPowerv, @function
_ZL12SSSNROMPowerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	li	a4,-16777216
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,.LANCHOR0
	sw	a4,4(a5)
	sw	zero,0(a5)
	call	_ZL4Syncv
	lla	s0,.LANCHOR2
	lla	a5,.LANCHOR1
	lw	a1,0(s0)
	lw	a0,0(a5)
	li	a2,1
	li	s1,8192
	call	_Z15FCEU_MemoryRandPhjb
	li	a5,4096
	addi	a1,s1,-1
	addi	a0,a5,-2048
	lla	a2,_Z6CartBRj
	call	_Z14SetReadHandleriiPFhjE
	li	a5,4096
	addi	a0,a5,-2048
	addi	a1,s1,-1
	lla	a2,_Z6CartBWjh
	call	_Z15SetWriteHandleriiPFvjhE
	li	s1,24576
	addi	a1,s1,-1
	lla	a2,_ZL11SSSNROMReadj
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s1,-1
	lla	a2,_ZL12SSSNROMWritejh
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	li	s1,32768
	addi	a1,s1,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s1,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	a0,0(s0)
	lla	a5,.LANCHOR1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lw	a2,0(a5)
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL12SSSNROMPowerv, .-_ZL12SSSNROMPowerv
	.section	.rodata._Z12SSSNROM_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z12SSSNROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12SSSNROM_InitP8CartInfo
	.hidden	_Z12SSSNROM_InitP8CartInfo
	.type	_Z12SSSNROM_InitP8CartInfo, @function
_Z12SSSNROM_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL12SSSNROMPowerv
	sw	a5,0(a0)
	lla	a5,_ZL12SSSNROMResetv
	sw	a5,4(a0)
	lla	a5,_ZL12SSSNROMClosev
	sw	a5,8(a0)
	lla	a5,_ZL14SSSNROMIRQHookv
	la a4, GameHBIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	s0,.LANCHOR2
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a0,16384
	li	a5,16384
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR1
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
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR3
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z12SSSNROM_InitP8CartInfo, .-_Z12SSSNROM_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"REGS"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL4regs
	.word	8
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL4regs,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4regs, @object
	.size	_ZL4regs, 8
_ZL4regs:
	.zero	8
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
