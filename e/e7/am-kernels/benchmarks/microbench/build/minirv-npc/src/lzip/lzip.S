#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lzip.c"
	.option nopic
	.text
	.globl	__umodsi3
	.section	.text.bench_lzip_prepare,"ax",@progbits
	.align	2
	.globl	bench_lzip_prepare
	.hidden	bench_lzip_prepare
	.type	bench_lzip_prepare, @function
bench_lzip_prepare:
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
	li	a0,36864
	addi	a0,a0,-2044
	call	bench_alloc
	mv	a5,a0
	lw	a0,0(s1)
	la a4, .LANCHOR1; sw a5, 0(a4);
	call	bench_alloc
	lw	a5,0(s1)
	lla	a4,.LANCHOR2
	sw	a0,0(a4)
	addi	a0,a5,400
	call	bench_alloc
	lw	a5,0(s1)
	la a4, .LANCHOR3; sw a0, 0(a4);
	ble	a5,zero,.L1
	li	s0,0
.L3:
	call	bench_rand
	lla	a5,.LANCHOR2
	lw	a5,0(a5)
	li	a1,26
	add	a5,a5,s0
	sw	a5,0(sp)
	call	__umodsi3
	lw	a5,0(sp)
	lw	a4,0(s1)
	addi	a0,a0,97
	sb	a0,0(a5)
	addi	s0,s0,1
	bgt	a4,s0,.L3
.L1:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	bench_lzip_prepare, .-bench_lzip_prepare
	.section	.text.bench_lzip_run,"ax",@progbits
	.align	2
	.globl	bench_lzip_run
	.hidden	bench_lzip_run
	.type	bench_lzip_run, @function
bench_lzip_run:
	addi	sp,sp,-12
	la a3, .LANCHOR1; lw a3, 0(a3);
	la a2, .LANCHOR0; lw a2, 0(a2);
	la a1, .LANCHOR3; lw a1, 0(a1);
	la a0, .LANCHOR2; lw a0, 0(a0);
	sw	ra,8(sp)
	call	qlz_compress
	lw	ra,8(sp)
	la a5, .LANCHOR4; sw a0, 0(a5);
	addi	sp,sp,12
	jr	ra
	.size	bench_lzip_run, .-bench_lzip_run
	.section	.text.bench_lzip_validate,"ax",@progbits
	.align	2
	.globl	bench_lzip_validate
	.hidden	bench_lzip_validate
	.type	bench_lzip_validate, @function
bench_lzip_validate:
	la a0, .LANCHOR3; lw a0, 0(a0);
	la a1, .LANCHOR4; lw a1, 0(a1);
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
	.size	bench_lzip_validate, .-bench_lzip_validate
	.section	.sbss.SIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	SIZE, @object
	.size	SIZE, 4
SIZE:
	.zero	4
	.section	.sbss.blk,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	blk, @object
	.size	blk, 4
blk:
	.zero	4
	.section	.sbss.compress,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	compress, @object
	.size	compress, 4
compress:
	.zero	4
	.section	.sbss.len,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	len, @object
	.size	len, 4
len:
	.zero	4
	.section	.sbss.state,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	state, @object
	.size	state, 4
state:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
