#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"main.c"
	.option nopic
	.text
	.section	.rodata.bench_init.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `fp != ((void *)0)' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/104.malloc/main.c:44  \n"
	.align	2
.LC3:
	.string	"Assertion `ret == 1' failed"
	.align	2
.LC4:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/104.malloc/main.c:57  \n"
	.align	2
.LC5:
	.string	"rb"
	.align	2
.LC6:
	.string	"allocated %d addresses\n"
	.align	2
.LC7:
	.string	"%d operations in total\n"
	.section	.text.bench_init,"ax",@progbits
	.align	2
	.globl	bench_init
	.hidden	bench_init
	.type	bench_init, @function
bench_init:
	slli	a0,a0,4
	lla	a5,.LANCHOR1
	add	a5,a5,a0
	lw	a0,0(a5)
	addi	sp,sp,-20
	lla	a1,.LC5
	sw	ra,16(sp)
	sw	s0,12(sp)
	sw	s1,8(sp)
	la a4, .LANCHOR0; sw a5, 0(a4);
	la a5, .LANCHOR2; sw zero, 0(a5);
	call	fopen
	beq	a0,zero,.L19
	mv	s1,a0
	mv	a3,a0
	li	a2,1
	li	a1,4
	addi	a0,sp,4
	lla	s0,.LANCHOR3
	sw	zero,4(sp)
	call	fread
	li	a2,1
	mv	a3,s1
	li	a1,4
	mv	a0,s0
	call	fread
	lw	a0,4(sp)
	slli	a0,a0,2
	call	my_malloc
	lw	a1,4(sp)
	mv	a5,a0
	lla	a0,.LC6
	la a4, .LANCHOR4; sw a5, 0(a4);
	call	printf
	lw	a4,0(s0)
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,2
	mv	a0,a5
	sw	a5,0(sp)
	call	my_malloc
	lw	a1,0(s0)
	mv	a4,a0
	lla	a5,.LANCHOR5
	lla	a0,.LC7
	mv	s0,a5
	sw	a4,0(a5)
	call	printf
	lw	a5,0(sp)
	lw	a0,0(s0)
	mv	a3,s1
	mv	a1,a5
	li	a2,1
	call	fread
	li	a5,1
	bne	a0,a5,.L20
	mv	a0,s1
	call	fclose
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L19:
	lla	s0,.LC0
	li	a0,65
.L3:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L3
	lla	s0,.LC1
	li	a0,65
.L4:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L4
	lla	s0,.LC2
	li	a0,32
.L5:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L5
.L10:
	li	a0,1
	call	halt
.L20:
	lla	s0,.LC0
	li	a0,65
.L7:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L7
	lla	s0,.LC3
	li	a0,65
.L8:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L8
	lla	s0,.LC4
	li	a0,32
.L9:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L9
	j	.L10
	.size	bench_init, .-bench_init
	.section	.rodata.bench_run.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	"already handle %d/%d operations\n"
	.section	.text.bench_run,"ax",@progbits
	.align	2
	.globl	bench_run
	.hidden	bench_run
	.type	bench_run, @function
bench_run:
	lla	a5,.LANCHOR3
	lw	a5,0(a5)
	ble	a5,zero,.L39
	addi	sp,sp,-24
	sw	s1,12(sp)
	sw	ra,20(sp)
	sw	s0,16(sp)
	sw	zero,0(sp)
	li	s1,0
	j	.L22
.L44:
	lbu	a2,1(s0)
	lbu	t0,2(s0)
	lbu	t1,5(s0)
	lbu	a3,3(s0)
	lbu	a0,6(s0)
	lbu	t2,4(s0)
	srli	ra,a5,2
	slli	a5,a2,6
	lbu	a1,7(s0)
	or	a5,a5,ra
	lla	a4,.LANCHOR4
	slli	t0,t0,14
	lw	a2,0(a4)
	or	t0,t0,a5
	slli	t1,t1,8
	slli	a5,a3,22
	or	t1,t1,t2
	slli	a3,a0,16
	or	a5,a5,t0
	or	a3,a3,t1
	slli	a0,a1,24
	slli	a5,a5,2
	add	a2,a2,a5
	or	a0,a0,a3
	sw	a2,4(sp)
	call	my_malloc
	lbu	a1,0(s0)
	lbu	t1,1(s0)
	lbu	a3,2(s0)
	lbu	a5,3(s0)
	srli	a1,a1,2
	slli	t1,t1,6
	or	t1,t1,a1
	slli	a3,a3,14
	lla	a4,.LANCHOR4
	lw	a2,4(sp)
	or	a3,a3,t1
	lw	a1,0(a4)
	slli	a5,a5,22
	or	a5,a5,a3
	slli	a5,a5,2
	add	a1,a1,a5
	sw	a0,0(a2)
	lla	a5,.LANCHOR2
	lw	a2,0(a1)
	lw	a3,0(a5)
	li	a1,1
	andi	a5,s1,255
	sb	a1,0(a2)
	xor	a5,a5,a3
.L26:
	addi	s1,s1,1
	lla	a4,.LANCHOR2
	sw	a5,0(a4)
	slli	a5,s1,16
	srli	a5,a5,16
	beq	a5,zero,.L42
.L31:
	lw	a4,0(sp)
	lla	a5,.LANCHOR3
	lw	a5,0(a5)
	addi	a4,a4,12
	sw	a4,0(sp)
	ble	a5,s1,.L43
.L22:
	lla	a5,.LANCHOR5
	lw	s0,0(a5)
	lw	a5,0(sp)
	li	a2,2
	add	s0,s0,a5
	lbu	a5,0(s0)
	andi	a3,a5,3
	beq	a3,a2,.L23
	li	a2,3
	beq	a3,a2,.L24
	beq	a3,zero,.L44
	lbu	a4,10(s0)
	lbu	t0,1(s0)
	lbu	a0,5(s0)
	lbu	a1,9(s0)
	lbu	ra,4(s0)
	lbu	a2,6(s0)
	lbu	t2,8(s0)
	lbu	t1,2(s0)
	sw	a4,8(sp)
	lbu	a4,7(s0)
	srli	a5,a5,2
	slli	t0,t0,6
	or	t0,t0,a5
	lbu	a3,3(s0)
	slli	t1,t1,14
	slli	a0,a0,8
	sw	a4,4(sp)
	or	t1,t1,t0
	or	a0,a0,ra
	lw	t0,8(sp)
	slli	a2,a2,16
	lbu	a4,11(s0)
	or	a2,a2,a0
	lla	a5,.LANCHOR4
	lw	a0,4(sp)
	lw	a5,0(a5)
	slli	a1,a1,8
	slli	a3,a3,22
	or	a1,a1,t2
	or	a3,a3,t1
	slli	t0,t0,16
	slli	t1,a0,24
	or	t0,t0,a1
	slli	a0,a4,24
	slli	a3,a3,2
	or	a1,t1,a2
	add	a3,a5,a3
	or	a0,a0,t0
	sw	a3,4(sp)
	call	my_calloc
	lbu	a1,0(s0)
	lbu	t1,1(s0)
	lbu	a2,2(s0)
	lbu	a5,3(s0)
	srli	a1,a1,2
	slli	t1,t1,6
	or	t1,t1,a1
	lla	a4,.LANCHOR4
	slli	a2,a2,14
	lw	a1,0(a4)
	or	a2,a2,t1
	slli	a5,a5,22
	lw	a3,4(sp)
	or	a5,a5,a2
	slli	a5,a5,2
	add	a1,a1,a5
	lla	a5,.LANCHOR2
	lw	a2,0(a5)
	sw	a0,0(a3)
	li	a3,65536
	slli	a5,s1,8
	addi	a3,a3,-1
	and	a5,a5,a3
	lw	a1,0(a1)
	xor	a5,a5,a2
	addi	s1,s1,1
	lla	a4,.LANCHOR2
	li	a3,1
	sw	a5,0(a4)
	slli	a5,s1,16
	sb	a3,0(a1)
	srli	a5,a5,16
	bne	a5,zero,.L31
.L42:
	lla	a5,.LANCHOR3
	lw	a2,0(a5)
	mv	a1,s1
	lla	a0,.LC8
	call	printf
	lw	a4,0(sp)
	lla	a5,.LANCHOR3
	lw	a5,0(a5)
	addi	a4,a4,12
	sw	a4,0(sp)
	bgt	a5,s1,.L22
.L43:
	lw	ra,20(sp)
	lw	s0,16(sp)
	la a5, .LANCHOR0; lw a5, 0(a5);
	lw	a0,8(a5)
	lw	a1,12(a5)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L24:
	lbu	a1,1(s0)
	lbu	a2,2(s0)
	lbu	a3,3(s0)
	srli	a5,a5,2
	slli	a1,a1,6
	or	a5,a1,a5
	slli	a2,a2,14
	or	a2,a2,a5
	slli	a5,a3,22
	or	a5,a5,a2
	slli	a5,a5,2
	srai	a5,a5,2
	li	a3,-1
	li	a0,0
	beq	a5,a3,.L30
	lla	a4,.LANCHOR4
	lw	a3,0(a4)
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a0,0(a5)
.L30:
	call	my_free
	lla	a5,.LANCHOR2
	lw	a3,0(a5)
	slli	a5,s1,24
	xor	a5,a5,a3
	j	.L26
.L23:
	lbu	a3,1(s0)
	lbu	t0,2(s0)
	lbu	a2,3(s0)
	srli	t2,a5,2
	lbu	a0,9(s0)
	slli	a5,a3,6
	lbu	t1,8(s0)
	or	a5,a5,t2
	lbu	a1,10(s0)
	slli	t0,t0,14
	or	t0,t0,a5
	lbu	a3,11(s0)
	slli	a5,a2,22
	or	a5,a5,t0
	slli	a2,a0,8
	or	a2,a2,t1
	slli	a5,a5,2
	slli	a1,a1,16
	or	a1,a1,a2
	slli	a3,a3,24
	lla	a4,.LANCHOR4
	srai	a5,a5,2
	li	t1,-1
	lw	a2,0(a4)
	or	a3,a3,a1
	beq	a5,t1,.L45
	li	a0,0
	beq	a3,t1,.L29
	slli	a3,a3,2
	add	a3,a2,a3
	lw	a0,0(a3)
.L29:
	lbu	t1,5(s0)
	lbu	t0,4(s0)
	lbu	a3,6(s0)
	lbu	a1,7(s0)
	slli	t1,t1,8
	or	t1,t1,t0
	slli	a3,a3,16
	or	a3,a3,t1
	slli	a1,a1,24
	slli	a5,a5,2
	add	a5,a2,a5
	or	a1,a1,a3
	sw	a5,4(sp)
	call	my_realloc
	lbu	a1,0(s0)
	lbu	t1,1(s0)
	lbu	a2,2(s0)
	lbu	a3,3(s0)
	srli	a1,a1,2
	slli	t1,t1,6
	or	t1,t1,a1
	lla	a5,.LANCHOR4
	slli	a2,a2,14
	lw	a1,0(a5)
	or	a2,a2,t1
	lw	a5,4(sp)
	slli	a3,a3,22
	or	a3,a3,a2
	slli	a3,a3,2
	sw	a0,0(a5)
	add	a1,a1,a3
	lw	a5,0(a1)
	li	a3,1
	sb	a3,0(a5)
.L28:
	lla	a5,.LANCHOR2
	lw	a3,0(a5)
	li	a2,16711680
	slli	a5,s1,16
	and	a5,a5,a2
	xor	a5,a5,a3
	j	.L26
.L45:
	slli	a3,a3,2
	add	a3,a2,a3
	lw	a0,0(a3)
	call	my_free
	j	.L28
.L39:
	la a5, .LANCHOR0; lw a5, 0(a5);
	lw	a0,8(a5)
	lw	a1,12(a5)
	ret
	.size	bench_run, .-bench_run
	.section	.rodata.bench_validate.str1.4,"aMS",@progbits,1
	.align	2
.LC9:
	.string	"Test end\n"
	.section	.text.bench_validate,"ax",@progbits
	.align	2
	.globl	bench_validate
	.hidden	bench_validate
	.type	bench_validate, @function
bench_validate:
	addi	sp,sp,-12
	la a0, .LANCHOR4; lw a0, 0(a0);
	sw	ra,8(sp)
	call	my_free
	la a0, .LANCHOR5; lw a0, 0(a0);
	call	my_free
	lla	a0,.LC9
	call	printf
	la a5, .LANCHOR0; lw a5, 0(a5);
	lw	a0,4(a5)
	lw	ra,8(sp)
	la a5, .LANCHOR2; lw a5, 0(a5);
	sub	a0,a0,a5
	snez	a0,a0
	addi	sp,sp,12
	jr	ra
	.size	bench_validate, .-bench_validate
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC10:
	.string	"input/test.trace"
	.align	2
.LC11:
	.string	"input/train.trace"
	.align	2
.LC12:
	.string	"input/ref.trace"
	.align	2
.LC13:
	.string	"input/huge.trace"
	.section	.rodata.settings,"a"
	.align	3
	.set	.LANCHOR1,. + 0
	.type	settings, @object
	.size	settings, 64
settings:
	.word	.LC10
	.word	889192960
	.word	0
	.word	0
	.word	.LC11
	.word	520616434
	.word	647
	.word	0
	.word	.LC12
	.word	260103251
	.word	311050
	.word	0
	.word	.LC13
	.word	-1913450129
	.word	45297530
	.word	0
	.section	.sbss.addr,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	addr, @object
	.size	addr, 4
addr:
	.zero	4
	.section	.sbss.cs,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	cs, @object
	.size	cs, 4
cs:
	.zero	4
	.section	.sbss.nr_op,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	nr_op, @object
	.size	nr_op, 4
nr_op:
	.zero	4
	.section	.sbss.ops,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	ops, @object
	.size	ops, 4
ops:
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
