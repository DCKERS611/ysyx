#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"15pz.cc"
	.option nopic
	.text
	.section	.text._ZNK14Updatable_heapI8N_puzzleILi4EEE7pointerERKS1_.isra.0,"ax",@progbits
	.align	2
	.type	_ZNK14Updatable_heapI8N_puzzleILi4EEE7pointerERKS1_.isra.0, @function
_ZNK14Updatable_heapI8N_puzzleILi4EEE7pointerERKS1_.isra.0:
	lbu	t1,0(a2)
	beq	t1,zero,.L2
	lw	a5,20(a2)
	addi	a0,a0,-1
	and	a5,a0,a5
	slli	a5,a5,2
	add	a1,a1,a5
.L2:
	lw	a0,0(a1)
	beq	a0,zero,.L1
	li	t0,24
.L7:
	lbu	a5,0(a0)
	beq	a5,zero,.L4
	beq	t1,zero,.L4
	lw	a4,20(a0)
	lw	a5,20(a2)
	bne	a4,a5,.L4
	li	a4,8
.L5:
	addi	a5,a4,-4
.L6:
	add	a1,a0,a5
	add	a3,a2,a5
	lb	a1,0(a1)
	lb	a3,0(a3)
	addi	a5,a5,1
	bne	a1,a3,.L4
	bne	a4,a5,.L6
	addi	a4,a4,4
	bne	a4,t0,.L5
.L1:
	ret
.L4:
	lw	a0,24(a0)
	bne	a0,zero,.L7
	ret
	.size	_ZNK14Updatable_heapI8N_puzzleILi4EEE7pointerERKS1_.isra.0, .-_ZNK14Updatable_heapI8N_puzzleILi4EEE7pointerERKS1_.isra.0
	.section	.text.bench_15pz_prepare,"ax",@progbits
	.align	2
	.globl	bench_15pz_prepare
	.hidden	bench_15pz_prepare
	.type	bench_15pz_prepare, @function
bench_15pz_prepare:
	ret
	.size	bench_15pz_prepare, .-bench_15pz_prepare
	.section	.text.bench_15pz_validate,"ax",@progbits
	.align	2
	.globl	bench_15pz_validate
	.hidden	bench_15pz_validate
	.type	bench_15pz_validate, @function
bench_15pz_validate:
	la a5, setting; lw a5, 0(a5);
	lw	a0,12(a5)
	la a5, .LANCHOR0; lw a5, 0(a5);
	sub	a0,a0,a5
	seqz	a0,a0
	ret
	.size	bench_15pz_validate, .-bench_15pz_validate
	.globl	__umodsi3
	.section	.text._ZN8N_puzzleILi4EEC2Ev,"axG",@progbits,_ZN8N_puzzleILi4EEC5Ev,comdat
	.align	2
	.weak	_ZN8N_puzzleILi4EEC2Ev
	.hidden	_ZN8N_puzzleILi4EEC2Ev
	.type	_ZN8N_puzzleILi4EEC2Ev, @function
_ZN8N_puzzleILi4EEC2Ev:
	addi	sp,sp,-96
	sw	s0,88(sp)
	sw	ra,92(sp)
	sw	s1,84(sp)
	li	a5,1
	sb	a5,0(a0)
	mv	s0,a0
	sb	zero,3(a0)
	addi	a4,sp,20
	li	a5,0
	li	a3,16
.L26:
	sw	a5,0(a4)
	addi	a5,a5,1
	addi	a4,a4,4
	bne	a5,a3,.L26
	sw	zero,16(sp)
	li	a3,0
	mv	t1,s0
.L27:
	lw	a5,16(sp)
	addi	a4,sp,20
	li	s1,0
	slli	s0,a5,2
	add	s0,s0,a4
	addi	a4,a5,16
	sub	a5,t1,a5
	sw	a4,12(sp)
	sw	a5,8(sp)
.L30:
	sw	t1,4(sp)
	sw	a3,0(sp)
	call	bench_rand
	lw	a5,12(sp)
	sub	a1,a5,s1
	call	__umodsi3
	slli	a0,a0,2
	addi	a4,sp,20
	addi	a5,a0,64
	add	a5,a5,a4
	lw	a2,-64(a5)
	lw	a5,8(sp)
	lw	a3,0(sp)
	addi	t2,a2,-1
	add	a1,a5,s1
	srai	a5,t2,31
	srli	t0,a5,30
	add	a4,t2,t0
	andi	a5,a5,3
	add	a5,a5,t2
	andi	a4,a4,3
	sub	a4,a4,t0
	srai	a5,a5,2
	sub	a4,a4,s1
	sub	a5,a5,a3
	srai	t2,a5,31
	srai	t0,a4,31
	xor	a5,t2,a5
	xor	a4,t0,a4
	sub	a5,a5,t2
	sub	a4,a4,t0
	sb	a2,4(a1)
	lw	t1,4(sp)
	add	a4,a5,a4
	bne	a2,zero,.L28
	sb	a3,1(t1)
	sb	s1,2(t1)
.L29:
	lw	a5,60(s0)
	addi	a4,a0,64
	addi	a2,sp,20
	add	a0,a4,a2
	sw	a5,-64(a0)
	addi	s1,s1,1
	li	a5,4
	addi	s0,s0,-4
	bne	s1,a5,.L30
	lw	a5,16(sp)
	addi	a3,a3,1
	addi	a5,a5,-4
	mv	a4,a5
	sw	a5,16(sp)
	li	a5,-16
	bne	a4,a5,.L27
	li	a5,0
	mv	s0,t1
	sw	zero,20(t1)
	addi	a2,t1,4
	addi	a1,t1,20
	mv	a3,a5
.L32:
	addi	a4,a2,-4
.L33:
	slli	a5,a3,5
	sub	a5,a5,a3
	slli	a5,a5,2
	sub	a5,a5,a3
	slli	a5,a5,2
	lb	a0,4(a4)
	add	a5,a5,a3
	slli	a5,a5,2
	add	a5,a5,a3
	addi	a4,a4,1
	add	a3,a5,a0
	bne	a2,a4,.L33
	addi	a2,a2,4
	bne	a1,a2,.L32
	lw	ra,92(sp)
	sw	a3,20(s0)
	lw	s0,88(sp)
	lw	s1,84(sp)
	addi	sp,sp,96
	jr	ra
.L28:
	lbu	a5,3(t1)
	add	a4,a4,a5
	sb	a4,3(t1)
	j	.L29
	.size	_ZN8N_puzzleILi4EEC2Ev, .-_ZN8N_puzzleILi4EEC2Ev
	.weak	_ZN8N_puzzleILi4EEC1Ev
	.hidden	_ZN8N_puzzleILi4EEC1Ev
	.set	_ZN8N_puzzleILi4EEC1Ev,_ZN8N_puzzleILi4EEC2Ev
	.section	.text._ZN8N_puzzleILi4EEC2EPi,"axG",@progbits,_ZN8N_puzzleILi4EEC5EPi,comdat
	.align	2
	.weak	_ZN8N_puzzleILi4EEC2EPi
	.hidden	_ZN8N_puzzleILi4EEC2EPi
	.type	_ZN8N_puzzleILi4EEC2EPi, @function
_ZN8N_puzzleILi4EEC2EPi:
	addi	sp,sp,-36
	li	a5,1
	sw	s0,32(sp)
	addi	s0,sp,12
	sb	a5,0(a0)
	sw	s1,28(sp)
	sw	a1,4(sp)
	sb	zero,3(a0)
	mv	a5,s0
.L40:
	sb	zero,0(a5)
	addi	a4,sp,28
	addi	a5,a5,1
	bne	a5,a4,.L40
	sw	s0,8(sp)
	li	s1,0
	sw	zero,0(sp)
	mv	s0,a0
.L41:
	lw	a5,0(sp)
	li	a3,0
	slli	t1,a5,2
	lw	a5,4(sp)
	add	t1,a5,t1
.L44:
	lw	a2,0(t1)
	add	a1,s0,a3
	addi	t2,a2,-1
	srai	a4,t2,31
	srli	t0,a4,30
	add	a5,t2,t0
	andi	a4,a4,3
	add	a4,a4,t2
	andi	a5,a5,3
	sub	a5,a5,t0
	srai	a4,a4,2
	sub	a5,a5,a3
	sub	a4,a4,s1
	srai	t2,a4,31
	srai	t0,a5,31
	xor	a4,t2,a4
	xor	a5,t0,a5
	sub	a5,a5,t0
	sub	a4,a4,t2
	addi	t0,a2,16
	addi	t2,sp,12
	add	t0,t0,t2
	add	a4,a4,a5
	li	a5,1
	sb	a2,4(a1)
	sb	a5,-16(t0)
	bne	a2,zero,.L42
	sb	s1,1(a0)
	sb	a3,2(a0)
.L43:
	addi	a3,a3,1
	li	a5,4
	addi	t1,t1,4
	bne	a3,a5,.L44
	lw	a5,0(sp)
	li	a4,16
	addi	s1,s1,1
	addi	a5,a5,4
	sw	a5,0(sp)
	addi	s0,s0,4
	bne	a5,a4,.L41
	lw	s0,8(sp)
.L45:
	lbu	a5,0(s0)
	addi	s0,s0,1
	beq	a5,zero,.L58
	addi	a5,sp,28
	bne	s0,a5,.L45
	li	a5,0
	sw	zero,20(a0)
	addi	a2,a0,4
	addi	a1,a0,20
	mv	a3,a5
.L48:
	addi	a4,a2,-4
.L49:
	slli	a5,a3,5
	sub	a5,a5,a3
	slli	a5,a5,2
	sub	a5,a5,a3
	slli	a5,a5,2
	lb	t1,4(a4)
	add	a5,a5,a3
	slli	a5,a5,2
	add	a5,a5,a3
	addi	a4,a4,1
	add	a3,a5,t1
	bne	a4,a2,.L49
	addi	a2,a4,4
	bne	a1,a2,.L48
	lw	s0,32(sp)
	sw	a3,20(a0)
	lw	s1,28(sp)
	addi	sp,sp,36
	jr	ra
.L42:
	lbu	a5,3(a0)
	add	a4,a4,a5
	sb	a4,3(a0)
	j	.L43
.L58:
	lw	s0,32(sp)
	sb	zero,0(a0)
	lw	s1,28(sp)
	addi	sp,sp,36
	jr	ra
	.size	_ZN8N_puzzleILi4EEC2EPi, .-_ZN8N_puzzleILi4EEC2EPi
	.weak	_ZN8N_puzzleILi4EEC1EPi
	.hidden	_ZN8N_puzzleILi4EEC1EPi
	.set	_ZN8N_puzzleILi4EEC1EPi,_ZN8N_puzzleILi4EEC2EPi
	.section	.text._ZNK8N_puzzleILi4EE8solvableEv,"axG",@progbits,_ZNK8N_puzzleILi4EE8solvableEv,comdat
	.align	2
	.weak	_ZNK8N_puzzleILi4EE8solvableEv
	.hidden	_ZNK8N_puzzleILi4EE8solvableEv
	.type	_ZNK8N_puzzleILi4EE8solvableEv, @function
_ZNK8N_puzzleILi4EE8solvableEv:
	mv	t2,a0
	lbu	a0,0(a0)
	beq	a0,zero,.L79
	addi	sp,sp,-64
	addi	a2,t2,4
	mv	a1,sp
	addi	a0,t2,20
.L64:
	addi	a5,a2,-4
	mv	a3,a1
.L63:
	lb	a4,4(a5)
	addi	a5,a5,1
	bne	a4,zero,.L62
	li	a4,16
.L62:
	sw	a4,0(a3)
	addi	a3,a3,4
	bne	a5,a2,.L63
	addi	a2,a5,4
	addi	a1,a1,16
	bne	a2,a0,.L64
	li	t0,1
	li	a5,1
	li	a2,0
	li	a1,0
	li	t1,16
.L65:
	slli	a3,a5,2
	addi	a4,a3,64
	add	a3,a4,sp
	addi	a4,a1,64
	add	a4,a4,sp
	lw	a4,-64(a4)
	lw	a3,-64(a3)
	addi	a5,a5,1
	sgt	a4,a4,a3
	add	a2,a2,a4
	bne	a5,t1,.L65
	addi	a5,t0,1
	mv	a1,t0
	beq	a5,t1,.L80
	mv	t0,a5
	slli	a1,a1,2
	j	.L65
.L80:
	lbu	a4,1(t2)
	lbu	a5,2(t2)
	li	a0,6
	sub	a0,a0,a4
	sub	a0,a0,a5
	add	a0,a0,a2
	not	a0,a0
	andi	a0,a0,1
	addi	sp,sp,64
	jr	ra
.L79:
	ret
	.size	_ZNK8N_puzzleILi4EE8solvableEv, .-_ZNK8N_puzzleILi4EE8solvableEv
	.section	.text._ZN14Updatable_heapI8N_puzzleILi4EEE12percolate_upEi,"axG",@progbits,_ZN14Updatable_heapI8N_puzzleILi4EEE12percolate_upEi,comdat
	.align	2
	.weak	_ZN14Updatable_heapI8N_puzzleILi4EEE12percolate_upEi
	.hidden	_ZN14Updatable_heapI8N_puzzleILi4EEE12percolate_upEi
	.type	_ZN14Updatable_heapI8N_puzzleILi4EEE12percolate_upEi, @function
_ZN14Updatable_heapI8N_puzzleILi4EEE12percolate_upEi:
	li	a5,1
	beq	a1,a5,.L87
	lw	a3,8(a0)
	slli	a5,a1,2
	addi	sp,sp,-4
	add	a5,a3,a5
	lw	a2,0(a5)
	sw	s0,0(sp)
	li	t1,1
	lw	a0,36(a2)
	j	.L84
.L90:
	sw	t2,0(a4)
	sw	a2,0(a5)
	lw	a5,0(a4)
	sw	a1,28(a2)
	sw	t0,28(a5)
	beq	a1,t1,.L81
.L84:
	srli	a5,a1,31
	add	a5,a5,a1
	mv	t0,a1
	srai	a1,a5,1
	slli	a5,a1,2
	add	a5,a3,a5
	lw	t2,0(a5)
	slli	a4,t0,2
	add	a4,a3,a4
	lw	s0,36(t2)
	bgt	s0,a0,.L90
.L81:
	lw	s0,0(sp)
	addi	sp,sp,4
	jr	ra
.L87:
	ret
	.size	_ZN14Updatable_heapI8N_puzzleILi4EEE12percolate_upEi, .-_ZN14Updatable_heapI8N_puzzleILi4EEE12percolate_upEi
	.section	.rodata._ZN14Updatable_heapI8N_puzzleILi4EEE4pushERKS1_i.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `heap_size <= M' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/am-kernels/benchmarks/microbench/src/15pz/heap.h:152  \n"
	.section	.text._ZN14Updatable_heapI8N_puzzleILi4EEE4pushERKS1_i,"axG",@progbits,_ZN14Updatable_heapI8N_puzzleILi4EEE4pushERKS1_i,comdat
	.align	2
	.weak	_ZN14Updatable_heapI8N_puzzleILi4EEE4pushERKS1_i
	.hidden	_ZN14Updatable_heapI8N_puzzleILi4EEE4pushERKS1_i
	.type	_ZN14Updatable_heapI8N_puzzleILi4EEE4pushERKS1_i, @function
_ZN14Updatable_heapI8N_puzzleILi4EEE4pushERKS1_i:
	lw	a5,0(a0)
	mv	a3,a1
	lw	a1,4(a0)
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	mv	s0,a2
	mv	s1,a0
	mv	a2,a3
	mv	a0,a5
	sw	a5,4(sp)
	sw	a3,0(sp)
	sw	ra,16(sp)
	call	_ZNK14Updatable_heapI8N_puzzleILi4EEE7pointerERKS1_.isra.0
	lw	a3,0(sp)
	lw	a5,4(sp)
	beq	a0,zero,.L112
	lbu	a5,40(a0)
	bne	a5,zero,.L91
	lbu	a4,0(a0)
	li	a5,64
	beq	a4,zero,.L103
	lb	a5,3(a0)
.L103:
	lw	a4,36(a0)
	add	a5,s0,a5
	blt	a5,a4,.L113
.L91:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L112:
	lw	a4,12(s1)
	bgt	a4,a5,.L114
	addi	a4,a4,1
	sw	a4,12(s1)
	li	a0,48
	sw	a3,0(sp)
	call	bench_alloc
	lw	a3,0(sp)
	lw	t0,4(s1)
	li	a4,0
	lbu	t2,0(a3)
	lw	a2,20(a3)
	bne	t2,zero,.L115
.L98:
	lw	t1,0(s1)
	lw	a1,12(s1)
	addi	a5,a3,4
	addi	t1,t1,-1
	and	a4,t1,a4
	slli	a4,a4,2
	add	a4,t0,a4
	lw	a4,0(a4)
	sb	t2,0(a0)
	lbu	ra,1(a3)
	sw	t1,4(sp)
	sw	a4,0(sp)
	sb	ra,1(a0)
	lbu	ra,2(a3)
	addi	a4,a0,4
	addi	t1,a3,20
	sb	ra,2(a0)
	lb	ra,3(a3)
	sw	a2,20(a0)
	sb	ra,3(a0)
.L99:
	lb	a2,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sb	a2,-4(a4)
	lb	a2,-3(a5)
	sb	a2,-3(a4)
	lb	a2,-2(a5)
	sb	a2,-2(a4)
	lb	a2,-1(a5)
	sb	a2,-1(a4)
	bne	a5,t1,.L99
	lw	a5,0(sp)
	sw	a1,28(a0)
	sw	s0,32(a0)
	sw	a5,24(a0)
	beq	t2,zero,.L100
	lw	a5,20(a3)
	lw	a4,4(sp)
	add	ra,ra,s0
	sw	ra,36(a0)
	and	a5,a4,a5
	slli	a5,a5,2
	sb	zero,40(a0)
	sw	zero,44(a0)
	add	t0,t0,a5
.L104:
	lw	a5,8(s1)
	slli	a4,a1,2
	sw	a0,0(t0)
	add	a5,a5,a4
	sw	a0,0(a5)
	mv	a0,s1
	sw	a1,0(sp)
	call	_ZN14Updatable_heapI8N_puzzleILi4EEE12percolate_upEi
	lw	a5,16(s1)
	lw	a1,0(sp)
	bge	a5,a1,.L101
	mv	a5,a1
.L101:
	lw	ra,16(sp)
	lw	s0,12(sp)
	sw	a5,16(s1)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L115:
	mv	a4,a2
	j	.L98
.L113:
	lw	s0,12(sp)
	lw	a1,28(a0)
	lw	ra,16(sp)
	sw	a5,36(a0)
	mv	a0,s1
	lw	s1,8(sp)
	addi	sp,sp,20
	tail	_ZN14Updatable_heapI8N_puzzleILi4EEE12percolate_upEi
.L100:
	addi	s0,s0,64
	sw	s0,36(a0)
	sb	zero,40(a0)
	sw	zero,44(a0)
	j	.L104
.L114:
	lla	s0,.LC0
	li	a0,65
.L94:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L94
	lla	s0,.LC1
	li	a0,65
.L95:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L95
	lla	s0,.LC2
	li	a0,32
.L96:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L96
	li	a0,1
	call	halt
	.size	_ZN14Updatable_heapI8N_puzzleILi4EEE4pushERKS1_i, .-_ZN14Updatable_heapI8N_puzzleILi4EEE4pushERKS1_i
	.section	.text._ZN14Updatable_heapI8N_puzzleILi4EEE14percolate_downEv,"axG",@progbits,_ZN14Updatable_heapI8N_puzzleILi4EEE14percolate_downEv,comdat
	.align	2
	.weak	_ZN14Updatable_heapI8N_puzzleILi4EEE14percolate_downEv
	.hidden	_ZN14Updatable_heapI8N_puzzleILi4EEE14percolate_downEv
	.type	_ZN14Updatable_heapI8N_puzzleILi4EEE14percolate_downEv, @function
_ZN14Updatable_heapI8N_puzzleILi4EEE14percolate_downEv:
	lw	a5,12(a0)
	addi	sp,sp,-16
	sw	s0,12(sp)
	mv	a3,a5
	sw	a5,0(sp)
	sw	s1,8(sp)
	sw	a0,4(sp)
	li	a5,2
	ble	a3,a5,.L124
	lw	a1,8(a0)
	li	a3,1
	li	a4,2
	j	.L122
.L127:
	blt	s1,a0,.L116
.L119:
	lw	a5,0(a2)
	sw	t2,0(a2)
	sw	a5,0(t1)
	lw	a4,0(a2)
	sw	a3,28(a5)
	lw	a5,0(sp)
	mv	a3,t0
	sw	t0,28(a4)
	slli	a4,a3,1
	ble	a5,a4,.L117
.L122:
	slli	a0,a3,2
	add	t1,a1,a0
	add	a0,t1,a0
	lw	s0,0(a0)
	lw	t2,0(t1)
	slli	a0,a3,3
	add	a0,a1,a0
	lw	a0,4(a0)
	lw	s1,36(t2)
	lw	s0,36(s0)
	addi	t0,a4,1
	slli	a5,a4,2
	slli	a2,t0,2
	lw	a0,36(a0)
	add	a5,a1,a5
	add	a2,a1,a2
	blt	s1,s0,.L127
	bge	s0,a0,.L119
	lw	a2,0(a5)
	sw	t2,0(a5)
	sw	a2,0(t1)
	lw	a5,0(a5)
	sw	a3,28(a2)
	mv	a3,a4
	sw	a4,28(a5)
	lw	a5,0(sp)
	slli	a4,a3,1
	bgt	a5,a4,.L122
.L117:
	lw	a5,0(sp)
	beq	a5,a4,.L128
.L116:
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,16
	jr	ra
.L128:
	lw	a5,4(sp)
	slli	a4,a3,3
	lw	a2,8(a5)
	slli	a5,a3,2
	add	a4,a2,a4
	add	a5,a2,a5
	lw	a0,0(a4)
	lw	a1,0(a5)
	lw	a0,36(a0)
	lw	a4,36(a1)
	bge	a0,a4,.L116
	lw	a0,0(sp)
	slli	a4,a0,2
	add	a4,a2,a4
	lw	a2,0(a4)
	sw	a1,0(a4)
	sw	a2,0(a5)
	lw	a5,0(a4)
	sw	a3,28(a2)
	sw	a0,28(a5)
	j	.L116
.L124:
	li	a3,1
	li	a4,2
	j	.L117
	.size	_ZN14Updatable_heapI8N_puzzleILi4EEE14percolate_downEv, .-_ZN14Updatable_heapI8N_puzzleILi4EEE14percolate_downEv
	.section	.rodata.bench_15pz_run.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"Assertion `0' failed"
	.align	2
.LC4:
	.string	" @ /home/ysyx/ysyx-workbench/am-kernels/benchmarks/microbench/src/15pz/15pz.cc:51  \n"
	.align	2
.LC5:
	.string	"Assertion `puzzle.solvable()' failed"
	.align	2
.LC6:
	.string	" @ /home/ysyx/ysyx-workbench/am-kernels/benchmarks/microbench/src/15pz/15pz.cc:53  \n"
	.align	2
.LC7:
	.string	"Assertion `size() > 1' failed"
	.align	2
.LC8:
	.string	" @ /home/ysyx/ysyx-workbench/am-kernels/benchmarks/microbench/src/15pz/heap.h:86  \n"
	.globl	__mulsi3
	.section	.text.bench_15pz_run,"ax",@progbits
	.align	2
	.globl	bench_15pz_run
	.hidden	bench_15pz_run
	.type	bench_15pz_run, @function
bench_15pz_run:
	addi	sp,sp,-188
	addi	a0,sp,40
	sw	ra,184(sp)
	sw	s0,180(sp)
	sw	s1,176(sp)
	call	_ZN8N_puzzleILi4EEC1Ev
	la a5, setting; lw a5, 0(a5);
	lw	a5,0(a5)
	li	a4,2
	beq	a5,a4,.L130
	bgt	a5,a4,.L131
	beq	a5,zero,.L132
	li	a4,1
	bne	a5,a4,.L262
	addi	s0,sp,112
	lla	a1,.LANCHOR2
	mv	a0,s0
	call	_ZN8N_puzzleILi4EEC1EPi
	lw	a4,112(sp)
	addi	t1,sp,128
	mv	a5,s0
	sw	a4,40(sp)
	lw	a4,132(sp)
	sw	t1,4(sp)
	sw	a4,60(sp)
	addi	a4,sp,40
.L138:
	lbu	a0,4(a5)
	lbu	a1,5(a5)
	lbu	a2,6(a5)
	lbu	a3,7(a5)
	sb	a0,4(a4)
	sb	a1,5(a4)
	sb	a2,6(a4)
	sb	a3,7(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	bne	t1,a5,.L138
	li	a5,4096
	addi	a5,a5,-2048
	sw	a5,24(sp)
	j	.L137
.L131:
	li	a4,3
	bne	a5,a4,.L262
	addi	s0,sp,112
	lla	a1,.LANCHOR4
	mv	a0,s0
	call	_ZN8N_puzzleILi4EEC1EPi
	lw	a4,112(sp)
	addi	t1,sp,128
	mv	a5,s0
	sw	a4,40(sp)
	lw	a4,132(sp)
	sw	t1,4(sp)
	sw	a4,60(sp)
	addi	a4,sp,40
.L140:
	lbu	a0,4(a5)
	lbu	a1,5(a5)
	lbu	a2,6(a5)
	lbu	a3,7(a5)
	sb	a0,4(a4)
	sb	a1,5(a4)
	sb	a2,6(a4)
	sb	a3,7(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	bne	t1,a5,.L140
	li	a5,786432
	sw	a5,24(sp)
.L137:
	addi	a0,sp,40
	call	_ZNK8N_puzzleILi4EE8solvableEv
	beq	a0,zero,.L265
	li	a0,20
	call	bench_alloc
	lw	a5,24(sp)
	mv	s1,a0
	sw	a5,0(a0)
	slli	a0,a5,2
	call	bench_alloc
	lw	a5,0(s1)
	sw	a0,8(s1)
	addi	a5,a5,1
	slli	a0,a5,2
	call	bench_alloc
	lw	a3,0(s1)
	sw	a0,4(s1)
	sw	zero,12(s1)
	slli	a4,a3,2
	sw	zero,16(s1)
	mv	a5,a0
	add	a4,a0,a4
	ble	a3,zero,.L153
.L152:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a4,a5,.L152
.L153:
	li	a2,0
	addi	a1,sp,40
	mv	a0,s1
	call	_ZN14Updatable_heapI8N_puzzleILi4EEE4pushERKS1_i
	lw	a2,12(s1)
	li	a5,-1
	lla	a4,.LANCHOR0
	sw	a5,0(a4)
	sw	zero,0(sp)
	beq	a2,zero,.L129
.L150:
	lw	t0,8(s1)
	mv	a4,s0
	mv	a3,s0
	lw	a5,4(t0)
	lbu	a1,0(a5)
	lw	t1,0(a5)
	addi	a5,a5,4
	sw	a1,16(sp)
	lbu	a1,-3(a5)
	sw	a1,12(sp)
	lbu	a1,-2(a5)
	sw	a1,8(sp)
	lb	a1,-1(a5)
	sw	a1,28(sp)
	lw	a1,16(a5)
	sw	a1,20(sp)
.L182:
	lbu	a1,3(a5)
	lbu	ra,0(a5)
	lbu	t2,1(a5)
	lbu	a0,2(a5)
	sb	a1,7(a3)
	lw	a1,4(sp)
	sb	ra,4(a3)
	sb	t2,5(a3)
	sb	a0,6(a3)
	addi	a3,a3,4
	addi	a5,a5,4
	bne	a3,a1,.L182
	li	a5,1
	beq	a2,a5,.L266
	ble	a2,a5,.L267
	slli	a3,a2,2
	add	a3,t0,a3
	lw	a3,0(a3)
	addi	a2,a2,-1
	mv	a0,s1
	sw	a3,4(t0)
	sw	a5,28(a3)
	sw	a2,12(s1)
	sw	t1,36(sp)
	sw	a4,32(sp)
	call	_ZN14Updatable_heapI8N_puzzleILi4EEE14percolate_downEv
	lw	t1,36(sp)
	lw	a4,32(sp)
.L184:
	lw	a5,20(sp)
	sw	t1,64(sp)
	lw	t1,4(sp)
	sw	a5,84(sp)
	addi	a5,sp,64
	sw	a5,32(sp)
.L189:
	lbu	a0,4(a4)
	lbu	a1,5(a4)
	lbu	a2,6(a4)
	lbu	a3,7(a4)
	sb	a0,4(a5)
	sb	a1,5(a5)
	sb	a2,6(a5)
	sb	a3,7(a5)
	addi	a4,a4,4
	addi	a5,a5,4
	bne	a4,t1,.L189
	lw	a5,0(sp)
	mv	a4,s0
	li	a3,15
	addi	a5,a5,1
	sw	a5,0(sp)
	li	a5,0
.L190:
	addi	a5,a5,1
	sw	a5,0(a4)
	addi	a4,a4,4
	bne	a5,a3,.L190
	mv	a1,s0
	addi	a0,sp,88
	sw	zero,172(sp)
	call	_ZN8N_puzzleILi4EEC1EPi
	lw	a5,16(sp)
	beq	a5,zero,.L175
	lbu	a5,88(sp)
	beq	a5,zero,.L263
	lw	a5,108(sp)
	lw	a4,20(sp)
	bne	a5,a4,.L263
	addi	a5,sp,64
	addi	t1,sp,80
	addi	a1,sp,88
	sw	t1,16(sp)
	mv	a2,a5
	li	a0,4
.L193:
	li	a5,0
.L194:
	add	a3,a2,a5
	add	a4,a1,a5
	lb	a3,4(a3)
	lb	a4,4(a4)
	bne	a3,a4,.L192
	addi	a5,a5,1
	bne	a5,a0,.L194
	addi	a2,a2,4
	addi	a1,a1,4
	bne	a2,t1,.L193
	lw	a1,4(s1)
	lw	a0,0(s1)
	addi	a2,sp,64
	call	_ZNK14Updatable_heapI8N_puzzleILi4EEE7pointerERKS1_.isra.0
	li	a1,-2147483648
	xori	a1,a1,-1
	beq	a0,zero,.L199
	lw	a1,32(a0)
.L199:
	lw	a0,0(sp)
	call	__mulsi3
	lla	a5,.LANCHOR0
	sw	a0,0(a5)
.L129:
	lw	ra,184(sp)
	lw	s0,180(sp)
	lw	s1,176(sp)
	addi	sp,sp,188
	jr	ra
.L255:
	lw	a1,4(s1)
	lw	a0,0(s1)
	addi	a2,sp,64
	call	_ZNK14Updatable_heapI8N_puzzleILi4EEE7pointerERKS1_.isra.0
	beq	a0,zero,.L204
	lw	a2,32(a0)
	addi	a2,a2,1
.L181:
	addi	a1,sp,88
	mv	a0,s1
	call	_ZN14Updatable_heapI8N_puzzleILi4EEE4pushERKS1_i
.L175:
	lw	a2,12(s1)
	beq	a2,zero,.L129
	lw	a5,24(sp)
	lw	a4,0(sp)
	bne	a5,a4,.L150
	lw	ra,184(sp)
	lw	s0,180(sp)
	lw	s1,176(sp)
	addi	sp,sp,188
	jr	ra
.L263:
	addi	a5,sp,80
	sw	a5,16(sp)
.L192:
	lw	a4,8(sp)
	li	a5,3
	beq	a4,a5,.L268
	lw	t0,16(sp)
	mv	a1,s0
	mv	a4,s0
	addi	a5,sp,64
.L155:
	lbu	t1,4(a5)
	lbu	a0,5(a5)
	lbu	a2,6(a5)
	lbu	a3,7(a5)
	sb	t1,4(a4)
	sb	a0,5(a4)
	sb	a2,6(a4)
	sb	a3,7(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	bne	t0,a5,.L155
	lw	a5,12(sp)
	lw	t2,8(sp)
	addi	a4,sp,40
	slli	a5,a5,2
	sw	a5,20(sp)
	addi	a5,a5,136
	addi	t0,t2,1
	add	a4,a5,a4
	add	a5,a4,t0
	lb	a3,-108(a5)
	add	a0,a4,t2
	andi	a2,t0,255
	addi	a5,a3,-1
	srai	t1,a5,31
	srli	t1,t1,30
	add	a5,a5,t1
	andi	a5,a5,3
	sub	a5,a5,t1
	sub	t1,a5,t2
	sub	a5,a5,t0
	srai	t2,a5,31
	srai	ra,t1,31
	xor	a5,t2,a5
	xor	t1,ra,t1
	sub	a5,a5,t2
	sub	t1,t1,ra
	sub	t1,t1,a5
	lw	a5,28(sp)
	sb	a3,-60(a0)
	add	a4,a4,a2
	add	t1,t1,a5
	addi	a0,s0,4
	slli	t1,t1,24
	srai	t1,t1,24
	andi	t0,t0,0xff
	sb	zero,-60(a4)
	mv	a2,a0
	addi	t2,s0,20
	li	a5,0
.L156:
	addi	a4,a2,-4
.L157:
	slli	a3,a5,5
	sub	a3,a3,a5
	slli	a3,a3,2
	sub	a3,a3,a5
	slli	a3,a3,2
	lb	ra,4(a4)
	add	a3,a3,a5
	slli	a3,a3,2
	add	a5,a3,a5
	addi	a4,a4,1
	add	a5,a5,ra
	bne	a4,a2,.L157
	addi	a2,a4,4
	bne	t2,a2,.L156
	li	a4,1
	sb	a4,88(sp)
	lw	a4,12(sp)
	sb	t0,90(sp)
	sw	a5,108(sp)
	sb	a4,89(sp)
	sb	t1,91(sp)
	addi	a5,sp,88
	addi	t0,s0,16
.L159:
	lbu	t1,4(a1)
	lbu	a2,5(a1)
	lbu	a3,6(a1)
	lbu	a4,7(a1)
	sb	t1,4(a5)
	sb	a2,5(a5)
	sb	a3,6(a5)
	sb	a4,7(a5)
	mv	a1,a0
	addi	a5,a5,4
	beq	a0,t0,.L252
	addi	a0,a0,4
	j	.L159
.L252:
	lw	a1,4(s1)
	lw	a0,0(s1)
	addi	a2,sp,64
	call	_ZNK14Updatable_heapI8N_puzzleILi4EEE7pointerERKS1_.isra.0
	beq	a0,zero,.L201
	lw	a2,32(a0)
	addi	a2,a2,1
.L160:
	addi	a1,sp,88
	mv	a0,s1
	call	_ZN14Updatable_heapI8N_puzzleILi4EEE4pushERKS1_i
	lw	a5,8(sp)
	bne	a5,zero,.L197
.L161:
	lw	a4,12(sp)
	li	a5,3
	beq	a4,a5,.L168
	lw	t0,16(sp)
	mv	a1,s0
	mv	a4,s0
	addi	a5,sp,64
.L169:
	lbu	t1,4(a5)
	lbu	a0,5(a5)
	lbu	a2,6(a5)
	lbu	a3,7(a5)
	sb	t1,4(a4)
	sb	a0,5(a4)
	sb	a2,6(a4)
	sb	a3,7(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	bne	a5,t0,.L169
	lw	a0,12(sp)
	lw	ra,8(sp)
	addi	a4,sp,40
	addi	t0,a0,1
	slli	a5,t0,2
	addi	a5,a5,136
	add	a5,a5,a4
	add	a5,a5,ra
	lb	a3,-108(a5)
	andi	a4,t0,255
	slli	a4,a4,2
	addi	a2,a3,-1
	srai	a5,a2,31
	andi	a5,a5,3
	add	a5,a5,a2
	srai	a5,a5,2
	sub	a2,a5,a0
	sub	a5,a5,t0
	srai	t2,a2,31
	srai	a0,a5,31
	xor	t1,t2,a2
	xor	a5,a0,a5
	sub	a5,a5,a0
	sub	t1,t1,t2
	sub	t1,t1,a5
	lw	a5,20(sp)
	addi	a2,sp,40
	addi	a0,s0,4
	addi	a5,a5,136
	add	a2,a5,a2
	addi	a5,a4,136
	addi	a4,sp,40
	add	a5,a5,a4
	lw	a4,28(sp)
	add	a2,a2,ra
	sb	a3,-60(a2)
	add	t1,t1,a4
	add	a5,a5,ra
	slli	t1,t1,24
	sb	zero,-60(a5)
	srai	t1,t1,24
	andi	t0,t0,0xff
	mv	a3,a0
	addi	t2,s0,20
	li	a5,0
.L170:
	addi	a4,a3,-4
.L171:
	slli	a2,a5,5
	sub	a2,a2,a5
	slli	a2,a2,2
	sub	a2,a2,a5
	slli	a2,a2,2
	lb	ra,4(a4)
	add	a2,a2,a5
	slli	a2,a2,2
	add	a5,a2,a5
	addi	a4,a4,1
	add	a5,a5,ra
	bne	a3,a4,.L171
	addi	a3,a3,4
	bne	a3,t2,.L170
	li	a4,1
	sb	a4,88(sp)
	lw	a4,8(sp)
	sb	t0,89(sp)
	sw	a5,108(sp)
	sb	a4,90(sp)
	sb	t1,91(sp)
	addi	a5,sp,88
	addi	t0,s0,16
.L173:
	lbu	t1,4(a1)
	lbu	a2,5(a1)
	lbu	a3,6(a1)
	lbu	a4,7(a1)
	sb	t1,4(a5)
	sb	a2,5(a5)
	sb	a3,6(a5)
	sb	a4,7(a5)
	mv	a1,a0
	addi	a5,a5,4
	beq	t0,a0,.L254
	addi	a0,a0,4
	j	.L173
.L254:
	lw	a1,4(s1)
	lw	a0,0(s1)
	addi	a2,sp,64
	call	_ZNK14Updatable_heapI8N_puzzleILi4EEE7pointerERKS1_.isra.0
	beq	a0,zero,.L203
	lw	a2,32(a0)
	addi	a2,a2,1
.L174:
	addi	a1,sp,88
	mv	a0,s1
	call	_ZN14Updatable_heapI8N_puzzleILi4EEE4pushERKS1_i
	lw	a5,12(sp)
	beq	a5,zero,.L175
.L168:
	lw	a4,32(sp)
	lw	t0,16(sp)
	mv	a1,s0
	mv	a5,s0
.L176:
	lbu	t1,4(a4)
	lbu	a0,5(a4)
	lbu	a2,6(a4)
	lbu	a3,7(a4)
	sb	t1,4(a5)
	sb	a0,5(a5)
	sb	a2,6(a5)
	sb	a3,7(a5)
	addi	a4,a4,4
	addi	a5,a5,4
	bne	a4,t0,.L176
	lw	t1,12(sp)
	lw	ra,8(sp)
	addi	a4,sp,40
	addi	a0,t1,-1
	slli	a5,a0,2
	addi	a5,a5,136
	add	a5,a5,a4
	add	a5,a5,ra
	lb	a3,-108(a5)
	lw	a5,20(sp)
	andi	t2,a0,0xff
	addi	a2,a3,-1
	addi	a5,a5,136
	add	a4,a5,a4
	srai	a5,a2,31
	andi	a5,a5,3
	add	a5,a5,a2
	srai	a5,a5,2
	sub	a2,a5,t1
	sub	a5,a5,a0
	srai	t0,a2,31
	srai	a0,a5,31
	xor	t1,t0,a2
	xor	a5,a0,a5
	sub	a5,a5,a0
	sub	t1,t1,t0
	slli	a2,t2,2
	sub	t1,t1,a5
	addi	a5,a2,136
	addi	a2,sp,40
	add	a5,a5,a2
	lw	a2,28(sp)
	add	a4,a4,ra
	add	a5,a5,ra
	add	t1,t1,a2
	sb	a3,-60(a4)
	addi	a0,s0,4
	slli	t1,t1,24
	sb	zero,-60(a5)
	srai	t1,t1,24
	mv	a2,a0
	addi	t0,s0,20
	li	a5,0
.L177:
	addi	a4,a2,-4
.L178:
	slli	a3,a5,5
	sub	a3,a3,a5
	slli	a3,a3,2
	sub	a3,a3,a5
	slli	a3,a3,2
	lb	ra,4(a4)
	add	a3,a3,a5
	slli	a3,a3,2
	add	a5,a3,a5
	addi	a4,a4,1
	add	a5,a5,ra
	bne	a4,a2,.L178
	addi	a2,a4,4
	bne	t0,a2,.L177
	li	a4,1
	sb	a4,88(sp)
	lw	a4,8(sp)
	sw	a5,108(sp)
	sb	t2,89(sp)
	sb	a4,90(sp)
	sb	t1,91(sp)
	addi	a5,sp,88
	addi	t0,s0,16
.L180:
	lbu	t1,4(a1)
	lbu	a2,5(a1)
	lbu	a3,6(a1)
	lbu	a4,7(a1)
	sb	t1,4(a5)
	sb	a2,5(a5)
	sb	a3,6(a5)
	sb	a4,7(a5)
	mv	a1,a0
	addi	a5,a5,4
	beq	t0,a0,.L255
	addi	a0,a0,4
	j	.L180
.L268:
	lw	a5,12(sp)
	slli	a5,a5,2
	sw	a5,20(sp)
.L197:
	lw	t0,16(sp)
	mv	a1,s0
	mv	a4,s0
	addi	a5,sp,64
.L162:
	lbu	t1,4(a5)
	lbu	a0,5(a5)
	lbu	a2,6(a5)
	lbu	a3,7(a5)
	sb	t1,4(a4)
	sb	a0,5(a4)
	sb	a2,6(a4)
	sb	a3,7(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	bne	t0,a5,.L162
	lw	a5,20(sp)
	lw	t0,8(sp)
	addi	a4,sp,40
	addi	a5,a5,136
	addi	a0,t0,-1
	add	a4,a5,a4
	add	a5,a4,a0
	lb	a3,-108(a5)
	add	a2,a4,t0
	andi	t2,a0,0xff
	addi	a5,a3,-1
	srai	t1,a5,31
	srli	t1,t1,30
	add	a5,a5,t1
	andi	a5,a5,3
	sub	a5,a5,t1
	sub	t1,a5,t0
	sub	a5,a5,a0
	srai	t0,t1,31
	srai	a0,a5,31
	xor	t1,t0,t1
	xor	a5,a0,a5
	sub	a5,a5,a0
	sub	t1,t1,t0
	sub	t1,t1,a5
	lw	a5,28(sp)
	sb	a3,-60(a2)
	add	a4,a4,t2
	add	t1,t1,a5
	addi	a0,s0,4
	slli	t1,t1,24
	srai	t1,t1,24
	sb	zero,-60(a4)
	mv	a2,a0
	addi	t0,s0,20
	li	a5,0
.L163:
	addi	a4,a2,-4
.L164:
	slli	a3,a5,5
	sub	a3,a3,a5
	slli	a3,a3,2
	sub	a3,a3,a5
	slli	a3,a3,2
	lb	ra,4(a4)
	add	a3,a3,a5
	slli	a3,a3,2
	add	a5,a3,a5
	addi	a4,a4,1
	add	a5,a5,ra
	bne	a4,a2,.L164
	addi	a2,a4,4
	bne	a2,t0,.L163
	li	a4,1
	sb	a4,88(sp)
	lw	a4,12(sp)
	sw	a5,108(sp)
	sb	t2,90(sp)
	sb	a4,89(sp)
	sb	t1,91(sp)
	addi	a5,sp,88
	addi	t0,s0,16
.L166:
	lbu	t1,4(a1)
	lbu	a2,5(a1)
	lbu	a3,6(a1)
	lbu	a4,7(a1)
	sb	t1,4(a5)
	sb	a2,5(a5)
	sb	a3,6(a5)
	sb	a4,7(a5)
	mv	a1,a0
	addi	a5,a5,4
	beq	t0,a0,.L253
	addi	a0,a0,4
	j	.L166
.L253:
	lw	a1,4(s1)
	lw	a0,0(s1)
	addi	a2,sp,64
	call	_ZNK14Updatable_heapI8N_puzzleILi4EEE7pointerERKS1_.isra.0
	beq	a0,zero,.L202
	lw	a2,32(a0)
	addi	a2,a2,1
.L167:
	addi	a1,sp,88
	mv	a0,s1
	call	_ZN14Updatable_heapI8N_puzzleILi4EEE4pushERKS1_i
	j	.L161
.L266:
	sw	zero,12(s1)
	j	.L184
.L203:
	li	a2,-2147483648
	j	.L174
.L201:
	li	a2,-2147483648
	j	.L160
.L202:
	li	a2,-2147483648
	j	.L167
.L204:
	li	a2,-2147483648
	j	.L181
.L132:
	addi	s0,sp,112
	lla	a1,.LANCHOR1
	mv	a0,s0
	call	_ZN8N_puzzleILi4EEC1EPi
	lw	a4,112(sp)
	addi	t1,sp,128
	mv	a5,s0
	sw	a4,40(sp)
	lw	a4,132(sp)
	sw	t1,4(sp)
	sw	a4,60(sp)
	addi	a4,sp,40
.L136:
	lbu	a0,4(a5)
	lbu	a1,5(a5)
	lbu	a2,6(a5)
	lbu	a3,7(a5)
	sb	a0,4(a4)
	sb	a1,5(a4)
	sb	a2,6(a4)
	sb	a3,7(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	bne	a5,t1,.L136
	li	a5,10
	sw	a5,24(sp)
	j	.L137
.L130:
	addi	s0,sp,112
	lla	a1,.LANCHOR3
	mv	a0,s0
	call	_ZN8N_puzzleILi4EEC1EPi
	lw	a4,112(sp)
	addi	t1,sp,128
	mv	a5,s0
	sw	a4,40(sp)
	lw	a4,132(sp)
	sw	t1,4(sp)
	sw	a4,60(sp)
	addi	a4,sp,40
.L139:
	lbu	a0,4(a5)
	lbu	a1,5(a5)
	lbu	a2,6(a5)
	lbu	a3,7(a5)
	sb	a0,4(a4)
	sb	a1,5(a4)
	sb	a2,6(a4)
	sb	a3,7(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	bne	t1,a5,.L139
	li	a5,16384
	sw	a5,24(sp)
	j	.L137
.L265:
	lla	s0,.LC0
	li	a0,65
.L145:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L145
	lla	s0,.LC5
	li	a0,65
.L146:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L146
	lla	s0,.LC6
	li	a0,32
.L147:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L147
.L148:
	li	a0,1
	call	halt
.L267:
	lla	s0,.LC0
	li	a0,65
.L186:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L186
	lla	s0,.LC7
	li	a0,65
.L187:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L187
	lla	s0,.LC8
	li	a0,32
.L188:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L188
	j	.L148
.L262:
	lla	s0,.LC0
	li	a0,65
.L141:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L141
	lla	s0,.LC3
	li	a0,65
.L142:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L142
	lla	s0,.LC4
	li	a0,32
.L143:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L143
	j	.L148
	.size	bench_15pz_run, .-bench_15pz_run
	.section	.data._ZL8PUZZLE_H,"aw"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL8PUZZLE_H, @object
	.size	_ZL8PUZZLE_H, 64
_ZL8PUZZLE_H:
	.word	2
	.word	6
	.word	8
	.word	0
	.word	9
	.word	15
	.word	4
	.word	12
	.word	5
	.word	13
	.word	11
	.word	14
	.word	1
	.word	7
	.word	3
	.word	10
	.section	.data._ZL8PUZZLE_L,"aw"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL8PUZZLE_L, @object
	.size	_ZL8PUZZLE_L, 64
_ZL8PUZZLE_L:
	.word	0
	.word	2
	.word	3
	.word	4
	.word	9
	.word	6
	.word	7
	.word	8
	.word	5
	.word	11
	.word	10
	.word	12
	.word	1
	.word	15
	.word	13
	.word	14
	.section	.data._ZL8PUZZLE_M,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL8PUZZLE_M, @object
	.size	_ZL8PUZZLE_M, 64
_ZL8PUZZLE_M:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	12
	.word	0
	.word	14
	.word	13
	.word	11
	.word	15
	.word	10
	.word	9
	.section	.data._ZL8PUZZLE_S,"aw"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL8PUZZLE_S, @object
	.size	_ZL8PUZZLE_S, 64
_ZL8PUZZLE_S:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	0
	.word	11
	.word	13
	.word	14
	.word	15
	.word	12
	.section	.sbss._ZL3ans,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL3ans, @object
	.size	_ZL3ans, 4
_ZL3ans:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
