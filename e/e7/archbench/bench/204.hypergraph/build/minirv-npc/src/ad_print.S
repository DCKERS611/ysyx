#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ad_print.c"
	.option nopic
	.text
	.section	.rodata.print_hgraph.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"\nHYPERGRAPH\n"
	.align	2
.LC1:
	.string	"%d\n%d\n"
	.align	2
.LC2:
	.string	"%d %d "
	.align	2
.LC3:
	.string	"%d "
	.align	2
.LC4:
	.string	"\n"
	.align	2
.LC5:
	.string	"%d\n"
	.section	.text.print_hgraph,"ax",@progbits
	.align	2
	.globl	print_hgraph
	.hidden	print_hgraph
	.type	print_hgraph, @function
print_hgraph:
	addi	sp,sp,-32
	sw	a0,8(sp)
	lla	a0,.LC0
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	ra,28(sp)
	mv	s1,a1
	sw	a1,12(sp)
	sw	a2,16(sp)
	mv	s0,a3
	sw	a4,0(sp)
	call	printf
	lw	a1,8(sp)
	mv	a2,s1
	lla	a0,.LC1
	call	printf
	ble	s1,zero,.L2
	sw	zero,4(sp)
.L5:
	lw	a2,0(s0)
	lw	a1,4(s0)
	lla	a0,.LC2
	call	printf
	lw	a5,0(s0)
	ble	a5,zero,.L3
	li	s1,0
.L4:
	lw	a5,8(s0)
	lw	a4,0(sp)
	lla	a0,.LC3
	add	a5,s1,a5
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a1,0(a5)
	addi	s1,s1,1
	call	printf
	lw	a5,0(s0)
	bgt	a5,s1,.L4
.L3:
	lw	a5,4(sp)
	lla	a0,.LC4
	addi	s0,s0,16
	addi	a5,a5,1
	mv	s1,a5
	sw	a5,4(sp)
	call	printf
	lw	a4,12(sp)
	bne	a4,s1,.L5
.L2:
	lw	a5,8(sp)
	ble	a5,zero,.L1
	lw	a5,16(sp)
	li	s0,0
	addi	s1,a5,8
.L7:
	lw	a1,0(s1)
	lla	a0,.LC5
	addi	s0,s0,1
	call	printf
	lw	a5,8(sp)
	addi	s1,s1,16
	bne	a5,s0,.L7
.L1:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
	.size	print_hgraph, .-print_hgraph
	.section	.rodata.print_vars.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	"\nHYPERGRAPH VARIABLES\n"
	.align	2
.LC7:
	.string	"nocells= %d\n"
	.align	2
.LC8:
	.string	"noparts= %d\n"
	.align	2
.LC9:
	.string	"nonets= %d\n"
	.align	2
.LC10:
	.string	"nopins= %d\n"
	.align	2
.LC11:
	.string	"totcellsize= %d\n"
	.align	2
.LC12:
	.string	"totnetsize= %d\n"
	.align	2
.LC13:
	.string	"max_cdeg= %d\n"
	.align	2
.LC14:
	.string	"max_ndeg= %d\n"
	.align	2
.LC15:
	.string	"max_cweight= %d\n"
	.align	2
.LC16:
	.string	"max_nweight= %d\n"
	.section	.text.print_vars,"ax",@progbits
	.align	2
	.globl	print_vars
	.hidden	print_vars
	.type	print_vars, @function
print_vars:
	addi	sp,sp,-44
	lw	t1,52(sp)
	lw	t0,48(sp)
	lw	t2,44(sp)
	sw	a0,28(sp)
	lla	a0,.LC6
	sw	ra,40(sp)
	sw	t1,16(sp)
	sw	t0,20(sp)
	sw	t2,24(sp)
	sw	a5,0(sp)
	sw	s0,36(sp)
	sw	s1,32(sp)
	sw	a4,4(sp)
	sw	a3,8(sp)
	lw	s1,56(sp)
	mv	s0,a1
	sw	a2,12(sp)
	call	printf
	lw	a1,28(sp)
	lla	a0,.LC7
	call	printf
	lw	a2,12(sp)
	lla	a0,.LC8
	mv	a1,a2
	call	printf
	mv	a1,s0
	lla	a0,.LC9
	call	printf
	lw	a3,8(sp)
	lla	a0,.LC10
	mv	a1,a3
	call	printf
	lw	a4,4(sp)
	lla	a0,.LC11
	mv	a1,a4
	call	printf
	lw	a5,0(sp)
	lla	a0,.LC12
	mv	a1,a5
	call	printf
	lw	t2,24(sp)
	lla	a0,.LC13
	mv	a1,t2
	call	printf
	lw	t0,20(sp)
	lla	a0,.LC14
	mv	a1,t0
	call	printf
	lw	t1,16(sp)
	lla	a0,.LC15
	mv	a1,t1
	call	printf
	lw	s0,36(sp)
	lw	ra,40(sp)
	mv	a1,s1
	lw	s1,32(sp)
	lla	a0,.LC16
	addi	sp,sp,44
	tail	printf
	.size	print_vars, .-print_vars
	.section	.rodata.print_cnets.str1.4,"aMS",@progbits,1
	.align	2
.LC17:
	.string	"\nCNETS\n"
	.globl	__modsi3
	.section	.text.print_cnets,"ax",@progbits
	.align	2
	.globl	print_cnets
	.hidden	print_cnets
	.type	print_cnets, @function
print_cnets:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	a0,0(sp)
	mv	s0,a0
	lla	a0,.LC17
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s1,a1
	call	printf
	ble	s0,zero,.L16
	li	s0,0
	j	.L18
.L17:
	lw	a5,0(sp)
	beq	a5,s0,.L16
.L18:
	lw	a1,0(s1)
	lla	a0,.LC3
	addi	s1,s1,4
	call	printf
	mv	a0,s0
	li	a1,10
	call	__modsi3
	addi	s0,s0,1
	bne	a0,zero,.L17
	lla	a0,.LC4
	call	printf
	lw	a5,0(sp)
	bne	a5,s0,.L18
.L16:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	lla	a0,.LC4
	addi	sp,sp,16
	tail	printf
	.size	print_cnets, .-print_cnets
	.section	.rodata.print_ncells.str1.4,"aMS",@progbits,1
	.align	2
.LC18:
	.string	"\nNCELLS\n"
	.section	.text.print_ncells,"ax",@progbits
	.align	2
	.globl	print_ncells
	.hidden	print_ncells
	.type	print_ncells, @function
print_ncells:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	a0,0(sp)
	mv	s0,a0
	lla	a0,.LC18
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s1,a1
	call	printf
	ble	s0,zero,.L22
	li	s0,0
	j	.L24
.L23:
	lw	a5,0(sp)
	beq	a5,s0,.L22
.L24:
	lw	a1,0(s1)
	lla	a0,.LC3
	addi	s1,s1,4
	call	printf
	mv	a0,s0
	li	a1,10
	call	__modsi3
	addi	s0,s0,1
	bne	a0,zero,.L23
	lla	a0,.LC4
	call	printf
	lw	a5,0(sp)
	bne	a5,s0,.L24
.L22:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	lla	a0,.LC4
	addi	sp,sp,16
	tail	printf
	.size	print_ncells, .-print_ncells
	.section	.rodata.print_parts.str1.4,"aMS",@progbits,1
	.align	2
.LC19:
	.string	"\nPARTS\n"
	.align	2
.LC20:
	.string	"part_no=%d: %d <= %d <= %d * #cells=%d\n"
	.section	.text.print_parts,"ax",@progbits
	.align	2
	.globl	print_parts
	.hidden	print_parts
	.type	print_parts, @function
print_parts:
	addi	sp,sp,-36
	sw	s0,28(sp)
	sw	s1,24(sp)
	mv	s0,a0
	mv	s1,a1
	lla	a0,.LC19
	sw	ra,32(sp)
	sw	a1,12(sp)
	sw	a2,16(sp)
	sw	a3,20(sp)
	call	printf
	ble	s1,zero,.L27
	li	s1,0
.L32:
	lw	a5,16(sp)
	mv	a1,s1
	lla	a0,.LC20
	lw	a2,4(a5)
	slli	a5,s1,2
	add	a5,a5,s1
	slli	a5,a5,2
	add	a2,a2,a5
	lw	a5,0(a2)
	lw	a4,4(a2)
	lw	a3,12(a2)
	lw	a2,8(a2)
	call	printf
	ble	s0,zero,.L29
	li	a2,0
	li	a5,0
	mv	a3,s1
	lw	a4,20(sp)
	mv	s1,a2
	mv	a2,s0
	mv	s0,a5
	j	.L31
.L30:
	addi	s0,s0,1
	beq	a2,s0,.L36
.L31:
	lw	a5,0(a4)
	addi	a4,a4,4
	bne	a5,a3,.L30
	mv	a1,s0
	lla	a0,.LC3
	sw	a2,8(sp)
	sw	a4,4(sp)
	sw	a3,0(sp)
	addi	s1,s1,1
	call	printf
	li	a1,20
	mv	a0,s1
	call	__modsi3
	lw	a3,0(sp)
	lw	a4,4(sp)
	lw	a2,8(sp)
	bne	a0,zero,.L30
	lla	a0,.LC4
	call	printf
	lw	a2,8(sp)
	addi	s0,s0,1
	lw	a4,4(sp)
	lw	a3,0(sp)
	bne	a2,s0,.L31
.L36:
	mv	s1,a3
	mv	s0,a2
.L29:
	lla	a0,.LC4
	call	printf
	lw	a5,12(sp)
	addi	s1,s1,1
	bne	a5,s1,.L32
.L27:
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
	.size	print_parts, .-print_parts
	.section	.rodata.print_parts_info.str1.4,"aMS",@progbits,1
	.align	2
.LC21:
	.string	"\nPARTS_INFO\n"
	.section	.text.print_parts_info,"ax",@progbits
	.align	2
	.globl	print_parts_info
	.hidden	print_parts_info
	.type	print_parts_info, @function
print_parts_info:
	addi	sp,sp,-32
	sw	s0,24(sp)
	mv	s0,a0
	lla	a0,.LC21
	sw	s1,20(sp)
	sw	ra,28(sp)
	sw	a1,12(sp)
	sw	a2,16(sp)
	mv	s1,a3
	call	printf
	lw	a5,12(sp)
	ble	a5,zero,.L37
	sw	s1,8(sp)
	li	s1,0
.L42:
	lw	a2,8(sp)
	mv	a1,s1
	lla	a0,.LC20
	lw	a5,0(a2)
	lw	a4,4(a2)
	lw	a3,12(a2)
	lw	a2,8(a2)
	call	printf
	ble	s0,zero,.L39
	lw	a5,16(sp)
	li	a1,0
	mv	a4,s1
	mv	a3,s0
	mv	s1,a5
	mv	s0,a1
	j	.L41
.L40:
	addi	s0,s0,1
	beq	a3,s0,.L46
.L41:
	lw	a5,0(s1)
	addi	s1,s1,4
	bne	a5,a4,.L40
	mv	a1,s0
	lla	a0,.LC3
	sw	a3,4(sp)
	sw	a4,0(sp)
	call	printf
	lw	a3,4(sp)
	addi	s0,s0,1
	lw	a4,0(sp)
	bne	a3,s0,.L41
.L46:
	mv	s1,a4
	mv	s0,a3
.L39:
	lla	a0,.LC4
	call	printf
	lw	a5,8(sp)
	addi	s1,s1,1
	addi	a5,a5,16
	sw	a5,8(sp)
	lw	a5,12(sp)
	bne	a5,s1,.L42
.L37:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
	.size	print_parts_info, .-print_parts_info
	.section	.rodata.print_cells.str1.4,"aMS",@progbits,1
	.align	2
.LC22:
	.string	"\nCELLS\n"
	.align	2
.LC23:
	.string	"c=%d #n=%d cw=%d nl=%d ns= "
	.align	2
.LC24:
	.string	"totcellsize = %d\n"
	.section	.text.print_cells,"ax",@progbits
	.align	2
	.globl	print_cells
	.hidden	print_cells
	.type	print_cells, @function
print_cells:
	addi	sp,sp,-28
	sw	s1,16(sp)
	sw	a0,12(sp)
	mv	s1,a0
	lla	a0,.LC22
	sw	s0,20(sp)
	sw	ra,24(sp)
	mv	s0,a1
	sw	a2,0(sp)
	call	printf
	ble	s1,zero,.L52
	sw	zero,4(sp)
	sw	zero,8(sp)
.L51:
	lw	a4,12(s0)
	lw	a3,8(s0)
	lw	a2,0(s0)
	lw	a1,4(sp)
	lla	a0,.LC23
	call	printf
	lw	a3,8(sp)
	lw	a4,8(s0)
	lw	a5,0(s0)
	add	a4,a3,a4
	sw	a4,8(sp)
	ble	a5,zero,.L49
	li	s1,0
.L50:
	lw	a5,12(s0)
	lw	a4,0(sp)
	lla	a0,.LC3
	add	a5,s1,a5
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a1,0(a5)
	addi	s1,s1,1
	call	printf
	lw	a5,0(s0)
	bgt	a5,s1,.L50
.L49:
	lw	a5,4(sp)
	lla	a0,.LC4
	addi	s0,s0,16
	addi	a5,a5,1
	mv	s1,a5
	sw	a5,4(sp)
	call	printf
	lw	a4,12(sp)
	bne	a4,s1,.L51
	lw	s0,20(sp)
	lw	a1,8(sp)
	lw	ra,24(sp)
	lw	s1,16(sp)
	lla	a0,.LC24
	addi	sp,sp,28
	tail	printf
.L52:
	sw	zero,8(sp)
	lw	s0,20(sp)
	lw	a1,8(sp)
	lw	ra,24(sp)
	lw	s1,16(sp)
	lla	a0,.LC24
	addi	sp,sp,28
	tail	printf
	.size	print_cells, .-print_cells
	.section	.rodata.print_nets.str1.4,"aMS",@progbits,1
	.align	2
.LC25:
	.string	"\nNETS\n"
	.align	2
.LC26:
	.string	"n=%d #c=%d nw=%d cl=%d p(n)= "
	.align	2
.LC27:
	.string	"%d:%d "
	.align	2
.LC28:
	.string	"\ncs= "
	.section	.text.print_nets,"ax",@progbits
	.align	2
	.globl	print_nets
	.hidden	print_nets
	.type	print_nets, @function
print_nets:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	a0,16(sp)
	mv	s0,a0
	lla	a0,.LC25
	sw	s1,20(sp)
	sw	ra,28(sp)
	sw	a1,0(sp)
	mv	s1,a2
	sw	a3,4(sp)
	call	printf
	ble	s0,zero,.L63
	sw	zero,8(sp)
	sw	zero,12(sp)
	mv	s0,s1
.L62:
	lw	a4,8(s0)
	lw	a3,4(s0)
	lw	a2,0(s0)
	lw	a1,8(sp)
	lla	a0,.LC26
	call	printf
	lw	a4,12(sp)
	lw	a5,4(s0)
	add	a5,a4,a5
	sw	a5,12(sp)
	lw	a5,0(sp)
	ble	a5,zero,.L58
	li	s1,0
.L59:
	lw	a5,12(s0)
	slli	a4,s1,2
	mv	a1,s1
	add	a5,a5,a4
	lw	a2,0(a5)
	lla	a0,.LC27
	addi	s1,s1,1
	call	printf
	lw	a5,0(sp)
	bne	a5,s1,.L59
.L58:
	lla	a0,.LC28
	call	printf
	lw	a5,0(s0)
	ble	a5,zero,.L60
	li	s1,0
	mv	a5,s0
	mv	s0,s1
	mv	s1,a5
.L61:
	lw	a5,8(s1)
	lw	a4,4(sp)
	lla	a0,.LC3
	add	a5,s0,a5
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a1,0(a5)
	addi	s0,s0,1
	call	printf
	lw	a5,0(s1)
	bgt	a5,s0,.L61
	mv	s0,s1
.L60:
	lw	a5,8(sp)
	lla	a0,.LC4
	addi	s0,s0,16
	addi	a5,a5,1
	mv	s1,a5
	sw	a5,8(sp)
	call	printf
	lw	a4,16(sp)
	bne	a4,s1,.L62
	lw	s0,24(sp)
	lw	a1,12(sp)
	lw	ra,28(sp)
	lw	s1,20(sp)
	lla	a0,.LC12
	addi	sp,sp,32
	tail	printf
.L63:
	sw	zero,12(sp)
	lw	s0,24(sp)
	lw	a1,12(sp)
	lw	ra,28(sp)
	lw	s1,20(sp)
	lla	a0,.LC12
	addi	sp,sp,32
	tail	printf
	.size	print_nets, .-print_nets
	.section	.rodata.print_chrom.str1.4,"aMS",@progbits,1
	.align	2
.LC29:
	.string	"\nCHROM:\n"
	.section	.text.print_chrom,"ax",@progbits
	.align	2
	.globl	print_chrom
	.hidden	print_chrom
	.type	print_chrom, @function
print_chrom:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	a0,0(sp)
	mv	s0,a0
	lla	a0,.LC29
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s1,a1
	call	printf
	ble	s0,zero,.L69
	li	s0,0
.L70:
	lw	a1,0(s1)
	lla	a0,.LC3
	addi	s0,s0,1
	call	printf
	lw	a5,0(sp)
	addi	s1,s1,4
	bne	a5,s0,.L70
.L69:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	lla	a0,.LC4
	addi	sp,sp,16
	tail	printf
	.size	print_chrom, .-print_chrom
	.section	.rodata.print_cells_info.str1.4,"aMS",@progbits,1
	.align	2
.LC30:
	.string	"\nCELLS_INFO\n"
	.align	2
.LC31:
	.string	"c=%d mc=%d l=%d mg= "
	.section	.text.print_cells_info,"ax",@progbits
	.align	2
	.globl	print_cells_info
	.hidden	print_cells_info
	.type	print_cells_info, @function
print_cells_info:
	addi	sp,sp,-24
	sw	s1,12(sp)
	sw	a0,8(sp)
	mv	s1,a0
	lla	a0,.LC30
	sw	s0,16(sp)
	sw	ra,20(sp)
	sw	a1,0(sp)
	mv	s0,a2
	call	printf
	ble	s1,zero,.L73
	sw	zero,4(sp)
.L77:
	lw	a3,4(s0)
	lw	a2,0(s0)
	lw	a1,4(sp)
	lla	a0,.LC31
	call	printf
	lw	a5,0(sp)
	ble	a5,zero,.L75
	li	s1,0
.L76:
	lw	a4,8(s0)
	slli	a3,s1,2
	lla	a0,.LC3
	add	a4,a4,a3
	lw	a1,0(a4)
	addi	s1,s1,1
	call	printf
	lw	a5,0(sp)
	bne	a5,s1,.L76
.L75:
	lw	a5,4(sp)
	lla	a0,.LC4
	addi	s0,s0,20
	addi	a5,a5,1
	mv	s1,a5
	sw	a5,4(sp)
	call	printf
	lw	a4,8(sp)
	bne	a4,s1,.L77
.L73:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
	.size	print_cells_info, .-print_cells_info
	.section	.rodata.print_inx.str1.4,"aMS",@progbits,1
	.align	2
.LC32:
	.string	"\nINDICES:\n"
	.align	2
.LC33:
	.string	"(%d,%d) max=%d min=%d nobucs=%d\n"
	.section	.text.print_inx,"ax",@progbits
	.align	2
	.globl	print_inx
	.hidden	print_inx
	.type	print_inx, @function
print_inx:
	addi	sp,sp,-24
	sw	s0,16(sp)
	sw	a0,8(sp)
	mv	s0,a0
	lla	a0,.LC32
	sw	s1,12(sp)
	sw	ra,20(sp)
	mv	s1,a1
	call	printf
	ble	s0,zero,.L81
	addi	a5,s0,-1
	sw	a5,4(sp)
	li	a1,0
.L83:
	lw	a5,4(sp)
	li	s0,0
	beq	a5,zero,.L85
	mv	a5,s0
	mv	s0,s1
	mv	s1,a5
.L84:
	lw	a3,0(s0)
	slli	a5,s1,4
	mv	a2,s1
	add	a3,a3,a5
	lw	a5,12(a3)
	lw	a4,8(a3)
	lw	a3,4(a3)
	lla	a0,.LC33
	sw	a1,0(sp)
	call	printf
	lw	a5,4(sp)
	addi	s1,s1,1
	lw	a1,0(sp)
	bne	a5,s1,.L84
	mv	s1,s0
.L85:
	lw	a5,8(sp)
	addi	a1,a1,1
	addi	s1,s1,4
	bne	a5,a1,.L83
.L81:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
	.size	print_inx, .-print_inx
	.section	.rodata.print_buckets.str1.4,"aMS",@progbits,1
	.align	2
.LC34:
	.string	"\nPARTB:\n"
	.align	2
.LC35:
	.string	"Partb[%d][%d].bnode_ptr[%d]="
	.align	2
.LC36:
	.string	"%d<"
	.align	2
.LC37:
	.string	"%d>"
	.section	.text.print_buckets,"ax",@progbits
	.align	2
	.globl	print_buckets
	.hidden	print_buckets
	.type	print_buckets, @function
print_buckets:
	addi	sp,sp,-40
	sw	s1,28(sp)
	sw	a0,24(sp)
	mv	s1,a0
	lla	a0,.LC34
	sw	s0,32(sp)
	sw	ra,36(sp)
	sw	a1,0(sp)
	mv	s0,a2
	call	printf
	ble	s1,zero,.L91
	addi	a5,s1,-1
	sw	a5,20(sp)
	sw	s0,8(sp)
	sw	zero,16(sp)
.L93:
	lw	a5,20(sp)
	sw	zero,12(sp)
	beq	a5,zero,.L100
.L103:
	lw	a5,12(sp)
	li	s0,0
	slli	a5,a5,4
	sw	a5,4(sp)
	lw	a5,0(sp)
	bgt	a5,zero,.L99
	j	.L102
.L94:
	lw	a5,0(sp)
	addi	s0,s0,1
	beq	a5,s0,.L102
.L99:
	lw	a5,8(sp)
	lw	a3,4(sp)
	slli	a4,s0,2
	lw	a5,0(a5)
	add	a5,a5,a3
	lw	a5,0(a5)
	add	a5,a5,a4
	lw	s1,0(a5)
	beq	s1,zero,.L94
	lw	a2,12(sp)
	lw	a1,16(sp)
	mv	a3,s0
	lla	a0,.LC35
	call	printf
	j	.L97
.L96:
	lw	a1,0(a5)
	call	printf
	lw	s1,8(s1)
	beq	s1,zero,.L98
.L97:
	lw	a5,4(s1)
	lla	a0,.LC36
	beq	a5,zero,.L95
	lw	a1,0(a5)
	call	printf
.L95:
	lw	a1,0(s1)
	lla	a0,.LC37
	call	printf
	lw	a5,8(s1)
	lla	a0,.LC3
	bne	a5,zero,.L96
.L98:
	lla	a0,.LC4
	call	printf
	lw	a5,0(sp)
	addi	s0,s0,1
	bne	a5,s0,.L99
.L102:
	lw	a5,12(sp)
	lw	a4,20(sp)
	addi	a5,a5,1
	sw	a5,12(sp)
	bne	a4,a5,.L103
.L100:
	lw	a4,8(sp)
	lw	a5,16(sp)
	addi	a4,a4,4
	sw	a4,8(sp)
	lw	a4,24(sp)
	addi	a5,a5,1
	sw	a5,16(sp)
	bne	a4,a5,.L93
.L91:
	lw	ra,36(sp)
	lw	s0,32(sp)
	lw	s1,28(sp)
	addi	sp,sp,40
	jr	ra
	.size	print_buckets, .-print_buckets
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
