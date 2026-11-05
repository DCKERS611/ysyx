#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"core_util.c"
	.option nopic
	.text
	.section	.text.get_seed_32,"ax",@progbits
	.align	2
	.globl	get_seed_32
	.hidden	get_seed_32
	.type	get_seed_32, @function
get_seed_32:
	li	a5,5
	bgtu	a0,a5,.L9
	lla	a4,.L4
	slli	a0,a0,2
	add	a0,a0,a4
	lw	a5,0(a0)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.get_seed_32,"a",@progbits
	.align	2
	.align	2
.L4:
	.word	.L9-.L4
	.word	.L8-.L4
	.word	.L7-.L4
	.word	.L6-.L4
	.word	.L5-.L4
	.word	.L3-.L4
	.section	.text.get_seed_32
.L3:
	la a0, seed5_volatile; lw a0, 0(a0);
	ret
.L8:
	la a0, seed1_volatile; lw a0, 0(a0);
	ret
.L7:
	la a0, seed2_volatile; lw a0, 0(a0);
	ret
.L6:
	la a0, seed3_volatile; lw a0, 0(a0);
	ret
.L5:
	la a0, seed4_volatile; lw a0, 0(a0);
	ret
.L9:
	li	a0,0
	ret
	.size	get_seed_32, .-get_seed_32
	.section	.text.crcu8,"ax",@progbits
	.align	2
	.globl	crcu8
	.hidden	crcu8
	.type	crcu8, @function
crcu8:
	mv	a3,a0
	mv	a0,a1
	li	a1,-24576
	li	a5,8
	addi	a1,a1,1
.L13:
	xor	a4,a3,a0
	addi	a5,a5,-1
	srli	a0,a0,1
	andi	a4,a4,1
	andi	a5,a5,0xff
	xor	a2,a0,a1
	srli	a3,a3,1
	beq	a4,zero,.L12
	slli	a0,a2,16
	srli	a0,a0,16
.L12:
	bne	a5,zero,.L13
	ret
	.size	crcu8, .-crcu8
	.section	.text.crcu16,"ax",@progbits
	.align	2
	.globl	crcu16
	.hidden	crcu16
	.type	crcu16, @function
crcu16:
	mv	a3,a0
	li	t1,-24576
	mv	a0,a1
	andi	a2,a3,0xff
	li	a5,8
	addi	t1,t1,1
.L20:
	xor	a4,a2,a0
	addi	a5,a5,-1
	srli	a0,a0,1
	andi	a4,a4,1
	andi	a5,a5,0xff
	xor	a1,a0,t1
	srli	a2,a2,1
	beq	a4,zero,.L19
	slli	a0,a1,16
	srli	a0,a0,16
.L19:
	bne	a5,zero,.L20
	li	a1,-24576
	srli	a3,a3,8
	li	a5,8
	addi	a1,a1,1
.L22:
	xor	a4,a3,a0
	addi	a5,a5,-1
	srli	a0,a0,1
	andi	a4,a4,1
	andi	a5,a5,0xff
	xor	a2,a0,a1
	srli	a3,a3,1
	beq	a4,zero,.L21
	slli	a0,a2,16
	srli	a0,a0,16
.L21:
	bne	a5,zero,.L22
	ret
	.size	crcu16, .-crcu16
	.section	.text.crcu32,"ax",@progbits
	.align	2
	.globl	crcu32
	.hidden	crcu32
	.type	crcu32, @function
crcu32:
	mv	a4,a0
	slli	a2,a4,16
	li	t0,-24576
	mv	a0,a1
	srli	a2,a2,16
	andi	a1,a4,0xff
	li	a5,8
	addi	t0,t0,1
.L33:
	xor	a3,a1,a0
	addi	a5,a5,-1
	srli	a0,a0,1
	andi	a3,a3,1
	andi	a5,a5,0xff
	xor	t1,a0,t0
	srli	a1,a1,1
	beq	a3,zero,.L32
	slli	a0,t1,16
	srli	a0,a0,16
.L32:
	bne	a5,zero,.L33
	li	t1,-24576
	srli	a2,a2,8
	li	a5,8
	addi	t1,t1,1
.L35:
	xor	a3,a2,a0
	addi	a5,a5,-1
	srli	a0,a0,1
	andi	a3,a3,1
	andi	a5,a5,0xff
	xor	a1,a0,t1
	srli	a2,a2,1
	beq	a3,zero,.L34
	slli	a0,a1,16
	srli	a0,a0,16
.L34:
	bne	a5,zero,.L35
	srli	a2,a4,16
	li	t1,-24576
	mv	a4,a2
	li	a5,8
	andi	a2,a2,0xff
	addi	t1,t1,1
.L37:
	xor	a3,a2,a0
	addi	a5,a5,-1
	srli	a0,a0,1
	andi	a3,a3,1
	andi	a5,a5,0xff
	xor	a1,a0,t1
	srli	a2,a2,1
	beq	a3,zero,.L36
	slli	a0,a1,16
	srli	a0,a0,16
.L36:
	bne	a5,zero,.L37
	li	a1,-24576
	srli	a4,a4,8
	li	a5,8
	addi	a1,a1,1
.L39:
	xor	a3,a4,a0
	addi	a5,a5,-1
	srli	a0,a0,1
	andi	a3,a3,1
	andi	a5,a5,0xff
	xor	a2,a0,a1
	srli	a4,a4,1
	beq	a3,zero,.L38
	slli	a0,a2,16
	srli	a0,a0,16
.L38:
	bne	a5,zero,.L39
	ret
	.size	crcu32, .-crcu32
	.section	.text.crc16,"ax",@progbits
	.align	2
	.globl	crc16
	.hidden	crc16
	.type	crc16, @function
crc16:
	mv	a3,a0
	slli	a2,a3,16
	li	t1,-24576
	mv	a0,a1
	srli	a2,a2,16
	andi	a3,a3,0xff
	li	a5,8
	addi	t1,t1,1
.L58:
	xor	a4,a3,a0
	addi	a5,a5,-1
	srli	a0,a0,1
	andi	a4,a4,1
	andi	a5,a5,0xff
	xor	a1,a0,t1
	srli	a3,a3,1
	beq	a4,zero,.L57
	slli	a0,a1,16
	srli	a0,a0,16
.L57:
	bne	a5,zero,.L58
	li	a1,-24576
	srli	a3,a2,8
	li	a5,8
	addi	a1,a1,1
.L60:
	xor	a4,a3,a0
	addi	a5,a5,-1
	srli	a0,a0,1
	andi	a4,a4,1
	andi	a5,a5,0xff
	xor	a2,a0,a1
	srli	a3,a3,1
	beq	a4,zero,.L59
	slli	a0,a2,16
	srli	a0,a0,16
.L59:
	bne	a5,zero,.L60
	ret
	.size	crc16, .-crc16
	.section	.text.check_data_types,"ax",@progbits
	.align	2
	.globl	check_data_types
	.hidden	check_data_types
	.type	check_data_types, @function
check_data_types:
	li	a0,0
	ret
	.size	check_data_types, .-check_data_types
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
