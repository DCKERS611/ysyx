#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"bench.c"
	.option nopic
	.text
	.globl	__umoddi3
	.globl	__udivdi3
	.section	.rodata.format_time.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"%d.000"
	.globl	__moddi3
	.globl	__divdi3
	.section	.text.format_time,"ax",@progbits
	.align	2
	.type	format_time, @function
format_time:
	addi	sp,sp,-16
	li	a2,1000
	li	a3,0
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a1
	mv	s1,a0
	call	__umoddi3
	mv	a5,a0
	mv	a4,a1
	li	a2,1000
	li	a3,0
	mv	a0,s1
	mv	a1,s0
	mv	s1,a5
	mv	s0,a4
	call	__udivdi3
	mv	a3,a1
	mv	a2,a0
	lla	a1,.LC0
	lla	a0,.LANCHOR0
	call	sprintf
	addi	a0,a0,-1
	lla	a5,.LANCHOR0
	add	a5,a5,a0
	or	a3,s0,s1
	sw	a5,0(sp)
	beq	a3,zero,.L2
.L8:
	li	a2,10
	li	a3,0
	mv	a0,s1
	mv	a1,s0
	call	__umoddi3
	lw	a5,0(sp)
	addi	t1,a0,48
	mv	a1,s0
	mv	a0,s1
	li	a2,10
	li	a3,0
	sb	t1,0(a5)
	call	__udivdi3
	lw	a5,0(sp)
	mv	a3,s0
	mv	a2,s1
	addi	a5,a5,-1
	sw	a5,0(sp)
	mv	s1,a0
	mv	s0,a1
	bne	a3,zero,.L8
	li	a5,9
	bgtu	a2,a5,.L8
.L2:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	lla	a0,.LANCHOR0
	addi	sp,sp,16
	jr	ra
	.size	format_time, .-format_time
	.section	.rodata.main.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"ref"
	.align	2
.LC2:
	.string	"PASS"
	.align	2
.LC3:
	.string	"FAIL"
	.align	2
.LC4:
	.string	"Empty mainargs. Use \"ref\" by default\n"
	.align	2
.LC5:
	.string	""
	.align	2
.LC6:
	.string	"test"
	.align	2
.LC7:
	.string	"train"
	.align	2
.LC8:
	.string	"huge"
	.align	2
.LC9:
	.string	"Invalid mainargs: \"%s\"; must be in {test, train, ref, huge}\n"
	.align	2
.LC10:
	.string	"======= Running MicroBench [input *%s*] =======\n"
	.align	2
.LC11:
	.string	"[%s] %s: "
	.align	2
.LC12:
	.string	"(insufficient memory)"
	.align	2
.LC13:
	.string	"Ignored %s\n"
	.align	2
.LC14:
	.string	"*"
	.align	2
.LC15:
	.string	" Passed."
	.align	2
.LC16:
	.string	" Failed."
	.globl	__muldi3
	.align	2
.LC17:
	.string	"\n"
	.align	2
.LC18:
	.string	"  min time: %s ms [%d]\n"
	.align	2
.LC19:
	.string	"==================================================\n"
	.align	2
.LC20:
	.string	"MicroBench %s"
	.globl	__udivsi3
	.align	2
.LC21:
	.string	"        %d Marks\n"
	.align	2
.LC22:
	.string	"i9-9900K @ 3.60GHz"
	.align	2
.LC23:
	.string	"                   vs. %d Marks (%s)\n"
	.align	2
.LC24:
	.string	"Scored time: %s ms\n"
	.align	2
.LC25:
	.string	"Total  time: %s ms\n"
	.align	2
.LC26:
	.string	"X"
	.section	.text.startup.main,"ax",@progbits
	.align	2
	.globl	main
	.hidden	main
	.type	main, @function
main:
	addi	sp,sp,-76
	sw	s1,64(sp)
	addi	a5,sp,59
	sw	ra,72(sp)
	sw	s0,68(sp)
	andi	s1,a5,-8
	beq	a0,zero,.L15
	lla	a1,.LC5
	mv	s0,a0
	call	strcmp
	beq	a0,zero,.L15
.L14:
	lla	a1,.LC6
	mv	a0,s0
	call	strcmp
	sw	a0,28(sp)
	beq	a0,zero,.L16
	lla	a1,.LC7
	mv	a0,s0
	call	strcmp
	li	a5,1
	sw	a5,28(sp)
	bne	a0,zero,.L56
.L16:
	call	ioe_init
	mv	a1,s0
	lla	a0,.LC10
	call	printf
	mv	a1,s1
	li	a0,6
	call	ioe_read
	lw	a5,28(sp)
	sw	zero,20(sp)
	sw	zero,24(sp)
	addi	a4,a5,1
	lw	a5,0(s1)
	slli	a4,a4,4
	addi	a3,a4,-16
	sw	a5,44(sp)
	lw	a5,4(s1)
	sw	a3,4(sp)
	addi	a4,a4,4
	li	a3,1
	sw	a5,48(sp)
	sw	a3,32(sp)
	lla	a5,.LANCHOR1
	sw	zero,40(sp)
	sw	a4,8(sp)
	lla	s0,heap
	j	.L26
.L17:
	lla	a0,.LC11
	sw	a5,0(sp)
	call	printf
	lla	a1,.LC12
	lla	a0,.LC13
	call	printf
	lw	a5,0(sp)
.L20:
	addi	a5,a5,84
	lla	a4,.LANCHOR1+840
	beq	a4,a5,.L57
.L26:
	lw	a3,4(sp)
	lw	a1,8(sp)
	lw	a2,0(s0)
	lw	a4,4(s0)
	add	a3,a5,a3
	lw	a3,24(a3)
	add	a1,a1,a5
	lla	a0,.LANCHOR2
	lla	t1,.LANCHOR3
	sw	a1,0(t1)
	sub	a4,a4,a2
	sw	a5,0(a0)
	lw	a1,12(a5)
	lw	a2,16(a5)
	bltu	a4,a3,.L17
	lla	a0,.LC11
	sw	a5,16(sp)
	call	printf
	lla	a0,.LANCHOR2
	lw	a3,0(a0)
	lw	a4,0(s0)
	lla	a5,.LANCHOR4
	lw	a3,0(a3)
	addi	a4,a4,7
	andi	a4,a4,-8
	sw	a4,0(a5)
	jalr	a3
	mv	a1,s1
	li	a0,6
	call	ioe_read
	lla	a0,.LANCHOR2
	lw	a4,0(a0)
	lw	t0,0(s1)
	lw	t1,4(s1)
	lw	a4,4(a4)
	sw	t0,12(sp)
	sw	t1,0(sp)
	jalr	a4
	mv	a1,s1
	li	a0,6
	call	ioe_read
	lla	a0,.LANCHOR2
	lw	a4,0(s1)
	lw	t0,12(sp)
	lw	a2,0(a0)
	lw	t1,0(sp)
	lw	a3,4(s1)
	sub	a5,a4,t0
	lw	a2,8(a2)
	sgtu	a4,a5,a4
	sub	a3,a3,t1
	sw	a5,12(sp)
	sub	a5,a3,a4
	sw	a5,0(sp)
	jalr	a2
	lw	a5,16(sp)
	beq	a0,zero,.L58
	sw	a0,16(sp)
	lla	a0,.LC14
	sw	a5,36(sp)
	call	printf
	lw	a5,20(sp)
	lw	a4,12(sp)
	lw	a0,24(sp)
	lw	a2,0(sp)
	add	a3,a5,a4
	lw	a4,16(sp)
	sltu	a1,a3,a5
	add	a2,a0,a2
	sw	a3,20(sp)
	add	a3,a1,a2
	andi	a4,a4,1
	sw	a3,24(sp)
	lw	a5,36(sp)
	beq	a4,zero,.L21
	lla	a0,.LC15
	sw	a5,16(sp)
	call	printf
	lw	a5,12(sp)
	lw	a2,0(sp)
	sw	zero,36(sp)
	or	a4,a5,a2
	lw	a5,16(sp)
	beq	a4,zero,.L22
	sw	a5,16(sp)
	lla	a5,.LANCHOR3
	lw	a4,0(a5)
	li	a2,98304
	addi	a2,a2,1696
	lw	a0,8(a4)
	li	a3,0
	li	a1,0
	call	__muldi3
	lw	a2,12(sp)
	lw	a3,0(sp)
	call	__udivdi3
	lw	a4,40(sp)
	sw	a0,36(sp)
	add	a5,a4,a0
	sw	a5,40(sp)
	lw	a5,16(sp)
.L22:
	lla	a0,.LC17
	sw	a5,16(sp)
	call	printf
	lw	a4,28(sp)
	lw	a5,16(sp)
	beq	a4,zero,.L20
	lw	a1,0(sp)
	lw	a0,12(sp)
	call	format_time
	lw	a2,36(sp)
	mv	a1,a0
	lla	a0,.LC18
	call	printf
	lw	a5,16(sp)
	lla	a4,.LANCHOR1+840
	addi	a5,a5,84
	bne	a4,a5,.L26
.L57:
	mv	a1,s1
	li	a0,6
	call	ioe_read
	lw	a5,0(s1)
	lw	a4,44(sp)
	lw	s0,4(s1)
	lla	a0,.LC19
	sub	s1,a5,a4
	lw	a4,48(sp)
	sgtu	a5,s1,a5
	sub	s0,s0,a4
	sub	s0,s0,a5
	call	printf
	lw	a5,32(sp)
	lla	a1,.LC2
	beq	a5,zero,.L59
.L27:
	lla	a0,.LC20
	call	printf
	lw	a4,28(sp)
	li	a5,1
	ble	a4,a5,.L28
	lw	a0,40(sp)
	li	a1,10
	call	__udivsi3
	mv	a1,a0
	lla	a0,.LC21
	call	printf
	li	a1,98304
	lla	a2,.LC22
	addi	a1,a1,1696
	lla	a0,.LC23
	call	printf
.L29:
	lw	a1,24(sp)
	lw	a0,20(sp)
	call	format_time
	mv	a1,a0
	lla	a0,.LC24
	call	printf
	mv	a1,s0
	mv	a0,s1
	call	format_time
	mv	a1,a0
	lla	a0,.LC25
	call	printf
	lw	a5,32(sp)
	lw	ra,72(sp)
	lw	s0,68(sp)
	lw	s1,64(sp)
	xori	a0,a5,1
	addi	sp,sp,76
	jr	ra
.L15:
	lla	a0,.LC4
	call	printf
	lla	s0,.LC1
	j	.L14
.L58:
	lla	a0,.LC26
	sw	a5,16(sp)
	call	printf
	lw	a5,20(sp)
	lw	a4,12(sp)
	lw	a3,0(sp)
	add	a4,a5,a4
	sltu	a2,a4,a5
	lw	a5,24(sp)
	sw	a4,20(sp)
	add	a3,a5,a3
	add	a5,a2,a3
	sw	a5,24(sp)
	lw	a5,16(sp)
.L21:
	lla	a0,.LC16
	sw	a5,16(sp)
	call	printf
	lw	a5,16(sp)
	sw	zero,32(sp)
	sw	zero,36(sp)
	j	.L22
.L59:
	lla	a1,.LC3
	j	.L27
.L28:
	lla	a0,.LC17
	call	printf
	j	.L29
.L56:
	lla	a1,.LC1
	mv	a0,s0
	call	strcmp
	li	a5,2
	sw	a5,28(sp)
	beq	a0,zero,.L16
	lla	a1,.LC8
	mv	a0,s0
	call	strcmp
	li	a5,3
	sw	a5,28(sp)
	beq	a0,zero,.L16
	mv	a1,s0
	lla	a0,.LC9
	call	printf
	li	a0,1
	call	halt
	.size	main, .-main
	.section	.rodata.bench_alloc.str1.4,"aMS",@progbits,1
	.align	2
.LC27:
	.string	"AM Panic: "
	.align	2
.LC28:
	.string	"Assertion `(uintptr_t)heap.start <= (uintptr_t)hbrk && (uintptr_t)hbrk < (uintptr_t)heap.end' failed"
	.align	2
.LC29:
	.string	" @ /home/ysyx/ysyx-workbench/am-kernels/benchmarks/microbench/src/bench.c:161  \n"
	.align	2
.LC30:
	.string	"Assertion `(uintptr_t)hbrk - (uintptr_t)heap.start <= setting->mlim' failed"
	.align	2
.LC31:
	.string	" @ /home/ysyx/ysyx-workbench/am-kernels/benchmarks/microbench/src/bench.c:165  \n"
	.section	.text.bench_alloc,"ax",@progbits
	.align	2
	.globl	bench_alloc
	.hidden	bench_alloc
	.type	bench_alloc, @function
bench_alloc:
	lla	a1,.LANCHOR4
	lw	a3,0(a1)
	addi	a4,a0,7
	lla	a5,heap
	addi	sp,sp,-12
	andi	a4,a4,-8
	lw	a2,0(a5)
	sw	ra,8(sp)
	sw	s0,4(sp)
	add	a4,a3,a4
	sw	a4,0(a1)
	bgtu	a2,a4,.L73
	lw	a5,4(a5)
	bleu	a5,a4,.L73
	mv	a5,a3
	beq	a4,a3,.L63
.L62:
	li	a0,0
	li	a1,0
	sw	a0,0(a5)
	sw	a1,4(a5)
	addi	a5,a5,8
	bne	a4,a5,.L62
.L63:
	la a5, .LANCHOR3; lw a5, 0(a5);
	lw	a5,4(a5)
	sub	a4,a4,a2
	bgtu	a4,a5,.L84
	lw	ra,8(sp)
	lw	s0,4(sp)
	mv	a0,a3
	addi	sp,sp,12
	jr	ra
.L73:
	lla	s0,.LC27
	li	a0,65
.L64:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L64
	lla	s0,.LC28
	li	a0,65
.L65:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L65
	lla	s0,.LC29
	li	a0,32
.L66:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L66
.L71:
	li	a0,1
	call	halt
.L84:
	lla	s0,.LC27
	li	a0,65
.L68:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L68
	lla	s0,.LC30
	li	a0,65
.L69:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L69
	lla	s0,.LC31
	li	a0,32
.L70:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L70
	j	.L71
	.size	bench_alloc, .-bench_alloc
	.section	.text.bench_free,"ax",@progbits
	.align	2
	.globl	bench_free
	.hidden	bench_free
	.type	bench_free, @function
bench_free:
	ret
	.size	bench_free, .-bench_free
	.section	.text.bench_srand,"ax",@progbits
	.align	2
	.globl	bench_srand
	.hidden	bench_srand
	.type	bench_srand, @function
bench_srand:
	slli	a0,a0,17
	srli	a0,a0,17
	la a5, .LANCHOR5; sw a0, 0(a5);
	ret
	.size	bench_srand, .-bench_srand
	.section	.text.bench_rand,"ax",@progbits
	.align	2
	.globl	bench_rand
	.hidden	bench_rand
	.type	bench_rand, @function
bench_rand:
	lla	a4,.LANCHOR5
	lw	a3,0(a4)
	slli	a5,a3,1
	add	a5,a5,a3
	slli	a5,a5,2
	add	a5,a5,a3
	slli	a5,a5,4
	add	a5,a5,a3
	slli	a5,a5,8
	sub	a5,a5,a3
	slli	a5,a5,2
	add	a5,a5,a3
	li	a3,2531328
	addi	a3,a3,-317
	add	a5,a5,a3
	slli	a0,a5,1
	sw	a5,0(a4)
	srli	a0,a0,17
	ret
	.size	bench_rand, .-bench_rand
	.section	.text.checksum,"ax",@progbits
	.align	2
	.globl	checksum
	.hidden	checksum
	.type	checksum, @function
checksum:
	addi	a2,a0,4
	bleu	a1,a2,.L92
	li	a5,-2128830464
	addi	a5,a5,-571
.L91:
	mv	a3,a0
.L90:
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
	bne	a2,a3,.L90
	addi	a2,a2,4
	addi	a0,a0,4
	bgtu	a1,a2,.L91
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
.L92:
	li	a0,-1494220800
	addi	a0,a0,1950
	ret
	.size	checksum, .-checksum
	.hidden	benchmarks
	.globl	benchmarks
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC32:
	.string	"qsort"
	.align	2
.LC33:
	.string	"Quick sort"
	.align	2
.LC34:
	.string	"queen"
	.align	2
.LC35:
	.string	"Queen placement"
	.align	2
.LC36:
	.string	"bf"
	.align	2
.LC37:
	.string	"Brainf**k interpreter"
	.align	2
.LC38:
	.string	"fib"
	.align	2
.LC39:
	.string	"Fibonacci number"
	.align	2
.LC40:
	.string	"sieve"
	.align	2
.LC41:
	.string	"Eratosthenes sieve"
	.align	2
.LC42:
	.string	"15pz"
	.align	2
.LC43:
	.string	"A* 15-puzzle search"
	.align	2
.LC44:
	.string	"dinic"
	.align	2
.LC45:
	.string	"Dinic's maxflow algorithm"
	.align	2
.LC46:
	.string	"lzip"
	.align	2
.LC47:
	.string	"Lzip compression"
	.align	2
.LC48:
	.string	"ssort"
	.align	2
.LC49:
	.string	"Suffix sort"
	.align	2
.LC50:
	.string	"md5"
	.align	2
.LC51:
	.string	"MD5 digest"
	.hidden	setting
	.globl	setting
	.hidden	current
	.globl	current
	.section	.bss.buf.0,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	buf.0, @object
	.size	buf.0, 32
buf.0:
	.zero	32
	.section	.data.benchmarks,"aw"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	benchmarks, @object
	.size	benchmarks, 840
benchmarks:
	.word	bench_qsort_prepare
	.word	bench_qsort_run
	.word	bench_qsort_validate
	.word	.LC32
	.word	.LC33
	.word	100
	.word	1024
	.word	0
	.word	138834181
	.word	30000
	.word	131072
	.word	0
	.word	-1544970268
	.word	100000
	.word	655360
	.word	4404
	.word	-309526647
	.word	4000000
	.word	16777216
	.word	227620
	.word	-434665675
	.word	bench_queen_prepare
	.word	bench_queen_run
	.word	bench_queen_validate
	.word	.LC34
	.word	.LC35
	.word	8
	.word	0
	.word	0
	.word	92
	.word	11
	.word	0
	.word	0
	.word	2680
	.word	12
	.word	0
	.word	4069
	.word	14200
	.word	15
	.word	0
	.word	819996
	.word	2279184
	.word	bench_bf_prepare
	.word	bench_bf_run
	.word	bench_bf_validate
	.word	.LC36
	.word	.LC37
	.word	2
	.word	32768
	.word	0
	.word	-1494218850
	.word	25
	.word	32768
	.word	0
	.word	-1466987931
	.word	180
	.word	32768
	.word	16815
	.word	-1843273037
	.word	1360
	.word	32768
	.word	771535
	.word	-615908386
	.word	bench_fib_prepare
	.word	bench_fib_run
	.word	bench_fib_validate
	.word	.LC38
	.word	.LC39
	.word	2
	.word	1024
	.word	0
	.word	2097077744
	.word	23
	.word	16384
	.word	0
	.word	-1800566784
	.word	91
	.word	262144
	.word	20168
	.word	-337879168
	.word	300
	.word	2097152
	.word	775012
	.word	-485855488
	.word	bench_sieve_prepare
	.word	bench_sieve_run
	.word	bench_sieve_validate
	.word	.LC40
	.word	.LC41
	.word	100
	.word	1024
	.word	0
	.word	25
	.word	200000
	.word	32768
	.word	0
	.word	17984
	.word	10000000
	.word	2097152
	.word	34823
	.word	664579
	.word	80000000
	.word	10485760
	.word	301058
	.word	4669382
	.word	bench_15pz_prepare
	.word	bench_15pz_run
	.word	bench_15pz_validate
	.word	.LC42
	.word	.LC43
	.word	0
	.word	1024
	.word	0
	.word	6
	.word	1
	.word	262144
	.word	0
	.word	45279
	.word	2
	.word	2097152
	.word	5360
	.word	428940
	.word	3
	.word	67108864
	.word	300634
	.word	16939850
	.word	bench_dinic_prepare
	.word	bench_dinic_run
	.word	bench_dinic_validate
	.word	.LC44
	.word	.LC45
	.word	10
	.word	8192
	.word	0
	.word	412
	.word	80
	.word	524288
	.word	0
	.word	20377
	.word	128
	.word	696320
	.word	8182
	.word	49736
	.word	190
	.word	2097152
	.word	671978
	.word	83605
	.word	bench_lzip_prepare
	.word	bench_lzip_run
	.word	bench_lzip_validate
	.word	.LC46
	.word	.LC47
	.word	128
	.word	131072
	.word	0
	.word	-530593742
	.word	50000
	.word	1048576
	.word	0
	.word	-594286324
	.word	1048576
	.word	4194304
	.word	6795
	.word	-1922906081
	.word	31457280
	.word	67108864
	.word	199541
	.word	461741430
	.word	bench_ssort_prepare
	.word	bench_ssort_run
	.word	bench_ssort_validate
	.word	.LC48
	.word	.LC49
	.word	100
	.word	4096
	.word	0
	.word	1280663049
	.word	10000
	.word	524288
	.word	0
	.word	230133915
	.word	100000
	.word	4194304
	.word	4002
	.word	1326101553
	.word	3000000
	.word	67108864
	.word	322232
	.word	-304358986
	.word	bench_md5_prepare
	.word	bench_md5_run
	.word	bench_md5_validate
	.word	.LC50
	.word	.LC51
	.word	100
	.word	1024
	.word	0
	.word	-117247345
	.word	200000
	.word	262144
	.word	0
	.word	-721830803
	.word	10000000
	.word	10485760
	.word	15199
	.word	656960066
	.word	64000000
	.word	67108864
	.word	97148
	.word	1101745504
	.section	.sbss.current,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	current, @object
	.size	current, 4
current:
	.zero	4
	.section	.sbss.hbrk,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	hbrk, @object
	.size	hbrk, 4
hbrk:
	.zero	4
	.section	.sbss.setting,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	setting, @object
	.size	setting, 4
setting:
	.zero	4
	.section	.sdata.seed,"aw"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	seed, @object
	.size	seed, 4
seed:
	.word	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
