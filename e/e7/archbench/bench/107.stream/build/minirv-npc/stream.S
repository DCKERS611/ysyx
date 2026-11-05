#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"stream.c"
	.option nopic
	.text
	.section	.text.bench_run,"ax",@progbits
	.align	2
	.globl	bench_run
	.hidden	bench_run
	.type	bench_run, @function
bench_run:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	lla	s1,times
	lla	s0,times+2400
.L10:
	call	bench_uptime
	lla	a3,.LANCHOR0
	mv	a5,a1
	lw	a1,0(a3)
	mv	a4,a0
	sw	a4,0(s1)
	sw	a5,4(s1)
	ble	a1,zero,.L2
	lla	a5,.LANCHOR1
	lw	a5,0(a5)
	slli	a1,a1,2
	la a4, .LANCHOR2; lw a4, 0(a4);
	add	a1,a1,a5
.L3:
	lw	a2,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a2,-4(a4)
	bne	a5,a1,.L3
.L2:
	call	bench_uptime
	lw	a5,0(s1)
	lw	a4,4(s1)
	sub	a5,a0,a5
	sgtu	a0,a5,a0
	sub	a1,a1,a4
	sub	a1,a1,a0
	sw	a5,0(s1)
	sw	a1,4(s1)
	call	bench_uptime
	lla	a5,.LANCHOR0
	lw	a4,0(a5)
	sw	a0,800(s1)
	sw	a1,804(s1)
	ble	a4,zero,.L4
	la a5, .LANCHOR2; lw a5, 0(a5);
	slli	a0,a4,2
	la a2, .LANCHOR3; lw a2, 0(a2);
	add	a0,a0,a5
.L5:
	lw	a1,0(a5)
	addi	a2,a2,4
	addi	a5,a5,4
	slli	a4,a1,1
	add	a4,a4,a1
	sw	a4,-4(a2)
	bne	a5,a0,.L5
.L4:
	call	bench_uptime
	lw	a5,800(s1)
	lw	a4,804(s1)
	sub	a5,a0,a5
	sgtu	a0,a5,a0
	sub	a1,a1,a4
	sub	a1,a1,a0
	sw	a5,800(s1)
	sw	a1,804(s1)
	call	bench_uptime
	lla	a5,.LANCHOR0
	lw	t1,0(a5)
	sw	a0,1600(s1)
	sw	a1,1604(s1)
	ble	t1,zero,.L6
	lla	a5,.LANCHOR1
	lw	a5,0(a5)
	slli	t1,t1,2
	la a1, .LANCHOR3; lw a1, 0(a1);
	la a2, .LANCHOR2; lw a2, 0(a2);
	add	t1,t1,a5
.L7:
	lw	a4,0(a5)
	lw	a0,0(a1)
	addi	a5,a5,4
	addi	a1,a1,4
	add	a4,a4,a0
	sw	a4,0(a2)
	addi	a2,a2,4
	bne	a5,t1,.L7
.L6:
	call	bench_uptime
	lw	a5,1600(s1)
	lw	a4,1604(s1)
	sub	a5,a0,a5
	sgtu	a0,a5,a0
	sub	a1,a1,a4
	sub	a1,a1,a0
	sw	a5,1600(s1)
	sw	a1,1604(s1)
	call	bench_uptime
	lla	a5,.LANCHOR0
	lw	t0,0(a5)
	sw	a0,0(s0)
	sw	a1,4(s0)
	ble	t0,zero,.L8
	lla	a5,.LANCHOR1
	lw	a1,0(a5)
	la a4, .LANCHOR3; lw a4, 0(a4);
	slli	t0,t0,2
	la a2, .LANCHOR2; lw a2, 0(a2);
	add	t0,t0,a4
.L9:
	lw	a0,0(a2)
	lw	t1,0(a4)
	addi	a4,a4,4
	slli	a5,a0,1
	add	a5,a5,a0
	add	a5,a5,t1
	sw	a5,0(a1)
	addi	a2,a2,4
	addi	a1,a1,4
	bne	t0,a4,.L9
.L8:
	call	bench_uptime
	lw	a5,0(s0)
	lw	a4,4(s0)
	addi	s1,s1,8
	sub	a5,a0,a5
	sgtu	a0,a5,a0
	sub	a1,a1,a4
	sub	a1,a1,a0
	sw	a5,0(s0)
	sw	a1,4(s0)
	lla	a5,times+800
	addi	s0,s0,8
	bne	s1,a5,.L10
	lw	ra,8(sp)
	lw	s0,4(sp)
	la a5, .LANCHOR4; lw a5, 0(a5);
	lw	a0,16(a5)
	lw	a1,20(a5)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	bench_run, .-bench_run
	.section	.text.checktick,"ax",@progbits
	.align	2
	.globl	checktick
	.hidden	checktick
	.type	checktick, @function
checktick:
	addi	sp,sp,-192
	addi	a5,sp,23
	andi	a5,a5,-8
	addi	a4,a5,160
	sw	ra,188(sp)
	sw	s0,184(sp)
	sw	s1,180(sp)
	sw	a5,4(sp)
	sw	a4,12(sp)
	sw	a5,8(sp)
.L23:
	call	bench_uptime
	mv	s0,a0
	sw	a1,0(sp)
	li	s1,10
.L19:
	call	bench_uptime
	addi	s1,s1,-1
	bne	s0,a0,.L20
	lw	a5,0(sp)
	bne	a5,a1,.L20
	bne	s1,zero,.L19
	addi	a5,a0,1
	sltu	a0,a5,a0
	add	a1,a0,a1
	mv	a0,a5
.L20:
	lw	a5,8(sp)
	lw	a4,12(sp)
	sw	a0,0(a5)
	sw	a1,4(a5)
	addi	a5,a5,8
	sw	a5,8(sp)
	bne	a5,a4,.L23
	lw	a5,4(sp)
	li	a0,999424
	addi	a0,a0,576
	addi	a3,a5,152
.L26:
	lw	a2,4(sp)
	lw	a4,0(a2)
	lw	a5,8(a2)
	addi	a2,a2,8
	sw	a2,4(sp)
	sub	a5,a5,a4
	not	a4,a5
	srai	a4,a4,31
	and	a5,a5,a4
	ble	a0,a5,.L25
	mv	a0,a5
.L25:
	lw	a5,4(sp)
	bne	a3,a5,.L26
	lw	ra,188(sp)
	lw	s0,184(sp)
	lw	s1,180(sp)
	addi	sp,sp,192
	jr	ra
	.size	checktick, .-checktick
	.section	.rodata.bench_init.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `a != ((void *)0)' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/107.stream/stream.c:218  \n"
	.align	2
.LC3:
	.string	"Assertion `b != ((void *)0)' failed"
	.align	2
.LC4:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/107.stream/stream.c:219  \n"
	.align	2
.LC5:
	.string	"Assertion `c != ((void *)0)' failed"
	.align	2
.LC6:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/107.stream/stream.c:220  \n"
	.align	2
.LC7:
	.string	"-------------------------------------------------------------\n"
	.align	2
.LC8:
	.string	"STREAM version $Revision: 5.10 $\n"
	.align	2
.LC9:
	.string	"This system uses %d bytes per array element.\n"
	.align	2
.LC10:
	.string	"Array size = %llu (elements), Offset = %d (elements)\n"
	.align	2
.LC11:
	.string	"Memory per array = %lld MiB (%lld KiB).\n"
	.align	2
.LC12:
	.string	"Total memory required = %lld MiB (%lld KiB).\n"
	.align	2
.LC13:
	.string	"Each kernel will be executed %d times.\n"
	.align	2
.LC14:
	.string	" The *best* time for each kernel (excluding the first iteration)\n"
	.align	2
.LC15:
	.string	" will be used to compute the reported bandwidth.\n"
	.align	2
.LC16:
	.string	"Your clock granularity/precision appears to be %d microseconds.\n"
	.align	2
.LC17:
	.string	"Your clock granularity appears to be less than one microsecond.\n"
	.align	2
.LC18:
	.string	"Each test below will take on the order of %d microseconds.\n"
	.globl	__udivdi3
	.align	2
.LC19:
	.string	"   (= %d clock ticks)\n"
	.align	2
.LC20:
	.string	"Increase the size of the arrays if this shows that\n"
	.align	2
.LC21:
	.string	"you are not getting at least 20 clock ticks per test.\n"
	.align	2
.LC22:
	.string	"WARNING -- The above is only a rough guideline.\n"
	.align	2
.LC23:
	.string	"For best results, please be sure you know the\n"
	.align	2
.LC24:
	.string	"precision of your system timer.\n"
	.section	.text.bench_init,"ax",@progbits
	.align	2
	.globl	bench_init
	.hidden	bench_init
	.type	bench_init, @function
bench_init:
	slli	a5,a0,1
	add	a5,a5,a0
	lla	a4,.LANCHOR5
	slli	a5,a5,3
	add	a5,a4,a5
	lw	a4,0(a5)
	addi	sp,sp,-24
	sw	ra,20(sp)
	sw	s0,16(sp)
	sw	s1,12(sp)
	lla	s0,.LANCHOR0
	slli	a0,a4,2
	sw	a4,0(s0)
	la a3, .LANCHOR4; sw a5, 0(a3);
	call	malloc
	lw	a5,0(s0)
	lla	s1,.LANCHOR1
	sw	a0,0(s1)
	slli	a0,a5,2
	call	malloc
	lw	a5,0(s0)
	lla	t0,.LANCHOR3
	sw	a0,0(t0)
	slli	a0,a5,2
	call	malloc
	lw	a5,0(s1)
	lla	t1,.LANCHOR2
	sw	a0,0(t1)
	beq	a5,zero,.L68
	lla	t0,.LANCHOR3
	lw	a5,0(t0)
	beq	a5,zero,.L69
	beq	a0,zero,.L70
	lw	a4,0(s0)
	lla	a3,.LANCHOR6
	lla	a0,.LC7
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,2
	slli	a4,a4,3
	sw	a4,0(a3)
	sw	a4,8(a3)
	sw	a5,16(a3)
	sw	a5,24(a3)
	la a2, .LANCHOR6+4; sw zero, 0(a2);
	la a4, .LANCHOR6+12; sw zero, 0(a4);
	la a4, .LANCHOR6+20; sw zero, 0(a4);
	la a5, .LANCHOR6+28; sw zero, 0(a5);
	call	printf
	lla	a0,.LC8
	call	printf
	lla	a0,.LC7
	call	printf
	li	a1,4
	lla	a0,.LC9
	call	printf
	lla	a0,.LC7
	call	printf
	lw	a1,0(s0)
	li	a3,0
	lla	a0,.LC10
	srai	a2,a1,31
	call	printf
	lw	a1,0(s0)
	lla	a0,.LC11
	srai	a2,a1,31
	srli	a5,a1,30
	slli	a2,a2,2
	or	a2,a5,a2
	slli	a1,a1,2
	slli	a5,a2,12
	srli	a4,a1,10
	slli	a3,a2,22
	srli	a1,a1,20
	or	a3,a3,a4
	or	a1,a5,a1
	srli	a4,a2,10
	srli	a2,a2,20
	call	printf
	lw	a5,0(s0)
	lla	a0,.LC12
	srai	a3,a5,31
	srli	a1,a5,31
	slli	a2,a5,1
	slli	a4,a3,1
	add	a5,a2,a5
	or	a4,a1,a4
	add	a4,a4,a3
	sltu	a2,a5,a2
	add	a2,a2,a4
	slli	a2,a2,2
	srli	a4,a5,30
	or	a2,a4,a2
	slli	a5,a5,2
	srli	a4,a5,10
	slli	a3,a2,22
	srli	a5,a5,20
	slli	a1,a2,12
	or	a3,a3,a4
	or	a1,a1,a5
	srli	a4,a2,10
	srli	a2,a2,20
	call	printf
	li	a1,100
	lla	a0,.LC13
	call	printf
	lla	a0,.LC14
	call	printf
	lla	a0,.LC15
	call	printf
	lw	a2,0(s0)
	lla	t0,.LANCHOR3
	lla	t1,.LANCHOR2
	ble	a2,zero,.L50
	lw	a5,0(s1)
	lw	a3,0(t0)
	lw	a4,0(t1)
	slli	a2,a2,2
	add	a2,a2,a5
	li	a0,1
	li	a1,2
.L49:
	sw	a0,0(a5)
	sw	a1,0(a3)
	sw	zero,0(a4)
	addi	a5,a5,4
	addi	a3,a3,4
	addi	a4,a4,4
	bne	a5,a2,.L49
.L50:
	lla	a0,.LC7
	call	printf
	call	checktick
	mv	a1,a0
	ble	a0,zero,.L71
	lla	a0,.LC16
	sw	a1,0(sp)
	call	printf
	lw	a5,0(sp)
	srai	a5,a5,31
	sw	a5,8(sp)
.L51:
	call	bench_uptime
	lw	a3,0(s0)
	mv	a2,a1
	mv	s0,a0
	ble	a3,zero,.L54
	lw	a5,0(s1)
	slli	a3,a3,2
	add	a3,a3,a5
.L53:
	lw	a4,0(a5)
	addi	a5,a5,4
	slli	a4,a4,1
	sw	a4,-4(a5)
	bne	a5,a3,.L53
.L54:
	sw	a2,4(sp)
	call	bench_uptime
	lw	a2,4(sp)
	sub	s0,a0,s0
	sgtu	a0,s0,a0
	sub	s1,a1,a2
	sub	s1,s1,a0
	mv	a1,s0
	lla	a0,.LC18
	call	printf
	lw	a2,0(sp)
	lw	a3,8(sp)
	mv	a0,s0
	mv	a1,s1
	call	__udivdi3
	mv	a1,a0
	lla	a0,.LC19
	call	printf
	lla	a0,.LC20
	call	printf
	lla	a0,.LC21
	call	printf
	lla	a0,.LC7
	call	printf
	lla	a0,.LC22
	call	printf
	lla	a0,.LC23
	call	printf
	lla	a0,.LC24
	call	printf
	lw	s0,16(sp)
	lw	ra,20(sp)
	lw	s1,12(sp)
	lla	a0,.LC7
	addi	sp,sp,24
	tail	printf
.L71:
	lla	a0,.LC17
	call	printf
	li	a5,1
	sw	a5,0(sp)
	sw	zero,8(sp)
	j	.L51
.L70:
	lla	s0,.LC0
	li	a0,65
.L43:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L43
	lla	s0,.LC5
	li	a0,65
.L44:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L44
	lla	s0,.LC6
	li	a0,32
.L45:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L45
.L41:
	li	a0,1
	call	halt
.L69:
	lla	s0,.LC0
	li	a0,65
.L38:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L38
	lla	s0,.LC3
	li	a0,65
.L39:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L39
	lla	s0,.LC4
	li	a0,32
.L40:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L40
	j	.L41
.L68:
	lla	s0,.LC0
	li	a0,65
.L34:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L34
	lla	s0,.LC1
	li	a0,65
.L35:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L35
	lla	s0,.LC2
	li	a0,32
.L36:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L36
	j	.L41
	.size	bench_init, .-bench_init
	.section	.rodata.checkSTREAMresults.str1.4,"aMS",@progbits,1
	.align	2
.LC25:
	.string	"Solution Validates: no error on all three arrays\n"
	.align	2
.LC26:
	.string	"Failed Validation on array a[]\n"
	.align	2
.LC27:
	.string	"     Expected Value: %d\n"
	.align	2
.LC28:
	.string	"         array a: index: %d, expected: %d, observed: %d\n"
	.align	2
.LC29:
	.string	"     For array a[], %d errors were found.\n"
	.align	2
.LC30:
	.string	"Failed Validation on array b[]\n"
	.align	2
.LC31:
	.string	"         array b: index: %d, expected: %d, observed: %d\n"
	.align	2
.LC32:
	.string	"     For array b[], %d errors were found.\n"
	.align	2
.LC33:
	.string	"Failed Validation on array c[]\n"
	.align	2
.LC34:
	.string	"         array c: index: %d, expected: %d, observed: %d\n"
	.align	2
.LC35:
	.string	"     For array c[], %d errors were found.\n"
	.align	2
.LC36:
	.string	"Results Validation Verbose Results: \n"
	.align	2
.LC37:
	.string	"    Expected a(1), b(1), c(1): %d %d %d \n"
	.align	2
.LC38:
	.string	"    Observed a(1), b(1), c(1): %d %d %d \n"
	.align	2
.LC39:
	.string	"    SumErr on a, b, c:         %lld %lld %lld \n"
	.section	.text.checkSTREAMresults,"ax",@progbits
	.align	2
	.globl	checkSTREAMresults
	.hidden	checkSTREAMresults
	.type	checkSTREAMresults, @function
checkSTREAMresults:
	addi	sp,sp,-68
	sw	s0,60(sp)
	sw	ra,64(sp)
	sw	s1,56(sp)
	li	a4,100
	li	s0,2
.L73:
	slli	s1,s0,1
	add	s1,s1,s0
	add	a5,s1,s0
	slli	s0,a5,1
	add	s0,s0,a5
	addi	a4,a4,-1
	add	s0,s0,s1
	bne	a4,zero,.L73
	lla	a4,.LANCHOR0
	lw	a4,0(a4)
	ble	a4,zero,.L74
	lla	a3,.LANCHOR1
	lw	a2,0(a3)
	slli	a4,a4,2
	lla	a3,.LANCHOR3
	add	a4,a4,a2
	lw	t2,0(a3)
	li	a1,0
	lla	a3,.LANCHOR2
	li	a0,0
	lw	t0,0(a3)
	sw	a4,28(sp)
	sw	s1,16(sp)
	li	a3,0
	sw	zero,12(sp)
	sw	zero,4(sp)
	li	a4,0
	sw	a5,20(sp)
	sw	s0,24(sp)
	sw	a0,8(sp)
	mv	s1,a1
.L75:
	lw	a5,0(a2)
	lw	t1,24(sp)
	lw	a1,0(t2)
	lw	a0,0(t0)
	sub	a5,a5,t1
	lw	t1,16(sp)
	add	a5,a4,a5
	sltu	a4,a5,a4
	sub	t1,a1,t1
	lw	a1,20(sp)
	add	t1,s1,t1
	addi	a2,a2,4
	sub	a1,a0,a1
	add	a1,a3,a1
	sltu	s0,a1,a3
	lw	a3,8(sp)
	sltu	a0,t1,s1
	addi	t2,t2,4
	add	a3,a4,a3
	lw	a4,4(sp)
	sw	a3,32(sp)
	sw	a3,8(sp)
	add	a0,a0,a4
	lw	a4,12(sp)
	sw	a0,36(sp)
	sw	a0,4(sp)
	lw	a0,28(sp)
	add	s0,s0,a4
	sw	s0,12(sp)
	mv	a4,a5
	mv	s1,t1
	mv	a3,a1
	addi	t0,t0,4
	bne	a0,a2,.L75
	lw	a0,8(sp)
	lw	s1,16(sp)
	sw	s0,28(sp)
	sw	a5,16(sp)
	lw	s0,24(sp)
	sw	a1,8(sp)
	sw	t1,24(sp)
	or	a4,a4,a0
	lw	a5,20(sp)
	bne	a4,zero,.L76
	lw	a2,4(sp)
	or	a4,t1,a2
	bne	a4,zero,.L77
	lw	a4,12(sp)
	or	a3,a1,a4
	bne	a3,zero,.L78
.L74:
	lw	s0,60(sp)
	lw	ra,64(sp)
	lw	s1,56(sp)
	lla	a0,.LC25
	addi	sp,sp,68
	tail	printf
.L77:
	lla	a0,.LC30
	sw	a5,12(sp)
	call	printf
	mv	a1,s1
	lla	a0,.LC27
	call	printf
	lla	a5,.LANCHOR0
	lw	a4,0(a5)
	lw	a5,12(sp)
	ble	a4,zero,.L91
	li	a4,0
	li	a1,0
	mv	a2,s1
	sw	s0,36(sp)
	li	t1,9
	mv	s1,a1
	sw	a5,20(sp)
	mv	s0,a4
	j	.L85
.L84:
	lla	a5,.LANCHOR0
	lw	a5,0(a5)
	addi	s1,s1,1
	ble	a5,s1,.L102
.L85:
	lla	a5,.LANCHOR3
	lw	a5,0(a5)
	slli	a3,s1,2
	add	a5,a5,a3
	lw	a3,0(a5)
	beq	a3,a2,.L84
	addi	s0,s0,1
	bgt	s0,t1,.L84
	mv	a1,s1
	lla	a0,.LC31
	sw	a2,12(sp)
	call	printf
	lla	a5,.LANCHOR0
	lw	a5,0(a5)
	addi	s1,s1,1
	lw	a2,12(sp)
	li	t1,9
	bgt	a5,s1,.L85
.L102:
	mv	a4,s0
	lw	a5,20(sp)
	lw	s0,36(sp)
	mv	s1,a2
.L83:
	mv	a1,a4
	lla	a0,.LC32
	sw	a5,12(sp)
	call	printf
	lw	a5,8(sp)
	lw	a4,28(sp)
	or	a4,a5,a4
	lw	a5,12(sp)
	beq	a4,zero,.L82
.L78:
	lla	a0,.LC33
	sw	a5,12(sp)
	call	printf
	lw	a5,12(sp)
	lla	a0,.LC27
	mv	a1,a5
	call	printf
	lla	a5,.LANCHOR0
	lw	a4,0(a5)
	lw	a5,12(sp)
	ble	a4,zero,.L92
	li	a4,0
	li	a1,0
	sw	s1,20(sp)
	sw	s0,36(sp)
	li	t1,9
	mv	s1,a1
	mv	a2,a5
	mv	s0,a4
	j	.L89
.L88:
	lla	a5,.LANCHOR0
	lw	a5,0(a5)
	addi	s1,s1,1
	ble	a5,s1,.L103
.L89:
	lla	a5,.LANCHOR2
	lw	a3,0(a5)
	slli	a5,s1,2
	add	a3,a3,a5
	lw	a3,0(a3)
	beq	a3,a2,.L88
	addi	s0,s0,1
	bgt	s0,t1,.L88
	mv	a1,s1
	lla	a0,.LC34
	sw	a2,12(sp)
	call	printf
	lla	a5,.LANCHOR0
	lw	a5,0(a5)
	addi	s1,s1,1
	lw	a2,12(sp)
	li	t1,9
	bgt	a5,s1,.L89
.L103:
	mv	a4,s0
	lw	s1,20(sp)
	lw	s0,36(sp)
	mv	a5,a2
.L87:
	mv	a1,a4
	lla	a0,.LC35
	sw	a5,12(sp)
	call	printf
	lw	a5,12(sp)
.L82:
	lla	a0,.LC36
	sw	a5,12(sp)
	call	printf
	lw	a5,12(sp)
	mv	a2,s1
	mv	a1,s0
	mv	a3,a5
	lla	a0,.LC37
	call	printf
	lla	a5,.LANCHOR2
	lw	a3,0(a5)
	lla	a5,.LANCHOR3
	lw	a4,0(a5)
	lla	a5,.LANCHOR1
	lw	a5,0(a5)
	lw	a2,4(a4)
	lw	a3,4(a3)
	lw	a1,4(a5)
	lla	a0,.LC38
	call	printf
	lw	t1,28(sp)
	lw	a5,8(sp)
	lw	a3,24(sp)
	lw	a4,4(sp)
	lw	a1,16(sp)
	lw	a2,32(sp)
	sw	t1,0(sp)
	lla	a0,.LC39
	sw	a5,48(sp)
	sw	t1,52(sp)
	call	printf
	lw	ra,64(sp)
	lw	s0,60(sp)
	lw	s1,56(sp)
	addi	sp,sp,68
	jr	ra
.L76:
	lla	a0,.LC26
	sw	t1,20(sp)
	sw	a5,12(sp)
	call	printf
	mv	a1,s0
	lla	a0,.LC27
	call	printf
	lla	a5,.LANCHOR0
	lw	a4,0(a5)
	lw	t1,20(sp)
	lw	a5,12(sp)
	ble	a4,zero,.L90
	li	a4,0
	li	a1,0
	sw	s1,20(sp)
	mv	a2,s0
	li	t0,9
	mv	s1,a1
	sw	a5,40(sp)
	mv	s0,a4
	sw	t1,44(sp)
	j	.L81
.L80:
	lla	a5,.LANCHOR0
	lw	a5,0(a5)
	addi	s1,s1,1
	ble	a5,s1,.L104
.L81:
	lla	a5,.LANCHOR1
	lw	a5,0(a5)
	slli	a3,s1,2
	add	a5,a5,a3
	lw	a3,0(a5)
	beq	a3,a2,.L80
	addi	s0,s0,1
	bgt	s0,t0,.L80
	mv	a1,s1
	lla	a0,.LC28
	sw	a2,12(sp)
	call	printf
	lla	a5,.LANCHOR0
	lw	a5,0(a5)
	addi	s1,s1,1
	lw	a2,12(sp)
	li	t0,9
	bgt	a5,s1,.L81
.L104:
	lw	s1,20(sp)
	lw	a5,40(sp)
	lw	t1,44(sp)
	mv	a4,s0
	mv	s0,a2
.L79:
	mv	a1,a4
	lla	a0,.LC29
	sw	t1,20(sp)
	sw	a5,12(sp)
	call	printf
	lw	a5,36(sp)
	lw	t1,20(sp)
	or	t1,t1,a5
	lw	a5,12(sp)
	bne	t1,zero,.L77
	lw	a3,8(sp)
	lw	a2,28(sp)
	or	a4,a3,a2
	bne	a4,zero,.L78
	sw	a3,24(sp)
	sw	a2,4(sp)
	j	.L82
.L90:
	li	a4,0
	j	.L79
.L91:
	li	a4,0
	j	.L83
.L92:
	li	a4,0
	j	.L87
	.size	checkSTREAMresults, .-checkSTREAMresults
	.section	.rodata.bench_validate.str1.4,"aMS",@progbits,1
	.align	2
.LC40:
	.string	"Copy:      "
	.align	2
.LC41:
	.string	"Function    Best Rate KB/s  Avg time(us) Min time(us) Max time(us)\n"
	.align	2
.LC42:
	.string	"%s%12lld  %11lld  %11lld  %11lld\n"
	.section	.text.bench_validate,"ax",@progbits
	.align	2
	.globl	bench_validate
	.hidden	bench_validate
	.type	bench_validate, @function
bench_validate:
	addi	sp,sp,-60
	sw	s0,52(sp)
	sw	s1,48(sp)
	sw	ra,56(sp)
	lla	s1,times+8
	lla	s0,.LANCHOR7+32
.L106:
	lla	a5,.LANCHOR7
	sw	a5,16(sp)
	lla	a1,.LANCHOR8
	lla	a2,.LANCHOR9
	mv	t1,s1
	mv	a4,a5
.L112:
	lw	a3,0(a4)
	lw	t2,0(t1)
	lw	ra,4(a4)
	lw	a0,4(t1)
	add	t0,a3,t2
	sltu	a3,t0,a3
	add	ra,ra,a0
	lw	a5,4(a1)
	add	a3,a3,ra
	sw	a3,4(a4)
	sw	t0,0(a4)
	lw	a3,0(a1)
	bgtu	a5,a0,.L108
	beq	a5,a0,.L121
.L107:
	or	t0,a3,a5
	bne	t0,zero,.L109
	li	a3,1
	li	a5,0
.L109:
	lw	t0,4(a2)
	sw	a5,4(a1)
	sw	a3,0(a1)
	lw	a5,0(a2)
	bgtu	a0,t0,.L111
	beq	a0,t0,.L122
.L110:
	sw	a5,0(a2)
	sw	t0,4(a2)
	addi	a4,a4,8
	addi	t1,t1,800
	addi	a1,a1,8
	addi	a2,a2,8
	bne	a4,s0,.L112
	addi	s1,s1,8
	lla	a5,times+800
	bne	s1,a5,.L106
	lla	a0,.LC41
	call	printf
	li	s1,0
	lla	t2,.LC40
.L115:
	lw	t1,16(sp)
	li	a2,99
	li	a3,0
	lw	a0,0(t1)
	lw	a1,4(t1)
	sw	t2,36(sp)
	slli	s0,s1,1
	call	__udivdi3
	lla	a3,.LANCHOR6
	add	a3,a3,s0
	lw	ra,4(a3)
	mv	a4,a0
	lw	a0,0(a3)
	lla	a3,.LANCHOR8
	add	a3,a3,s0
	lw	t1,4(a3)
	lw	t0,0(a3)
	mv	a5,a1
	mv	a3,t1
	sw	t1,28(sp)
	lw	t1,16(sp)
	slli	ra,ra,10
	srli	a1,a0,22
	mv	a2,t0
	sw	a4,0(t1)
	sw	a5,4(t1)
	or	a1,a1,ra
	slli	a0,a0,10
	sw	t0,32(sp)
	sw	a4,24(sp)
	sw	a5,20(sp)
	call	__udivdi3
	lla	a5,.LANCHOR9
	add	s0,a5,s0
	lw	ra,4(s0)
	lw	t1,28(sp)
	lw	t0,32(sp)
	lw	t2,36(sp)
	mv	a2,a0
	lw	a0,0(s0)
	lw	a4,24(sp)
	lw	a5,20(sp)
	mv	a3,a1
	sw	a0,8(sp)
	sw	t1,4(sp)
	mv	a1,t2
	sw	ra,12(sp)
	sw	t0,0(sp)
	lla	a0,.LC42
	sw	t1,44(sp)
	sw	t0,40(sp)
	call	printf
	lw	t1,16(sp)
	addi	s1,s1,4
	lla	a4,.LANCHOR10
	addi	a3,t1,8
	li	a5,16
	sw	a3,16(sp)
	add	a4,a4,s1
	beq	s1,a5,.L114
	lw	t2,0(a4)
	j	.L115
.L122:
	bleu	t2,a5,.L110
.L111:
	mv	a5,t2
	mv	t0,a0
	j	.L110
.L121:
	bleu	a3,t2,.L107
.L108:
	mv	a3,t2
	mv	a5,a0
	j	.L107
.L114:
	lla	a0,.LC7
	call	printf
	call	checkSTREAMresults
	lla	a0,.LC7
	call	printf
	lla	s0,.LANCHOR0
	lw	a5,0(s0)
	la a0, .LANCHOR1; lw a0, 0(a0);
	slli	a5,a5,2
	add	a1,a0,a5
	call	bench_checksum
	lw	a5,0(s0)
	mv	s1,a0
	la a0, .LANCHOR3; lw a0, 0(a0);
	slli	a5,a5,2
	add	a1,a0,a5
	call	bench_checksum
	lw	a5,0(s0)
	mv	a4,a0
	la a0, .LANCHOR2; lw a0, 0(a0);
	slli	a5,a5,2
	add	a1,a0,a5
	mv	s0,a4
	call	bench_checksum
	la a4, .LANCHOR4; lw a4, 0(a4);
	lw	a3,4(a4)
	mv	a5,a0
	li	a0,1
	beq	a3,s1,.L123
.L105:
	lw	ra,56(sp)
	lw	s0,52(sp)
	lw	s1,48(sp)
	addi	sp,sp,60
	jr	ra
.L123:
	lw	a3,8(a4)
	bne	a3,s0,.L105
	lw	a0,12(a4)
	lw	ra,56(sp)
	lw	s0,52(sp)
	sub	a0,a0,a5
	lw	s1,48(sp)
	snez	a0,a0
	addi	sp,sp,60
	jr	ra
	.size	bench_validate, .-bench_validate
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC43:
	.string	"Scale:     "
	.align	2
.LC44:
	.string	"Add:       "
	.align	2
.LC45:
	.string	"Triad:     "
	.section	.bss.avgtime,"aw",@nobits
	.align	3
	.set	.LANCHOR7,. + 0
	.type	avgtime, @object
	.size	avgtime, 32
avgtime:
	.zero	32
	.section	.bss.bytes,"aw",@nobits
	.align	3
	.set	.LANCHOR6,. + 0
	.type	bytes, @object
	.size	bytes, 32
bytes:
	.zero	32
	.section	.bss.maxtime,"aw",@nobits
	.align	3
	.set	.LANCHOR9,. + 0
	.type	maxtime, @object
	.size	maxtime, 32
maxtime:
	.zero	32
	.section	.bss.times,"aw",@nobits
	.align	3
	.type	times, @object
	.size	times, 3200
times:
	.zero	3200
	.section	.data.mintime,"aw"
	.align	3
	.set	.LANCHOR8,. + 0
	.type	mintime, @object
	.size	mintime, 32
mintime:
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.section	.rodata.label,"a"
	.align	2
	.set	.LANCHOR10,. + 0
	.type	label, @object
	.size	label, 16
label:
	.word	.LC40
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.section	.rodata.settings,"a"
	.align	3
	.set	.LANCHOR5,. + 0
	.type	settings, @object
	.size	settings, 96
settings:
	.word	4
	.word	1887079191
	.word	-136223103
	.word	-1390598210
	.word	0
	.word	0
	.word	3000
	.word	-1038785313
	.word	1050069753
	.word	1284917615
	.word	270
	.word	0
	.word	4000000
	.word	542166282
	.word	1030465904
	.word	-1075854882
	.word	469729
	.word	0
	.word	200000000
	.word	2072908886
	.word	1283704593
	.word	1409865985
	.word	28553508
	.word	0
	.section	.sbss.STREAM_ARRAY_SIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	STREAM_ARRAY_SIZE, @object
	.size	STREAM_ARRAY_SIZE, 4
STREAM_ARRAY_SIZE:
	.zero	4
	.section	.sbss.a,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	a, @object
	.size	a, 4
a:
	.zero	4
	.section	.sbss.b,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	b, @object
	.size	b, 4
b:
	.zero	4
	.section	.sbss.c,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	c, @object
	.size	c, 4
c:
	.zero	4
	.section	.sbss.ps,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	ps, @object
	.size	ps, 4
ps:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
