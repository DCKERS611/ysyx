#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"mp.c"
	.option nopic
	.text
	.section	.rodata.mp_print.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"%d"
	.section	.text.mp_print,"ax",@progbits
	.align	2
	.globl	mp_print
	.hidden	mp_print
	.type	mp_print, @function
mp_print:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
.L2:
	call	cpu_current
	mv	a1,a0
	mv	a0,s0
	call	printf
	j	.L2
	.size	mp_print, .-mp_print
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
