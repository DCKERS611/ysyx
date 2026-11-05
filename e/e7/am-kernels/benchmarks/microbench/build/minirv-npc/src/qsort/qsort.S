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
	.section	.text.bench_qsort_prepare,"ax",@progbits
	.align	2
	.globl	bench_qsort_prepare
	.hidden	bench_qsort_prepare
	.type	bench_qsort_prepare, @function
bench_qsort_prepare:
	addi	sp,sp,-12
	li	a0,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	call	bench_srand
	la a5, setting; lw a5, 0(a5);
	lw	a5,0(a5)
	lla	a3,.LANCHOR0
	slli	a0,a5,2
	sw	a5,0(a3)
	call	bench_alloc
	lla	a3,.LANCHOR0
	lw	a5,0(a3)
	lla	a2,.LANCHOR1
	sw	a0,0(a2)
	ble	a5,zero,.L19
	li	s1,0
.L21:
	call	bench_rand
	mv	s0,a0
	call	bench_rand
	lla	a2,.LANCHOR1
	lw	a5,0(a2)
	lla	a3,.LANCHOR0
	slli	a1,s1,2
	slli	s0,s0,16
	lw	a4,0(a3)
	add	a5,a5,a1
	or	s0,s0,a0
	sw	s0,0(a5)
	addi	s1,s1,1
	bgt	a4,s1,.L21
.L19:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	bench_qsort_prepare, .-bench_qsort_prepare
	.section	.text.bench_qsort_run,"ax",@progbits
	.align	2
	.globl	bench_qsort_run
	.hidden	bench_qsort_run
	.type	bench_qsort_run, @function
bench_qsort_run:
	la a2, .LANCHOR0; lw a2, 0(a2);
	li	a1,0
	la a0, .LANCHOR1; lw a0, 0(a0);
	tail	myqsort
	.size	bench_qsort_run, .-bench_qsort_run
	.section	.text.bench_qsort_validate,"ax",@progbits
	.align	2
	.globl	bench_qsort_validate
	.hidden	bench_qsort_validate
	.type	bench_qsort_validate, @function
bench_qsort_validate:
	la a1, .LANCHOR0; lw a1, 0(a1);
	la a0, .LANCHOR1; lw a0, 0(a0);
	slli	a1,a1,2
	addi	sp,sp,-12
	add	a1,a0,a1
	sw	ra,8(sp)
	call	checksum
	la a5, setting; lw a5, 0(a5);
	lw	a5,12(a5)
	lw	ra,8(sp)
	sub	a0,a5,a0
	seqz	a0,a0
	addi	sp,sp,12
	jr	ra
	.size	bench_qsort_validate, .-bench_qsort_validate
	.section	.sbss.N,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	N, @object
	.size	N, 4
N:
	.zero	4
	.section	.sbss.data,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	data, @object
	.size	data, 4
data:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
