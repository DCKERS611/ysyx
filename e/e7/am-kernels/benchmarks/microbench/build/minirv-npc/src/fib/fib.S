#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"fib.c"
	.option nopic
	.text
	.globl	__mulsi3
	.section	.text.bench_fib_prepare,"ax",@progbits
	.align	2
	.globl	bench_fib_prepare
	.hidden	bench_fib_prepare
	.type	bench_fib_prepare, @function
bench_fib_prepare:
	la a5, setting; lw a5, 0(a5);
	lw	a5,0(a5)
	addi	sp,sp,-12
	sw	ra,8(sp)
	mv	a1,a5
	mv	a0,a5
	sw	s0,4(sp)
	la a4, .LANCHOR0; sw a5, 0(a4);
	call	__mulsi3
	slli	s0,a0,2
	mv	a0,s0
	call	bench_alloc
	mv	a5,a0
	mv	a0,s0
	la a4, .LANCHOR1; sw a5, 0(a4);
	call	bench_alloc
	mv	a5,a0
	mv	a0,s0
	la a4, .LANCHOR2; sw a5, 0(a4);
	call	bench_alloc
	mv	a5,a0
	mv	a0,s0
	la a4, .LANCHOR3; sw a5, 0(a4);
	call	bench_alloc
	lw	ra,8(sp)
	lw	s0,4(sp)
	la a5, .LANCHOR4; sw a0, 0(a5);
	addi	sp,sp,12
	jr	ra
	.size	bench_fib_prepare, .-bench_fib_prepare
	.section	.text.bench_fib_run,"ax",@progbits
	.align	2
	.globl	bench_fib_run
	.hidden	bench_fib_run
	.type	bench_fib_run, @function
bench_fib_run:
	addi	sp,sp,-88
	la a4, .LANCHOR2; lw a4, 0(a4);
	la a5, .LANCHOR0; lw a5, 0(a5);
	sw	a4,40(sp)
	la a4, .LANCHOR3; lw a4, 0(a4);
	sw	ra,84(sp)
	sw	s0,80(sp)
	sw	s1,76(sp)
	sw	a5,16(sp)
	sw	a4,44(sp)
	ble	a5,zero,.L10
	la a5, .LANCHOR1; lw a5, 0(a5);
	sw	a5,0(sp)
	lw	a5,16(sp)
	li	s1,0
	li	t1,0
	addi	s0,a5,-1
	li	t0,0
.L9:
	lw	a5,0(sp)
	slli	a4,s1,2
	addi	t0,t0,1
	add	a0,a5,a4
	lw	a5,40(sp)
	add	a1,a5,a4
	lw	a5,44(sp)
	add	a4,a5,a4
	li	a5,0
.L8:
	sub	a3,a5,t1
	sub	t2,a5,t0
	seqz	a3,a3
	addi	a5,a5,1
	li	a2,1
	beq	s0,t1,.L7
	seqz	a2,t2
.L7:
	sw	a2,0(a0)
	sw	a2,0(a1)
	sw	a3,0(a4)
	lw	a3,16(sp)
	addi	a0,a0,4
	addi	a1,a1,4
	addi	a4,a4,4
	bne	a5,a3,.L8
	addi	t1,t1,1
	add	s1,s1,a3
	bne	a3,t0,.L9
.L10:
	lw	a5,16(sp)
	lw	a2,44(sp)
	la a3, .LANCHOR4; lw a3, 0(a3);
	slli	a4,a5,2
	add	a2,a2,a4
	sw	a4,8(sp)
	add	a4,a3,a4
	sw	a4,64(sp)
	li	a4,31
	neg	a5,a5
	sw	a4,56(sp)
	li	a4,-2147483648
	xori	a4,a4,-45
	slli	a5,a5,3
	sw	a3,48(sp)
	sw	a2,68(sp)
	sw	a4,52(sp)
	sw	a5,72(sp)
.L6:
	lw	a5,52(sp)
	andi	a5,a5,1
	bne	a5,zero,.L38
	lw	a5,16(sp)
	ble	a5,zero,.L12
.L19:
	lw	a5,40(sp)
	lw	a4,48(sp)
	sw	zero,36(sp)
	sw	a5,60(sp)
	sw	a4,32(sp)
	sw	a5,28(sp)
.L18:
	lw	a5,40(sp)
	sw	zero,24(sp)
	sw	a5,20(sp)
	lw	a5,32(sp)
	sw	a5,12(sp)
.L21:
	lw	a5,12(sp)
	lw	a2,20(sp)
	lw	a3,28(sp)
	sw	zero,0(a5)
	li	s0,0
	li	s1,0
.L20:
	lw	a0,0(a3)
	lw	a1,0(a2)
	addi	a3,a3,4
	sw	a2,4(sp)
	sw	a3,0(sp)
	call	__mulsi3
	lw	a4,8(sp)
	lw	a2,4(sp)
	lw	a5,12(sp)
	add	s0,s0,a0
	add	a2,a2,a4
	lw	a4,16(sp)
	addi	s1,s1,1
	sw	s0,0(a5)
	lw	a3,0(sp)
	bgt	a4,s1,.L20
	addi	a5,a5,4
	lw	a3,24(sp)
	sw	a5,12(sp)
	lw	a5,20(sp)
	addi	a3,a3,1
	sw	a3,24(sp)
	addi	a5,a5,4
	sw	a5,20(sp)
	bgt	a4,a3,.L21
	lw	a3,28(sp)
	lw	a4,8(sp)
	lw	a5,36(sp)
	add	a3,a3,a4
	sw	a3,28(sp)
	lw	a3,32(sp)
	addi	a5,a5,1
	sw	a5,36(sp)
	add	a4,a3,a4
	sw	a4,32(sp)
	lw	a4,16(sp)
	bgt	a4,a5,.L18
	lw	a0,48(sp)
	lw	t0,60(sp)
	lw	t2,8(sp)
	li	a1,0
	mv	t1,a4
.L22:
	mv	a3,t0
	mv	a4,a0
	li	a5,0
.L23:
	lw	a2,0(a4)
	addi	a5,a5,1
	addi	a4,a4,4
	sw	a2,0(a3)
	addi	a3,a3,4
	blt	a5,t1,.L23
	addi	a1,a1,1
	add	a0,a0,t2
	add	t0,t0,t2
	blt	a1,t1,.L22
.L12:
	lw	a5,56(sp)
	lw	a4,52(sp)
	addi	a5,a5,-1
	srai	a4,a4,1
	sw	a5,56(sp)
	sw	a4,52(sp)
	bne	a5,zero,.L6
	lw	ra,84(sp)
	lw	s0,80(sp)
	lw	s1,76(sp)
	addi	sp,sp,88
	jr	ra
.L38:
	lw	a5,16(sp)
	ble	a5,zero,.L12
	lw	a5,68(sp)
	sw	zero,32(sp)
	sw	zero,36(sp)
	sw	a5,12(sp)
.L15:
	lw	a5,32(sp)
	lw	a4,48(sp)
	sw	zero,24(sp)
	slli	a5,a5,2
	add	a4,a4,a5
	sw	a4,4(sp)
	lw	a4,40(sp)
	sw	a4,20(sp)
	lw	a4,44(sp)
	add	a5,a4,a5
	sw	a5,28(sp)
.L14:
	lw	a5,4(sp)
	lw	a3,20(sp)
	lw	s1,28(sp)
	li	s0,0
	mv	a4,s0
	sw	zero,0(a5)
	mv	s0,a3
.L13:
	lw	a1,0(s0)
	lw	a0,0(s1)
	lw	a5,8(sp)
	sw	a4,0(sp)
	addi	s1,s1,4
	add	s0,s0,a5
	call	__mulsi3
	lw	a4,0(sp)
	lw	a5,4(sp)
	add	a4,a4,a0
	sw	a4,0(a5)
	lw	a5,12(sp)
	bne	s1,a5,.L13
	lw	a4,4(sp)
	lw	a5,24(sp)
	addi	a4,a4,4
	sw	a4,4(sp)
	lw	a4,20(sp)
	addi	a5,a5,1
	sw	a5,24(sp)
	addi	a4,a4,4
	sw	a4,20(sp)
	lw	a4,16(sp)
	bne	a5,a4,.L14
	lw	a3,32(sp)
	lw	a5,36(sp)
	add	a3,a3,a4
	sw	a3,32(sp)
	lw	a3,8(sp)
	addi	a5,a5,1
	sw	a5,36(sp)
	add	a3,s1,a3
	sw	a3,12(sp)
	bne	a5,a4,.L15
	lw	a2,64(sp)
	lw	t2,44(sp)
	lw	s0,8(sp)
	lw	s1,72(sp)
	li	a0,0
	li	a1,0
	mv	t0,a4
.L16:
	sub	t1,a2,s0
	slli	a4,a0,2
	add	a4,t2,a4
	mv	a5,t1
.L17:
	lw	a3,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a4)
	bne	a2,a5,.L17
	addi	a1,a1,1
	add	a0,a0,t0
	sub	a2,t1,s1
	bne	a1,t0,.L16
	j	.L19
	.size	bench_fib_run, .-bench_fib_run
	.section	.text.bench_fib_validate,"ax",@progbits
	.align	2
	.globl	bench_fib_validate
	.hidden	bench_fib_validate
	.type	bench_fib_validate, @function
bench_fib_validate:
	addi	sp,sp,-12
	la a0, .LANCHOR0; lw a0, 0(a0);
	sw	s0,4(sp)
	addi	s0,a0,-1
	mv	a1,s0
	sw	ra,8(sp)
	call	__mulsi3
	add	a0,a0,s0
	slli	a0,a0,2
	la a5, .LANCHOR3; lw a5, 0(a5);
	add	a5,a5,a0
	lw	a0,0(a5)
	la a5, setting; lw a5, 0(a5);
	lw	a5,12(a5)
	lw	ra,8(sp)
	lw	s0,4(sp)
	sub	a0,a0,a5
	seqz	a0,a0
	addi	sp,sp,12
	jr	ra
	.size	bench_fib_validate, .-bench_fib_validate
	.section	.sbss.A,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	A, @object
	.size	A, 4
A:
	.zero	4
	.section	.sbss.M,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	M, @object
	.size	M, 4
M:
	.zero	4
	.section	.sbss.T,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	T, @object
	.size	T, 4
T:
	.zero	4
	.section	.sbss.ans,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	ans, @object
	.size	ans, 4
ans:
	.zero	4
	.section	.sbss.tmp,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	tmp, @object
	.size	tmp, 4
tmp:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
