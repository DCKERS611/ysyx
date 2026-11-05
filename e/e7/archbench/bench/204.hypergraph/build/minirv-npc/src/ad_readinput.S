#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ad_readinput.c"
	.option nopic
	.text
	.section	.text.init_cells,"ax",@progbits
	.align	2
	.globl	init_cells
	.hidden	init_cells
	.type	init_cells, @function
init_cells:
	ble	a0,zero,.L1
	slli	a0,a0,4
	add	a5,a1,a0
	li	a4,-1
.L3:
	sw	zero,0(a1)
	sw	zero,4(a1)
	sw	a4,12(a1)
	addi	a1,a1,16
	bne	a1,a5,.L3
.L1:
	ret
	.size	init_cells, .-init_cells
	.section	.text.init_nets,"ax",@progbits
	.align	2
	.globl	init_nets
	.hidden	init_nets
	.type	init_nets, @function
init_nets:
	ble	a0,zero,.L6
	slli	a3,a0,4
	add	a3,a2,a3
	slli	t1,a1,2
	li	a0,-1
.L10:
	sw	zero,0(a2)
	sw	a0,8(a2)
	ble	a1,zero,.L8
	lw	a5,12(a2)
	add	a4,t1,a5
.L9:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a4,a5,.L9
.L8:
	addi	a2,a2,16
	bne	a2,a3,.L10
.L6:
	ret
	.size	init_nets, .-init_nets
	.section	.rodata.init_netlist.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Error: Inconsistency in cell_%d degrees.\n"
	.section	.text.init_netlist,"ax",@progbits
	.align	2
	.globl	init_netlist
	.hidden	init_netlist
	.type	init_netlist, @function
init_netlist:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	a0,16(sp)
	ble	a0,zero,.L13
	mv	t0,a1
	mv	s1,a2
	li	t1,0
.L15:
	lw	a5,0(s1)
	li	s0,0
	bgt	a5,zero,.L17
	j	.L18
.L16:
	lw	a5,0(s1)
	addi	s0,s0,1
	ble	a5,s0,.L18
.L17:
	lw	a5,8(s1)
	add	a5,s0,a5
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	slli	a5,a5,4
	add	a5,t0,a5
	lw	a2,4(a5)
	lw	t2,12(a5)
	lw	a0,0(a5)
	addi	a1,a2,1
	add	a2,a2,t2
	slli	a2,a2,2
	add	a2,a3,a2
	sw	t1,0(a2)
	sw	a1,4(a5)
	ble	a1,a0,.L16
	mv	a1,s0
	lla	a0,.LC0
	sw	a4,12(sp)
	sw	a3,8(sp)
	sw	t0,4(sp)
	sw	t1,0(sp)
	call	printf
	li	a0,1
	call	bench_exit
	lw	a5,0(s1)
	addi	s0,s0,1
	lw	a4,12(sp)
	lw	a3,8(sp)
	lw	t0,4(sp)
	lw	t1,0(sp)
	bgt	a5,s0,.L17
.L18:
	lw	a5,16(sp)
	addi	t1,t1,1
	addi	s1,s1,16
	bne	a5,t1,.L15
.L13:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
	.size	init_netlist, .-init_netlist
	.section	.rodata.read_hgraph_size.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"r"
	.align	2
.LC2:
	.string	"%d%d%d"
	.align	2
.LC3:
	.string	"Error: Cannot read from %s\n"
	.align	2
.LC4:
	.string	"Error: Invalid attributes of graph.\n"
	.section	.text.read_hgraph_size,"ax",@progbits
	.align	2
	.globl	read_hgraph_size
	.hidden	read_hgraph_size
	.type	read_hgraph_size, @function
read_hgraph_size:
	addi	sp,sp,-24
	sw	s0,16(sp)
	sw	s1,12(sp)
	mv	s0,a1
	sw	a0,4(sp)
	mv	a1,a0
	mv	s1,a2
	addi	a0,sp,8
	lla	a2,.LC1
	sw	ra,20(sp)
	sw	a3,0(sp)
	call	open_file
	lw	a4,0(sp)
	lw	a0,8(sp)
	mv	a3,s1
	mv	a2,s0
	lla	a1,.LC2
	call	__isoc99_fscanf
	li	a4,-1
	lw	a5,4(sp)
	beq	a0,a4,.L29
.L25:
	lw	a5,0(s0)
	blt	a5,zero,.L26
	lw	a5,0(s1)
	blt	a5,zero,.L26
	lw	a5,0(sp)
	lw	a5,0(a5)
	bge	a5,zero,.L27
.L26:
	lla	a0,.LC4
	call	printf
	addi	a0,sp,8
	call	close_file
	li	a0,1
	call	bench_exit
.L27:
	addi	a0,sp,8
	call	close_file
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L29:
	mv	a1,a5
	lla	a0,.LC3
	call	printf
	addi	a0,sp,8
	call	close_file
	li	a0,1
	call	bench_exit
	j	.L25
	.size	read_hgraph_size, .-read_hgraph_size
	.section	.rodata.read_hgraph.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"%d%d"
	.align	2
.LC6:
	.string	"Error: Cannot read from %sn"
	.align	2
.LC7:
	.string	"%d"
	.section	.text.read_hgraph,"ax",@progbits
	.align	2
	.globl	read_hgraph
	.hidden	read_hgraph
	.type	read_hgraph, @function
read_hgraph:
	addi	sp,sp,-64
	mv	t1,a1
	mv	a3,a2
	mv	a1,a0
	sw	a0,12(sp)
	lla	a2,.LC1
	addi	a0,sp,32
	sw	a5,28(sp)
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	t1,24(sp)
	sw	a3,20(sp)
	mv	s0,a4
	sw	s1,52(sp)
	call	open_file
	lw	a0,32(sp)
	addi	a4,sp,44
	addi	a3,sp,40
	addi	a2,sp,36
	lla	a1,.LC2
	call	__isoc99_fscanf
	li	a5,-1
	beq	a0,a5,.L70
.L31:
	lw	a2,24(sp)
	lw	a5,84(sp)
	li	a3,-1
	slli	a4,a2,4
	add	a4,a4,a5
	ble	a2,zero,.L36
.L35:
	sw	zero,0(a5)
	sw	zero,4(a5)
	sw	a3,12(a5)
	addi	a5,a5,16
	bne	a5,a4,.L35
.L36:
	lw	a5,20(sp)
	ble	a5,zero,.L71
	lw	a5,20(sp)
	lw	s1,88(sp)
	slli	t1,s0,2
	slli	a1,a5,4
	add	a1,a1,s1
	mv	a4,s1
	li	a0,-1
.L38:
	sw	zero,0(a4)
	sw	a0,8(a4)
	ble	s0,zero,.L41
	lw	a5,12(a4)
	add	a3,t1,a5
.L40:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a3,.L40
.L41:
	addi	a4,a4,16
	bne	a4,a1,.L38
	lw	a4,76(sp)
	li	a5,-1
	sw	zero,16(sp)
	sw	a5,0(a4)
	lw	a4,80(sp)
	li	t1,0
	sw	a5,0(a4)
	lw	a4,68(sp)
	sw	a5,0(a4)
	lw	a4,72(sp)
	sw	a5,0(a4)
	lw	a5,28(sp)
	sw	zero,0(a5)
	lw	a5,64(sp)
	sw	zero,0(a5)
.L48:
	lw	a0,32(sp)
	mv	a3,s1
	addi	a2,s1,4
	lla	a1,.LC5
	sw	t1,0(sp)
	call	__isoc99_fscanf
	li	a5,-1
	lw	t1,0(sp)
	beq	a0,a5,.L72
.L42:
	lw	a5,64(sp)
	lw	a4,4(s1)
	lw	a5,0(a5)
	add	a5,a5,a4
	lw	a4,64(sp)
	sw	a5,0(a4)
	lw	a4,80(sp)
	lw	a5,4(s1)
	lw	a4,0(a4)
	ble	a5,a4,.L43
	lw	a4,80(sp)
	sw	a5,0(a4)
.L43:
	lw	a4,72(sp)
	lw	a5,0(s1)
	lw	a4,0(a4)
	ble	a5,a4,.L44
	lw	a4,72(sp)
	sw	a5,0(a4)
.L44:
	sw	t1,8(s1)
	ble	a5,zero,.L45
	lw	a5,96(sp)
	slli	t0,t1,2
	sw	s1,0(sp)
	add	t0,a5,t0
	addi	a5,t1,1
	li	s0,0
	sw	a5,4(sp)
	mv	s1,t0
	j	.L47
.L46:
	lw	a3,48(sp)
	lw	a4,84(sp)
	addi	s1,s1,4
	slli	a5,a3,4
	add	a5,a4,a5
	sw	a3,-4(s1)
	lw	a3,0(a5)
	addi	a3,a3,1
	sw	a3,0(a5)
	lw	a5,0(sp)
	lw	a5,0(a5)
	ble	a5,s0,.L73
.L47:
	lw	a0,32(sp)
	addi	a2,sp,48
	lla	a1,.LC7
	call	__isoc99_fscanf
	lw	a4,4(sp)
	li	a5,-1
	add	t1,a4,s0
	addi	s0,s0,1
	bne	a0,a5,.L46
	lw	a1,12(sp)
	lla	a0,.LC3
	sw	t1,8(sp)
	call	printf
	addi	a0,sp,32
	call	close_file
	li	a0,1
	call	bench_exit
	lw	t1,8(sp)
	j	.L46
.L73:
	lw	s1,0(sp)
.L45:
	lw	a5,16(sp)
	lw	a4,20(sp)
	addi	s1,s1,16
	addi	a5,a5,1
	sw	a5,16(sp)
	bne	a4,a5,.L48
.L55:
	lw	a5,84(sp)
	li	a3,0
	li	s0,0
	addi	s1,a5,8
	lw	a5,24(sp)
	ble	a5,zero,.L54
	mv	a2,s1
	lw	t1,28(sp)
	mv	s1,a3
	j	.L53
.L50:
	lw	a1,0(a2)
	lw	a5,0(t1)
	lw	a4,76(sp)
	add	a5,a5,a1
	sw	a5,0(t1)
	lw	a5,0(a2)
	lw	a1,0(a4)
	ble	a5,a1,.L51
	sw	a5,0(a4)
.L51:
	lw	a4,68(sp)
	lw	a5,-8(a2)
	lw	a1,0(a4)
	ble	a5,a1,.L52
	sw	a5,0(a4)
.L52:
	sw	s0,4(a2)
	add	s0,s0,a5
	lw	a5,24(sp)
	addi	a2,a2,16
	beq	a5,s1,.L54
.L53:
	lw	a0,32(sp)
	lla	a1,.LC7
	sw	t1,4(sp)
	sw	a2,0(sp)
	call	__isoc99_fscanf
	li	a5,-1
	lw	a2,0(sp)
	lw	t1,4(sp)
	addi	s1,s1,1
	bne	a0,a5,.L50
	lw	a1,12(sp)
	lla	a0,.LC3
	call	printf
	addi	a0,sp,32
	call	close_file
	li	a0,1
	call	bench_exit
	lw	t1,4(sp)
	lw	a2,0(sp)
	j	.L50
.L72:
	lw	a1,12(sp)
	lla	a0,.LC6
	call	printf
	addi	a0,sp,32
	call	close_file
	li	a0,1
	call	bench_exit
	lw	t1,0(sp)
	j	.L42
.L54:
	addi	a0,sp,32
	call	close_file
	lw	a4,96(sp)
	lw	a3,92(sp)
	lw	a2,88(sp)
	lw	a1,84(sp)
	lw	a0,20(sp)
	call	init_netlist
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	addi	sp,sp,64
	jr	ra
.L70:
	lw	a1,12(sp)
	lla	a0,.LC3
	call	printf
	addi	a0,sp,32
	call	close_file
	li	a0,1
	call	bench_exit
	j	.L31
.L71:
	lw	a4,76(sp)
	li	a5,-1
	sw	a5,0(a4)
	lw	a4,80(sp)
	sw	a5,0(a4)
	lw	a4,68(sp)
	sw	a5,0(a4)
	lw	a4,72(sp)
	sw	a5,0(a4)
	lw	a5,28(sp)
	sw	zero,0(a5)
	lw	a5,64(sp)
	sw	zero,0(a5)
	j	.L55
	.size	read_hgraph, .-read_hgraph
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
