#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"sieve.c"
	.option nopic
	.text
	.section	.text.bench_sieve_prepare,"ax",@progbits
	.align	2
	.globl	bench_sieve_prepare
	.hidden	bench_sieve_prepare
	.type	bench_sieve_prepare, @function
bench_sieve_prepare:
	la a5, setting; lw a5, 0(a5);
	lw	a5,0(a5)
	addi	sp,sp,-12
	sw	s0,4(sp)
	srai	a0,a5,31
	andi	a0,a0,7
	add	a0,a0,a5
	srai	a0,a0,3
	lla	s0,.LANCHOR0
	addi	a0,a0,128
	sw	a5,0(s0)
	sw	ra,8(sp)
	call	bench_alloc
	lw	a5,0(s0)
	la a4, .LANCHOR1; sw a0, 0(a4);
	li	a3,-31
	srai	a4,a5,31
	andi	a4,a4,31
	add	a4,a4,a5
	blt	a5,a3,.L1
	srai	a4,a4,5
	li	a5,0
	li	a3,-1
.L3:
	sw	a3,0(a0)
	addi	a5,a5,1
	addi	a0,a0,4
	ble	a5,a4,.L3
.L1:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	bench_sieve_prepare, .-bench_sieve_prepare
	.globl	__mulsi3
	.section	.text.bench_sieve_run,"ax",@progbits
	.align	2
	.globl	bench_sieve_run
	.hidden	bench_sieve_run
	.type	bench_sieve_run, @function
bench_sieve_run:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	ra,16(sp)
	sw	s1,8(sp)
	la s0, .LANCHOR0; lw s0, 0(s0);
	ble	s0,zero,.L8
	lla	a2,.LANCHOR1
	lw	a3,0(a2)
	lw	a4,0(a3)
	srli	a4,a4,1
	andi	a4,a4,1
	bne	a4,zero,.L9
	j	.L7
.L12:
	lw	a5,0(a5)
	srl	a5,a5,a4
	andi	a5,a5,1
	beq	a5,zero,.L7
.L9:
	addi	a4,a4,1
	srai	a5,a4,5
	slli	a5,a5,2
	add	a5,a3,a5
	ble	a4,s0,.L12
	li	a5,3
	ble	s0,a5,.L8
	lw	s1,0(a2)
	li	a1,2
	li	a2,4
	li	t1,1
	j	.L14
.L16:
	addi	a1,a1,1
	mv	a0,a1
	sw	a2,4(sp)
	sw	a1,0(sp)
	call	__mulsi3
	lw	a2,4(sp)
	lw	a1,0(sp)
	li	t1,1
	addi	a2,a2,2
	bgt	a0,s0,.L36
.L14:
	srai	a5,a1,5
	slli	a5,a5,2
	add	a5,s1,a5
	lw	a5,0(a5)
	srl	a5,a5,a1
	andi	a5,a5,1
	beq	a5,zero,.L16
	mv	a4,a2
	bgt	a2,s0,.L16
.L17:
	srai	a5,a4,5
	slli	a5,a5,2
	add	a5,s1,a5
	lw	a3,0(a5)
	sll	a0,t1,a4
	not	a0,a0
	and	a3,a3,a0
	sw	a3,0(a5)
	add	a4,a4,a1
	ble	a4,s0,.L17
	j	.L16
.L36:
	la a5, .LANCHOR2; sw zero, 0(a5);
.L20:
	li	a2,0
	li	a3,0
	li	a4,2
.L19:
	srai	a5,a4,5
	slli	a5,a5,2
	add	a5,s1,a5
	lw	a5,0(a5)
	srl	a5,a5,a4
	andi	a5,a5,1
	addi	a4,a4,1
	beq	a5,zero,.L18
	addi	a3,a3,1
	li	a2,1
.L18:
	ble	a4,s0,.L19
	beq	a2,zero,.L7
	la a5, .LANCHOR2; sw a3, 0(a5);
.L7:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L8:
	la a5, .LANCHOR2; sw zero, 0(a5);
	li	a5,1
	ble	s0,a5,.L7
	la s1, .LANCHOR1; lw s1, 0(s1);
	j	.L20
	.size	bench_sieve_run, .-bench_sieve_run
	.section	.text.bench_sieve_validate,"ax",@progbits
	.align	2
	.globl	bench_sieve_validate
	.hidden	bench_sieve_validate
	.type	bench_sieve_validate, @function
bench_sieve_validate:
	la a5, setting; lw a5, 0(a5);
	lw	a0,12(a5)
	la a5, .LANCHOR2; lw a5, 0(a5);
	sub	a0,a0,a5
	seqz	a0,a0
	ret
	.size	bench_sieve_validate, .-bench_sieve_validate
	.section	.sbss.N,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	N, @object
	.size	N, 4
N:
	.zero	4
	.section	.sbss.ans,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	ans, @object
	.size	ans, 4
ans:
	.zero	4
	.section	.sbss.primes,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	primes, @object
	.size	primes, 4
primes:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
