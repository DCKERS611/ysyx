#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"bf.c"
	.option nopic
	.text
	.section	.text.qsort,"ax",@progbits
	.align	2
	.type	qsort, @function
qsort:
	mv	t0,a2
	bge	a1,a2,.L18
	addi	sp,sp,-20
	sw	ra,16(sp)
	sw	s0,12(sp)
	sw	s1,8(sp)
.L13:
	add	s1,a0,t0
.L2:
	add	a2,a0,a1
	addi	a5,a1,1
	lbu	t1,0(a2)
	ble	t0,a5,.L7
	add	a5,a0,a5
	mv	s0,a1
.L5:
	lbu	a4,0(a5)
	bgeu	a4,t1,.L4
	addi	s0,s0,1
	add	a3,a0,s0
	lbu	t2,0(a3)
	sb	a4,0(a3)
	sb	t2,0(a5)
.L4:
	addi	a5,a5,1
	bne	s1,a5,.L5
	lbu	a3,0(a2)
	add	a5,a0,s0
	lbu	a4,0(a5)
	sb	a3,0(a5)
	sw	t0,4(sp)
	sb	a4,0(a2)
	mv	a2,s0
	sw	a0,0(sp)
	call	qsort
	lw	t0,4(sp)
	addi	a1,s0,1
	lw	a0,0(sp)
	blt	a1,t0,.L2
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L7:
	mv	t0,a1
	blt	a1,a1,.L13
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L18:
	ret
	.size	qsort, .-qsort
	.section	.rodata.bench_init.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	">>+>>>>>,[>+>>,]>+[--[+<<<-]<[<+>-]<[<[->[<<<+>>>>+<-]<<[>>+>[->]<<[<]<-]>]>>>+<[[-]<[>+<-]<]>[[>>>]+<<<-<[<<[<<<]>>+>[>>>]<-]<<[<<<]>[>>[>>>]<+<<[<<<]>-]]+<<<]+[->>>]>>]>>[.>>>]"
	.globl	__umodsi3
	.align	2
.LC2:
	.string	"input  = %s\n"
	.align	2
.LC1:
	.string	"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
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
	sw	s0,4(sp)
	li	a0,16384
	lla	s0,.LANCHOR2
	sw	a4,0(s0)
	sw	ra,8(sp)
	la a3, .LANCHOR0; sw a5, 0(a3);
	sw	s1,0(sp)
	la a5, .LANCHOR3; sw zero, 0(a5);
	call	malloc
	mv	a5,a0
	li	a0,1024
	la a4, .LANCHOR4; sw a5, 0(a4);
	call	malloc
	mv	a5,a0
	li	a1,65536
	li	a0,1
	la a4, .LANCHOR5; sw a5, 0(a4);
	call	calloc
	lw	a5,0(s0)
	la a4, .LANCHOR6; sw a0, 0(a4);
	addi	a0,a5,1
	lla	a5,.LC0
	la a4, .LANCHOR7; sw a5, 0(a4);
	call	malloc
	lla	a4,.LANCHOR8
	mv	a5,a0
	li	a0,32768
	sw	a5,0(a4)
	call	malloc
	mv	a5,a0
	li	a0,1
	la a4, .LANCHOR9; sw a5, 0(a4);
	la a5, .LANCHOR10; sw zero, 0(a5);
	call	bench_srand
	lw	a4,0(s0)
	ble	a4,zero,.L20
	li	s1,0
.L21:
	call	bench_rand
	li	a1,62
	call	__umodsi3
	lla	a5,.LANCHOR8
	lw	a3,0(a5)
	lla	a5,.LC1
	add	a0,a5,a0
	lbu	a1,0(a0)
	lw	a4,0(s0)
	add	a2,a3,s1
	sb	a1,0(a2)
	addi	s1,s1,1
	bgt	a4,s1,.L21
.L22:
	add	a4,a3,a4
	sb	zero,0(a4)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	la a5, .LANCHOR11; sw a3, 0(a5);
	mv	a1,a3
	lla	a0,.LC2
	addi	sp,sp,12
	tail	printf
.L20:
	lla	a5,.LANCHOR8
	lw	a3,0(a5)
	j	.L22
	.size	bench_init, .-bench_init
	.section	.rodata.bench_run.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"compile fail!\n"
	.section	.text.bench_run,"ax",@progbits
	.align	2
	.globl	bench_run
	.hidden	bench_run
	.type	bench_run, @function
bench_run:
	lla	a5,.LANCHOR7
	lw	a3,0(a5)
	addi	sp,sp,-24
	lla	a5,.LANCHOR3
	lw	t2,0(a5)
	sw	ra,20(sp)
	sw	s0,16(sp)
	sw	s1,12(sp)
	lbu	a5,0(a3)
	sw	t2,8(sp)
	beq	a5,zero,.L26
	la a4, .LANCHOR5; lw a4, 0(a4);
	li	s1,0
	sw	a4,4(sp)
	la a2, .LANCHOR4; lw a2, 0(a2);
	addi	a3,a3,1
	li	t1,0
	li	a4,0
	li	a0,50
	lla	a1,.L35
	li	s0,4096
	sw	s1,0(sp)
.L27:
	addi	a5,a5,-43
	andi	a5,a5,0xff
	bgtu	a5,a0,.L33
	slli	a5,a5,2
	add	a5,a5,a1
	lw	a5,0(a5)
	add	a5,a5,a1
	jr	a5
	.section	.rodata.bench_run,"a",@progbits
	.align	2
	.align	2
.L35:
	.word	.L42-.L35
	.word	.L41-.L35
	.word	.L40-.L35
	.word	.L39-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L38-.L35
	.word	.L33-.L35
	.word	.L37-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L33-.L35
	.word	.L36-.L35
	.word	.L33-.L35
	.word	.L34-.L35
	.section	.text.bench_run
.L33:
	lbu	a5,0(a3)
	mv	t0,a3
	beq	a5,zero,.L120
.L31:
	addi	a3,a3,1
	li	t1,1
	j	.L27
.L34:
	beq	t2,zero,.L46
	lw	t1,4(sp)
	addi	t2,t2,-1
	slli	a5,t2,1
	add	a5,t1,a5
	lhu	t1,0(a5)
	slli	a5,a4,2
	add	a5,a2,a5
	slli	t0,t1,2
	li	s1,8
	sh	t1,2(a5)
	sh	s1,0(a5)
	add	a5,a2,t0
	sh	a4,2(a5)
	li	a5,1
	sw	a5,0(sp)
.L43:
	lbu	a5,0(a3)
	addi	a4,a4,1
	slli	a4,a4,16
	srli	a4,a4,16
	mv	t0,a3
	beq	a5,zero,.L120
.L49:
	bne	a4,s0,.L31
	lw	s1,0(sp)
	lla	a5,.LANCHOR7
	sw	a3,0(a5)
	beq	s1,zero,.L29
	lla	a5,.LANCHOR3
	sw	t2,0(a5)
.L29:
	lla	a0,.LC3
	call	printf
.L52:
	lw	ra,20(sp)
	lw	s0,16(sp)
	la a5, .LANCHOR0; lw a5, 0(a5);
	lw	a0,8(a5)
	lw	a1,12(a5)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L36:
	slli	a5,a4,2
	add	a5,a2,a5
	li	s1,7
	sh	s1,0(a5)
	li	a5,512
	beq	t2,a5,.L125
	lw	t1,4(sp)
	slli	a5,t2,1
	mv	t0,a3
	add	a5,t1,a5
	sh	a4,0(a5)
	li	a5,1
	sw	a5,0(sp)
	lbu	a5,0(a3)
	addi	a4,a4,1
	slli	a4,a4,16
	addi	t2,t2,1
	srli	a4,a4,16
	bne	a5,zero,.L49
.L120:
	lw	s1,0(sp)
	lla	a5,.LANCHOR7
	sw	a3,0(a5)
	beq	s1,zero,.L48
	lla	a5,.LANCHOR3
	sw	t2,0(a5)
	sw	t2,8(sp)
.L48:
	lw	a5,8(sp)
	bne	a5,zero,.L29
	li	a5,4096
	beq	a4,a5,.L29
	slli	a4,a4,2
	add	a4,a2,a4
.L30:
	sh	zero,0(a4)
	lhu	a5,0(a2)
	beq	a5,zero,.L52
	lla	a4,.LANCHOR8
	lw	t2,0(a4)
	lla	a4,.LANCHOR10
	lw	s0,0(a4)
	la a4, .LANCHOR9; lw a4, 0(a4);
	sw	a4,8(sp)
	la t0, .LANCHOR6; lw t0, 0(t0);
	mv	a4,a2
	sw	zero,0(sp)
	sw	zero,4(sp)
	li	a3,0
	li	a0,0
	li	t1,8
	lla	a1,.L55
.L70:
	bgtu	a5,t1,.L124
	slli	a5,a5,2
	add	a5,a5,a1
	lw	a5,0(a5)
	add	a5,a5,a1
	jr	a5
	.section	.rodata.bench_run
	.align	2
	.align	2
.L55:
	.word	.L124-.L55
	.word	.L62-.L55
	.word	.L61-.L55
	.word	.L60-.L55
	.word	.L59-.L55
	.word	.L58-.L55
	.word	.L57-.L55
	.word	.L56-.L55
	.word	.L54-.L55
	.section	.text.bench_run
.L37:
	slli	a5,a4,2
	add	a5,a2,a5
	li	t1,1
	sh	t1,0(a5)
	j	.L43
.L38:
	slli	a5,a4,2
	add	a5,a2,a5
	li	t1,2
	sh	t1,0(a5)
	j	.L43
.L39:
	slli	a5,a4,2
	add	a5,a2,a5
	li	t1,5
	sh	t1,0(a5)
	j	.L43
.L40:
	slli	a5,a4,2
	add	a5,a2,a5
	li	t1,4
	sh	t1,0(a5)
	j	.L43
.L41:
	slli	a5,a4,2
	add	a5,a2,a5
	li	t1,6
	sh	t1,0(a5)
	j	.L43
.L42:
	slli	a5,a4,2
	add	a5,a2,a5
	li	t1,3
	sh	t1,0(a5)
	j	.L43
.L54:
	slli	a5,a0,1
	add	a5,t0,a5
	lhu	a5,0(a5)
	beq	a5,zero,.L66
	lhu	a3,2(a4)
	j	.L66
.L56:
	slli	a5,a0,1
	add	a5,t0,a5
	lhu	a5,0(a5)
	bne	a5,zero,.L66
	lhu	a3,2(a4)
	j	.L66
.L57:
	lbu	a4,0(t2)
	slli	a5,a0,1
	add	a5,t0,a5
	sh	a4,0(a5)
	li	a5,1
	addi	t2,t2,1
	sw	a5,0(sp)
.L66:
	addi	a3,a3,1
	slli	a4,a3,2
	add	a4,a2,a4
	lhu	a5,0(a4)
	bne	a5,zero,.L70
.L124:
	lw	a5,0(sp)
	beq	a5,zero,.L71
	lla	a5,.LANCHOR8
	sw	t2,0(a5)
.L71:
	lw	a5,4(sp)
	beq	a5,zero,.L52
	lla	a5,.LANCHOR10
	sw	s0,0(a5)
	j	.L52
.L58:
	slli	a5,a0,1
	add	a5,t0,a5
	lhu	a4,0(a5)
	lw	a5,8(sp)
	li	s1,1
	sw	s1,4(sp)
	add	a5,a5,s0
	sb	a4,0(a5)
	addi	s0,s0,1
	j	.L66
.L59:
	slli	a5,a0,1
	add	a5,t0,a5
	lhu	a4,0(a5)
	addi	a4,a4,-1
	sh	a4,0(a5)
	j	.L66
.L60:
	slli	a5,a0,1
	add	a5,t0,a5
	lhu	a4,0(a5)
	addi	a4,a4,1
	sh	a4,0(a5)
	j	.L66
.L61:
	addi	a0,a0,-1
.L65:
	addi	a3,a3,1
	slli	a4,a3,2
	add	a4,a2,a4
	lhu	a5,0(a4)
	beq	a5,zero,.L124
	li	s1,32768
	bltu	a0,s1,.L70
	j	.L124
.L62:
	addi	a0,a0,1
	j	.L65
.L125:
	lw	s1,0(sp)
	beq	t1,zero,.L45
	lla	a5,.LANCHOR7
	sw	t0,0(a5)
.L45:
	beq	s1,zero,.L29
	li	a5,512
	lla	a4,.LANCHOR3
	sw	a5,0(a4)
	j	.L29
.L46:
	lw	s1,0(sp)
	beq	t1,zero,.L72
	lla	a5,.LANCHOR7
	sw	t0,0(a5)
.L72:
	beq	s1,zero,.L29
	la a5, .LANCHOR3; sw zero, 0(a5);
	j	.L29
.L26:
	lw	a5,8(sp)
	bne	a5,zero,.L29
	la a4, .LANCHOR4; lw a4, 0(a4);
	mv	a2,a4
	j	.L30
	.size	bench_run, .-bench_run
	.section	.rodata.bench_validate.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"output = %s\n"
	.section	.text.bench_validate,"ax",@progbits
	.align	2
	.globl	bench_validate
	.hidden	bench_validate
	.type	bench_validate, @function
bench_validate:
	addi	sp,sp,-12
	lla	a3,.LANCHOR9
	sw	s0,4(sp)
	lla	s0,.LANCHOR10
	lw	a1,0(a3)
	lw	a5,0(s0)
	sw	ra,8(sp)
	sw	s1,0(sp)
	add	a5,a1,a5
	sb	zero,0(a5)
	lla	a0,.LC4
	call	printf
	lla	a4,.LANCHOR11
	lw	s1,0(a4)
	lla	a5,.LANCHOR2
	lw	a2,0(a5)
	mv	a0,s1
	li	a1,0
	call	qsort
	lla	a3,.LANCHOR9
	lw	a1,0(a3)
	lw	a2,0(s0)
	mv	a0,s1
	call	memcmp
	mv	s1,a0
	la a0, .LANCHOR4; lw a0, 0(a0);
	call	free
	la a0, .LANCHOR5; lw a0, 0(a0);
	call	free
	la a0, .LANCHOR6; lw a0, 0(a0);
	call	free
	lla	a4,.LANCHOR11
	lw	a0,0(a4)
	call	free
	lla	a3,.LANCHOR9
	lw	a0,0(a3)
	call	free
	lla	a5,.LANCHOR2
	lw	a4,0(s0)
	lw	a5,0(a5)
	snez	a0,s1
	beq	a4,a5,.L126
	li	a0,1
.L126:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	bench_validate, .-bench_validate
	.section	.rodata.settings,"a"
	.align	3
	.set	.LANCHOR1,. + 0
	.type	settings, @object
	.size	settings, 64
settings:
	.word	1
	.zero	4
	.word	0
	.word	0
	.word	12
	.zero	4
	.word	161
	.word	0
	.word	1000
	.zero	4
	.word	327586
	.word	0
	.word	10000
	.zero	4
	.word	37029478
	.word	0
	.section	.sbss.ARR_SIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	ARR_SIZE, @object
	.size	ARR_SIZE, 4
ARR_SIZE:
	.zero	4
	.section	.sbss.PROGRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	PROGRAM, @object
	.size	PROGRAM, 4
PROGRAM:
	.zero	4
	.section	.sbss.SP,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	SP, @object
	.size	SP, 4
SP:
	.zero	4
	.section	.sbss.STACK,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	STACK, @object
	.size	STACK, 4
STACK:
	.zero	4
	.section	.sbss.code,"aw",@nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	code, @object
	.size	code, 4
code:
	.zero	4
	.section	.sbss.data,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	data, @object
	.size	data, 4
data:
	.zero	4
	.section	.sbss.input,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	input, @object
	.size	input, 4
input:
	.zero	4
	.section	.sbss.input0,"aw",@nobits
	.align	2
	.set	.LANCHOR11,. + 0
	.type	input0, @object
	.size	input0, 4
input0:
	.zero	4
	.section	.sbss.noutput,"aw",@nobits
	.align	2
	.set	.LANCHOR10,. + 0
	.type	noutput, @object
	.size	noutput, 4
noutput:
	.zero	4
	.section	.sbss.output,"aw",@nobits
	.align	2
	.set	.LANCHOR9,. + 0
	.type	output, @object
	.size	output, 4
output:
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
