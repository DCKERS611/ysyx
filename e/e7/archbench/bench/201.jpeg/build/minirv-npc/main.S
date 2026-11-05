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
	.string	"Assertion `fp' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/201.jpeg/main.c:32  \n"
	.align	2
.LC3:
	.string	"Assertion `buffer' failed"
	.align	2
.LC4:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/201.jpeg/main.c:37  \n"
	.align	2
.LC5:
	.string	"Assertion `ret == 1' failed"
	.align	2
.LC6:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/201.jpeg/main.c:39  \n"
	.align	2
.LC7:
	.string	"r"
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
	addi	sp,sp,-12
	lla	a1,.LC7
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	la a4, .LANCHOR0; sw a5, 0(a4);
	call	fopen
	beq	a0,zero,.L26
	li	a2,2
	li	a1,0
	mv	s0,a0
	call	fseek
	mv	a0,s0
	call	ftell
	mv	a5,a0
	lla	s1,.LANCHOR2
	li	a2,0
	li	a1,0
	mv	a0,s0
	sw	a5,0(s1)
	call	fseek
	lw	s1,0(s1)
	mv	a0,s1
	call	malloc
	la a4, .LANCHOR3; sw a0, 0(a4);
	beq	a0,zero,.L27
	mv	a3,s0
	li	a2,1
	mv	a1,s1
	call	fread
	li	a5,1
	bne	a0,a5,.L28
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	fclose
.L26:
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
.L28:
	lla	s0,.LC0
	li	a0,65
.L12:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L12
	lla	s0,.LC5
	li	a0,65
.L13:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L13
	lla	s0,.LC6
	li	a0,32
.L14:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L14
	j	.L10
.L27:
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
	.string	"Assertion `0' failed"
	.align	2
.LC9:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/201.jpeg/main.c:47  \n"
	.align	2
.LC10:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/201.jpeg/main.c:55  \n"
	.align	2
.LC11:
	.string	"Couldn't get image info: %s!\n"
	.align	2
.LC12:
	.string	"Image size = %d x %d\n"
	.align	2
.LC13:
	.string	"Couldn't load image: %s!\n"
	.section	.text.bench_run,"ax",@progbits
	.align	2
	.globl	bench_run
	.hidden	bench_run
	.type	bench_run, @function
bench_run:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	s0,.LANCHOR3
	lla	s1,.LANCHOR2
	lw	a1,0(s1)
	lw	a0,0(s0)
	lla	a4,.LANCHOR4+12
	lla	a3,.LANCHOR4+8
	lla	a2,.LANCHOR4+4
	sw	ra,8(sp)
	call	stbi_info_from_memory
	beq	a0,zero,.L46
	lla	t1,.LANCHOR4
	lw	a2,8(t1)
	lw	a1,4(t1)
	lla	a0,.LC12
	call	printf
	lw	a1,0(s1)
	lw	a0,0(s0)
	li	a5,4
	lla	a4,.LANCHOR4+12
	lla	a3,.LANCHOR4+8
	lla	a2,.LANCHOR4+4
	call	stbi_load_from_memory
	lla	t1,.LANCHOR4
	sw	a0,0(t1)
	beq	a0,zero,.L47
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a5,4
	sw	a5,12(t1)
	la a5, .LANCHOR0; lw a5, 0(a5);
	lw	a0,8(a5)
	lw	a1,12(a5)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L46:
	call	stbi_failure_reason
	mv	a1,a0
	lla	a0,.LC11
	call	printf
	lla	s0,.LC0
	li	a0,65
.L31:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L31
	lla	s0,.LC8
	li	a0,65
.L32:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L32
	lla	s0,.LC9
	li	a0,32
.L33:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L33
.L38:
	li	a0,1
	call	halt
.L47:
	call	stbi_failure_reason
	mv	a1,a0
	lla	a0,.LC13
	call	printf
	lla	s0,.LC0
	li	a0,65
.L35:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L35
	lla	s0,.LC8
	li	a0,65
.L36:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L36
	lla	s0,.LC10
	li	a0,32
.L37:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L37
	j	.L38
	.size	bench_run, .-bench_run
	.globl	__mulsi3
	.section	.rodata.bench_validate.str1.4,"aMS",@progbits,1
	.align	2
.LC14:
	.string	"checksum = 0x%08x\n"
	.section	.text.bench_validate,"ax",@progbits
	.align	2
	.globl	bench_validate
	.hidden	bench_validate
	.type	bench_validate, @function
bench_validate:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR4
	lw	a1,8(s1)
	lw	a0,4(s1)
	sw	s0,4(sp)
	lw	s0,0(s1)
	sw	ra,8(sp)
	call	__mulsi3
	slli	a1,a0,2
	add	a1,s0,a1
	mv	a0,s0
	call	bench_checksum
	mv	a1,a0
	mv	s0,a0
	lla	a0,.LC14
	call	printf
	lw	a0,0(s1)
	call	free
	la a0, .LANCHOR3; lw a0, 0(a0);
	call	free
	la a5, .LANCHOR0; lw a5, 0(a5);
	lw	a0,4(a5)
	lw	ra,8(sp)
	lw	s1,0(sp)
	sub	a0,a0,s0
	lw	s0,4(sp)
	snez	a0,a0
	addi	sp,sp,12
	jr	ra
	.size	bench_validate, .-bench_validate
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC15:
	.string	"input/test.jpg"
	.align	2
.LC16:
	.string	"input/train.jpg"
	.align	2
.LC17:
	.string	"input/ref.jpg"
	.align	2
.LC18:
	.string	"input/huge.jpg"
	.section	.bss.img,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	img, @object
	.size	img, 16
img:
	.zero	16
	.section	.rodata.settings,"a"
	.align	3
	.set	.LANCHOR1,. + 0
	.type	settings, @object
	.size	settings, 64
settings:
	.word	.LC15
	.word	-338833327
	.word	0
	.word	0
	.word	.LC16
	.word	-625251745
	.word	83
	.word	0
	.word	.LC17
	.word	1576971641
	.word	74920
	.word	0
	.word	.LC18
	.word	-1662685599
	.word	1951833
	.word	0
	.section	.sbss.buffer,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	buffer, @object
	.size	buffer, 4
buffer:
	.zero	4
	.section	.sbss.length,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	length, @object
	.size	length, 4
length:
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
