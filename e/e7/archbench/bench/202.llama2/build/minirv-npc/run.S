#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"run.c"
	.option nopic
	.text
	.section	.text.compare,"ax",@progbits
	.align	2
	.globl	compare
	.hidden	compare
	.type	compare, @function
compare:
	lw	a0,0(a0)
	lw	a5,0(a1)
	bgt	a0,a5,.L3
	slt	a0,a0,a5
	ret
.L3:
	li	a0,-1
	ret
	.size	compare, .-compare
	.section	.text.compare_tokens,"ax",@progbits
	.align	2
	.globl	compare_tokens
	.hidden	compare_tokens
	.type	compare_tokens, @function
compare_tokens:
	lw	a1,0(a1)
	lw	a0,0(a0)
	tail	strcmp
	.size	compare_tokens, .-compare_tokens
	.globl	__mulsi3
	.globl	__divsi3
	.section	.rodata.malloc_run_state.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"malloc failed!\n"
	.section	.text.malloc_run_state,"ax",@progbits
	.align	2
	.globl	malloc_run_state
	.hidden	malloc_run_state
	.type	malloc_run_state, @function
malloc_run_state:
	addi	sp,sp,-16
	lw	a4,0(a1)
	sw	s0,8(sp)
	mv	s0,a1
	lw	a1,16(a1)
	sw	s1,4(sp)
	mv	s1,a0
	mv	a0,a4
	sw	ra,12(sp)
	sw	a4,0(sp)
	call	__mulsi3
	lw	a1,12(s0)
	call	__divsi3
	lw	a4,0(sp)
	mv	a5,a0
	li	a1,4
	mv	a0,a4
	sw	a5,0(sp)
	call	calloc
	mv	a4,a0
	lw	a0,0(s0)
	li	a1,4
	sw	a4,0(s1)
	call	calloc
	mv	a4,a0
	lw	a0,0(s0)
	li	a1,4
	sw	a4,4(s1)
	call	calloc
	mv	a4,a0
	lw	a0,4(s0)
	li	a1,4
	sw	a4,8(s1)
	call	calloc
	mv	a4,a0
	lw	a0,4(s0)
	li	a1,4
	sw	a4,12(s1)
	call	calloc
	mv	a4,a0
	lw	a0,0(s0)
	li	a1,4
	sw	a4,16(s1)
	call	calloc
	mv	a4,a0
	lw	a1,24(s0)
	lw	a0,8(s0)
	sw	a4,20(s1)
	call	__mulsi3
	lw	a5,0(sp)
	mv	a1,a5
	call	__mulsi3
	li	a1,4
	call	calloc
	mv	a4,a0
	lw	a1,24(s0)
	lw	a0,8(s0)
	sw	a4,40(s1)
	call	__mulsi3
	lw	a5,0(sp)
	mv	a1,a5
	call	__mulsi3
	li	a1,4
	call	calloc
	mv	a5,a0
	lw	a1,24(s0)
	lw	a0,12(s0)
	sw	a5,44(s1)
	call	__mulsi3
	li	a1,4
	call	calloc
	mv	a5,a0
	lw	a0,20(s0)
	li	a1,4
	sw	a5,32(s1)
	call	calloc
	lw	a5,0(s1)
	sw	a0,36(s1)
	beq	a5,zero,.L7
	lw	a5,4(s1)
	beq	a5,zero,.L7
	lw	a5,8(s1)
	beq	a5,zero,.L7
	lw	a5,12(s1)
	beq	a5,zero,.L7
	lw	a5,16(s1)
	beq	a5,zero,.L7
	lw	a5,20(s1)
	beq	a5,zero,.L7
	lw	a5,40(s1)
	beq	a5,zero,.L7
	lw	a5,44(s1)
	beq	a5,zero,.L7
	lw	a5,32(s1)
	beq	a5,zero,.L7
	beq	a0,zero,.L7
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L7:
	lla	a0,.LC0
	call	printf
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	tail	bench_exit
	.size	malloc_run_state, .-malloc_run_state
	.section	.text.free_run_state,"ax",@progbits
	.align	2
	.globl	free_run_state
	.hidden	free_run_state
	.type	free_run_state, @function
free_run_state:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a0
	lw	a0,0(a0)
	sw	ra,8(sp)
	call	free
	lw	a0,4(s0)
	call	free
	lw	a0,8(s0)
	call	free
	lw	a0,12(s0)
	call	free
	lw	a0,16(s0)
	call	free
	lw	a0,20(s0)
	call	free
	lw	a0,32(s0)
	call	free
	lw	a0,36(s0)
	call	free
	lw	a0,40(s0)
	call	free
	lw	a0,44(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	free
	.size	free_run_state, .-free_run_state
	.section	.text.preprocess_to_fixedpt,"ax",@progbits
	.align	2
	.globl	preprocess_to_fixedpt
	.hidden	preprocess_to_fixedpt
	.type	preprocess_to_fixedpt, @function
preprocess_to_fixedpt:
	slli	a2,a1,2
	li	t1,8388608
	add	a2,a0,a2
	addi	t2,t1,-1
	li	t0,132
	ble	a1,zero,.L39
.L44:
	lw	a3,0(a0)
	srli	a4,a3,23
	andi	a4,a4,0xff
	addi	a1,a4,-132
	and	a5,a3,t2
	sub	a4,t0,a4
	add	a5,a5,t1
	blt	a1,zero,.L41
	sll	a5,a5,a1
.L42:
	bge	a3,zero,.L43
	neg	a5,a5
.L43:
	sw	a5,0(a0)
	addi	a0,a0,4
	bne	a2,a0,.L44
.L39:
	ret
.L41:
	srl	a5,a5,a4
	j	.L42
	.size	preprocess_to_fixedpt, .-preprocess_to_fixedpt
	.section	.text.memory_map_weights,"ax",@progbits
	.align	2
	.globl	memory_map_weights
	.hidden	memory_map_weights
	.type	memory_map_weights, @function
memory_map_weights:
	addi	sp,sp,-40
	lw	a5,0(a1)
	sw	s0,32(sp)
	mv	s0,a1
	lw	a1,12(a1)
	mv	a4,a0
	mv	a0,a5
	sw	ra,36(sp)
	sw	a3,24(sp)
	sw	s1,28(sp)
	sw	a5,4(sp)
	sw	a4,0(sp)
	sw	a2,8(sp)
	call	__divsi3
	lw	a5,4(sp)
	lw	a2,8(sp)
	mv	a4,a0
	mv	a0,a5
	lw	a5,0(sp)
	lw	a1,20(s0)
	lw	s1,8(s0)
	sw	a2,0(a5)
	sw	a4,4(sp)
	call	__mulsi3
	mv	a1,a0
	lw	a0,8(sp)
	call	preprocess_to_fixedpt
	lw	a4,0(s0)
	lw	a1,20(s0)
	mv	a0,a4
	sw	a4,16(sp)
	call	__mulsi3
	lw	a2,8(sp)
	lw	a4,16(sp)
	lw	a3,0(sp)
	lw	a1,8(s0)
	slli	a5,a0,2
	add	a5,a2,a5
	sw	a5,4(a3)
	mv	a0,a4
	sw	a5,12(sp)
	call	__mulsi3
	lw	a5,12(sp)
	mv	a1,a0
	mv	a0,a5
	call	preprocess_to_fixedpt
	lw	a1,0(s0)
	mv	a0,s1
	call	__mulsi3
	lw	a5,12(sp)
	lw	a3,0(sp)
	slli	a2,a0,2
	lw	a1,12(s0)
	sw	a0,16(sp)
	lw	a0,4(sp)
	add	a5,a5,a2
	sw	a5,12(a3)
	sw	a5,12(sp)
	call	__mulsi3
	lw	a4,16(sp)
	mv	a1,a0
	mv	a0,a4
	call	__mulsi3
	lw	a5,12(sp)
	mv	a1,a0
	mv	a0,a5
	sw	a5,20(sp)
	call	preprocess_to_fixedpt
	lw	a1,0(s0)
	mv	a0,s1
	call	__mulsi3
	lw	a1,12(s0)
	sw	a0,12(sp)
	lw	a0,4(sp)
	call	__mulsi3
	lw	a4,12(sp)
	mv	a1,a0
	mv	a0,a4
	sw	a4,16(sp)
	call	__mulsi3
	lw	a5,20(sp)
	lw	a3,0(sp)
	slli	a0,a0,2
	add	a5,a5,a0
	lw	a1,16(s0)
	lw	a0,4(sp)
	sw	a5,16(a3)
	sw	a5,12(sp)
	call	__mulsi3
	lw	a4,16(sp)
	mv	a1,a0
	mv	a0,a4
	call	__mulsi3
	lw	a5,12(sp)
	mv	a1,a0
	mv	a0,a5
	sw	a5,16(sp)
	call	preprocess_to_fixedpt
	lw	a1,0(s0)
	mv	a0,s1
	call	__mulsi3
	lw	a1,16(s0)
	sw	a0,12(sp)
	lw	a0,4(sp)
	call	__mulsi3
	lw	a4,12(sp)
	mv	a1,a0
	mv	a0,a4
	call	__mulsi3
	lw	a5,16(sp)
	lw	a3,0(sp)
	slli	a4,a0,2
	add	a5,a5,a4
	sw	a5,20(a3)
	mv	a1,a0
	mv	a0,a5
	sw	a5,20(sp)
	call	preprocess_to_fixedpt
	lw	a1,0(s0)
	mv	a0,s1
	call	__mulsi3
	lw	a1,16(s0)
	sw	a0,12(sp)
	lw	a0,4(sp)
	call	__mulsi3
	lw	a4,12(sp)
	mv	a1,a0
	mv	a0,a4
	sw	a4,16(sp)
	call	__mulsi3
	lw	a5,20(sp)
	lw	a3,0(sp)
	slli	a0,a0,2
	add	a5,a5,a0
	lw	a1,12(s0)
	lw	a0,4(sp)
	sw	a5,24(a3)
	sw	a5,12(sp)
	call	__mulsi3
	lw	a4,16(sp)
	mv	a1,a0
	mv	a0,a4
	call	__mulsi3
	lw	a5,12(sp)
	mv	a1,a0
	mv	a0,a5
	sw	a5,16(sp)
	call	preprocess_to_fixedpt
	lw	a1,0(s0)
	mv	a0,s1
	call	__mulsi3
	lw	a1,12(s0)
	sw	a0,12(sp)
	lw	a0,4(sp)
	call	__mulsi3
	lw	a4,12(sp)
	mv	a1,a0
	mv	a0,a4
	call	__mulsi3
	lw	a5,16(sp)
	lw	a4,12(sp)
	lw	a3,0(sp)
	slli	a0,a0,2
	add	a5,a5,a0
	mv	a1,a4
	mv	a0,a5
	sw	a5,8(a3)
	sw	a5,12(sp)
	call	preprocess_to_fixedpt
	lw	a1,0(s0)
	mv	a0,s1
	call	__mulsi3
	lw	a5,12(sp)
	lw	a3,0(sp)
	slli	a4,a0,2
	lw	a1,4(s0)
	add	a5,a5,a4
	sw	a5,28(a3)
	sw	a5,12(sp)
	call	__mulsi3
	lw	a5,12(sp)
	mv	a1,a0
	mv	a0,a5
	call	preprocess_to_fixedpt
	lw	a1,0(s0)
	mv	a0,s1
	call	__mulsi3
	lw	a1,4(s0)
	call	__mulsi3
	lw	a5,12(sp)
	lw	a3,0(sp)
	slli	a4,a0,2
	add	a5,a5,a4
	sw	a5,32(a3)
	mv	a1,a0
	mv	a0,a5
	sw	a5,12(sp)
	call	preprocess_to_fixedpt
	lw	a1,4(s0)
	mv	a0,s1
	call	__mulsi3
	lw	a1,0(s0)
	call	__mulsi3
	lw	a5,12(sp)
	lw	a3,0(sp)
	slli	a4,a0,2
	add	a5,a5,a4
	sw	a5,36(a3)
	mv	a1,a0
	mv	a0,a5
	sw	a5,16(sp)
	call	preprocess_to_fixedpt
	lw	a4,0(s0)
	mv	a0,s1
	mv	a1,a4
	sw	a4,12(sp)
	call	__mulsi3
	lw	a1,4(s0)
	call	__mulsi3
	lw	a5,16(sp)
	lw	a3,0(sp)
	lw	a4,12(sp)
	slli	a0,a0,2
	add	s1,a5,a0
	sw	s1,40(a3)
	mv	a1,a4
	mv	a0,s1
	call	preprocess_to_fixedpt
	lw	a4,0(s0)
	lw	a3,24(sp)
	lw	a0,24(s0)
	sw	a4,12(sp)
	bne	a3,zero,.L49
	lw	a1,4(sp)
	call	__mulsi3
	lw	a4,12(sp)
	srli	a5,a0,31
	add	a5,a5,a0
	andi	a5,a5,-2
	lw	a3,0(sp)
	add	a5,a5,a4
	lw	a1,20(s0)
	slli	a5,a5,2
	add	s1,s1,a5
	sw	s1,44(a3)
	mv	a0,a4
	call	__mulsi3
	lw	s0,32(sp)
	lw	ra,36(sp)
	mv	a1,a0
	mv	a0,s1
	lw	s1,28(sp)
	addi	sp,sp,40
	tail	preprocess_to_fixedpt
.L49:
	lw	a5,0(sp)
	lw	a4,8(sp)
	lw	ra,36(sp)
	lw	s0,32(sp)
	sw	a4,44(a5)
	lw	s1,28(sp)
	addi	sp,sp,40
	jr	ra
	.size	memory_map_weights, .-memory_map_weights
	.section	.rodata.read_checkpoint.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"rb"
	.align	2
.LC2:
	.string	"Couldn't open file %s\n"
	.section	.text.read_checkpoint,"ax",@progbits
	.align	2
	.globl	read_checkpoint
	.hidden	read_checkpoint
	.type	read_checkpoint, @function
read_checkpoint:
	addi	sp,sp,-28
	sw	s1,16(sp)
	mv	s1,a1
	lla	a1,.LC1
	sw	s0,20(sp)
	sw	ra,24(sp)
	sw	a0,12(sp)
	sw	a2,8(sp)
	sw	a4,4(sp)
	sw	a5,0(sp)
	call	fopen
	mv	s0,a0
	beq	a0,zero,.L57
.L54:
	mv	a3,s0
	li	a2,1
	li	a1,28
	mv	a0,s1
	call	fread
	li	a5,1
	beq	a0,a5,.L55
	li	a0,1
	call	bench_exit
.L55:
	lw	a5,20(s1)
	mv	a0,a5
	sw	a5,12(sp)
	call	abs
	li	a2,2
	li	a1,0
	sw	a0,20(s1)
	mv	a0,s0
	call	fseek
	mv	a0,s0
	call	ftell
	lw	a5,0(sp)
	li	a2,0
	li	a1,0
	sw	a0,0(a5)
	mv	a0,s0
	call	fseek
	lw	a5,0(sp)
	lw	a0,0(a5)
	call	malloc
	lw	a5,0(sp)
	mv	a3,s0
	li	a2,1
	lw	a1,0(a5)
	lw	a5,4(sp)
	sw	a0,0(a5)
	call	fread
	mv	a0,s0
	call	fclose
	lw	a5,4(sp)
	lw	s0,20(sp)
	lw	a0,8(sp)
	lw	a2,0(a5)
	lw	a5,12(sp)
	lw	ra,24(sp)
	mv	a1,s1
	lw	s1,16(sp)
	sgt	a3,a5,zero
	addi	a2,a2,28
	addi	sp,sp,28
	tail	memory_map_weights
.L57:
	lw	a1,12(sp)
	lla	a0,.LC2
	call	printf
	li	a0,1
	call	bench_exit
	j	.L54
	.size	read_checkpoint, .-read_checkpoint
	.section	.text.build_transformer,"ax",@progbits
	.align	2
	.globl	build_transformer
	.hidden	build_transformer
	.type	build_transformer, @function
build_transformer:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a0
	addi	a5,s0,132
	mv	a0,a1
	addi	a4,s0,128
	mv	a1,s0
	addi	a3,s0,124
	addi	a2,s0,28
	sw	ra,8(sp)
	call	read_checkpoint
	mv	a1,s0
	addi	a0,s0,76
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	malloc_run_state
	.size	build_transformer, .-build_transformer
	.section	.text.free_transformer,"ax",@progbits
	.align	2
	.globl	free_transformer
	.hidden	free_transformer
	.type	free_transformer, @function
free_transformer:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a0
	lw	a0,128(a0)
	sw	ra,8(sp)
	call	free
	addi	a0,s0,76
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	free_run_state
	.size	free_transformer, .-free_transformer
	.globl	__muldi3
	.globl	__divdi3
	.section	.text.rmsnorm,"ax",@progbits
	.align	2
	.globl	rmsnorm
	.hidden	rmsnorm
	.type	rmsnorm, @function
rmsnorm:
	addi	sp,sp,-36
	sw	ra,32(sp)
	sw	s0,28(sp)
	sw	s1,24(sp)
	sw	a3,8(sp)
	sw	a0,4(sp)
	sw	a2,12(sp)
	ble	a3,zero,.L63
	slli	a5,a3,2
	sw	a5,16(sp)
	add	a5,a1,a5
	sw	a5,0(sp)
	mv	s0,a1
	li	s1,0
	sw	a1,20(sp)
.L64:
	lw	a2,0(s0)
	addi	s0,s0,4
	srai	a3,a2,31
	mv	a0,a2
	mv	a1,a3
	call	__muldi3
	lw	a5,0(sp)
	slli	a1,a1,14
	srli	a0,a0,18
	or	a0,a1,a0
	add	s1,s1,a0
	bne	a5,s0,.L64
	lw	a4,20(sp)
	lw	a1,8(sp)
	mv	a0,s1
	sw	a4,0(sp)
	call	__divsi3
	addi	a0,a0,3
	call	fixedpt_sqrt
	mv	a2,a0
	srai	a3,a0,31
	li	a1,16
	li	a0,0
	call	__divdi3
	srai	a5,a0,31
	lw	s1,12(sp)
	sw	a5,12(sp)
	lw	a5,16(sp)
	lw	s0,4(sp)
	lw	a4,0(sp)
	add	a5,s1,a5
	sw	a5,4(sp)
	sw	a0,8(sp)
	mv	a5,s0
	mv	s0,s1
	mv	s1,a4
.L66:
	lw	a0,0(s1)
	lw	a2,8(sp)
	lw	a3,12(sp)
	srai	a1,a0,31
	sw	a5,0(sp)
	call	__muldi3
	lw	a2,0(s0)
	slli	a1,a1,14
	srli	a0,a0,18
	or	a0,a1,a0
	srai	a3,a2,31
	srai	a1,a0,31
	call	__muldi3
	lw	a5,0(sp)
	slli	a1,a1,14
	srli	a0,a0,18
	lw	a4,4(sp)
	or	a0,a1,a0
	sw	a0,0(a5)
	addi	s0,s0,4
	addi	s1,s1,4
	addi	a5,a5,4
	bne	a4,s0,.L66
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
.L63:
	lw	s0,28(sp)
	lw	ra,32(sp)
	lw	s1,24(sp)
	li	a0,3
	addi	sp,sp,36
	tail	fixedpt_sqrt
	.size	rmsnorm, .-rmsnorm
	.section	.text.softmax,"ax",@progbits
	.align	2
	.globl	softmax
	.hidden	softmax
	.type	softmax, @function
softmax:
	addi	sp,sp,-28
	sw	ra,24(sp)
	sw	s0,20(sp)
	sw	s1,16(sp)
	sw	a1,0(sp)
	li	a4,1
	mv	a5,a0
	lw	a0,0(a0)
	ble	a1,a4,.L73
	slli	a1,a1,2
	addi	a4,a5,4
	add	a1,a5,a1
	mv	a2,a0
.L75:
	lw	a3,0(a4)
	addi	a4,a4,4
	bge	a2,a3,.L74
	mv	a2,a3
.L74:
	bne	a1,a4,.L75
.L76:
	mv	s1,a5
	mv	a4,a5
	li	a3,0
	li	s0,0
	j	.L78
.L85:
	lw	a0,0(a4)
	lw	a2,12(sp)
.L78:
	sub	a0,a0,a2
	sw	a4,8(sp)
	sw	a3,4(sp)
	sw	a2,12(sp)
	call	fixedpt_exp
	lw	a4,8(sp)
	lw	a3,4(sp)
	lw	a5,0(sp)
	sw	a0,0(a4)
	addi	a3,a3,1
	addi	a4,a4,4
	add	s0,s0,a0
	bgt	a5,a3,.L85
	srai	a3,s0,31
	li	t1,0
.L79:
	lw	a0,0(s1)
	mv	a2,s0
	sw	t1,8(sp)
	srai	a4,a0,31
	srli	a1,a0,14
	slli	a4,a4,18
	slli	a0,a0,18
	or	a1,a1,a4
	sw	a3,4(sp)
	call	__divdi3
	lw	t1,8(sp)
	lw	a5,0(sp)
	sw	a0,0(s1)
	addi	t1,t1,1
	lw	a3,4(sp)
	addi	s1,s1,4
	bgt	a5,t1,.L79
.L72:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L73:
	lw	a3,0(sp)
	bne	a3,a4,.L72
	mv	a2,a0
	j	.L76
	.size	softmax, .-softmax
	.section	.text.matmul,"ax",@progbits
	.align	2
	.globl	matmul
	.hidden	matmul
	.type	matmul, @function
matmul:
	addi	sp,sp,-44
	sw	ra,40(sp)
	sw	s0,36(sp)
	sw	s1,32(sp)
	sw	a1,24(sp)
	sw	a2,28(sp)
	sw	a3,12(sp)
	ble	a4,zero,.L86
	slli	a4,a4,2
	slli	s0,a3,2
	add	a4,a0,a4
	add	a5,a1,s0
	sw	a0,16(sp)
	sw	a4,20(sp)
	sw	a5,4(sp)
	sw	zero,8(sp)
.L88:
	lw	a5,12(sp)
	li	s1,0
	ble	a5,zero,.L91
	lw	a5,8(sp)
	lw	s0,24(sp)
	li	s1,0
	slli	a4,a5,2
	lw	a5,28(sp)
	add	a4,a5,a4
	mv	a5,s0
	mv	s0,s1
	mv	s1,a5
.L89:
	lw	a2,0(s1)
	lw	a0,0(a4)
	sw	a4,0(sp)
	srai	a3,a2,31
	srai	a1,a0,31
	call	__muldi3
	lw	a4,0(sp)
	lw	a5,4(sp)
	slli	a1,a1,14
	srli	a0,a0,18
	or	a0,a1,a0
	addi	s1,s1,4
	add	s0,s0,a0
	addi	a4,a4,4
	bne	a5,s1,.L89
	mv	s1,s0
.L91:
	lw	a4,8(sp)
	lw	a3,12(sp)
	lw	a5,16(sp)
	add	a4,a4,a3
	sw	a4,8(sp)
	lw	a4,20(sp)
	sw	s1,0(a5)
	addi	a5,a5,4
	sw	a5,16(sp)
	bne	a4,a5,.L88
.L86:
	lw	ra,40(sp)
	lw	s0,36(sp)
	lw	s1,32(sp)
	addi	sp,sp,44
	jr	ra
	.size	matmul, .-matmul
	.globl	__modsi3
	.section	.text.forward,"ax",@progbits
	.align	2
	.globl	forward
	.hidden	forward
	.type	forward, @function
forward:
	lw	a4,0(a0)
	lw	a5,16(a0)
	addi	sp,sp,-176
	sw	s0,168(sp)
	lw	s0,12(a0)
	sw	s1,164(sp)
	sw	a0,44(sp)
	mv	s1,a1
	mv	a0,a5
	mv	a1,a4
	sw	ra,172(sp)
	sw	a2,52(sp)
	sw	a5,0(sp)
	sw	a4,48(sp)
	call	__mulsi3
	mv	a1,s0
	call	__divsi3
	lw	a5,0(sp)
	mv	a4,a0
	mv	a0,s0
	mv	a1,a5
	sw	a4,32(sp)
	call	__divsi3
	mv	a1,s0
	lw	s0,48(sp)
	mv	a5,a0
	sw	a5,100(sp)
	mv	a0,s0
	call	__divsi3
	mv	a5,a0
	mv	a0,s0
	lw	s0,44(sp)
	mv	a1,s1
	sw	a5,28(sp)
	lw	s1,76(s0)
	sw	s1,108(sp)
	call	__mulsi3
	lw	a4,48(sp)
	lw	a1,28(s0)
	lw	a5,4(s0)
	slli	a4,a4,2
	slli	a0,a0,2
	add	a1,a1,a0
	mv	a2,a4
	mv	a0,s1
	sw	a5,72(sp)
	sw	a4,104(sp)
	call	memcpy
	lw	a5,8(s0)
	beq	a5,zero,.L149
	lw	s0,32(sp)
	lw	a1,52(sp)
	mv	a0,s0
	call	__mulsi3
	lw	s1,48(sp)
	mv	a5,a0
	sw	a5,148(sp)
	mv	a1,s1
	mv	a0,s1
	call	__mulsi3
	lw	a1,104(sp)
	mv	a5,a0
	slli	a4,a5,2
	mv	a0,s0
	sw	a4,160(sp)
	call	__mulsi3
	lw	a4,44(sp)
	lw	a1,72(sp)
	mv	a5,a0
	lw	a4,80(a4)
	mv	a0,s1
	sw	a5,156(sp)
	sw	a4,12(sp)
	call	__mulsi3
	lw	a4,28(sp)
	lw	a5,104(sp)
	sw	zero,112(sp)
	slli	a3,a4,2
	slli	a4,a4,18
	sw	a4,56(sp)
	slli	a4,a0,2
	sw	a4,152(sp)
	slli	a4,s0,2
	sw	a4,140(sp)
	lw	a4,108(sp)
	sw	a3,84(sp)
	sw	zero,120(sp)
	add	a4,a5,a4
	lw	a5,72(sp)
	sw	a4,144(sp)
	sw	zero,124(sp)
	slli	a4,a5,2
	lw	a5,52(sp)
	sw	a4,132(sp)
	sw	zero,116(sp)
	addi	a5,a5,1
	sw	zero,128(sp)
	sw	zero,136(sp)
	sw	a5,88(sp)
.L190:
	lw	s0,44(sp)
	lw	a5,116(sp)
	lw	a3,48(sp)
	lw	a2,32(s0)
	lw	a1,108(sp)
	lw	a0,12(sp)
	add	a2,a2,a5
	call	rmsnorm
	lw	a1,24(s0)
	lw	a0,32(sp)
	call	__mulsi3
	lw	a1,128(sp)
	call	__mulsi3
	lw	a1,148(sp)
	lw	a4,120(s0)
	lw	a3,116(s0)
	add	a5,a0,a1
	slli	a5,a5,2
	add	a1,a3,a5
	add	a5,a4,a5
	sw	a5,40(sp)
	sw	a5,104(s0)
	lw	a5,80(s0)
	lw	a4,48(sp)
	sw	a0,96(sp)
	sw	a5,8(sp)
	sw	a1,36(sp)
	sw	a1,100(s0)
	lw	s1,96(s0)
	lw	a5,40(s0)
	ble	a4,zero,.L103
	lw	a3,104(sp)
	sw	s1,16(sp)
	sw	zero,12(sp)
	add	a4,s1,a3
	sw	a4,20(sp)
	lw	a4,8(sp)
	add	a4,a3,a4
	sw	a4,4(sp)
	lw	a4,124(sp)
	add	a5,a5,a4
	sw	a5,24(sp)
.L102:
	lw	a5,12(sp)
	lw	s0,8(sp)
	li	s1,0
	slli	a4,a5,2
	lw	a5,24(sp)
	add	a4,a4,a5
	mv	a5,s0
	mv	s0,s1
	mv	s1,a5
.L101:
	lw	a2,0(s1)
	lw	a0,0(a4)
	sw	a4,0(sp)
	srai	a3,a2,31
	srai	a1,a0,31
	call	__muldi3
	lw	a4,0(sp)
	lw	a5,4(sp)
	slli	a1,a1,14
	srli	a0,a0,18
	or	a0,a1,a0
	addi	s1,s1,4
	add	s0,s0,a0
	addi	a4,a4,4
	bne	a5,s1,.L101
	lw	a4,12(sp)
	lw	a3,48(sp)
	lw	a5,16(sp)
	add	a4,a4,a3
	sw	a4,12(sp)
	lw	a4,20(sp)
	sw	s0,0(a5)
	addi	a5,a5,4
	sw	a5,16(sp)
	bne	a4,a5,.L102
.L103:
	lw	a5,44(sp)
	lw	a4,32(sp)
	lw	a5,44(a5)
	ble	a4,zero,.L99
	lw	a4,36(sp)
	lw	a3,140(sp)
	sw	zero,12(sp)
	sw	a4,16(sp)
	add	a4,a4,a3
	sw	a4,20(sp)
	lw	a3,104(sp)
	lw	a4,8(sp)
	add	s0,a4,a3
	lw	a4,120(sp)
	sw	s0,4(sp)
	add	a5,a5,a4
	sw	a5,24(sp)
.L100:
	lw	a5,48(sp)
	li	s1,0
	ble	a5,zero,.L107
	lw	a5,12(sp)
	lw	s0,8(sp)
	li	s1,0
	slli	a4,a5,2
	lw	a5,24(sp)
	add	a4,a4,a5
	mv	a5,s0
	mv	s0,s1
	mv	s1,a5
.L104:
	lw	a2,0(s1)
	lw	a0,0(a4)
	sw	a4,0(sp)
	srai	a3,a2,31
	srai	a1,a0,31
	call	__muldi3
	lw	a4,0(sp)
	lw	a5,4(sp)
	slli	a1,a1,14
	srli	a0,a0,18
	or	a0,a1,a0
	addi	s1,s1,4
	add	s0,s0,a0
	addi	a4,a4,4
	bne	a5,s1,.L104
	mv	s1,s0
.L107:
	lw	a4,12(sp)
	lw	a3,48(sp)
	lw	a5,16(sp)
	add	a4,a4,a3
	sw	a4,12(sp)
	lw	a4,20(sp)
	sw	s1,0(a5)
	addi	a5,a5,4
	sw	a5,16(sp)
	bne	a4,a5,.L100
	lw	a4,40(sp)
	lw	a3,140(sp)
	lw	a5,44(sp)
	sw	a4,16(sp)
	add	a4,a4,a3
	lw	a5,48(a5)
	sw	a4,20(sp)
	lw	a4,120(sp)
	sw	zero,12(sp)
	add	a5,a5,a4
	sw	a5,24(sp)
.L158:
	lw	a5,48(sp)
	li	s1,0
	ble	a5,zero,.L110
	lw	a5,12(sp)
	lw	s0,8(sp)
	li	s1,0
	slli	a4,a5,2
	lw	a5,24(sp)
	add	a4,a4,a5
	mv	a5,s0
	mv	s0,s1
	mv	s1,a5
.L108:
	lw	a2,0(s1)
	lw	a0,0(a4)
	sw	a4,0(sp)
	srai	a3,a2,31
	srai	a1,a0,31
	call	__muldi3
	lw	a4,0(sp)
	lw	a5,4(sp)
	slli	a1,a1,14
	srli	a0,a0,18
	or	a0,a1,a0
	addi	s1,s1,4
	add	s0,s0,a0
	addi	a4,a4,4
	bne	a5,s1,.L108
	mv	s1,s0
.L110:
	lw	a4,12(sp)
	lw	a3,48(sp)
	lw	a5,16(sp)
	add	a4,a4,a3
	sw	a4,12(sp)
	lw	a4,20(sp)
	sw	s1,0(a5)
	addi	a5,a5,4
	sw	a5,16(sp)
	bne	a4,a5,.L158
.L99:
	li	a5,413696
	addi	a5,a5,-1921
	sw	a5,92(sp)
	lw	a5,48(sp)
	sw	zero,64(sp)
	li	a1,262144
	ble	a5,zero,.L120
.L111:
	lw	a0,52(sp)
	call	__mulsi3
	lw	a5,92(sp)
	mv	s0,a0
	sub	a0,a5,a0
	call	fixedpt_sin
	mv	a5,a0
	mv	a0,s0
	sw	a5,0(sp)
	mv	s0,a5
	call	fixedpt_sin
	lw	a4,64(sp)
	lw	a3,32(sp)
	srai	a5,s0,31
	li	t2,0
	sgt	a3,a3,a4
	addi	a3,a3,1
	slli	a4,a4,2
	sw	a4,80(sp)
	sw	a3,76(sp)
	addi	a3,a4,4
	srai	a4,a0,31
	sw	a0,4(sp)
	sw	a3,68(sp)
	sw	a4,8(sp)
	sw	a5,12(sp)
	mv	s1,t2
.L118:
	lw	a5,44(sp)
	beq	s1,zero,.L196
	lw	a4,100(a5)
.L117:
	lw	a5,80(sp)
	lw	a1,68(sp)
	lw	a2,0(sp)
	add	t2,a4,a5
	lw	a5,0(t2)
	add	a4,a4,a1
	lw	a3,12(sp)
	sw	a4,16(sp)
	lw	a4,0(a4)
	srai	t1,a5,31
	mv	a0,a5
	mv	a1,t1
	sw	a5,40(sp)
	sw	t1,36(sp)
	sw	t2,60(sp)
	sw	a4,20(sp)
	call	__muldi3
	lw	a4,20(sp)
	lw	a2,4(sp)
	lw	a3,8(sp)
	srai	t0,a4,31
	slli	ra,a1,14
	srli	s0,a0,18
	mv	a1,t0
	mv	a0,a4
	or	s0,ra,s0
	sw	a4,24(sp)
	sw	t0,20(sp)
	call	__muldi3
	lw	t2,60(sp)
	lw	a4,24(sp)
	lw	t0,20(sp)
	slli	a1,a1,14
	srli	a0,a0,18
	or	a0,a1,a0
	lw	a2,0(sp)
	lw	a3,12(sp)
	sub	s0,s0,a0
	sw	s0,0(t2)
	mv	a0,a4
	mv	a1,t0
	call	__muldi3
	lw	a5,40(sp)
	lw	t1,36(sp)
	lw	a2,4(sp)
	lw	a3,8(sp)
	slli	a4,a1,14
	srli	s0,a0,18
	mv	a1,t1
	mv	a0,a5
	or	s0,a4,s0
	call	__muldi3
	lw	a4,16(sp)
	slli	a1,a1,14
	srli	a0,a0,18
	or	a0,a1,a0
	lw	a5,76(sp)
	add	s0,s0,a0
	sw	s0,0(a4)
	addi	s1,s1,1
	bne	a5,s1,.L118
	lw	a5,64(sp)
	lw	a4,48(sp)
	addi	a5,a5,2
	sw	a5,64(sp)
	ble	a4,a5,.L120
	lw	s0,28(sp)
	lw	a0,64(sp)
	mv	a1,s0
	call	__modsi3
	slli	a0,a0,20
	mv	a1,s0
	neg	a0,a0
	call	__divsi3
	mv	s0,a0
	beq	a0,zero,.L164
	li	a0,2621440
	call	fixedpt_ln
	mv	a2,s0
	srai	a3,s0,31
	srai	a1,a0,31
	call	__muldi3
	slli	a1,a1,14
	srli	a0,a0,18
	or	a0,a1,a0
	call	fixedpt_exp
	mv	a1,a0
	j	.L111
.L196:
	lw	a4,96(a5)
	j	.L117
.L120:
	lw	a5,44(sp)
	lw	a4,88(sp)
	sw	zero,76(sp)
	lw	a5,12(a5)
	slli	a4,a4,2
	sw	zero,64(sp)
	sw	a4,92(sp)
	ble	a5,zero,.L113
.L112:
	lw	s1,44(sp)
	lw	a0,64(sp)
	lw	a1,24(s1)
	lw	s0,96(s1)
	call	__mulsi3
	lw	a4,108(s1)
	lw	a3,76(sp)
	slli	a5,a0,2
	add	a4,a4,a5
	lw	a5,52(sp)
	slli	s1,a3,2
	sw	s1,80(sp)
	sw	a4,68(sp)
	blt	a5,zero,.L123
	lw	a1,100(sp)
	lw	a0,64(sp)
	call	__divsi3
	lw	a1,28(sp)
	call	__mulsi3
	lw	a5,96(sp)
	lw	a4,68(sp)
	add	a2,s0,s1
	add	a3,a0,a5
	lw	a5,84(sp)
	sw	a3,24(sp)
	sw	a4,16(sp)
	add	a5,s0,a5
	add	a5,a5,s1
	sw	a2,60(sp)
	sw	a5,12(sp)
	sw	a3,20(sp)
	sw	a4,40(sp)
	sw	zero,36(sp)
.L126:
	lw	a5,44(sp)
	lw	a0,56(sp)
	lw	s0,116(a5)
	call	fixedpt_sqrt
	lw	a4,28(sp)
	sw	a0,4(sp)
	ble	a4,zero,.L166
	lw	a4,20(sp)
	srai	a5,a0,31
	li	s1,0
	slli	a4,a4,2
	add	a4,s0,a4
	lw	s0,60(sp)
	sw	a5,8(sp)
	mv	a5,s0
	mv	s0,s1
	mv	s1,a4
.L125:
	lw	a0,0(a5)
	lw	a2,0(s1)
	addi	a5,a5,4
	srai	a1,a0,31
	srai	a3,a2,31
	sw	a5,0(sp)
	call	__muldi3
	slli	a1,a1,14
	srli	a0,a0,18
	or	a0,a1,a0
	srai	a1,a0,31
	lw	a2,4(sp)
	lw	a3,8(sp)
	srli	t0,a0,14
	slli	a1,a1,18
	slli	a0,a0,18
	or	a1,t0,a1
	call	__divdi3
	lw	a4,12(sp)
	lw	a5,0(sp)
	add	s0,s0,a0
	addi	s1,s1,4
	bne	a4,a5,.L125
	mv	s1,s0
.L124:
	lw	a5,40(sp)
	lw	a3,32(sp)
	lw	a4,36(sp)
	sw	s1,0(a5)
	addi	a5,a5,4
	sw	a5,40(sp)
	lw	a5,20(sp)
	addi	a4,a4,1
	sw	a4,36(sp)
	add	a5,a5,a3
	sw	a5,20(sp)
	lw	a5,52(sp)
	bge	a5,a4,.L126
	lw	a1,88(sp)
	lw	a0,68(sp)
	call	softmax
	lw	s0,44(sp)
	lw	a3,80(sp)
	lw	a2,84(sp)
	lw	a5,80(s0)
	li	a1,0
	add	a5,a5,a3
	mv	a0,a5
	mv	s1,a5
	sw	a5,36(sp)
	call	memset
	lw	a4,68(sp)
	lw	a3,92(sp)
	add	a3,a4,a3
	lw	a4,84(sp)
	sw	a3,12(sp)
	lw	a3,120(s0)
	add	a5,s1,a4
	sw	a5,8(sp)
	sw	a3,20(sp)
.L129:
	lw	a5,16(sp)
	lw	a5,0(a5)
	sw	a5,4(sp)
	lw	a5,28(sp)
	ble	a5,zero,.L132
	lw	a5,24(sp)
	lw	s1,36(sp)
	slli	a4,a5,2
	lw	a5,4(sp)
	srai	a3,a5,31
	lw	a5,20(sp)
	add	s0,a5,a4
.L131:
	lw	a0,0(s0)
	lw	a2,4(sp)
	sw	a3,0(sp)
	srai	a1,a0,31
	call	__muldi3
	lw	a2,0(s1)
	slli	a1,a1,14
	srli	a0,a0,18
	or	a0,a1,a0
	lw	a5,8(sp)
	add	a2,a2,a0
	sw	a2,0(s1)
	addi	s1,s1,4
	lw	a3,0(sp)
	addi	s0,s0,4
	bne	a5,s1,.L131
.L132:
	lw	a4,24(sp)
	lw	a3,32(sp)
	lw	a5,16(sp)
	add	a4,a4,a3
	sw	a4,24(sp)
	lw	a4,12(sp)
	addi	a5,a5,4
	sw	a5,16(sp)
	bne	a4,a5,.L129
.L130:
	lw	a5,44(sp)
	lw	a4,64(sp)
	lw	a3,76(sp)
	lw	a2,28(sp)
	lw	a5,12(a5)
	addi	a4,a4,1
	add	a3,a3,a2
	sw	a4,64(sp)
	sw	a3,76(sp)
	bgt	a5,a4,.L112
.L113:
	lw	a5,44(sp)
	lw	a2,48(sp)
	lw	a3,80(a5)
	lw	a4,84(a5)
	lw	a5,52(a5)
	sw	a3,16(sp)
	ble	a2,zero,.L121
	lw	a2,104(sp)
	sw	a4,36(sp)
	sw	a4,12(sp)
	add	a1,a4,a2
	lw	a4,124(sp)
	add	a3,a2,a3
	sw	a1,20(sp)
	add	a5,a5,a4
	sw	a3,4(sp)
	sw	zero,8(sp)
	sw	a5,24(sp)
.L122:
	lw	a5,8(sp)
	lw	s0,16(sp)
	li	s1,0
	slli	a4,a5,2
	lw	a5,24(sp)
	add	a4,a4,a5
	mv	a5,s0
	mv	s0,s1
	mv	s1,a5
.L134:
	lw	a2,0(s1)
	lw	a0,0(a4)
	sw	a4,0(sp)
	srai	a3,a2,31
	srai	a1,a0,31
	call	__muldi3
	lw	a4,0(sp)
	lw	a5,4(sp)
	slli	a1,a1,14
	srli	a0,a0,18
	or	a0,a1,a0
	addi	s1,s1,4
	add	s0,s0,a0
	addi	a4,a4,4
	bne	a5,s1,.L134
	lw	a4,8(sp)
	lw	a3,48(sp)
	lw	a5,12(sp)
	add	a4,a4,a3
	sw	a4,8(sp)
	lw	a4,20(sp)
	sw	s0,0(a5)
	addi	a5,a5,4
	sw	a5,12(sp)
	bne	a4,a5,.L122
	lw	a5,108(sp)
	lw	a1,144(sp)
	lw	a3,36(sp)
.L135:
	lw	a4,0(a5)
	lw	a2,0(a3)
	addi	a5,a5,4
	addi	a3,a3,4
	add	a4,a4,a2
	sw	a4,-4(a5)
	bne	a1,a5,.L135
	lw	s0,44(sp)
	lw	a5,116(sp)
	lw	a3,48(sp)
	lw	a2,36(s0)
	lw	a1,108(sp)
	lw	a0,16(sp)
	add	a2,a2,a5
	call	rmsnorm
	lw	a4,88(s0)
	lw	a5,56(s0)
	sw	a4,20(sp)
	lw	a4,80(s0)
	sw	a4,12(sp)
	lw	a4,72(sp)
	ble	a4,zero,.L197
.L160:
	lw	a4,20(sp)
	lw	a3,132(sp)
	sw	zero,8(sp)
	sw	a4,16(sp)
	add	a4,a3,a4
	sw	a4,24(sp)
	lw	a3,104(sp)
	lw	a4,12(sp)
	add	s0,a4,a3
	lw	a4,112(sp)
	sw	s0,4(sp)
	add	a5,a5,a4
	sw	a5,36(sp)
.L133:
	lw	a5,48(sp)
	li	s1,0
	ble	a5,zero,.L140
	lw	a5,8(sp)
	lw	s0,12(sp)
	li	s1,0
	slli	a4,a5,2
	lw	a5,36(sp)
	add	a4,a4,a5
	mv	a5,s0
	mv	s0,s1
	mv	s1,a5
.L137:
	lw	a2,0(s1)
	lw	a0,0(a4)
	sw	a4,0(sp)
	srai	a3,a2,31
	srai	a1,a0,31
	call	__muldi3
	lw	a4,0(sp)
	lw	a5,4(sp)
	slli	a1,a1,14
	srli	a0,a0,18
	or	a0,a1,a0
	addi	s1,s1,4
	add	s0,s0,a0
	addi	a4,a4,4
	bne	a5,s1,.L137
	mv	s1,s0
.L140:
	lw	a4,8(sp)
	lw	a3,48(sp)
	lw	a5,16(sp)
	add	a4,a4,a3
	sw	a4,8(sp)
	lw	a4,24(sp)
	sw	s1,0(a5)
	addi	a5,a5,4
	sw	a5,16(sp)
	bne	a4,a5,.L133
	lw	a4,44(sp)
	lw	a3,112(sp)
	sw	zero,8(sp)
	lw	a5,64(a4)
	lw	a4,92(a4)
	add	a5,a5,a3
	sw	a5,36(sp)
	lw	a5,132(sp)
	sw	a4,16(sp)
	add	a5,a5,a4
	sw	a5,24(sp)
.L157:
	lw	a5,48(sp)
	li	s1,0
	ble	a5,zero,.L144
	lw	a5,8(sp)
	lw	s0,12(sp)
	li	s1,0
	slli	a4,a5,2
	lw	a5,36(sp)
	add	a4,a4,a5
	mv	a5,s0
	mv	s0,s1
	mv	s1,a5
.L141:
	lw	a2,0(s1)
	lw	a0,0(a4)
	sw	a4,0(sp)
	srai	a3,a2,31
	srai	a1,a0,31
	call	__muldi3
	lw	a4,0(sp)
	lw	a5,4(sp)
	slli	a1,a1,14
	srli	a0,a0,18
	or	a0,a1,a0
	addi	s1,s1,4
	add	s0,s0,a0
	addi	a4,a4,4
	bne	a5,s1,.L141
	mv	s1,s0
.L144:
	lw	a4,8(sp)
	lw	a3,48(sp)
	lw	a5,16(sp)
	add	a4,a4,a3
	sw	a4,8(sp)
	lw	a4,24(sp)
	sw	s1,0(a5)
	addi	a5,a5,4
	sw	a5,16(sp)
	bne	a4,a5,.L157
	lw	t1,20(sp)
	lw	s1,44(sp)
	li	s0,0
	mv	t0,s0
.L142:
	slli	s0,t0,2
	add	t1,t1,s0
	lw	a4,0(t1)
	addi	t0,t0,1
	sw	t0,4(sp)
	neg	a0,a4
	sw	a4,0(sp)
	call	fixedpt_exp
	li	a5,262144
	add	a2,a0,a5
	srai	a3,a2,31
	li	a0,0
	li	a1,16
	call	__divdi3
	lw	a4,0(sp)
	srai	a1,a0,31
	mv	a2,a4
	srai	a3,a4,31
	call	__muldi3
	lw	a3,92(s1)
	lw	t1,88(s1)
	slli	a4,a1,14
	add	a3,a3,s0
	lw	a2,0(a3)
	srli	a0,a0,18
	or	a0,a4,a0
	srai	a3,a2,31
	srai	a1,a0,31
	sw	t1,0(sp)
	call	__muldi3
	lw	t1,0(sp)
	slli	a3,a1,14
	srli	a4,a0,18
	add	a5,t1,s0
	or	a4,a3,a4
	sw	a4,0(a5)
	lw	t0,4(sp)
	lw	a5,72(sp)
	bne	a5,t0,.L142
	lw	a5,44(sp)
	sw	t1,20(sp)
	lw	a4,80(a5)
	lw	a5,60(a5)
	sw	a4,12(sp)
	lw	a4,48(sp)
	ble	a4,zero,.L145
.L159:
	lw	a4,12(sp)
	lw	a3,104(sp)
	lw	a2,132(sp)
	sw	a4,40(sp)
	add	a3,a3,a4
	sw	a3,24(sp)
	sw	a4,16(sp)
	lw	a3,20(sp)
	lw	a4,112(sp)
	sw	zero,8(sp)
	add	a3,a3,a2
	add	a5,a5,a4
	sw	a3,4(sp)
	sw	a5,36(sp)
.L146:
	lw	a5,72(sp)
	li	s1,0
	ble	a5,zero,.L153
	lw	a5,8(sp)
	lw	s0,20(sp)
	li	s1,0
	slli	a4,a5,2
	lw	a5,36(sp)
	add	a4,a4,a5
	mv	a5,s0
	mv	s0,s1
	mv	s1,a5
.L150:
	lw	a2,0(s1)
	lw	a0,0(a4)
	sw	a4,0(sp)
	srai	a3,a2,31
	srai	a1,a0,31
	call	__muldi3
	lw	a4,0(sp)
	lw	a5,4(sp)
	slli	a1,a1,14
	srli	a0,a0,18
	or	a0,a1,a0
	addi	s1,s1,4
	add	s0,s0,a0
	addi	a4,a4,4
	bne	a5,s1,.L150
	mv	s1,s0
.L153:
	lw	a4,8(sp)
	lw	a3,72(sp)
	lw	a5,16(sp)
	add	a4,a4,a3
	sw	a4,8(sp)
	lw	a4,24(sp)
	sw	s1,0(a5)
	addi	a5,a5,4
	sw	a5,16(sp)
	bne	a4,a5,.L146
	lw	a5,108(sp)
	lw	a1,144(sp)
	lw	a3,40(sp)
.L151:
	lw	a4,0(a5)
	lw	a2,0(a3)
	addi	a5,a5,4
	addi	a3,a3,4
	add	a4,a4,a2
	sw	a4,-4(a5)
	bne	a1,a5,.L151
.L145:
	lw	a4,128(sp)
	lw	a1,104(sp)
	lw	a5,44(sp)
	addi	a3,a4,1
	sltu	a4,a3,a4
	sw	a3,128(sp)
	lw	a3,116(sp)
	lw	a2,136(sp)
	lw	a5,8(a5)
	add	a3,a3,a1
	sw	a3,116(sp)
	lw	a1,160(sp)
	lw	a3,124(sp)
	add	a2,a4,a2
	sw	a2,136(sp)
	add	a3,a3,a1
	sw	a3,124(sp)
	lw	a1,156(sp)
	lw	a3,120(sp)
	srai	a4,a5,31
	add	a3,a3,a1
	sw	a3,120(sp)
	lw	a1,152(sp)
	lw	a3,112(sp)
	add	a3,a3,a1
	sw	a3,112(sp)
	bgtu	a4,a2,.L190
	bne	a4,a2,.L149
	lw	a4,128(sp)
	bgtu	a5,a4,.L190
.L149:
	lw	s0,44(sp)
	lw	s1,108(sp)
	lw	a3,48(sp)
	lw	a2,68(s0)
	mv	a1,s1
	mv	a0,s1
	call	rmsnorm
	lw	a3,112(s0)
	lw	a2,72(s0)
	lw	a4,0(s0)
	lw	a5,20(s0)
	sw	a3,28(sp)
	sw	a2,20(sp)
	sw	a4,12(sp)
	ble	a5,zero,.L94
	slli	a5,a5,2
	slli	s0,a4,2
	add	a4,a5,a3
	add	a5,s1,s0
	sw	a3,16(sp)
	sw	a4,24(sp)
	sw	a5,4(sp)
	sw	zero,8(sp)
.L97:
	lw	a5,12(sp)
	li	s1,0
	ble	a5,zero,.L156
	lw	a5,8(sp)
	lw	s0,108(sp)
	li	s1,0
	slli	t1,a5,2
	lw	a5,20(sp)
	add	t1,a5,t1
	mv	a5,s0
	mv	s0,s1
	mv	s1,a5
.L154:
	lw	a2,0(s1)
	lw	a0,0(t1)
	sw	t1,0(sp)
	srai	a3,a2,31
	srai	a1,a0,31
	call	__muldi3
	slli	a4,a1,14
	srli	a5,a0,18
	or	a5,a4,a5
	lw	t1,0(sp)
	add	s0,s0,a5
	lw	a5,4(sp)
	addi	s1,s1,4
	addi	t1,t1,4
	bne	a5,s1,.L154
	mv	s1,s0
.L156:
	lw	a4,8(sp)
	lw	a3,12(sp)
	lw	a5,16(sp)
	add	a4,a4,a3
	sw	a4,8(sp)
	lw	a4,24(sp)
	sw	s1,0(a5)
	addi	a5,a5,4
	sw	a5,16(sp)
	bne	a4,a5,.L97
.L94:
	lw	ra,172(sp)
	lw	s0,168(sp)
	lw	a0,28(sp)
	lw	s1,164(sp)
	addi	sp,sp,176
	jr	ra
.L166:
	li	s1,0
	j	.L124
.L123:
	lw	a1,88(sp)
	lw	a0,68(sp)
	call	softmax
	lw	a5,44(sp)
	lw	a2,84(sp)
	li	a1,0
	lw	a0,80(a5)
	lw	a5,80(sp)
	add	a0,a0,a5
	call	memset
	j	.L130
.L164:
	li	a1,262144
	j	.L111
.L197:
	lw	a5,44(sp)
	lw	a5,60(a5)
	j	.L159
.L121:
	lw	s0,44(sp)
	lw	a5,116(sp)
	lw	a3,48(sp)
	lw	a2,36(s0)
	lw	a1,108(sp)
	lw	a0,16(sp)
	add	a2,a2,a5
	call	rmsnorm
	lw	a4,88(s0)
	lw	a5,56(s0)
	sw	a4,20(sp)
	lw	a4,80(s0)
	sw	a4,12(sp)
	lw	a4,72(sp)
	bgt	a4,zero,.L160
	j	.L145
	.size	forward, .-forward
	.section	.rodata.build_tokenizer.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"couldn't load %s\n"
	.align	2
.LC4:
	.string	"failed read\n"
	.section	.text.build_tokenizer,"ax",@progbits
	.align	2
	.globl	build_tokenizer
	.hidden	build_tokenizer
	.type	build_tokenizer, @function
build_tokenizer:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	slli	s1,a2,2
	mv	s0,a0
	sw	a2,12(a0)
	mv	a0,s1
	sw	a2,12(sp)
	sw	a1,0(sp)
	call	malloc
	sw	a0,0(s0)
	mv	a0,s1
	call	malloc
	sw	a0,4(s0)
	sw	zero,8(s0)
	addi	a4,s0,20
	li	a5,0
	li	a3,256
.L199:
	sb	a5,0(a4)
	sb	zero,1(a4)
	addi	a5,a5,1
	addi	a4,a4,2
	bne	a5,a3,.L199
	lw	a0,0(sp)
	lla	a1,.LC1
	call	fopen
	mv	s1,a0
	beq	a0,zero,.L210
.L200:
	mv	a3,s1
	li	a2,1
	li	a1,4
	addi	a0,s0,16
	call	fread
	li	a5,1
	beq	a0,a5,.L201
	lla	a0,.LC4
	call	printf
	li	a0,1
	call	bench_exit
.L201:
	lw	a5,12(sp)
	ble	a5,zero,.L202
	sw	zero,0(sp)
.L206:
	lw	a5,0(sp)
	lw	a0,4(s0)
	mv	a3,s1
	slli	a5,a5,2
	add	a0,a0,a5
	li	a2,1
	li	a1,4
	sw	a5,4(sp)
	call	fread
	lw	a3,0(sp)
	mv	a4,a0
	li	a5,1
	addi	a3,a3,1
	sw	a3,0(sp)
	lla	a0,.LC4
	beq	a4,a5,.L203
	call	printf
	li	a0,1
	call	bench_exit
.L203:
	mv	a3,s1
	li	a2,1
	li	a1,4
	addi	a0,sp,16
	call	fread
	mv	a4,a0
	li	a5,1
	lla	a0,.LC4
	beq	a4,a5,.L204
	call	printf
	li	a0,1
	call	bench_exit
.L204:
	lw	a5,4(sp)
	lw	a4,0(s0)
	lw	a0,16(sp)
	add	a4,a4,a5
	addi	a0,a0,1
	sw	a4,8(sp)
	call	malloc
	lw	a4,8(sp)
	lw	a5,0(s0)
	lw	a1,16(sp)
	sw	a0,0(a4)
	lw	a4,4(sp)
	mv	a3,s1
	li	a2,1
	add	a5,a5,a4
	lw	a0,0(a5)
	call	fread
	mv	a4,a0
	li	a5,1
	lla	a0,.LC4
	beq	a4,a5,.L205
	call	printf
	li	a0,1
	call	bench_exit
.L205:
	lw	a5,0(s0)
	lw	a4,4(sp)
	add	a5,a5,a4
	lw	a5,0(a5)
	lw	a4,16(sp)
	add	a5,a5,a4
	sb	zero,0(a5)
	lw	a4,0(sp)
	lw	a5,12(sp)
	bne	a5,a4,.L206
.L202:
	mv	a0,s1
	call	fclose
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L210:
	lw	a1,0(sp)
	lla	a0,.LC3
	call	printf
	li	a0,1
	call	bench_exit
	j	.L200
	.size	build_tokenizer, .-build_tokenizer
	.section	.text.free_tokenizer,"ax",@progbits
	.align	2
	.globl	free_tokenizer
	.hidden	free_tokenizer
	.type	free_tokenizer, @function
free_tokenizer:
	lw	a5,12(a0)
	addi	sp,sp,-12
	sw	s1,0(sp)
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s1,a0
	ble	a5,zero,.L212
	li	s0,0
.L213:
	lw	a5,0(s1)
	slli	a4,s0,2
	addi	s0,s0,1
	add	a5,a5,a4
	lw	a0,0(a5)
	call	free
	lw	a5,12(s1)
	bgt	a5,s0,.L213
.L212:
	lw	a0,0(s1)
	call	free
	lw	a0,4(s1)
	call	free
	lw	s0,4(sp)
	lw	a0,8(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	free
	.size	free_tokenizer, .-free_tokenizer
	.section	.rodata.decode.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"<0x0A>"
	.align	2
.LC6:
	.string	"<0x%02hhX>"
	.section	.text.decode,"ax",@progbits
	.align	2
	.globl	decode
	.hidden	decode
	.type	decode, @function
decode:
	lw	a5,0(a0)
	addi	sp,sp,-16
	slli	a2,a2,2
	sw	s0,8(sp)
	sw	s1,4(sp)
	add	a5,a5,a2
	sw	ra,12(sp)
	li	a4,1
	lw	s0,0(a5)
	mv	s1,a0
	bne	a1,a4,.L217
	lbu	a5,0(s0)
	addi	a5,a5,-32
	seqz	a5,a5
	add	s0,s0,a5
.L217:
	lla	a1,.LC5
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L218
	addi	s0,s1,40
.L216:
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L218:
	addi	a2,sp,3
	lla	a1,.LC6
	mv	a0,s0
	call	__isoc99_sscanf
	li	a5,1
	bne	a0,a5,.L216
	lbu	s0,3(sp)
	addi	s1,s1,20
	lw	ra,12(sp)
	slli	s0,s0,1
	add	s0,s1,s0
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	decode, .-decode
	.section	.rodata.safe_printf.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"%s"
	.section	.text.safe_printf,"ax",@progbits
	.align	2
	.globl	safe_printf
	.hidden	safe_printf
	.type	safe_printf, @function
safe_printf:
	beq	a0,zero,.L234
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	lbu	s1,0(a0)
	mv	s0,a0
	beq	s1,zero,.L221
	lbu	a5,1(a0)
	bne	a5,zero,.L226
	mv	a0,s1
	call	isprint
	beq	a0,zero,.L237
.L226:
	mv	a1,s0
	lla	a0,.LC7
	call	printf
	mv	a1,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	mv	a2,a0
	lla	a0,.LANCHOR0
	addi	sp,sp,12
	tail	bench_obuf_append
.L237:
	mv	a0,s1
	call	isspace
	bne	a0,zero,.L226
.L221:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L234:
	ret
	.size	safe_printf, .-safe_printf
	.section	.text.str_lookup,"ax",@progbits
	.align	2
	.globl	str_lookup
	.hidden	str_lookup
	.type	str_lookup, @function
str_lookup:
	addi	sp,sp,-28
	sw	ra,24(sp)
	sw	s0,20(sp)
	sw	s1,16(sp)
	sw	a0,8(sp)
	sw	a1,12(sp)
	beq	a2,zero,.L239
	li	s0,0
.L242:
	add	a5,a2,s0
	srli	a5,a5,1
	slli	a4,a5,3
	sw	a5,0(sp)
	lw	a5,12(sp)
	lw	a0,8(sp)
	sw	a2,4(sp)
	add	s1,a5,a4
	lw	a1,0(s1)
	call	strcmp
	lw	a5,0(sp)
	blt	a0,zero,.L244
	beq	a0,zero,.L241
	lw	a2,4(sp)
	addi	s0,a5,1
	bgtu	a2,s0,.L242
.L239:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	li	a0,-1
	addi	sp,sp,28
	jr	ra
.L244:
	mv	a2,a5
	bgtu	a2,s0,.L242
	j	.L239
.L241:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	a0,4(s1)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
	.size	str_lookup, .-str_lookup
	.section	.rodata.encode.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	"cannot encode NULL text\n"
	.align	2
.LC9:
	.string	" "
	.align	2
.LC10:
	.string	"%s%s"
	.section	.text.encode,"ax",@progbits
	.align	2
	.globl	encode
	.hidden	encode
	.type	encode, @function
encode:
	addi	sp,sp,-64
	sw	s0,56(sp)
	sw	ra,60(sp)
	sw	s1,52(sp)
	sw	a1,16(sp)
	sw	a0,24(sp)
	sw	a3,48(sp)
	sw	a4,44(sp)
	sw	a5,28(sp)
	mv	s0,a2
	beq	a1,zero,.L324
	lw	a5,24(sp)
	lw	a5,8(a5)
	beq	a5,zero,.L325
.L252:
	lw	a5,24(sp)
	lw	a0,16(a5)
	slli	a0,a0,1
	addi	a0,a0,3
	call	malloc
	sw	a0,8(sp)
	bne	s0,zero,.L256
	lw	a5,28(sp)
	sw	zero,0(a5)
	lw	a5,16(sp)
	lbu	a5,0(a5)
	bne	a5,zero,.L258
.L265:
	lw	a5,28(sp)
	li	a4,1
	lw	a5,0(a5)
	ble	a5,a4,.L279
.L326:
	lw	a5,44(sp)
	sw	zero,20(sp)
	sw	a5,16(sp)
	li	a5,-1
	sw	a5,40(sp)
	sw	a5,36(sp)
	li	a5,-2147483648
	sw	a5,32(sp)
.L284:
	lw	a4,16(sp)
	lw	s0,24(sp)
	lw	a0,8(sp)
	lw	a5,4(a4)
	lw	a3,0(a4)
	lw	a4,0(s0)
	slli	a5,a5,2
	slli	a3,a3,2
	add	a5,a4,a5
	add	a4,a4,a3
	lw	a2,0(a4)
	lw	a3,0(a5)
	lla	a1,.LC10
	call	sprintf
	lw	a5,8(s0)
	lw	a2,12(s0)
	sw	a5,12(sp)
	beq	a2,zero,.L280
	li	s0,0
	mv	s1,s0
	mv	s0,a2
.L283:
	add	a5,s1,s0
	srli	a5,a5,1
	slli	a4,a5,3
	sw	a5,0(sp)
	lw	a5,12(sp)
	lw	a0,8(sp)
	add	a4,a5,a4
	lw	a1,0(a4)
	sw	a4,4(sp)
	call	strcmp
	lw	a5,0(sp)
	blt	a0,zero,.L296
	lw	a4,4(sp)
	beq	a0,zero,.L282
	addi	s1,a5,1
	bltu	s1,s0,.L283
.L280:
	lw	a4,20(sp)
	lw	a5,28(sp)
	addi	a3,a4,1
	lw	a4,16(sp)
	lw	a5,0(a5)
	sw	a3,20(sp)
	addi	a4,a4,4
	sw	a4,16(sp)
	addi	a4,a5,-1
	bgt	a4,a3,.L284
	lw	a3,40(sp)
	li	a4,-1
	beq	a3,a4,.L279
	lw	a5,44(sp)
	slli	a4,a3,2
	lw	a2,28(sp)
	add	a4,a5,a4
	lw	a5,36(sp)
	addi	a3,a3,1
	sw	a5,0(a4)
	lw	a5,0(a2)
	addi	a5,a5,-1
	ble	a5,a3,.L285
.L286:
	lw	a5,8(a4)
	addi	a3,a3,1
	addi	a4,a4,4
	sw	a5,0(a4)
	lw	a5,0(a2)
	addi	a5,a5,-1
	bgt	a5,a3,.L286
.L285:
	lw	a4,28(sp)
	sw	a5,0(a4)
	li	a4,1
	bgt	a5,a4,.L326
.L279:
	lw	a4,48(sp)
	beq	a4,zero,.L287
	lw	a3,28(sp)
	addi	a4,a5,1
	slli	a5,a5,2
	sw	a4,0(a3)
	lw	a4,44(sp)
	add	a5,a4,a5
	li	a4,2
	sw	a4,0(a5)
.L287:
	lw	s0,56(sp)
	lw	a0,8(sp)
	lw	ra,60(sp)
	lw	s1,52(sp)
	addi	sp,sp,64
	tail	free
.L296:
	mv	s0,a5
	bltu	s1,s0,.L283
	j	.L280
.L282:
	lw	a5,4(a4)
	li	a4,-1
	beq	a5,a4,.L280
	lw	a4,24(sp)
	slli	a3,a5,2
	lw	a4,4(a4)
	add	a4,a4,a3
	lw	a4,0(a4)
	lw	a3,32(sp)
	ble	a4,a3,.L280
	lw	a3,20(sp)
	sw	a5,36(sp)
	sw	a4,32(sp)
	sw	a3,40(sp)
	j	.L280
.L256:
	lw	a4,28(sp)
	li	a5,1
	sw	a5,0(a4)
	lw	a4,44(sp)
	sw	a5,0(a4)
	lw	a5,16(sp)
	lbu	a5,0(a5)
	beq	a5,zero,.L265
.L258:
	lw	a5,24(sp)
	li	a2,0
	lw	s0,12(a5)
	lw	s1,8(a5)
	beq	s0,zero,.L264
	sw	s1,12(sp)
	mv	s1,s0
.L260:
	add	a5,a2,s1
	srli	s0,a5,1
	lw	a5,12(sp)
	slli	a4,s0,3
	lla	a0,.LC9
	add	a4,a5,a4
	lw	a1,0(a4)
	sw	a2,0(sp)
	sw	a4,4(sp)
	call	strcmp
	lw	a2,0(sp)
	blt	a0,zero,.L293
	lw	a4,4(sp)
	beq	a0,zero,.L263
	addi	a2,s0,1
	bgtu	s1,a2,.L260
.L264:
	li	a4,-1
.L261:
	lw	a2,28(sp)
	lw	a5,0(a2)
	addi	a3,a5,1
	sw	a3,0(a2)
	lw	a3,44(sp)
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,0(a5)
	lw	a5,16(sp)
	lbu	a5,0(a5)
	beq	a5,zero,.L265
	lw	a4,8(sp)
	li	a3,0
	addi	a4,a4,1
	sw	a4,32(sp)
.L278:
	lw	a4,16(sp)
	andi	a0,a5,192
	lbu	a2,1(a4)
	li	a4,128
	andi	t1,a2,192
	beq	a0,a4,.L327
.L266:
	lw	a3,8(sp)
	sb	a5,0(a3)
	sb	zero,1(a3)
	beq	t1,a4,.L328
	lw	a5,24(sp)
	lw	a2,12(a5)
	lw	a5,8(a5)
	sw	a5,12(sp)
	li	a5,1
	sw	a5,20(sp)
	beq	a2,zero,.L329
.L269:
	li	s0,0
	mv	s1,a2
.L274:
	add	a5,s1,s0
	srli	a5,a5,1
	slli	a4,a5,3
	sw	a5,0(sp)
	lw	a5,12(sp)
	lw	a0,8(sp)
	add	a4,a5,a4
	lw	a1,0(a4)
	sw	a4,4(sp)
	call	strcmp
	lw	a5,0(sp)
	blt	a0,zero,.L295
	lw	a4,4(sp)
	beq	a0,zero,.L273
	addi	s0,a5,1
	bgtu	s1,s0,.L274
.L275:
	lw	a4,8(sp)
	lw	a5,20(sp)
	add	a1,a4,a5
	beq	a5,zero,.L319
.L270:
	lw	a4,8(sp)
	lw	t1,44(sp)
	lw	a2,28(sp)
.L277:
	lw	a5,0(a2)
	lbu	a3,0(a4)
	addi	a4,a4,1
	addi	a0,a5,1
	slli	a5,a5,2
	sw	a0,0(a2)
	add	a5,t1,a5
	addi	a3,a3,3
	sw	a3,0(a5)
	bne	a1,a4,.L277
.L319:
	lw	a5,16(sp)
	li	a3,0
	lbu	a5,1(a5)
.L276:
	lw	a4,16(sp)
	addi	a4,a4,1
	sw	a4,16(sp)
	beq	a5,zero,.L265
	lw	a4,16(sp)
	andi	a0,a5,192
	lbu	a2,1(a4)
	li	a4,128
	andi	t1,a2,192
	bne	a0,a4,.L266
.L327:
	lw	a1,8(sp)
	addi	a4,a3,1
	sw	a4,20(sp)
	add	a3,a1,a3
	sb	a5,0(a3)
	add	a1,a1,a4
	sb	zero,0(a1)
	bne	t1,a0,.L267
	li	a5,4
	bne	a4,a5,.L268
	lw	a5,24(sp)
	lw	a2,12(a5)
	lw	a5,8(a5)
	sw	a5,12(sp)
	bne	a2,zero,.L269
	j	.L270
.L295:
	mv	s1,a5
	bgtu	s1,s0,.L274
	j	.L275
.L273:
	lw	a4,4(a4)
	li	a5,-1
	beq	a4,a5,.L275
	lw	a1,28(sp)
	li	a3,0
	lw	a5,0(a1)
	addi	a2,a5,1
	sw	a2,0(a1)
	lw	a2,44(sp)
	slli	a5,a5,2
	add	a5,a2,a5
	sw	a4,0(a5)
	lw	a5,16(sp)
	lbu	a5,1(a5)
	j	.L276
.L328:
	mv	a5,a2
	li	a3,1
	j	.L276
.L293:
	mv	s1,s0
	bgtu	s1,a2,.L260
	j	.L264
.L267:
	lw	a5,24(sp)
	lw	a2,12(a5)
	lw	a5,8(a5)
	sw	a5,12(sp)
	bne	a2,zero,.L269
	j	.L275
.L263:
	lw	a4,4(a4)
	j	.L261
.L329:
	lw	a1,32(sp)
	j	.L270
.L324:
	lla	a0,.LC8
	call	printf
	li	a0,1
	call	bench_exit
	lw	a5,24(sp)
	lw	a5,8(a5)
	bne	a5,zero,.L252
.L325:
	lw	s1,24(sp)
	lw	a0,12(s1)
	slli	a0,a0,3
	call	malloc
	lw	a1,12(s1)
	sw	a0,8(s1)
	ble	a1,zero,.L255
	lw	a5,24(sp)
	mv	a4,a0
	lw	a3,0(a5)
	li	a5,0
.L254:
	lw	a2,0(a3)
	sw	a5,4(a4)
	addi	a5,a5,1
	sw	a2,0(a4)
	addi	a3,a3,4
	addi	a4,a4,8
	bne	a5,a1,.L254
.L255:
	lla	a3,compare_tokens
	li	a2,8
	call	qsort
	j	.L252
.L268:
	lw	a5,16(sp)
	lw	a3,20(sp)
	addi	a5,a5,1
	sw	a5,16(sp)
	mv	a5,a2
	j	.L278
	.size	encode, .-encode
	.section	.text.sample_argmax,"ax",@progbits
	.align	2
	.globl	sample_argmax
	.hidden	sample_argmax
	.type	sample_argmax, @function
sample_argmax:
	li	a5,1
	lw	a2,0(a0)
	ble	a1,a5,.L334
	addi	a5,a0,4
	li	a4,1
	li	a0,0
.L333:
	lw	a3,0(a5)
	addi	a5,a5,4
	ble	a3,a2,.L332
	mv	a0,a4
	mv	a2,a3
.L332:
	addi	a4,a4,1
	bne	a1,a4,.L333
	ret
.L334:
	li	a0,0
	ret
	.size	sample_argmax, .-sample_argmax
	.section	.text.sample_mult,"ax",@progbits
	.align	2
	.globl	sample_mult
	.hidden	sample_mult
	.type	sample_mult, @function
sample_mult:
	ble	a1,zero,.L337
	lw	a4,0(a0)
	blt	a2,a4,.L341
	addi	a5,a0,4
	li	a0,0
	j	.L339
.L340:
	lw	a3,0(a5)
	addi	a5,a5,4
	add	a4,a4,a3
	bgt	a4,a2,.L336
.L339:
	addi	a0,a0,1
	bne	a1,a0,.L340
.L337:
	addi	a0,a1,-1
	ret
.L341:
	li	a0,0
.L336:
	ret
	.size	sample_mult, .-sample_mult
	.section	.text.sample_topp,"ax",@progbits
	.align	2
	.globl	sample_topp
	.hidden	sample_topp
	.type	sample_topp, @function
sample_topp:
	addi	sp,sp,-28
	sw	s0,20(sp)
	mv	s0,a0
	li	a0,262144
	mv	t2,a1
	sub	a0,a0,a2
	addi	a1,a1,-1
	sw	s1,16(sp)
	sw	t2,4(sp)
	sw	ra,24(sp)
	sw	a2,8(sp)
	mv	s1,a3
	sw	a4,0(sp)
	call	__divsi3
	lw	t2,4(sp)
	ble	t2,zero,.L343
	lw	t0,8(sp)
	li	a4,0
	li	a1,0
.L345:
	lw	a3,0(s0)
	slli	a5,a1,3
	add	a5,s1,a5
	blt	a3,a0,.L344
	sw	a4,4(a5)
	lw	a3,0(s0)
	addi	a1,a1,1
	sw	a3,0(a5)
.L344:
	addi	a4,a4,1
	addi	s0,s0,4
	bne	t2,a4,.L345
	lla	a3,compare
	li	a2,8
	mv	a0,s1
	sw	a1,8(sp)
	sw	t0,4(sp)
	call	qsort
	lw	a5,0(sp)
	lw	a1,8(sp)
	srai	a3,a5,31
	beq	a1,zero,.L348
	lw	t2,0(s1)
	lw	t0,4(sp)
	mv	a4,t2
	blt	t0,t2,.L349
	addi	a5,s1,8
	mv	a2,a5
	mv	a0,t2
	li	s0,0
	j	.L350
.L353:
	lw	ra,0(a2)
	addi	a2,a2,8
	add	a0,a0,ra
	blt	t0,a0,.L352
.L350:
	addi	s0,s0,1
	bne	a1,s0,.L353
	lw	a2,0(sp)
	srai	a1,a0,31
	sw	a5,8(sp)
	sw	t2,4(sp)
	call	__muldi3
	lw	t2,4(sp)
	lw	a5,8(sp)
	slli	a1,a1,14
	srli	a0,a0,18
	or	a1,a1,a0
	addi	s0,s0,-1
	mv	a4,t2
.L354:
	li	a3,0
	blt	a1,t2,.L360
.L356:
	addi	a3,a3,1
	bgt	a3,s0,.L366
	lw	a2,0(a5)
	mv	a0,a5
	addi	a5,a5,8
	add	a4,a4,a2
	ble	a4,a1,.L356
.L351:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	a0,4(a0)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L352:
	lw	a2,0(sp)
	srai	a1,a0,31
	sw	a5,12(sp)
	sw	t2,8(sp)
	sw	a4,4(sp)
	call	__muldi3
	slli	a1,a1,14
	srli	a0,a0,18
	lw	a4,4(sp)
	lw	t2,8(sp)
	lw	a5,12(sp)
	or	a1,a1,a0
	j	.L354
.L366:
	slli	s0,s0,3
	add	s1,s1,s0
.L347:
	lw	a0,4(s1)
.L367:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L343:
	mv	a0,s1
	lla	a3,compare
	li	a2,8
	li	a1,0
	call	qsort
	addi	s1,s1,-8
	lw	a0,4(s1)
	j	.L367
.L349:
	lw	a2,0(sp)
	mv	a0,t2
	srai	a1,t2,31
	sw	t2,0(sp)
	call	__muldi3
	lw	t2,0(sp)
	slli	a4,a1,14
	srli	a5,a0,18
	or	a5,a4,a5
	ble	t2,a5,.L347
.L360:
	mv	a0,s1
	j	.L351
.L348:
	addi	s1,s1,-8
	lw	a0,4(s1)
	j	.L367
	.size	sample_topp, .-sample_topp
	.section	.text.build_sampler,"ax",@progbits
	.align	2
	.globl	build_sampler
	.hidden	build_sampler
	.type	build_sampler, @function
build_sampler:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	sw	a1,0(a0)
	sw	a2,8(a0)
	sw	a3,12(a0)
	sw	a4,16(a0)
	sw	a5,20(a0)
	slli	a0,a1,3
	call	malloc
	lw	ra,8(sp)
	sw	a0,4(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	build_sampler, .-build_sampler
	.section	.text.free_sampler,"ax",@progbits
	.align	2
	.globl	free_sampler
	.hidden	free_sampler
	.type	free_sampler, @function
free_sampler:
	lw	a0,4(a0)
	tail	free
	.size	free_sampler, .-free_sampler
	.section	.text.random_u32,"ax",@progbits
	.align	2
	.globl	random_u32
	.hidden	random_u32
	.type	random_u32, @function
random_u32:
	lw	a5,4(a0)
	lw	a2,0(a0)
	mv	t1,a0
	slli	a3,a5,20
	srli	a4,a2,12
	or	a4,a3,a4
	srli	a3,a5,12
	xor	a4,a4,a2
	xor	a3,a3,a5
	srli	a2,a4,7
	slli	a5,a3,25
	or	a5,a2,a5
	slli	a0,a4,25
	xor	a5,a5,a3
	xor	a0,a0,a4
	slli	a3,a5,5
	srli	a4,a0,27
	or	a4,a3,a4
	lla	a3,.LC11
	addi	sp,sp,-12
	lw	a2,0(a3)
	srli	a1,a5,27
	lw	a3,4(a3)
	sw	ra,8(sp)
	xor	a0,a4,a0
	xor	a1,a1,a5
	sw	a0,0(t1)
	sw	a1,4(t1)
	call	__muldi3
	lw	ra,8(sp)
	mv	a0,a1
	addi	sp,sp,12
	jr	ra
	.size	random_u32, .-random_u32
	.section	.text.random_f32,"ax",@progbits
	.align	2
	.globl	random_f32
	.hidden	random_f32
	.type	random_f32, @function
random_f32:
	lw	a5,4(a0)
	lw	a2,0(a0)
	mv	t1,a0
	slli	a3,a5,20
	srli	a4,a2,12
	or	a4,a3,a4
	srli	a3,a5,12
	xor	a4,a4,a2
	xor	a3,a3,a5
	srli	a2,a4,7
	slli	a5,a3,25
	or	a5,a2,a5
	slli	a0,a4,25
	xor	a5,a5,a3
	xor	a0,a0,a4
	slli	a3,a5,5
	srli	a4,a0,27
	or	a4,a3,a4
	lla	a3,.LC11
	addi	sp,sp,-12
	lw	a2,0(a3)
	srli	a1,a5,27
	lw	a3,4(a3)
	sw	ra,8(sp)
	xor	a0,a4,a0
	xor	a1,a1,a5
	sw	a0,0(t1)
	sw	a1,4(t1)
	call	__muldi3
	lw	ra,8(sp)
	slli	a0,a1,14
	srli	a0,a0,14
	addi	sp,sp,12
	jr	ra
	.size	random_f32, .-random_f32
	.section	.text.sample,"ax",@progbits
	.align	2
	.globl	sample
	.hidden	sample
	.type	sample, @function
sample:
	lw	a2,8(a0)
	addi	sp,sp,-20
	sw	ra,16(sp)
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	a1,4(sp)
	lw	a3,0(a0)
	beq	a2,zero,.L376
	mv	s0,a0
	ble	a3,zero,.L377
	mv	s1,a1
	li	a4,0
	j	.L378
.L391:
	lw	a2,8(s0)
.L378:
	lw	a0,0(s1)
	srai	a3,a2,31
	sw	a4,0(sp)
	srai	a5,a0,31
	srli	a1,a0,14
	slli	a5,a5,18
	slli	a0,a0,18
	or	a1,a1,a5
	call	__divdi3
	sw	a0,0(s1)
	lw	a4,0(sp)
	lw	a3,0(s0)
	addi	s1,s1,4
	addi	a4,a4,1
	blt	a4,a3,.L391
.L377:
	lw	s1,4(sp)
	mv	a1,a3
	mv	a0,s1
	call	softmax
	lw	a5,20(s0)
	lw	a3,16(s0)
	slli	a2,a5,20
	srli	a4,a3,12
	or	a4,a2,a4
	srli	a2,a5,12
	xor	a4,a4,a3
	xor	a2,a2,a5
	srli	a3,a4,7
	slli	a5,a2,25
	or	a5,a3,a5
	slli	a3,a4,25
	xor	a5,a5,a2
	xor	a4,a3,a4
	srli	a0,a4,27
	slli	a3,a5,5
	or	a0,a3,a0
	lla	a3,.LC11
	lw	a2,0(a3)
	srli	a1,a5,27
	lw	a3,4(a3)
	xor	a0,a0,a4
	xor	a1,a1,a5
	sw	a0,16(s0)
	sw	a1,20(s0)
	call	__muldi3
	lw	a2,12(s0)
	li	a5,262144
	addi	a0,a5,-1
	addi	a3,a2,-1
	addi	a5,a5,-2
	and	a4,a1,a0
	bleu	a3,a5,.L383
	lw	a1,0(s0)
	ble	a1,zero,.L384
	lw	a5,0(s1)
	blt	a4,a5,.L385
	addi	s0,s1,4
	li	a2,0
	j	.L386
.L387:
	lw	a3,0(s0)
	addi	s0,s0,4
	add	a5,a5,a3
	blt	a4,a5,.L375
.L386:
	addi	a2,a2,1
	bne	a1,a2,.L387
.L384:
	addi	a2,a1,-1
.L375:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	mv	a0,a2
	addi	sp,sp,20
	jr	ra
.L376:
	lw	a4,4(sp)
	li	a5,1
	lw	a1,0(a4)
	addi	s0,a4,4
	ble	a3,a5,.L385
.L382:
	lw	a4,0(s0)
	addi	s0,s0,4
	ble	a4,a1,.L381
	mv	a2,a5
	mv	a1,a4
.L381:
	addi	a5,a5,1
	bne	a5,a3,.L382
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	mv	a0,a2
	addi	sp,sp,20
	jr	ra
.L383:
	lw	a3,4(s0)
	lw	a1,0(s0)
	lw	s0,12(sp)
	lw	a0,4(sp)
	lw	ra,16(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	tail	sample_topp
.L385:
	li	a2,0
	j	.L375
	.size	sample, .-sample
	.section	.text.time_in_us,"ax",@progbits
	.align	2
	.globl	time_in_us
	.hidden	time_in_us
	.type	time_in_us, @function
time_in_us:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	bench_uptime
	lw	ra,8(sp)
	addi	sp,sp,12
	jr	ra
	.size	time_in_us, .-time_in_us
	.section	.rodata.generate.str1.4,"aMS",@progbits,1
	.align	2
.LC12:
	.string	""
	.align	2
.LC13:
	.string	"something is wrong, expected at least 1 prompt token\n"
	.align	2
.LC14:
	.string	"\n"
	.globl	__udivdi3
	.align	2
.LC15:
	.string	"achieved tok/s: %s\n"
	.align	2
.LC16:
	.string	"achieved tok/s: can not measure due to finishing in 0.1s\n"
	.section	.text.generate,"ax",@progbits
	.align	2
	.globl	generate
	.hidden	generate
	.type	generate, @function
generate:
	addi	sp,sp,-60
	sw	s0,52(sp)
	sw	ra,56(sp)
	sw	s1,48(sp)
	sw	a0,28(sp)
	sw	a1,20(sp)
	sw	a2,36(sp)
	sw	a4,24(sp)
	lla	s0,.LC12
	beq	a3,zero,.L395
	mv	s0,a3
.L395:
	mv	a0,s0
	sw	zero,44(sp)
	call	strlen
	addi	a0,a0,3
	slli	a0,a0,2
	call	malloc
	mv	a4,a0
	sw	a0,40(sp)
	lw	a0,20(sp)
	mv	a1,s0
	addi	a5,sp,44
	li	a3,0
	li	a2,1
	call	encode
	lw	s0,44(sp)
	ble	s0,zero,.L412
.L396:
	lw	a5,40(sp)
	lw	a4,24(sp)
	lw	s1,0(a5)
	ble	a4,zero,.L397
	addi	a4,s0,-1
	addi	a5,a5,4
	sw	a4,32(sp)
	sw	a5,0(sp)
	li	s0,0
	sw	zero,12(sp)
	sw	zero,16(sp)
	j	.L402
.L414:
	lw	a5,0(sp)
	li	a3,1
	lw	a0,20(sp)
	lw	a5,0(a5)
	mv	a1,s1
	addi	a4,s0,1
	sw	a5,4(sp)
	mv	a2,a5
	beq	a5,a3,.L400
.L415:
	sw	a4,8(sp)
	call	decode
	call	safe_printf
	lla	a5,stdout
	lw	a0,0(a5)
	lw	a5,0(sp)
	addi	a5,a5,4
	sw	a5,0(sp)
	lw	a5,4(sp)
	mv	s1,a5
	call	fflush
	lw	a4,16(sp)
	lw	a5,12(sp)
	or	a5,a5,a4
	lw	a4,8(sp)
	beq	a5,zero,.L413
.L401:
	lw	a5,24(sp)
	beq	a5,a4,.L400
	mv	s0,a4
.L402:
	lw	a0,28(sp)
	mv	a2,s0
	mv	a1,s1
	call	forward
	lw	a5,32(sp)
	bgt	a5,s0,.L414
	mv	a1,a0
	lw	a0,36(sp)
	call	sample
	mv	a5,a0
	li	a3,1
	sw	a5,4(sp)
	lw	a0,20(sp)
	mv	a1,s1
	mv	a2,a5
	addi	a4,s0,1
	bne	a5,a3,.L415
.L400:
	lla	a0,.LC14
	sw	a4,0(sp)
	call	printf
	lw	a4,0(sp)
	li	a5,1
	bne	a4,a5,.L416
.L403:
	lw	s0,52(sp)
	lw	a0,40(sp)
	lw	ra,56(sp)
	lw	s1,48(sp)
	addi	sp,sp,60
	tail	free
.L413:
	sw	a4,4(sp)
	call	bench_uptime
	srai	a5,a0,31
	lw	a4,4(sp)
	sw	a0,12(sp)
	sw	a5,16(sp)
	j	.L401
.L416:
	call	bench_uptime
	lw	a4,12(sp)
	srai	a5,a0,31
	sub	a2,a0,a4
	lw	a4,16(sp)
	sgtu	a0,a2,a0
	sub	a5,a5,a4
	sub	a3,a5,a0
	bne	a5,a0,.L407
	li	a5,98304
	addi	a5,a5,1695
	bleu	a2,a5,.L408
.L407:
	slli	a4,s0,18
	srai	a1,a4,31
	srli	t1,a4,27
	slli	a5,a1,5
	slli	s0,s0,23
	sub	a0,s0,a4
	or	a5,t1,a5
	sgtu	s0,a0,s0
	sub	a5,a5,a1
	sub	t1,a5,s0
	srli	t2,a0,26
	slli	t0,a0,6
	slli	a5,t1,6
	or	a5,t2,a5
	sub	a0,t0,a0
	sgtu	t0,a0,t0
	sub	a5,a5,t1
	sub	a5,a5,t0
	slli	t1,a0,3
	slli	a5,a5,3
	srli	a0,a0,29
	add	a4,t1,a4
	or	a5,a0,a5
	sltu	t1,a4,t1
	add	a5,a5,a1
	add	a5,t1,a5
	srli	a1,a4,26
	slli	a5,a5,6
	slli	a0,a4,6
	or	a1,a1,a5
	call	__udivdi3
	li	a2,-1
	lla	a1,.LANCHOR1
	call	fixedpt_str
	lla	a1,.LANCHOR1
	lla	a0,.LC15
	call	printf
	lw	s0,52(sp)
	lw	a0,40(sp)
	lw	ra,56(sp)
	lw	s1,48(sp)
	addi	sp,sp,60
	tail	free
.L408:
	lla	a0,.LC16
	call	printf
	lw	s0,52(sp)
	lw	a0,40(sp)
	lw	ra,56(sp)
	lw	s1,48(sp)
	addi	sp,sp,60
	tail	free
.L412:
	lla	a0,.LC13
	call	printf
	li	a0,1
	call	bench_exit
	j	.L396
.L397:
	lla	a0,.LC14
	call	printf
	j	.L403
	.size	generate, .-generate
	.section	.rodata.error_usage.str1.4,"aMS",@progbits,1
	.align	2
.LC17:
	.string	"Usage:   run <checkpoint> [options]\n"
	.align	2
.LC18:
	.string	"Example: run model.bin -n 256 -i \"Once upon a time\"\n"
	.align	2
.LC19:
	.string	"Options:\n"
	.align	2
.LC20:
	.string	"  -t <float>  temperature in [0,inf], default 1.0\n"
	.align	2
.LC21:
	.string	"  -p <float>  p value in top-p (nucleus) sampling in [0,1] default 0.9\n"
	.align	2
.LC22:
	.string	"  -s <int>    random seed, default time(NULL)\n"
	.align	2
.LC23:
	.string	"  -n <int>    number of steps to run for, default 256. 0 = max_seq_len\n"
	.align	2
.LC24:
	.string	"  -i <string> input prompt\n"
	.align	2
.LC25:
	.string	"  -z <string> optional path to custom tokenizer\n"
	.section	.text.error_usage,"ax",@progbits
	.align	2
	.globl	error_usage
	.hidden	error_usage
	.type	error_usage, @function
error_usage:
	addi	sp,sp,-12
	lla	a0,.LC17
	sw	ra,8(sp)
	call	printf
	lla	a0,.LC18
	call	printf
	lla	a0,.LC19
	call	printf
	lla	a0,.LC20
	call	printf
	lla	a0,.LC21
	call	printf
	lla	a0,.LC22
	call	printf
	lla	a0,.LC23
	call	printf
	lla	a0,.LC24
	call	printf
	lla	a0,.LC25
	call	printf
	lw	ra,8(sp)
	li	a0,1
	addi	sp,sp,12
	tail	bench_exit
	.size	error_usage, .-error_usage
	.section	.rodata.bench_init.str1.4,"aMS",@progbits,1
	.align	2
.LC26:
	.string	"Start...\n"
	.align	2
.LC27:
	.string	"input/tok512.bin"
	.section	.text.bench_init,"ax",@progbits
	.align	2
	.globl	bench_init
	.hidden	bench_init
	.type	bench_init, @function
bench_init:
	slli	a5,a0,1
	addi	sp,sp,-16
	add	a5,a5,a0
	sw	s0,8(sp)
	slli	a5,a5,3
	lla	s0,.LANCHOR3
	add	s0,s0,a5
	lw	a5,4(s0)
	sw	s1,4(sp)
	li	a1,4096
	lla	s1,.LANCHOR4
	lla	a0,.LANCHOR0
	sw	a5,0(s1)
	sw	ra,12(sp)
	la a4, .LANCHOR2; sw s0, 0(a4);
	call	bench_obuf_init
	lw	a1,0(s0)
	lla	a0,.LC26
	sw	a1,0(sp)
	call	printf
	lw	a5,0(s1)
	lw	a1,0(sp)
	bge	a5,zero,.L420
	la a5, .LANCHOR4; sw zero, 0(a5);
.L420:
	lla	s0,.LANCHOR5
	lla	a5,.LANCHOR5+132
	lla	a4,.LANCHOR5+128
	mv	a0,a1
	lla	a3,.LANCHOR5+124
	lla	a2,.LANCHOR5+28
	mv	a1,s0
	call	read_checkpoint
	mv	a1,s0
	lla	a0,.LANCHOR5+76
	call	malloc_run_state
	lw	a5,0(s1)
	lw	a4,24(s0)
	beq	a5,zero,.L422
	ble	a5,a4,.L423
.L422:
	sw	a4,0(s1)
.L423:
	lw	a2,20(s0)
	lla	a1,.LC27
	lla	a0,.LANCHOR6
	call	build_tokenizer
	lw	a5,20(s0)
	lla	s0,.LANCHOR7
	li	a4,135168
	sw	a5,0(s0)
	slli	a0,a5,3
	la a5, .LANCHOR7+8; sw zero, 0(a5);
	li	a5,262144
	sw	a5,12(s0)
	addi	a4,a4,-1426
	li	a5,0
	sw	a4,16(s0)
	sw	a5,20(s0)
	call	malloc
	lw	ra,12(sp)
	sw	a0,4(s0)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	bench_init, .-bench_init
	.section	.rodata.bench_run.str1.4,"aMS",@progbits,1
	.align	2
.LC28:
	.string	"generate"
	.align	2
.LC29:
	.string	"unknown mode: %s\n"
	.section	.text.bench_run,"ax",@progbits
	.align	2
	.globl	bench_run
	.hidden	bench_run
	.type	bench_run, @function
bench_run:
	lla	a1,.LC28
	addi	sp,sp,-12
	mv	a0,a1
	sw	ra,8(sp)
	call	strcmp
	bne	a0,zero,.L426
	lla	a1,.LANCHOR6
	lla	a0,.LANCHOR5
	la a4, .LANCHOR4; lw a4, 0(a4);
	li	a3,0
	lla	a2,.LANCHOR7
	call	generate
	lw	ra,8(sp)
	la a5, .LANCHOR2; lw a5, 0(a5);
	lw	a0,16(a5)
	lw	a1,20(a5)
	addi	sp,sp,12
	jr	ra
.L426:
	lla	a1,.LC28
	lla	a0,.LC29
	call	printf
	call	error_usage
	lw	ra,8(sp)
	la a5, .LANCHOR2; lw a5, 0(a5);
	lw	a0,16(a5)
	lw	a1,20(a5)
	addi	sp,sp,12
	jr	ra
	.size	bench_run, .-bench_run
	.section	.text.bench_validate,"ax",@progbits
	.align	2
	.globl	bench_validate
	.hidden	bench_validate
	.type	bench_validate, @function
bench_validate:
	addi	sp,sp,-16
	la a0, .LANCHOR7+4; lw a0, 0(a0);
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	call	free
	lla	a0,.LANCHOR6
	call	free_tokenizer
	la a0, .LANCHOR5+128; lw a0, 0(a0);
	call	free
	lla	a0,.LANCHOR5+76
	call	free_run_state
	lla	s1,.LANCHOR0
	li	a2,1
	addi	a1,sp,3
	mv	a0,s1
	sb	zero,3(sp)
	call	bench_obuf_append
	lw	a0,0(s1)
	lw	a1,4(s1)
	add	a1,a0,a1
	call	bench_checksum
	la a4, .LANCHOR2; lw a4, 0(a4);
	lw	s0,8(a4)
	mv	a5,a0
	lw	a0,0(s1)
	sub	s0,s0,a5
	snez	s0,s0
	call	free
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	bench_validate, .-bench_validate
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC30:
	.string	"input/test.model"
	.align	2
.LC31:
	.string	"input/train.model"
	.align	2
.LC32:
	.string	"input/ref.model"
	.align	2
.LC33:
	.string	"input/huge.model"
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC11:
	.word	1332534557
	.word	625341585
	.section	.bss.obuf,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	obuf, @object
	.size	obuf, 12
obuf:
	.zero	12
	.section	.bss.sampler,"aw",@nobits
	.align	3
	.set	.LANCHOR7,. + 0
	.type	sampler, @object
	.size	sampler, 24
sampler:
	.zero	24
	.section	.bss.str.0,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	str.0, @object
	.size	str.0, 25
str.0:
	.zero	25
	.section	.bss.tokenizer,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	tokenizer, @object
	.size	tokenizer, 532
tokenizer:
	.zero	532
	.section	.bss.transformer,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	transformer, @object
	.size	transformer, 136
transformer:
	.zero	136
	.section	.rodata.settings,"a"
	.align	3
	.set	.LANCHOR3,. + 0
	.type	settings, @object
	.size	settings, 96
settings:
	.word	.LC30
	.word	1
	.word	1171205740
	.zero	4
	.word	0
	.word	0
	.word	.LC31
	.word	15
	.word	1567300908
	.zero	4
	.word	207
	.word	0
	.word	.LC32
	.word	92
	.word	1843433602
	.zero	4
	.word	146402
	.word	0
	.word	.LC33
	.word	0
	.word	-1564831845
	.zero	4
	.word	1588129
	.word	0
	.section	.sbss.ps,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	ps, @object
	.size	ps, 4
ps:
	.zero	4
	.section	.sdata.steps,"aw"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	steps, @object
	.size	steps, 4
steps:
	.word	256
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
