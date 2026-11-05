#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"core_list_join.c"
	.option nopic
	.text
	.section	.text.cmp_idx,"ax",@progbits
	.align	2
	.globl	cmp_idx
	.hidden	cmp_idx
	.type	cmp_idx, @function
cmp_idx:
	beq	a2,zero,.L4
	lh	a0,2(a0)
	lh	a5,2(a1)
	sub	a0,a0,a5
	ret
.L4:
	lh	a5,0(a0)
	slli	a4,a5,16
	srli	a4,a4,16
	srli	a4,a4,8
	andi	a5,a5,-256
	or	a5,a5,a4
	sh	a5,0(a0)
	lh	a5,0(a1)
	lh	a0,2(a0)
	slli	a4,a5,16
	srli	a4,a4,16
	srli	a4,a4,8
	andi	a5,a5,-256
	or	a5,a5,a4
	sh	a5,0(a1)
	lh	a5,2(a1)
	sub	a0,a0,a5
	ret
	.size	cmp_idx, .-cmp_idx
	.section	.text.calc_func,"ax",@progbits
	.align	2
	.globl	calc_func
	.hidden	calc_func
	.type	calc_func, @function
calc_func:
	addi	sp,sp,-20
	sw	s0,12(sp)
	lh	s0,0(a0)
	sw	ra,16(sp)
	sw	s1,8(sp)
	srai	a5,s0,7
	andi	a5,a5,1
	beq	a5,zero,.L6
	lw	ra,16(sp)
	andi	a0,s0,127
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L6:
	srai	a4,s0,3
	andi	a4,a4,15
	mv	t1,a1
	andi	a3,s0,7
	slli	a1,a4,4
	lhu	a5,56(t1)
	mv	s1,a0
	or	a1,a1,a4
	beq	a3,zero,.L8
	li	a4,1
	beq	a3,a4,.L9
	slli	a0,s0,16
	srli	a0,a0,16
	sw	s0,4(sp)
.L10:
	mv	a1,a5
	sw	t1,0(sp)
	call	crcu16
	lw	a4,4(sp)
	lw	t1,0(sp)
	mv	a5,a0
	andi	s0,s0,-256
	andi	a0,a4,127
	or	s0,a0,s0
	sh	a5,56(t1)
	ori	s0,s0,128
	sh	s0,0(s1)
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L8:
	li	a3,34
	mv	a4,a1
	bge	a1,a3,.L11
	li	a4,34
.L11:
	lh	a3,2(t1)
	lh	a2,0(t1)
	lw	a1,20(t1)
	lw	a0,24(t1)
	andi	a4,a4,0xff
	sw	t1,0(sp)
	call	core_bench_state
	lw	t1,0(sp)
	slli	a4,a0,16
	srai	a4,a4,16
	lhu	a5,62(t1)
	sw	a4,4(sp)
	bne	a5,zero,.L17
	lhu	a5,56(t1)
	sh	a0,62(t1)
	j	.L10
.L9:
	mv	a2,a5
	addi	a0,t1,40
	sw	t1,0(sp)
	call	core_bench_matrix
	lw	t1,0(sp)
	slli	a4,a0,16
	srai	a4,a4,16
	lhu	a5,60(t1)
	sw	a4,4(sp)
	bne	a5,zero,.L17
	lhu	a5,56(t1)
	sh	a0,60(t1)
	j	.L10
.L17:
	lhu	a5,56(t1)
	j	.L10
	.size	calc_func, .-calc_func
	.section	.text.cmp_complex,"ax",@progbits
	.align	2
	.globl	cmp_complex
	.hidden	cmp_complex
	.type	cmp_complex, @function
cmp_complex:
	addi	sp,sp,-12
	sw	s1,0(sp)
	mv	s1,a1
	mv	a1,a2
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a2
	call	calc_func
	mv	a5,a0
	mv	a1,s0
	mv	a0,s1
	mv	s0,a5
	call	calc_func
	lw	ra,8(sp)
	sub	a0,s0,a0
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	cmp_complex, .-cmp_complex
	.section	.text.copy_info,"ax",@progbits
	.align	2
	.globl	copy_info
	.hidden	copy_info
	.type	copy_info, @function
copy_info:
	lh	a4,0(a1)
	lh	a5,2(a1)
	sh	a4,0(a0)
	sh	a5,2(a0)
	ret
	.size	copy_info, .-copy_info
	.section	.text.core_list_insert_new,"ax",@progbits
	.align	2
	.globl	core_list_insert_new
	.hidden	core_list_insert_new
	.type	core_list_insert_new, @function
core_list_insert_new:
	lw	t1,0(a2)
	addi	t0,t1,8
	bgeu	t0,a4,.L24
	lw	a4,0(a3)
	addi	t2,a4,4
	bleu	a5,t2,.L24
	sw	t0,0(a2)
	lw	a5,0(a0)
	lh	t0,0(a1)
	lh	a2,2(a1)
	sw	a5,0(t1)
	sw	t1,0(a0)
	sw	a4,4(t1)
	lw	a5,0(a3)
	mv	a0,t1
	addi	a5,a5,4
	sw	a5,0(a3)
	lw	a5,4(t1)
	sh	t0,0(a5)
	sh	a2,2(a5)
	ret
.L24:
	li	t1,0
	mv	a0,t1
	ret
	.size	core_list_insert_new, .-core_list_insert_new
	.section	.text.core_list_remove,"ax",@progbits
	.align	2
	.globl	core_list_remove
	.hidden	core_list_remove
	.type	core_list_remove, @function
core_list_remove:
	mv	a5,a0
	lw	a0,0(a0)
	lw	a3,4(a5)
	lw	a2,4(a0)
	lw	a4,0(a0)
	sw	a2,4(a5)
	sw	a3,4(a0)
	sw	a4,0(a5)
	sw	zero,0(a0)
	ret
	.size	core_list_remove, .-core_list_remove
	.section	.text.core_list_undo_remove,"ax",@progbits
	.align	2
	.globl	core_list_undo_remove
	.hidden	core_list_undo_remove
	.type	core_list_undo_remove, @function
core_list_undo_remove:
	lw	a2,4(a1)
	lw	a3,4(a0)
	lw	a4,0(a1)
	sw	a2,4(a0)
	sw	a3,4(a1)
	sw	a4,0(a0)
	sw	a0,0(a1)
	ret
	.size	core_list_undo_remove, .-core_list_undo_remove
	.section	.text.core_list_find,"ax",@progbits
	.align	2
	.globl	core_list_find
	.hidden	core_list_find
	.type	core_list_find, @function
core_list_find:
	lh	a4,2(a1)
	blt	a4,zero,.L40
	bne	a0,zero,.L31
	j	.L41
.L32:
	lw	a0,0(a0)
	beq	a0,zero,.L35
.L31:
	lw	a5,4(a0)
	lh	a5,2(a5)
	bne	a5,a4,.L32
	ret
.L40:
	beq	a0,zero,.L35
	lh	a4,0(a1)
	j	.L30
.L33:
	lw	a0,0(a0)
	beq	a0,zero,.L27
.L30:
	lw	a5,4(a0)
	lbu	a5,0(a5)
	bne	a5,a4,.L33
	ret
.L35:
	li	a0,0
.L27:
	ret
.L41:
	ret
	.size	core_list_find, .-core_list_find
	.section	.text.core_list_reverse,"ax",@progbits
	.align	2
	.globl	core_list_reverse
	.hidden	core_list_reverse
	.type	core_list_reverse, @function
core_list_reverse:
	beq	a0,zero,.L43
	li	a4,0
	j	.L44
.L45:
	mv	a0,a5
.L44:
	lw	a5,0(a0)
	sw	a4,0(a0)
	mv	a4,a0
	bne	a5,zero,.L45
.L43:
	ret
	.size	core_list_reverse, .-core_list_reverse
	.section	.text.core_list_mergesort,"ax",@progbits
	.align	2
	.globl	core_list_mergesort
	.hidden	core_list_mergesort
	.type	core_list_mergesort, @function
core_list_mergesort:
	addi	sp,sp,-44
	sw	s0,36(sp)
	sw	s1,32(sp)
	sw	ra,40(sp)
	mv	s0,a0
	sw	a1,20(sp)
	li	s1,1
.L66:
	beq	s0,zero,.L50
	li	a3,0
	mv	a4,s0
	sw	zero,24(sp)
	mv	s0,s1
	sw	zero,16(sp)
	mv	s1,a3
.L64:
	lw	a5,24(sp)
	mv	a1,a4
	addi	a5,a5,1
	sw	a5,24(sp)
	li	a5,0
.L53:
	lw	a1,0(a1)
	addi	a5,a5,1
	beq	a1,zero,.L54
	bne	s0,a5,.L53
.L54:
	mv	t0,a4
	sw	s0,28(sp)
	mv	t1,s0
	mv	a4,a1
	mv	s0,s1
	mv	s1,t0
	beq	a5,zero,.L76
.L60:
	beq	t1,zero,.L75
	beq	a4,zero,.L75
	lw	a1,4(a4)
	sw	a5,8(sp)
	lw	a0,4(s1)
	lw	a5,20(sp)
	sw	t1,12(sp)
	sw	a4,4(sp)
	sw	a2,0(sp)
	jalr	a5
	lw	a2,0(sp)
	lw	a4,4(sp)
	lw	a5,8(sp)
	lw	t1,12(sp)
	ble	a0,zero,.L75
	mv	a3,a4
	lw	a4,0(a4)
	addi	t1,t1,-1
.L55:
	beq	s0,zero,.L67
.L78:
	sw	a3,0(s0)
	mv	s0,a3
.L79:
	bne	a5,zero,.L60
.L76:
	beq	t1,zero,.L61
	beq	a4,zero,.L77
	mv	a3,a4
	addi	t1,t1,-1
	lw	a4,0(a4)
	bne	s0,zero,.L78
.L67:
	sw	a3,16(sp)
	mv	s0,a3
	j	.L79
.L75:
	mv	a3,s1
	addi	a5,a5,-1
	lw	s1,0(s1)
	j	.L55
.L61:
	mv	s1,s0
	lw	s0,28(sp)
	bne	a4,zero,.L64
	mv	a3,s1
	mv	s1,s0
	j	.L63
.L77:
	lw	s1,28(sp)
	mv	a3,s0
.L63:
	lw	a4,24(sp)
	sw	zero,0(a3)
	li	a5,1
	beq	a4,a5,.L73
	lw	s0,16(sp)
	slli	s1,s1,1
	j	.L66
.L50:
	sw	zero,0(zero)
	ebreak
.L73:
	lw	ra,40(sp)
	lw	s0,36(sp)
	lw	a0,16(sp)
	lw	s1,32(sp)
	addi	sp,sp,44
	jr	ra
	.size	core_list_mergesort, .-core_list_mergesort
	.section	.text.core_bench_list,"ax",@progbits
	.align	2
	.globl	core_bench_list
	.hidden	core_bench_list
	.type	core_bench_list, @function
core_bench_list:
	mv	a2,a0
	lh	a0,4(a0)
	addi	sp,sp,-24
	sw	s0,16(sp)
	sw	ra,20(sp)
	sw	s1,12(sp)
	sw	a1,0(sp)
	lw	s0,36(a2)
	ble	a0,zero,.L107
	mv	t1,a1
	li	t2,0
	li	ra,0
	li	s1,0
	li	a1,0
.L94:
	andi	t0,t2,0xff
	blt	t1,zero,.L147
	beq	s0,zero,.L83
	mv	a5,s0
	j	.L85
.L87:
	lw	a5,0(a5)
	beq	a5,zero,.L86
.L85:
	lw	a4,4(a5)
	lh	a4,2(a4)
	bne	a4,t1,.L87
.L86:
	li	a3,0
	j	.L89
.L109:
	mv	a3,s0
	mv	s0,a4
.L89:
	lw	a4,0(s0)
	sw	a3,0(s0)
	bne	a4,zero,.L109
	beq	a5,zero,.L148
	lw	a4,4(a5)
	addi	s1,s1,1
	slli	s1,s1,16
	lh	a4,0(a4)
	srli	s1,s1,16
	andi	a3,a4,1
	beq	a3,zero,.L92
	srai	a4,a4,9
	andi	a4,a4,1
	add	a4,a1,a4
	slli	a1,a4,16
	srli	a1,a1,16
.L92:
	lw	a4,0(a5)
	beq	a4,zero,.L91
	lw	a3,0(a4)
	sw	a3,0(a5)
	lw	a5,0(s0)
	sw	a5,0(a4)
	sw	a4,0(s0)
.L91:
	blt	t1,zero,.L93
	addi	t1,t1,1
	slli	t1,t1,16
	srai	t1,t1,16
.L93:
	addi	t2,t2,1
	slli	t2,t2,16
	srai	t2,t2,16
	bne	a0,t2,.L94
	slli	a5,s1,2
	sub	a5,a5,ra
	add	a5,a1,a5
	slli	a5,a5,16
	srli	a5,a5,16
.L81:
	lw	a4,0(sp)
	ble	a4,zero,.L95
	mv	a0,s0
	lla	a1,cmp_complex
	sw	a5,8(sp)
	sw	t1,4(sp)
	sw	t0,0(sp)
	call	core_list_mergesort
	lw	a5,8(sp)
	lw	t1,4(sp)
	lw	t0,0(sp)
	mv	s0,a0
.L95:
	lw	a3,0(s0)
	mv	s1,s0
	lw	a4,0(a3)
	lw	a1,4(a3)
	lw	a0,4(a4)
	lw	a2,0(a4)
	sw	a4,0(sp)
	sw	a0,4(a3)
	sw	a1,4(a4)
	sw	a2,0(a3)
	sw	zero,0(a4)
	blt	t1,zero,.L97
.L96:
	lw	a4,4(s1)
	lh	a4,2(a4)
	beq	a4,t1,.L144
	lw	s1,0(s1)
	bne	s1,zero,.L96
	lw	s1,0(s0)
	beq	s1,zero,.L106
.L144:
	mv	a1,a5
.L102:
	lw	a5,4(s0)
	lh	a0,0(a5)
	call	crc16
	lw	s1,0(s1)
	mv	a1,a0
	bne	s1,zero,.L102
	lw	a4,0(sp)
	lw	s1,0(s0)
	mv	a5,a0
	lw	a1,4(a4)
.L106:
	lw	a0,4(s1)
	sw	a5,4(sp)
	lw	a5,0(sp)
	lw	a3,0(s1)
	li	a2,0
	sw	a0,4(a5)
	sw	a1,4(s1)
	sw	a3,0(a5)
	sw	a5,0(s1)
	mv	a0,s0
	lla	a1,cmp_idx
	call	core_list_mergesort
	lw	s0,0(a0)
	lw	a5,4(sp)
	mv	s1,a0
	beq	s0,zero,.L111
	mv	a1,a5
.L104:
	lw	a5,4(s1)
	lh	a0,0(a5)
	call	crc16
	lw	s0,0(s0)
	mv	a1,a0
	bne	s0,zero,.L104
	mv	a5,a0
.L111:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	mv	a0,a5
	addi	sp,sp,24
	jr	ra
.L97:
	lw	a4,4(s1)
	lbu	a4,0(a4)
	beq	a4,t0,.L144
	lw	s1,0(s1)
	bne	s1,zero,.L97
	lw	s1,0(s0)
	bne	s1,zero,.L144
	j	.L106
.L147:
	beq	s0,zero,.L83
	mv	a5,s0
	j	.L84
.L88:
	lw	a5,0(a5)
	beq	a5,zero,.L86
.L84:
	lw	a4,4(a5)
	lbu	a4,0(a4)
	bne	a4,t0,.L88
	j	.L86
.L148:
	lw	a5,4(a3)
	addi	ra,ra,1
	slli	ra,ra,16
	lb	a5,1(a5)
	srli	ra,ra,16
	andi	a5,a5,1
	add	a5,a1,a5
	slli	a1,a5,16
	srli	a1,a1,16
	j	.L91
.L107:
	lw	t1,0(sp)
	li	a5,0
	li	t0,0
	j	.L81
.L83:
	lw	a5,0(zero)
	ebreak
	.size	core_bench_list, .-core_bench_list
	.globl	__udivsi3
	.section	.text.core_list_init,"ax",@progbits
	.align	2
	.globl	core_list_init
	.hidden	core_list_init
	.type	core_list_init, @function
core_list_init:
	addi	sp,sp,-28
	sw	s1,16(sp)
	mv	s1,a1
	li	a1,20
	sw	s0,20(sp)
	sw	ra,24(sp)
	sw	a2,12(sp)
	call	__udivsi3
	addi	a0,a0,-2
	slli	t2,a0,3
	add	t2,s1,t2
	li	a5,-32768
	slli	a3,a0,2
	add	a3,t2,a3
	sw	zero,0(s1)
	sw	t2,4(s1)
	addi	a4,a5,128
	sh	a4,0(t2)
	sw	a3,4(sp)
	sh	zero,2(t2)
	addi	a4,s1,16
	mv	a1,a3
	addi	s0,s1,8
	addi	a3,t2,4
	bleu	t2,a4,.L160
	addi	a2,t2,8
	bleu	a1,a2,.L160
	sw	a3,12(s1)
	sw	zero,8(s1)
	sw	s0,0(s1)
	not	a5,a5
	li	a3,-1
	sh	a3,4(t2)
	sh	a5,6(t2)
.L150:
	beq	a0,zero,.L151
	lhu	a5,12(sp)
	li	a3,0
	sw	a5,0(sp)
	li	a5,-32768
	xori	a5,a5,-1
	sw	a5,8(sp)
.L153:
	lw	a5,0(sp)
	slli	a1,a3,16
	srli	a1,a1,16
	xor	a5,a1,a5
	slli	a5,a5,3
	andi	a1,a1,7
	andi	a5,a5,120
	or	a5,a5,a1
	slli	a1,a5,8
	addi	t1,a4,8
	addi	a3,a3,1
	addi	t0,a2,4
	or	a1,a1,a5
	bleu	t2,t1,.L152
	lw	a5,4(sp)
	bleu	a5,t0,.L152
	sw	s0,0(a4)
	lw	a5,8(sp)
	sw	a4,0(s1)
	sw	a2,4(a4)
	sh	a1,0(a2)
	sh	a5,2(a2)
	mv	s0,a4
	mv	a2,t0
	mv	a4,t1
.L152:
	bne	a0,a3,.L153
.L151:
	lw	a3,0(s0)
	beq	a3,zero,.L158
	li	a1,5
	sw	a3,0(sp)
	call	__udivsi3
	li	a1,16384
	lw	a3,0(sp)
	lw	t1,12(sp)
	li	a4,512
	li	a2,1
	addi	a1,a1,-1
	j	.L157
.L167:
	slli	a5,a2,16
	lw	t0,0(a3)
	srai	a5,a5,16
	addi	a4,a4,256
	slli	a4,a4,16
	sh	a5,2(t2)
	mv	s0,a3
	addi	a2,a2,1
	srli	a4,a4,16
	beq	t0,zero,.L158
.L161:
	mv	a3,t0
.L157:
	andi	a5,a4,1792
	xor	t0,t1,a2
	or	a5,a5,t0
	lw	t2,4(s0)
	and	a5,a5,a1
	bgtu	a0,a2,.L167
	lw	t0,0(a3)
	slli	a5,a5,16
	srai	a5,a5,16
	addi	a4,a4,256
	slli	a4,a4,16
	sh	a5,2(t2)
	mv	s0,a3
	addi	a2,a2,1
	srli	a4,a4,16
	bne	t0,zero,.L161
.L158:
	lw	s0,20(sp)
	lw	ra,24(sp)
	mv	a0,s1
	lw	s1,16(sp)
	li	a2,0
	lla	a1,cmp_idx
	addi	sp,sp,28
	tail	core_list_mergesort
.L160:
	mv	a4,s0
	mv	a2,a3
	li	s0,0
	j	.L150
	.size	core_list_init, .-core_list_init
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
