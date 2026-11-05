#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ad_random.c"
	.option nopic
	.text
	.section	.text.randomize,"ax",@progbits
	.align	2
	.globl	randomize
	.hidden	randomize
	.type	randomize, @function
randomize:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	bench_srand
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	randomize, .-randomize
	.globl	__umodsi3
	.section	.text.irandom,"ax",@progbits
	.align	2
	.globl	irandom
	.hidden	irandom
	.type	irandom, @function
irandom:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	mv	s0,a0
	blt	a0,a1,.L8
.L5:
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L8:
	mv	s1,a1
	call	bench_rand
	sub	a1,s1,s0
	addi	a1,a1,1
	call	__umodsi3
	add	s0,a0,s0
	ble	s0,s1,.L5
	mv	s0,s1
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	irandom, .-irandom
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
