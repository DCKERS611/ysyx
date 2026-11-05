#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"qsort.c"
	.option nopic
	.text
	.section	.text.myqsort,"ax",@progbits
	.align	2
	.type	myqsort, @function
myqsort:
	mv	t1,a2
	bge	a1,a2,.L18
	addi	sp,sp,-20
	sw	ra,16(sp)
	sw	s0,12(sp)
	sw	s1,8(sp)
.L13:
	slli	s1,t1,2
	add	s1,a0,s1
.L6:
	slli	a5,a1,2
	add	a2,a0,a5
	addi	a4,a1,1
	lw	a3,0(a2)
	ble	t1,a4,.L8
	addi	a5,a5,4
	add	a5,a0,a5
	mv	s0,a1
.L5:
	lw	t0,0(a5)
	bge	t0,a3,.L4
	addi	s0,s0,1
	slli	a4,s0,2
	add	a4,a0,a4
	lw	t2,0(a4)
	sw	t0,0(a4)
	sw	t2,0(a5)
.L4:
	addi	a5,a5,4
	bne	s1,a5,.L5
	slli	a5,s0,2
	lw	a3,0(a2)
	add	a5,a0,a5
	lw	a4,0(a5)
	sw	a3,0(a5)
	sw	t1,4(sp)
	sw	a4,0(a2)
	mv	a2,s0
	sw	a0,0(sp)
	call	myqsort
	lw	t1,4(sp)
	addi	a1,s0,1
	lw	a0,0(sp)
	blt	a1,t1,.L6
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L8:
	mv	t1,a1
	blt	a1,a1,.L13
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L18:
	ret
	.size	myqsort, .-myqsort
	.section	.text.bench_init,"ax",@progbits
	.align	2
	.globl	bench_init
	.hidden	bench_init
	.type	bench_init, @function
bench_init:
	slli	a0,a0,4
	lla	a5,.LANCHOR1
	add	a5,a5,a0
	lw	a4,0(a5)
	addi	sp,sp,-12
	sw	s1,0(sp)
	li	a0,1
	lla	s1,.LANCHOR2
	la a3, .LANCHOR0; sw a5, 0(a3);
	sw	ra,8(sp)
	sw	a4,0(s1)
	sw	s0,4(sp)
	call	bench_srand
	lw	a0,0(s1)
	slli	a0,a0,2
	call	malloc
	lw	a5,0(s1)
	lla	a2,.LANCHOR3
	sw	a0,0(a2)
	ble	a5,zero,.L19
	li	s0,0
.L21:
	call	bench_rand
	lla	a2,.LANCHOR3
	lw	a5,0(a2)
	slli	a3,s0,2
	lw	a4,0(s1)
	add	a5,a5,a3
	sw	a0,0(a5)
	addi	s0,s0,1
	bgt	a4,s0,.L21
.L19:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	bench_init, .-bench_init
	.section	.text.bench_run,"ax",@progbits
	.align	2
	.globl	bench_run
	.hidden	bench_run
	.type	bench_run, @function
bench_run:
	addi	sp,sp,-12
	li	a1,0
	la a0, .LANCHOR3; lw a0, 0(a0);
	la a2, .LANCHOR2; lw a2, 0(a2);
	sw	ra,8(sp)
	call	myqsort
	lw	ra,8(sp)
	la a5, .LANCHOR0; lw a5, 0(a5);
	lw	a0,8(a5)
	lw	a1,12(a5)
	addi	sp,sp,12
	jr	ra
	.size	bench_run, .-bench_run
	.section	.rodata.bench_validate.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"cs = 0x%08x\n"
	.section	.text.bench_validate,"ax",@progbits
	.align	2
	.globl	bench_validate
	.hidden	bench_validate
	.type	bench_validate, @function
bench_validate:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR3
	lw	a0,0(s1)
	la a1, .LANCHOR2; lw a1, 0(a1);
	slli	a1,a1,2
	add	a1,a0,a1
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	bench_checksum
	mv	s0,a0
	mv	a1,a0
	lla	a0,.LC0
	call	printf
	lw	a0,0(s1)
	call	free
	la a5, .LANCHOR0; lw a5, 0(a5);
	lw	a0,4(a5)
	lw	ra,8(sp)
	lw	s1,0(sp)
	sub	a0,a0,s0
	lw	s0,4(sp)
	snez	a0,a0
	addi	sp,sp,12
	jr	ra
	.size	bench_validate, .-bench_validate
	.section	.rodata.settings,"a"
	.align	3
	.set	.LANCHOR1,. + 0
	.type	settings, @object
	.size	settings, 64
settings:
	.word	100
	.word	1781959625
	.word	0
	.word	0
	.word	10000
	.word	525329930
	.word	242
	.word	0
	.word	30000000
	.word	-828924627
	.word	1516034
	.word	0
	.word	500000000
	.word	780694786
	.word	29476677
	.word	0
	.section	.sbss.N,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	N, @object
	.size	N, 4
N:
	.zero	4
	.section	.sbss.data,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	data, @object
	.size	data, 4
data:
	.zero	4
	.section	.sbss.ps,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	ps, @object
	.size	ps, 4
ps:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
