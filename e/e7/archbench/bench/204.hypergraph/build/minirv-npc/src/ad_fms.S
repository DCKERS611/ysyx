#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ad_fms.c"
	.option nopic
	.text
	.section	.rodata.bench_init.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `cells != ((void *)0)' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/204.hypergraph/src/ad_fms.c:75  \n"
	.align	2
.LC3:
	.string	"Assertion `cells_info != ((void *)0)' failed"
	.align	2
.LC4:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/204.hypergraph/src/ad_fms.c:77  \n"
	.align	2
.LC5:
	.string	"Assertion `cells_info[i].mgain != ((void *)0)' failed"
	.align	2
.LC6:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/204.hypergraph/src/ad_fms.c:80  \n"
	.align	2
.LC7:
	.string	"Assertion `cells_info[i].partb_ptr != ((void *)0)' failed"
	.align	2
.LC8:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/204.hypergraph/src/ad_fms.c:82  \n"
	.align	2
.LC9:
	.string	"Assertion `cells_info[i].partb_gain_inx != ((void *)0)' failed"
	.align	2
.LC10:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/204.hypergraph/src/ad_fms.c:84  \n"
	.align	2
.LC11:
	.string	"Assertion `nets != ((void *)0)' failed"
	.align	2
.LC12:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/204.hypergraph/src/ad_fms.c:88  \n"
	.align	2
.LC13:
	.string	"Assertion `nets_info != ((void *)0)' failed"
	.align	2
.LC14:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/204.hypergraph/src/ad_fms.c:90  \n"
	.align	2
.LC15:
	.string	"Assertion `nets[i].npartdeg != ((void *)0)' failed"
	.align	2
.LC16:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/204.hypergraph/src/ad_fms.c:93  \n"
	.align	2
.LC17:
	.string	"Assertion `nets_info[i].npartdeg != ((void *)0)' failed"
	.align	2
.LC18:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/204.hypergraph/src/ad_fms.c:95  \n"
	.align	2
.LC19:
	.string	"Assertion `cnets != ((void *)0)' failed"
	.align	2
.LC20:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/204.hypergraph/src/ad_fms.c:100  \n"
	.align	2
.LC21:
	.string	"Assertion `ncells != ((void *)0)' failed"
	.align	2
.LC22:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/204.hypergraph/src/ad_fms.c:103  \n"
	.align	2
.LC23:
	.string	"Assertion `pop[i].chrom != ((void *)0)' failed"
	.align	2
.LC24:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/204.hypergraph/src/ad_fms.c:107  \n"
	.align	2
.LC25:
	.string	"Assertion `pop[i].parts != ((void *)0)' failed"
	.align	2
.LC26:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/204.hypergraph/src/ad_fms.c:109  \n"
	.align	2
.LC27:
	.string	"Assertion `mcells != ((void *)0)' failed"
	.align	2
.LC28:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/204.hypergraph/src/ad_fms.c:114  \n"
	.align	2
.LC29:
	.string	"SEED = %ld fname = %s\n"
	.globl	__mulsi3
	.section	.text.bench_init,"ax",@progbits
	.align	2
	.globl	bench_init
	.hidden	bench_init
	.type	bench_init, @function
bench_init:
	slli	a5,a0,1
	add	a5,a5,a0
	slli	a4,a5,3
	lla	a5,.LANCHOR1
	addi	sp,sp,-88
	add	a5,a5,a4
	lw	a4,4(a5)
	sw	s0,80(sp)
	lw	s0,0(a5)
	sw	ra,84(sp)
	la a3, .LANCHOR0; sw a5, 0(a3);
	sw	s1,76(sp)
	lla	a5,.LANCHOR2
	li	a0,1
	sw	a4,0(a5)
	sw	s0,52(sp)
	call	randomize
	mv	a1,a0
	mv	a2,s0
	lla	a0,.LC29
	call	printf
	addi	a3,sp,60
	lla	a2,.LANCHOR3
	lla	a1,.LANCHOR4
	mv	a0,s0
	call	read_hgraph_size
	lla	a5,.LANCHOR4
	lw	a0,0(a5)
	li	a1,16
	call	calloc
	sw	a0,48(sp)
	la a5, .LANCHOR5; sw a0, 0(a5);
	beq	a0,zero,.L129
	lla	s0,.LANCHOR4
	lw	a0,0(s0)
	li	a1,20
	call	calloc
	la a5, .LANCHOR6; sw a0, 0(a5);
	beq	a0,zero,.L67
	lw	a5,0(s0)
	ble	a5,zero,.L26
	lla	a5,.LANCHOR2
	lw	a5,0(a5)
	addi	s0,a0,8
	sw	zero,36(sp)
	sw	a5,40(sp)
	addi	s1,a5,-1
.L25:
	lw	a0,40(sp)
	li	a1,4
	call	calloc
	sw	a0,0(s0)
	beq	a0,zero,.L130
	li	a1,4
	mv	a0,s1
	call	calloc
	sw	a0,4(s0)
	beq	a0,zero,.L131
	li	a1,4
	mv	a0,s1
	call	calloc
	sw	a0,8(s0)
	beq	a0,zero,.L132
	lw	a4,36(sp)
	lla	a5,.LANCHOR4
	lw	a5,0(a5)
	addi	a4,a4,1
	sw	a4,36(sp)
	addi	s0,s0,20
	bgt	a5,a4,.L25
.L26:
	lla	a5,.LANCHOR3
	lw	a0,0(a5)
	li	a1,16
	call	calloc
	sw	a0,44(sp)
	la a5, .LANCHOR7; sw a0, 0(a5);
	beq	a0,zero,.L133
	lla	s0,.LANCHOR3
	lw	a0,0(s0)
	li	a1,4
	call	calloc
	la a5, .LANCHOR8; sw a0, 0(a5);
	beq	a0,zero,.L69
	lw	a5,0(s0)
	ble	a5,zero,.L44
	lla	a5,.LANCHOR2
	lw	s1,0(a5)
	lw	a5,44(sp)
	sw	a0,36(sp)
	sw	zero,40(sp)
	addi	s0,a5,12
.L43:
	li	a1,4
	mv	a0,s1
	call	calloc
	sw	a0,0(s0)
	beq	a0,zero,.L134
	li	a1,4
	mv	a0,s1
	call	calloc
	lw	a5,36(sp)
	sw	a0,0(a5)
	beq	a0,zero,.L135
	lw	a4,40(sp)
	lw	a3,36(sp)
	lla	a5,.LANCHOR3
	lw	a5,0(a5)
	addi	a4,a4,1
	addi	a3,a3,4
	sw	a4,40(sp)
	sw	a3,36(sp)
	addi	s0,s0,16
	bgt	a5,a4,.L43
.L44:
	lw	a0,60(sp)
	li	a1,4
	call	calloc
	la a5, .LANCHOR9; sw a0, 0(a5);
	mv	s1,a0
	beq	a0,zero,.L136
	lw	a0,60(sp)
	li	a1,4
	call	calloc
	la a5, .LANCHOR10; sw a0, 0(a5);
	mv	s0,a0
	beq	a0,zero,.L137
	lla	a5,.LANCHOR4
	lw	a0,0(a5)
	li	a1,4
	call	calloc
	lla	a5,.LANCHOR11
	sw	a0,0(a5)
	beq	a0,zero,.L138
	lla	a5,.LANCHOR2
	lw	a4,0(a5)
	li	a1,20
	mv	a0,a4
	sw	a4,36(sp)
	call	calloc
	lla	a5,.LANCHOR11
	sw	a0,4(a5)
	beq	a0,zero,.L71
	lla	a5,.LANCHOR4
	lw	a0,0(a5)
	li	a1,16
	call	calloc
	la a5, .LANCHOR12; sw a0, 0(a5);
	lw	a4,36(sp)
	beq	a0,zero,.L139
	lw	t1,44(sp)
	lla	a5,.LANCHOR3
	lw	a2,0(a5)
	lla	a5,.LANCHOR4
	lw	a1,0(a5)
	sw	t1,24(sp)
	lw	t1,48(sp)
	lw	a3,60(sp)
	lw	a0,52(sp)
	sw	t1,20(sp)
	addi	t1,sp,72
	sw	t1,16(sp)
	lla	t1,.LANCHOR14
	sw	t1,12(sp)
	addi	t1,sp,68
	sw	t1,8(sp)
	addi	t1,sp,64
	sw	t1,4(sp)
	lla	t1,.LANCHOR15
	lla	a5,.LANCHOR13
	sw	t1,0(sp)
	sw	s1,28(sp)
	sw	s0,32(sp)
	call	read_hgraph
	lw	a1,72(sp)
	lw	a0,64(sp)
	call	__mulsi3
	lla	a5,.LANCHOR2
	lw	a4,0(a5)
	slli	s1,a0,1
	mv	a5,a0
	addi	a3,s1,1
	slli	a0,a4,2
	sw	a4,52(sp)
	mv	s1,a4
	sw	a3,44(sp)
	la a4, .LANCHOR16; sw a5, 0(a4);
	la a5, .LANCHOR17; sw a3, 0(a5);
	call	malloc
	la a5, .LANCHOR18; sw a0, 0(a5);
	ble	s1,zero,.L66
	lw	a5,52(sp)
	sw	a0,36(sp)
	sw	zero,48(sp)
	addi	a5,a5,-1
	sw	a5,40(sp)
	slli	a5,a5,4
	sw	a5,56(sp)
.L65:
	lw	a0,56(sp)
	call	malloc
	lw	a4,36(sp)
	mv	a5,a0
	sw	a0,0(a4)
	lw	a4,40(sp)
	beq	a4,zero,.L63
	li	s0,0
	j	.L64
.L140:
	lw	a5,36(sp)
	lw	a5,0(a5)
.L64:
	lw	a0,44(sp)
	slli	a3,s0,4
	li	a1,4
	add	s1,a5,a3
	call	calloc
	lw	a5,40(sp)
	sw	a0,0(s1)
	addi	s0,s0,1
	bne	a5,s0,.L140
.L63:
	lw	a4,36(sp)
	lw	a5,48(sp)
	addi	a4,a4,4
	sw	a4,36(sp)
	lw	a4,52(sp)
	addi	a5,a5,1
	sw	a5,48(sp)
	bne	a4,a5,.L65
.L66:
	lw	a5,52(sp)
	slli	a0,a5,4
	call	malloc
	lw	ra,84(sp)
	lw	s0,80(sp)
	la a5, .LANCHOR19; sw a0, 0(a5);
	lw	s1,76(sp)
	addi	sp,sp,88
	jr	ra
.L130:
	lla	s0,.LC0
	li	a0,65
.L14:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L14
	lla	s0,.LC5
	li	a0,65
.L15:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L15
	lla	s0,.LC6
	li	a0,32
.L16:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L16
.L12:
	li	a0,1
	call	halt
.L132:
	lla	s0,.LC0
	li	a0,65
.L22:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L22
	lla	s0,.LC9
	li	a0,65
.L23:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L23
	lla	s0,.LC10
	li	a0,32
.L24:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L24
	j	.L12
.L131:
	lla	s0,.LC0
	li	a0,65
.L18:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L18
	lla	s0,.LC7
	li	a0,65
.L19:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L19
	lla	s0,.LC8
	li	a0,32
.L20:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L20
	j	.L12
.L135:
	lla	s0,.LC0
	li	a0,65
.L40:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L40
	lla	s0,.LC17
	li	a0,65
.L41:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L41
	lla	s0,.LC18
	li	a0,32
.L42:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L42
	j	.L12
.L134:
	lla	s0,.LC0
	li	a0,65
.L36:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L36
	lla	s0,.LC15
	li	a0,65
.L37:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L37
	lla	s0,.LC16
	li	a0,32
.L38:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L38
	j	.L12
.L67:
	lla	s0,.LC0
	li	a0,65
.L6:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L6
	lla	s0,.LC3
	li	a0,65
.L10:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L10
	lla	s0,.LC4
	li	a0,32
.L11:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L11
	j	.L12
.L69:
	lla	s0,.LC0
	li	a0,65
.L29:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L29
	lla	s0,.LC13
	li	a0,65
.L33:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L33
	lla	s0,.LC14
	li	a0,32
.L34:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L34
	j	.L12
.L129:
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
	j	.L12
.L137:
	lla	s0,.LC0
	li	a0,65
.L48:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L48
	lla	s0,.LC21
	li	a0,65
.L49:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L49
	lla	s0,.LC22
	li	a0,32
.L50:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L50
	j	.L12
.L71:
	lla	s0,.LC0
	li	a0,65
.L54:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L54
	lla	s0,.LC25
	li	a0,65
.L57:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L57
	lla	s0,.LC26
	li	a0,32
.L58:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L58
	j	.L12
.L133:
	lla	s0,.LC0
	li	a0,65
.L8:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L8
	lla	s0,.LC11
	li	a0,65
.L27:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L27
	lla	s0,.LC12
	li	a0,32
.L28:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L28
	j	.L12
.L139:
	lla	s0,.LC0
	li	a0,65
.L55:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L55
	lla	s0,.LC27
	li	a0,65
.L60:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L60
	lla	s0,.LC28
	li	a0,32
.L61:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L61
	j	.L12
.L136:
	lla	s0,.LC0
	li	a0,65
.L31:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L31
	lla	s0,.LC19
	li	a0,65
.L45:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L45
	lla	s0,.LC20
	li	a0,32
.L46:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L46
	j	.L12
.L138:
	lla	s0,.LC0
	li	a0,65
.L51:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L51
	lla	s0,.LC23
	li	a0,65
.L52:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L52
	lla	s0,.LC24
	li	a0,32
.L53:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L53
	j	.L12
	.size	bench_init, .-bench_init
	.section	.rodata.bench_run.str1.4,"aMS",@progbits,1
	.align	2
.LC30:
	.string	"pass_no = %d Final cutsize = %d Check cutsize = %d\n"
	.section	.text.bench_run,"ax",@progbits
	.align	2
	.globl	bench_run
	.hidden	bench_run
	.type	bench_run, @function
bench_run:
	addi	sp,sp,-76
	sw	s0,68(sp)
	lla	a5,.LANCHOR9
	lla	s0,.LANCHOR7
	lw	t0,0(a5)
	lw	t1,0(s0)
	sw	s1,64(sp)
	lla	a4,.LANCHOR4
	lla	s1,.LANCHOR2
	lla	a5,.LANCHOR5
	lw	a5,0(a5)
	lw	a0,0(a4)
	lw	a1,0(s1)
	lla	t2,.LANCHOR11
	addi	a4,sp,36
	la a3, .LANCHOR14; lw a3, 0(a3);
	sw	t2,8(sp)
	sw	t0,4(sp)
	la a2, .LANCHOR13; lw a2, 0(a2);
	sw	t1,0(sp)
	li	t1,2
	sw	ra,72(sp)
	sw	t1,36(sp)
	call	create_partition
	lla	a5,.LANCHOR18
	lw	a2,0(a5)
	lw	a0,0(s1)
	la a1, .LANCHOR17; lw a1, 0(a1);
	call	init_buckets
	lla	a5,.LANCHOR15
	lw	a2,0(a5)
	lla	a5,.LANCHOR3
	lw	a3,0(s0)
	lw	a0,0(a5)
	lw	a1,0(s1)
	lla	a4,.LANCHOR11
	lla	s0,.LANCHOR6
	call	find_cut_size
	lla	a5,.LANCHOR20
	sw	a0,0(a5)
	sw	zero,40(sp)
	sw	zero,32(sp)
.L146:
	lla	a5,.LANCHOR19
	lw	a1,0(a5)
	lw	a0,0(s1)
	li	t1,0
	lla	a2,.LANCHOR11
	sw	t1,20(sp)
	call	copy_partition
	lla	a5,.LANCHOR8
	lw	a3,0(a5)
	lla	a4,.LANCHOR3
	lla	a5,.LANCHOR7
	lw	a2,0(a5)
	lw	a0,0(a4)
	lw	a1,0(s1)
	sw	zero,28(sp)
	call	copy_nets_info
	lla	a4,.LANCHOR11
	lla	a2,.LANCHOR9
	lw	t0,0(a4)
	lla	a3,.LANCHOR7
	lw	a4,0(a2)
	lla	a0,.LANCHOR4
	lla	a2,.LANCHOR5
	lw	a5,0(s0)
	lw	a3,0(a3)
	lw	a2,0(a2)
	lw	a0,0(a0)
	lw	a1,0(s1)
	sw	t0,0(sp)
	call	compute_gains
	lla	a2,.LANCHOR18
	lw	a4,0(a2)
	lla	a3,.LANCHOR11
	lla	a2,.LANCHOR16
	lla	a0,.LANCHOR4
	lw	a5,0(s0)
	lw	a3,0(a3)
	lw	a2,0(a2)
	lw	a1,0(s1)
	lw	a0,0(a0)
	call	create_buckets
	lw	t1,20(sp)
	j	.L143
.L142:
	lla	a5,.LANCHOR4
	lw	a5,0(a5)
	ble	a5,t1,.L152
.L143:
	lla	a4,.LANCHOR18
	lla	a3,.LANCHOR5
	lla	a2,.LANCHOR19
	lw	a5,0(s0)
	lw	a4,0(a4)
	lw	a3,0(a3)
	lw	a2,0(a2)
	lw	a0,0(s1)
	addi	t1,t1,1
	addi	a1,sp,48
	sw	t1,24(sp)
	call	select_cell
	lla	a5,.LANCHOR18
	mv	t0,a0
	lw	a3,0(a5)
	lw	a4,0(s0)
	lw	a2,52(sp)
	lw	a1,48(sp)
	lw	a0,0(s1)
	sw	t0,20(sp)
	call	delete_partb_nodes_of_cell
	lw	a2,48(sp)
	lw	a4,0(s0)
	lw	t0,20(sp)
	slli	a5,a2,2
	add	a5,a5,a2
	slli	a5,a5,2
	li	a3,1
	add	a5,a4,a5
	sw	a3,4(a5)
	lw	t1,24(sp)
	bne	t0,a3,.L142
	lla	a5,.LANCHOR12
	lw	a0,0(a5)
	lw	a1,28(sp)
	addi	a2,sp,48
	sw	t1,20(sp)
	call	move_cell
	lla	a5,.LANCHOR11
	lw	ra,0(a5)
	lla	a5,.LANCHOR18
	lw	t0,0(a5)
	lla	a5,.LANCHOR8
	lw	a2,0(a5)
	lla	a5,.LANCHOR10
	lw	a5,0(a5)
	lla	a0,.LANCHOR16
	lla	a4,.LANCHOR7
	mv	t1,a5
	lla	a3,.LANCHOR5
	lla	a5,.LANCHOR9
	lw	a5,0(a5)
	lw	a1,0(a0)
	lw	t2,0(s0)
	lw	a4,0(a4)
	lw	a3,0(a3)
	sw	t1,0(sp)
	lw	t1,28(sp)
	lw	a0,0(s1)
	sw	a2,4(sp)
	addi	t1,t1,1
	sw	ra,16(sp)
	sw	t2,12(sp)
	sw	t0,8(sp)
	addi	a2,sp,48
	sw	t1,28(sp)
	call	update_gains
	lla	a5,.LANCHOR4
	lw	t1,20(sp)
	lw	a5,0(a5)
	bgt	a5,t1,.L143
.L152:
	lla	a5,.LANCHOR12
	lw	a0,0(a5)
	lw	a1,28(sp)
	addi	a2,sp,44
	call	find_move_set
	lw	a4,32(sp)
	addi	a4,a4,1
	sw	a4,32(sp)
	bgt	a0,zero,.L153
	lla	a5,.LANCHOR20
	lw	t1,0(a5)
.L145:
	lla	a5,.LANCHOR7
	lw	a3,0(a5)
	lla	a5,.LANCHOR15
	lw	a2,0(a5)
	lla	a5,.LANCHOR3
	lw	a1,0(s1)
	lw	a0,0(a5)
	lla	a4,.LANCHOR11
	sw	t1,20(sp)
	call	find_cut_size
	lw	t1,20(sp)
	lw	a1,32(sp)
	mv	a3,a0
	mv	a2,t1
	lla	a0,.LC30
	call	printf
	lw	ra,72(sp)
	lw	s0,68(sp)
	la a5, .LANCHOR0; lw a5, 0(a5);
	lw	a0,16(a5)
	lw	a1,20(a5)
	lw	s1,64(sp)
	addi	sp,sp,76
	jr	ra
.L153:
	lla	t0,.LANCHOR5
	lw	a2,0(t0)
	lla	a0,.LANCHOR9
	lw	t1,0(a0)
	lla	a0,.LANCHOR7
	lw	a0,0(a0)
	lla	t0,.LANCHOR4
	lla	a5,.LANCHOR20
	lla	a3,.LANCHOR12
	lw	a5,0(a5)
	lw	a3,0(a3)
	lw	a1,0(t0)
	sw	a2,8(sp)
	addi	a2,sp,40
	sw	a2,0(sp)
	lw	a4,44(sp)
	lw	a2,28(sp)
	sw	a0,12(sp)
	lla	a0,.LANCHOR11
	sw	t1,16(sp)
	sw	a0,4(sp)
	li	a0,0
	call	move_cells
	lla	a5,.LANCHOR20
	lw	t1,0(a5)
	sub	t1,t1,a0
	sw	t1,0(a5)
	ble	t1,zero,.L145
	lw	a4,32(sp)
	li	a5,200
	bne	a4,a5,.L146
	j	.L145
	.size	bench_run, .-bench_run
	.section	.rodata.bench_validate.str1.4,"aMS",@progbits,1
	.align	2
.LC31:
	.string	"cs = 0x%x\n"
	.section	.text.bench_validate,"ax",@progbits
	.align	2
	.globl	bench_validate
	.hidden	bench_validate
	.type	bench_validate, @function
bench_validate:
	lla	a5,.LANCHOR18
	lw	a2,0(a5)
	lla	a5,.LANCHOR2
	lw	a0,0(a5)
	addi	sp,sp,-28
	la a1, .LANCHOR17; lw a1, 0(a1);
	sw	ra,24(sp)
	sw	s0,20(sp)
	sw	s1,16(sp)
	call	free_nodes
	la a0, .LANCHOR5; lw a0, 0(a0);
	call	free
	lla	a3,.LANCHOR4
	lw	a5,0(a3)
	ble	a5,zero,.L155
	la a5, .LANCHOR6; lw a5, 0(a5);
	sw	a5,0(sp)
	addi	s0,a5,8
	li	s1,0
.L156:
	lw	a0,0(s0)
	addi	s0,s0,20
	addi	s1,s1,1
	call	free
	lw	a0,-16(s0)
	call	free
	lw	a0,-12(s0)
	call	free
	lla	a3,.LANCHOR4
	lw	a4,0(a3)
	bgt	a4,s1,.L156
.L157:
	lw	a0,0(sp)
	li	s1,0
	call	free
	lla	a2,.LANCHOR3
	lw	a3,0(a2)
	la a5, .LANCHOR7; lw a5, 0(a5);
	la s0, .LANCHOR8; lw s0, 0(s0);
	sw	a5,4(sp)
	sw	s0,8(sp)
	addi	a4,a5,12
	ble	a3,zero,.L162
.L161:
	lw	a0,0(a4)
	addi	a4,a4,16
	sw	a4,0(sp)
	call	free
	lw	a0,0(s0)
	addi	s1,s1,1
	addi	s0,s0,4
	call	free
	lla	a2,.LANCHOR3
	lw	a3,0(a2)
	lw	a4,0(sp)
	bgt	a3,s1,.L161
.L162:
	lw	a0,4(sp)
	call	free
	lw	a0,8(sp)
	call	free
	la a0, .LANCHOR9; lw a0, 0(a0);
	call	free
	la a0, .LANCHOR10; lw a0, 0(a0);
	call	free
	lla	a5,.LANCHOR2
	lw	a5,0(a5)
	lla	a4,.LANCHOR18
	lw	s1,0(a4)
	addi	a4,a5,-1
	sw	a5,8(sp)
	sw	s1,12(sp)
	sw	zero,4(sp)
	sw	a4,0(sp)
	ble	a5,zero,.L160
.L163:
	lw	a5,0(sp)
	li	s0,0
	beq	a5,zero,.L165
.L164:
	lw	a4,0(s1)
	slli	a3,s0,4
	addi	s0,s0,1
	add	a4,a4,a3
	lw	a0,0(a4)
	call	free
	lw	a5,0(sp)
	bne	s0,a5,.L164
.L165:
	lw	a5,4(sp)
	lw	a0,0(s1)
	addi	s1,s1,4
	addi	a5,a5,1
	mv	s0,a5
	sw	a5,4(sp)
	call	free
	lw	a4,8(sp)
	bne	a4,s0,.L163
.L160:
	lw	a0,12(sp)
	lla	s1,.LANCHOR11
	lla	s0,.LANCHOR19
	call	free
	lw	a0,0(s1)
	li	a5,1
	sw	a5,0(sp)
	call	free
	lw	a0,4(s1)
	call	free
	la a0, .LANCHOR12; lw a0, 0(a0);
	call	free
	lw	a5,8(sp)
	lw	a0,0(s0)
	slli	a1,a5,4
	add	a1,a0,a1
	call	bench_checksum
	mv	a1,a0
	mv	s1,a0
	lla	a0,.LC31
	call	printf
	la a4, .LANCHOR0; lw a4, 0(a4);
	lw	a2,8(a4)
	la a3, .LANCHOR20; lw a3, 0(a3);
	bne	a2,a3,.L166
	lw	a4,12(a4)
	sub	a4,a4,s1
	snez	a5,a4
	sw	a5,0(sp)
.L166:
	lw	a0,0(s0)
	call	free
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	a0,0(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L155:
	la a5, .LANCHOR6; lw a5, 0(a5);
	sw	a5,0(sp)
	j	.L157
	.size	bench_validate, .-bench_validate
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC32:
	.string	"input/test-hp1"
	.align	2
.LC33:
	.string	"input/train-hp9"
	.align	2
.LC34:
	.string	"input/ref-biomed"
	.align	2
.LC35:
	.string	"input/huge-industry3"
	.section	.bss.pop,"aw",@nobits
	.align	2
	.set	.LANCHOR11,. + 0
	.type	pop, @object
	.size	pop, 12
pop:
	.zero	12
	.section	.rodata.settings,"a"
	.align	3
	.set	.LANCHOR1,. + 0
	.type	settings, @object
	.size	settings, 96
settings:
	.word	.LC32
	.word	3
	.word	3
	.word	-1316487161
	.word	0
	.word	0
	.word	.LC33
	.word	2
	.word	88
	.word	-1991879777
	.word	1742
	.word	0
	.word	.LC34
	.word	45
	.word	1318
	.word	-1910737507
	.word	553338
	.word	0
	.word	.LC35
	.word	275
	.word	11070
	.word	2111523266
	.word	61666771
	.word	0
	.section	.sbss.bucketsize,"aw",@nobits
	.align	2
	.set	.LANCHOR17,. + 0
	.type	bucketsize, @object
	.size	bucketsize, 4
bucketsize:
	.zero	4
	.section	.sbss.cells,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	cells, @object
	.size	cells, 4
cells:
	.zero	4
	.section	.sbss.cells_info,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	cells_info, @object
	.size	cells_info, 4
cells_info:
	.zero	4
	.section	.sbss.cnets,"aw",@nobits
	.align	2
	.set	.LANCHOR9,. + 0
	.type	cnets, @object
	.size	cnets, 4
cnets:
	.zero	4
	.section	.sbss.cutsize,"aw",@nobits
	.align	2
	.set	.LANCHOR20,. + 0
	.type	cutsize, @object
	.size	cutsize, 4
cutsize:
	.zero	4
	.section	.sbss.max_cweight,"aw",@nobits
	.align	2
	.set	.LANCHOR14,. + 0
	.type	max_cweight, @object
	.size	max_cweight, 4
max_cweight:
	.zero	4
	.section	.sbss.max_gain,"aw",@nobits
	.align	2
	.set	.LANCHOR16,. + 0
	.type	max_gain, @object
	.size	max_gain, 4
max_gain:
	.zero	4
	.section	.sbss.mcells,"aw",@nobits
	.align	2
	.set	.LANCHOR12,. + 0
	.type	mcells, @object
	.size	mcells, 4
mcells:
	.zero	4
	.section	.sbss.ncells,"aw",@nobits
	.align	2
	.set	.LANCHOR10,. + 0
	.type	ncells, @object
	.size	ncells, 4
ncells:
	.zero	4
	.section	.sbss.nets,"aw",@nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	nets, @object
	.size	nets, 4
nets:
	.zero	4
	.section	.sbss.nets_info,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	nets_info, @object
	.size	nets_info, 4
nets_info:
	.zero	4
	.section	.sbss.nocells,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	nocells, @object
	.size	nocells, 4
nocells:
	.zero	4
	.section	.sbss.nonets,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	nonets, @object
	.size	nonets, 4
nonets:
	.zero	4
	.section	.sbss.noparts,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	noparts, @object
	.size	noparts, 4
noparts:
	.zero	4
	.section	.sbss.partb,"aw",@nobits
	.align	2
	.set	.LANCHOR18,. + 0
	.type	partb, @object
	.size	partb, 4
partb:
	.zero	4
	.section	.sbss.parts_info,"aw",@nobits
	.align	2
	.set	.LANCHOR19,. + 0
	.type	parts_info, @object
	.size	parts_info, 4
parts_info:
	.zero	4
	.section	.sbss.ps,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	ps, @object
	.size	ps, 4
ps:
	.zero	4
	.section	.sbss.totcellsize,"aw",@nobits
	.align	2
	.set	.LANCHOR13,. + 0
	.type	totcellsize, @object
	.size	totcellsize, 4
totcellsize:
	.zero	4
	.section	.sbss.totnetsize,"aw",@nobits
	.align	2
	.set	.LANCHOR15,. + 0
	.type	totnetsize, @object
	.size	totnetsize, 4
totnetsize:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
