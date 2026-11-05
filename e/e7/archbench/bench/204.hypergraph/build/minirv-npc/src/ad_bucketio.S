#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ad_bucketio.c"
	.option nopic
	.text
	.section	.rodata.create_partb_node.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Error: Cannot allocate memory for tnode_ptr.\n"
	.section	.text.create_partb_node,"ax",@progbits
	.align	2
	.globl	create_partb_node
	.hidden	create_partb_node
	.type	create_partb_node, @function
create_partb_node:
	addi	sp,sp,-28
	li	a0,12
	sw	s0,20(sp)
	sw	s1,16(sp)
	sw	a1,8(sp)
	sw	a3,4(sp)
	sw	a4,0(sp)
	mv	s0,a5
	sw	ra,24(sp)
	mv	s1,a2
	call	malloc
	lw	a4,0(sp)
	lw	a3,4(sp)
	lw	a1,8(sp)
	mv	a5,a0
	beq	a0,zero,.L14
.L2:
	slli	s1,s1,2
	add	s0,s0,s1
	lw	a2,0(s0)
	slli	a0,a3,4
	slli	t0,a4,2
	add	a2,a2,a0
	lw	a0,0(a2)
	slli	t1,a1,2
	add	t1,t1,a1
	add	a0,a0,t0
	lw	t0,0(a0)
	sw	a1,0(a5)
	lw	a1,28(sp)
	slli	t1,t1,2
	sw	zero,4(a5)
	add	a1,a1,t1
	beq	t0,zero,.L3
	lw	t0,0(a0)
	li	t1,0
	sw	t0,8(a5)
	sw	a5,4(t0)
.L4:
	lw	t0,12(a1)
	lw	a1,16(a1)
	slli	a3,a3,2
	sw	a5,0(a0)
	add	a0,t0,a3
	sw	a5,0(a0)
	add	a5,a1,a3
	sw	a4,0(a5)
	lw	a5,12(a2)
	bne	a5,zero,.L5
	sw	a4,4(a2)
	sw	a4,8(a2)
.L6:
	beq	t1,zero,.L1
	addi	a5,a5,1
	sw	a5,12(a2)
.L1:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L5:
	lw	a3,4(a2)
	ble	a4,a3,.L7
	sw	a4,4(a2)
	j	.L6
.L7:
	lw	a3,8(a2)
	bge	a4,a3,.L6
	sw	a4,8(a2)
	j	.L6
.L3:
	lw	t0,0(a0)
	li	t1,1
	sw	t0,8(a5)
	j	.L4
.L14:
	sw	a0,0(sp)
	lla	a0,.LC0
	sw	a4,12(sp)
	sw	a3,8(sp)
	sw	a1,4(sp)
	call	printf
	li	a0,1
	call	bench_exit
	lw	a4,12(sp)
	lw	a3,8(sp)
	lw	a1,4(sp)
	lw	a5,0(sp)
	j	.L2
	.size	create_partb_node, .-create_partb_node
	.section	.text.insert_partb_node,"ax",@progbits
	.align	2
	.globl	insert_partb_node
	.hidden	insert_partb_node
	.type	insert_partb_node, @function
insert_partb_node:
	lw	a5,0(a3)
	slli	t1,a2,2
	add	a5,a5,t1
	lw	t1,0(a5)
	sw	zero,4(a0)
	lw	t0,0(a5)
	beq	t1,zero,.L16
	sw	t0,8(a0)
	li	t1,0
	sw	a0,4(t0)
.L17:
	lw	t0,12(a4)
	lw	a4,16(a4)
	slli	a1,a1,2
	sw	a0,0(a5)
	add	a5,t0,a1
	sw	a0,0(a5)
	add	a5,a4,a1
	sw	a2,0(a5)
	lw	a5,12(a3)
	bne	a5,zero,.L18
	sw	a2,4(a3)
	sw	a2,8(a3)
.L19:
	beq	t1,zero,.L15
	addi	a5,a5,1
	sw	a5,12(a3)
.L15:
	ret
.L18:
	lw	a4,4(a3)
	bge	a4,a2,.L20
	sw	a2,4(a3)
	j	.L19
.L20:
	lw	a4,8(a3)
	ble	a4,a2,.L19
	sw	a2,8(a3)
	j	.L19
.L16:
	li	t1,1
	sw	t0,8(a0)
	j	.L17
	.size	insert_partb_node, .-insert_partb_node
	.section	.text.delete_partb_node,"ax",@progbits
	.align	2
	.globl	delete_partb_node
	.hidden	delete_partb_node
	.type	delete_partb_node, @function
delete_partb_node:
	lw	a5,12(a3)
	addi	sp,sp,-16
	sw	s0,8(sp)
	slli	s0,a1,2
	lw	a4,16(a3)
	add	a5,a5,s0
	lw	a5,0(a5)
	add	a4,a4,s0
	sw	ra,12(sp)
	sw	s1,4(sp)
	lw	a1,0(a4)
	beq	a5,zero,.L25
	mv	s1,a3
	lw	a3,4(a5)
	lw	a4,8(a5)
	beq	a3,zero,.L46
	sw	a4,8(a3)
	beq	a4,zero,.L30
	sw	a3,4(a4)
.L30:
	beq	a0,zero,.L25
	mv	a0,a5
	sw	a5,0(sp)
	call	free
	lw	a4,12(s1)
	lw	a5,0(sp)
	add	a4,a4,s0
	sw	zero,0(a4)
.L25:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	mv	a0,a5
	addi	sp,sp,16
	jr	ra
.L46:
	lw	a3,0(a2)
	slli	a1,a1,2
	add	a1,a3,a1
	beq	a4,zero,.L29
	sw	zero,4(a4)
	sw	a4,0(a1)
	j	.L30
.L29:
	lw	a4,12(a2)
	sw	zero,0(a1)
	addi	a4,a4,-1
	sw	a4,12(a2)
	beq	a4,zero,.L35
	lw	a1,4(a2)
	lw	t1,8(a2)
	slli	a4,a1,2
	add	a4,a3,a4
	blt	t1,a1,.L31
	j	.L30
.L32:
	sw	a1,4(a2)
	beq	a1,t1,.L30
.L31:
	lw	a3,0(a4)
	addi	a1,a1,-1
	addi	a4,a4,-4
	beq	a3,zero,.L32
	j	.L30
.L35:
	li	a4,-1
	sw	a4,4(a2)
	sw	a4,8(a2)
	j	.L30
	.size	delete_partb_node, .-delete_partb_node
	.section	.text.delete_partb_nodes_of_cell,"ax",@progbits
	.align	2
	.globl	delete_partb_nodes_of_cell
	.hidden	delete_partb_nodes_of_cell
	.type	delete_partb_nodes_of_cell, @function
delete_partb_nodes_of_cell:
	addi	sp,sp,-20
	addi	a5,a0,-1
	sw	ra,16(sp)
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	a5,4(sp)
	ble	a5,zero,.L47
	slli	a5,a1,2
	add	a5,a5,a1
	slli	a2,a2,2
	slli	a5,a5,2
	add	s1,a3,a2
	li	s0,0
	add	a3,a4,a5
.L49:
	lw	a2,0(s1)
	slli	a5,s0,4
	mv	a1,s0
	add	a2,a2,a5
	li	a0,1
	sw	a3,0(sp)
	call	delete_partb_node
	lw	a5,4(sp)
	addi	s0,s0,1
	lw	a3,0(sp)
	bne	s0,a5,.L49
.L47:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
	.size	delete_partb_nodes_of_cell, .-delete_partb_nodes_of_cell
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
