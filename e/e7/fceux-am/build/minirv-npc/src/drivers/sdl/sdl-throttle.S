#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"sdl-throttle.cpp"
	.option nopic
	.text
	.section	.text._Z18RefreshThrottleFPSv,"ax",@progbits
	.align	2
	.globl	_Z18RefreshThrottleFPSv
	.hidden	_Z18RefreshThrottleFPSv
	.type	_Z18RefreshThrottleFPSv, @function
_Z18RefreshThrottleFPSv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z19FCEUI_GetDesiredFPSv
	la a5, .LANCHOR0; sw a0, 0(a5);
	lla	a5,.LANCHOR1
	lw	ra,8(sp)
	li	a3,0
	li	a4,0
	sw	a3,0(a5)
	sw	a4,4(a5)
	lla	a5,.LANCHOR2
	sw	a3,0(a5)
	sw	a4,4(a5)
	la a5, .LANCHOR3; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
	.size	_Z18RefreshThrottleFPSv, .-_Z18RefreshThrottleFPSv
	.globl	__divsi3
	.section	.text._Z13SpeedThrottlev,"ax",@progbits
	.align	2
	.globl	_Z13SpeedThrottlev
	.hidden	_Z13SpeedThrottlev
	.type	_Z13SpeedThrottlev, @function
_Z13SpeedThrottlev:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	call	_Z13FCEUD_GetTimev
	lla	a3,.LANCHOR1
	lw	a5,0(a3)
	lw	a4,4(a3)
	mv	s1,a0
	mv	s0,a1
	or	a5,a5,a4
	bne	a5,zero,.L5
	sw	a0,0(a3)
	sw	a1,4(a3)
.L5:
	lla	a5,.LANCHOR3
	lw	a5,0(a5)
	beq	a5,zero,.L6
	lla	a5,.LANCHOR2
	lw	a4,0(a5)
	lw	a5,4(a5)
.L7:
	bgtu	a5,s0,.L18
	beq	a5,s0,.L23
.L15:
	sw	zero,4(sp)
	sw	zero,0(sp)
.L8:
	la a5, .LANCHOR3; sw zero, 0(a5);
.L20:
	call	_Z13FCEUD_GetTimev
	sub	a4,a0,s1
	sgtu	a3,a4,a0
	sub	a5,a1,s0
	sub	a5,a5,a3
	lw	a3,0(sp)
	bgtu	a3,a5,.L20
	bne	a3,a5,.L19
	lw	a5,4(sp)
	bgtu	a5,a4,.L20
.L19:
	lla	a5,.LANCHOR3
	lw	a5,0(a5)
	beq	a5,zero,.L24
	lw	ra,16(sp)
	lw	s0,12(sp)
	li	a5,1
	lw	s1,8(sp)
	mv	a0,a5
	addi	sp,sp,20
	jr	ra
.L23:
	bleu	a4,s1,.L15
.L18:
	sub	a3,a4,s1
	sgtu	a4,a3,a4
	sub	a5,a5,s0
	sub	a2,a5,a4
	sw	a3,4(sp)
	sw	a2,0(sp)
	beq	a5,a4,.L25
	li	a5,50
	sw	a5,4(sp)
	sw	zero,0(sp)
	j	.L20
.L6:
	li	a5,1
	lla	a4,.LANCHOR3
	sw	a5,0(a4)
	la a1, .LANCHOR0; lw a1, 0(a1);
	li	a0,1000
	call	__divsi3
	lla	a5,.LANCHOR1
	lw	a4,0(a5)
	lw	a2,4(a5)
	srai	a3,a0,31
	add	a4,a0,a4
	add	a3,a3,a2
	sltu	a5,a4,a0
	lla	a2,.LANCHOR2
	add	a5,a5,a3
	sw	a4,0(a2)
	sw	a5,4(a2)
	j	.L7
.L25:
	li	a5,50
	bleu	a3,a5,.L8
	li	a5,50
	sw	a5,4(sp)
	sw	zero,0(sp)
	j	.L20
.L24:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lla	a4,.LANCHOR1
	sw	a0,0(a4)
	sw	a1,4(a4)
	lw	s1,8(sp)
	mv	a0,a5
	addi	sp,sp,20
	jr	ra
	.size	_Z13SpeedThrottlev, .-_Z13SpeedThrottlev
	.section	.sbss._ZL11desired_fps,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL11desired_fps, @object
	.size	_ZL11desired_fps, 4
_ZL11desired_fps:
	.zero	4
	.section	.sbss._ZL7InFrame,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL7InFrame, @object
	.size	_ZL7InFrame, 4
_ZL7InFrame:
	.zero	4
	.section	.sbss._ZL8Lasttime,"aw",@nobits
	.align	3
	.set	.LANCHOR1,. + 0
	.type	_ZL8Lasttime, @object
	.size	_ZL8Lasttime, 8
_ZL8Lasttime:
	.zero	8
	.section	.sbss._ZL8Nexttime,"aw",@nobits
	.align	3
	.set	.LANCHOR2,. + 0
	.type	_ZL8Nexttime, @object
	.size	_ZL8Nexttime, 8
_ZL8Nexttime:
	.zero	8
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
