#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"bf.c"
	.option nopic
	.text
	.section	.rodata.bench_bf_prepare.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	">>+>>>>>,[>+>>,]>+[--[+<<<-]<[<+>-]<[<[->[<<<+>>>>+<-]<<[>>+>[->]<<[<]<-]>]>>>+<[[-]<[>+<-]<]>[[>>>]+<<<-<[<<[<<<]>>+>[>>>]<-]<<[<<<]>[>>[>>>]<+<<[<<<]>-]]+<<<]+[->>>]>>]>>[.>>>]"
	.globl	__umodsi3
	.align	2
.LC1:
	.string	"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	.section	.text.bench_bf_prepare,"ax",@progbits
	.align	2
	.globl	bench_bf_prepare
	.hidden	bench_bf_prepare
	.type	bench_bf_prepare, @function
bench_bf_prepare:
	la a5, setting; lw a5, 0(a5);
	lw	a5,0(a5)
	addi	sp,sp,-16
	sw	s0,8(sp)
	li	a0,16384
	lla	s0,.LANCHOR0
	sw	ra,12(sp)
	sw	a5,0(s0)
	sw	s1,4(sp)
	la a5, .LANCHOR1; sw zero, 0(a5);
	call	bench_alloc
	mv	a5,a0
	li	a0,1024
	la a4, .LANCHOR2; sw a5, 0(a4);
	call	bench_alloc
	mv	a5,a0
	li	a0,8192
	la a4, .LANCHOR3; sw a5, 0(a4);
	call	bench_alloc
	lw	a5,0(s0)
	la a4, .LANCHOR4; sw a0, 0(a4);
	addi	a0,a5,1
	lla	a5,.LC0
	la a4, .LANCHOR5; sw a5, 0(a4);
	call	bench_alloc
	mv	a5,a0
	lla	a4,.LANCHOR6
	li	a0,4096
	sw	a5,0(a4)
	call	bench_alloc
	mv	a5,a0
	li	a0,1
	la a4, .LANCHOR7; sw a5, 0(a4);
	la a5, .LANCHOR8; sw zero, 0(a5);
	call	bench_srand
	lw	a5,0(s0)
	ble	a5,zero,.L1
	li	s1,0
.L3:
	call	bench_rand
	lla	a5,.LANCHOR6
	lw	a4,0(a5)
	li	a1,62
	add	a4,a4,s1
	sw	a4,0(sp)
	call	__umodsi3
	lla	a5,.LC1
	add	a0,a5,a0
	lbu	a1,0(a0)
	lw	a4,0(sp)
	lw	a3,0(s0)
	addi	s1,s1,1
	sb	a1,0(a4)
	bgt	a3,s1,.L3
.L1:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	bench_bf_prepare, .-bench_bf_prepare
	.section	.text.bench_bf_run,"ax",@progbits
	.align	2
	.globl	bench_bf_run
	.hidden	bench_bf_run
	.type	bench_bf_run, @function
bench_bf_run:
	lla	a5,.LANCHOR5
	lw	a3,0(a5)
	addi	sp,sp,-20
	lla	a5,.LANCHOR1
	lw	t2,0(a5)
	sw	s0,16(sp)
	sw	s1,12(sp)
	lbu	a5,0(a3)
	sw	t2,8(sp)
	la a2, .LANCHOR2; lw a2, 0(a2);
	beq	a5,zero,.L8
	la a4, .LANCHOR3; lw a4, 0(a4);
	li	s1,0
	sw	a4,4(sp)
	addi	a3,a3,1
	li	t1,0
	li	a4,0
	li	a0,50
	lla	a1,.L16
	li	s0,4096
	sw	s1,0(sp)
.L9:
	addi	a5,a5,-43
	andi	a5,a5,0xff
	bgtu	a5,a0,.L14
	slli	a5,a5,2
	add	a5,a5,a1
	lw	a5,0(a5)
	add	a5,a5,a1
	jr	a5
	.section	.rodata.bench_bf_run,"a",@progbits
	.align	2
	.align	2
.L16:
	.word	.L23-.L16
	.word	.L22-.L16
	.word	.L21-.L16
	.word	.L20-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L19-.L16
	.word	.L14-.L16
	.word	.L18-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L14-.L16
	.word	.L17-.L16
	.word	.L14-.L16
	.word	.L15-.L16
	.section	.text.bench_bf_run
.L14:
	lbu	a5,0(a3)
	mv	t0,a3
	beq	a5,zero,.L107
.L12:
	addi	a3,a3,1
	li	t1,1
	j	.L9
.L15:
	beq	t2,zero,.L27
	lw	t1,4(sp)
	addi	t2,t2,-1
	slli	a5,t2,1
	add	a5,t1,a5
	lhu	t1,0(a5)
	slli	a5,a4,2
	add	a5,a2,a5
	slli	t0,t1,2
	li	s1,8
	sh	t1,2(a5)
	sh	s1,0(a5)
	add	a5,a2,t0
	sh	a4,2(a5)
	li	a5,1
	sw	a5,0(sp)
.L24:
	lbu	a5,0(a3)
	addi	a4,a4,1
	slli	a4,a4,16
	srli	a4,a4,16
	mv	t0,a3
	beq	a5,zero,.L107
.L30:
	bne	a4,s0,.L12
	lw	s1,0(sp)
	lla	a5,.LANCHOR5
	sw	a3,0(a5)
	beq	s1,zero,.L11
	lla	a5,.LANCHOR1
	sw	t2,0(a5)
.L11:
	lhu	a5,0(a2)
	beq	a5,zero,.L7
.L34:
	lla	a4,.LANCHOR6
	lw	t2,0(a4)
	lla	a4,.LANCHOR8
	lw	s0,0(a4)
	la a4, .LANCHOR7; lw a4, 0(a4);
	sw	a4,8(sp)
	la t0, .LANCHOR4; lw t0, 0(t0);
	mv	a4,a2
	sw	zero,0(sp)
	sw	zero,4(sp)
	li	a3,0
	li	a0,0
	li	t1,8
	lla	a1,.L40
.L54:
	bgtu	a5,t1,.L111
	slli	a5,a5,2
	add	a5,a5,a1
	lw	a5,0(a5)
	add	a5,a5,a1
	jr	a5
	.section	.rodata.bench_bf_run
	.align	2
	.align	2
.L40:
	.word	.L111-.L40
	.word	.L47-.L40
	.word	.L46-.L40
	.word	.L45-.L40
	.word	.L44-.L40
	.word	.L43-.L40
	.word	.L42-.L40
	.word	.L41-.L40
	.word	.L39-.L40
	.section	.text.bench_bf_run
.L17:
	slli	a5,a4,2
	add	a5,a2,a5
	li	s1,7
	sh	s1,0(a5)
	li	a5,512
	beq	t2,a5,.L112
	lw	t1,4(sp)
	slli	a5,t2,1
	mv	t0,a3
	add	a5,t1,a5
	sh	a4,0(a5)
	li	a5,1
	sw	a5,0(sp)
	lbu	a5,0(a3)
	addi	a4,a4,1
	slli	a4,a4,16
	addi	t2,t2,1
	srli	a4,a4,16
	bne	a5,zero,.L30
.L107:
	lw	s1,0(sp)
	lla	a5,.LANCHOR5
	sw	a3,0(a5)
	beq	s1,zero,.L29
	lla	a5,.LANCHOR1
	sw	t2,0(a5)
	sw	t2,8(sp)
.L29:
	lw	a5,8(sp)
	bne	a5,zero,.L11
	li	a5,4096
	beq	a4,a5,.L11
	slli	a4,a4,2
	add	a4,a2,a4
.L10:
	sh	zero,0(a4)
	lhu	a5,0(a2)
	bne	a5,zero,.L34
	j	.L7
.L18:
	slli	a5,a4,2
	add	a5,a2,a5
	li	t1,1
	sh	t1,0(a5)
	j	.L24
.L19:
	slli	a5,a4,2
	add	a5,a2,a5
	li	t1,2
	sh	t1,0(a5)
	j	.L24
.L20:
	slli	a5,a4,2
	add	a5,a2,a5
	li	t1,5
	sh	t1,0(a5)
	j	.L24
.L21:
	slli	a5,a4,2
	add	a5,a2,a5
	li	t1,4
	sh	t1,0(a5)
	j	.L24
.L22:
	slli	a5,a4,2
	add	a5,a2,a5
	li	t1,6
	sh	t1,0(a5)
	j	.L24
.L23:
	slli	a5,a4,2
	add	a5,a2,a5
	li	t1,3
	sh	t1,0(a5)
	j	.L24
.L39:
	slli	a5,a0,1
	add	a5,t0,a5
	lhu	a5,0(a5)
	beq	a5,zero,.L50
	lhu	a3,2(a4)
.L113:
	addi	a3,a3,1
	slli	a4,a3,2
	add	a4,a2,a4
	lhu	a5,0(a4)
	bne	a5,zero,.L54
.L111:
	lw	a5,0(sp)
	beq	a5,zero,.L55
	lla	a5,.LANCHOR6
	sw	t2,0(a5)
.L55:
	lw	a5,4(sp)
	beq	a5,zero,.L7
	lla	a5,.LANCHOR8
	sw	s0,0(a5)
.L7:
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,20
	jr	ra
.L41:
	slli	a5,a0,1
	add	a5,t0,a5
	lhu	a5,0(a5)
	bne	a5,zero,.L50
	lhu	a3,2(a4)
	j	.L113
.L42:
	lbu	a4,0(t2)
	slli	a5,a0,1
	add	a5,t0,a5
	sh	a4,0(a5)
	li	a5,1
	addi	t2,t2,1
	sw	a5,0(sp)
.L50:
	addi	a3,a3,1
	slli	a4,a3,2
	add	a4,a2,a4
	lhu	a5,0(a4)
	bne	a5,zero,.L54
	j	.L111
.L44:
	slli	a5,a0,1
	add	a5,t0,a5
	lhu	a4,0(a5)
	addi	a4,a4,-1
	sh	a4,0(a5)
	j	.L50
.L43:
	slli	a5,a0,1
	add	a5,t0,a5
	lhu	a4,0(a5)
	lw	a5,8(sp)
	li	s1,1
	sw	s1,4(sp)
	add	a5,a5,s0
	sb	a4,0(a5)
	addi	s0,s0,1
	j	.L50
.L45:
	slli	a5,a0,1
	add	a5,t0,a5
	lhu	a4,0(a5)
	addi	a4,a4,1
	sh	a4,0(a5)
	j	.L50
.L46:
	addi	a0,a0,-1
.L49:
	addi	a3,a3,1
	slli	a4,a3,2
	add	a4,a2,a4
	lhu	a5,0(a4)
	beq	a5,zero,.L111
	li	s1,4096
	bltu	a0,s1,.L54
	j	.L111
.L47:
	addi	a0,a0,1
	j	.L49
.L27:
	lw	s1,0(sp)
	beq	t1,zero,.L37
	lla	a5,.LANCHOR5
	sw	t0,0(a5)
.L37:
	beq	s1,zero,.L11
	la a5, .LANCHOR1; sw zero, 0(a5);
	j	.L11
.L112:
	lw	s1,0(sp)
	beq	t1,zero,.L26
	lla	a5,.LANCHOR5
	sw	t0,0(a5)
.L26:
	beq	s1,zero,.L11
	li	a5,512
	lla	a4,.LANCHOR1
	sw	a5,0(a4)
	j	.L11
.L8:
	lw	a5,8(sp)
	mv	a4,a2
	beq	a5,zero,.L10
	j	.L11
	.size	bench_bf_run, .-bench_bf_run
	.section	.text.bench_bf_validate,"ax",@progbits
	.align	2
	.globl	bench_bf_validate
	.hidden	bench_bf_validate
	.type	bench_bf_validate, @function
bench_bf_validate:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR8
	lw	a1,0(s0)
	la a0, .LANCHOR7; lw a0, 0(a0);
	sw	ra,8(sp)
	add	a1,a0,a1
	call	checksum
	lw	a3,0(s0)
	la a5, .LANCHOR0; lw a5, 0(a5);
	beq	a3,a5,.L119
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
.L119:
	la a5, setting; lw a5, 0(a5);
	lw	a5,12(a5)
	lw	ra,8(sp)
	lw	s0,4(sp)
	sub	a0,a5,a0
	seqz	a0,a0
	addi	sp,sp,12
	jr	ra
	.size	bench_bf_validate, .-bench_bf_validate
	.section	.sbss.ARR_SIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	ARR_SIZE, @object
	.size	ARR_SIZE, 4
ARR_SIZE:
	.zero	4
	.section	.sbss.PROGRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	PROGRAM, @object
	.size	PROGRAM, 4
PROGRAM:
	.zero	4
	.section	.sbss.SP,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	SP, @object
	.size	SP, 4
SP:
	.zero	4
	.section	.sbss.STACK,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	STACK, @object
	.size	STACK, 4
STACK:
	.zero	4
	.section	.sbss.code,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	code, @object
	.size	code, 4
code:
	.zero	4
	.section	.sbss.data,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	data, @object
	.size	data, 4
data:
	.zero	4
	.section	.sbss.input,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	input, @object
	.size	input, 4
input:
	.zero	4
	.section	.sbss.noutput,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	noutput, @object
	.size	noutput, 4
noutput:
	.zero	4
	.section	.sbss.output,"aw",@nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	output, @object
	.size	output, 4
output:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
