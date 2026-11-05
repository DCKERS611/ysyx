#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"dinic.c"
	.option nopic
	.text
	.section	.text.DFS,"ax",@progbits
	.align	2
	.type	DFS, @function
DFS:
	lw	a5,12(a0)
	addi	sp,sp,-36
	sw	ra,32(sp)
	sw	s0,28(sp)
	sw	s1,24(sp)
	mv	a3,a2
	beq	a5,a1,.L6
	sw	zero,0(sp)
	beq	a2,zero,.L1
	lw	a5,32(a0)
	slli	a1,a1,2
	li	a2,-1
	add	a5,a5,a1
	lw	s0,0(a5)
	mv	a4,a0
	beq	s0,a2,.L1
	lw	t0,28(a0)
	lw	t1,16(a0)
	li	t2,-1
	add	a5,t0,a1
	j	.L5
.L3:
	lw	a2,24(a4)
	slli	s0,s0,2
	add	s0,a2,s0
	lw	s0,0(s0)
	beq	s0,t2,.L1
.L5:
	slli	s1,s0,4
	add	s1,t1,s1
	lw	a1,4(s1)
	lw	a2,0(a5)
	slli	a0,a1,2
	add	a0,t0,a0
	lw	a0,0(a0)
	addi	a2,a2,1
	bne	a2,a0,.L3
	lw	a2,8(s1)
	lw	ra,12(s1)
	mv	a0,a4
	sub	a2,a2,ra
	ble	a2,a3,.L4
	mv	a2,a3
.L4:
	sw	a3,20(sp)
	sw	a4,16(sp)
	sw	a5,12(sp)
	sw	t0,8(sp)
	sw	t1,4(sp)
	call	DFS
	lw	t1,4(sp)
	xori	a2,s0,1
	slli	a2,a2,4
	lw	t0,8(sp)
	lw	a5,12(sp)
	lw	a4,16(sp)
	lw	a3,20(sp)
	add	a2,t1,a2
	li	t2,-1
	ble	a0,zero,.L3
	lw	a1,12(s1)
	sub	a3,a3,a0
	sw	a1,4(sp)
	lw	a1,0(sp)
	add	a1,a1,a0
	sw	a1,0(sp)
	lw	a1,4(sp)
	add	a1,a1,a0
	sw	a1,12(s1)
	lw	a1,12(a2)
	sub	a1,a1,a0
	sw	a1,12(a2)
	bne	a3,zero,.L3
.L1:
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	a0,0(sp)
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
.L6:
	lw	ra,32(sp)
	lw	s0,28(sp)
	sw	a2,0(sp)
	lw	a0,0(sp)
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
	.size	DFS, .-DFS
	.section	.text.AddEdge.part.0,"ax",@progbits
	.align	2
	.type	AddEdge.part.0, @function
AddEdge.part.0:
	lw	a4,4(a0)
	lw	a5,16(a0)
	lw	t0,20(a0)
	slli	t1,a4,4
	add	t1,a5,t1
	slli	t2,a1,2
	sw	a1,0(t1)
	sw	a3,8(t1)
	sw	a2,4(t1)
	sw	zero,12(t1)
	lw	a3,24(a0)
	add	t1,t0,t2
	lw	t2,0(t1)
	slli	a4,a4,2
	add	a4,a3,a4
	sw	t2,0(a4)
	lw	t2,4(a0)
	slli	a4,a2,2
	add	a4,t0,a4
	addi	t0,t2,1
	sw	t0,4(a0)
	sw	t2,0(t1)
	lw	t1,4(a0)
	slli	t0,t1,4
	add	a5,a5,t0
	sw	a2,0(a5)
	sw	a1,4(a5)
	sw	zero,8(a5)
	sw	zero,12(a5)
	lw	a5,0(a4)
	slli	t1,t1,2
	add	a3,a3,t1
	sw	a5,0(a3)
	lw	a5,4(a0)
	addi	a3,a5,1
	sw	a3,4(a0)
	sw	a5,0(a4)
	ret
	.size	AddEdge.part.0, .-AddEdge.part.0
	.globl	__mulsi3
	.globl	__umodsi3
	.section	.text.bench_init,"ax",@progbits
	.align	2
	.globl	bench_init
	.hidden	bench_init
	.type	bench_init, @function
bench_init:
	slli	a4,a0,4
	lla	a5,.LANCHOR1
	add	a5,a5,a4
	lw	a4,0(a5)
	addi	sp,sp,-28
	sw	ra,24(sp)
	sw	s0,20(sp)
	sw	s1,16(sp)
	lla	s0,.LANCHOR2
	li	a0,1
	sw	a4,0(s0)
	la a3, .LANCHOR0; sw a5, 0(a3);
	call	bench_srand
	lw	a5,0(s0)
	li	a0,44
	slli	a5,a5,1
	sw	a5,8(sp)
	call	malloc
	lw	a4,0(s0)
	lla	a3,.LANCHOR3
	mv	s0,a0
	addi	s1,a4,1
	slli	a5,s1,1
	addi	a1,a5,-2
	srai	a1,a1,1
	sw	a0,0(a3)
	mv	a0,a1
	sw	a5,4(sp)
	sw	a1,0(sp)
	call	__mulsi3
	lw	a1,0(sp)
	slli	s1,s1,3
	slli	a1,a1,1
	add	a1,a0,a1
	slli	a0,a1,5
	sw	a1,0(sp)
	call	malloc
	sw	a0,16(s0)
	mv	a0,s1
	call	malloc
	lw	a1,0(sp)
	sw	a0,20(s0)
	slli	a0,a1,3
	call	malloc
	lw	a5,4(sp)
	sw	a0,24(s0)
	mv	a0,a5
	sw	a5,0(sp)
	call	malloc
	sw	a0,40(s0)
	mv	a0,s1
	call	malloc
	sw	a0,28(s0)
	mv	a0,s1
	call	malloc
	sw	a0,32(s0)
	mv	a0,s1
	call	malloc
	lw	a4,8(sp)
	lw	a5,0(sp)
	sw	a0,36(s0)
	addi	a4,a4,1
	sw	a5,0(s0)
	sw	a4,12(sp)
	ble	a5,zero,.L22
	lw	a5,20(s0)
	li	a3,-1
	add	a4,a5,s1
.L21:
	sw	a3,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L21
.L22:
	lla	a5,.LANCHOR2
	lw	s1,0(a5)
	sw	zero,4(s0)
	sw	zero,4(sp)
	ble	s1,zero,.L17
.L19:
	li	s0,0
.L24:
	lla	a5,.LANCHOR3
	lw	a4,0(a5)
	sw	a4,0(sp)
	call	bench_rand
	li	a1,10
	call	__umodsi3
	lw	a4,0(sp)
	mv	a3,a0
	add	a2,s1,s0
	lw	a1,4(sp)
	addi	s0,s0,1
	mv	a0,a4
	beq	a3,zero,.L23
	call	AddEdge.part.0
.L23:
	lla	a5,.LANCHOR2
	lw	s1,0(a5)
	bgt	s1,s0,.L24
	lw	a5,4(sp)
	addi	a5,a5,1
	sw	a5,4(sp)
	bgt	s1,a5,.L19
	ble	s1,zero,.L17
	li	s0,0
.L28:
	lla	a5,.LANCHOR3
	lw	s1,0(a5)
	call	bench_rand
	li	a1,1000
	call	__umodsi3
	mv	a3,a0
	lw	a1,8(sp)
	mv	a2,s0
	mv	a0,s1
	beq	a3,zero,.L26
	call	AddEdge.part.0
.L26:
	lla	a5,.LANCHOR3
	lw	s1,0(a5)
	lla	a5,.LANCHOR2
	lw	a4,0(a5)
	sw	a4,0(sp)
	call	bench_rand
	li	a1,1000
	call	__umodsi3
	lw	a4,0(sp)
	mv	a3,a0
	lw	a2,12(sp)
	add	a1,a4,s0
	mv	a0,s1
	addi	s0,s0,1
	beq	a3,zero,.L27
	call	AddEdge.part.0
.L27:
	lla	a5,.LANCHOR2
	lw	a5,0(a5)
	bgt	a5,s0,.L28
.L17:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
	.size	bench_init, .-bench_init
	.section	.text.bench_run,"ax",@progbits
	.align	2
	.globl	bench_run
	.hidden	bench_run
	.type	bench_run, @function
bench_run:
	addi	sp,sp,-52
	sw	s0,44(sp)
	la s0, .LANCHOR3; lw s0, 0(s0);
	lw	a3,40(s0)
	la a5, .LANCHOR2; lw a5, 0(a5);
	slli	a4,a5,1
	sw	a3,12(sp)
	lw	a3,36(s0)
	sw	ra,48(sp)
	sw	s1,40(sp)
	sw	a3,28(sp)
	lw	a3,28(s0)
	addi	a5,a4,1
	sw	a4,36(sp)
	sw	a3,8(sp)
	lw	a3,20(s0)
	sw	a4,8(s0)
	sw	a5,12(s0)
	sw	a3,20(sp)
	mv	a2,a4
	sw	zero,32(sp)
.L45:
	lw	a4,12(sp)
	lw	a3,0(s0)
	mv	a5,a4
	add	a4,a3,a4
	ble	a3,zero,.L50
.L49:
	sb	zero,0(a5)
	addi	a5,a5,1
	bne	a4,a5,.L49
.L50:
	lw	a1,28(sp)
	lw	a4,8(sp)
	li	t0,1
	sw	a2,0(a1)
	lw	a5,8(s0)
	li	t1,0
	li	s1,-1
	slli	a5,a5,2
	add	a5,a4,a5
	sw	zero,0(a5)
	lw	a5,8(s0)
	lw	a4,12(sp)
	mv	a0,t0
	add	a5,a4,a5
	li	a4,1
	sb	a4,0(a5)
.L48:
	lw	a4,0(a1)
	lw	a5,20(sp)
	addi	t1,t1,1
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a5,0(a5)
	beq	a5,s1,.L51
	lw	a3,24(s0)
	lw	t0,16(s0)
	sw	a1,4(sp)
	sw	a3,0(sp)
	lw	a3,8(sp)
	add	a4,a3,a4
	sw	a4,16(sp)
.L53:
	lw	a3,0(sp)
	slli	a4,a5,4
	add	a4,t0,a4
	slli	a5,a5,2
	lw	a2,4(a4)
	add	a5,a3,a5
	lw	a3,12(sp)
	add	a3,a3,a2
	lbu	t2,0(a3)
	bne	t2,zero,.L52
	lw	t2,8(sp)
	slli	a2,a2,2
	lw	a1,8(a4)
	add	a2,t2,a2
	lw	t2,28(sp)
	sw	a2,24(sp)
	slli	a2,a0,2
	add	a2,t2,a2
	lw	t2,12(a4)
	ble	a1,t2,.L52
	lw	t2,16(sp)
	addi	a0,a0,1
	lw	a1,0(t2)
	li	t2,1
	sb	t2,0(a3)
	lw	a3,24(sp)
	addi	t2,a1,1
	sw	t2,0(a3)
	lw	a4,4(a4)
	sw	a4,0(a2)
.L52:
	lw	a5,0(a5)
	bne	a5,s1,.L53
	lw	a1,4(sp)
.L51:
	addi	a1,a1,4
	bne	t1,a0,.L48
	lw	a5,12(s0)
	lw	a4,12(sp)
	add	a5,a4,a5
	lbu	a5,0(a5)
	beq	a5,zero,.L54
	lw	a5,0(s0)
	ble	a5,zero,.L56
	lw	a3,32(s0)
	lw	a4,20(sp)
	li	a5,0
.L46:
	lw	a2,0(a4)
	addi	a5,a5,1
	addi	a4,a4,4
	sw	a2,0(a3)
	lw	a2,0(s0)
	addi	a3,a3,4
	blt	a5,a2,.L46
.L56:
	lw	a1,36(sp)
	li	a2,4145152
	addi	a2,a2,-193
	mv	a0,s0
	call	DFS
	lw	a5,32(sp)
	lw	a2,8(s0)
	add	a5,a5,a0
	sw	a5,32(sp)
	j	.L45
.L54:
	lw	a4,32(sp)
	lw	ra,48(sp)
	lw	s0,44(sp)
	la a5, .LANCHOR4; sw a4, 0(a5);
	la a5, .LANCHOR0; lw a5, 0(a5);
	lw	a0,8(a5)
	lw	a1,12(a5)
	lw	s1,40(sp)
	addi	sp,sp,52
	jr	ra
	.size	bench_run, .-bench_run
	.section	.rodata.bench_validate.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"ans = %d\n"
	.section	.text.bench_validate,"ax",@progbits
	.align	2
	.globl	bench_validate
	.hidden	bench_validate
	.type	bench_validate, @function
bench_validate:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR4
	lw	a1,0(s1)
	lla	a0,.LC0
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	printf
	lla	s0,.LANCHOR3
	lw	a5,0(s0)
	lw	a0,16(a5)
	call	free
	lw	a5,0(s0)
	lw	a0,20(a5)
	call	free
	lw	a5,0(s0)
	lw	a0,24(a5)
	call	free
	lw	a5,0(s0)
	lw	a0,40(a5)
	call	free
	lw	a5,0(s0)
	lw	a0,28(a5)
	call	free
	lw	a5,0(s0)
	lw	a0,32(a5)
	call	free
	lw	a5,0(s0)
	lw	a0,36(a5)
	call	free
	lw	a0,0(s0)
	call	free
	la a5, .LANCHOR0; lw a5, 0(a5);
	lw	a0,4(a5)
	lw	a5,0(s1)
	lw	ra,8(sp)
	lw	s0,4(sp)
	sub	a0,a0,a5
	lw	s1,0(sp)
	snez	a0,a0
	addi	sp,sp,12
	jr	ra
	.size	bench_validate, .-bench_validate
	.hidden	INF
	.globl	INF
	.section	.rodata.settings,"a"
	.align	3
	.set	.LANCHOR1,. + 0
	.type	settings, @object
	.size	settings, 64
settings:
	.word	10
	.word	402
	.word	0
	.word	0
	.word	60
	.word	12911
	.word	110
	.word	0
	.word	209
	.word	99568
	.word	648311
	.word	0
	.word	219
	.word	106697
	.word	38544532
	.word	0
	.section	.sbss.G,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	G, @object
	.size	G, 4
G:
	.zero	4
	.section	.sbss.N,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	N, @object
	.size	N, 4
N:
	.zero	4
	.section	.sbss.ans,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	ans, @object
	.size	ans, 4
ans:
	.zero	4
	.section	.sbss.ps,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	ps, @object
	.size	ps, 4
ps:
	.zero	4
	.section	.srodata.INF,"a"
	.align	2
	.type	INF, @object
	.size	INF, 4
INF:
	.word	4144959
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
