#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"file.cpp"
	.option nopic
	.text
	.section	.rodata._Z10FCEU_fopenPKcS0_S0_PciPS0_Pi.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `ipsfn == __null' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/fceux-am/src/file.cpp:37  \n"
	.align	2
.LC3:
	.string	"rb"
	.align	2
.LC4:
	.string	"wb"
	.align	2
.LC5:
	.string	"invalid file open mode specified (only wb and rb are supported)"
	.section	.text._Z10FCEU_fopenPKcS0_S0_PciPS0_Pi,"ax",@progbits
	.align	2
	.globl	_Z10FCEU_fopenPKcS0_S0_PciPS0_Pi
	.hidden	_Z10FCEU_fopenPKcS0_S0_PciPS0_Pi
	.type	_Z10FCEU_fopenPKcS0_S0_PciPS0_Pi, @function
_Z10FCEU_fopenPKcS0_S0_PciPS0_Pi:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	bne	a1,zero,.L25
	lla	a1,.LC3
	mv	s1,a0
	mv	a0,a2
	mv	s0,a2
	call	strcmp
	mv	a5,a0
	lla	a1,.LC4
	mv	a0,s0
	sw	a5,0(sp)
	call	strcmp
	lw	a5,0(sp)
	bne	a5,zero,.L6
	beq	a0,zero,.L7
	mv	a1,s0
	mv	a0,s1
	call	_Z18FCEUD_UTF8_fstreamPKcS0_
	mv	s0,a0
	beq	a0,zero,.L23
	li	a0,20
	call	malloc
	li	a5,-1
	sw	a5,8(a0)
	sw	a5,4(a0)
	lw	a5,32(s0)
	sw	s0,0(a0)
	lw	ra,12(sp)
	not	a4,a5
	srai	a4,a4,31
	and	a5,a5,a4
	sw	a5,12(a0)
	lw	a4,32(s0)
	lw	s1,4(sp)
	srai	a5,a4,31
	and	a5,a5,a4
	sw	a5,28(s0)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L6:
	bne	a0,zero,.L7
.L23:
	li	a0,0
.L26:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L7:
	lla	a0,.LC5
	call	printf
	li	a0,0
	j	.L26
.L25:
	lla	s0,.LC0
	li	a0,65
.L3:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L3
	lla	s0,.LC1
	li	a0,65
.L4:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L4
	lla	s0,.LC2
	li	a0,32
.L5:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L5
	li	a0,1
	call	halt
	.size	_Z10FCEU_fopenPKcS0_S0_PciPS0_Pi, .-_Z10FCEU_fopenPKcS0_S0_PciPS0_Pi
	.section	.text._Z11FCEU_fcloseP8FCEUFILE,"ax",@progbits
	.align	2
	.globl	_Z11FCEU_fcloseP8FCEUFILE
	.hidden	_Z11FCEU_fcloseP8FCEUFILE
	.type	_Z11FCEU_fcloseP8FCEUFILE, @function
_Z11FCEU_fcloseP8FCEUFILE:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a0
	lw	a0,0(a0)
	sw	ra,8(sp)
	beq	a0,zero,.L28
	call	free
.L28:
	mv	a0,s0
	call	free
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	_Z11FCEU_fcloseP8FCEUFILE, .-_Z11FCEU_fcloseP8FCEUFILE
	.globl	__mulsi3
	.section	.text._Z10FCEU_freadPvjjP8FCEUFILE,"ax",@progbits
	.align	2
	.globl	_Z10FCEU_freadPvjjP8FCEUFILE
	.hidden	_Z10FCEU_freadPvjjP8FCEUFILE
	.type	_Z10FCEU_freadPvjjP8FCEUFILE, @function
_Z10FCEU_freadPvjjP8FCEUFILE:
	addi	sp,sp,-16
	mv	a5,a1
	sw	s1,4(sp)
	lw	s1,0(a3)
	mv	a4,a0
	mv	a1,a2
	mv	a0,a5
	sw	s0,8(sp)
	sw	a4,0(sp)
	sw	ra,12(sp)
	call	__mulsi3
	lw	a3,28(s1)
	lw	s0,32(s1)
	lw	a4,0(sp)
	mv	a5,a0
	sub	s0,s0,a3
	bleu	s0,a0,.L34
	mv	s0,a0
.L34:
	lw	a1,0(s1)
	mv	a0,a4
	mv	a2,s0
	add	a1,a1,a3
	sw	a5,0(sp)
	call	memcpy
	lw	a4,28(s1)
	lw	a5,0(sp)
	add	a4,a4,s0
	sw	a4,28(s1)
	bleu	a5,s0,.L35
	li	a5,1
	sb	a5,24(s1)
.L35:
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a1,0
	addi	sp,sp,16
	jr	ra
	.size	_Z10FCEU_freadPvjjP8FCEUFILE, .-_Z10FCEU_freadPvjjP8FCEUFILE
	.section	.text._Z10FCEU_fseekP8FCEUFILEli,"ax",@progbits
	.align	2
	.globl	_Z10FCEU_fseekP8FCEUFILEli
	.hidden	_Z10FCEU_fseekP8FCEUFILEli
	.type	_Z10FCEU_fseekP8FCEUFILEli, @function
_Z10FCEU_fseekP8FCEUFILEli:
	li	a4,1
	lw	a5,0(a0)
	beq	a2,a4,.L38
	li	a4,2
	beq	a2,a4,.L39
	beq	a2,zero,.L40
	lw	a0,28(a5)
	blt	a0,zero,.L43
.L44:
	lw	a4,32(a5)
	bge	a4,a0,.L37
	sw	a4,28(a5)
	mv	a0,a4
.L37:
	ret
.L39:
	lw	a0,32(a5)
	sw	a0,28(a5)
	bge	a0,zero,.L37
.L43:
	sw	zero,28(a5)
	li	a0,0
	ret
.L40:
	sw	a1,28(a5)
	mv	a0,a1
	bge	a0,zero,.L44
	j	.L43
.L38:
	lw	a4,28(a5)
	add	a0,a1,a4
	sw	a0,28(a5)
	bge	a0,zero,.L44
	j	.L43
	.size	_Z10FCEU_fseekP8FCEUFILEli, .-_Z10FCEU_fseekP8FCEUFILEli
	.section	.text._Z10FCEU_ftellP8FCEUFILE,"ax",@progbits
	.align	2
	.globl	_Z10FCEU_ftellP8FCEUFILE
	.hidden	_Z10FCEU_ftellP8FCEUFILE
	.type	_Z10FCEU_ftellP8FCEUFILE, @function
_Z10FCEU_ftellP8FCEUFILE:
	lw	a5,0(a0)
	lw	a0,28(a5)
	srai	a1,a0,31
	ret
	.size	_Z10FCEU_ftellP8FCEUFILE, .-_Z10FCEU_ftellP8FCEUFILE
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
