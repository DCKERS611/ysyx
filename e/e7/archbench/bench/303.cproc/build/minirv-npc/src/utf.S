#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"utf.c"
	.option nopic
	.text
	.section	.rodata.utf8enc.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `0' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/utf.c:28  \n"
	.section	.text.utf8enc,"ax",@progbits
	.align	2
	.globl	utf8enc
	.hidden	utf8enc
	.type	utf8enc, @function
utf8enc:
	li	a5,127
	bleu	a1,a5,.L17
	li	a5,2047
	bleu	a1,a5,.L18
	li	a5,53248
	addi	a5,a5,2047
	bleu	a1,a5,.L5
	li	a5,-57344
	add	a5,a1,a5
	li	a4,8192
	bltu	a5,a4,.L5
	li	a5,-65536
	add	a5,a1,a5
	li	a4,1048576
	bgeu	a5,a4,.L10
	srli	a4,a1,12
	srli	a5,a1,6
	srli	a3,a1,18
	andi	a4,a4,63
	andi	a5,a5,63
	andi	a1,a1,63
	ori	a3,a3,-16
	ori	a4,a4,-128
	ori	a5,a5,-128
	ori	a1,a1,-128
	sb	a3,0(a0)
	sb	a4,1(a0)
	sb	a5,2(a0)
	sb	a1,3(a0)
	li	a0,4
	ret
.L5:
	srli	a5,a1,6
	srli	a4,a1,12
	andi	a5,a5,63
	andi	a1,a1,63
	ori	a4,a4,-32
	ori	a5,a5,-128
	ori	a1,a1,-128
	sb	a4,0(a0)
	sb	a5,1(a0)
	sb	a1,2(a0)
	li	a0,3
	ret
.L17:
	sb	a1,0(a0)
	li	a0,1
	ret
.L18:
	srli	a5,a1,6
	andi	a1,a1,63
	ori	a5,a5,-64
	ori	a1,a1,-128
	sb	a5,0(a0)
	sb	a1,1(a0)
	li	a0,2
	ret
.L10:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L7:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L7
	lla	s0,.LC1
	li	a0,65
.L8:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L8
	lla	s0,.LC2
	li	a0,32
.L9:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L9
	li	a0,1
	call	halt
	.size	utf8enc, .-utf8enc
	.section	.text.utf8dec,"ax",@progbits
	.align	2
	.globl	utf8dec
	.hidden	utf8dec
	.type	utf8dec, @function
utf8dec:
	lbu	a4,0(a1)
	mv	t1,a0
	slli	a5,a4,24
	srai	a5,a5,24
	bge	a5,zero,.L32
	andi	a5,a4,224
	li	a3,192
	beq	a5,a3,.L33
	andi	a5,a4,240
	li	a3,224
	beq	a5,a3,.L34
	andi	a5,a4,248
	li	a3,240
	li	a0,-1
	bne	a5,a3,.L19
	andi	a4,a4,7
	li	a0,4
.L23:
	bgtu	a0,a2,.L30
	addi	a2,a0,-1
	add	a2,a1,a2
	li	t0,128
.L25:
	lbu	a5,1(a1)
	slli	a4,a4,6
	addi	a1,a1,1
	andi	a3,a5,192
	andi	a5,a5,63
	bne	a3,t0,.L30
	or	a4,a5,a4
	bne	a1,a2,.L25
	li	a5,1114112
	bgeu	a4,a5,.L30
	li	a5,-53248
	addi	a5,a5,-2048
	add	a5,a4,a5
	li	a3,511
	bleu	a5,a3,.L30
	sw	a4,0(t1)
	ret
.L30:
	li	a0,-1
.L19:
	ret
.L32:
	sw	a4,0(a0)
	li	a0,1
	ret
.L33:
	andi	a4,a4,31
	li	a0,2
	j	.L23
.L34:
	andi	a4,a4,15
	li	a0,3
	j	.L23
	.size	utf8dec, .-utf8dec
	.section	.rodata.utf16enc.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/utf.c:79  \n"
	.section	.text.utf16enc,"ax",@progbits
	.align	2
	.globl	utf16enc
	.hidden	utf16enc
	.type	utf16enc, @function
utf16enc:
	li	a5,53248
	addi	a5,a5,2047
	bleu	a1,a5,.L36
	li	a5,-57344
	add	a5,a1,a5
	li	a4,8192
	bltu	a5,a4,.L36
	li	a5,-65536
	add	a1,a1,a5
	li	a5,1048576
	bgeu	a1,a5,.L42
	li	a5,-8192
	addi	a3,a5,-2048
	srli	a4,a1,10
	addi	a5,a5,-1024
	andi	a1,a1,1023
	or	a4,a4,a3
	or	a1,a1,a5
	sh	a4,0(a0)
	sh	a1,2(a0)
	li	a0,2
	ret
.L36:
	sh	a1,0(a0)
	li	a0,1
	ret
.L42:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L39:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L39
	lla	s0,.LC1
	li	a0,65
.L40:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L40
	lla	s0,.LC3
	li	a0,32
.L41:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L41
	li	a0,1
	call	halt
	.size	utf16enc, .-utf16enc
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
