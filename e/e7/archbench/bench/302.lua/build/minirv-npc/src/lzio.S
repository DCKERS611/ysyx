#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lzio.c"
	.option nopic
	.text
	.section	.text.luaZ_fill,"ax",@progbits
	.align	2
	.globl	luaZ_fill
	.hidden	luaZ_fill
	.type	luaZ_fill, @function
luaZ_fill:
	addi	sp,sp,-16
	sw	s0,8(sp)
	lw	a5,8(a0)
	lw	a1,12(a0)
	mv	s0,a0
	lw	a0,16(a0)
	sw	ra,12(sp)
	mv	a2,sp
	jalr	a5
	beq	a0,zero,.L4
	lw	a5,0(sp)
	beq	a5,zero,.L4
	addi	a4,a0,1
	addi	a5,a5,-1
	sw	a5,0(s0)
	sw	a4,4(s0)
	lbu	a0,0(a0)
.L1:
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L4:
	li	a0,-1
	j	.L1
	.size	luaZ_fill, .-luaZ_fill
	.section	.text.luaZ_init,"ax",@progbits
	.align	2
	.globl	luaZ_init
	.hidden	luaZ_init
	.type	luaZ_init, @function
luaZ_init:
	sw	a0,16(a1)
	sw	a2,8(a1)
	sw	a3,12(a1)
	sw	zero,0(a1)
	sw	zero,4(a1)
	ret
	.size	luaZ_init, .-luaZ_init
	.section	.text.luaZ_read,"ax",@progbits
	.align	2
	.globl	luaZ_read
	.hidden	luaZ_read
	.type	luaZ_read, @function
luaZ_read:
	beq	a2,zero,.L21
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	lw	a5,0(a0)
	sw	ra,16(sp)
	mv	s0,a2
	mv	s1,a0
	mv	t1,a1
	j	.L14
.L23:
	lw	a1,4(s1)
.L12:
	mv	a0,t1
	mv	a2,a5
	bleu	a5,s0,.L13
	mv	a2,s0
.L13:
	sw	t1,4(sp)
	sw	a2,0(sp)
	call	memcpy
	lw	a2,0(sp)
	lw	a5,0(s1)
	lw	a3,4(s1)
	lw	t1,4(sp)
	sub	a5,a5,a2
	add	a3,a3,a2
	sub	s0,s0,a2
	sw	a5,0(s1)
	sw	a3,4(s1)
	add	t1,t1,a2
	beq	s0,zero,.L22
.L14:
	mv	a0,s1
	bne	a5,zero,.L23
	sw	t1,0(sp)
	call	luaZ_fill
	li	a5,-1
	beq	a0,a5,.L16
	lw	a5,0(s1)
	lw	a1,4(s1)
	lw	t1,0(sp)
	addi	a5,a5,1
	addi	a1,a1,-1
	sw	a5,0(s1)
	sw	a1,4(s1)
	j	.L12
.L22:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	li	a0,0
	addi	sp,sp,20
	jr	ra
.L16:
	lw	ra,16(sp)
	mv	a0,s0
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L21:
	li	a0,0
	ret
	.size	luaZ_read, .-luaZ_read
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
