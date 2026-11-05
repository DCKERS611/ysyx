#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"main.c"
	.option nopic
	.text
	.section	.text.bench_init,"ax",@progbits
	.align	2
	.globl	bench_init
	.hidden	bench_init
	.type	bench_init, @function
bench_init:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a0
	li	a0,0
	sw	ra,8(sp)
	call	bench_srand
	slli	a0,s0,1
	add	a0,a0,s0
	slli	a0,a0,3
	lla	a5,.LANCHOR1
	add	a5,a5,a0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	a1,0(a5)
	la a4, .LANCHOR0; sw a5, 0(a4);
	lla	a0,.LANCHOR2
	addi	sp,sp,12
	tail	initBlockchain
	.size	bench_init, .-bench_init
	.section	.rodata.bench_run.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Mining block 1...\n"
	.align	2
.LC1:
	.string	"Block 1 Data"
	.align	2
.LC2:
	.string	"Mining block 2...\n"
	.align	2
.LC3:
	.string	"Block 2 Data"
	.align	2
.LC4:
	.string	"Mining block 3...\n"
	.align	2
.LC5:
	.string	"Block 3 Data"
	.section	.text.bench_run,"ax",@progbits
	.align	2
	.globl	bench_run
	.hidden	bench_run
	.type	bench_run, @function
bench_run:
	addi	sp,sp,-12
	lla	a0,.LC0
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	call	printf
	lla	s1,.LANCHOR2
	lla	a2,.LC1
	li	a1,1
	mv	a0,s1
	call	AddBlock
	mv	a5,a0
	lla	s0,.LANCHOR3
	lla	a0,.LC2
	sw	a5,0(s0)
	call	printf
	lla	a2,.LC3
	li	a1,2
	mv	a0,s1
	call	AddBlock
	mv	a5,a0
	lla	a0,.LC4
	sw	a5,4(s0)
	call	printf
	li	a1,3
	mv	a0,s1
	lla	a2,.LC5
	call	AddBlock
	sw	a0,8(s0)
	lw	ra,8(sp)
	lw	s0,4(sp)
	la a5, .LANCHOR0; lw a5, 0(a5);
	lw	a0,16(a5)
	lw	a1,20(a5)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	bench_run, .-bench_run
	.section	.text.bench_validate,"ax",@progbits
	.align	2
	.globl	bench_validate
	.hidden	bench_validate
	.type	bench_validate, @function
bench_validate:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	lla	a3,.LANCHOR3
	li	s0,0
	lla	s1,.LANCHOR0
.L8:
	lw	a5,0(a3)
	addi	a3,a3,4
	sw	a3,4(sp)
	mv	a0,a5
	sw	a5,0(sp)
	call	strlen
	lw	a5,0(sp)
	add	a1,a5,a0
	mv	a0,a5
	call	bench_checksum
	lw	a5,0(s1)
	slli	a4,s0,2
	addi	s0,s0,1
	add	a5,a5,a4
	lw	a5,4(a5)
	bne	a5,a0,.L9
	li	a5,3
	lw	a3,4(sp)
	bne	s0,a5,.L8
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	li	a0,0
	addi	sp,sp,20
	jr	ra
.L9:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	li	a0,1
	addi	sp,sp,20
	jr	ra
	.size	bench_validate, .-bench_validate
	.section	.bss.bChain,"aw",@nobits
	.align	3
	.set	.LANCHOR2,. + 0
	.type	bChain, @object
	.size	bChain, 784
bChain:
	.zero	784
	.section	.bss.hash,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	hash, @object
	.size	hash, 12
hash:
	.zero	12
	.section	.rodata.settings,"a"
	.align	3
	.set	.LANCHOR1,. + 0
	.type	settings, @object
	.size	settings, 96
settings:
	.word	0
	.word	1001345033
	.word	-1376499810
	.word	844117371
	.word	0
	.word	0
	.word	1
	.word	-1000647329
	.word	1108799394
	.word	-382113318
	.word	43
	.word	0
	.word	5
	.word	846821477
	.word	-903613771
	.word	794282870
	.word	1621671
	.word	0
	.word	6
	.word	1657927493
	.word	1494113191
	.word	1177517814
	.word	14987945
	.word	0
	.section	.sbss.ps,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	ps, @object
	.size	ps, 4
ps:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
