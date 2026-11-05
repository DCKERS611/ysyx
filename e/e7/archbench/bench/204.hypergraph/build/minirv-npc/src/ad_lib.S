#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ad_lib.c"
	.option nopic
	.text
	.section	.text.init_buckets,"ax",@progbits
	.align	2
	.globl	init_buckets
	.hidden	init_buckets
	.type	init_buckets, @function
init_buckets:
	addi	sp,sp,-12
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a0
	ble	a0,zero,.L1
	slli	a5,s0,4
	addi	a5,a5,-16
	mv	t0,a2
	mv	a0,a1
	slli	t1,a1,2
	li	t2,0
	li	s1,1
	sw	a5,0(sp)
	li	a2,-1
.L3:
	beq	s0,s1,.L6
	lw	a3,0(t0)
	lw	a5,0(sp)
	add	a1,a5,a3
.L5:
	sw	a2,8(a3)
	sw	a2,4(a3)
	sw	zero,12(a3)
	ble	a0,zero,.L8
	lw	a5,0(a3)
	add	a4,t1,a5
.L7:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a4,a5,.L7
.L8:
	addi	a3,a3,16
	bne	a3,a1,.L5
.L6:
	addi	t2,t2,1
	addi	t0,t0,4
	bne	s0,t2,.L3
.L1:
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	init_buckets, .-init_buckets
	.section	.rodata.map_part_no.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Error: Unexpected inputs\n"
	.section	.text.map_part_no,"ax",@progbits
	.align	2
	.globl	map_part_no
	.hidden	map_part_no
	.type	map_part_no, @function
map_part_no:
	blt	a0,a1,.L19
	ble	a0,a1,.L16
	addi	a0,a0,-1
	ret
.L19:
	ret
.L16:
	addi	sp,sp,-12
	lla	a0,.LC0
	sw	ra,8(sp)
	call	printf
	li	a0,1
	call	bench_exit
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
	.size	map_part_no, .-map_part_no
	.section	.text.calculate_gain,"ax",@progbits
	.align	2
	.globl	calculate_gain
	.hidden	calculate_gain
	.type	calculate_gain, @function
calculate_gain:
	slli	a5,a0,2
	add	a0,a5,a0
	slli	a0,a0,2
	add	a3,a3,a0
	lw	a5,8(a3)
	slli	a1,a1,2
	slli	a2,a2,2
	add	a2,a5,a2
	add	a5,a5,a1
	lw	a0,0(a2)
	lw	a5,0(a5)
	sub	a0,a0,a5
	ret
	.size	calculate_gain, .-calculate_gain
	.section	.text.compute_gains,"ax",@progbits
	.align	2
	.globl	compute_gains
	.hidden	compute_gains
	.type	compute_gains, @function
compute_gains:
	addi	sp,sp,-48
	sw	s0,44(sp)
	sw	s1,40(sp)
	sw	a1,4(sp)
	sw	a3,12(sp)
	sw	a4,32(sp)
	ble	a0,zero,.L22
	lw	a3,48(sp)
	slli	a0,a0,4
	mv	s0,a5
	add	a4,a2,a0
	slli	a5,a1,2
	sw	a2,8(sp)
	sw	a3,16(sp)
	sw	a4,28(sp)
	sw	a5,36(sp)
.L35:
	lw	a5,8(sp)
	sw	zero,4(s0)
	sw	zero,0(s0)
	lw	a1,12(a5)
	sw	zero,4(a5)
	lw	a5,4(sp)
	ble	a5,zero,.L24
	lw	a5,8(s0)
	lw	a4,36(sp)
	add	a4,a4,a5
.L25:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a4,a5,.L25
.L24:
	lw	a5,8(sp)
	lw	t0,0(a5)
	lw	a5,16(sp)
	lw	a5,0(a5)
	sw	a5,20(sp)
	ble	t0,zero,.L26
	slli	a5,a5,2
	sw	a5,0(sp)
	lw	a5,32(sp)
	slli	a1,a1,2
	li	t1,0
	add	a1,a5,a1
	j	.L34
.L31:
	addi	t1,t1,1
	addi	a1,a1,4
	ble	t0,t1,.L26
.L34:
	lw	a5,0(a1)
	lw	a4,12(sp)
	li	a3,1
	slli	a5,a5,4
	add	a5,a4,a5
	lw	a0,12(a5)
	lw	a4,0(sp)
	lw	t2,4(a5)
	add	a4,a0,a4
	lw	a4,0(a4)
	beq	a4,a3,.L48
	lw	a5,0(a5)
	bne	a4,a5,.L31
	lw	a5,8(s0)
	lw	a4,0(sp)
	add	a5,a5,a4
.L45:
	lw	a4,0(a5)
	addi	t1,t1,1
	addi	a1,a1,4
	add	a4,a4,t2
	sw	a4,0(a5)
	lw	a5,8(sp)
	lw	t0,0(a5)
	bgt	t0,t1,.L34
.L26:
	lw	a4,16(sp)
	lw	a5,8(sp)
	addi	s0,s0,20
	addi	a4,a4,4
	sw	a4,16(sp)
	lw	a4,28(sp)
	addi	a5,a5,16
	sw	a5,8(sp)
	bne	a5,a4,.L35
.L22:
	lw	s0,44(sp)
	lw	s1,40(sp)
	addi	sp,sp,48
	jr	ra
.L48:
	lw	a3,4(sp)
	li	a2,0
	li	a4,1
	ble	a3,zero,.L31
	sw	t0,24(sp)
	lw	t0,20(sp)
	addi	a3,a4,-1
	add	s1,a0,a2
	beq	t0,a3,.L32
	lw	a3,0(a5)
	lw	s1,0(s1)
	addi	a3,a3,-1
	beq	s1,a3,.L49
.L32:
	lw	a3,4(sp)
	ble	a3,a4,.L50
	addi	a4,a4,1
	addi	a2,a2,4
	addi	a3,a4,-1
	add	s1,a0,a2
	beq	t0,a3,.L32
	lw	a3,0(a5)
	lw	s1,0(s1)
	addi	a3,a3,-1
	bne	s1,a3,.L32
.L49:
	lw	a5,8(s0)
	add	a5,a5,a2
	j	.L45
.L50:
	lw	t0,24(sp)
	j	.L31
	.size	compute_gains, .-compute_gains
	.section	.text.compute_gains2,"ax",@progbits
	.align	2
	.globl	compute_gains2
	.hidden	compute_gains2
	.type	compute_gains2, @function
compute_gains2:
	addi	sp,sp,-48
	sw	s0,44(sp)
	sw	s1,40(sp)
	sw	a1,4(sp)
	sw	a3,12(sp)
	sw	a4,32(sp)
	ble	a0,zero,.L51
	lw	a3,48(sp)
	slli	a0,a0,4
	mv	s0,a5
	add	a4,a2,a0
	slli	a5,a1,2
	sw	a2,8(sp)
	sw	a3,16(sp)
	sw	a4,28(sp)
	sw	a5,36(sp)
.L64:
	lw	a5,8(sp)
	sw	zero,4(s0)
	sw	zero,0(s0)
	lw	a1,12(a5)
	sw	zero,4(a5)
	lw	a5,4(sp)
	ble	a5,zero,.L53
	lw	a5,8(s0)
	lw	a4,36(sp)
	add	a4,a4,a5
.L54:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a4,a5,.L54
.L53:
	lw	a5,8(sp)
	lw	t0,0(a5)
	lw	a5,16(sp)
	lw	a5,0(a5)
	sw	a5,20(sp)
	ble	t0,zero,.L55
	slli	a5,a5,2
	sw	a5,0(sp)
	lw	a5,32(sp)
	slli	a1,a1,2
	li	t1,0
	add	a1,a5,a1
	j	.L63
.L60:
	addi	t1,t1,1
	addi	a1,a1,4
	ble	t0,t1,.L55
.L63:
	lw	a5,0(a1)
	lw	a3,52(sp)
	slli	a4,a5,2
	add	a4,a3,a4
	lw	a0,0(a4)
	lw	a4,12(sp)
	slli	a5,a5,4
	li	a3,1
	add	a5,a4,a5
	lw	a4,0(sp)
	lw	t2,4(a5)
	add	a4,a0,a4
	lw	a4,0(a4)
	beq	a4,a3,.L77
	lw	a5,0(a5)
	bne	a4,a5,.L60
	lw	a5,8(s0)
	lw	a4,0(sp)
	add	a5,a5,a4
.L74:
	lw	a4,0(a5)
	addi	t1,t1,1
	addi	a1,a1,4
	add	a4,a4,t2
	sw	a4,0(a5)
	lw	a5,8(sp)
	lw	t0,0(a5)
	bgt	t0,t1,.L63
.L55:
	lw	a4,16(sp)
	lw	a5,8(sp)
	addi	s0,s0,20
	addi	a4,a4,4
	sw	a4,16(sp)
	lw	a4,28(sp)
	addi	a5,a5,16
	sw	a5,8(sp)
	bne	a5,a4,.L64
.L51:
	lw	s0,44(sp)
	lw	s1,40(sp)
	addi	sp,sp,48
	jr	ra
.L77:
	lw	a3,4(sp)
	li	a2,0
	li	a4,1
	ble	a3,zero,.L60
	sw	t0,24(sp)
	lw	t0,20(sp)
	addi	a3,a4,-1
	add	s1,a0,a2
	beq	t0,a3,.L61
	lw	a3,0(a5)
	lw	s1,0(s1)
	addi	a3,a3,-1
	beq	s1,a3,.L78
.L61:
	lw	a3,4(sp)
	ble	a3,a4,.L79
	addi	a4,a4,1
	addi	a2,a2,4
	addi	a3,a4,-1
	add	s1,a0,a2
	beq	t0,a3,.L61
	lw	a3,0(a5)
	lw	s1,0(s1)
	addi	a3,a3,-1
	bne	s1,a3,.L61
.L78:
	lw	a5,8(s0)
	add	a5,a5,a2
	j	.L74
.L79:
	lw	t0,24(sp)
	j	.L60
	.size	compute_gains2, .-compute_gains2
	.section	.text.free_nodes,"ax",@progbits
	.align	2
	.globl	free_nodes
	.hidden	free_nodes
	.type	free_nodes, @function
free_nodes:
	addi	sp,sp,-40
	sw	ra,36(sp)
	sw	s0,32(sp)
	sw	s1,28(sp)
	sw	a0,24(sp)
	sw	a1,0(sp)
	ble	a0,zero,.L80
	addi	a5,a0,-1
	sw	a5,16(sp)
	sw	a2,8(sp)
	sw	zero,20(sp)
.L82:
	lw	a5,16(sp)
	beq	a5,zero,.L86
	lw	a5,8(sp)
	sw	zero,12(sp)
	lw	a1,0(a5)
.L88:
	lw	a5,12(sp)
	li	s0,0
	slli	a5,a5,4
	add	a3,a1,a5
	sw	a5,4(sp)
	lw	a5,0(sp)
	mv	a2,a3
	ble	a5,zero,.L87
.L85:
	lw	a4,0(a3)
	slli	a5,s0,2
	mv	a2,a3
	add	a4,a4,a5
	lw	s1,0(a4)
	sw	zero,0(a4)
	beq	s1,zero,.L83
.L84:
	mv	a0,s1
	lw	s1,8(s1)
	call	free
	bne	s1,zero,.L84
	lw	a5,8(sp)
	lw	a1,0(a5)
	lw	a5,4(sp)
	add	a3,a1,a5
	mv	a2,a3
.L83:
	lw	a5,0(sp)
	addi	s0,s0,1
	bne	a5,s0,.L85
.L87:
	li	a5,-1
	sw	a5,4(a2)
	sw	a5,8(a2)
	lw	a5,12(sp)
	lw	a4,16(sp)
	sw	zero,12(a2)
	addi	a5,a5,1
	sw	a5,12(sp)
	bne	a5,a4,.L88
.L86:
	lw	a4,8(sp)
	lw	a5,20(sp)
	addi	a4,a4,4
	sw	a4,8(sp)
	lw	a4,24(sp)
	addi	a5,a5,1
	sw	a5,20(sp)
	bne	a4,a5,.L82
.L80:
	lw	ra,36(sp)
	lw	s0,32(sp)
	lw	s1,28(sp)
	addi	sp,sp,40
	jr	ra
	.size	free_nodes, .-free_nodes
	.section	.text.number_nodes,"ax",@progbits
	.align	2
	.globl	number_nodes
	.hidden	number_nodes
	.type	number_nodes, @function
number_nodes:
	addi	sp,sp,-20
	sw	s0,16(sp)
	sw	s1,12(sp)
	sw	a0,4(sp)
	sw	zero,0(a2)
	sw	a3,8(sp)
	ble	a0,zero,.L101
	mv	t1,a2
	mv	t0,a1
	addi	t2,a0,-1
	slli	s1,a1,2
	sw	zero,0(sp)
.L103:
	beq	t2,zero,.L107
	lw	a5,0(sp)
	li	a0,0
	slli	s0,a5,2
	lw	a5,8(sp)
	add	s0,a5,s0
.L110:
	ble	t0,zero,.L109
	lw	a5,0(s0)
	slli	a4,a0,4
	add	a5,a5,a4
	lw	a3,0(a5)
	add	a2,a3,s1
.L106:
	lw	a4,0(a3)
	beq	a4,zero,.L104
	lw	a5,0(t1)
	addi	a5,a5,1
.L105:
	lw	a4,8(a4)
	mv	a1,a5
	addi	a5,a5,1
	bne	a4,zero,.L105
	sw	a1,0(t1)
.L104:
	addi	a3,a3,4
	bne	a2,a3,.L106
.L109:
	addi	a0,a0,1
	bne	t2,a0,.L110
.L107:
	lw	a5,0(sp)
	lw	a4,4(sp)
	addi	a5,a5,1
	sw	a5,0(sp)
	bne	a4,a5,.L103
.L101:
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,20
	jr	ra
	.size	number_nodes, .-number_nodes
	.section	.text.find_move_set,"ax",@progbits
	.align	2
	.globl	find_move_set
	.hidden	find_move_set
	.type	find_move_set, @function
find_move_set:
	li	a5,-1
	sw	a5,0(a2)
	ble	a1,zero,.L125
	addi	a3,a0,12
	li	a4,0
	li	a5,0
	li	a0,0
.L124:
	lw	t1,0(a3)
	addi	a3,a3,16
	add	a5,a5,t1
	ble	a5,a0,.L123
	sw	a4,0(a2)
	mv	a0,a5
.L123:
	addi	a4,a4,1
	bne	a1,a4,.L124
	ret
.L125:
	li	a0,0
	ret
	.size	find_move_set, .-find_move_set
	.section	.rodata.move_cells.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"%d %d %d\n"
	.section	.text.move_cells,"ax",@progbits
	.align	2
	.globl	move_cells
	.hidden	move_cells
	.type	move_cells, @function
move_cells:
	addi	sp,sp,-44
	sw	s1,32(sp)
	mv	t0,a0
	sw	a0,12(sp)
	sw	ra,40(sp)
	sw	s0,36(sp)
	li	a0,1
	sw	a1,24(sp)
	sw	a3,20(sp)
	sw	a4,8(sp)
	sw	a5,16(sp)
	lw	s1,52(sp)
	lw	t1,56(sp)
	mv	t2,a2
	beq	t0,a0,.L151
.L128:
	lw	a5,8(sp)
	blt	a5,zero,.L141
.L155:
	lw	s0,20(sp)
	li	a5,0
	sw	t2,28(sp)
	sw	zero,0(sp)
	mv	t2,a5
.L133:
	lw	a5,12(sp)
	li	a4,1
	beq	a5,a4,.L152
.L130:
	lw	a5,48(sp)
	lw	a4,0(s0)
	lw	a3,8(s0)
	lw	a5,0(a5)
	slli	a4,a4,2
	slli	a1,a3,2
	add	a5,a5,a4
	sw	a3,0(a5)
	lw	a5,48(sp)
	lw	a4,4(s0)
	add	a1,a1,a3
	lw	a2,4(a5)
	lw	a5,12(s0)
	slli	a1,a1,2
	sw	a5,4(sp)
	slli	a5,a4,2
	add	a4,a5,a4
	slli	a4,a4,2
	add	a4,a2,a4
	lw	a0,0(a4)
	add	a2,a2,a1
	addi	a0,a0,-1
	sw	a0,0(a4)
	lw	a0,0(s0)
	lw	a1,0(a2)
	slli	a3,a0,4
	add	a3,s1,a3
	lw	t0,8(a3)
	lw	a0,12(a4)
	addi	a1,a1,1
	sub	a0,a0,t0
	sw	a0,12(a4)
	lw	a0,12(a2)
	lw	a4,0(a3)
	sw	a1,0(a2)
	add	a0,a0,t0
	lw	a1,0(sp)
	sw	a0,12(a2)
	lw	a2,4(sp)
	lw	a3,12(a3)
	add	a2,a1,a2
	sw	a2,0(sp)
	ble	a4,zero,.L131
	lw	a4,60(sp)
	slli	a3,a3,2
	li	a2,0
	add	a3,a4,a3
	j	.L132
.L153:
	lw	a5,4(s0)
	slli	a5,a5,2
.L132:
	lw	a4,0(a3)
	addi	a2,a2,1
	addi	a3,a3,4
	slli	a4,a4,4
	add	a4,t1,a4
	lw	a4,12(a4)
	add	a5,a4,a5
	lw	a1,0(a5)
	addi	a1,a1,-1
	sw	a1,0(a5)
	lw	a5,8(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,0(a5)
	addi	a4,a4,1
	sw	a4,0(a5)
	lw	a5,0(s0)
	slli	a5,a5,4
	add	a5,s1,a5
	lw	a5,0(a5)
	bgt	a5,a2,.L153
.L131:
	lw	a5,8(sp)
	addi	t2,t2,1
	addi	s0,s0,16
	bge	a5,t2,.L133
	lw	t2,28(sp)
.L129:
	lw	a5,8(sp)
	lw	a2,16(sp)
	slli	s1,a5,4
	addi	s0,a5,1
	lw	a5,20(sp)
	add	s1,a5,s1
	li	a5,1
	bge	s0,t2,.L139
	mv	a4,s1
	lw	t1,12(sp)
	lw	t0,44(sp)
	mv	s1,a2
	j	.L138
.L137:
	addi	a4,a4,16
	beq	t2,s0,.L139
.L138:
	addi	s0,s0,1
	bne	t1,a5,.L137
	lw	a0,28(a4)
	lw	a1,0(t0)
	lw	a3,16(sp)
	sub	s1,s1,a0
	mv	a2,s1
	lla	a0,.LC1
	sw	t2,20(sp)
	sw	t1,8(sp)
	sw	a4,4(sp)
	sw	t0,44(sp)
	call	printf
	lw	t0,44(sp)
	lw	a4,4(sp)
	lw	t2,20(sp)
	lw	a3,0(t0)
	lw	t1,8(sp)
	li	a5,1
	addi	a3,a3,1
	sw	a3,0(t0)
	addi	a4,a4,16
	bne	t2,s0,.L138
.L139:
	lw	a5,24(sp)
	li	s0,1
	bge	t2,a5,.L127
	lw	a5,12(sp)
	lw	a4,24(sp)
	lw	a3,16(sp)
	lw	t1,44(sp)
	mv	s1,t2
.L135:
	addi	s1,s1,1
	beq	a5,s0,.L154
	bne	a4,s1,.L135
.L127:
	lw	ra,40(sp)
	lw	s0,36(sp)
	lw	a0,0(sp)
	lw	s1,32(sp)
	addi	sp,sp,44
	jr	ra
.L152:
	lw	a4,44(sp)
	lw	a5,12(s0)
	lla	a0,.LC1
	lw	a1,0(a4)
	lw	a4,16(sp)
	sw	t1,56(sp)
	sw	t2,4(sp)
	sub	a5,a4,a5
	mv	a3,a5
	mv	a2,a5
	sw	a5,16(sp)
	call	printf
	lw	a5,44(sp)
	lw	a4,44(sp)
	lw	t1,56(sp)
	lw	a5,0(a5)
	lw	t2,4(sp)
	addi	a5,a5,1
	sw	a5,0(a4)
	j	.L130
.L154:
	lw	a1,0(t1)
	mv	a2,a3
	lla	a0,.LC1
	sw	a4,12(sp)
	sw	a5,8(sp)
	sw	t1,44(sp)
	sw	a3,4(sp)
	call	printf
	lw	t1,44(sp)
	lw	a4,12(sp)
	lw	a5,8(sp)
	lw	a1,0(t1)
	lw	a3,4(sp)
	addi	a1,a1,1
	sw	a1,0(t1)
	bne	a4,s1,.L135
	j	.L127
.L151:
	lw	a5,44(sp)
	lw	a5,0(a5)
	bne	a5,zero,.L128
	lw	a3,16(sp)
	sw	a2,0(sp)
	li	a1,0
	mv	a2,a3
	lla	a0,.LC1
	call	printf
	lw	a5,44(sp)
	lw	a4,44(sp)
	lw	t1,56(sp)
	lw	a5,0(a5)
	lw	t2,0(sp)
	addi	a5,a5,1
	sw	a5,0(a4)
	lw	a5,8(sp)
	bge	a5,zero,.L155
.L141:
	sw	zero,0(sp)
	j	.L129
	.size	move_cells, .-move_cells
	.section	.text.find_cut_size,"ax",@progbits
	.align	2
	.globl	find_cut_size
	.hidden	find_cut_size
	.type	find_cut_size, @function
find_cut_size:
	addi	sp,sp,-8
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	zero,8(a4)
	mv	s1,a2
	mv	s0,a4
	li	a2,0
	li	a4,0
	ble	a0,zero,.L169
.L163:
	ble	a1,zero,.L161
	lw	t2,0(a3)
	lw	a5,12(a3)
	li	t1,0
.L160:
	lw	t0,0(a5)
	addi	t1,t1,1
	addi	a5,a5,4
	beq	t0,t2,.L159
	bne	a1,t1,.L160
.L161:
	addi	a2,a2,1
	addi	a3,a3,16
	bne	a0,a2,.L163
.L170:
	lw	s0,4(sp)
	sub	a0,s1,a4
	lw	s1,0(sp)
	addi	sp,sp,8
	jr	ra
.L159:
	lw	a5,4(a3)
	addi	a2,a2,1
	addi	a3,a3,16
	add	a4,a4,a5
	sw	a4,8(s0)
	bne	a0,a2,.L163
	j	.L170
.L169:
	lw	s0,4(sp)
	mv	a0,s1
	lw	s1,0(sp)
	addi	sp,sp,8
	jr	ra
	.size	find_cut_size, .-find_cut_size
	.section	.text.copy_nets_info,"ax",@progbits
	.align	2
	.globl	copy_nets_info
	.hidden	copy_nets_info
	.type	copy_nets_info, @function
copy_nets_info:
	ble	a0,zero,.L179
	addi	sp,sp,-4
	sw	s0,0(sp)
	addi	t0,a2,12
	slli	s0,a1,2
	li	t2,0
.L173:
	ble	a1,zero,.L176
	lw	a5,0(t0)
	lw	a4,0(a3)
	add	t1,a5,s0
.L174:
	lw	a2,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a2,-4(a4)
	bne	a5,t1,.L174
.L176:
	addi	t2,t2,1
	addi	t0,t0,16
	addi	a3,a3,4
	bne	a0,t2,.L173
	lw	s0,0(sp)
	addi	sp,sp,4
	jr	ra
.L179:
	ret
	.size	copy_nets_info, .-copy_nets_info
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
