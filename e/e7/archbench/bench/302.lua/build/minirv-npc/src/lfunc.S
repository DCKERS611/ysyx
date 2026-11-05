#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lfunc.c"
	.option nopic
	.text
	.section	.text.luaF_newCclosure,"ax",@progbits
	.align	2
	.globl	luaF_newCclosure
	.hidden	luaF_newCclosure
	.type	luaF_newCclosure, @function
luaF_newCclosure:
	addi	sp,sp,-12
	slli	a2,a1,3
	sw	s0,4(sp)
	addi	a2,a2,16
	mv	s0,a1
	li	a1,38
	sw	ra,8(sp)
	call	luaC_newobj
	sb	s0,6(a0)
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	luaF_newCclosure, .-luaF_newCclosure
	.section	.text.luaF_newLclosure,"ax",@progbits
	.align	2
	.globl	luaF_newLclosure
	.hidden	luaF_newLclosure
	.type	luaF_newLclosure, @function
luaF_newLclosure:
	addi	sp,sp,-16
	sw	s1,4(sp)
	addi	s1,a1,-1
	sw	s0,8(sp)
	slli	s0,s1,2
	sw	a1,0(sp)
	addi	a2,s0,20
	li	a1,6
	sw	ra,12(sp)
	call	luaC_newobj
	lw	a5,0(sp)
	sw	zero,12(a0)
	sb	a5,6(a0)
	beq	a5,zero,.L4
	addi	a5,s0,4
	add	a5,a0,a5
	li	a4,-1
.L6:
	sw	zero,12(a5)
	addi	s1,s1,-1
	addi	a5,a5,-4
	bne	s1,a4,.L6
.L4:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	luaF_newLclosure, .-luaF_newLclosure
	.section	.text.luaF_initupvals,"ax",@progbits
	.align	2
	.globl	luaF_initupvals
	.hidden	luaF_initupvals
	.type	luaF_initupvals, @function
luaF_initupvals:
	addi	sp,sp,-20
	sw	ra,16(sp)
	sw	s0,12(sp)
	sw	s1,8(sp)
	lbu	a5,6(a1)
	sw	a1,4(sp)
	sw	a0,0(sp)
	beq	a5,zero,.L12
	addi	s1,a1,16
	li	s0,0
.L14:
	lw	a0,0(sp)
	li	a3,16
	li	a2,0
	li	a1,0
	call	luaM_realloc_
	li	a5,1
	sw	a5,4(a0)
	addi	a3,a0,8
	lw	a5,4(sp)
	sw	a3,0(a0)
	sw	zero,12(a0)
	sw	a0,0(s1)
	lbu	a3,6(a5)
	addi	s0,s0,1
	addi	s1,s1,4
	bgt	a3,s0,.L14
.L12:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
	.size	luaF_initupvals, .-luaF_initupvals
	.section	.text.luaF_findupval,"ax",@progbits
	.align	2
	.globl	luaF_findupval
	.hidden	luaF_findupval
	.type	luaF_findupval, @function
luaF_findupval:
	mv	a4,a0
	lw	a0,36(a0)
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s0,a1
	addi	s1,a4,36
	bne	a0,zero,.L21
	j	.L22
.L24:
	addi	s1,a0,8
	beq	a5,s0,.L20
	lw	a0,8(a0)
	beq	a0,zero,.L22
.L21:
	lw	a5,0(a0)
	bgeu	a5,s0,.L24
.L22:
	mv	a0,a4
	li	a3,16
	li	a2,0
	li	a1,0
	sw	a4,0(sp)
	call	luaM_realloc_
	lw	a5,0(s1)
	lw	a4,0(sp)
	sw	zero,4(a0)
	sw	a5,8(a0)
	li	a5,1
	sw	a5,12(a0)
	lw	a5,44(a4)
	sw	a0,0(s1)
	sw	s0,0(a0)
	beq	a5,a4,.L30
.L20:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L30:
	lw	a5,16(a4)
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	a3,92(a5)
	lw	s1,4(sp)
	sw	a3,44(a4)
	sw	a4,92(a5)
	addi	sp,sp,16
	jr	ra
	.size	luaF_findupval, .-luaF_findupval
	.section	.text.luaF_close,"ax",@progbits
	.align	2
	.globl	luaF_close
	.hidden	luaF_close
	.type	luaF_close, @function
luaF_close:
	lw	a5,36(a0)
	beq	a5,zero,.L46
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s0,a0
	mv	s1,a1
.L32:
	lw	a4,0(a5)
	addi	a1,a5,8
	bltu	a4,s1,.L31
	lw	a3,8(a5)
	lw	a2,4(a5)
	sw	a3,36(s0)
	beq	a2,zero,.L47
	lw	a2,0(a4)
	sw	a2,8(a5)
	lw	a4,4(a4)
	sw	a1,0(a5)
	sw	a4,12(a5)
	andi	a4,a4,64
	bne	a4,zero,.L48
	mv	a5,a3
	bne	a5,zero,.L32
.L31:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L47:
	mv	a1,a5
	li	a3,0
	li	a2,16
	mv	a0,s0
	call	luaM_realloc_
	lw	a5,36(s0)
	bne	a5,zero,.L32
	j	.L31
.L48:
	mv	a1,a5
	mv	a0,s0
	call	luaC_upvalbarrier_
	lw	a5,36(s0)
	bne	a5,zero,.L32
	j	.L31
.L46:
	ret
	.size	luaF_close, .-luaF_close
	.section	.text.luaF_newproto,"ax",@progbits
	.align	2
	.globl	luaF_newproto
	.hidden	luaF_newproto
	.type	luaF_newproto, @function
luaF_newproto:
	addi	sp,sp,-12
	li	a2,80
	li	a1,9
	sw	ra,8(sp)
	call	luaC_newobj
	sh	zero,6(a0)
	sb	zero,8(a0)
	lw	ra,8(sp)
	sw	zero,44(a0)
	sw	zero,16(a0)
	sw	zero,52(a0)
	sw	zero,28(a0)
	sw	zero,48(a0)
	sw	zero,68(a0)
	sw	zero,20(a0)
	sw	zero,56(a0)
	sw	zero,24(a0)
	sw	zero,64(a0)
	sw	zero,12(a0)
	sw	zero,60(a0)
	sw	zero,32(a0)
	sw	zero,36(a0)
	sw	zero,40(a0)
	sw	zero,72(a0)
	addi	sp,sp,12
	jr	ra
	.size	luaF_newproto, .-luaF_newproto
	.section	.text.luaF_freeproto,"ax",@progbits
	.align	2
	.globl	luaF_freeproto
	.hidden	luaF_freeproto
	.type	luaF_freeproto, @function
luaF_freeproto:
	addi	sp,sp,-12
	lw	a2,20(a1)
	sw	s0,4(sp)
	mv	s0,a1
	lw	a1,48(a1)
	li	a3,0
	slli	a2,a2,2
	sw	ra,8(sp)
	sw	s1,0(sp)
	mv	s1,a0
	call	luaM_realloc_
	lw	a2,28(s0)
	lw	a1,52(s0)
	li	a3,0
	slli	a2,a2,2
	mv	a0,s1
	call	luaM_realloc_
	lw	a2,16(s0)
	lw	a1,44(s0)
	li	a3,0
	slli	a2,a2,3
	mv	a0,s1
	call	luaM_realloc_
	lw	a2,24(s0)
	lw	a1,56(s0)
	li	a3,0
	slli	a2,a2,2
	mv	a0,s1
	call	luaM_realloc_
	lw	a5,32(s0)
	lw	a1,60(s0)
	li	a3,0
	slli	a2,a5,1
	add	a2,a2,a5
	slli	a2,a2,2
	mv	a0,s1
	call	luaM_realloc_
	lw	a2,12(s0)
	lw	a1,64(s0)
	li	a3,0
	slli	a2,a2,3
	mv	a0,s1
	call	luaM_realloc_
	mv	a1,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a0,s1
	lw	s1,0(sp)
	li	a3,0
	li	a2,80
	addi	sp,sp,12
	tail	luaM_realloc_
	.size	luaF_freeproto, .-luaF_freeproto
	.section	.text.luaF_getlocalname,"ax",@progbits
	.align	2
	.globl	luaF_getlocalname
	.hidden	luaF_getlocalname
	.type	luaF_getlocalname, @function
luaF_getlocalname:
	lw	t1,32(a0)
	ble	t1,zero,.L59
	lw	a5,60(a0)
	li	a4,0
	j	.L55
.L57:
	lw	a3,8(a5)
	ble	a3,a2,.L56
	addi	a1,a1,-1
	beq	a1,zero,.L60
.L56:
	addi	a5,a5,12
	beq	a4,t1,.L59
.L55:
	lw	a3,4(a5)
	addi	a4,a4,1
	ble	a3,a2,.L57
.L59:
	li	a0,0
	ret
.L60:
	lw	a0,0(a5)
	addi	a0,a0,16
	ret
	.size	luaF_getlocalname, .-luaF_getlocalname
	.hidden	luaC_upvalbarrier_
	.hidden	luaM_realloc_
	.hidden	luaC_newobj
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
