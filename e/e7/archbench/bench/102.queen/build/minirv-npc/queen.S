#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"queen.c"
	.option nopic
	.text
	.section	.text.dfs,"ax",@progbits
	.align	2
	.type	dfs, @function
dfs:
	addi	sp,sp,-24
	sw	s0,16(sp)
	sw	ra,20(sp)
	sw	s1,12(sp)
	la a4, .LANCHOR0; lw a4, 0(a4);
	sw	a1,4(sp)
	sw	a2,8(sp)
	li	s0,1
	beq	a4,a0,.L1
	or	a5,a1,a2
	or	a5,a5,a0
	not	a5,a5
	and	s1,a5,a4
	mv	a3,a0
	li	s0,0
	beq	s1,zero,.L1
.L3:
	lw	a5,8(sp)
	neg	a4,s1
	and	a4,a4,s1
	or	a2,a5,a4
	lw	a5,4(sp)
	or	a0,a3,a4
	srli	a2,a2,1
	or	a1,a5,a4
	slli	a1,a1,1
	sw	a3,0(sp)
	sub	s1,s1,a4
	call	dfs
	lw	a3,0(sp)
	add	s0,s0,a0
	bne	s1,zero,.L3
.L1:
	lw	ra,20(sp)
	mv	a0,s0
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
	.size	dfs, .-dfs
	.section	.text.bench_init,"ax",@progbits
	.align	2
	.globl	bench_init
	.hidden	bench_init
	.type	bench_init, @function
bench_init:
	slli	a0,a0,4
	lla	a5,.LANCHOR2
	add	a5,a5,a0
	lw	a4,0(a5)
	la a3, .LANCHOR1; sw a5, 0(a3);
	li	a5,1
	sll	a5,a5,a4
	addi	a5,a5,-1
	la a4, .LANCHOR3; sw zero, 0(a4);
	la a4, .LANCHOR0; sw a5, 0(a4);
	ret
	.size	bench_init, .-bench_init
	.section	.text.bench_run,"ax",@progbits
	.align	2
	.globl	bench_run
	.hidden	bench_run
	.type	bench_run, @function
bench_run:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	la s0, .LANCHOR0; lw s0, 0(s0);
	li	s1,1
	beq	s0,zero,.L12
	li	s1,0
.L13:
	neg	a0,s0
	and	a0,a0,s0
	srli	a2,a0,1
	slli	a1,a0,1
	sub	s0,s0,a0
	call	dfs
	add	s1,s1,a0
	bne	s0,zero,.L13
.L12:
	lw	ra,8(sp)
	lw	s0,4(sp)
	la a5, .LANCHOR3; sw s1, 0(a5);
	la a5, .LANCHOR1; lw a5, 0(a5);
	lw	a0,8(a5)
	lw	a1,12(a5)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	bench_run, .-bench_run
	.section	.rodata.bench_validate.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"There are %d solutions for %d queen problem\n"
	.section	.text.bench_validate,"ax",@progbits
	.align	2
	.globl	bench_validate
	.hidden	bench_validate
	.type	bench_validate, @function
bench_validate:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR1
	lw	a5,0(s1)
	sw	s0,4(sp)
	lla	s0,.LANCHOR3
	lw	a1,0(s0)
	lw	a2,0(a5)
	lla	a0,.LC0
	sw	ra,8(sp)
	call	printf
	lw	a4,0(s1)
	lw	a5,0(s0)
	lw	ra,8(sp)
	lw	a0,4(a4)
	lw	s0,4(sp)
	lw	s1,0(sp)
	sub	a0,a0,a5
	snez	a0,a0
	addi	sp,sp,12
	jr	ra
	.size	bench_validate, .-bench_validate
	.section	.rodata.settings,"a"
	.align	3
	.set	.LANCHOR2,. + 0
	.type	settings, @object
	.size	settings, 64
settings:
	.word	8
	.word	92
	.word	0
	.word	0
	.word	11
	.word	2680
	.word	551
	.word	0
	.word	15
	.word	2279184
	.word	591703
	.word	0
	.word	17
	.word	95815104
	.word	28147419
	.word	0
	.section	.sbss.FULL,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	FULL, @object
	.size	FULL, 4
FULL:
	.zero	4
	.section	.sbss.ans,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	ans, @object
	.size	ans, 4
ans:
	.zero	4
	.section	.sbss.ps,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	ps, @object
	.size	ps, 4
ps:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
