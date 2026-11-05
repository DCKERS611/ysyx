#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"video.cpp"
	.option nopic
	.text
	.globl	__mulsi3
	.globl	__udivsi3
	.section	.rodata._Z7ShowFPSv.part.0.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"(System time: %ds) FPS = %d"
	.globl	__modsi3
	.section	.text._Z7ShowFPSv.part.0,"ax",@progbits
	.align	2
	.type	_Z7ShowFPSv.part.0, @function
_Z7ShowFPSv.part.0:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	ra,16(sp)
	sw	s1,8(sp)
	call	_Z13FCEUD_GetTimev
	lla	a5,.LANCHOR0
	lw	a3,0(a5)
	lla	a5,.LANCHOR1
	lla	a2,.LANCHOR2
	slli	a1,a3,3
	add	a5,a5,a1
	lw	t1,0(a5)
	lw	a4,0(a2)
	la s0, PAL; lbu s0, 0(s0);
	snez	s0,s0
	neg	s0,s0
	andi	s0,s0,-10
	sw	a0,0(a5)
	sw	zero,4(a5)
	sw	a0,0(sp)
	sw	t1,4(sp)
	sub	a4,a0,a4
	li	a5,1000
	addi	s0,s0,60
	bleu	a4,a5,.L3
	sw	a0,0(a2)
	li	s1,40
.L4:
	addi	s1,s1,-1
	li	a0,8
	call	putch
	bne	s1,zero,.L4
	call	_Z17FCEUD_GetTimeFreqv
	mv	a1,a0
	mv	a0,s0
	call	__mulsi3
	lw	a5,4(sp)
	lw	s1,0(sp)
	sub	a1,s1,a5
	call	__udivsi3
	sw	a0,0(sp)
	li	a1,1000
	mv	a0,s1
	call	__udivsi3
	lw	a2,0(sp)
	mv	a1,a0
	lla	a0,.LC0
	call	printf
	lla	a5,.LANCHOR0
	lw	a3,0(a5)
.L3:
	mv	a1,s0
	addi	a0,a3,1
	call	__modsi3
	lw	ra,16(sp)
	lw	s0,12(sp)
	lla	a5,.LANCHOR0
	sw	a0,0(a5)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
	.size	_Z7ShowFPSv.part.0, .-_Z7ShowFPSv.part.0
	.section	.text._Z21FCEU_KillVirtualVideov,"ax",@progbits
	.align	2
	.globl	_Z21FCEU_KillVirtualVideov
	.hidden	_Z21FCEU_KillVirtualVideov
	.type	_Z21FCEU_KillVirtualVideov, @function
_Z21FCEU_KillVirtualVideov:
	ret
	.size	_Z21FCEU_KillVirtualVideov, .-_Z21FCEU_KillVirtualVideov
	.section	.text._Z21FCEU_InitVirtualVideov,"ax",@progbits
	.align	2
	.globl	_Z21FCEU_InitVirtualVideov
	.hidden	_Z21FCEU_InitVirtualVideov
	.type	_Z21FCEU_InitVirtualVideov, @function
_Z21FCEU_InitVirtualVideov:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR3
	lw	a5,0(s0)
	sw	s1,0(sp)
	sw	ra,8(sp)
	li	s1,1
	beq	a5,zero,.L15
.L10:
	lw	ra,8(sp)
	lw	s0,4(sp)
	mv	a0,s1
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L15:
	li	a0,65536
	addi	a0,a0,16
	call	_Z11FCEU_mallocj
	beq	a0,zero,.L16
	neg	a5,a0
	andi	a5,a5,7
	add	a0,a0,a5
	li	a2,65536
	li	a1,128
	sw	a0,0(s0)
	call	memset
	lw	ra,8(sp)
	lw	s0,4(sp)
	mv	a0,s1
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L16:
	la a5, .LANCHOR3; sw zero, 0(a5);
	li	s1,0
	j	.L10
	.size	_Z21FCEU_InitVirtualVideov, .-_Z21FCEU_InitVirtualVideov
	.section	.text._Z18FCEU_PutImageDummyv,"ax",@progbits
	.align	2
	.globl	_Z18FCEU_PutImageDummyv
	.hidden	_Z18FCEU_PutImageDummyv
	.type	_Z18FCEU_PutImageDummyv, @function
_Z18FCEU_PutImageDummyv:
	la a5, .LANCHOR4; lbu a5, 0(a5);
	bne	a5,zero,.L19
	ret
.L19:
	tail	_Z7ShowFPSv.part.0
	.size	_Z18FCEU_PutImageDummyv, .-_Z18FCEU_PutImageDummyv
	.section	.text._Z16FCEUI_SetShowFPSb,"ax",@progbits
	.align	2
	.globl	_Z16FCEUI_SetShowFPSb
	.hidden	_Z16FCEUI_SetShowFPSb
	.type	_Z16FCEUI_SetShowFPSb, @function
_Z16FCEUI_SetShowFPSb:
	la a5, .LANCHOR4; sb a0, 0(a5);
	ret
	.size	_Z16FCEUI_SetShowFPSb, .-_Z16FCEUI_SetShowFPSb
	.section	.text._Z7ShowFPSv,"ax",@progbits
	.align	2
	.globl	_Z7ShowFPSv
	.hidden	_Z7ShowFPSv
	.type	_Z7ShowFPSv, @function
_Z7ShowFPSv:
	la a5, .LANCHOR4; lbu a5, 0(a5);
	bne	a5,zero,.L23
	ret
.L23:
	tail	_Z7ShowFPSv.part.0
	.size	_Z7ShowFPSv, .-_Z7ShowFPSv
	.hidden	Show_FPS
	.globl	Show_FPS
	.hidden	ClipSidesOffset
	.globl	ClipSidesOffset
	.hidden	XBuf
	.globl	XBuf
	.section	.bss._ZL4boop,"aw",@nobits
	.align	3
	.set	.LANCHOR1,. + 0
	.type	_ZL4boop, @object
	.size	_ZL4boop, 480
_ZL4boop:
	.zero	480
	.section	.sbss.ClipSidesOffset,"aw",@nobits
	.align	2
	.type	ClipSidesOffset, @object
	.size	ClipSidesOffset, 4
ClipSidesOffset:
	.zero	4
	.section	.sbss.Show_FPS,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	Show_FPS, @object
	.size	Show_FPS, 1
Show_FPS:
	.zero	1
	.section	.sbss.XBuf,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	XBuf, @object
	.size	XBuf, 4
XBuf:
	.zero	4
	.section	.sbss._ZL9boopcount,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL9boopcount, @object
	.size	_ZL9boopcount, 4
_ZL9boopcount:
	.zero	4
	.section	.sbss._ZZ7ShowFPSvE3tsc,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZZ7ShowFPSvE3tsc, @object
	.size	_ZZ7ShowFPSvE3tsc, 4
_ZZ7ShowFPSvE3tsc:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
