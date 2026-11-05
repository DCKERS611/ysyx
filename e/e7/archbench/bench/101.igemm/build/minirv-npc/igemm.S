#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"igemm.c"
	.option nopic
	.text
	.section	.text.random_init,"ax",@progbits
	.align	2
	.globl	random_init
	.hidden	random_init
	.type	random_init, @function
random_init:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	a1,24(sp)
	sw	a0,0(sp)
	sw	a2,32(sp)
	sw	a3,28(sp)
	sw	a4,4(sp)
	ble	a1,zero,.L1
	slli	a5,a3,2
	sw	a5,8(sp)
	sw	zero,20(sp)
	sw	zero,16(sp)
.L3:
	lw	a5,0(sp)
	ble	a5,zero,.L8
	lw	a5,16(sp)
	li	s1,0
	slli	a3,a5,2
	lw	a5,20(sp)
	slli	a4,a5,2
	lw	a5,32(sp)
	add	s0,a4,a5
	add	a3,a3,a5
	mv	a4,s0
	mv	s0,s1
	mv	s1,a3
	j	.L6
.L12:
	call	bench_rand
	lw	a5,8(sp)
	slli	a0,a0,1
	addi	a0,a0,-1
	lw	a4,12(sp)
	sw	a0,0(s1)
	add	s1,s1,a5
	lw	a5,0(sp)
	addi	s0,s0,1
	addi	a4,a4,4
	beq	a5,s0,.L8
.L6:
	lw	a5,4(sp)
	sw	a4,12(sp)
	beq	a5,zero,.L12
	call	bench_rand
	lw	a5,8(sp)
	lw	a4,12(sp)
	slli	a0,a0,1
	add	s1,s1,a5
	lw	a5,0(sp)
	addi	a0,a0,-1
	sw	a0,0(a4)
	addi	s0,s0,1
	addi	a4,a4,4
	bne	a5,s0,.L6
.L8:
	lw	a4,20(sp)
	lw	a3,28(sp)
	lw	a5,16(sp)
	add	a4,a4,a3
	sw	a4,20(sp)
	lw	a4,24(sp)
	addi	a5,a5,1
	sw	a5,16(sp)
	bne	a4,a5,.L3
.L1:
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
	.size	random_init, .-random_init
	.section	.rodata.matmul_row.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Argument Error : One of the input arguments to matmul() was NULL\n"
	.globl	__mulsi3
	.section	.text.matmul_row,"ax",@progbits
	.align	2
	.globl	matmul_row
	.hidden	matmul_row
	.type	matmul_row, @function
matmul_row:
	addi	sp,sp,-84
	lw	t1,88(sp)
	lw	t0,92(sp)
	mv	t2,a3
	sw	a3,64(sp)
	sw	ra,80(sp)
	sw	s0,76(sp)
	sw	s1,72(sp)
	sw	t1,68(sp)
	sw	t0,56(sp)
	sw	a0,48(sp)
	sw	a1,20(sp)
	sw	a2,24(sp)
	sw	a4,52(sp)
	sw	a5,32(sp)
	lw	a3,84(sp)
	beq	t2,zero,.L14
	beq	a5,zero,.L14
	beq	t1,zero,.L14
	ble	a0,zero,.L13
	slli	a5,a2,2
	add	a5,t2,a5
	slli	a4,a4,2
	sw	a5,8(sp)
	slli	a5,a3,2
	sw	a4,60(sp)
	sw	a5,12(sp)
	sw	zero,40(sp)
	sw	zero,36(sp)
	sw	zero,44(sp)
.L16:
	lw	a5,20(sp)
	ble	a5,zero,.L18
	lw	a5,40(sp)
	lw	a4,68(sp)
	sw	zero,16(sp)
	slli	s0,a5,2
	add	a4,a4,s0
	lw	a5,36(sp)
	sw	a4,4(sp)
	lw	a4,64(sp)
	slli	a5,a5,2
	add	a5,a4,a5
	sw	a5,28(sp)
.L21:
	lw	a5,24(sp)
	ble	a5,zero,.L20
	lw	a5,4(sp)
	lw	s1,28(sp)
	lw	a3,0(a5)
	lw	a5,16(sp)
	slli	a4,a5,2
	lw	a5,32(sp)
	add	s0,a5,a4
	mv	a4,s0
	mv	s0,a3
.L17:
	lw	a5,12(sp)
	lw	a1,0(a4)
	lw	a0,0(s1)
	add	a4,a4,a5
	sw	a4,0(sp)
	call	__mulsi3
	lw	a5,4(sp)
	add	s0,s0,a0
	addi	s1,s1,4
	sw	s0,0(a5)
	lw	a5,8(sp)
	lw	a4,0(sp)
	bne	s1,a5,.L17
.L20:
	lw	a4,4(sp)
	lw	a5,16(sp)
	addi	a4,a4,4
	sw	a4,4(sp)
	lw	a4,20(sp)
	addi	a5,a5,1
	sw	a5,16(sp)
	bne	a4,a5,.L21
.L18:
	lw	a4,36(sp)
	lw	a3,52(sp)
	lw	a5,44(sp)
	add	a4,a4,a3
	sw	a4,36(sp)
	lw	a3,60(sp)
	lw	a4,8(sp)
	addi	a5,a5,1
	sw	a5,44(sp)
	add	a4,a4,a3
	sw	a4,8(sp)
	lw	a3,56(sp)
	lw	a4,40(sp)
	add	a4,a4,a3
	sw	a4,40(sp)
	lw	a4,48(sp)
	bne	a4,a5,.L16
.L13:
	lw	ra,80(sp)
	lw	s0,76(sp)
	lw	s1,72(sp)
	addi	sp,sp,84
	jr	ra
.L14:
	lw	s0,76(sp)
	lw	ra,80(sp)
	lw	s1,72(sp)
	lla	a0,.LC0
	addi	sp,sp,84
	tail	printf
	.size	matmul_row, .-matmul_row
	.section	.rodata.bench_init.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"Out of Memory!\n"
	.section	.text.bench_init,"ax",@progbits
	.align	2
	.globl	bench_init
	.hidden	bench_init
	.type	bench_init, @function
bench_init:
	slli	a4,a0,4
	lla	a5,.LANCHOR1
	add	a5,a5,a4
	lw	a1,0(a5)
	addi	sp,sp,-28
	sw	ra,24(sp)
	sw	s0,20(sp)
	sw	s1,16(sp)
	lla	s0,.LANCHOR2
	sw	a1,0(s0)
	mv	a0,a1
	la a4, .LANCHOR0; sw a5, 0(a4);
	call	__mulsi3
	slli	a0,a0,2
	call	malloc
	lw	a5,0(s0)
	lla	s1,.LANCHOR3
	sw	a0,0(s1)
	mv	a1,a5
	mv	a0,a5
	sw	a5,0(sp)
	call	__mulsi3
	slli	a0,a0,2
	call	malloc
	lw	a5,0(s0)
	lla	s0,.LANCHOR4
	sw	a0,0(s0)
	mv	a1,a5
	mv	a0,a5
	sw	a5,0(sp)
	call	__mulsi3
	slli	a1,a0,2
	li	a0,1
	call	calloc
	lw	a5,0(s1)
	la a4, .LANCHOR5; sw a0, 0(a4);
	beq	a5,zero,.L34
	lw	a5,0(s0)
	beq	a5,zero,.L34
	beq	a0,zero,.L34
.L35:
	li	a0,1
	call	bench_srand
	lla	a5,.LANCHOR2
	lw	a5,0(a5)
	lw	a4,0(s1)
	sw	a5,0(sp)
	sw	a4,12(sp)
	ble	a5,zero,.L33
	slli	a5,a5,2
	sw	a5,4(sp)
	sw	zero,8(sp)
.L38:
	lw	a5,8(sp)
	lw	a4,12(sp)
	li	s1,0
	slli	a5,a5,2
	add	s0,a4,a5
.L37:
	call	bench_rand
	lw	a5,4(sp)
	slli	a0,a0,1
	addi	a0,a0,-1
	sw	a0,0(s0)
	add	s0,s0,a5
	lw	a5,0(sp)
	addi	s1,s1,1
	bne	a5,s1,.L37
	lw	a5,8(sp)
	lw	a4,0(sp)
	addi	a5,a5,1
	sw	a5,8(sp)
	bne	a4,a5,.L38
	lla	a5,.LANCHOR2
	lla	a4,.LANCHOR4
	lw	a5,0(a5)
	lw	a4,0(a4)
	sw	a5,0(sp)
	sw	a4,12(sp)
	ble	a5,zero,.L33
	slli	a5,a5,2
	sw	a5,4(sp)
	sw	zero,8(sp)
.L40:
	lw	a5,8(sp)
	lw	a4,12(sp)
	li	s1,0
	slli	a5,a5,2
	add	s0,a4,a5
.L39:
	call	bench_rand
	lw	a5,4(sp)
	slli	a0,a0,1
	addi	a0,a0,-1
	sw	a0,0(s0)
	add	s0,s0,a5
	lw	a5,0(sp)
	addi	s1,s1,1
	bne	a5,s1,.L39
	lw	a5,8(sp)
	lw	a4,0(sp)
	addi	a5,a5,1
	sw	a5,8(sp)
	bne	a4,a5,.L40
.L33:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L34:
	lla	a0,.LC1
	call	printf
	li	a0,1
	call	bench_exit
	j	.L35
	.size	bench_init, .-bench_init
	.section	.text.bench_run,"ax",@progbits
	.align	2
	.globl	bench_run
	.hidden	bench_run
	.type	bench_run, @function
bench_run:
	addi	sp,sp,-24
	sw	ra,20(sp)
	sw	s0,16(sp)
	sw	s1,12(sp)
	call	bench_uptime
	la a4, .LANCHOR2; lw a4, 0(a4);
	la t1, .LANCHOR5; lw t1, 0(t1);
	la a5, .LANCHOR4; lw a5, 0(a5);
	mv	a2,a4
	sw	a4,8(sp)
	sw	a4,0(sp)
	mv	s0,a0
	mv	s1,a1
	mv	a0,a4
	mv	a1,a4
	la a3, .LANCHOR3; lw a3, 0(a3);
	sw	t1,4(sp)
	call	matmul_row
	call	bench_uptime
	sub	a5,a0,s0
	sgtu	a0,a5,a0
	sub	a1,a1,s1
	sub	a1,a1,a0
	or	a4,a5,a1
	beq	a4,zero,.L53
	lla	a4,.LANCHOR6
	sw	a5,0(a4)
	sw	a1,4(a4)
.L55:
	lw	ra,20(sp)
	lw	s0,16(sp)
	la a5, .LANCHOR0; lw a5, 0(a5);
	lw	a0,8(a5)
	lw	a1,12(a5)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L53:
	lla	a5,.LANCHOR6
	li	a2,1
	li	a3,0
	sw	a2,0(a5)
	sw	a3,4(a5)
	j	.L55
	.size	bench_run, .-bench_run
	.globl	__muldi3
	.globl	__udivdi3
	.section	.rodata.bench_validate.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"Dot product with row major order took %lld us, KOPS: %lld\n"
	.section	.text.bench_validate,"ax",@progbits
	.align	2
	.globl	bench_validate
	.hidden	bench_validate
	.type	bench_validate, @function
bench_validate:
	lla	t1,.LANCHOR2
	lw	a2,0(t1)
	addi	sp,sp,-20
	lla	a5,.LANCHOR6
	srai	a3,a2,31
	mv	a0,a2
	mv	a1,a3
	sw	ra,16(sp)
	sw	s0,12(sp)
	sw	s1,8(sp)
	lw	s0,0(a5)
	lw	s1,4(a5)
	sw	a2,4(sp)
	sw	a3,0(sp)
	call	__muldi3
	lw	a2,4(sp)
	lw	a3,0(sp)
	call	__muldi3
	slli	a4,a0,5
	srli	a2,a0,27
	slli	a5,a1,5
	sub	a3,a4,a0
	or	a5,a2,a5
	sgtu	a4,a3,a4
	sub	a5,a5,a1
	sub	a5,a5,a4
	slli	a5,a5,2
	slli	a4,a3,2
	srli	a3,a3,30
	add	a0,a4,a0
	or	a5,a3,a5
	add	a5,a5,a1
	sltu	a4,a0,a4
	add	a4,a4,a5
	slli	a4,a4,4
	srli	a1,a0,28
	mv	a2,s0
	mv	a3,s1
	or	a1,a1,a4
	slli	a0,a0,4
	call	__udivdi3
	mv	a3,a0
	mv	a4,a1
	mv	a2,s1
	mv	a1,s0
	lla	a0,.LC2
	call	printf
	lla	t1,.LANCHOR2
	lw	a1,0(t1)
	lla	s1,.LANCHOR5
	lw	s0,0(s1)
	mv	a0,a1
	call	__mulsi3
	slli	a1,a0,2
	add	a1,s0,a1
	mv	a0,s0
	call	bench_checksum
	mv	s0,a0
	la a0, .LANCHOR3; lw a0, 0(a0);
	call	free
	la a0, .LANCHOR4; lw a0, 0(a0);
	call	free
	lw	a0,0(s1)
	call	free
	la a5, .LANCHOR0; lw a5, 0(a5);
	lw	a5,4(a5)
	lw	ra,16(sp)
	lw	s1,8(sp)
	sub	a0,a5,s0
	lw	s0,12(sp)
	snez	a0,a0
	addi	sp,sp,20
	jr	ra
	.size	bench_validate, .-bench_validate
	.section	.rodata.settings,"a"
	.align	3
	.set	.LANCHOR1,. + 0
	.type	settings, @object
	.size	settings, 64
settings:
	.word	2
	.word	-1135635867
	.word	0
	.word	0
	.word	40
	.word	-1826489502
	.word	22
	.word	0
	.word	1000
	.word	-50735957
	.word	466056
	.word	0
	.word	2500
	.word	1045616897
	.word	7285748
	.word	0
	.section	.sbss.A,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	A, @object
	.size	A, 4
A:
	.zero	4
	.section	.sbss.B,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	B, @object
	.size	B, 4
B:
	.zero	4
	.section	.sbss.C,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	C, @object
	.size	C, 4
C:
	.zero	4
	.section	.sbss.duration_row,"aw",@nobits
	.align	3
	.set	.LANCHOR6,. + 0
	.type	duration_row, @object
	.size	duration_row, 8
duration_row:
	.zero	8
	.section	.sbss.ps,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	ps, @object
	.size	ps, 4
ps:
	.zero	4
	.section	.sdata.N,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	N, @object
	.size	N, 4
N:
	.word	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
