#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"bench.c"
	.option nopic
	.text
	.globl	__udivdi3
	.globl	__udivsi3
	.globl	__divsi3
	.globl	__umoddi3
	.globl	__umodsi3
	.globl	__modsi3
	.section	.rodata.format_time.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"  0:00:00.000000 (%llu us)"
	.section	.text.format_time,"ax",@progbits
	.align	2
	.type	format_time, @function
format_time:
	li	a2,999424
	addi	sp,sp,-28
	addi	a2,a2,576
	li	a3,0
	sw	ra,24(sp)
	sw	s0,20(sp)
	sw	s1,16(sp)
	sw	a0,4(sp)
	mv	s1,a1
	call	__udivdi3
	li	a1,60
	sw	a0,0(sp)
	call	__udivsi3
	li	a1,60
	mv	s0,a0
	call	__udivsi3
	lw	t1,4(sp)
	li	a2,999424
	mv	a4,a0
	addi	a2,a2,576
	li	a3,0
	mv	a0,t1
	mv	a1,s1
	sw	a4,12(sp)
	sw	t1,8(sp)
	call	__umoddi3
	mv	a5,a0
	li	a1,60
	mv	a0,s0
	mv	s0,a5
	call	__umodsi3
	mv	a5,a0
	lw	a0,0(sp)
	li	a1,60
	sw	a5,4(sp)
	call	__umodsi3
	lw	t1,8(sp)
	mv	t0,a0
	mv	a3,s1
	mv	a2,t1
	lla	a1,.LC0
	lla	a0,.LANCHOR0
	mv	s1,t0
	call	sprintf
	lw	a4,0(sp)
	li	a3,4096
	addi	a3,a3,-497
	lw	a5,4(sp)
	bleu	a4,a3,.L2
	lla	a4,.LANCHOR0+2
	sw	a4,0(sp)
	lw	a4,12(sp)
.L3:
	li	a1,10
	mv	a0,a4
	sw	a5,8(sp)
	sw	a4,4(sp)
	call	__umodsi3
	lw	a5,0(sp)
	lw	a4,4(sp)
	addi	a3,a0,48
	sb	a3,0(a5)
	mv	a0,a4
	li	a1,10
	call	__udivsi3
	lw	a5,0(sp)
	lw	a2,4(sp)
	li	a3,9
	addi	a5,a5,-1
	sw	a5,0(sp)
	mv	a4,a0
	lw	a5,8(sp)
	bgtu	a2,a3,.L3
.L2:
	beq	a5,zero,.L4
	lla	a4,.LANCHOR0+5
	sw	a4,0(sp)
.L5:
	li	a1,10
	mv	a0,a5
	sw	a5,4(sp)
	call	__umodsi3
	lw	a5,4(sp)
	addi	a4,a0,48
	li	a1,10
	mv	a0,a5
	lw	a5,0(sp)
	sb	a4,0(a5)
	call	__udivsi3
	lw	a5,0(sp)
	lw	a3,4(sp)
	li	a4,9
	addi	a5,a5,-1
	sw	a5,0(sp)
	mv	a5,a0
	bgtu	a3,a4,.L5
.L4:
	beq	s1,zero,.L6
	lla	a5,.LANCHOR0+8
	sw	a5,0(sp)
.L7:
	li	a1,10
	mv	a0,s1
	call	__umodsi3
	addi	a5,a0,48
	sw	s1,4(sp)
	mv	a0,s1
	lw	s1,0(sp)
	li	a1,10
	sb	a5,0(s1)
	call	__udivsi3
	lw	a4,4(sp)
	addi	a5,s1,-1
	sw	a5,0(sp)
	li	a5,9
	mv	s1,a0
	bgtu	a4,a5,.L7
.L6:
	beq	s0,zero,.L8
	lla	s1,.LANCHOR0+15
.L9:
	li	a1,10
	mv	a0,s0
	call	__umodsi3
	addi	a5,a0,48
	sb	a5,0(s1)
	mv	a0,s0
	li	a1,10
	sw	s0,0(sp)
	call	__udivsi3
	lw	a4,0(sp)
	li	a5,9
	addi	s1,s1,-1
	mv	s0,a0
	bgtu	a4,a5,.L9
.L8:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	lla	a0,.LANCHOR0
	addi	sp,sp,28
	jr	ra
	.size	format_time, .-format_time
	.section	.text.bench_uptime,"ax",@progbits
	.align	2
	.globl	bench_uptime
	.hidden	bench_uptime
	.type	bench_uptime, @function
bench_uptime:
	addi	sp,sp,-24
	sw	s0,16(sp)
	addi	s0,sp,7
	andi	s0,s0,-8
	mv	a1,s0
	li	a0,6
	sw	ra,20(sp)
	call	ioe_read
	lw	a0,0(s0)
	lw	a1,4(s0)
	lw	ra,20(sp)
	lw	s0,16(sp)
	addi	sp,sp,24
	jr	ra
	.size	bench_uptime, .-bench_uptime
	.section	.text.bench_srand,"ax",@progbits
	.align	2
	.globl	bench_srand
	.hidden	bench_srand
	.type	bench_srand, @function
bench_srand:
	lla	a5,.LANCHOR1
	sw	a0,0(a5)
	sw	zero,4(a5)
	ret
	.size	bench_srand, .-bench_srand
	.globl	__muldi3
	.section	.text.bench_rand,"ax",@progbits
	.align	2
	.globl	bench_rand
	.hidden	bench_rand
	.type	bench_rand, @function
bench_rand:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	a5,.LC1
	lla	s0,.LANCHOR1
	lw	a0,0(s0)
	lw	a1,4(s0)
	lw	a2,0(a5)
	lw	a3,4(a5)
	sw	ra,8(sp)
	call	__muldi3
	addi	a5,a0,1
	sltu	a0,a5,a0
	add	a0,a0,a1
	lw	ra,8(sp)
	sw	a5,0(s0)
	sw	a0,4(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	bench_rand, .-bench_rand
	.section	.text.bench_checksum,"ax",@progbits
	.align	2
	.globl	bench_checksum
	.hidden	bench_checksum
	.type	bench_checksum, @function
bench_checksum:
	addi	a2,a0,4
	bltu	a1,a2,.L34
	li	a5,-2128830464
	addi	a5,a5,-571
.L33:
	mv	a3,a0
.L32:
	lbu	a4,0(a3)
	addi	a3,a3,1
	xor	a4,a4,a5
	slli	a5,a4,15
	add	a5,a5,a4
	slli	a5,a5,2
	sub	a5,a5,a4
	slli	a5,a5,3
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	sub	a5,a5,a4
	bne	a2,a3,.L32
	addi	a2,a2,4
	addi	a0,a0,4
	bgeu	a1,a2,.L33
	slli	a3,a4,5
	sub	a3,a3,a4
	slli	a3,a3,3
	add	a3,a3,a4
	slli	a5,a3,6
	sub	a5,a5,a3
	slli	a5,a5,2
	sub	a5,a5,a4
	slli	a5,a5,3
	sub	a5,a5,a4
	slli	a5,a5,3
	sub	a5,a5,a4
	slli	a4,a5,2
	add	a5,a5,a4
	srai	a4,a5,7
	xor	a5,a4,a5
	slli	a4,a5,3
	add	a4,a4,a5
	srai	a5,a4,17
	xor	a5,a5,a4
	slli	a0,a5,5
	add	a0,a0,a5
	ret
.L34:
	li	a0,-1494220800
	addi	a0,a0,1950
	ret
	.size	bench_checksum, .-bench_checksum
	.section	.rodata.main.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"test"
	.align	2
.LC3:
	.string	"\033[1;32mPASS\033[0m"
	.align	2
.LC4:
	.string	"\033[1;31mFAIL\033[0m"
	.align	2
.LC5:
	.string	"Empty mainargs. Use \"test\" by default\n"
	.align	2
.LC6:
	.string	""
	.align	2
.LC7:
	.string	"train"
	.align	2
.LC8:
	.string	"ref"
	.align	2
.LC9:
	.string	"huge"
	.align	2
.LC10:
	.string	"Invalid setting: \"%s\"; must be in {test, train, ref, huge}\n"
	.align	2
.LC11:
	.string	"==================================================\n"
	.align	2
.LC12:
	.string	"[RESULT] %s with min time: %s\n"
	.align	2
.LC13:
	.string	"      %10u Marks\n"
	.align	2
.LC14:
	.string	"AMD Ryzen(TM) 9 7950X3D"
	.align	2
.LC15:
	.string	"  vs. %10u Marks @ %s\n"
	.align	2
.LC16:
	.string	"\n"
	.align	2
.LC17:
	.string	"Scored time: %s\n"
	.align	2
.LC18:
	.string	"Total  time: %s\n"
	.section	.text.startup.main,"ax",@progbits
	.align	2
	.globl	main
	.hidden	main
	.type	main, @function
main:
	addi	sp,sp,-56
	sw	s0,48(sp)
	addi	s0,sp,39
	andi	s0,s0,-8
	sw	s1,44(sp)
	mv	a1,s0
	mv	s1,a0
	li	a0,6
	sw	ra,52(sp)
	call	ioe_read
	lw	a5,0(s0)
	sw	a5,12(sp)
	lw	a5,4(s0)
	sw	a5,16(sp)
	beq	s1,zero,.L40
	lla	a1,.LC6
	mv	a0,s1
	call	strcmp
	beq	a0,zero,.L40
.L39:
	lla	a1,.LC2
	mv	a0,s1
	call	strcmp
	sw	a0,4(sp)
	bne	a0,zero,.L65
.L41:
	lw	a0,4(sp)
	call	bench_init
	mv	a1,s0
	li	a0,6
	call	ioe_read
	lw	a5,0(s0)
	lw	a3,4(s0)
	sw	a5,20(sp)
	sw	a3,8(sp)
	call	bench_run
	mv	a2,a0
	mv	a4,a1
	li	a0,6
	mv	a1,s0
	sw	a2,24(sp)
	sw	a4,28(sp)
	call	ioe_read
	lw	a2,4(s0)
	lw	s1,0(s0)
	sw	a2,0(sp)
	call	bench_validate
	lw	a2,0(sp)
	lw	a3,8(sp)
	lw	a5,20(sp)
	bne	a0,zero,.L42
	sub	a4,s1,a5
	sgtu	a5,a4,s1
	sub	s1,a2,a3
	sub	s1,s1,a5
	sw	a4,0(sp)
	or	a5,a4,s1
	bne	a5,zero,.L47
	li	a5,1
	sw	a5,0(sp)
	li	s1,0
.L47:
	mv	a1,s0
	li	a0,6
	call	ioe_read
	li	a3,1
	lw	a5,0(s0)
	sw	a3,8(sp)
	lw	a3,12(sp)
	lw	a4,4(s0)
	lw	a2,16(sp)
	sub	a3,a5,a3
	sgtu	a5,a3,a5
	sub	a4,a4,a2
	sub	a5,a4,a5
	sw	a5,12(sp)
	mv	s0,a3
	lla	a5,.LC3
.L48:
	lla	a0,.LC11
	sw	a5,16(sp)
	call	printf
	lw	a0,0(sp)
	mv	a1,s1
	call	format_time
	lw	a5,16(sp)
	mv	a2,a0
	lla	a0,.LC12
	mv	a1,a5
	call	printf
	lw	a5,4(sp)
	beq	a5,zero,.L44
	lw	a0,24(sp)
	lw	a1,28(sp)
	li	a2,999424
	addi	a2,a2,576
	li	a3,0
	call	__muldi3
	lw	a2,0(sp)
	mv	a3,s1
	call	__udivdi3
	mv	a1,a0
	bne	a0,zero,.L45
	li	a1,1
.L45:
	lla	a0,.LC13
	call	printf
	li	a1,999424
	lla	a2,.LC14
	addi	a1,a1,576
	lla	a0,.LC15
	call	printf
.L46:
	lw	a0,0(sp)
	mv	a1,s1
	call	format_time
	mv	a1,a0
	lla	a0,.LC17
	call	printf
	lw	a1,12(sp)
	mv	a0,s0
	call	format_time
	mv	a1,a0
	lla	a0,.LC18
	call	printf
	lw	a5,8(sp)
	lw	ra,52(sp)
	lw	s0,48(sp)
	lw	s1,44(sp)
	xori	a0,a5,1
	addi	sp,sp,56
	jr	ra
.L40:
	lla	a0,.LC5
	call	printf
	lla	s1,.LC2
	j	.L39
.L42:
	sub	a4,s1,a5
	sgtu	a5,a4,s1
	sub	s1,a2,a3
	sub	s1,s1,a5
	sw	a4,0(sp)
	or	a5,a4,s1
	bne	a5,zero,.L49
	li	a5,1
	sw	a5,0(sp)
	li	s1,0
.L49:
	mv	a1,s0
	li	a0,6
	call	ioe_read
	lw	a4,0(s0)
	lw	a5,12(sp)
	lw	a3,4(s0)
	lw	a2,16(sp)
	sub	a5,a4,a5
	sgtu	a4,a5,a4
	sub	a3,a3,a2
	mv	s0,a5
	sub	a5,a3,a4
	sw	a5,12(sp)
	sw	zero,8(sp)
	lla	a5,.LC4
	j	.L48
.L44:
	lla	a0,.LC16
	call	printf
	j	.L46
.L65:
	lla	a1,.LC7
	mv	a0,s1
	call	strcmp
	li	a5,1
	sw	a5,4(sp)
	beq	a0,zero,.L41
	lla	a1,.LC8
	mv	a0,s1
	call	strcmp
	li	a5,2
	sw	a5,4(sp)
	beq	a0,zero,.L41
	lla	a1,.LC9
	mv	a0,s1
	call	strcmp
	li	a5,3
	sw	a5,4(sp)
	beq	a0,zero,.L41
	mv	a1,s1
	lla	a0,.LC10
	call	printf
	li	a0,1
	call	halt
	.size	main, .-main
	.section	.text.bench_exit,"ax",@progbits
	.align	2
	.globl	bench_exit
	.hidden	bench_exit
	.type	bench_exit, @function
bench_exit:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	halt
	.size	bench_exit, .-bench_exit
	.section	.text.bench_obuf_init,"ax",@progbits
	.align	2
	.globl	bench_obuf_init
	.hidden	bench_obuf_init
	.type	bench_obuf_init, @function
bench_obuf_init:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a0
	mv	a0,a1
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s1,a1
	call	malloc
	lw	ra,8(sp)
	sw	s1,8(s0)
	sw	a0,0(s0)
	sw	zero,4(s0)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	bench_obuf_init, .-bench_obuf_init
	.section	.rodata.bench_obuf_append.str1.4,"aMS",@progbits,1
	.align	2
.LC19:
	.string	"AM Panic: "
	.align	2
.LC20:
	.string	"Assertion `o->p != ((void *)0)' failed"
	.align	2
.LC21:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/libbench/bench.c:168  \n"
	.section	.text.bench_obuf_append,"ax",@progbits
	.align	2
	.globl	bench_obuf_append
	.hidden	bench_obuf_append
	.type	bench_obuf_append, @function
bench_obuf_append:
	addi	sp,sp,-20
	lw	a3,4(a0)
	sw	s0,12(sp)
	lw	s0,8(a0)
	sw	s1,8(sp)
	sw	ra,16(sp)
	sub	a5,s0,a3
	mv	s1,a0
	mv	a4,a1
	lw	a0,0(a0)
	blt	a5,a2,.L84
.L71:
	mv	a1,a4
	add	a0,a0,a3
	sw	a2,0(sp)
	call	memcpy
	lw	a5,4(s1)
	lw	a2,0(sp)
	lw	ra,16(sp)
	lw	s0,12(sp)
	add	a5,a5,a2
	sw	a5,4(s1)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L84:
	sub	a5,a2,a5
	add	a5,a5,s0
.L83:
	slli	s0,s0,1
	bgt	a5,s0,.L83
	mv	a1,s0
	sw	a2,4(sp)
	sw	a4,0(sp)
	call	realloc
	sw	a0,0(s1)
	lw	a4,0(sp)
	lw	a2,4(sp)
	beq	a0,zero,.L85
	lw	a3,4(s1)
	sw	s0,8(s1)
	j	.L71
.L85:
	lla	s0,.LC19
	li	a0,65
.L75:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L75
	lla	s0,.LC20
	li	a0,65
.L76:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L76
	lla	s0,.LC21
	li	a0,32
.L77:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L77
	li	a0,1
	call	halt
	.size	bench_obuf_append, .-bench_obuf_append
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.word	1284865837
	.word	1481765933
	.section	.bss.buf.0,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	buf.0, @object
	.size	buf.0, 128
buf.0:
	.zero	128
	.section	.sdata.seed,"aw"
	.align	3
	.set	.LANCHOR1,. + 0
	.type	seed, @object
	.size	seed, 8
seed:
	.word	1
	.word	0
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
