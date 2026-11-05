#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"main.c"
	.option nopic
	.text
	.section	.rodata.bench_init.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"cproc-qbe"
	.align	2
.LC1:
	.string	"usage: %s [input]\n"
	.align	2
.LC2:
	.string	"<stdin>"
	.section	.text.bench_init,"ax",@progbits
	.align	2
	.globl	bench_init
	.hidden	bench_init
	.type	bench_init, @function
bench_init:
	slli	a4,a0,4
	lla	a1,.LC0
	lla	a5,.LANCHOR1
	add	a5,a5,a4
	addi	sp,sp,-12
	mv	a0,a1
	la a4, .LANCHOR0; sw a5, 0(a4);
	sw	s0,4(sp)
	sw	ra,8(sp)
	lw	s0,0(a5)
	sw	s1,0(sp)
	call	progname
	lla	a5,argv0
	sw	a0,0(a5)
	lbu	a4,0(s0)
	li	a5,45
	bne	a4,a5,.L2
	lbu	a5,1(s0)
	mv	a2,a0
	beq	a5,a4,.L22
	addi	s0,s0,1
	beq	a5,zero,.L4
.L9:
	lla	s1,.LC1
	j	.L7
.L23:
	lla	a5,argv0
	lw	a2,0(a5)
.L7:
	lla	a5,stderr
	lw	a0,0(a5)
	mv	a1,s1
	addi	s0,s0,1
	call	fprintf
	li	a0,2
	call	bench_exit
	lbu	a5,0(s0)
	bne	a5,zero,.L23
.L4:
	call	obuf_init
	li	a0,0
	call	targinit
	call	scan_init
	la a1, stdin; lw a1, 0(a1);
	lla	a0,.LC2
	call	scanfrom
.L8:
	call	decl_init
	call	qbe_init
	call	token_init
	call	ppinit
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	scopeinit
.L22:
	lbu	a5,2(s0)
	addi	s0,s0,1
	bne	a5,zero,.L9
	j	.L4
.L2:
	call	obuf_init
	li	a0,0
	call	targinit
	call	scan_init
	li	a1,0
	mv	a0,s0
	call	scanfrom
	call	scanopen
	j	.L8
	.size	bench_init, .-bench_init
	.section	.rodata.bench_run.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"after __asm__"
	.align	2
.LC4:
	.string	"in asm statement"
	.align	2
.LC5:
	.string	"asm string must be a narrow string literal"
	.align	2
.LC6:
	.string	"after asm string"
	.align	2
.LC7:
	.string	"after asm statement"
	.align	2
.LC8:
	.string	"unexpected ';' at top-level"
	.align	2
.LC9:
	.string	"expected declaration or function definition"
	.section	.text.bench_run,"ax",@progbits
	.align	2
	.globl	bench_run
	.hidden	bench_run
	.type	bench_run, @function
bench_run:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	ra,16(sp)
	lla	s0,tok
	call	next
.L35:
	lw	a5,0(s0)
	li	a4,1
	beq	a5,a4,.L25
.L38:
	li	a4,60
	li	a1,0
	lla	a0,filescope
	beq	a5,a4,.L36
	call	decl
	li	a5,95
	bne	a0,zero,.L35
	lw	a4,0(s0)
	beq	a4,a5,.L37
.L30:
	lla	a1,.LC9
	lla	a0,tok+8
	call	error
	lw	a5,0(s0)
	li	a4,1
	bne	a5,a4,.L38
.L25:
	call	emittentativedefns
	lw	ra,16(sp)
	lw	s0,12(sp)
	la a5, .LANCHOR0; lw a5, 0(a5);
	lw	a0,8(a5)
	lw	a1,12(a5)
	addi	sp,sp,20
	jr	ra
.L36:
	call	next
	lla	a1,.LC3
	li	a0,64
	call	expect
	lla	a2,.LC4
	li	a1,7
	lla	a0,tok
	call	tokencheck
	li	a1,0
	mv	a0,sp
	call	stringconcat
	lw	a3,16(a0)
	li	a4,1
	mv	a5,a0
	lla	a1,.LC5
	lla	a0,tok+8
	bne	a3,a4,.L32
	lw	a5,20(a5)
	bne	a5,zero,.L32
.L27:
	lw	a0,4(sp)
	call	emitasm
	lla	a1,.LC6
	li	a0,65
	call	expect
	lla	a1,.LC7
	li	a0,95
	call	expect
	j	.L35
.L32:
	call	error
	j	.L27
.L37:
	lla	a1,.LC8
	lla	a0,tok+8
	call	error
	j	.L30
	.size	bench_run, .-bench_run
	.section	.rodata.bench_validate.str1.4,"aMS",@progbits,1
	.align	2
.LC10:
	.string	"cs = 0x%08x\n"
	.align	2
.LC11:
	.string	"write failed"
	.section	.text.bench_validate,"ax",@progbits
	.align	2
	.globl	bench_validate
	.hidden	bench_validate
	.type	bench_validate, @function
bench_validate:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	call	obuf_display
	call	obuf_checksum
	mv	a1,a0
	mv	s0,a0
	lla	a0,.LC10
	call	printf
	call	obuf_exit
	lla	s1,stdout
	call	scanclose
	lw	a0,0(s1)
	call	fflush
	lw	a0,0(s1)
	call	ferror
	bne	a0,zero,.L45
.L40:
	la a5, .LANCHOR0; lw a5, 0(a5);
	lw	a0,4(a5)
	lw	ra,8(sp)
	lw	s1,0(sp)
	sub	a0,a0,s0
	lw	s0,4(sp)
	snez	a0,a0
	addi	sp,sp,12
	jr	ra
.L45:
	lla	a0,.LC11
	call	fatal
	j	.L40
	.size	bench_validate, .-bench_validate
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC12:
	.string	"input/test-dummy.c"
	.align	2
.LC13:
	.string	"input/train-Block.i"
	.align	2
.LC14:
	.string	"input/ref-quickjs.i"
	.align	2
.LC15:
	.string	"input/huge.c"
	.section	.rodata.settings,"a"
	.align	3
	.set	.LANCHOR1,. + 0
	.type	settings, @object
	.size	settings, 64
settings:
	.word	.LC12
	.word	680934603
	.word	0
	.word	0
	.word	.LC13
	.word	-1834813946
	.word	181
	.word	0
	.word	.LC14
	.word	1543261199
	.word	59464
	.word	0
	.word	.LC15
	.word	-1785719636
	.word	6196850
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
