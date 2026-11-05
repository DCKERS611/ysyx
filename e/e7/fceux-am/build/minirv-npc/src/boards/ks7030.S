#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ks7030.cpp"
	.option nopic
	.text
	.section	.text._ZL14UNLKS7030Closev,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7030Closev, @function
_ZL14UNLKS7030Closev:
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
	.size	_ZL14UNLKS7030Closev, .-_ZL14UNLKS7030Closev
	.section	.text._ZL14UNLKS7030Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7030Powerv, @function
_ZL14UNLKS7030Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	li	a5,-1
	lla	s1,.LANCHOR1
	lla	s0,.LANCHOR2
	li	a0,0
	sb	a5,0(s1)
	sb	a5,0(s0)
	call	_Z7setchr8j
	li	a1,-1
	li	a0,32768
	call	_Z8setprg32jj
	lbu	a1,0(s0)
	li	s0,49152
	addi	a0,s0,-2048
	call	_Z7setprg4jj
	lbu	a1,0(s1)
	li	s1,53248
	addi	a0,s1,-2048
	addi	a1,a1,8
	call	_Z7setprg4jj
	li	a5,32768
	addi	a1,a5,-1
	lla	a2,_ZL17UNLKS7030RamRead0j
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a5,32768
	addi	a1,a5,-1
	lla	a2,_ZL18UNLKS7030RamWrite0jh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,36864
	lla	a2,_ZL15UNLKS7030Write0jh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,40960
	lla	a2,_ZL15UNLKS7030Write1jh
	addi	a1,a1,-1
	li	a0,36864
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s1,2047
	addi	a0,s0,-2048
	lla	a2,_ZL17UNLKS7030RamRead1j
	call	_Z14SetReadHandleriiPFhjE
	addi	a0,s0,-2048
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	a1,s1,2047
	lw	s1,0(sp)
	lla	a2,_ZL18UNLKS7030RamWrite1jh
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL14UNLKS7030Powerv, .-_ZL14UNLKS7030Powerv
	.section	.text._ZL18UNLKS7030RamWrite1jh,"ax",@progbits
	.align	2
	.type	_ZL18UNLKS7030RamWrite1jh, @function
_ZL18UNLKS7030RamWrite1jh:
	li	a3,-45056
	addi	a5,a3,-2048
	add	a5,a0,a5
	li	a2,2047
	bgtu	a5,a2,.L14
	la a5, .LANCHOR0; lw a5, 0(a5);
	add	a5,a5,a0
	add	a3,a3,a5
	sb	a1,1024(a3)
	ret
.L14:
	li	a2,4096
	li	a3,-49152
	add	a3,a0,a3
	addi	t1,a2,-1025
	bleu	a3,t1,.L17
	li	a3,-53248
	addi	a3,a3,1024
	add	a0,a0,a3
	bgtu	a0,t1,.L13
	la a3, .LANCHOR0; lw a3, 0(a3);
	add	a5,a3,a5
	sb	a1,0(a5)
.L13:
	ret
.L17:
	addi	a2,a2,-1024
	add	a0,a0,a2
	tail	_Z6CartBWjh
	.size	_ZL18UNLKS7030RamWrite1jh, .-_ZL18UNLKS7030RamWrite1jh
	.section	.text._ZL17UNLKS7030RamRead1j,"ax",@progbits
	.align	2
	.type	_ZL17UNLKS7030RamRead1j, @function
_ZL17UNLKS7030RamRead1j:
	li	a5,-45056
	addi	a4,a5,-2048
	add	a4,a0,a4
	li	a3,2047
	bleu	a4,a3,.L23
	li	a3,4096
	li	a5,-49152
	add	a5,a0,a5
	addi	a2,a3,-1025
	bleu	a5,a2,.L24
	li	a5,-53248
	addi	a5,a5,1024
	add	a5,a0,a5
	li	a0,0
	bleu	a5,a2,.L25
	ret
.L24:
	addi	a3,a3,-1024
	add	a0,a0,a3
	tail	_Z6CartBRj
.L23:
	la a4, .LANCHOR0; lw a4, 0(a4);
	add	a4,a4,a0
	add	a5,a5,a4
	lbu	a0,1024(a5)
	ret
.L25:
	la a5, .LANCHOR0; lw a5, 0(a5);
	add	a5,a5,a4
	lbu	a0,0(a5)
	ret
	.size	_ZL17UNLKS7030RamRead1j, .-_ZL17UNLKS7030RamRead1j
	.section	.text._ZL17UNLKS7030RamRead0j,"ax",@progbits
	.align	2
	.type	_ZL17UNLKS7030RamRead0j, @function
_ZL17UNLKS7030RamRead0j:
	li	a2,4096
	li	a4,-24576
	add	a4,a0,a4
	addi	a3,a2,-1025
	mv	a5,a0
	bleu	a4,a3,.L31
	li	a4,-28672
	addi	a3,a4,1024
	add	a3,a0,a3
	li	a1,1023
	bleu	a3,a1,.L32
	add	a4,a0,a4
	li	a0,0
	bltu	a4,a2,.L33
	ret
.L32:
	li	a0,24576
	addi	a0,a0,-1024
	add	a0,a5,a0
	tail	_Z6CartBRj
.L31:
	la a5, .LANCHOR0; lw a5, 0(a5);
	add	a5,a5,a4
	lbu	a0,0(a5)
	ret
.L33:
	li	a0,20480
	addi	a0,a0,-2048
	add	a0,a5,a0
	tail	_Z6CartBRj
	.size	_ZL17UNLKS7030RamRead0j, .-_ZL17UNLKS7030RamRead0j
	.section	.text._ZL18UNLKS7030RamWrite0jh,"ax",@progbits
	.align	2
	.type	_ZL18UNLKS7030RamWrite0jh, @function
_ZL18UNLKS7030RamWrite0jh:
	li	a3,4096
	li	a5,-24576
	add	a5,a0,a5
	addi	a2,a3,-1025
	bgtu	a5,a2,.L35
	la a3, .LANCHOR0; lw a3, 0(a3);
	add	a5,a3,a5
	sb	a1,0(a5)
	ret
.L35:
	li	a5,-28672
	addi	a4,a5,1024
	add	a4,a0,a4
	li	a2,1023
	bleu	a4,a2,.L38
	add	a5,a0,a5
	bltu	a5,a3,.L39
	ret
.L38:
	li	a5,24576
	addi	a5,a5,-1024
	add	a0,a0,a5
	tail	_Z6CartBWjh
.L39:
	li	a5,20480
	addi	a5,a5,-2048
	add	a0,a0,a5
	tail	_Z6CartBWjh
	.size	_ZL18UNLKS7030RamWrite0jh, .-_ZL18UNLKS7030RamWrite0jh
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	addi	sp,sp,-12
	li	a0,0
	sw	ra,8(sp)
	call	_Z7setchr8j
	li	a1,-1
	li	a0,32768
	call	_Z8setprg32jj
	li	a0,49152
	la a1, .LANCHOR2; lbu a1, 0(a1);
	addi	a0,a0,-2048
	call	_Z7setprg4jj
	lw	ra,8(sp)
	la a1, .LANCHOR1; lbu a1, 0(a1);
	li	a0,53248
	addi	a1,a1,8
	addi	a0,a0,-2048
	addi	sp,sp,12
	tail	_Z7setprg4jj
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL15UNLKS7030Write0jh,"ax",@progbits
	.align	2
	.type	_ZL15UNLKS7030Write0jh, @function
_ZL15UNLKS7030Write0jh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	andi	a5,a0,7
	lla	s0,.LANCHOR2
	li	a0,0
	sw	ra,8(sp)
	sb	a5,0(s0)
	call	_Z7setchr8j
	li	a1,-1
	li	a0,32768
	call	_Z8setprg32jj
	lbu	a1,0(s0)
	li	a0,49152
	addi	a0,a0,-2048
	call	_Z7setprg4jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a1, .LANCHOR1; lbu a1, 0(a1);
	li	a0,53248
	addi	a1,a1,8
	addi	a0,a0,-2048
	addi	sp,sp,12
	tail	_Z7setprg4jj
	.size	_ZL15UNLKS7030Write0jh, .-_ZL15UNLKS7030Write0jh
	.section	.text._ZL15UNLKS7030Write1jh,"ax",@progbits
	.align	2
	.type	_ZL15UNLKS7030Write1jh, @function
_ZL15UNLKS7030Write1jh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	andi	a5,a0,15
	lla	s0,.LANCHOR1
	li	a0,0
	sw	ra,8(sp)
	sb	a5,0(s0)
	call	_Z7setchr8j
	li	a1,-1
	li	a0,32768
	call	_Z8setprg32jj
	li	a0,49152
	la a1, .LANCHOR2; lbu a1, 0(a1);
	addi	a0,a0,-2048
	call	_Z7setprg4jj
	lbu	a1,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,53248
	addi	a0,a0,-2048
	addi	a1,a1,8
	addi	sp,sp,12
	tail	_Z7setprg4jj
	.size	_ZL15UNLKS7030Write1jh, .-_ZL15UNLKS7030Write1jh
	.section	.rodata._Z14UNLKS7030_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z14UNLKS7030_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLKS7030_InitP8CartInfo
	.hidden	_Z14UNLKS7030_InitP8CartInfo
	.type	_Z14UNLKS7030_InitP8CartInfo, @function
_Z14UNLKS7030_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	lla	a5,_ZL14UNLKS7030Powerv
	sw	a5,0(a0)
	lla	a5,_ZL14UNLKS7030Closev
	sw	a5,8(a0)
	lla	a5,_ZL12StateRestorei
	lla	s0,.LANCHOR3
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a1,0(s0)
	lla	a3,.LC0
	li	a2,0
	la a4, .LANCHOR0; sw a0, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR4
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14UNLKS7030_InitP8CartInfo, .-_Z14UNLKS7030_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"REG0"
	.align	2
.LC2:
	.string	"REG1"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL4reg0
	.word	1
	.word	.LC1
	.word	_ZL4reg1
	.word	1
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL4reg0,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL4reg0, @object
	.size	_ZL4reg0, 1
_ZL4reg0:
	.zero	1
	.section	.sbss._ZL4reg1,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL4reg1, @object
	.size	_ZL4reg1, 1
_ZL4reg1:
	.zero	1
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
