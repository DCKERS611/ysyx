#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lmem.c"
	.option nopic
	.text
	.section	.rodata.luaM_toobig.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"memory allocation error: block too big"
	.section	.text.luaM_toobig,"ax",@progbits
	.align	2
	.globl	luaM_toobig
	.hidden	luaM_toobig
	.type	luaM_toobig, @function
luaM_toobig:
	addi	sp,sp,-12
	lla	a1,.LC0
	sw	ra,8(sp)
	call	luaG_runerror
	.size	luaM_toobig, .-luaM_toobig
	.section	.text.luaM_realloc_,"ax",@progbits
	.align	2
	.globl	luaM_realloc_
	.hidden	luaM_realloc_
	.type	luaM_realloc_, @function
luaM_realloc_:
	addi	sp,sp,-28
	sw	s0,20(sp)
	lw	s0,16(a0)
	sw	s1,16(sp)
	snez	t0,a1
	lw	t2,0(s0)
	mv	s1,a0
	lw	a0,4(s0)
	neg	t0,t0
	and	a5,a2,t0
	sw	ra,24(sp)
	sw	a5,4(sp)
	sw	a1,8(sp)
	sw	a2,12(sp)
	sw	a3,0(sp)
	jalr	t2
	lw	a5,0(sp)
	beq	a0,zero,.L17
.L6:
	lw	a3,12(s0)
	lw	a4,4(sp)
	lw	ra,24(sp)
	add	a5,a5,a3
	sub	a5,a5,a4
	sw	a5,12(s0)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L17:
	beq	a5,zero,.L6
	lw	a3,116(s0)
	beq	a3,zero,.L8
	li	a1,1
	mv	a0,s1
	sw	a5,0(sp)
	call	luaC_fullgc
	lw	a5,0(sp)
	lw	a0,4(s0)
	lw	t2,0(s0)
	lw	a2,12(sp)
	lw	a1,8(sp)
	mv	a3,a5
	jalr	t2
	lw	a5,0(sp)
	bne	a0,zero,.L6
.L8:
	li	a1,4
	mv	a0,s1
	call	luaD_throw
	.size	luaM_realloc_, .-luaM_realloc_
	.section	.rodata.luaM_growaux_.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"too many %s (limit is %d)"
	.globl	__mulsi3
	.section	.text.luaM_growaux_,"ax",@progbits
	.align	2
	.globl	luaM_growaux_
	.hidden	luaM_growaux_
	.type	luaM_growaux_, @function
luaM_growaux_:
	srli	t1,a4,31
	lw	t2,0(a2)
	addi	sp,sp,-36
	add	t1,t1,a4
	sw	s0,28(sp)
	sw	s1,24(sp)
	sw	ra,32(sp)
	srai	t1,t1,1
	sw	a1,0(sp)
	mv	s0,a4
	mv	s1,a2
	mv	t0,a0
	mv	a4,a3
	blt	t2,t1,.L19
	bge	t2,s0,.L31
.L20:
	addi	a0,s0,1
	srli	a3,a0,16
	srli	a5,a4,16
	bne	a3,zero,.L24
.L32:
	mv	a3,a0
	bne	a5,zero,.L26
.L29:
	mv	a1,a4
	mv	a0,s0
	sw	t0,16(sp)
	sw	t2,12(sp)
	sw	a4,8(sp)
	call	__mulsi3
	lw	a4,8(sp)
	lw	t2,12(sp)
	sw	a0,4(sp)
	mv	a1,a4
	mv	a0,t2
	call	__mulsi3
	lw	t0,16(sp)
	lw	a3,4(sp)
	lw	a1,0(sp)
	mv	a2,a0
	mv	a0,t0
	call	luaM_realloc_
	lw	ra,32(sp)
	sw	s0,0(s1)
	lw	s0,28(sp)
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
.L19:
	slli	s0,t2,1
	li	a5,4
	bge	s0,a5,.L20
	li	s0,4
	addi	a0,s0,1
	srli	a3,a0,16
	srli	a5,a4,16
	beq	a3,zero,.L32
.L24:
	bne	a5,zero,.L28
	mv	a5,a3
	mv	a3,a4
.L26:
	slli	a1,a4,16
	slli	a0,a0,16
	srli	a1,a1,16
	srli	a0,a0,16
	sw	t0,16(sp)
	sw	t2,12(sp)
	sw	a4,8(sp)
	sh	a3,22(sp)
	sh	a5,20(sp)
	call	__mulsi3
	lhu	a5,20(sp)
	lhu	a3,22(sp)
	sw	a0,4(sp)
	slli	a1,a5,16
	slli	a0,a3,16
	srli	a1,a1,16
	srli	a0,a0,16
	call	__mulsi3
	lw	a2,4(sp)
	lw	a4,8(sp)
	lw	t2,12(sp)
	srli	a2,a2,16
	add	a0,a0,a2
	srli	a0,a0,16
	lw	t0,16(sp)
	beq	a0,zero,.L29
.L28:
	mv	a0,t0
	call	luaM_toobig
.L31:
	mv	a3,s0
	mv	a2,a5
	lla	a1,.LC1
	call	luaG_runerror
	.size	luaM_growaux_, .-luaM_growaux_
	.hidden	luaD_throw
	.hidden	luaC_fullgc
	.hidden	luaG_runerror
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
