#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"eval.c"
	.option nopic
	.text
	.section	.text.cast,"ax",@progbits
	.align	2
	.type	cast, @function
cast:
	lw	a2,8(a0)
	lw	a5,4(a2)
	lw	a3,16(a2)
	andi	a5,a5,2
	beq	a5,zero,.L1
	li	a5,8
	sub	a5,a5,a3
	slli	a5,a5,3
	addi	a4,a5,-32
	blt	a4,zero,.L4
	li	a1,-1
	srl	a1,a1,a4
	li	t1,0
.L5:
	lw	a4,32(a0)
	lw	a5,36(a0)
	lbu	a2,48(a2)
	and	a4,a4,a1
	and	a5,a5,t1
	sw	a4,32(a0)
	sw	a5,36(a0)
	beq	a2,zero,.L1
	slli	a3,a3,3
	addi	a2,a3,-33
	addi	a3,a3,-1
	blt	a2,zero,.L7
	li	a1,1
	sll	a1,a1,a2
	li	a3,0
.L8:
	xor	a4,a4,a3
	sub	a3,a4,a3
	xor	a5,a5,a1
	sgtu	a4,a3,a4
	sub	a5,a5,a1
	sub	a5,a5,a4
	sw	a3,32(a0)
	sw	a5,36(a0)
.L1:
	ret
.L4:
	li	a1,31
	li	t1,-1
	sub	a1,a1,a5
	li	a4,-2
	sll	a4,a4,a1
	srl	a1,t1,a5
	or	a1,a4,a1
	srl	t1,t1,a5
	j	.L5
.L7:
	li	a2,1
	li	a1,0
	sll	a3,a2,a3
	j	.L8
	.size	cast, .-cast
	.globl	__muldi3
	.globl	__udivdi3
	.globl	__divdi3
	.globl	__umoddi3
	.globl	__moddi3
	.section	.rodata.binary.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"internal error; unknown binary expression"
	.section	.text.binary,"ax",@progbits
	.align	2
	.type	binary, @function
binary:
	mv	a5,a2
	lw	a2,8(a2)
	addi	sp,sp,-12
	sw	s0,4(sp)
	lw	a4,4(a2)
	mv	s0,a0
	sw	ra,8(sp)
	li	a0,1
	sw	a0,0(s0)
	andi	a4,a4,2
	beq	a4,zero,.L14
	lbu	a4,48(a2)
	beq	a4,zero,.L14
	ori	a1,a1,512
.L15:
	addi	a1,a1,-584
	li	a4,17
	bgtu	a1,a4,.L17
	lla	a2,.L19
	slli	a1,a1,2
	add	a1,a1,a2
	lw	a4,0(a1)
	add	a4,a4,a2
	jr	a4
	.section	.rodata.binary,"a",@progbits
	.align	2
	.align	2
.L19:
	.word	.L34-.L19
	.word	.L33-.L19
	.word	.L32-.L19
	.word	.L31-.L19
	.word	.L17-.L19
	.word	.L17-.L19
	.word	.L30-.L19
	.word	.L29-.L19
	.word	.L28-.L19
	.word	.L27-.L19
	.word	.L26-.L19
	.word	.L25-.L19
	.word	.L24-.L19
	.word	.L23-.L19
	.word	.L22-.L19
	.word	.L21-.L19
	.word	.L20-.L19
	.word	.L18-.L19
	.section	.text.binary
.L14:
	li	a4,89
	bgtu	a1,a4,.L15
	li	a4,71
	bgtu	a1,a4,.L86
.L17:
	lla	a0,.LC0
	call	fatal
.L44:
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	cast
.L86:
	addi	a1,a1,-72
	li	a4,17
	bgtu	a1,a4,.L17
	lla	a2,.L35
	slli	a1,a1,2
	add	a1,a1,a2
	lw	a4,0(a1)
	add	a4,a4,a2
	jr	a4
	.section	.rodata.binary
	.align	2
	.align	2
.L35:
	.word	.L34-.L35
	.word	.L33-.L35
	.word	.L32-.L35
	.word	.L31-.L35
	.word	.L17-.L35
	.word	.L17-.L35
	.word	.L42-.L35
	.word	.L41-.L35
	.word	.L28-.L35
	.word	.L40-.L35
	.word	.L39-.L35
	.word	.L38-.L35
	.word	.L37-.L35
	.word	.L36-.L35
	.word	.L22-.L35
	.word	.L21-.L35
	.word	.L20-.L35
	.word	.L18-.L35
	.section	.text.binary
.L18:
	lw	a4,32(a5)
	lw	a2,32(a3)
	lw	a5,36(a5)
	lw	a3,36(a3)
	or	a4,a4,a2
	sw	a4,32(s0)
	or	a5,a5,a3
	sw	a5,36(s0)
	j	.L44
.L20:
	lw	a4,32(a5)
	lw	a2,32(a3)
	lw	a5,36(a5)
	lw	a3,36(a3)
	xor	a4,a4,a2
	sw	a4,32(s0)
	xor	a5,a5,a3
	sw	a5,36(s0)
	j	.L44
.L21:
	lw	a4,32(a5)
	lw	a1,32(a3)
	lw	a2,36(a5)
	lw	a3,36(a3)
	xor	a5,a4,a1
	sw	zero,36(s0)
	xor	a4,a2,a3
	or	a5,a5,a4
	snez	a5,a5
	sw	a5,32(s0)
	j	.L44
.L22:
	lw	a4,32(a5)
	lw	a1,32(a3)
	lw	a2,36(a5)
	lw	a3,36(a3)
	xor	a5,a4,a1
	sw	zero,36(s0)
	xor	a4,a2,a3
	or	a5,a5,a4
	seqz	a5,a5
	sw	a5,32(s0)
	j	.L44
.L23:
	lw	a2,36(a3)
	lw	a4,36(a5)
	li	a0,1
	li	a1,0
	bgt	a2,a4,.L66
.L84:
	bne	a2,a4,.L65
	lw	a4,32(a3)
	lw	a5,32(a5)
	bleu	a4,a5,.L65
.L66:
	li	a0,0
	li	a1,0
.L65:
	sw	a0,32(s0)
	sw	a1,36(s0)
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	cast
.L24:
	lw	a2,36(a5)
	lw	a4,36(a3)
	li	a0,1
	li	a1,0
	bgt	a2,a4,.L66
.L85:
	bne	a2,a4,.L65
	lw	a4,32(a5)
	lw	a5,32(a3)
	bleu	a4,a5,.L65
	j	.L66
.L27:
	lw	a3,32(a3)
	andi	a3,a3,63
	addi	a4,a3,-32
	blt	a4,zero,.L49
	lw	a3,36(a5)
	sra	a5,a3,a4
	srai	a4,a3,31
.L50:
	sw	a5,32(s0)
	sw	a4,36(s0)
	j	.L44
.L25:
	lw	a2,36(a5)
	lw	a4,36(a3)
	li	a0,1
	li	a1,0
	bgt	a2,a4,.L65
.L79:
	bne	a2,a4,.L66
	lw	a4,32(a5)
	lw	a5,32(a3)
	bgtu	a4,a5,.L65
	j	.L66
.L31:
	lw	a2,32(a5)
	lw	a4,32(a3)
	lw	a5,36(a5)
	lw	a3,36(a3)
	sub	a4,a2,a4
	sgtu	a2,a4,a2
	sub	a5,a5,a3
	sub	a5,a5,a2
	sw	a4,32(s0)
	sw	a5,36(s0)
	j	.L44
.L32:
	lw	a4,32(a5)
	lw	a2,32(a3)
	lw	a1,36(a5)
	lw	a3,36(a3)
	add	a5,a4,a2
	sltu	a4,a5,a4
	add	a3,a1,a3
	add	a4,a4,a3
	sw	a5,32(s0)
	sw	a4,36(s0)
	j	.L44
.L26:
	lw	a2,36(a3)
	lw	a4,36(a5)
	li	a0,1
	li	a1,0
	bgt	a2,a4,.L65
.L77:
	bne	a2,a4,.L66
	lw	a4,32(a3)
	lw	a5,32(a5)
	bgtu	a4,a5,.L65
	j	.L66
.L29:
	lw	a2,32(a3)
	lw	a0,32(a5)
	lw	a3,36(a3)
	lw	a1,36(a5)
	call	__moddi3
	sw	a0,32(s0)
	sw	a1,36(s0)
	j	.L44
.L33:
	lw	a2,32(a3)
	lw	a0,32(a5)
	lw	a3,36(a3)
	lw	a1,36(a5)
	call	__muldi3
	sw	a0,32(s0)
	sw	a1,36(s0)
	j	.L44
.L34:
	lw	a4,32(a5)
	lw	a2,32(a3)
	lw	a5,36(a5)
	lw	a3,36(a3)
	and	a4,a4,a2
	sw	a4,32(s0)
	and	a5,a5,a3
	sw	a5,36(s0)
	j	.L44
.L28:
	lw	a4,32(a3)
	andi	a4,a4,63
	addi	a3,a4,-32
	blt	a3,zero,.L45
	lw	a5,32(a5)
	li	a4,0
	sll	a5,a5,a3
.L46:
	sw	a4,32(s0)
	sw	a5,36(s0)
	j	.L44
.L30:
	lw	a2,32(a3)
	lw	a0,32(a5)
	lw	a3,36(a3)
	lw	a1,36(a5)
	call	__divdi3
	sw	a0,32(s0)
	sw	a1,36(s0)
	j	.L44
.L37:
	lw	a2,36(a5)
	lw	a4,36(a3)
	li	a0,1
	li	a1,0
	bgtu	a2,a4,.L66
	j	.L85
.L38:
	lw	a2,36(a5)
	lw	a4,36(a3)
	li	a0,1
	li	a1,0
	bgtu	a2,a4,.L65
	j	.L79
.L36:
	lw	a2,36(a3)
	lw	a4,36(a5)
	li	a0,1
	li	a1,0
	bgtu	a2,a4,.L66
	j	.L84
.L39:
	lw	a2,36(a3)
	lw	a4,36(a5)
	li	a0,1
	li	a1,0
	bgtu	a2,a4,.L65
	j	.L77
.L40:
	lw	a4,32(a3)
	andi	a4,a4,63
	addi	a3,a4,-32
	blt	a3,zero,.L47
	lw	a5,36(a5)
	li	a4,0
	srl	a5,a5,a3
	j	.L50
.L41:
	lw	a2,32(a3)
	lw	a0,32(a5)
	lw	a3,36(a3)
	lw	a1,36(a5)
	call	__umoddi3
	sw	a0,32(s0)
	sw	a1,36(s0)
	j	.L44
.L42:
	lw	a2,32(a3)
	lw	a0,32(a5)
	lw	a3,36(a3)
	lw	a1,36(a5)
	call	__udivdi3
	sw	a0,32(s0)
	sw	a1,36(s0)
	j	.L44
.L45:
	lw	a3,32(a5)
	lw	a5,36(a5)
	li	a1,31
	sub	a1,a1,a4
	srli	a2,a3,1
	sll	a5,a5,a4
	srl	a2,a2,a1
	or	a5,a2,a5
	sll	a4,a3,a4
	j	.L46
.L49:
	lw	a4,36(a5)
	lw	a5,32(a5)
	li	a1,31
	slli	a2,a4,1
	sub	a1,a1,a3
	sll	a2,a2,a1
	srl	a5,a5,a3
	or	a5,a2,a5
	sra	a4,a4,a3
	j	.L50
.L47:
	lw	a3,36(a5)
	lw	a5,32(a5)
	li	a1,31
	sub	a1,a1,a4
	slli	a2,a3,1
	srl	a5,a5,a4
	sll	a2,a2,a1
	or	a5,a2,a5
	srl	a4,a3,a4
	j	.L50
	.size	binary, .-binary
	.section	.rodata.eval.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"internal error; unknown unary expression"
	.section	.text.eval,"ax",@progbits
	.align	2
	.globl	eval
	.hidden	eval
	.type	eval, @function
eval:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	mv	s0,a0
	lla	s1,.L90
.L98:
	lw	a5,0(s0)
	li	a4,9
	lw	a3,8(s0)
	bgtu	a5,a4,.L87
	slli	a5,a5,2
	add	a5,a5,s1
	lw	a5,0(a5)
	add	a5,a5,s1
	jr	a5
	.section	.rodata.eval,"a",@progbits
	.align	2
	.align	2
.L90:
	.word	.L94-.L90
	.word	.L87-.L90
	.word	.L87-.L90
	.word	.L87-.L90
	.word	.L87-.L90
	.word	.L87-.L90
	.word	.L93-.L90
	.word	.L92-.L90
	.word	.L91-.L90
	.word	.L89-.L90
	.section	.text.eval
.L91:
	lw	a0,20(s0)
	sw	a3,0(sp)
	call	eval
	lw	a2,0(a0)
	li	a5,1
	lw	a3,0(sp)
	beq	a2,a5,.L122
	lw	a5,8(a0)
	li	a4,9
	lw	a5,0(a5)
	beq	a5,a4,.L123
.L87:
	lw	ra,16(sp)
	mv	a0,s0
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L89:
	lw	a0,32(s0)
	call	eval
	mv	s1,a0
	lw	a0,36(s0)
	call	eval
	lw	a1,16(s0)
	sw	s1,32(s0)
	sw	a0,36(s0)
	li	a5,90
	beq	a1,a5,.L102
	bgtu	a1,a5,.L103
	li	a5,74
	beq	a1,a5,.L104
	li	a5,75
	bne	a1,a5,.L106
	lw	a5,0(a0)
.L108:
	li	a4,1
	bne	a5,a4,.L87
	lw	a4,0(s1)
	beq	a4,a5,.L121
	li	a5,9
	bne	a4,a5,.L87
	mv	a5,s1
	mv	s1,a0
.L111:
	lw	a3,8(a5)
	li	a4,9
	lw	a3,0(a3)
	bne	a3,a4,.L87
	lw	a4,16(a5)
	li	a3,74
	bne	a4,a3,.L87
	lw	a2,36(a5)
	li	a3,1
	lw	t1,0(a2)
	bne	t1,a3,.L87
	mv	a3,s1
	sw	a4,4(sp)
	sw	a5,0(sp)
	call	binary
	lw	a5,0(sp)
	lw	a4,4(sp)
	lw	a5,32(a5)
	sw	a4,16(s0)
	sw	a5,32(s0)
	j	.L87
.L94:
	lw	a5,32(s0)
	li	a4,3
	lw	a3,4(a5)
	bne	a3,a4,.L87
	lw	a4,40(a5)
	lw	a5,44(a5)
	li	a3,1
	sw	a3,0(s0)
	sw	a4,32(s0)
	sw	a5,36(s0)
	j	.L87
.L92:
	lw	a0,20(s0)
	call	eval
	lw	a5,16(s0)
	li	a3,72
	beq	a5,a3,.L95
	li	a3,73
	beq	a5,a3,.L87
	lw	a3,0(a0)
	li	a2,1
	bne	a3,a2,.L87
	sw	a3,0(s0)
	li	a3,75
	bne	a5,a3,.L99
	lw	a3,32(a0)
	lw	a5,36(a0)
	snez	a4,a3
	neg	a5,a5
	neg	a3,a3
	sub	a5,a5,a4
	sw	a3,32(s0)
	sw	a5,36(s0)
.L100:
	mv	a0,s0
	call	cast
	j	.L87
.L93:
	lw	s1,32(s0)
	lw	a5,44(s1)
	bne	a5,zero,.L87
	mv	a0,s1
	call	mkglobal
	lw	a1,36(s0)
	sw	a0,20(s1)
	mv	a0,s1
	call	emitdata
	sw	zero,0(s0)
	sw	s1,32(s0)
	j	.L87
.L103:
	li	a5,91
	bne	a1,a5,.L106
	lw	a4,0(s1)
	li	a5,1
	bne	a4,a5,.L87
	lw	a5,32(s1)
	lw	a4,36(s1)
	mv	s0,s1
	or	a5,a5,a4
	bne	a5,zero,.L87
.L112:
	mv	s0,a0
	j	.L87
.L95:
	lw	a5,0(a0)
	li	a3,2
	beq	a5,a3,.L97
	li	a3,7
	bne	a5,a3,.L87
	lw	a3,16(a0)
	li	a5,73
	bne	a3,a5,.L87
	lw	s0,20(a0)
	j	.L98
.L123:
	lw	a4,0(a3)
	beq	a4,a5,.L112
	lw	a5,4(a3)
	andi	a5,a5,2
	beq	a5,zero,.L87
	lla	a5,typelong
	lw	a2,16(a3)
	lw	a4,16(a5)
	bne	a2,a4,.L87
	lw	a4,20(a3)
	lw	a5,20(a5)
	bne	a4,a5,.L87
	j	.L112
.L97:
	sw	a0,0(sp)
	call	stringdecl
	lw	a4,0(sp)
	sw	a0,32(a4)
	sw	zero,0(a4)
	sw	a4,20(s0)
	j	.L87
.L122:
	lw	a4,32(a0)
	lw	a5,36(a0)
	sw	a2,0(s0)
	mv	a0,s0
	sw	a4,32(s0)
	sw	a5,36(s0)
	call	cast
	j	.L87
.L106:
	lw	a5,0(s1)
	li	a4,1
	bne	a5,a4,.L87
	lw	a4,0(a0)
	bne	a4,a5,.L87
.L121:
	mv	a3,a0
	mv	a2,s1
	mv	a0,s0
	call	binary
	j	.L87
.L102:
	lw	a4,0(s1)
	li	a5,1
	bne	a4,a5,.L87
	lw	a5,32(s1)
	lw	a4,36(s1)
	mv	s0,a0
	or	a5,a5,a4
	bne	a5,zero,.L87
	mv	s0,s1
	j	.L87
.L104:
	lw	a5,0(a0)
	li	a4,9
	bne	a5,a4,.L108
	lw	a4,0(s1)
	li	a5,1
	bne	a4,a5,.L87
	mv	a5,a0
	j	.L111
.L99:
	lla	a0,.LC1
	call	fatal
	j	.L100
	.size	eval, .-eval
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
