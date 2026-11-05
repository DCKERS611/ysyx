#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ntt.c"
	.option nopic
	.text
	.section	.text.newVec,"ax",@progbits
	.align	2
	.globl	newVec
	.hidden	newVec
	.type	newVec, @function
newVec:
	addi	sp,sp,-20
	sw	s0,12(sp)
	slli	a1,a0,2
	mv	s0,a0
	li	a0,1
	sw	ra,16(sp)
	call	calloc
	lw	ra,16(sp)
	mv	a1,s0
	lw	s0,12(sp)
	addi	sp,sp,20
	jr	ra
	.size	newVec, .-newVec
	.globl	__umodsi3
	.globl	__muldi3
	.globl	__umoddi3
	.globl	__moddi3
	.section	.text.mod_pow,"ax",@progbits
	.align	2
	.globl	mod_pow
	.hidden	mod_pow
	.type	mod_pow, @function
mod_pow:
	addi	sp,sp,-20
	sw	s1,8(sp)
	mv	s1,a1
	mv	a1,a2
	sw	ra,16(sp)
	sw	s0,12(sp)
	sw	a2,4(sp)
	call	__umodsi3
	beq	s1,zero,.L8
	mv	s0,a0
	li	a4,1
.L7:
	andi	t1,s1,1
	mv	a2,s0
	li	a3,0
	mv	a0,a4
	li	a1,0
	srli	s1,s1,1
	beq	t1,zero,.L6
	call	__muldi3
	lw	a2,4(sp)
	li	a3,0
	call	__moddi3
	mv	a4,a0
.L6:
	mv	a2,s0
	li	a3,0
	mv	a0,s0
	li	a1,0
	sw	a4,0(sp)
	call	__muldi3
	lw	a2,4(sp)
	li	a3,0
	call	__moddi3
	lw	a4,0(sp)
	mv	s0,a0
	bne	s1,zero,.L7
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	mv	a0,a4
	addi	sp,sp,20
	jr	ra
.L8:
	lw	ra,16(sp)
	lw	s0,12(sp)
	li	a4,1
	lw	s1,8(sp)
	mv	a0,a4
	addi	sp,sp,20
	jr	ra
	.size	mod_pow, .-mod_pow
	.section	.rodata.DisplayVector.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"["
	.align	2
.LC1:
	.string	"%u, "
	.align	2
.LC2:
	.string	"%u]\n"
	.section	.text.DisplayVector,"ax",@progbits
	.align	2
	.globl	DisplayVector
	.hidden	DisplayVector
	.type	DisplayVector, @function
DisplayVector:
	addi	sp,sp,-32
	mv	a5,a0
	sw	s0,24(sp)
	sw	a0,12(sp)
	addi	s0,a1,-1
	lla	a0,.LC0
	sw	s1,20(sp)
	sw	ra,28(sp)
	sw	a1,8(sp)
	sw	s0,0(sp)
	sw	a1,16(sp)
	mv	s1,a5
	sw	a5,4(sp)
	call	printf
	ble	s0,zero,.L15
	li	s0,0
.L16:
	lw	a1,0(s1)
	lla	a0,.LC1
	addi	s0,s0,1
	call	printf
	lw	a5,0(sp)
	addi	s1,s1,4
	bne	s0,a5,.L16
.L15:
	lw	a5,8(sp)
	lw	a4,4(sp)
	lw	s0,24(sp)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	ra,28(sp)
	lw	s1,20(sp)
	lw	a1,-4(a5)
	lla	a0,.LC2
	addi	sp,sp,32
	tail	printf
	.size	DisplayVector, .-DisplayVector
	.globl	__udivsi3
	.section	.text.ntt_naive,"ax",@progbits
	.align	2
	.globl	ntt_naive
	.hidden	ntt_naive
	.type	ntt_naive, @function
ntt_naive:
	addi	sp,sp,-84
	slli	t1,a1,2
	sw	a1,16(sp)
	sw	a0,56(sp)
	sw	a1,60(sp)
	li	a0,1
	mv	a1,t1
	sw	a4,48(sp)
	sw	ra,80(sp)
	sw	t1,52(sp)
	sw	s0,76(sp)
	sw	s1,72(sp)
	mv	s0,a3
	mv	s1,a2
	call	calloc
	lw	a1,16(sp)
	mv	a5,a0
	addi	a0,s0,-1
	sw	a5,44(sp)
	call	__udivsi3
	mv	a5,a0
	mv	a1,s0
	mv	a0,s1
	sw	a5,0(sp)
	call	__umodsi3
	lw	a5,16(sp)
	addi	a4,s0,-1
	bltu	a4,a5,.L42
	li	a5,1
	sw	a5,24(sp)
	lw	a5,0(sp)
	mv	s1,s0
	mv	a4,a0
	mv	s0,a5
.L22:
	andi	t1,s0,1
	lw	a0,24(sp)
	mv	a2,a4
	li	a3,0
	li	a1,0
	srli	s0,s0,1
	beq	t1,zero,.L21
	sw	a4,0(sp)
	call	__muldi3
	mv	a2,s1
	li	a3,0
	call	__moddi3
	lw	a4,0(sp)
	sw	a0,24(sp)
.L21:
	mv	a2,a4
	mv	a0,a4
	li	a3,0
	li	a1,0
	call	__muldi3
	mv	a2,s1
	li	a3,0
	call	__moddi3
	mv	a4,a0
	bne	s0,zero,.L22
	mv	s0,s1
.L20:
	lw	a5,48(sp)
	beq	a5,zero,.L23
	lw	a0,24(sp)
	mv	a1,s0
	call	__umodsi3
	addi	a5,s0,-2
	sw	a5,8(sp)
	beq	a5,zero,.L43
	li	a4,1
	sw	a4,24(sp)
	mv	s1,s0
	mv	a4,a0
	mv	s0,a5
.L26:
	andi	t1,s0,1
	lw	a0,24(sp)
	mv	a2,a4
	li	a3,0
	li	a1,0
	srli	s0,s0,1
	beq	t1,zero,.L25
	sw	a4,0(sp)
	call	__muldi3
	mv	a2,s1
	li	a3,0
	call	__moddi3
	lw	a4,0(sp)
	sw	a0,24(sp)
.L25:
	mv	a2,a4
	mv	a0,a4
	li	a3,0
	li	a1,0
	call	__muldi3
	mv	a2,s1
	li	a3,0
	call	__moddi3
	mv	a4,a0
	bne	s0,zero,.L26
	mv	s0,s1
.L24:
	lw	a5,16(sp)
	ble	a5,zero,.L65
.L40:
	lw	a5,56(sp)
	sw	zero,28(sp)
	sw	zero,32(sp)
	sw	a5,36(sp)
	lw	a5,44(sp)
	sw	a5,20(sp)
	lw	a5,16(sp)
	srai	a5,a5,31
	sw	a5,40(sp)
.L27:
	lw	a5,20(sp)
	sw	zero,8(sp)
	li	a4,1
	lw	a5,0(a5)
	sw	a5,12(sp)
.L33:
	lw	s1,8(sp)
	lw	a3,36(sp)
	mv	a2,a4
	slli	a5,s1,2
	add	a5,a3,a5
	lw	a0,0(a5)
	li	a3,0
	li	a1,0
	call	__muldi3
	mv	a2,s0
	li	a3,0
	call	__moddi3
	lw	a4,12(sp)
	mv	a5,a0
	mv	a2,s0
	add	a0,a0,a4
	sltu	a5,a0,a5
	add	a1,a5,a1
	li	a3,0
	call	__moddi3
	lw	a4,20(sp)
	addi	a5,s1,1
	sw	a0,12(sp)
	sw	a0,0(a4)
	lw	a4,16(sp)
	sw	a5,8(sp)
	ble	a4,a5,.L66
	lw	a5,8(sp)
	lw	a2,28(sp)
	lw	a3,32(sp)
	mv	a0,a5
	srai	a1,a5,31
	call	__muldi3
	lw	a2,16(sp)
	lw	a3,40(sp)
	call	__moddi3
	mv	s1,a0
	lw	a0,24(sp)
	mv	a1,s0
	call	__umodsi3
	li	a4,1
	beq	s1,zero,.L33
	sw	s0,4(sp)
	mv	s0,s1
	mv	s1,a0
.L30:
	andi	t1,s0,1
	mv	a2,s1
	li	a3,0
	mv	a0,a4
	li	a1,0
	srli	s0,s0,1
	beq	t1,zero,.L29
	call	__muldi3
	lw	a2,4(sp)
	li	a3,0
	call	__moddi3
	mv	a4,a0
.L29:
	mv	a2,s1
	li	a3,0
	mv	a0,s1
	li	a1,0
	sw	a4,0(sp)
	call	__muldi3
	lw	a2,4(sp)
	li	a3,0
	call	__moddi3
	lw	a4,0(sp)
	mv	s1,a0
	bne	s0,zero,.L30
	lw	s0,4(sp)
	j	.L33
.L66:
	lw	a3,20(sp)
	lw	a4,28(sp)
	addi	a3,a3,4
	sw	a3,20(sp)
	lw	a3,32(sp)
	addi	a5,a4,1
	sltu	a4,a5,a4
	add	a4,a4,a3
	sw	a4,32(sp)
	lw	a4,16(sp)
	sw	a5,28(sp)
	bgt	a4,a5,.L27
	lw	a5,48(sp)
	beq	a5,zero,.L63
	lw	a0,16(sp)
	mv	a1,s0
	call	__umodsi3
	addi	a5,s0,-2
	sw	a5,8(sp)
	mv	s1,a0
	beq	a5,zero,.L45
.L41:
	sw	s0,4(sp)
	lw	s0,8(sp)
	li	a5,1
.L37:
	andi	t1,s0,1
	mv	a2,s1
	li	a3,0
	mv	a0,a5
	li	a1,0
	srli	s0,s0,1
	beq	t1,zero,.L36
	call	__muldi3
	lw	a2,4(sp)
	li	a3,0
	call	__moddi3
	mv	a5,a0
.L36:
	mv	a2,s1
	li	a3,0
	mv	a0,s1
	li	a1,0
	sw	a5,0(sp)
	call	__muldi3
	lw	a2,4(sp)
	li	a3,0
	call	__moddi3
	lw	a5,0(sp)
	mv	s1,a0
	bne	s0,zero,.L37
	lw	a4,16(sp)
	lw	s0,4(sp)
	ble	a4,zero,.L63
.L35:
	lw	a4,44(sp)
	lw	a3,52(sp)
	sw	a5,4(sp)
	mv	s1,a4
	mv	a5,s0
	add	a4,a3,a4
	mv	s0,s1
	sw	a4,0(sp)
	mv	s1,a5
.L39:
	lw	a0,0(s0)
	lw	a2,4(sp)
	li	a3,0
	li	a1,0
	call	__muldi3
	mv	a2,s1
	li	a3,0
	call	__moddi3
	lw	a5,0(sp)
	sw	a0,0(s0)
	addi	s0,s0,4
	bne	a5,s0,.L39
.L63:
	lw	ra,80(sp)
	lw	s0,76(sp)
	lw	a0,44(sp)
	lw	a1,16(sp)
	lw	s1,72(sp)
	addi	sp,sp,84
	jr	ra
.L23:
	lw	a5,16(sp)
	bgt	a5,zero,.L40
	j	.L63
.L43:
	li	a5,1
	sw	a5,24(sp)
	j	.L24
.L42:
	li	a5,1
	sw	a5,24(sp)
	j	.L20
.L65:
	mv	a0,a5
	mv	a1,s0
	call	__umodsi3
	lw	a5,8(sp)
	mv	s1,a0
	bne	a5,zero,.L41
	j	.L63
.L45:
	li	a5,1
	j	.L35
	.size	ntt_naive, .-ntt_naive
	.section	.text.NTTMultiply,"ax",@progbits
	.align	2
	.globl	NTTMultiply
	.hidden	NTTMultiply
	.type	NTTMultiply, @function
NTTMultiply:
	addi	sp,sp,-88
	sw	s0,80(sp)
	mv	t1,a3
	sw	a2,28(sp)
	sw	a3,32(sp)
	sw	ra,84(sp)
	sw	s1,76(sp)
	sw	a0,36(sp)
	sw	a1,40(sp)
	add	a3,a1,a3
	li	a2,1
	sw	a4,12(sp)
	mv	t0,a1
	mv	s0,a5
	ble	a3,a2,.L72
	li	a4,1
.L69:
	slli	a4,a4,1
	blt	a4,a3,.L69
	slli	a5,a4,2
	mv	s1,a5
.L68:
	mv	a1,s1
	li	a0,1
	sw	a5,24(sp)
	sw	t1,16(sp)
	sw	t0,8(sp)
	sw	a4,4(sp)
	call	calloc
	lw	a4,4(sp)
	mv	t2,a0
	mv	a1,s1
	li	a0,1
	sw	t2,44(sp)
	sw	t2,0(sp)
	sw	a4,48(sp)
	call	calloc
	lw	t0,8(sp)
	lw	t2,0(sp)
	lw	a4,4(sp)
	lw	a1,36(sp)
	slli	a2,t0,2
	mv	s1,a0
	mv	a0,t2
	sw	a4,56(sp)
	sw	s1,52(sp)
	call	memcpy
	lw	t1,16(sp)
	lw	a1,28(sp)
	mv	a0,s1
	slli	a2,t1,2
	call	memcpy
	lw	a2,12(sp)
	lw	a0,44(sp)
	lw	a1,48(sp)
	li	a4,0
	mv	a3,s0
	call	ntt_naive
	lw	t2,0(sp)
	mv	a3,a0
	sw	a3,16(sp)
	mv	a0,t2
	sw	a3,60(sp)
	sw	a1,64(sp)
	call	free
	lw	t1,60(sp)
	lw	a2,12(sp)
	lw	a0,52(sp)
	sw	t1,44(sp)
	lw	a1,56(sp)
	lw	t1,64(sp)
	mv	a3,s0
	li	a4,0
	sw	t1,48(sp)
	call	ntt_naive
	mv	a5,a0
	sw	a0,20(sp)
	sw	a5,60(sp)
	mv	a0,s1
	mv	s1,a5
	srai	a5,s0,31
	sw	a5,8(sp)
	sw	a1,64(sp)
	call	free
	lw	a3,16(sp)
	lw	a5,24(sp)
	sw	s0,0(sp)
	mv	s0,a3
	add	a5,a5,a3
	sw	a5,4(sp)
.L70:
	lw	a2,0(s1)
	lw	a0,0(s0)
	li	a3,0
	li	a1,0
	call	__muldi3
	lw	a2,0(sp)
	lw	a3,8(sp)
	addi	s0,s0,4
	addi	s1,s1,4
	call	__moddi3
	lw	a5,4(sp)
	sw	a0,-4(s0)
	bne	a5,s0,.L70
	lw	s0,0(sp)
	lw	a2,12(sp)
	lw	a0,44(sp)
	lw	a1,48(sp)
	mv	a3,s0
	li	a4,1
	call	ntt_naive
	mv	a5,a0
	lw	a0,16(sp)
	sw	a1,64(sp)
	sw	a5,60(sp)
	call	free
	lw	a0,20(sp)
	call	free
	lw	ra,84(sp)
	lw	s0,80(sp)
	lw	a0,60(sp)
	lw	a1,64(sp)
	lw	s1,76(sp)
	addi	sp,sp,88
	jr	ra
.L72:
	li	s1,4
	li	a4,1
	li	a5,4
	j	.L68
	.size	NTTMultiply, .-NTTMultiply
	.globl	__mulsi3
	.section	.text.NaivePolynomialMult,"ax",@progbits
	.align	2
	.globl	NaivePolynomialMult
	.hidden	NaivePolynomialMult
	.type	NaivePolynomialMult, @function
NaivePolynomialMult:
	add	a5,a1,a3
	addi	sp,sp,-72
	addi	a5,a5,-1
	sw	s0,64(sp)
	sw	a1,16(sp)
	sw	a0,44(sp)
	sw	a1,48(sp)
	mv	s0,a1
	li	a0,1
	slli	a1,a5,2
	sw	s1,60(sp)
	sw	ra,68(sp)
	mv	s1,a3
	sw	a3,20(sp)
	sw	a5,28(sp)
	sw	a2,36(sp)
	sw	a3,40(sp)
	call	calloc
	sw	a0,32(sp)
	ble	s0,zero,.L80
	lw	a4,36(sp)
	lw	a3,44(sp)
	slli	s1,s1,2
	add	a5,s1,a4
	sw	a4,24(sp)
	sw	a3,0(sp)
	sw	a0,8(sp)
	sw	a5,4(sp)
	sw	zero,12(sp)
.L81:
	lw	a5,20(sp)
	lw	s0,24(sp)
	lw	s1,8(sp)
	ble	a5,zero,.L83
	mv	a5,s0
	mv	s0,s1
	mv	s1,a5
.L82:
	lw	a5,0(sp)
	lw	a1,0(s1)
	addi	s0,s0,4
	lw	a0,0(a5)
	addi	s1,s1,4
	call	__mulsi3
	lw	a3,-4(s0)
	lw	a5,4(sp)
	add	a3,a3,a0
	sw	a3,-4(s0)
	bne	a5,s1,.L82
.L83:
	lw	a4,8(sp)
	lw	a5,12(sp)
	addi	a4,a4,4
	sw	a4,8(sp)
	lw	a4,0(sp)
	addi	a5,a5,1
	sw	a5,12(sp)
	addi	a4,a4,4
	sw	a4,0(sp)
	lw	a4,16(sp)
	bne	a4,a5,.L81
.L80:
	lw	ra,68(sp)
	lw	s0,64(sp)
	lw	a0,32(sp)
	lw	a1,28(sp)
	lw	s1,60(sp)
	addi	sp,sp,72
	jr	ra
	.size	NaivePolynomialMult, .-NaivePolynomialMult
	.section	.rodata.bench_init.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"The prime number is : %u\n"
	.align	2
.LC4:
	.string	"The primitive root is : %u\n"
	.align	2
.LC5:
	.string	"The length of the 1st polynomial is : %d\n"
	.align	2
.LC6:
	.string	"The length of the 2nd polynomial is : %d\n"
	.section	.text.bench_init,"ax",@progbits
	.align	2
	.globl	bench_init
	.hidden	bench_init
	.type	bench_init, @function
bench_init:
	addi	sp,sp,-20
	slli	a4,a0,1
	sw	s0,12(sp)
	add	s0,a4,a0
	lla	a5,.LANCHOR1
	slli	s0,s0,3
	add	s0,a5,s0
	sw	a0,0(sp)
	li	a0,1
	sw	ra,16(sp)
	sw	s1,8(sp)
	sw	a4,4(sp)
	la a5, .LANCHOR0; sw s0, 0(a5);
	call	bench_srand
	lw	s1,0(s0)
	li	a0,1
	lla	s0,.LANCHOR2
	slli	a1,s1,2
	call	calloc
	sw	a0,0(s0)
	sw	s1,4(s0)
	ble	s1,zero,.L90
	li	s1,0
.L91:
	call	bench_rand
	lw	a4,0(s0)
	slli	a2,s1,2
	lw	a3,4(s0)
	add	a4,a4,a2
	andi	a0,a0,0xff
	sw	a0,0(a4)
	addi	s1,s1,1
	bgt	a3,s1,.L91
.L90:
	lw	a4,0(sp)
	lw	a5,4(sp)
	li	a0,1
	add	a5,a5,a4
	slli	a5,a5,3
	lla	a4,.LANCHOR1
	add	a5,a4,a5
	lw	s1,4(a5)
	slli	a1,s1,2
	call	calloc
	lla	a4,.LANCHOR3
	sw	a0,0(a4)
	sw	s1,4(a4)
	ble	s1,zero,.L92
	li	s1,0
.L93:
	call	bench_rand
	lla	a4,.LANCHOR3
	lw	a5,0(a4)
	slli	a2,s1,2
	lw	a3,4(a4)
	add	a5,a5,a2
	andi	a0,a0,0xff
	sw	a0,0(a5)
	addi	s1,s1,1
	bgt	a3,s1,.L93
.L92:
	li	a1,998244352
	addi	a1,a1,1
	lla	a0,.LC3
	call	printf
	li	a1,3
	lla	a0,.LC4
	call	printf
	lw	a1,4(s0)
	lla	a0,.LC5
	call	printf
	lla	a4,.LANCHOR3
	lw	s0,12(sp)
	lw	ra,16(sp)
	lw	s1,8(sp)
	lw	a1,4(a4)
	lla	a0,.LC6
	addi	sp,sp,20
	tail	printf
	.size	bench_init, .-bench_init
	.section	.rodata.bench_run.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"Computing the result of polynomial multiplication...\n"
	.section	.text.bench_run,"ax",@progbits
	.align	2
	.globl	bench_run
	.hidden	bench_run
	.type	bench_run, @function
bench_run:
	addi	sp,sp,-12
	lla	a0,.LC7
	sw	ra,8(sp)
	call	printf
	lla	a4,.LANCHOR3
	lla	a5,.LANCHOR2
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a0,0(a5)
	lw	a1,4(a5)
	li	a5,998244352
	addi	a5,a5,1
	li	a4,3
	call	NTTMultiply
	lw	ra,8(sp)
	lla	a5,.LANCHOR4
	sw	a0,0(a5)
	sw	a1,4(a5)
	la a5, .LANCHOR0; lw a5, 0(a5);
	lw	a0,16(a5)
	lw	a1,20(a5)
	addi	sp,sp,12
	jr	ra
	.size	bench_run, .-bench_run
	.section	.rodata.bench_validate.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	"Checking result...\n"
	.align	2
.LC9:
	.string	"Error in NTT multiplication at index %d: expected %u, got %u\n"
	.align	2
.LC10:
	.string	"The result of polynomial multiplication is : \n"
	.align	2
.LC11:
	.string	"The result of naive polynomial multiplication is : \n"
	.align	2
.LC12:
	.string	"cs = 0x%08x\n"
	.align	2
.LC13:
	.string	"Wrong result!\n"
	.section	.text.bench_validate,"ax",@progbits
	.align	2
	.globl	bench_validate
	.hidden	bench_validate
	.type	bench_validate, @function
bench_validate:
	addi	sp,sp,-24
	lla	a0,.LC8
	sw	ra,20(sp)
	sw	s0,16(sp)
	sw	s1,12(sp)
	call	printf
	lla	a5,.LANCHOR3
	lw	a2,0(a5)
	lw	a3,4(a5)
	lla	a5,.LANCHOR2
	lw	a0,0(a5)
	lw	a1,4(a5)
	call	NaivePolynomialMult
	sw	a0,4(sp)
	sw	a1,8(sp)
	mv	s0,a0
	ble	a1,zero,.L100
	lla	s1,.LANCHOR4
	lw	a0,0(s1)
	mv	t1,a1
	mv	a4,s0
	li	a1,0
	mv	a5,a0
	j	.L103
.L101:
	addi	a1,a1,1
	beq	t1,a1,.L104
.L103:
	lw	a3,0(a5)
	lw	a2,0(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	beq	a3,a2,.L101
	lla	a0,.LC9
	call	printf
	lla	a0,.LC10
	call	printf
	lw	a1,4(s1)
	lw	a0,0(s1)
	call	DisplayVector
	lla	a0,.LC11
	call	printf
	lw	a0,4(sp)
	lw	a1,8(sp)
	call	DisplayVector
	lw	a1,4(s1)
	lw	a0,0(s1)
	slli	a1,a1,2
	add	a1,a0,a1
	call	bench_checksum
	mv	a1,a0
	lla	a0,.LC12
	call	printf
.L102:
	lla	a0,.LC13
	call	printf
	li	a5,1
.L105:
	sw	a5,0(sp)
	lla	a5,.LANCHOR2
	lw	a0,0(a5)
	call	free
	lla	a5,.LANCHOR3
	lw	a0,0(a5)
	call	free
	lw	a0,0(s1)
	call	free
	mv	a0,s0
	call	free
	lw	a5,0(sp)
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	mv	a0,a5
	addi	sp,sp,24
	jr	ra
.L100:
	lla	s1,.LANCHOR4
	lw	a0,0(s1)
.L104:
	lw	a1,4(s1)
	slli	a1,a1,2
	add	a1,a0,a1
	call	bench_checksum
	mv	a1,a0
	sw	a0,0(sp)
	lla	a0,.LC12
	call	printf
	la a5, .LANCHOR0; lw a5, 0(a5);
	lw	a5,8(a5)
	lw	a1,0(sp)
	bne	a1,a5,.L102
	li	a5,0
	j	.L105
	.size	bench_validate, .-bench_validate
	.section	.rodata.settings,"a"
	.align	3
	.set	.LANCHOR1,. + 0
	.type	settings, @object
	.size	settings, 96
settings:
	.word	2
	.word	2
	.word	-531496865
	.zero	4
	.word	0
	.word	0
	.word	8
	.word	8
	.word	-1753295646
	.zero	4
	.word	7
	.word	0
	.word	300
	.word	300
	.word	-1154535091
	.zero	4
	.word	66168
	.word	0
	.word	5000
	.word	5000
	.word	1933881791
	.zero	4
	.word	24822314
	.word	0
	.section	.sbss.a,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	a, @object
	.size	a, 8
a:
	.zero	8
	.section	.sbss.b,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	b, @object
	.size	b, 8
b:
	.zero	8
	.section	.sbss.c,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	c, @object
	.size	c, 8
c:
	.zero	8
	.section	.sbss.ps,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	ps, @object
	.size	ps, 4
ps:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
