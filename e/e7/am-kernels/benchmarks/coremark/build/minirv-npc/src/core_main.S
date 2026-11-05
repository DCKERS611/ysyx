#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"core_main.c"
	.option nopic
	.text
	.section	.text.iterate,"ax",@progbits
	.align	2
	.globl	iterate
	.hidden	iterate
	.type	iterate, @function
iterate:
	lw	a5,28(a0)
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	a5,0(sp)
	sw	zero,56(a0)
	sw	zero,60(a0)
	beq	a5,zero,.L2
	mv	s0,a0
	li	s1,0
.L4:
	li	a1,1
	mv	a0,s0
	call	core_bench_list
	lhu	a1,56(s0)
	call	crcu16
	li	a1,-1
	sh	a0,56(s0)
	mv	a0,s0
	call	core_bench_list
	lhu	a1,56(s0)
	call	crcu16
	sh	a0,56(s0)
	bne	s1,zero,.L3
	sh	a0,58(s0)
.L3:
	lw	a5,0(sp)
	addi	s1,s1,1
	bne	a5,s1,.L4
.L2:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
	.size	iterate, .-iterate
	.section	.rodata.main.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Running CoreMark for %d iterations\n"
	.globl	__udivsi3
	.globl	__divsi3
	.globl	__mulsi3
	.align	2
.LC1:
	.string	"6k performance run parameters for coremark.\n"
	.align	2
.LC2:
	.string	"6k validation run parameters for coremark.\n"
	.align	2
.LC3:
	.string	"Profile generation run parameters for coremark.\n"
	.align	2
.LC4:
	.string	"2K performance run parameters for coremark.\n"
	.align	2
.LC5:
	.string	"2K validation run parameters for coremark.\n"
	.align	2
.LC6:
	.string	"[%u]ERROR! list crc 0x%04x - should be 0x%04x\n"
	.align	2
.LC7:
	.string	"[%u]ERROR! matrix crc 0x%04x - should be 0x%04x\n"
	.align	2
.LC8:
	.string	"[%u]ERROR! state crc 0x%04x - should be 0x%04x\n"
	.align	2
.LC9:
	.string	"CoreMark Size    : %d\n"
	.align	2
.LC10:
	.string	"Total time (ms)  : %d\n"
	.align	2
.LC11:
	.string	"Iterations       : %d\n"
	.align	2
.LC12:
	.string	"GCC11.4.0"
	.align	2
.LC13:
	.string	"Compiler version : %s\n"
	.align	2
.LC14:
	.string	"seedcrc          : 0x%04x\n"
	.align	2
.LC15:
	.string	"[%d]crclist       : 0x%04x\n"
	.align	2
.LC16:
	.string	"[%d]crcmatrix     : 0x%04x\n"
	.align	2
.LC17:
	.string	"Finised in %d ms.\n"
	.align	2
.LC18:
	.string	"[%d]crcstate      : 0x%04x\n"
	.align	2
.LC19:
	.string	"[%d]crcfinal      : 0x%04x\n"
	.align	2
.LC20:
	.string	"==================================================\n"
	.align	2
.LC21:
	.string	"CoreMark PASS       %d Marks\n"
	.align	2
.LC22:
	.string	"                vs. 100000 Marks (i7-7700K @ 4.20GHz)\n"
	.align	2
.LC23:
	.string	"Errors detected\n"
	.align	2
.LC24:
	.string	"Cannot validate operation for these seed values, please compare with results on a known platform.\n"
	.section	.text.startup.main,"ax",@progbits
	.align	2
	.globl	main
	.hidden	main
	.type	main, @function
main:
	addi	sp,sp,-108
	sw	ra,104(sp)
	sw	s0,100(sp)
	sw	s1,96(sp)
	mv	s0,a1
	sw	a0,24(sp)
	call	ioe_init
	li	a1,2
	lla	a0,.LC0
	call	printf
	mv	a2,s0
	addi	a1,sp,24
	addi	a0,sp,94
	call	portable_init
	li	a0,1
	call	get_seed_32
	mv	a5,a0
	li	a0,2
	sh	a5,28(sp)
	call	get_seed_32
	mv	a5,a0
	li	a0,3
	sh	a5,30(sp)
	call	get_seed_32
	mv	a5,a0
	li	a0,4
	sh	a5,32(sp)
	call	get_seed_32
	mv	a5,a0
	li	a0,5
	sw	a5,56(sp)
	call	get_seed_32
	li	s0,7
	beq	a0,zero,.L12
	mv	s0,a0
.L12:
	lw	a5,28(sp)
	sw	s0,60(sp)
	bne	a5,zero,.L13
	lh	a5,32(sp)
	beq	a5,zero,.L103
.L14:
	andi	a1,s0,1
	andi	s1,s0,2
	lla	a5,.LANCHOR0
	snez	a3,s1
	sw	a1,0(sp)
	sw	a5,36(sp)
	sh	zero,92(sp)
	andi	a4,s0,4
	add	a1,a1,a3
	beq	a4,zero,.L16
	addi	a1,a1,1
	slli	a1,a1,16
	srli	a1,a1,16
.L16:
	li	a0,2000
	call	__udivsi3
	li	a4,0
	mv	a5,s0
	addi	a2,sp,28
	mv	s0,a4
	sw	s1,4(sp)
	sw	a0,52(sp)
	li	t1,0
	li	t2,1
	li	t0,3
	mv	a1,a0
	mv	s1,a2
	mv	a4,a5
.L18:
	sll	a5,t2,s0
	and	a5,a5,a4
	addi	s0,s0,1
	bne	a5,zero,.L105
.L17:
	addi	s1,s1,4
	bne	s0,t0,.L18
	lw	a5,0(sp)
	lw	s1,4(sp)
	mv	a3,a1
	mv	s0,a4
	bne	a5,zero,.L106
	bne	s1,zero,.L107
.L20:
	andi	s0,s0,4
	beq	s0,zero,.L21
	lw	a2,48(sp)
	lh	a1,28(sp)
	lw	a0,52(sp)
	call	core_init_state
.L21:
	lw	a5,56(sp)
	bne	a5,zero,.L22
	li	a5,1
	sw	a5,56(sp)
.L23:
	lw	a4,56(sp)
	slli	a5,a4,2
	add	a5,a5,a4
	slli	a5,a5,1
	sw	a5,56(sp)
	call	start_time
	addi	a0,sp,28
	call	iterate
	call	stop_time
	call	get_time
	call	time_in_secs
	beq	a0,zero,.L23
	mv	a1,a0
	li	a0,10
	call	__udivsi3
	mv	a1,a0
	lw	a0,56(sp)
	addi	a1,a1,1
	call	__mulsi3
	sw	a0,56(sp)
.L22:
	call	start_time
	addi	a0,sp,28
	call	iterate
	call	stop_time
	call	get_time
	mv	a5,a0
	lh	a0,28(sp)
	li	a1,0
	sw	a5,8(sp)
	call	crc16
	mv	a1,a0
	lh	a0,30(sp)
	call	crc16
	mv	a1,a0
	lh	a0,32(sp)
	call	crc16
	mv	a1,a0
	lh	a0,52(sp)
	call	crc16
	li	a5,32768
	sw	a0,20(sp)
	addi	a5,a5,-1275
	beq	a0,a5,.L24
	bgtu	a0,a5,.L25
	li	a5,8192
	addi	a5,a5,-1806
	beq	a0,a5,.L26
	li	a5,20480
	addi	a5,a5,-337
	bne	a0,a5,.L104
	lla	a0,.LC3
	call	printf
	li	t2,2
.L31:
	lla	s0,default_num_contexts
	lw	a5,0(s0)
	li	s1,0
	li	a1,0
	beq	a5,zero,.L108
	mv	t1,s0
	mv	a4,s1
	mv	s0,a1
	j	.L37
.L110:
	addi	a5,s1,72
	addi	a3,sp,24
	add	s1,a5,a3
	lhu	a5,-4(s1)
.L35:
	addi	s0,s0,1
	lw	a2,0(t1)
	add	a5,a5,a4
	slli	s0,s0,16
	slli	a3,a5,16
	slli	a4,a5,16
	srli	s0,s0,16
	srli	a3,a3,16
	srai	a4,a4,16
	bgeu	s0,a2,.L109
.L37:
	slli	s1,s0,4
	add	a5,s1,s0
	slli	a5,a5,2
	addi	a3,sp,24
	addi	a5,a5,72
	add	a5,a5,a3
	lw	a3,-36(a5)
	sh	zero,-4(a5)
	andi	a3,a3,1
	beq	a3,zero,.L32
	lla	a2,.LANCHOR1
	slli	a3,t2,1
	add	a3,a2,a3
	lhu	a3,0(a3)
	lhu	a2,-10(a5)
	sw	a5,0(sp)
	beq	a2,a3,.L32
	mv	a1,s0
	lla	a0,.LC6
	sw	t1,16(sp)
	sw	a4,12(sp)
	sw	t2,4(sp)
	call	printf
	lw	a5,0(sp)
	lw	t1,16(sp)
	lw	a4,12(sp)
	lhu	a3,-4(a5)
	lw	t2,4(sp)
	addi	a3,a3,1
	sh	a3,-4(a5)
.L32:
	add	a5,s1,s0
	slli	a5,a5,2
	addi	a3,sp,24
	addi	a5,a5,72
	add	a5,a5,a3
	lw	a1,-36(a5)
	andi	a3,a1,2
	beq	a3,zero,.L33
	slli	a2,t2,1
	lla	a3,.LANCHOR2
	add	a3,a3,a2
	lhu	a3,0(a3)
	lhu	a2,-8(a5)
	sw	a5,0(sp)
	beq	a2,a3,.L33
	mv	a1,s0
	lla	a0,.LC7
	sw	t1,16(sp)
	sw	a4,12(sp)
	sw	t2,4(sp)
	call	printf
	lw	a5,0(sp)
	lw	t1,16(sp)
	lw	a4,12(sp)
	lhu	a3,-4(a5)
	lw	a1,-36(a5)
	lw	t2,4(sp)
	addi	a3,a3,1
	sh	a3,-4(a5)
.L33:
	add	s1,s1,s0
	andi	a1,a1,4
	slli	s1,s1,2
	beq	a1,zero,.L110
	addi	a5,s1,72
	addi	a2,sp,24
	slli	a3,t2,1
	add	s1,a5,a2
	lla	a5,.LANCHOR3
	add	a5,a5,a3
	lhu	a2,-6(s1)
	lhu	a3,0(a5)
	bne	a2,a3,.L36
	lhu	a5,-4(s1)
	j	.L35
.L106:
	lh	a2,28(sp)
	lw	a1,40(sp)
	mv	a0,a3
	call	core_list_init
	lw	s0,60(sp)
	sw	a0,64(sp)
	andi	s1,s0,2
	beq	s1,zero,.L20
.L107:
	lh	a5,30(sp)
	lh	a2,28(sp)
	lw	a1,44(sp)
	lw	a0,52(sp)
	slli	a5,a5,16
	addi	a3,sp,68
	or	a2,a5,a2
	call	core_init_matrix
	lw	s0,60(sp)
	j	.L20
.L36:
	mv	a1,s0
	lla	a0,.LC8
	sw	t1,12(sp)
	sw	a4,4(sp)
	sw	t2,0(sp)
	call	printf
	lhu	a5,-4(s1)
	lw	t1,12(sp)
	lw	a4,4(sp)
	addi	a5,a5,1
	slli	a5,a5,16
	srli	a5,a5,16
	lw	t2,0(sp)
	sh	a5,-4(s1)
	j	.L35
.L25:
	lw	a4,20(sp)
	li	a5,36864
	addi	a5,a5,-1534
	beq	a4,a5,.L29
	li	a5,61440
	addi	a5,a5,-1547
	bne	a4,a5,.L104
	lla	a0,.LC4
	call	printf
	li	t2,3
	j	.L31
.L105:
	mv	a0,t1
	sw	a4,16(sp)
	sw	t1,12(sp)
	sw	a1,8(sp)
	call	__mulsi3
	lw	t1,12(sp)
	lla	a5,.LANCHOR0
	add	a0,a5,a0
	addi	t1,t1,1
	slli	t1,t1,16
	lw	a4,16(sp)
	lw	a1,8(sp)
	sw	a0,12(s1)
	srli	t1,t1,16
	li	t0,3
	li	t2,1
	j	.L17
.L109:
	mv	s0,t1
.L28:
	sw	a3,0(sp)
	call	check_data_types
	lw	a3,0(sp)
	lw	a1,52(sp)
	add	a5,a3,a0
	slli	a5,a5,16
	srai	a5,a5,16
	lla	a0,.LC9
	sw	a5,4(sp)
	call	printf
	lw	a0,8(sp)
	call	time_in_secs
	mv	a1,a0
	lla	a0,.LC10
	call	printf
	lw	a1,0(s0)
	lw	a0,56(sp)
	call	__mulsi3
	mv	a1,a0
	lla	a0,.LC11
	call	printf
	lla	a1,.LC12
	lla	a0,.LC13
	call	printf
	lw	a1,20(sp)
	lla	a0,.LC14
	call	printf
	lw	a5,60(sp)
	andi	a4,a5,1
	beq	a4,zero,.L41
	lw	a4,0(s0)
	beq	a4,zero,.L41
	li	a1,0
	mv	a4,s0
	lla	s1,.LC15
	mv	s0,a1
.L42:
	slli	a5,s0,4
	add	a5,a5,s0
	slli	a5,a5,2
	sw	a4,0(sp)
	addi	a5,a5,72
	addi	a4,sp,24
	add	a5,a5,a4
	lhu	a2,-10(a5)
	mv	a1,s0
	mv	a0,s1
	call	printf
	lw	a4,0(sp)
	addi	a1,s0,1
	slli	s0,a1,16
	lw	a5,0(a4)
	srli	s0,s0,16
	bltu	s0,a5,.L42
	lw	a5,60(sp)
	mv	s0,a4
.L41:
	andi	a4,a5,2
	beq	a4,zero,.L40
	lw	a4,0(s0)
	beq	a4,zero,.L45
	li	a1,0
	mv	a4,s0
	lla	s1,.LC16
	mv	s0,a1
.L46:
	slli	a5,s0,4
	add	a5,a5,s0
	slli	a5,a5,2
	sw	a4,0(sp)
	addi	a5,a5,72
	addi	a4,sp,24
	add	a5,a5,a4
	lhu	a2,-8(a5)
	mv	a1,s0
	mv	a0,s1
	call	printf
	lw	a4,0(sp)
	addi	a1,s0,1
	slli	s0,a1,16
	lw	a5,0(a4)
	srli	s0,s0,16
	bltu	s0,a5,.L46
	lw	a5,60(sp)
	mv	s0,a4
.L40:
	andi	a5,a5,4
	lw	a4,0(s0)
	beq	a5,zero,.L44
	li	a1,0
	lla	s1,.LC18
	beq	a4,zero,.L48
	mv	a4,s0
	mv	s0,a1
.L49:
	slli	a5,s0,4
	add	a5,a5,s0
	slli	a5,a5,2
	sw	a4,0(sp)
	addi	a5,a5,72
	addi	a4,sp,24
	add	a5,a5,a4
	lhu	a2,-6(a5)
	mv	a1,s0
	mv	a0,s1
	call	printf
	lw	a4,0(sp)
	addi	a1,s0,1
	slli	s0,a1,16
	lw	a5,0(a4)
	srli	s0,s0,16
	bltu	s0,a5,.L49
	mv	s0,a4
.L44:
	lw	a5,0(s0)
	li	a1,0
	mv	a4,s0
	lla	s1,.LC19
	mv	s0,a1
	beq	a5,zero,.L48
.L47:
	slli	a5,s0,4
	add	a5,a5,s0
	slli	a5,a5,2
	sw	a4,0(sp)
	addi	a5,a5,72
	addi	a4,sp,24
	add	a5,a5,a4
	lhu	a2,-12(a5)
	mv	a1,s0
	mv	a0,s1
	call	printf
	lw	a4,0(sp)
	addi	s0,s0,1
	slli	s0,s0,16
	lw	a5,0(a4)
	srli	s0,s0,16
	bltu	s0,a5,.L47
.L48:
	lw	a1,8(sp)
	lla	a0,.LC17
	call	printf
	lw	a5,4(sp)
	beq	a5,zero,.L111
	lw	a5,4(sp)
	ble	a5,zero,.L53
	lla	a0,.LC23
	call	printf
.L52:
	addi	a0,sp,94
	call	portable_fini
	lw	ra,104(sp)
	lw	s0,100(sp)
	lw	a0,4(sp)
	lw	s1,96(sp)
	addi	sp,sp,108
	jr	ra
.L13:
	li	a4,1
	bne	a5,a4,.L14
	lh	a5,32(sp)
	bne	a5,zero,.L14
	li	a5,873803776
	addi	a5,a5,1045
	sw	a5,28(sp)
.L103:
	li	a5,102
	sh	a5,32(sp)
	j	.L14
.L53:
	lla	a0,.LC24
	call	printf
	j	.L52
.L111:
	lla	a0,.LC20
	call	printf
	lw	a0,8(sp)
	call	time_in_secs
	mv	a1,a0
	li	a0,2920448
	addi	a0,a0,952
	call	__udivsi3
	li	a1,1000
	slli	a0,a0,1
	call	__udivsi3
	mv	a1,a0
	lla	a0,.LC21
	call	printf
	lla	a0,.LC22
	call	printf
	j	.L52
.L45:
	andi	a5,a5,4
	beq	a5,zero,.L44
	j	.L48
.L24:
	lla	a0,.LC2
	call	printf
	li	t2,1
	j	.L31
.L29:
	lla	a0,.LC1
	call	printf
	li	t2,0
	j	.L31
.L26:
	lla	a0,.LC5
	call	printf
	li	t2,4
	j	.L31
.L108:
	li	a3,0
	j	.L28
.L104:
	li	a3,65536
	addi	a3,a3,-1
	lla	s0,default_num_contexts
	j	.L28
	.size	main, .-main
	.hidden	mem_name
	.globl	mem_name
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC25:
	.string	"Static"
	.align	2
.LC26:
	.string	"Heap"
	.align	2
.LC27:
	.string	"Stack"
	.hidden	static_memblk
	.globl	static_memblk
	.section	.bss.static_memblk,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	static_memblk, @object
	.size	static_memblk, 2000
static_memblk:
	.zero	2000
	.section	.data.mem_name,"aw"
	.align	2
	.type	mem_name, @object
	.size	mem_name, 12
mem_name:
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.section	.rodata.list_known_crc,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	list_known_crc, @object
	.size	list_known_crc, 10
list_known_crc:
	.half	-11088
	.half	13120
	.half	27257
	.half	-6380
	.half	-7231
	.section	.rodata.matrix_known_crc,"a"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	matrix_known_crc, @object
	.size	matrix_known_crc, 10
matrix_known_crc:
	.half	-16814
	.half	4505
	.half	22024
	.half	8151
	.half	1863
	.section	.rodata.state_known_crc,"a"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	state_known_crc, @object
	.size	state_known_crc, 10
state_known_crc:
	.half	24135
	.half	14783
	.half	-6748
	.half	-29126
	.half	-29308
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
