#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"map.c"
	.option nopic
	.text
	.section	.text.keyindex.isra.0,"ax",@progbits
	.align	2
	.type	keyindex.isra.0, @function
keyindex.isra.0:
	lw	a3,0(a2)
	addi	sp,sp,-24
	addi	a4,a0,-1
	sw	s0,16(sp)
	and	s0,a3,a4
	slli	a5,s0,1
	add	a5,a5,s0
	slli	a5,a5,2
	add	a5,a1,a5
	lw	a0,4(a5)
	sw	s1,12(sp)
	sw	ra,20(sp)
	mv	t1,a2
	mv	s1,a1
	beq	a0,zero,.L1
.L2:
	lw	a2,0(a5)
	bne	a3,a2,.L4
	lw	a2,8(a5)
	lw	a5,8(t1)
	bne	a2,a5,.L4
	lw	a1,4(t1)
	sw	a4,8(sp)
	sw	a3,4(sp)
	sw	t1,0(sp)
	call	memcmp
	lw	t1,0(sp)
	lw	a3,4(sp)
	lw	a4,8(sp)
	bne	a0,zero,.L4
.L1:
	lw	ra,20(sp)
	mv	a0,s0
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L4:
	addi	s0,s0,1
	and	s0,a4,s0
	slli	a5,s0,1
	add	a5,a5,s0
	slli	a5,a5,2
	add	a5,s1,a5
	lw	a0,4(a5)
	bne	a0,zero,.L2
	lw	ra,20(sp)
	mv	a0,s0
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
	.size	keyindex.isra.0, .-keyindex.isra.0
	.section	.text.mapkey,"ax",@progbits
	.align	2
	.globl	mapkey
	.hidden	mapkey
	.type	mapkey, @function
mapkey:
	li	a4,-2128830464
	sw	a1,4(a0)
	sw	a2,8(a0)
	add	a3,a1,a2
	addi	a4,a4,-571
	beq	a1,a3,.L14
.L15:
	lbu	a5,0(a1)
	addi	a1,a1,1
	xor	a4,a5,a4
	slli	a5,a4,15
	add	a5,a5,a4
	slli	a5,a5,2
	sub	a5,a5,a4
	slli	a5,a5,3
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	sub	a4,a5,a4
	bne	a3,a1,.L15
.L14:
	sw	a4,0(a0)
	ret
	.size	mapkey, .-mapkey
	.section	.rodata.mapinit.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `!(cap & cap - 1)' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/map.c:27  \n"
	.section	.text.mapinit,"ax",@progbits
	.align	2
	.globl	mapinit
	.hidden	mapinit
	.type	mapinit, @function
mapinit:
	addi	sp,sp,-12
	addi	a5,a1,-1
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	and	a5,a5,a1
	bne	a5,zero,.L33
	mv	s1,a0
	sw	a1,4(a0)
	li	a2,12
	sw	zero,0(a0)
	li	a0,0
	mv	s0,a1
	call	xreallocarray
	sw	a0,8(s1)
	li	a2,4
	mv	a1,s0
	li	a0,0
	call	xreallocarray
	sw	a0,12(s1)
	beq	s0,zero,.L18
	lw	a5,8(s1)
	slli	a4,s0,1
	add	a4,a4,s0
	slli	a4,a4,2
	add	a4,a4,a5
.L24:
	sw	zero,4(a5)
	addi	a5,a5,12
	bne	a4,a5,.L24
.L18:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L33:
	lla	s0,.LC0
	li	a0,65
.L20:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L20
	lla	s0,.LC1
	li	a0,65
.L21:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L21
	lla	s0,.LC2
	li	a0,32
.L22:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L22
	li	a0,1
	call	halt
	.size	mapinit, .-mapinit
	.section	.text.mapfree,"ax",@progbits
	.align	2
	.globl	mapfree
	.hidden	mapfree
	.type	mapfree, @function
mapfree:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	sw	a1,0(sp)
	mv	s0,a0
	lw	a0,8(a0)
	beq	a1,zero,.L35
	lw	a3,4(s0)
	beq	a3,zero,.L35
	li	s1,0
.L37:
	slli	a5,s1,1
	add	a5,a5,s1
	slli	a5,a5,2
	add	a5,a0,a5
	lw	a5,4(a5)
	slli	a2,s1,2
	addi	s1,s1,1
	beq	a5,zero,.L36
	lw	a5,12(s0)
	add	a5,a5,a2
	lw	a0,0(a5)
	lw	a5,0(sp)
	jalr	a5
	lw	a3,4(s0)
	lw	a0,8(s0)
.L36:
	bgtu	a3,s1,.L37
.L35:
	call	free
	lw	a0,12(s0)
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	free
	.size	mapfree, .-mapfree
	.section	.text.mapput,"ax",@progbits
	.align	2
	.globl	mapput
	.hidden	mapput
	.type	mapput, @function
mapput:
	lw	t1,4(a0)
	lw	a5,0(a0)
	addi	sp,sp,-40
	sw	s0,32(sp)
	sw	ra,36(sp)
	sw	s1,28(sp)
	srli	a3,t1,1
	sw	a1,16(sp)
	mv	s0,a0
	bltu	a3,a5,.L68
.L50:
	lw	s1,8(s0)
	lw	a2,16(sp)
	mv	a0,t1
	mv	a1,s1
	call	keyindex.isra.0
	slli	a5,a0,1
	add	a5,a5,a0
	slli	a5,a5,2
	add	s1,s1,a5
	lw	a5,4(s1)
	beq	a5,zero,.L58
	lw	a5,12(s0)
	lw	ra,36(sp)
	lw	s0,32(sp)
	slli	a0,a0,2
	lw	s1,28(sp)
	add	a0,a5,a0
	addi	sp,sp,40
	jr	ra
.L68:
	lw	a5,8(s0)
	slli	a1,t1,1
	sw	a1,4(a0)
	sw	a5,24(sp)
	lw	a5,12(s0)
	li	a2,12
	li	a0,0
	sw	t1,0(sp)
	sw	a5,20(sp)
	call	xreallocarray
	lw	a1,4(s0)
	sw	a0,8(s0)
	li	a2,4
	li	a0,0
	call	xreallocarray
	lw	a2,4(s0)
	sw	a0,12(s0)
	lw	t1,0(sp)
	beq	a2,zero,.L55
	lw	a5,8(s0)
	slli	a3,a2,1
	add	a3,a3,a2
	slli	a3,a3,2
	add	a3,a3,a5
.L54:
	sw	zero,4(a5)
	addi	a5,a5,12
	bne	a5,a3,.L54
.L55:
	lw	a5,24(sp)
	lw	t0,20(sp)
	li	s1,0
	beq	t1,zero,.L53
	mv	a4,s0
	mv	s0,s1
	mv	s1,a5
.L57:
	lw	a5,4(s1)
	mv	a2,s1
	addi	s0,s0,1
	beq	a5,zero,.L56
	lw	a1,8(a4)
	lw	a0,4(a4)
	sw	t0,12(sp)
	sw	t1,8(sp)
	sw	a4,4(sp)
	sw	a1,0(sp)
	call	keyindex.isra.0
	slli	a5,a0,1
	lw	a1,0(sp)
	lw	a3,0(s1)
	add	a5,a5,a0
	slli	a5,a5,2
	add	a1,a1,a5
	sw	a3,0(a1)
	lw	a3,4(s1)
	lw	a4,4(sp)
	lw	t0,12(sp)
	slli	a0,a0,2
	lw	a5,12(a4)
	sw	a3,4(a1)
	lw	a3,8(s1)
	lw	t1,8(sp)
	add	a5,a5,a0
	sw	a3,8(a1)
	lw	a3,0(t0)
	sw	a3,0(a5)
.L56:
	addi	s1,s1,12
	addi	t0,t0,4
	bne	t1,s0,.L57
	mv	s0,a4
.L53:
	lw	a0,24(sp)
	call	free
	lw	a0,20(sp)
	call	free
	lw	t1,4(s0)
	j	.L50
.L58:
	lw	a4,16(sp)
	lw	a5,0(s0)
	lw	a3,12(s0)
	lw	a2,0(a4)
	slli	a0,a0,2
	add	a3,a3,a0
	sw	a2,0(s1)
	lw	a2,4(a4)
	addi	a5,a5,1
	lw	ra,36(sp)
	sw	a2,4(s1)
	lw	a2,8(a4)
	sw	a2,8(s1)
	sw	zero,0(a3)
	sw	a5,0(s0)
	lw	a5,12(s0)
	lw	s0,32(sp)
	lw	s1,28(sp)
	add	a0,a5,a0
	addi	sp,sp,40
	jr	ra
	.size	mapput, .-mapput
	.section	.text.mapget,"ax",@progbits
	.align	2
	.globl	mapget
	.hidden	mapget
	.type	mapget, @function
mapget:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lw	s1,8(a0)
	sw	s0,4(sp)
	mv	s0,a0
	lw	a0,4(a0)
	mv	a2,a1
	mv	a1,s1
	sw	ra,8(sp)
	call	keyindex.isra.0
	slli	a4,a0,1
	add	a4,a4,a0
	slli	a4,a4,2
	add	s1,s1,a4
	mv	a5,a0
	lw	a0,4(s1)
	beq	a0,zero,.L69
	lw	a4,12(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a0,0(a5)
.L69:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	mapget, .-mapget
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
