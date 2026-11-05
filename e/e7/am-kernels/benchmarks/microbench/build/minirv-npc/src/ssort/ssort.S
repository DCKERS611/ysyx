#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ssort.cc"
	.option nopic
	.text
	.section	.text._ZL9radixPassPiS_S_ii,"ax",@progbits
	.align	2
	.type	_ZL9radixPassPiS_S_ii, @function
_ZL9radixPassPiS_S_ii:
	addi	a5,a4,1
	slli	a5,a5,2
	addi	sp,sp,-28
	mv	t1,a0
	mv	a0,a5
	sw	s0,20(sp)
	sw	s1,16(sp)
	sw	a4,8(sp)
	sw	t1,4(sp)
	sw	a1,0(sp)
	mv	s1,a3
	sw	ra,24(sp)
	sw	a5,12(sp)
	mv	s0,a2
	call	bench_alloc
	lw	a4,8(sp)
	lw	a1,0(sp)
	lw	t1,4(sp)
	mv	a3,a0
	blt	a4,zero,.L2
	lw	a5,12(sp)
	mv	a2,a0
	add	a5,a5,a0
.L3:
	sw	zero,0(a2)
	addi	a2,a2,4
	bne	a5,a2,.L3
	ble	s1,zero,.L10
.L12:
	slli	a0,s1,2
	mv	a2,t1
	add	a0,a0,t1
.L5:
	lw	a5,0(a2)
	addi	a2,a2,4
	slli	a5,a5,2
	add	a5,s0,a5
	lw	a5,0(a5)
	slli	a5,a5,2
	add	a5,a3,a5
	lw	t0,0(a5)
	addi	t0,t0,1
	sw	t0,0(a5)
	bne	a0,a2,.L5
	blt	a4,zero,.L11
.L10:
	mv	a5,a3
	li	a0,0
	li	a2,0
.L7:
	lw	t0,0(a5)
	addi	a2,a2,1
	sw	a0,0(a5)
	add	a0,a0,t0
	addi	a5,a5,4
	bge	a4,a2,.L7
	ble	s1,zero,.L1
.L11:
	li	t0,0
.L9:
	lw	t2,0(t1)
	addi	t0,t0,1
	addi	t1,t1,4
	slli	a5,t2,2
	add	a5,s0,a5
	lw	a4,0(a5)
	slli	a4,a4,2
	add	a4,a3,a4
	lw	a5,0(a4)
	addi	a2,a5,1
	slli	a5,a5,2
	sw	a2,0(a4)
	add	a5,a1,a5
	sw	t2,0(a5)
	bgt	s1,t0,.L9
.L1:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L2:
	bgt	s1,zero,.L12
	j	.L1
	.size	_ZL9radixPassPiS_S_ii, .-_ZL9radixPassPiS_S_ii
	.globl	__divsi3
	.globl	__modsi3
	.section	.text._Z11suffixArrayPiS_ii,"ax",@progbits
	.align	2
	.globl	_Z11suffixArrayPiS_ii
	.hidden	_Z11suffixArrayPiS_ii
	.type	_Z11suffixArrayPiS_ii, @function
_Z11suffixArrayPiS_ii:
	addi	sp,sp,-84
	mv	a4,a0
	mv	a5,a1
	addi	a0,a2,2
	li	a1,3
	sw	ra,80(sp)
	sw	a3,56(sp)
	sw	a4,8(sp)
	sw	s0,76(sp)
	sw	s1,72(sp)
	mv	s0,a2
	sw	a5,52(sp)
	call	__divsi3
	li	a1,3
	mv	a5,a0
	mv	a0,s0
	mv	s1,a5
	sw	s0,44(sp)
	call	__divsi3
	sw	s1,0(sp)
	add	s1,a0,s1
	addi	a4,s1,3
	slli	a4,a4,2
	mv	a0,a4
	addi	s0,s1,2
	slli	s0,s0,2
	sw	s1,40(sp)
	sw	a4,16(sp)
	call	bench_alloc
	lw	a4,16(sp)
	addi	a5,s0,-4
	add	a3,a0,s0
	sw	zero,0(a3)
	addi	s1,s0,-8
	add	a3,a0,a5
	sw	zero,0(a3)
	add	a3,a0,s1
	sw	a0,4(sp)
	sw	zero,0(a3)
	mv	a0,a4
	sw	a5,12(sp)
	call	bench_alloc
	lw	a5,12(sp)
	add	s0,a0,s0
	sw	zero,0(s0)
	add	a5,a0,a5
	sw	zero,0(a5)
	lw	a5,0(sp)
	add	s1,a0,s1
	sw	a0,36(sp)
	slli	a3,a5,2
	mv	a0,a3
	sw	zero,0(s1)
	sw	a3,64(sp)
	mv	s1,a3
	call	bench_alloc
	mv	a5,a0
	mv	a0,s1
	sw	a5,60(sp)
	call	bench_alloc
	lw	s0,44(sp)
	mv	a5,a0
	li	a1,3
	addi	a0,s0,1
	sw	a5,48(sp)
	call	__divsi3
	lw	a5,0(sp)
	li	s1,0
	sub	a5,a5,a0
	sw	a5,12(sp)
	add	a5,s0,a5
	sw	a5,16(sp)
	li	s0,0
	ble	a5,zero,.L27
.L22:
	lw	a5,16(sp)
	addi	s1,s1,1
	li	a1,3
	mv	a0,s1
	beq	s1,a5,.L27
.L26:
	call	__modsi3
	lw	a4,4(sp)
	slli	a5,s0,2
	add	a5,a4,a5
	beq	a0,zero,.L22
	sw	s1,0(a5)
	lw	a5,16(sp)
	addi	s1,s1,1
	addi	s0,s0,1
	li	a1,3
	mv	a0,s1
	bne	s1,a5,.L26
.L27:
	lw	s1,40(sp)
	lw	s0,8(sp)
	lw	a1,36(sp)
	lw	a0,4(sp)
	lw	a4,56(sp)
	addi	a2,s0,8
	mv	a3,s1
	call	_ZL9radixPassPiS_S_ii
	lw	a4,56(sp)
	lw	a1,4(sp)
	lw	a0,36(sp)
	mv	a3,s1
	addi	a2,s0,4
	call	_ZL9radixPassPiS_S_ii
	lw	a4,56(sp)
	lw	a1,36(sp)
	lw	a0,4(sp)
	mv	a3,s1
	mv	a2,s0
	call	_ZL9radixPassPiS_S_ii
	ble	s1,zero,.L24
	lw	a5,40(sp)
	lw	s0,36(sp)
	li	a3,0
	slli	a5,a5,2
	add	a5,a5,s0
	sw	a5,32(sp)
	li	a5,-1
	li	t1,-1
	li	a2,-1
	sw	a5,16(sp)
	mv	s1,a3
	sw	s0,68(sp)
	j	.L32
.L28:
	addi	s1,s1,1
	sw	t0,16(sp)
.L29:
	sw	a2,28(sp)
	sw	t1,24(sp)
	sw	a4,20(sp)
	call	__divsi3
	lw	a4,20(sp)
	mv	a5,a0
	li	a1,3
	mv	a0,a4
	sw	a5,20(sp)
	call	__modsi3
	lw	a4,0(sp)
	lw	a5,20(sp)
	lw	a3,4(sp)
	lw	t1,24(sp)
	add	a4,a4,a5
	slli	a4,a4,2
	add	a4,a3,a4
	li	a3,1
	lw	a2,28(sp)
	beq	a0,a3,.L71
	lw	a5,32(sp)
	sw	s1,0(a4)
	addi	s0,s0,4
	beq	a5,s0,.L72
.L32:
	lw	a4,0(s0)
	lw	a3,8(sp)
	mv	t2,a2
	slli	a5,a4,2
	add	a5,a3,a5
	lw	t0,0(a5)
	lw	a2,4(a5)
	mv	ra,t1
	lw	t1,8(a5)
	lw	a5,16(sp)
	li	a1,3
	mv	a0,a4
	bne	t0,a5,.L28
	bne	t2,a2,.L28
	bne	ra,t1,.L28
	j	.L29
.L71:
	lw	a4,4(sp)
	slli	a5,a5,2
	addi	s0,s0,4
	add	a5,a4,a5
	sw	s1,0(a5)
	lw	a5,32(sp)
	bne	a5,s0,.L32
.L72:
	lw	a5,40(sp)
	li	a1,1073741824
	lw	t0,68(sp)
	lw	a2,4(sp)
	mv	a3,s1
	li	a4,0
	addi	a1,a1,-1
	blt	s1,a5,.L73
	lw	a3,40(sp)
	lw	a0,36(sp)
.L36:
	lw	a5,0(a2)
	addi	a2,a2,4
	add	a5,a5,a1
	slli	a5,a5,2
	add	a5,a0,a5
	sw	a4,0(a5)
	addi	a4,a4,1
	bne	a3,a4,.L36
.L35:
	lw	a1,32(sp)
	lw	a0,0(sp)
	lw	t1,60(sp)
	li	a2,0
.L38:
	lw	a4,0(t0)
	slli	a5,a2,2
	addi	t0,t0,4
	slli	a3,a4,1
	add	a5,t1,a5
	add	a3,a3,a4
	bge	a4,a0,.L37
	sw	a3,0(a5)
	addi	a2,a2,1
.L37:
	bne	a1,t0,.L38
.L24:
	lw	a4,56(sp)
	lw	a3,0(sp)
	lw	a2,8(sp)
	lw	a1,48(sp)
	lw	a0,60(sp)
	call	_ZL9radixPassPiS_S_ii
	lw	a5,44(sp)
	ble	a5,zero,.L21
	lw	a5,40(sp)
	lw	a4,36(sp)
	sw	zero,16(sp)
	slli	a5,a5,2
	add	a5,a4,a5
	sw	a5,68(sp)
	lw	a4,64(sp)
	lw	a5,48(sp)
	add	a5,a5,a4
	sw	a5,60(sp)
	li	a4,0
	j	.L49
.L76:
	slli	a3,a5,1
	add	a3,a3,a5
	addi	a3,a3,1
	slli	a2,a3,2
	add	a2,s1,a2
	lw	a2,0(a2)
	blt	a2,t0,.L40
	beq	a2,t0,.L74
.L43:
	lw	a5,52(sp)
	slli	a2,a4,2
	lw	a3,0(sp)
	add	a5,a5,a2
	sw	t1,0(a5)
	lw	a5,16(sp)
	addi	a5,a5,1
	sw	a5,16(sp)
	beq	a3,a5,.L75
.L44:
	lw	a5,44(sp)
	addi	a4,a4,1
	ble	a5,a4,.L21
.L49:
	lw	a5,16(sp)
	li	a1,3
	sw	a4,32(sp)
	slli	s0,a5,2
	lw	a5,48(sp)
	add	s0,a5,s0
	lw	a5,12(sp)
	lw	t1,0(s0)
	slli	s1,a5,2
	lw	a5,36(sp)
	slli	a2,t1,2
	mv	a0,t1
	add	a5,a5,s1
	lw	s1,8(sp)
	sw	a5,56(sp)
	lw	a5,0(a5)
	add	a2,s1,a2
	sw	t1,24(sp)
	sw	a5,28(sp)
	sw	a2,20(sp)
	call	__divsi3
	lw	a2,20(sp)
	lw	a3,0(sp)
	lw	a5,28(sp)
	lw	t0,0(a2)
	lw	t1,24(sp)
	lw	a4,32(sp)
	blt	a5,a3,.L76
	lw	a3,0(sp)
	lw	s1,8(sp)
	sub	a5,a5,a3
	slli	a1,a5,1
	add	a1,a1,a5
	addi	a3,a1,2
	slli	t2,a3,2
	add	t2,s1,t2
	lw	t2,0(t2)
	blt	t2,t0,.L40
	bne	t2,t0,.L43
	lw	t0,8(sp)
	addi	a1,a1,3
	slli	a1,a1,2
	add	a1,t0,a1
	lw	a1,0(a1)
	lw	a2,4(a2)
	bge	a1,a2,.L77
.L40:
	lw	a2,52(sp)
	slli	a5,a4,2
	add	a2,a2,a5
	sw	a3,0(a2)
	lw	a3,12(sp)
	lw	a2,40(sp)
	addi	a3,a3,1
	sw	a3,12(sp)
	bne	a2,a3,.L44
	lw	a3,0(sp)
	lw	a2,16(sp)
	addi	a4,a4,1
	ble	a3,a2,.L44
	lw	a3,52(sp)
	lw	a2,60(sp)
	addi	a5,a5,4
	add	a5,a3,a5
.L45:
	lw	a3,0(s0)
	addi	s0,s0,4
	addi	a5,a5,4
	sw	a3,-4(a5)
	bne	a2,s0,.L45
	lw	a5,16(sp)
	sub	a4,a4,a5
	lw	a5,0(sp)
	add	a4,a4,a5
	sw	a5,16(sp)
	lw	a5,44(sp)
	addi	a4,a4,1
	bgt	a5,a4,.L49
.L21:
	lw	ra,80(sp)
	lw	s0,76(sp)
	lw	s1,72(sp)
	addi	sp,sp,84
	jr	ra
.L74:
	lw	a2,0(sp)
	add	a5,a5,a2
.L70:
	lw	a2,4(sp)
	slli	a5,a5,2
	slli	a0,a0,2
	add	a5,a2,a5
	add	a0,a2,a0
	lw	a5,0(a5)
	lw	a2,0(a0)
	bgt	a5,a2,.L43
	j	.L40
.L75:
	lw	a5,40(sp)
	lw	a3,12(sp)
	addi	a4,a4,1
	ble	a5,a3,.L44
	lw	a5,52(sp)
	lw	s1,56(sp)
	lw	t1,68(sp)
	lw	a0,0(sp)
	addi	a2,a2,4
	add	a2,a5,a2
.L48:
	lw	a3,0(s1)
	sub	t0,a3,a0
	slli	a5,t0,1
	slli	a1,a3,1
	add	a5,a5,t0
	add	a1,a1,a3
	addi	a5,a5,2
	bge	a3,a0,.L47
	addi	a5,a1,1
.L47:
	sw	a5,0(a2)
	addi	s1,s1,4
	addi	a2,a2,4
	bne	t1,s1,.L48
	lw	a5,12(sp)
	sub	a4,a4,a5
	lw	a5,40(sp)
	add	a4,a4,a5
	sw	a5,12(sp)
	j	.L44
.L77:
	bne	a1,a2,.L43
	lw	a2,0(sp)
	addi	a5,a5,1
	add	a0,a2,a0
	j	.L70
.L73:
	lw	s1,36(sp)
	lw	s0,4(sp)
	mv	a2,a5
	mv	a1,s1
	mv	a0,s0
	sw	t0,16(sp)
	call	_Z11suffixArrayPiS_ii
	lw	t0,16(sp)
	lw	a2,40(sp)
	mv	a3,s1
	li	a4,0
	mv	a1,s0
.L34:
	lw	a5,0(a3)
	addi	a4,a4,1
	addi	a3,a3,4
	slli	a5,a5,2
	add	a5,a1,a5
	sw	a4,0(a5)
	bne	a4,a2,.L34
	j	.L35
	.size	_Z11suffixArrayPiS_ii, .-_Z11suffixArrayPiS_ii
	.globl	__umodsi3
	.section	.text.bench_ssort_prepare,"ax",@progbits
	.align	2
	.globl	bench_ssort_prepare
	.hidden	bench_ssort_prepare
	.type	bench_ssort_prepare, @function
bench_ssort_prepare:
	la a5, setting; lw a5, 0(a5);
	lw	a5,0(a5)
	addi	sp,sp,-16
	sw	s1,4(sp)
	li	a0,1
	lla	s1,.LANCHOR0
	sw	ra,12(sp)
	sw	a5,0(s1)
	sw	s0,8(sp)
	call	bench_srand
	lw	a0,0(s1)
	addi	a0,a0,10
	slli	a0,a0,2
	call	bench_alloc
	lw	a5,0(s1)
	lla	a4,.LANCHOR1
	sw	a0,0(a4)
	addi	a0,a5,10
	slli	a0,a0,2
	call	bench_alloc
	lw	a5,0(s1)
	la a4, .LANCHOR2; sw a0, 0(a4);
	ble	a5,zero,.L78
	li	s0,0
.L80:
	call	bench_rand
	lla	a5,.LANCHOR1
	lw	a5,0(a5)
	slli	a4,s0,2
	li	a1,26
	add	a5,a5,a4
	sw	a5,0(sp)
	call	__umodsi3
	lw	a5,0(sp)
	lw	a4,0(s1)
	addi	s0,s0,1
	sw	a0,0(a5)
	bgt	a4,s0,.L80
.L78:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	bench_ssort_prepare, .-bench_ssort_prepare
	.section	.text.bench_ssort_run,"ax",@progbits
	.align	2
	.globl	bench_ssort_run
	.hidden	bench_ssort_run
	.type	bench_ssort_run, @function
bench_ssort_run:
	li	a3,26
	la a2, .LANCHOR0; lw a2, 0(a2);
	la a1, .LANCHOR2; lw a1, 0(a1);
	la a0, .LANCHOR1; lw a0, 0(a0);
	tail	_Z11suffixArrayPiS_ii
	.size	bench_ssort_run, .-bench_ssort_run
	.section	.text.bench_ssort_validate,"ax",@progbits
	.align	2
	.globl	bench_ssort_validate
	.hidden	bench_ssort_validate
	.type	bench_ssort_validate, @function
bench_ssort_validate:
	la a1, .LANCHOR0; lw a1, 0(a1);
	la a0, .LANCHOR2; lw a0, 0(a0);
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
	.size	bench_ssort_validate, .-bench_ssort_validate
	.section	.sbss._ZL1N,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL1N, @object
	.size	_ZL1N, 4
_ZL1N:
	.zero	4
	.section	.sbss._ZL1s,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL1s, @object
	.size	_ZL1s, 4
_ZL1s:
	.zero	4
	.section	.sbss._ZL2sa,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL2sa, @object
	.size	_ZL2sa, 4
_ZL2sa:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
