#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"main.c"
	.option nopic
	.text
	.section	.rodata.pmem_read.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Error: memory access out of bound!\n"
	.section	.text.pmem_read,"ax",@progbits
	.align	2
	.globl	pmem_read
	.hidden	pmem_read
	.type	pmem_read, @function
pmem_read:
	addi	sp,sp,-12
	li	a5,-2147483648
	sw	s0,4(sp)
	add	s0,a0,a5
	sw	ra,8(sp)
	andi	s0,s0,-4
	la a5, .LANCHOR0; lw a5, 0(a5);
	bgeu	s0,a5,.L5
	la a5, .LANCHOR1; lw a5, 0(a5);
	lw	ra,8(sp)
	add	a5,a5,s0
	lw	s0,4(sp)
	lw	a0,0(a5)
	addi	sp,sp,12
	jr	ra
.L5:
	lla	a0,.LC0
	call	printf
	li	a0,1
	call	bench_exit
	la a5, .LANCHOR1; lw a5, 0(a5);
	lw	ra,8(sp)
	add	a5,a5,s0
	lw	s0,4(sp)
	lw	a0,0(a5)
	addi	sp,sp,12
	jr	ra
	.size	pmem_read, .-pmem_read
	.section	.rodata.pmem_write.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"%c"
	.section	.text.pmem_write,"ax",@progbits
	.align	2
	.globl	pmem_write
	.hidden	pmem_write
	.type	pmem_write, @function
pmem_write:
	li	a5,268435456
	beq	a0,a5,.L17
	li	a5,-2147483648
	addi	sp,sp,-16
	add	a0,a0,a5
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	andi	a4,a0,-4
	la a5, .LANCHOR0; lw a5, 0(a5);
	mv	s1,a1
	mv	s0,a2
	bgeu	a4,a5,.L18
.L8:
	la a5, .LANCHOR1; lw a5, 0(a5);
	addi	a3,a5,4
	add	a3,a3,a4
	add	a5,a5,a4
.L10:
	andi	a4,s0,1
	beq	a4,zero,.L9
	sb	s1,0(a5)
.L9:
	addi	a5,a5,1
	srli	s0,s0,1
	srai	s1,s1,8
	bne	a5,a3,.L10
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L18:
	lla	a0,.LC0
	sw	a4,0(sp)
	call	printf
	li	a0,1
	call	bench_exit
	lw	a4,0(sp)
	j	.L8
.L17:
	lla	a0,.LC1
	tail	printf
	.size	pmem_write, .-pmem_write
	.section	.text.set_commit,"ax",@progbits
	.align	2
	.globl	set_commit
	.hidden	set_commit
	.type	set_commit, @function
set_commit:
	lla	t1,.LANCHOR2
	snez	t0,a0
	sb	t0,0(t1)
	beq	a0,zero,.L19
	snez	a5,a5
	lbu	a0,4(sp)
	sb	a5,2(t1)
	lw	a5,0(sp)
	snez	a3,a3
	snez	a0,a0
	sw	a1,12(t1)
	sw	a2,16(t1)
	sb	a3,1(t1)
	sw	a4,4(t1)
	sw	a5,8(t1)
	sb	a0,3(t1)
.L19:
	ret
	.size	set_commit, .-set_commit
	.section	.text.NPCTrap,"ax",@progbits
	.align	2
	.globl	NPCTrap
	.hidden	NPCTrap
	.type	NPCTrap, @function
NPCTrap:
	lla	t1,.LANCHOR2
	snez	t0,a0
	sb	t0,0(t1)
	beq	a0,zero,.L24
	snez	a5,a5
	lbu	a0,4(sp)
	sb	a5,2(t1)
	lw	a5,0(sp)
	snez	a3,a3
	snez	a0,a0
	sw	a1,12(t1)
	sw	a2,16(t1)
	sb	a3,1(t1)
	sw	a4,4(t1)
	sw	a5,8(t1)
	sb	a0,3(t1)
.L24:
	ret
	.size	NPCTrap, .-NPCTrap
	.section	.text.SimDMEM,"ax",@progbits
	.align	2
	.globl	SimDMEM
	.hidden	SimDMEM
	.type	SimDMEM, @function
SimDMEM:
	addi	sp,sp,-28
	sw	s1,16(sp)
	sw	ra,24(sp)
	sw	s0,20(sp)
	lbu	s1,28(sp)
	li	t1,0
	bne	a0,zero,.L37
	sw	t1,0(a2)
	bne	a3,zero,.L38
.L29:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L37:
	li	a0,-2147483648
	add	s0,a1,a0
	andi	s0,s0,-4
	la a1, .LANCHOR0; lw a1, 0(a1);
	bgeu	s0,a1,.L39
.L31:
	la a1, .LANCHOR1; lw a1, 0(a1);
	add	a1,a1,s0
	lw	t1,0(a1)
	sw	t1,0(a2)
	beq	a3,zero,.L29
.L38:
	lw	s0,20(sp)
	lw	ra,24(sp)
	mv	a2,s1
	lw	s1,16(sp)
	mv	a1,a5
	mv	a0,a4
	addi	sp,sp,28
	tail	pmem_write
.L39:
	lla	a0,.LC0
	sw	a5,12(sp)
	sw	a4,8(sp)
	sw	a3,4(sp)
	sw	a2,0(sp)
	call	printf
	li	a0,1
	call	bench_exit
	lw	a5,12(sp)
	lw	a4,8(sp)
	lw	a3,4(sp)
	lw	a2,0(sp)
	j	.L31
	.size	SimDMEM, .-SimDMEM
	.section	.rodata.bench_init.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"AM Panic: "
	.align	2
.LC3:
	.string	"Assertion `pmem != ((void *)0)' failed"
	.align	2
.LC4:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/301.gsim/main.c:112  \n"
	.align	2
.LC5:
	.string	"Assertion `fp' failed"
	.align	2
.LC6:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/301.gsim/main.c:37  \n"
	.align	2
.LC7:
	.string	"r"
	.align	2
.LC8:
	.string	"image size = %d\n"
	.section	.text.bench_init,"ax",@progbits
	.align	2
	.globl	bench_init
	.hidden	bench_init
	.type	bench_init, @function
bench_init:
	addi	sp,sp,-12
	sw	s0,4(sp)
	slli	a0,a0,5
	lla	s0,.LANCHOR4
	add	s0,s0,a0
	lw	a1,4(s0)
	sw	s1,0(sp)
	sw	ra,8(sp)
	lla	s1,.LANCHOR0
	li	a0,1
	la a5, .LANCHOR3; sw s0, 0(a5);
	sw	a1,0(s1)
	call	calloc
	lla	a5,.LANCHOR1
	sw	a0,0(a5)
	beq	a0,zero,.L57
	lw	a0,0(s0)
	lla	a1,.LC7
	call	fopen
	mv	s0,a0
	lla	a5,.LANCHOR1
	beq	a0,zero,.L58
	lw	a0,0(a5)
	lw	a2,0(s1)
	mv	a3,s0
	li	a1,1
	call	fread
	mv	s1,a0
	mv	a0,s0
	call	fclose
	mv	a1,s1
	lla	a0,.LC8
	call	printf
	la a5, .LANCHOR5; sw zero, 0(a5);
	lla	a5,.LANCHOR6
	lw	s0,4(sp)
	li	a3,0
	li	a4,0
	sw	a3,0(a5)
	sw	a4,4(a5)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a5,.LANCHOR7
	sw	a3,0(a5)
	sw	a4,4(a5)
	addi	sp,sp,12
	tail	STop_init
.L57:
	lla	s0,.LC2
	li	a0,65
.L42:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L42
	lla	s0,.LC3
	li	a0,65
.L43:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L43
	lla	s0,.LC4
	li	a0,32
.L44:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L44
.L49:
	li	a0,1
	call	halt
.L58:
	lla	s0,.LC2
	li	a0,65
.L46:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L46
	lla	s0,.LC5
	li	a0,65
.L47:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L47
	lla	s0,.LC6
	li	a0,32
.L48:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L48
	j	.L49
	.size	bench_init, .-bench_init
	.section	.rodata.bench_run.str1.4,"aMS",@progbits,1
	.align	2
.LC9:
	.string	"\033[1;32mHIT GOOD TRAP\033[0m"
	.align	2
.LC10:
	.string	"\033[1;31mHIT BAD TRAP\033[0m"
	.align	2
.LC11:
	.string	"No instructions commit in %d cycles, maybe get stuck!\n"
	.align	2
.LC12:
	.string	"npc: %s\n"
	.align	2
.LC13:
	.string	"Jump to 0. Maybe there is an exception.\n"
	.section	.text.bench_run,"ax",@progbits
	.align	2
	.globl	bench_run
	.hidden	bench_run
	.type	bench_run, @function
bench_run:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	ra,16(sp)
	sw	s1,8(sp)
	call	bench_uptime
	mv	a4,a0
	lla	a3,.LANCHOR8
	li	a0,1
	sw	a4,0(a3)
	sw	a1,4(a3)
	li	s0,10
	call	set_reset
.L60:
	addi	s0,s0,-1
	call	step
	bne	s0,zero,.L60
	li	a0,0
	call	set_reset
	lla	s0,.LANCHOR6
	sw	zero,0(sp)
	sw	zero,4(sp)
	lla	s1,.LANCHOR2
	j	.L64
.L78:
	bgtu	a2,t1,.L70
	lbu	a2,0(s1)
	bne	a2,zero,.L77
.L64:
	call	step
	lw	a5,0(s0)
	lw	a2,4(s0)
	lw	a3,0(sp)
	addi	a4,a5,1
	sltu	a5,a4,a5
	add	a5,a5,a2
	sub	a2,a4,a3
	lw	a3,4(sp)
	sw	a4,0(s0)
	sw	a5,4(s0)
	sub	a0,a5,a3
	sgtu	a1,a2,a4
	li	t1,100
	beq	a0,a1,.L78
.L70:
	li	a1,100
	lla	a0,.LC11
	call	printf
	li	a5,2
	la a4, .LANCHOR5; sw a5, 0(a4);
.L63:
	call	bench_uptime
	lla	a3,.LANCHOR8
	lw	a4,0(a3)
	lw	a5,4(a3)
	lw	ra,16(sp)
	sub	a4,a0,a4
	lw	s0,12(sp)
	sgtu	a0,a4,a0
	sub	a5,a1,a5
	sub	a5,a5,a0
	sw	a5,4(a3)
	sw	a4,0(a3)
	la a5, .LANCHOR3; lw a5, 0(a5);
	lw	a0,24(a5)
	lw	a1,28(a5)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L77:
	lla	a1,.LANCHOR7
	lw	a2,0(a1)
	lw	t0,4(a1)
	lbu	t1,1(s1)
	addi	a0,a2,1
	sltu	a2,a0,a2
	add	a2,a2,t0
	sw	a0,0(a1)
	sw	a2,4(a1)
	bne	t1,zero,.L79
	lw	a2,16(s1)
	sw	a4,0(sp)
	sw	a5,4(sp)
	bne	a2,zero,.L64
	lla	a0,.LC13
	call	printf
	li	a5,3
	la a4, .LANCHOR5; sw a5, 0(a4);
	j	.L63
.L79:
	lw	a5,4(s1)
	lla	a1,.LC9
	la a4, .LANCHOR5; sw a5, 0(a4);
	beq	a5,zero,.L66
	lla	a1,.LC10
.L66:
	lla	a0,.LC12
	call	printf
	j	.L63
	.size	bench_run, .-bench_run
	.globl	__udivdi3
	.section	.rodata.bench_validate.str1.4,"aMS",@progbits,1
	.align	2
.LC14:
	.string	"finish after %lld cycles, %lld us, simulation freq = %lld Hz\n"
	.align	2
.LC15:
	.string	"#inst = %lld, IPC = %lld * 10^{-3}\n"
	.section	.text.bench_validate,"ax",@progbits
	.align	2
	.globl	bench_validate
	.hidden	bench_validate
	.type	bench_validate, @function
bench_validate:
	addi	sp,sp,-36
	sw	s1,24(sp)
	lla	s1,.LANCHOR6
	lw	t0,4(s1)
	sw	s0,28(sp)
	lw	s0,0(s1)
	slli	a5,t0,5
	sw	ra,32(sp)
	slli	a3,s0,5
	srli	a2,s0,27
	sub	a4,a3,s0
	or	a5,a2,a5
	sub	a5,a5,t0
	sgtu	a3,a4,a3
	sub	a3,a5,a3
	srli	a1,a4,26
	slli	a2,a4,6
	slli	a5,a3,6
	sub	a4,a2,a4
	or	a5,a1,a5
	sgtu	a2,a4,a2
	sub	a5,a5,a3
	sub	a5,a5,a2
	slli	a1,a4,3
	slli	a5,a5,3
	srli	a4,a4,29
	add	a0,a1,s0
	or	a5,a4,a5
	lla	a4,.LANCHOR8
	lw	t1,0(a4)
	lw	t2,4(a4)
	add	a5,a5,t0
	sltu	a1,a0,a1
	add	a1,a1,a5
	slli	a1,a1,6
	srli	a5,a0,26
	mv	a2,t1
	mv	a3,t2
	or	a1,a5,a1
	slli	a0,a0,6
	sw	t0,12(sp)
	sw	t1,4(sp)
	sw	t2,8(sp)
	call	__udivdi3
	lw	t2,8(sp)
	lw	t0,12(sp)
	lw	t1,4(sp)
	mv	ra,a1
	mv	a4,t2
	mv	a2,t0
	sw	ra,0(sp)
	mv	a5,a0
	mv	a3,t1
	mv	a1,s0
	lla	a0,.LC14
	sw	ra,20(sp)
	sw	a5,16(sp)
	call	printf
	lla	a5,.LANCHOR7
	lw	s0,0(a5)
	lw	t1,4(a5)
	lw	a2,0(s1)
	slli	a1,s0,5
	srli	a0,s0,27
	slli	a5,t1,5
	sub	a4,a1,s0
	or	a5,a0,a5
	sgtu	a1,a4,a1
	sub	a5,a5,t1
	sub	a5,a5,a1
	slli	a5,a5,2
	slli	a1,a4,2
	srli	a4,a4,30
	add	a0,a1,s0
	or	a5,a4,a5
	add	a5,a5,t1
	sltu	a1,a0,a1
	lw	a3,4(s1)
	add	a1,a1,a5
	slli	a1,a1,3
	srli	a5,a0,29
	or	a1,a5,a1
	slli	a0,a0,3
	sw	t1,4(sp)
	call	__udivdi3
	lw	t1,4(sp)
	mv	a3,a0
	mv	a4,a1
	mv	a2,t1
	mv	a1,s0
	lla	a0,.LC15
	call	printf
	lla	s0,.LANCHOR1
	lw	a0,0(s0)
	la a1, .LANCHOR0; lw a1, 0(a1);
	add	a1,a0,a1
	call	bench_checksum
	mv	a5,a0
	lw	a0,0(s0)
	mv	s0,a5
	call	free
	la a5, .LANCHOR5; lw a5, 0(a5);
	li	a0,1
	bne	a5,zero,.L80
	la a5, .LANCHOR3; lw a5, 0(a5);
	lw	a3,8(a5)
	lw	a4,0(s1)
	beq	a3,a4,.L85
.L83:
	li	a0,1
.L80:
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
.L85:
	lw	a3,12(a5)
	lw	a4,4(s1)
	bne	a3,a4,.L83
	lw	a0,16(a5)
	lw	ra,32(sp)
	lw	s1,24(sp)
	sub	a0,a0,s0
	lw	s0,28(sp)
	snez	a0,a0
	addi	sp,sp,36
	jr	ra
	.size	bench_validate, .-bench_validate
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC16:
	.string	"input/test-putch-asm.bin"
	.align	2
.LC17:
	.string	"input/train-hello-riscv32e-npc.bin"
	.align	2
.LC18:
	.string	"input/ref-microbench-test-riscv32e-npc.bin"
	.align	2
.LC19:
	.string	"input/huge-microbench-train-riscv32e-npc.bin"
	.section	.bss.commit,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	commit, @object
	.size	commit, 20
commit:
	.zero	20
	.section	.rodata.settings,"a"
	.align	3
	.set	.LANCHOR4,. + 0
	.type	settings, @object
	.size	settings, 128
settings:
	.word	.LC16
	.word	64
	.word	23
	.word	0
	.word	-1853900770
	.zero	4
	.word	0
	.word	0
	.word	.LC17
	.word	36864
	.word	702
	.word	0
	.word	1001044276
	.zero	4
	.word	96
	.word	0
	.word	.LC18
	.word	102400
	.word	1526121
	.word	0
	.word	396847796
	.zero	4
	.word	194814
	.word	0
	.word	.LC19
	.word	378880
	.word	504772696
	.word	0
	.word	495292014
	.zero	4
	.word	68625476
	.word	0
	.section	.sbss.cycles,"aw",@nobits
	.align	3
	.set	.LANCHOR6,. + 0
	.type	cycles, @object
	.size	cycles, 8
cycles:
	.zero	8
	.section	.sbss.exit_code,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	exit_code, @object
	.size	exit_code, 4
exit_code:
	.zero	4
	.section	.sbss.insts,"aw",@nobits
	.align	3
	.set	.LANCHOR7,. + 0
	.type	insts, @object
	.size	insts, 8
insts:
	.zero	8
	.section	.sbss.pmem,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	pmem, @object
	.size	pmem, 4
pmem:
	.zero	4
	.section	.sbss.pmem_size,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	pmem_size, @object
	.size	pmem_size, 4
pmem_size:
	.zero	4
	.section	.sbss.ps,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	ps, @object
	.size	ps, 4
ps:
	.zero	4
	.section	.sbss.t,"aw",@nobits
	.align	3
	.set	.LANCHOR8,. + 0
	.type	t, @object
	.size	t, 8
t:
	.zero	8
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
