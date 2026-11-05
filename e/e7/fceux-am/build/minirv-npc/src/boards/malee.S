#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"malee.cpp"
	.option nopic
	.text
	.section	.text._ZL10MALEEPowerv,"ax",@progbits
	.align	2
	.type	_ZL10MALEEPowerv, @function
_ZL10MALEEPowerv:
	addi	sp,sp,-12
	li	a2,0
	li	a1,28672
	li	a0,16
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z8setprg2rijj
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,24576
	lla	a2,_Z6CartBRj
	addi	a1,a1,2047
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	s0,28672
	addi	a1,s0,2047
	lla	a2,_Z6CartBRj
	li	a0,28672
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,2047
	lla	a2,_Z6CartBWjh
	li	a0,28672
	call	_Z15SetWriteHandleriiPFvjhE
	li	a2,0
	li	a1,24576
	li	a0,1
	call	_Z8setprg2rijj
	li	a0,32768
	li	a1,0
	call	_Z8setprg32jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL10MALEEPowerv, .-_ZL10MALEEPowerv
	.section	.rodata._Z10MALEE_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z10MALEE_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10MALEE_InitP8CartInfo
	.hidden	_Z10MALEE_InitP8CartInfo
	.type	_Z10MALEE_InitP8CartInfo, @function
_Z10MALEE_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	a5,a0
	li	s0,4096
	lla	a4,_ZL10MALEEPowerv
	addi	a1,s0,-2048
	li	a2,1
	lla	a0,_ZL4WRAM
	sw	a4,0(a5)
	call	_Z15FCEU_MemoryRandPhjb
	addi	a2,s0,-2048
	li	a3,1
	lla	a1,_ZL4WRAM
	li	a0,16
	call	_Z19SetupCartPRGMappingiPhji
	addi	a1,s0,-2048
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC0
	li	a2,0
	lla	a0,_ZL4WRAM
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z10MALEE_InitP8CartInfo, .-_Z10MALEE_InitP8CartInfo
	.section	.bss._ZL4WRAM,"aw",@nobits
	.align	2
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 2048
_ZL4WRAM:
	.zero	2048
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
