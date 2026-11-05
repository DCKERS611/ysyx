#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"novel.cpp"
	.option nopic
	.text
	.section	.text._ZL10NovelWritejh,"ax",@progbits
	.align	2
	.type	_ZL10NovelWritejh, @function
_ZL10NovelWritejh:
	addi	sp,sp,-12
	andi	a5,a0,0xff
	sw	s0,4(sp)
	li	a0,32768
	lla	s0,.LANCHOR0
	andi	a1,a5,3
	sw	ra,8(sp)
	sb	a5,0(s0)
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a0,a0,7
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL10NovelWritejh, .-_ZL10NovelWritejh
	.section	.text._ZL10NovelResetv,"ax",@progbits
	.align	2
	.type	_ZL10NovelResetv, @function
_ZL10NovelResetv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL10NovelWritejh
	li	a0,32768
	sw	ra,8(sp)
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a0,32768
	li	a1,0
	call	_Z8setprg32jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL10NovelResetv, .-_ZL10NovelResetv
	.section	.text._ZL12NovelRestorei,"ax",@progbits
	.align	2
	.type	_ZL12NovelRestorei, @function
_ZL12NovelRestorei:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	andi	a1,a1,3
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a0,a0,7
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL12NovelRestorei, .-_ZL12NovelRestorei
	.section	.rodata._Z10Novel_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"L1"
	.section	.text._Z10Novel_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10Novel_InitP8CartInfo
	.hidden	_Z10Novel_InitP8CartInfo
	.type	_Z10Novel_InitP8CartInfo, @function
_Z10Novel_InitP8CartInfo:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	a3,.LC0
	mv	s0,a0
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR0
	sw	ra,8(sp)
	call	_Z10AddExStatePvjiPKc
	lla	a5,_ZL10NovelResetv
	sw	a5,0(s0)
	lw	ra,8(sp)
	lw	s0,4(sp)
	lla	a5,_ZL12NovelRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	addi	sp,sp,12
	jr	ra
	.size	_Z10Novel_InitP8CartInfo, .-_Z10Novel_InitP8CartInfo
	.section	.sbss._ZL5latch,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL5latch, @object
	.size	_ZL5latch, 1
_ZL5latch:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
