#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"memory.cpp"
	.option nopic
	.text
	.section	.rodata._Z12FCEU_gmallocj.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `0' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/fceux-am/src/utils/memory.cpp:37  \n"
	.align	2
.LC3:
	.string	"Error allocating memory!  Doing a hard exit."
	.section	.text._Z12FCEU_gmallocj,"ax",@progbits
	.align	2
	.globl	_Z12FCEU_gmallocj
	.hidden	_Z12FCEU_gmallocj
	.type	_Z12FCEU_gmallocj, @function
_Z12FCEU_gmallocj:
	addi	sp,sp,-12
	sw	s1,0(sp)
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s1,a0
	call	malloc
	beq	a0,zero,.L11
	mv	a1,s1
	li	a2,1
	mv	s0,a0
	call	_Z15FCEU_MemoryRandPhjb
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L11:
	lla	a0,.LC3
	call	printf
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
	.size	_Z12FCEU_gmallocj, .-_Z12FCEU_gmallocj
	.section	.rodata._Z11FCEU_mallocj.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"Error allocating memory!"
	.section	.text._Z11FCEU_mallocj,"ax",@progbits
	.align	2
	.globl	_Z11FCEU_mallocj
	.hidden	_Z11FCEU_mallocj
	.type	_Z11FCEU_mallocj, @function
_Z11FCEU_mallocj:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s1,a0
	call	malloc
	mv	s0,a0
	beq	a0,zero,.L16
	mv	a2,s1
	li	a1,0
	call	memset
.L12:
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L16:
	lla	a0,.LC4
	call	printf
	j	.L12
	.size	_Z11FCEU_mallocj, .-_Z11FCEU_mallocj
	.section	.text._Z10FCEU_gfreePv,"ax",@progbits
	.align	2
	.globl	_Z10FCEU_gfreePv
	.hidden	_Z10FCEU_gfreePv
	.type	_Z10FCEU_gfreePv, @function
_Z10FCEU_gfreePv:
	tail	free
	.size	_Z10FCEU_gfreePv, .-_Z10FCEU_gfreePv
	.section	.text._Z9FCEU_freePv,"ax",@progbits
	.align	2
	.globl	_Z9FCEU_freePv
	.hidden	_Z9FCEU_freePv
	.type	_Z9FCEU_freePv, @function
_Z9FCEU_freePv:
	tail	free
	.size	_Z9FCEU_freePv, .-_Z9FCEU_freePv
	.section	.text._Z12FCEU_dmallocj,"ax",@progbits
	.align	2
	.globl	_Z12FCEU_dmallocj
	.hidden	_Z12FCEU_dmallocj
	.type	_Z12FCEU_dmallocj, @function
_Z12FCEU_dmallocj:
	tail	malloc
	.size	_Z12FCEU_dmallocj, .-_Z12FCEU_dmallocj
	.section	.text._Z10FCEU_dfreePv,"ax",@progbits
	.align	2
	.globl	_Z10FCEU_dfreePv
	.hidden	_Z10FCEU_dfreePv
	.type	_Z10FCEU_dfreePv, @function
_Z10FCEU_dfreePv:
	tail	free
	.size	_Z10FCEU_dfreePv, .-_Z10FCEU_dfreePv
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
