#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ad_partition.c"
	.option nopic
	.text
	.section	.rodata.create_partition.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Error: Unable to allocate memory for tparts.\n"
	.globl	__mulsi3
	.align	2
.LC1:
	.string	"\nError: Too small part size.\n"
	.globl	__divsi3
	.align	2
.LC2:
	.string	"\nError: Cannot adjust part sizes.\n"
	.section	.text.create_partition,"ax",@progbits
	.align	2
	.globl	create_partition
	.hidden	create_partition
	.type	create_partition, @function
create_partition:
	addi	sp,sp,-44
	sw	s1,32(sp)
	sw	ra,40(sp)
	sw	s0,36(sp)
	sw	a1,24(sp)
	sw	a0,12(sp)
	sw	a3,28(sp)
	sw	a4,8(sp)
	sw	a5,0(sp)
	lw	t1,44(sp)
	mv	s1,a2
	ble	a1,zero,.L6
	lw	a3,24(sp)
	lw	a5,52(sp)
	slli	a4,a3,2
	lw	a5,4(a5)
	add	a4,a4,a3
	slli	a4,a4,2
	add	a4,a4,a5
.L5:
	sw	a3,16(a5)
	sw	zero,12(a5)
	sw	zero,0(a5)
	addi	a5,a5,20
	bne	a4,a5,.L5
.L6:
	lw	a0,24(sp)
	li	a1,4
	sw	t1,44(sp)
	call	calloc
	lw	t1,44(sp)
	mv	s0,a0
	beq	a0,zero,.L45
.L4:
	lw	a5,12(sp)
	ble	a5,zero,.L19
	lw	a2,24(sp)
	lw	a4,52(sp)
	lw	a3,0(sp)
	slli	a5,a2,2
	add	a5,a5,a2
	slli	a5,a5,2
	lw	a4,4(a4)
	lw	t0,52(sp)
	addi	a5,a5,12
	sw	s1,20(sp)
	li	t2,0
	mv	s1,a3
	sw	a5,16(sp)
	mv	a3,s0
	mv	s0,a2
.L18:
	li	a5,1
	lw	ra,12(a4)
	ble	s0,a5,.L10
	lw	a1,16(sp)
	addi	a2,a4,32
	mv	a5,a2
	add	a4,a4,a1
	mv	a0,ra
.L12:
	lw	a1,0(a5)
	addi	a5,a5,20
	ble	a0,a1,.L11
	mv	a0,a1
.L11:
	bne	a4,a5,.L12
.L13:
	li	a5,0
	li	a1,-1
.L16:
	bne	a0,ra,.L15
	addi	a1,a1,1
	slli	a4,a1,2
	add	a4,a3,a4
	sw	a5,0(a4)
.L15:
	addi	a5,a5,1
	ble	s0,a5,.L14
	lw	ra,0(a2)
	addi	a2,a2,20
	j	.L16
.L10:
	li	a1,-1
	beq	s0,a5,.L46
.L14:
	li	a0,0
	sw	t0,52(sp)
	sw	t1,44(sp)
	sw	a3,4(sp)
	sw	t2,0(sp)
	call	irandom
	lw	a3,4(sp)
	slli	a0,a0,2
	lw	t0,52(sp)
	add	a0,a3,a0
	lw	a1,0(a0)
	lw	t2,0(sp)
	lw	a0,0(t0)
	lw	a4,4(t0)
	slli	ra,a1,2
	add	a5,ra,a1
	slli	a2,t2,2
	add	a2,a0,a2
	slli	a5,a5,2
	sw	a1,0(a2)
	add	a5,a4,a5
	lw	t1,12(a5)
	lw	a1,8(s1)
	lw	a2,0(a5)
	li	a0,0
	add	a1,t1,a1
	addi	a2,a2,1
	sw	a2,0(a5)
	sw	a1,12(a5)
	lw	a1,12(s1)
	lw	a2,48(sp)
	lw	a5,0(s1)
	slli	a1,a1,2
	lw	t1,44(sp)
	add	a1,a2,a1
	ble	a5,zero,.L21
.L20:
	lw	a5,0(a1)
	addi	a0,a0,1
	addi	a1,a1,4
	slli	a5,a5,4
	add	a5,t1,a5
	lw	a5,12(a5)
	add	a5,a5,ra
	lw	a2,0(a5)
	addi	a2,a2,1
	sw	a2,0(a5)
	lw	a5,0(s1)
	bgt	a5,a0,.L20
.L21:
	lw	a5,12(sp)
	addi	t2,t2,1
	addi	s1,s1,16
	bne	a5,t2,.L18
	lw	s1,20(sp)
	mv	s0,a3
.L19:
	mv	a0,s0
	call	free
	lw	a5,8(sp)
	li	a3,-1
	sw	a3,20(sp)
	lw	a4,0(a5)
	li	a5,20
	bgt	a4,a5,.L1
.L8:
	lw	a5,24(sp)
	ble	a5,zero,.L1
	lw	a5,52(sp)
	sw	zero,4(sp)
	lw	a5,4(a5)
	sw	a5,16(sp)
	j	.L24
.L22:
	lw	a5,8(sp)
	mv	a0,s1
	lw	a1,0(a5)
	call	__mulsi3
	li	a1,20
	call	__divsi3
	mv	a1,s0
	add	a0,a0,s1
	call	__divsi3
	lw	a3,0(sp)
	lw	a5,8(sp)
	addi	a4,a0,1
	sw	a4,4(a3)
	lw	a1,0(a5)
	mv	a0,s1
	sw	a4,12(sp)
	call	__mulsi3
	li	a1,-20
	call	__divsi3
	mv	a1,s0
	add	a0,a0,s1
	call	__divsi3
	lw	a3,0(sp)
	addi	a0,a0,-1
	lw	a5,4(sp)
	sw	a0,8(a3)
	lw	a4,12(sp)
	lw	a3,20(sp)
	addi	a5,a5,1
	bge	a3,a4,.L23
	sw	a4,20(sp)
.L23:
	lw	a4,24(sp)
	beq	a4,a5,.L47
	sw	a5,4(sp)
.L24:
	lw	a5,4(sp)
	lw	a4,16(sp)
	lw	a1,28(sp)
	slli	s0,a5,2
	add	s0,s0,a5
	slli	a5,s0,2
	sw	a5,12(sp)
	add	a5,a4,a5
	lw	s0,16(a5)
	sw	a5,0(sp)
	mv	a0,s0
	call	__mulsi3
	ble	a0,s1,.L22
	lla	a0,.LC1
	call	printf
	li	a0,1
	call	bench_exit
	lw	a5,52(sp)
	lw	a4,12(sp)
	lw	a5,4(a5)
	sw	a5,16(sp)
	add	a5,a5,a4
	lw	s0,16(a5)
	sw	a5,0(sp)
	j	.L22
.L47:
	lw	a5,16(sp)
	lw	a0,4(sp)
	li	a4,0
	addi	a5,a5,4
.L27:
	lw	a2,0(a5)
	lw	a3,8(a5)
	addi	a1,a4,1
	addi	a5,a5,20
	bge	a2,a3,.L25
	lw	a4,8(sp)
	li	s0,20
	lw	a5,0(a4)
	addi	a5,a5,1
	sw	a5,0(a4)
	ble	a5,s0,.L8
	lla	a0,.LC2
	call	printf
	li	a0,1
	call	bench_exit
	lw	a5,8(sp)
	lw	a5,0(a5)
	ble	a5,s0,.L8
.L1:
	lw	ra,40(sp)
	lw	s0,36(sp)
	lw	a0,20(sp)
	lw	s1,32(sp)
	addi	sp,sp,44
	jr	ra
.L25:
	beq	a0,a4,.L1
	mv	a4,a1
	j	.L27
.L45:
	lla	a0,.LC0
	sw	t1,44(sp)
	call	printf
	li	a0,1
	call	bench_exit
	lw	t1,44(sp)
	j	.L4
.L46:
	mv	a0,ra
	addi	a2,a4,32
	j	.L13
	.size	create_partition, .-create_partition
	.section	.text.copy_partition,"ax",@progbits
	.align	2
	.globl	copy_partition
	.hidden	copy_partition
	.type	copy_partition, @function
copy_partition:
	ble	a0,zero,.L48
	lw	a5,4(a2)
	slli	a0,a0,4
	add	a3,a1,a0
.L50:
	lw	a4,0(a5)
	addi	a5,a5,20
	addi	a1,a1,16
	sw	a4,-16(a1)
	lw	a4,-12(a5)
	sw	a4,-8(a1)
	lw	a4,-8(a5)
	sw	a4,-4(a1)
	lw	a4,-16(a5)
	sw	a4,-12(a1)
	bne	a1,a3,.L50
.L48:
	ret
	.size	copy_partition, .-copy_partition
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
