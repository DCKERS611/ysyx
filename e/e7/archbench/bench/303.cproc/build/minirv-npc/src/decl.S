#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"decl.c"
	.option nopic
	.text
	.section	.rodata.defineobj.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"object '%s' has incomplete type"
	.section	.text.defineobj,"ax",@progbits
	.align	2
	.type	defineobj, @function
defineobj:
	addi	sp,sp,-20
	sw	s0,12(sp)
	mv	s0,a0
	lw	a0,12(a0)
	sw	s1,8(sp)
	sw	ra,16(sp)
	lbu	t1,44(a0)
	mv	s1,a1
	mv	a4,a2
	mv	a5,a3
	bne	t1,zero,.L11
.L2:
	lw	a3,8(a0)
	lw	a2,40(s0)
	bge	a2,a3,.L3
	sw	a3,40(s0)
.L3:
	lw	a2,44(s0)
	li	a3,2
	beq	a2,a3,.L12
	mv	a1,s1
	mv	a0,s0
	call	emitdata
	li	a5,1
	lw	ra,16(sp)
	sb	a5,28(s0)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L12:
	mv	a2,s1
	mv	a1,s0
	mv	a0,a5
	mv	a3,a4
	call	funcinit
	li	a5,1
	lw	ra,16(sp)
	sb	a5,28(s0)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L11:
	sw	a2,0(sp)
	lw	a2,0(s0)
	lla	a0,tok+8
	lla	a1,.LC0
	sw	a3,4(sp)
	call	error
	lw	a0,12(s0)
	lw	a5,4(sp)
	lw	a4,0(sp)
	j	.L2
	.size	defineobj, .-defineobj
	.section	.rodata.typequal.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"_Atomic type qualifier is not yet supported"
	.section	.text.typequal,"ax",@progbits
	.align	2
	.type	typequal, @function
typequal:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a5, tok; lw a5, 0(a5);
	li	a4,49
	beq	a5,a4,.L14
	bgtu	a5,a4,.L15
	li	a4,15
	beq	a5,a4,.L16
	li	a4,32
	bne	a5,a4,.L22
	lw	a5,0(a0)
	ori	a5,a5,4
.L20:
	sw	a5,0(a0)
	call	next
	lw	ra,8(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L15:
	li	a4,51
	bne	a5,a4,.L22
	lla	a1,.LC1
	lla	a0,tok+8
	call	error
.L22:
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
.L14:
	lw	a5,0(a0)
	ori	a5,a5,8
	j	.L20
.L16:
	lw	a5,0(a0)
	ori	a5,a5,2
	j	.L20
	.size	typequal, .-typequal
	.section	.rodata.staticassert.part.0.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"after static_assert"
	.align	2
.LC3:
	.string	"after static assertion expression"
	.align	2
.LC4:
	.string	"static assertion failed: %.*s"
	.align	2
.LC5:
	.string	"static assertion failed"
	.align	2
.LC6:
	.string	"after static assertion"
	.section	.text.staticassert.part.0,"ax",@progbits
	.align	2
	.type	staticassert.part.0, @function
staticassert.part.0:
	addi	sp,sp,-20
	sw	s0,12(sp)
	lla	a1,.LC2
	mv	s0,a0
	li	a0,64
	sw	ra,16(sp)
	sw	s1,8(sp)
	call	expect
	mv	a0,s0
	li	a1,1
	call	intconstexpr
	mv	s0,a0
	li	a0,108
	mv	s1,a1
	call	consume
	bne	a0,zero,.L30
	or	s0,s0,s1
	beq	s0,zero,.L31
.L27:
	lla	a1,.LC6
	li	a0,65
	call	expect
	lla	a1,.LC6
	li	a0,95
	call	expect
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	li	a0,1
	addi	sp,sp,20
	jr	ra
.L31:
	lla	a1,.LC5
	lla	a0,tok+8
	call	error
	j	.L27
.L30:
	lla	a2,.LC3
	li	a1,7
	lla	a0,tok
	call	tokencheck
	li	a1,1
	mv	a0,sp
	or	s1,s0,s1
	call	stringconcat
	bne	s1,zero,.L27
	lw	a2,0(sp)
	lw	a3,4(sp)
	lla	a1,.LC4
	addi	a2,a2,-1
	lla	a0,tok+8
	call	error
	j	.L27
	.size	staticassert.part.0, .-staticassert.part.0
	.section	.rodata.addmember.isra.0.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"AM Panic: "
	.align	2
.LC8:
	.string	"Assertion `mt.type->align > 0' failed"
	.align	2
.LC9:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/decl.c:718  \n"
	.align	2
.LC10:
	.string	"struct has member '%s' after flexible array member"
	.align	2
.LC11:
	.string	"struct member '%s' has incomplete type"
	.align	2
.LC12:
	.string	"struct member '%s' contains flexible array member"
	.align	2
.LC13:
	.string	"struct member '%s' has function type"
	.align	2
.LC14:
	.string	"struct member '%s' has variably modified type"
	.align	2
.LC15:
	.string	"specified alignment of struct member '%s' is less strict than is required by type"
	.align	2
.LC16:
	.string	"bit-field '%s' has invalid type"
	.align	2
.LC17:
	.string	"alignment specified for bit-field '%s'"
	.align	2
.LC18:
	.string	"bit-field '%s' in packed struct is not supported"
	.align	2
.LC19:
	.string	"bit-field '%s' with zero width must not have declarator"
	.align	2
.LC20:
	.string	"bit-field '%s' exceeds width of underlying type"
	.section	.text.addmember.isra.0,"ax",@progbits
	.align	2
	.type	addmember.isra.0, @function
addmember.isra.0:
	addi	sp,sp,-44
	sw	s1,28(sp)
	lw	s1,0(a0)
	lw	t1,44(sp)
	sw	s0,32(sp)
	lw	t2,0(s1)
	sw	a0,4(sp)
	sw	a2,12(sp)
	sw	ra,36(sp)
	sw	a5,40(sp)
	li	a0,12
	sw	t1,8(sp)
	sw	a5,0(sp)
	mv	s0,a1
	mv	a2,a3
	beq	t2,a0,.L112
.L33:
	lbu	a5,44(s0)
	beq	a5,zero,.L34
	lw	a3,0(s0)
	li	a5,10
	bne	a3,a5,.L113
.L35:
	li	a5,1
	sb	a5,45(s1)
.L34:
	lbu	a5,45(s0)
	beq	a5,zero,.L36
	lw	a3,0(s1)
	li	a5,12
	beq	a3,a5,.L114
.L37:
	li	a5,1
	sb	a5,45(s1)
.L36:
	lw	a3,0(s0)
	li	a5,11
	beq	a3,a5,.L115
.L38:
	lw	a5,4(s0)
	andi	a5,a5,64
	bne	a5,zero,.L116
.L39:
	lw	a5,8(s0)
	ble	a5,zero,.L117
	beq	a2,zero,.L118
	li	a0,32
	sw	a4,20(sp)
	sw	a2,16(sp)
	call	xmalloc
	lw	a4,4(sp)
	lw	a2,12(sp)
	lw	a1,0(sp)
	lw	a3,4(a4)
	sw	a2,8(a0)
	lw	a2,16(sp)
	sw	s0,4(a0)
	sw	zero,28(a0)
	sw	a2,0(a0)
	sw	a0,0(a3)
	addi	a3,a0,28
	sw	a3,4(a4)
	li	a3,-1
	lw	a4,20(sp)
	mv	a5,a0
	beq	a1,a3,.L119
.L47:
	lw	a3,4(s0)
	andi	a3,a3,2
	beq	a3,zero,.L120
.L54:
	bne	a4,zero,.L121
.L55:
	lw	a4,4(sp)
	lbu	a4,12(a4)
	bne	a4,zero,.L122
.L56:
	lw	a4,0(sp)
	lw	a3,8(sp)
	or	t1,a4,a3
	beq	t1,zero,.L123
.L57:
	lw	a3,16(s0)
	lw	a4,20(s0)
	srli	a1,a3,29
	slli	a4,a4,3
	or	a4,a1,a4
	lw	a1,8(sp)
	slli	a3,a3,3
	bleu	a1,a4,.L124
.L78:
	lla	a1,.LC20
	lla	a0,tok+8
	sw	a5,12(sp)
	call	error
	lw	a2,0(s1)
	li	a3,12
	lw	a4,8(s0)
	lw	a5,12(sp)
	beq	a2,a3,.L125
.L61:
	beq	a5,zero,.L32
	lw	a1,16(s0)
	lw	t1,0(sp)
	lw	a2,20(s0)
	lw	a0,20(s1)
	slli	a3,a1,3
	sub	a3,a3,t1
	li	t2,0
	li	t1,0
	sw	t1,16(a5)
	sw	t2,20(a5)
	sh	zero,24(a5)
	sh	a3,26(a5)
	bgeu	a0,a2,.L126
.L79:
	sw	a1,16(s1)
	sw	a2,20(s1)
.L53:
	lw	a5,8(s1)
	bge	a5,a4,.L32
	sw	a4,8(s1)
.L32:
	lw	ra,36(sp)
	lw	s0,32(sp)
	lw	s1,28(sp)
	addi	sp,sp,44
	jr	ra
.L123:
	beq	a2,zero,.L58
	lla	a1,.LC19
	lla	a0,tok+8
	sw	t1,16(sp)
	sw	a5,12(sp)
	call	error
	lw	a5,12(sp)
	lw	t1,16(sp)
.L58:
	lw	a2,0(s1)
	li	a3,12
	lw	a4,8(s0)
	bne	a2,a3,.L61
	lw	a3,16(s0)
	lw	a2,20(s1)
	lw	t2,16(s1)
	sw	zero,12(sp)
	sw	a2,16(sp)
	addi	a2,a3,-1
	add	a2,a2,t2
	neg	a3,a3
	and	a0,a2,a3
	bne	t1,zero,.L73
.L62:
	lw	a3,4(sp)
	sw	a0,16(s1)
	sw	zero,20(s1)
	sw	zero,8(a3)
	li	t1,0
	li	a3,0
.L64:
	lw	t2,0(sp)
	lw	t0,8(sp)
	addi	a1,t2,7
	sltu	a2,a1,t2
	sub	a3,a1,a3
	sgtu	a1,a3,a1
	add	a2,a2,t0
	sub	a2,a2,a1
	slli	a1,a2,29
	srli	a3,a3,3
	or	a3,a1,a3
	sub	a1,t1,t2
	lw	t2,12(sp)
	srli	a2,a2,3
	add	t0,a3,a0
	sltu	a3,t0,a3
	add	a2,a2,t2
	andi	a1,a1,7
	add	a3,a3,a2
	sw	a1,8(sp)
	sw	a3,16(sp)
	beq	a5,zero,.L66
	lw	t2,16(s0)
	snez	a2,t1
	lw	s0,20(s0)
	sub	a2,a0,a2
	neg	a3,t2
	and	a3,a2,a3
	sw	a3,20(sp)
	sgtu	a2,a2,a0
	sub	a3,a0,a3
	neg	a0,s0
	lw	s0,0(sp)
	sw	a3,24(sp)
	slli	a1,t2,3
	slli	a3,t1,16
	lw	t1,24(sp)
	sub	a1,a1,s0
	lw	s0,12(sp)
	snez	t2,t2
	slli	t1,t1,3
	sub	a2,s0,a2
	slli	t1,t1,16
	sub	a0,a0,t2
	srli	a3,a3,16
	srli	t1,t1,16
	and	a0,a2,a0
	lw	a2,20(sp)
	add	a1,a3,a1
	sub	a3,t1,a3
	sh	a3,24(a5)
	sub	a1,a1,t1
	lw	a3,16(sp)
	sh	a1,26(a5)
	sw	a2,16(a5)
	sw	a0,20(a5)
	lw	a1,8(sp)
	lw	a5,4(sp)
	sw	t0,16(s1)
	sw	a3,20(s1)
	sw	a1,8(a5)
	j	.L53
.L113:
	lla	a1,.LC11
	lla	a0,tok+8
	sw	a4,20(sp)
	sw	a2,16(sp)
	call	error
	lw	a4,20(sp)
	lw	a2,16(sp)
	j	.L35
.L121:
	lla	a1,.LC17
	lla	a0,tok+8
	sw	a5,16(sp)
	sw	a2,12(sp)
	call	error
	lw	a4,4(sp)
	lw	a5,16(sp)
	lw	a2,12(sp)
	lbu	a4,12(a4)
	beq	a4,zero,.L56
	j	.L122
.L120:
	lla	a1,.LC16
	lla	a0,tok+8
	sw	a4,20(sp)
	sw	a5,16(sp)
	sw	a2,12(sp)
	call	error
	lw	a4,20(sp)
	lw	a5,16(sp)
	lw	a2,12(sp)
	beq	a4,zero,.L55
	j	.L121
.L122:
	lla	a1,.LC18
	lla	a0,tok+8
	sw	a5,16(sp)
	sw	a2,12(sp)
	call	error
	lw	a4,0(sp)
	lw	a3,8(sp)
	lw	a5,16(sp)
	lw	a2,12(sp)
	or	t1,a4,a3
	bne	t1,zero,.L57
	j	.L123
.L118:
	lw	a3,0(sp)
	li	a5,-1
	beq	a3,a5,.L127
.L76:
	lw	a3,4(s0)
	li	a5,0
	andi	a3,a3,2
	bne	a3,zero,.L54
	j	.L120
.L112:
	lbu	a5,45(s1)
	beq	a5,zero,.L33
	lla	a1,.LC10
	lla	a0,tok+8
	sw	a4,20(sp)
	sw	a3,16(sp)
	call	error
	lw	a4,20(sp)
	lw	a2,16(sp)
	j	.L33
.L116:
	lla	a1,.LC14
	lla	a0,tok+8
	sw	a4,20(sp)
	sw	a2,16(sp)
	call	error
	lw	a4,20(sp)
	lw	a2,16(sp)
	j	.L39
.L115:
	lla	a1,.LC13
	lla	a0,tok+8
	sw	a4,20(sp)
	sw	a2,16(sp)
	call	error
	lw	a4,20(sp)
	lw	a2,16(sp)
	j	.L38
.L119:
	lw	a3,8(sp)
	bne	a3,a1,.L47
.L72:
	lw	a3,8(s0)
	sw	zero,24(a5)
	ble	a3,a4,.L48
	bne	a4,zero,.L128
.L49:
	lw	a4,4(sp)
	lbu	a3,12(a4)
	li	a4,1
	bne	a3,zero,.L48
	lw	a4,8(s0)
.L48:
	lw	t1,0(s1)
	li	a1,12
	lw	a2,16(s1)
	lw	a3,20(s1)
	lw	t2,16(s0)
	lw	a0,20(s0)
	beq	t1,a1,.L129
	li	t0,0
	li	t1,0
	sw	t0,16(a5)
	sw	t1,20(a5)
	bgtu	a0,a3,.L77
	bne	a0,a3,.L51
	bleu	t2,a2,.L51
.L77:
	sw	t2,16(s1)
	sw	a0,20(s1)
.L51:
	lw	a5,4(sp)
	sw	zero,8(a5)
	j	.L53
.L127:
	lw	a5,8(sp)
	bne	a5,a3,.L76
	li	a0,32
	sw	a4,8(sp)
	sw	a2,0(sp)
	call	xmalloc
	lw	a4,4(sp)
	lw	a2,12(sp)
	mv	a5,a0
	lw	a3,4(a4)
	sw	a2,8(a0)
	sw	s0,4(a0)
	sw	zero,0(a0)
	sw	zero,28(a0)
	sw	a0,0(a3)
	addi	a3,a0,28
	sw	a3,4(a4)
	lw	a2,0(sp)
	lw	a4,8(sp)
	j	.L72
.L126:
	bne	a0,a2,.L53
	lw	a5,16(s1)
	bgeu	a5,a1,.L53
	j	.L79
.L114:
	lla	a1,.LC12
	lla	a0,tok+8
	sw	a4,20(sp)
	sw	a2,16(sp)
	call	error
	lw	a4,20(sp)
	lw	a2,16(sp)
	j	.L37
.L125:
	lw	a3,16(s0)
	lw	a2,20(s1)
	lw	t2,16(s1)
	sw	zero,12(sp)
	sw	a2,16(sp)
	addi	a2,a3,-1
	add	a2,a2,t2
	neg	a3,a3
	and	a0,a2,a3
.L73:
	lw	a3,4(sp)
	sub	a1,a0,t2
	sgtu	t0,a1,a0
	lw	t1,8(a3)
	lw	a3,16(sp)
	slli	a2,a1,3
	srli	a1,a1,29
	neg	a3,a3
	sub	a3,a3,t0
	slli	a3,a3,3
	or	a3,a1,a3
	add	t0,a2,t1
	lw	a1,8(sp)
	sltu	a2,t0,a2
	add	a2,a2,a3
	mv	a3,t1
	bgtu	a1,a2,.L62
	beq	a1,a2,.L130
.L75:
	lw	a2,16(sp)
	mv	a0,t2
	sw	a2,12(sp)
	j	.L64
.L129:
	addi	a1,a2,-1
	seqz	a2,a2
	sub	a3,a3,a2
	add	t1,a1,a4
	srai	s0,a4,31
	neg	a2,a4
	sltu	a1,t1,a1
	add	s0,a3,s0
	and	t1,t1,a2
	add	a1,a1,s0
	srai	a2,a2,31
	and	a3,a1,a2
	add	t2,t1,t2
	sltu	a2,t2,t1
	add	a0,a3,a0
	sw	t1,16(a5)
	sw	a3,20(a5)
	add	a5,a2,a0
	sw	a5,20(s1)
	lw	a5,4(sp)
	sw	t2,16(s1)
	sw	zero,8(a5)
	j	.L53
.L124:
	bne	a1,a4,.L58
	lw	a4,0(sp)
	bgtu	a4,a3,.L78
	j	.L58
.L66:
	lw	a5,16(sp)
	lw	a4,8(sp)
	sw	t0,16(s1)
	sw	a5,20(s1)
	lw	a5,4(sp)
	sw	a4,8(a5)
	j	.L32
.L128:
	lla	a1,.LC15
	lla	a0,tok+8
	sw	a5,0(sp)
	call	error
	lw	a5,0(sp)
	j	.L49
.L130:
	lw	a2,0(sp)
	bleu	a2,t0,.L75
	j	.L62
.L117:
	lla	s0,.LC7
	li	a0,65
.L41:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L41
	lla	s0,.LC8
	li	a0,65
.L42:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L42
	lla	s0,.LC9
	li	a0,32
.L43:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L43
	li	a0,1
	call	halt
	.size	addmember.isra.0, .-addmember.isra.0
	.section	.rodata.declcommon.str1.4,"aMS",@progbits,1
	.align	2
.LC21:
	.string	"function"
	.align	2
.LC22:
	.string	"object"
	.align	2
.LC23:
	.string	"%s '%s' with no linkage redeclared"
	.align	2
.LC24:
	.string	"%s '%s' redeclared with different linkage"
	.align	2
.LC25:
	.string	"%s '%s' redeclared with incompatible type"
	.align	2
.LC26:
	.string	"%s '%s' redeclared with different assembler name"
	.align	2
.LC27:
	.string	"'%s' redeclared with different kind"
	.section	.text.declcommon,"ax",@progbits
	.align	2
	.type	declcommon, @function
declcommon:
	addi	sp,sp,-40
	sw	s0,32(sp)
	sw	s1,28(sp)
	mv	t0,a1
	sw	ra,36(sp)
	li	a1,2
	sw	a2,0(sp)
	sw	a3,8(sp)
	sw	a4,4(sp)
	sw	a5,12(sp)
	lw	s0,44(sp)
	mv	t2,a0
	lla	s1,.LC22
	beq	t0,a1,.L208
	beq	s0,zero,.L133
.L210:
	lw	a5,8(s0)
	beq	a5,zero,.L209
	lw	a4,40(sp)
	lla	a5,filescope
	sub	a5,t2,a5
	andi	a4,a4,8
	seqz	a5,a5
	bne	a4,zero,.L136
.L213:
	lw	a4,40(sp)
	andi	a4,a4,4
	bne	a4,zero,.L137
	li	a4,2
	beq	t0,a4,.L137
	slli	a5,a5,1
.L136:
	lw	a4,8(s0)
	beq	a4,a5,.L137
	lw	a3,0(sp)
	mv	a2,s1
	lla	a1,.LC24
	lla	a0,tok+8
	call	error
.L137:
	lw	a1,12(s0)
	lw	a0,4(sp)
	call	typecompatible
	beq	a0,zero,.L138
	lw	a5,16(s0)
	lw	a4,12(sp)
	beq	a5,a4,.L139
.L138:
	lw	a3,0(sp)
	mv	a2,s1
	lla	a1,.LC25
	lla	a0,tok+8
	call	error
.L139:
	lw	a1,8(sp)
	beq	a1,zero,.L140
	lw	a0,24(s0)
	beq	a0,zero,.L141
	call	strcmp
	bne	a0,zero,.L141
.L140:
	lw	a1,12(s0)
	lw	a0,4(sp)
	mv	s1,s0
	call	typecomposite
	sw	a0,12(s0)
	lw	ra,36(sp)
	lw	s0,32(sp)
	mv	a0,s1
	lw	s1,28(sp)
	addi	sp,sp,40
	jr	ra
.L208:
	lla	s1,.LC21
	bne	s0,zero,.L210
.L133:
	lw	a4,44(t2)
	beq	a4,zero,.L143
	lw	a1,0(sp)
	mv	a0,a4
	li	a2,1
	sw	t0,20(sp)
	sw	t2,16(sp)
	call	scopegetdecl
	lw	t0,20(sp)
	lw	t2,16(sp)
	mv	a4,a0
.L143:
	lw	a5,40(sp)
	andi	a5,a5,8
	bne	a5,zero,.L211
	lw	a5,40(sp)
	andi	a5,a5,4
	bne	a5,zero,.L147
	li	a3,2
	beq	t0,a3,.L147
	lla	a5,filescope
	beq	t2,a5,.L212
	li	a0,48
	sw	t2,16(sp)
	call	xmalloc
	li	a2,48
	li	a1,0
	mv	s1,a0
	call	memset
	lw	a5,0(sp)
	sw	zero,8(s1)
	sw	a5,0(s1)
	li	a5,1
	sw	a5,4(s1)
.L207:
	lw	a5,4(sp)
	lw	t2,16(sp)
	sw	a5,12(s1)
	lw	a5,12(sp)
	sw	a5,16(s1)
.L159:
	lw	a5,4(sp)
	beq	a5,zero,.L158
	lw	a5,8(a5)
	sw	a5,40(s1)
.L158:
	lw	a5,8(sp)
	mv	a1,s1
	mv	a0,t2
	sw	a5,24(s1)
	call	scopeputdecl
	lw	ra,36(sp)
	lw	s0,32(sp)
	mv	a0,s1
	lw	s1,28(sp)
	addi	sp,sp,40
	jr	ra
.L141:
	lw	a3,0(sp)
	mv	a2,s1
	lla	a1,.LC26
	lla	a0,tok+8
	call	error
	j	.L140
.L209:
	lw	a3,0(sp)
	mv	a2,s1
	lla	a1,.LC23
	lla	a0,tok+8
	sw	t0,20(sp)
	sw	t2,16(sp)
	call	error
	lw	t2,16(sp)
	lw	a4,40(sp)
	lla	a5,filescope
	sub	a5,t2,a5
	andi	a4,a4,8
	lw	t0,20(sp)
	seqz	a5,a5
	beq	a4,zero,.L213
	j	.L136
.L147:
	beq	a4,zero,.L164
	lw	a5,8(a4)
	mv	s0,a5
	beq	a5,zero,.L146
.L145:
	lw	a2,44(t2)
	beq	a2,zero,.L146
	lla	a5,filescope
.L160:
	beq	a2,a5,.L151
	lw	a1,0(sp)
	li	a2,0
	lla	a0,filescope
	sw	t0,20(sp)
	sw	t2,16(sp)
	call	scopegetdecl
	lw	t0,20(sp)
	lw	t2,16(sp)
	mv	a4,a0
.L151:
	beq	a4,zero,.L146
	lw	a5,8(a4)
	beq	a5,zero,.L146
	lw	a3,4(a4)
	bne	a3,t0,.L214
	bne	s0,a5,.L215
.L153:
	lw	a1,12(a4)
	lw	a0,4(sp)
	sw	t0,24(sp)
	sw	t2,20(sp)
	sw	a4,16(sp)
	call	typecompatible
	lw	a4,16(sp)
	lw	t2,20(sp)
	lw	t0,24(sp)
	beq	a0,zero,.L154
	lw	a5,16(a4)
	lw	a3,12(sp)
	beq	a5,a3,.L155
.L154:
	lw	a3,0(sp)
	mv	a2,s1
	lla	a1,.LC25
	lla	a0,tok+8
	sw	t0,24(sp)
	sw	t2,20(sp)
	sw	a4,16(sp)
	call	error
	lw	t0,24(sp)
	lw	t2,20(sp)
	lw	a4,16(sp)
.L155:
	lw	a1,8(sp)
	lw	a0,24(a4)
	beq	a1,zero,.L165
	beq	a0,zero,.L157
	sw	t0,24(sp)
	sw	t2,20(sp)
	sw	a4,16(sp)
	call	strcmp
	lw	a4,16(sp)
	lw	t2,20(sp)
	lw	t0,24(sp)
	beq	a0,zero,.L156
.L157:
	lw	a3,0(sp)
	mv	a2,s1
	lla	a1,.LC26
	lla	a0,tok+8
	sw	t0,24(sp)
	sw	t2,20(sp)
	sw	a4,16(sp)
	call	error
	lw	a4,16(sp)
	lw	t2,20(sp)
	lw	t0,24(sp)
.L156:
	lw	a1,12(a4)
	lw	a0,4(sp)
	sw	t0,20(sp)
	sw	t2,16(sp)
	call	typecomposite
	lw	t0,20(sp)
	lw	t2,16(sp)
	sw	a0,4(sp)
.L146:
	li	a0,48
	sw	t0,20(sp)
	sw	t2,16(sp)
	call	xmalloc
	li	a2,48
	li	a1,0
	mv	s1,a0
	call	memset
	lw	a5,0(sp)
	lw	t0,20(sp)
	sw	s0,8(s1)
	sw	a5,0(s1)
	lw	a5,4(sp)
	sw	t0,4(s1)
	lw	t2,16(sp)
	sw	a5,12(s1)
	lw	a5,12(sp)
	sw	a5,16(s1)
	li	a5,1
	bne	t0,a5,.L158
	j	.L159
.L211:
	li	a3,1
	lla	a5,filescope
	mv	s0,a3
	beq	t2,a5,.L145
	li	s0,0
	j	.L146
.L212:
	lw	a2,44(t2)
	li	a1,2
	mv	s0,a1
	bne	a2,zero,.L160
	li	a0,48
	sw	t2,16(sp)
	call	xmalloc
	li	a2,48
	li	a1,0
	mv	s1,a0
	call	memset
	lw	a5,0(sp)
	li	a3,2
	sw	a3,8(s1)
	sw	a5,0(s1)
	li	a5,1
	sw	a5,4(s1)
	j	.L207
.L215:
	lw	a3,0(sp)
	mv	a2,s1
	lla	a1,.LC24
	lla	a0,tok+8
	sw	t0,24(sp)
	sw	t2,20(sp)
	sw	a4,16(sp)
	call	error
	lw	t0,24(sp)
	lw	t2,20(sp)
	lw	a4,16(sp)
	j	.L153
.L214:
	lw	a2,0(sp)
	lla	a1,.LC27
	lla	a0,tok+8
	sw	t0,24(sp)
	sw	t2,20(sp)
	sw	a4,16(sp)
	call	error
	lw	a4,16(sp)
	lw	t0,24(sp)
	lw	t2,20(sp)
	lw	a5,8(a4)
	beq	s0,a5,.L153
	j	.L215
.L164:
	li	a5,2
	mv	s0,a5
	j	.L145
.L165:
	sw	a0,8(sp)
	j	.L156
	.size	declcommon, .-declcommon
	.section	.text.mkdecl,"ax",@progbits
	.align	2
	.globl	mkdecl
	.hidden	mkdecl
	.type	mkdecl, @function
mkdecl:
	addi	sp,sp,-28
	mv	t1,a0
	li	a0,48
	sw	t1,12(sp)
	sw	a3,4(sp)
	sw	a4,0(sp)
	sw	ra,24(sp)
	sw	s0,20(sp)
	sw	s1,16(sp)
	sw	a2,8(sp)
	mv	s1,a1
	call	xmalloc
	li	a2,48
	li	a1,0
	mv	s0,a0
	call	memset
	lw	a4,0(sp)
	lw	t1,12(sp)
	lw	a5,8(sp)
	lw	a3,4(sp)
	sw	a4,8(s0)
	sw	t1,0(s0)
	sw	s1,4(s0)
	sw	a5,12(s0)
	sw	a3,16(s0)
	li	a4,1
	beq	s1,a4,.L222
.L216:
	lw	ra,24(sp)
	mv	a0,s0
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L222:
	beq	a5,zero,.L216
	lw	a5,8(a5)
	lw	ra,24(sp)
	mv	a0,s0
	sw	a5,40(s0)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
	.size	mkdecl, .-mkdecl
	.section	.text.typename,"ax",@progbits
	.align	2
	.globl	typename
	.hidden	typename
	.type	typename, @function
typename:
	addi	sp,sp,-60
	sw	s0,52(sp)
	sw	s1,48(sp)
	sw	a0,0(sp)
	mv	s0,a1
	mv	s1,a2
	mv	a1,a0
	li	a4,0
	li	a3,0
	li	a2,0
	addi	a0,sp,36
	sw	ra,56(sp)
	call	declspecs
	lw	t0,36(sp)
	beq	t0,zero,.L223
	lw	t1,0(sp)
	li	a5,1
	li	a4,0
	mv	a1,t1
	lw	t1,40(sp)
	li	a3,0
	addi	a2,sp,4
	sw	t1,8(sp)
	lw	t1,44(sp)
	addi	a0,sp,20
	sw	t0,4(sp)
	sw	t1,12(sp)
	call	declarator
	lw	a5,28(sp)
	lw	a4,24(sp)
	lw	t0,20(sp)
	sw	a5,44(sp)
	beq	s0,zero,.L225
	lw	a5,0(s0)
	or	a5,a5,a4
	sw	a5,0(s0)
.L225:
	beq	s1,zero,.L223
	lw	a5,44(sp)
	sw	a5,0(s1)
.L223:
	lw	ra,56(sp)
	lw	s0,52(sp)
	lw	s1,48(sp)
	mv	a0,t0
	addi	sp,sp,60
	jr	ra
	.size	typename, .-typename
	.section	.rodata.declspecs.str1.4,"aMS",@progbits,1
	.align	2
.LC28:
	.string	""
	.align	2
.LC29:
	.string	"un"
	.align	2
.LC30:
	.string	"Assertion `i < (sizeof(inttypes) / sizeof((inttypes)[0]))' failed"
	.align	2
.LC31:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/decl.c:264  \n"
	.align	2
.LC32:
	.string	"storage class not allowed in this declaration"
	.align	2
.LC33:
	.string	"invalid combination of storage class specifiers"
	.align	2
.LC34:
	.string	"function specifier not allowed in this declaration"
	.align	2
.LC35:
	.string	"duplicate 'short'"
	.align	2
.LC36:
	.string	"too many 'long'"
	.align	2
.LC37:
	.string	"duplicate 'signed'"
	.align	2
.LC38:
	.string	"duplicate 'unsigned'"
	.align	2
.LC39:
	.string	"_Complex is not yet supported"
	.align	2
.LC40:
	.string	"_Atomic is not yet supported"
	.align	2
.LC41:
	.string	"internal error: unknown tag kind"
	.align	2
.LC42:
	.string	"no type in enum type specifier"
	.align	2
.LC43:
	.string	"redeclaration of tag '%s' with different kind"
	.align	2
.LC44:
	.string	"redefinition of tag '%s'"
	.align	2
.LC45:
	.string	"no type in struct member declaration"
	.align	2
.LC46:
	.string	"struct declaration must declare at least one member"
	.align	2
.LC47:
	.string	"or ';' after declarator"
	.align	2
.LC48:
	.string	"struct/union has no members"
	.align	2
.LC49:
	.string	"expected integer constant expression"
	.align	2
.LC50:
	.string	"no %ssigned integer type can represent enumerator value"
	.align	2
.LC51:
	.string	"enumerator '%s' value cannot be represented in underlying type"
	.align	2
.LC52:
	.string	"to close enum specifier"
	.align	2
.LC53:
	.string	"after 'typeof'"
	.align	2
.LC54:
	.string	"to close 'typeof'"
	.align	2
.LC55:
	.string	"alignment specifier not allowed in this declaration"
	.align	2
.LC56:
	.string	"after 'alignas'"
	.align	2
.LC57:
	.string	"invalid alignment: %llu"
	.align	2
.LC58:
	.string	"to close 'alignas' specifier"
	.align	2
.LC59:
	.string	"multiple types in declaration specifiers"
	.align	2
.LC60:
	.string	"invalid combination of type specifiers"
	.align	2
.LC61:
	.string	"declaration has no type specifier"
	.align	2
.LC62:
	.string	"no integer type can represent all enumerator values"
	.section	.text.declspecs,"ax",@progbits
	.align	2
	.type	declspecs, @function
declspecs:
	addi	sp,sp,-188
	sw	s1,176(sp)
	sw	ra,184(sp)
	sw	s0,180(sp)
	sw	zero,100(sp)
	sw	zero,104(sp)
	sw	a0,44(sp)
	sw	a1,24(sp)
	sw	a3,8(sp)
	sw	a4,36(sp)
	mv	s1,a2
	beq	a2,zero,.L237
	sw	zero,0(a2)
.L237:
	lw	a5,8(sp)
	beq	a5,zero,.L238
	sw	zero,0(a5)
.L238:
	lw	a5,36(sp)
	beq	a5,zero,.L239
	sw	zero,0(a5)
.L239:
	sw	zero,12(sp)
	sw	zero,4(sp)
	sw	zero,16(sp)
.L241:
	addi	a0,sp,100
	call	typequal
	bne	a0,zero,.L241
	lla	a5,tok
	lw	s0,0(a5)
	li	a4,33
	addi	a5,s0,-10
	bgtu	a5,a4,.L242
	lla	a4,.L244
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.declspecs,"a",@progbits
	.align	2
	.align	2
.L244:
	.word	.L249-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L248-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L247-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L246-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L242-.L244
	.word	.L245-.L244
	.word	.L242-.L244
	.word	.L417-.L244
	.section	.text.declspecs
.L242:
	li	a5,27
	beq	s0,a5,.L418
	li	a5,59
	bne	s0,a5,.L556
	lw	a5,8(sp)
	li	s0,4
	beq	a5,zero,.L557
.L255:
	lw	a4,8(sp)
	lw	a5,0(a4)
	or	a5,a5,s0
	sw	a5,0(a4)
	call	next
	j	.L241
.L245:
	li	s0,64
.L243:
	beq	s1,zero,.L558
.L252:
	lw	a5,0(s1)
	li	a4,8
	beq	a5,a4,.L436
.L559:
	bgtu	a5,a4,.L413
	beq	a5,zero,.L253
	li	a3,4
	li	a4,-65
	bne	a5,a3,.L414
.L412:
	and	a4,s0,a4
	bne	a4,zero,.L414
.L253:
	or	s0,s0,a5
	sw	s0,0(s1)
	call	next
	j	.L241
.L246:
	li	s0,8
	bne	s1,zero,.L252
.L558:
	lla	a1,.LC32
	lla	a0,tok+8
	call	error
	lw	a5,0(s1)
	li	a4,8
	bne	a5,a4,.L559
.L436:
	li	a4,-65
	and	a4,s0,a4
	beq	a4,zero,.L253
.L414:
	lla	a1,.LC33
	lla	a0,tok+8
	call	error
	lw	a5,0(s1)
	j	.L253
.L247:
	li	s0,32
	j	.L243
.L249:
	li	s0,16
	j	.L243
.L417:
	li	s0,2
	j	.L243
.L248:
	li	s0,4
	j	.L243
.L413:
	li	a3,64
	li	a4,-13
	beq	a5,a3,.L412
	lla	a1,.LC33
	lla	a0,tok+8
	call	error
	lw	a5,0(s1)
	j	.L253
.L556:
	addi	a5,s0,-4
	li	a4,57
	bgtu	a5,a4,.L256
	lla	a4,.L258
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.declspecs
	.align	2
	.align	2
.L258:
	.word	.L272-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L271-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L270-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L269-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L263-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L268-.L258
	.word	.L267-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L266-.L258
	.word	.L265-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L263-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L264-.L258
	.word	.L264-.L258
	.word	.L263-.L258
	.word	.L262-.L258
	.word	.L261-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L260-.L258
	.word	.L256-.L258
	.word	.L259-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L256-.L258
	.word	.L257-.L258
	.section	.text.declspecs
.L256:
	lw	s0,100(sp)
	lw	a3,4(sp)
	li	a5,1280
	mv	a4,s0
	beq	a3,a5,.L364
	bleu	a3,a5,.L560
	lw	a3,4(sp)
	li	a5,4096
	addi	a4,a5,-1920
	beq	a3,a4,.L377
	bleu	a3,a4,.L561
	lw	a3,4(sp)
	addi	a4,a5,-1776
	beq	a3,a4,.L383
	bleu	a3,a4,.L562
	lw	a4,4(sp)
	addi	a5,a5,-1280
	andi	a4,a4,-17
	beq	a4,a5,.L385
.L370:
	lla	a1,.LC60
	lla	a0,tok+8
	call	error
	lw	s0,100(sp)
	j	.L369
.L263:
	li	a5,39
	beq	s0,a5,.L420
	li	a5,46
	beq	s0,a5,.L281
	li	a5,21
	beq	s0,a5,.L282
	lla	a0,.LC41
	call	fatal
	li	s0,0
.L280:
	call	next
	mv	a1,s0
	addi	a0,sp,116
	sw	zero,116(sp)
	call	attr
	mv	a1,s0
	addi	a0,sp,116
	call	gnuattr
	lla	a5,tok
	lw	a4,0(a5)
	li	a5,4
	beq	a4,a5,.L563
	sw	zero,32(sp)
	li	a4,12
	li	s0,0
.L283:
	mv	a0,a4
	li	a1,0
	call	mktype
	li	a4,0
	li	a5,0
	sw	a0,16(sp)
	sw	a4,16(a0)
	sw	a5,20(a0)
	sw	zero,8(a0)
	sw	s0,48(a0)
	sw	zero,52(a0)
.L289:
	lw	a4,16(sp)
	li	a5,1
	sb	a5,44(a4)
	beq	s0,zero,.L290
	lw	a0,24(sp)
	mv	a2,a4
	mv	a1,s0
	call	scopeputtag
.L288:
	lla	a5,tok
	lw	a4,0(a5)
	li	a5,66
	bne	a4,a5,.L291
	lw	a5,16(sp)
	lbu	a5,44(a5)
	beq	a5,zero,.L564
.L292:
	call	next
	lw	a3,16(sp)
	li	a4,6
	lw	a5,0(a3)
	beq	a5,a4,.L293
.L589:
	addi	a5,a5,-12
	li	a4,1
	bgtu	a5,a4,.L294
	lw	a5,116(sp)
	addi	a4,a3,52
	sw	s1,28(sp)
	srli	a5,a5,3
	andi	a5,a5,1
	lw	s1,24(sp)
	sw	a3,160(sp)
	sw	a4,164(sp)
	sw	zero,168(sp)
	sb	a5,172(sp)
	j	.L308
.L295:
	mv	a0,s1
	call	staticassert.part.0
	beq	a0,zero,.L299
.L307:
	lla	a5,tok
	lw	a4,0(a5)
	li	a5,67
	beq	a4,a5,.L565
.L308:
	li	a0,38
	call	consume
	bne	a0,zero,.L295
.L299:
	li	a1,0
	li	a0,0
	call	attr
	addi	a4,sp,112
	li	a3,0
	li	a2,0
	mv	a1,s1
	addi	a0,sp,136
	call	declspecs
	lw	a5,140(sp)
	lw	s0,136(sp)
	sw	a5,20(sp)
	beq	s0,zero,.L566
.L297:
	lla	a5,tok
	lw	a4,0(a5)
	li	a5,95
	bne	a4,a5,.L300
	j	.L567
.L568:
	mv	a0,s1
	li	a1,0
	call	intconstexpr
	lw	a2,20(sp)
	mv	a5,a0
	mv	t1,a1
	sw	a1,0(sp)
	li	a4,0
	li	a3,0
	mv	a1,s0
	addi	a0,sp,160
	sw	a5,92(sp)
	sw	t1,96(sp)
	call	addmember.isra.0
	lla	a5,tok
	lw	a4,0(a5)
	li	a5,95
	beq	a4,a5,.L306
.L570:
	lla	a1,.LC47
	li	a0,108
	call	expect
.L300:
	li	a0,93
	call	consume
	bne	a0,zero,.L568
	lw	t1,20(sp)
	li	a5,0
	li	a4,0
	sw	t1,140(sp)
	sw	t1,80(sp)
	lw	t1,144(sp)
	addi	a3,sp,108
	addi	a2,sp,76
	mv	a1,s1
	addi	a0,sp,148
	sw	t1,84(sp)
	sw	s0,136(sp)
	sw	s0,76(sp)
	call	declarator
	li	a0,93
	call	consume
	li	a5,-1
	li	t1,-1
	bne	a0,zero,.L569
.L305:
	lw	a4,112(sp)
	lw	a3,108(sp)
	lw	a2,152(sp)
	lw	a1,148(sp)
	sw	t1,0(sp)
	addi	a0,sp,160
	sw	a5,92(sp)
	sw	t1,96(sp)
	call	addmember.isra.0
	lla	a5,tok
	lw	a4,0(a5)
	li	a5,95
	bne	a4,a5,.L570
.L306:
	call	next
	lla	a5,tok
	lw	a4,0(a5)
	li	a5,67
	bne	a4,a5,.L308
.L565:
	lw	a5,16(sp)
	lw	s1,28(sp)
	lw	a5,52(a5)
	beq	a5,zero,.L571
.L309:
	call	next
	lbu	a5,172(sp)
	bne	a5,zero,.L294
	lw	a0,16(sp)
	lw	a2,16(a0)
	lw	a4,8(a0)
	lw	a3,20(a0)
	seqz	a1,a2
	addi	a5,a2,-1
	add	a2,a5,a4
	sub	a3,a3,a1
	srai	a1,a4,31
	sltu	a5,a2,a5
	neg	a4,a4
	add	a3,a3,a1
	add	a5,a5,a3
	srai	a3,a4,31
	and	a2,a2,a4
	and	a5,a5,a3
	sw	a2,16(a0)
	sw	a5,20(a0)
.L294:
	lw	a5,16(sp)
	sb	zero,44(a5)
.L291:
	lw	a5,12(sp)
	addi	a5,a5,1
	sw	a5,12(sp)
	j	.L273
.L264:
	call	next
	lla	a1,.LC53
	li	a0,64
	call	expect
	lw	a0,24(sp)
	addi	a2,sp,104
	addi	a1,sp,100
	call	typename
	sw	a0,16(sp)
	beq	a0,zero,.L572
.L353:
	lw	a5,12(sp)
	lla	a1,.LC54
	li	a0,65
	addi	a5,a5,1
	sw	a5,12(sp)
	call	expect
.L273:
	lw	a4,12(sp)
	li	a5,1
	bne	a4,a5,.L352
.L406:
	lw	a5,4(sp)
	beq	a5,zero,.L241
.L352:
	lla	a1,.LC59
	lla	a0,tok+8
	call	error
	j	.L241
.L560:
	li	a5,272
	beq	a3,a5,.L364
	bleu	a3,a5,.L573
	lw	a4,4(sp)
	li	a5,1028
	beq	a4,a5,.L374
	bleu	a4,a5,.L574
	lw	a3,4(sp)
	li	a4,1152
	andi	a5,a3,-17
	beq	a5,a4,.L371
	li	a5,1040
	bne	a3,a5,.L370
.L373:
	lla	a5,typeint
	mv	a4,s0
	sw	a5,8(sp)
.L367:
	li	a1,0
	li	a0,0
	sw	a4,4(sp)
	call	attr
	lw	a3,44(sp)
	lw	a5,8(sp)
	lw	a4,4(sp)
	lw	ra,184(sp)
	sw	a5,0(a3)
	lw	a5,104(sp)
	lw	s0,180(sp)
	sw	a4,4(a3)
	sw	a5,8(a3)
	lw	s1,176(sp)
	mv	a0,a3
	addi	sp,sp,188
	jr	ra
.L561:
	addi	a4,a5,-2044
	beq	a3,a4,.L379
	bleu	a3,a4,.L575
	lw	a4,4(sp)
	addi	a5,a5,-2032
	bne	a4,a5,.L370
.L382:
	lla	a5,typeuint
	mv	a4,s0
	sw	a5,8(sp)
	j	.L367
.L573:
	li	a5,4
	beq	a3,a5,.L434
	bleu	a3,a5,.L576
	lw	a4,4(sp)
	li	a5,128
	beq	a4,a5,.L371
	bleu	a4,a5,.L577
	lw	a4,4(sp)
	li	a5,144
	beq	a4,a5,.L371
	li	a5,256
	bne	a4,a5,.L370
.L364:
	lla	a5,typelong
	mv	a4,s0
	sw	a5,8(sp)
	j	.L367
.L261:
	lw	a5,12(sp)
	addi	a5,a5,1
	sw	a5,12(sp)
	call	next
	lla	a5,typevoid
	sw	a5,16(sp)
	j	.L273
.L262:
	lw	a5,4(sp)
	srli	a5,a5,11
	andi	a5,a5,1
	bne	a5,zero,.L578
.L279:
	lw	a4,4(sp)
	li	a5,4096
	addi	a5,a5,-2048
	or	a5,a4,a5
	sw	a5,4(sp)
	call	next
.L274:
	lw	a4,12(sp)
	li	a5,1
	bgt	a4,a5,.L352
	lw	a5,16(sp)
	bne	a5,zero,.L406
	j	.L241
.L259:
	lla	a1,.LC39
	lla	a0,tok+8
	call	error
	j	.L274
.L260:
	lla	a1,.LC40
	lla	a0,tok+8
	call	error
	j	.L274
.L257:
	li	a1,0
	li	a0,0
	call	gnuattr
	j	.L274
.L268:
	lw	a5,4(sp)
	ori	a5,a5,16
.L550:
	sw	a5,4(sp)
	lw	a5,12(sp)
	addi	a5,a5,1
	sw	a5,12(sp)
	call	next
	j	.L274
.L269:
	lw	a5,4(sp)
	ori	a5,a5,4
	j	.L550
.L270:
	lw	a5,12(sp)
	addi	a5,a5,1
	sw	a5,12(sp)
	call	next
	lla	a5,typebool
	sw	a5,16(sp)
	j	.L273
.L271:
	lw	a5,36(sp)
	beq	a5,zero,.L579
.L356:
	call	next
	lla	a1,.LC56
	li	a0,64
	call	expect
	lw	a0,24(sp)
	li	a2,0
	li	a1,0
	call	typename
	beq	a0,zero,.L357
	lw	s0,8(a0)
	srai	a3,s0,31
.L358:
	seqz	a4,s0
	addi	a5,s0,-1
	sub	a4,a3,a4
	and	a5,a5,s0
	and	a4,a4,a3
	or	a5,a5,a4
	bne	a5,zero,.L359
	beq	a3,zero,.L580
.L359:
	mv	a2,s0
	lla	a1,.LC57
	lla	a0,tok+8
	sw	a3,20(sp)
	call	error
	lw	a3,20(sp)
.L360:
	lw	a5,36(sp)
	lw	a4,0(a5)
	srai	a5,a4,31
	bleu	a3,a5,.L581
.L443:
	lw	a5,36(sp)
	sw	s0,0(a5)
.L362:
	lla	a1,.LC58
	li	a0,65
	call	expect
	j	.L274
.L272:
	lw	s0,100(sp)
	lw	a5,16(sp)
	mv	a4,s0
	bne	a5,zero,.L347
	lw	a5,4(sp)
	bne	a5,zero,.L348
	lla	a5,tok
	lw	a1,20(a5)
	lw	a0,24(sp)
	li	a2,1
	call	scopegetdecl
	beq	a0,zero,.L553
	lw	a5,4(a0)
	sw	a5,4(sp)
	bne	a5,zero,.L553
	lw	a4,12(a0)
	lw	a5,16(a0)
	sw	a4,16(sp)
	lw	a4,12(sp)
	or	a5,a5,s0
	sw	a5,100(sp)
	addi	a4,a4,1
	sw	a4,12(sp)
	call	next
	lw	a4,12(sp)
	li	a5,1
	beq	a4,a5,.L241
	j	.L352
.L266:
	lw	a5,4(sp)
	andi	a5,a5,128
	bne	a5,zero,.L582
.L275:
	lw	a5,4(sp)
	ori	a5,a5,128
	sw	a5,4(sp)
	call	next
	j	.L274
.L267:
	lw	a5,4(sp)
	andi	a5,a5,512
	bne	a5,zero,.L583
.L276:
	lw	a4,4(sp)
	andi	a5,a4,256
	beq	a5,zero,.L277
	ori	a5,a4,512
	sw	a5,4(sp)
.L277:
	lw	a5,4(sp)
	ori	a5,a5,256
	sw	a5,4(sp)
	call	next
	j	.L274
.L265:
	lw	a5,4(sp)
	andi	a5,a5,1024
	bne	a5,zero,.L584
.L278:
	lw	a5,4(sp)
	ori	a5,a5,1024
	sw	a5,4(sp)
	call	next
	j	.L274
.L418:
	lw	a5,8(sp)
	li	s0,2
	bne	a5,zero,.L255
.L557:
	lla	a1,.LC34
	lla	a0,tok+8
	call	error
	j	.L255
.L574:
	li	a5,784
	beq	a4,a5,.L376
	li	a5,1024
	beq	a4,a5,.L373
.L552:
	li	a5,768
	bne	a4,a5,.L370
.L376:
	lla	a5,typellong
	mv	a4,s0
	sw	a5,8(sp)
	j	.L367
.L575:
	li	a5,1808
	beq	a3,a5,.L376
	bleu	a3,a5,.L585
	lw	a5,4(sp)
	addi	a5,a5,-2048
	beq	a5,zero,.L382
	j	.L370
.L562:
	addi	a4,a5,-1904
	beq	a3,a4,.L377
	addi	a5,a5,-1792
	bne	a3,a5,.L370
.L383:
	lla	a5,typeulong
	mv	a4,s0
	sw	a5,8(sp)
	j	.L367
.L585:
	li	a5,1296
	beq	a3,a5,.L364
	li	a5,1792
	beq	a3,a5,.L376
	j	.L370
.L577:
	li	a5,16
	beq	a4,a5,.L373
	j	.L370
.L576:
	bne	a3,zero,.L370
.L369:
	lw	a5,16(sp)
	mv	a4,s0
	bne	a5,zero,.L554
.L350:
	mv	a4,s0
	bne	s0,zero,.L386
	beq	s1,zero,.L387
	lw	a5,0(s1)
	bne	a5,zero,.L386
.L387:
	lw	a5,8(sp)
	beq	a5,zero,.L367
	lw	a5,0(a5)
	beq	a5,zero,.L431
.L386:
	lla	a1,.LC61
	lla	a0,tok+8
	sw	a4,4(sp)
	call	error
	lw	a4,4(sp)
	sw	zero,8(sp)
	j	.L367
.L581:
	bne	a3,a5,.L362
	bleu	s0,a4,.L362
	j	.L443
.L580:
	bge	s0,zero,.L360
	j	.L359
.L569:
	li	a1,0
	mv	a0,s1
	call	intconstexpr
	mv	a5,a0
	mv	t1,a1
	j	.L305
.L601:
	beq	a3,zero,.L433
	li	a5,4
	bne	a3,a5,.L370
.L434:
	lla	a5,typechar
.L554:
	sw	a5,8(sp)
	j	.L367
.L584:
	lla	a1,.LC37
	lla	a0,tok+8
	call	error
	j	.L278
.L578:
	lla	a1,.LC38
	lla	a0,tok+8
	call	error
	j	.L279
.L583:
	lla	a1,.LC36
	lla	a0,tok+8
	call	error
	j	.L276
.L582:
	lla	a1,.LC35
	lla	a0,tok+8
	call	error
	j	.L275
.L281:
	call	next
	li	a1,0
	addi	a0,sp,116
	sw	zero,116(sp)
	call	attr
	li	a1,0
	addi	a0,sp,116
	call	gnuattr
	lla	a5,tok
	lw	a4,0(a5)
	li	a5,4
	beq	a4,a5,.L408
.L409:
	sw	zero,32(sp)
	li	a4,13
	li	s0,0
	j	.L283
.L420:
	li	s0,8
	j	.L280
.L282:
	call	next
	li	a1,0
	addi	a0,sp,116
	sw	zero,116(sp)
	call	attr
	li	a1,0
	addi	a0,sp,116
	call	gnuattr
	lla	a5,tok
	lw	a4,0(a5)
	li	a5,4
	beq	a4,a5,.L586
	li	a0,93
	call	consume
	li	s0,0
	beq	a0,zero,.L587
.L411:
	lw	a1,24(sp)
	li	a4,0
	li	a3,0
	li	a2,0
	addi	a0,sp,124
	call	declspecs
	lw	a5,124(sp)
	sw	a5,32(sp)
	beq	a5,zero,.L588
.L285:
	li	a4,6
	beq	s0,zero,.L416
.L284:
	lla	a5,tok
	lw	a5,0(a5)
	li	a3,66
	li	a2,0
	beq	a5,a3,.L286
	addi	a5,a5,-95
	snez	a2,a5
.L286:
	lw	a0,24(sp)
	mv	a1,s0
	sw	a4,20(sp)
	call	scopegettag
	sw	a0,16(sp)
	lw	a4,20(sp)
	beq	a0,zero,.L287
	lw	a5,0(a0)
	beq	a5,a4,.L288
	mv	a2,s0
	lla	a1,.LC43
	lla	a0,tok+8
	call	error
	j	.L288
.L290:
	lla	a5,tok
	lw	a4,0(a5)
	li	a5,66
	bne	a4,a5,.L291
	call	next
	lw	a3,16(sp)
	li	a4,6
	lw	a5,0(a3)
	bne	a5,a4,.L589
.L293:
	lla	a5,typeint
	sw	a5,28(sp)
	lw	a5,32(sp)
	beq	a5,zero,.L311
	lw	a1,16(sp)
	lw	a5,28(a1)
	sw	a1,28(sp)
	lw	a2,16(a5)
	lw	a3,20(a5)
	lw	a4,8(a5)
	lbu	a5,48(a5)
	sw	a2,16(a1)
	sw	a3,20(a1)
	sw	a4,8(a1)
	sb	a5,48(a1)
	sb	zero,44(a1)
.L311:
	lla	a5,tok
	lw	a4,0(a5)
	li	a5,4
	bne	a4,a5,.L590
	li	a5,0
	sw	s1,72(sp)
	sw	zero,52(sp)
	sw	zero,48(sp)
	sw	zero,68(sp)
	sw	zero,60(sp)
	sw	zero,40(sp)
	sw	zero,20(sp)
	mv	s1,a5
	j	.L334
.L594:
	beq	s1,a5,.L591
.L330:
	lw	a0,24(sp)
	mv	a1,s0
	call	scopeputdecl
	li	a0,108
	call	consume
	beq	a0,zero,.L548
	lw	a4,20(sp)
	lla	a5,tok
	lw	a3,0(a5)
	addi	a5,a4,1
	sltu	a2,a5,a4
	sw	a5,20(sp)
	li	a4,4
	add	s1,a2,s1
	bne	a3,a4,.L548
	sw	s0,40(sp)
.L334:
	lla	a5,tok
	lw	a5,20(a5)
	sw	a5,32(sp)
	call	next
	li	a1,0
	li	a0,0
	call	attr
	li	a0,97
	call	consume
	bne	a0,zero,.L592
	lw	a5,20(sp)
	lw	a4,28(sp)
	or	a5,a5,s1
	lbu	a3,48(a4)
	bne	a5,zero,.L318
	lla	a2,.LC29
	bne	a3,zero,.L319
.L320:
	lla	a1,.LC50
	lla	a0,tok+8
	call	error
.L316:
	li	a0,48
	call	xmalloc
	li	a2,48
	li	a1,0
	mv	s0,a0
	call	memset
	lw	a5,32(sp)
	lw	a3,20(sp)
	sw	zero,8(s0)
	sw	a5,0(s0)
	li	a5,3
	sw	a5,4(s0)
	lw	a5,28(sp)
	sw	zero,16(s0)
	sw	a3,40(s0)
	sw	a5,12(s0)
	sw	s1,44(s0)
	mv	a0,a3
	mv	a1,s1
	call	mkintconst
	lw	a5,28(sp)
	lw	a4,40(sp)
	lbu	a5,48(a5)
	sw	a0,20(s0)
	sw	a4,32(s0)
	beq	a5,zero,.L326
	blt	s1,zero,.L593
.L326:
	lw	a5,48(sp)
	bleu	s1,a5,.L594
	lw	a5,20(sp)
	sw	s1,48(sp)
	sw	a5,52(sp)
	j	.L330
.L564:
	mv	a2,s0
	lla	a1,.LC44
	lla	a0,tok+8
	call	error
	j	.L292
.L287:
	li	a5,6
	bne	a4,a5,.L283
.L416:
	li	a1,30
	li	a0,6
	call	mktype
	lw	a4,32(sp)
	sw	a0,16(sp)
	sw	a4,28(a0)
	j	.L289
.L357:
	lw	a0,24(sp)
	li	a1,0
	call	intconstexpr
	mv	s0,a0
	mv	a3,a1
	j	.L358
.L572:
	lw	a0,24(sp)
	call	expr
	lbu	a5,5(a0)
	beq	a5,zero,.L354
	lw	a0,20(a0)
.L354:
	lw	a4,8(a0)
	li	a5,44
	sw	a4,16(sp)
	bne	s0,a5,.L355
	lw	a5,100(sp)
	lw	a4,12(a0)
	or	a5,a5,a4
	sw	a5,100(sp)
.L355:
	lw	a5,16(sp)
	lw	a5,4(a5)
	andi	a5,a5,64
	beq	a5,zero,.L353
	sw	a0,104(sp)
	j	.L353
.L579:
	lla	a1,.LC55
	lla	a0,tok+8
	call	error
	j	.L356
.L319:
	lw	a1,20(sp)
	lw	a0,28(sp)
	mv	a2,s1
	call	typehasint
	bne	a0,zero,.L316
	lw	a5,16(sp)
	lw	a5,28(a5)
	beq	a5,zero,.L321
.L317:
	lw	a2,32(sp)
	lla	a1,.LC51
	lla	a0,tok+8
	call	error
.L321:
	lw	a5,28(sp)
	lla	s0,.LANCHOR0+24
	mv	a2,s1
	lbu	a3,48(a5)
	lla	a5,.LANCHOR0
	slli	a4,a3,2
	add	s0,s0,a4
	add	a5,a5,a4
	sw	s0,64(sp)
	mv	s1,a3
	mv	s0,a5
.L322:
	lw	a4,0(s0)
	lw	a1,20(sp)
	mv	a3,s1
	mv	a0,a4
	sw	a2,56(sp)
	sw	a4,28(sp)
	call	typehasint
	lw	a4,28(sp)
	lw	a2,56(sp)
	bne	a0,zero,.L547
	lw	a5,64(sp)
	addi	s0,s0,8
	bne	s0,a5,.L322
	lla	s0,.LC7
	li	a0,65
.L323:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L323
	lla	s0,.LC30
	li	a0,65
.L324:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L324
	lla	s0,.LC31
	li	a0,32
.L325:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L325
	li	a0,1
	call	halt
.L318:
	lw	a5,20(sp)
	bne	a5,zero,.L319
	li	a5,-2147483648
	bne	s1,a5,.L319
	beq	a3,zero,.L319
	lla	a2,.LC28
	j	.L320
.L592:
	lw	a0,24(sp)
	call	condexpr
	call	eval
	lw	a4,0(a0)
	li	a5,1
	mv	s0,a0
	bne	a4,a5,.L313
	lw	a5,8(a0)
	lw	a4,4(a5)
	andi	a4,a4,2
	bne	a4,zero,.L314
.L313:
	lla	a1,.LC49
	lla	a0,tok+8
	call	error
	lw	a5,8(s0)
.L314:
	lw	a4,16(sp)
	lw	a3,32(s0)
	lw	s1,36(s0)
	lw	a4,28(a4)
	sw	a3,20(sp)
	lw	a1,20(sp)
	lbu	a3,48(a5)
	mv	a2,s1
	beq	a4,zero,.L595
	lw	a0,28(sp)
	call	typehasint
	bne	a0,zero,.L316
	j	.L317
.L593:
	lw	a3,20(sp)
	neg	a5,s1
	snez	a4,a3
	sub	a5,a5,a4
	neg	a4,a3
	lw	a3,60(sp)
	bgtu	a5,a3,.L329
	bne	a5,a3,.L330
	lw	a3,68(sp)
	bleu	a4,a3,.L330
.L329:
	sw	a4,68(sp)
	sw	a5,60(sp)
	j	.L330
.L591:
	lw	a5,20(sp)
	lw	a4,52(sp)
	bleu	a5,a4,.L330
	lw	a5,20(sp)
	sw	s1,48(sp)
	sw	a5,52(sp)
	j	.L330
.L595:
	lla	a0,typeint
	call	typehasint
	lla	a5,typeint
	sw	a5,28(sp)
	bne	a0,zero,.L316
	lw	a5,8(s0)
	sw	a5,28(sp)
	j	.L316
.L548:
	lla	a1,.LC52
	li	a0,67
	lw	s1,72(sp)
	call	expect
	lw	a5,16(sp)
	lw	a4,28(a5)
	bne	a4,zero,.L294
	lw	a5,60(sp)
	bne	a5,zero,.L337
	lw	a3,68(sp)
	li	a4,-2147483648
	bgtu	a3,a4,.L337
	lw	a5,48(sp)
	beq	a5,zero,.L596
.L337:
	lw	a5,68(sp)
	lw	a4,60(sp)
	lla	t1,.LANCHOR0
	lla	a3,.LANCHOR0+24
	or	a4,a5,a4
	snez	a4,a4
	slli	a4,a4,2
	add	t1,t1,a4
	neg	a5,a5
	add	a4,a3,a4
	sw	s0,28(sp)
	sw	a4,20(sp)
	sw	a5,40(sp)
	mv	s0,t1
	sw	s1,32(sp)
.L343:
	lw	s1,0(s0)
	lw	a1,52(sp)
	lw	a2,48(sp)
	li	a3,0
	mv	a0,s1
	call	typehasint
	bne	a0,zero,.L342
.L345:
	lw	a5,20(sp)
	addi	s0,s0,8
	bne	s0,a5,.L343
	mv	a5,s1
	lla	a1,.LC62
	lla	a0,tok+8
	sw	a5,20(sp)
	lw	s0,28(sp)
	lw	s1,32(sp)
	call	error
	lw	a5,20(sp)
.L407:
	lw	a4,16(sp)
	sw	a5,28(a4)
.L346:
	sw	a4,12(s0)
	lw	s0,32(s0)
	bne	s0,zero,.L346
.L341:
	lw	a0,16(a5)
	lw	a1,20(a5)
	lw	a3,8(a5)
	lw	a4,16(sp)
	lbu	a5,48(a5)
	sw	a0,16(a4)
	sw	a1,20(a4)
	sw	a3,8(a4)
	sb	a5,48(a4)
	j	.L294
.L567:
	lw	a5,0(s0)
	li	a4,1
	addi	a5,a5,-12
	bgtu	a5,a4,.L301
	lw	a5,48(s0)
	beq	a5,zero,.L302
.L301:
	lla	a1,.LC46
	lla	a0,tok+8
	call	error
.L302:
	call	next
	lw	a4,112(sp)
	lw	a2,20(sp)
	li	a5,-1
	li	t1,-1
	li	t2,-1
	sw	a5,0(sp)
	li	a3,0
	mv	a1,s0
	addi	a0,sp,160
	sw	t1,92(sp)
	sw	t2,96(sp)
	call	addmember.isra.0
	j	.L307
.L563:
	lla	a5,tok
	lw	s0,20(a5)
	li	a4,12
	sw	a4,16(sp)
	call	next
	sw	zero,32(sp)
	lw	a4,16(sp)
	bne	s0,zero,.L284
	j	.L283
.L566:
	lla	a1,.LC45
	lla	a0,tok+8
	call	error
	j	.L297
.L397:
	lw	a3,4(sp)
	li	a4,4096
	addi	a5,a4,-1920
	beq	a3,a5,.L377
	bleu	a3,a5,.L597
	lw	a3,4(sp)
	addi	a5,a4,-1776
	beq	a3,a5,.L383
	bleu	a3,a5,.L598
	lw	a5,4(sp)
	addi	a4,a4,-1280
	andi	a5,a5,-17
	bne	a5,a4,.L370
.L385:
	lla	a5,typeullong
	mv	a4,s0
	sw	a5,8(sp)
	j	.L367
.L379:
	lla	a5,typeuchar
	mv	a4,s0
	sw	a5,8(sp)
	j	.L367
.L377:
	lla	a5,typeushort
	mv	a4,s0
	sw	a5,8(sp)
	j	.L367
.L374:
	lla	a5,typeschar
	mv	a4,s0
	sw	a5,8(sp)
	j	.L367
.L602:
	andi	a4,a4,-17
	li	a5,128
	bne	a4,a5,.L370
.L371:
	lla	a5,typeshort
	mv	a4,s0
	sw	a5,8(sp)
	j	.L367
.L586:
	lla	a5,tok
	lw	s0,20(a5)
	call	next
	li	a0,93
	call	consume
	bne	a0,zero,.L411
	sw	zero,32(sp)
	j	.L285
.L408:
	lla	a5,tok
	lw	s0,20(a5)
	li	a4,13
	sw	a4,16(sp)
	call	next
	sw	zero,32(sp)
	lw	a4,16(sp)
	bne	s0,zero,.L284
	j	.L409
.L431:
	li	a4,0
	sw	zero,8(sp)
	j	.L367
.L547:
	sw	a4,28(sp)
	mv	s1,a2
	j	.L316
.L348:
	lw	a3,4(sp)
	li	a5,1280
	beq	a3,a5,.L364
	bgtu	a3,a5,.L388
	li	a5,272
	beq	a3,a5,.L364
	bleu	a3,a5,.L599
	lw	a4,4(sp)
	li	a5,1028
	beq	a4,a5,.L374
	bleu	a4,a5,.L600
	lw	a3,4(sp)
	li	a4,1152
	andi	a5,a3,-17
	beq	a5,a4,.L371
	li	a5,1040
	beq	a3,a5,.L373
.L390:
	lla	a1,.LC60
	lla	a0,tok+8
	call	error
.L553:
	lw	s0,100(sp)
	j	.L350
.L342:
	lw	a1,40(sp)
	lw	a5,60(sp)
	li	a3,1
	snez	a4,a1
	neg	a2,a5
	sub	a2,a2,a4
	mv	a0,s1
	call	typehasint
	beq	a0,zero,.L345
	mv	a5,s1
	lw	s0,28(sp)
	lw	s1,32(sp)
	j	.L407
.L571:
	lla	a1,.LC48
	lla	a0,tok+8
	call	error
	j	.L309
.L347:
	lw	a3,4(sp)
	li	a5,1296
	beq	a3,a5,.L364
	bgtu	a3,a5,.L397
	li	a5,784
	beq	a3,a5,.L376
	bgtu	a3,a5,.L398
	li	a5,16
	beq	a3,a5,.L373
	bleu	a3,a5,.L601
	lw	a4,4(sp)
	li	a5,256
	beq	a4,a5,.L364
	bleu	a4,a5,.L602
	lw	a4,4(sp)
	li	a5,272
	bne	a4,a5,.L552
	j	.L364
.L398:
	lw	a4,4(sp)
	li	a5,1028
	beq	a4,a5,.L374
	bleu	a4,a5,.L603
	lw	a4,4(sp)
	li	a5,1152
	beq	a4,a5,.L371
	bleu	a4,a5,.L604
	lw	a4,4(sp)
	li	a5,1168
	beq	a4,a5,.L371
	li	a5,1280
	beq	a4,a5,.L364
	j	.L370
.L604:
	li	a5,1040
	beq	a4,a5,.L373
	j	.L370
.L603:
	li	a5,1024
	beq	a4,a5,.L373
	j	.L370
.L598:
	addi	a5,a4,-1904
	beq	a3,a5,.L377
	addi	a4,a4,-1792
	beq	a3,a4,.L383
	j	.L370
.L597:
	addi	a5,a4,-2044
	beq	a3,a5,.L379
	bleu	a3,a5,.L605
	lw	a5,4(sp)
	addi	a4,a4,-2032
	beq	a5,a4,.L382
	j	.L370
.L599:
	li	a5,4
	beq	a3,a5,.L434
	bleu	a3,a5,.L390
	li	a5,128
	beq	a3,a5,.L371
	bleu	a3,a5,.L606
	lw	a4,4(sp)
	li	a5,144
	beq	a4,a5,.L371
	li	a5,256
	beq	a4,a5,.L364
	j	.L390
.L600:
	li	a5,784
	beq	a4,a5,.L376
	li	a5,1024
	beq	a4,a5,.L373
	li	a5,768
	beq	a4,a5,.L376
	j	.L390
.L388:
	lw	a3,4(sp)
	li	a5,4096
	addi	a4,a5,-1920
	beq	a3,a4,.L377
	bleu	a3,a4,.L607
	lw	a3,4(sp)
	addi	a4,a5,-1776
	beq	a3,a4,.L383
	bleu	a3,a4,.L608
	lw	a4,4(sp)
	addi	a5,a5,-1280
	andi	a4,a4,-17
	bne	a4,a5,.L390
	j	.L385
.L605:
	addi	a5,a3,-2048
	beq	a5,zero,.L382
	addi	a4,a4,-2048
	bgtu	a3,a4,.L370
	andi	a4,a3,-17
	li	a5,1792
	bne	a4,a5,.L370
	j	.L376
.L606:
	li	a5,16
	beq	a3,a5,.L373
	j	.L390
.L608:
	addi	a4,a5,-1904
	beq	a3,a4,.L377
	addi	a5,a5,-1792
	beq	a3,a5,.L383
	j	.L390
.L607:
	addi	a4,a5,-2044
	beq	a3,a4,.L379
	bleu	a3,a4,.L609
	lw	a4,4(sp)
	addi	a5,a5,-2032
	beq	a4,a5,.L382
	j	.L390
.L609:
	li	a5,1808
	beq	a3,a5,.L376
	bleu	a3,a5,.L610
	lw	a5,4(sp)
	addi	a5,a5,-2048
	beq	a5,zero,.L382
	j	.L390
.L610:
	li	a5,1296
	beq	a3,a5,.L364
	li	a5,1792
	beq	a3,a5,.L376
	j	.L390
.L587:
	sw	zero,32(sp)
	j	.L416
.L588:
	lla	a1,.LC42
	lla	a0,tok+8
	call	error
	j	.L285
.L596:
	lw	a5,52(sp)
	blt	a5,zero,.L337
	lla	a5,typeint
	beq	a3,zero,.L415
.L340:
	lw	a4,16(sp)
	sw	a5,28(a4)
	j	.L341
.L590:
	lla	a1,.LC52
	li	a0,67
	call	expect
	lw	a5,16(sp)
	lw	a5,28(a5)
	bne	a5,zero,.L294
.L415:
	lla	a5,typeuint
	j	.L340
.L433:
	lw	a5,16(sp)
	sw	a5,8(sp)
	j	.L367
	.size	declspecs, .-declspecs
	.section	.rodata.declaratortypes.str1.4,"aMS",@progbits,1
	.align	2
.LC63:
	.string	"after parenthesized declarator"
	.align	2
.LC64:
	.string	"identifier not allowed in abstract declarator"
	.align	2
.LC65:
	.string	"expected '(' or identifier"
	.align	2
.LC66:
	.string	"no type in parameter declaration"
	.align	2
.LC67:
	.string	"parameter declaration has invalid storage-class specifier"
	.align	2
.LC68:
	.string	"to close function declarator"
	.align	2
.LC69:
	.string	"array length expression must have integer type"
	.align	2
.LC70:
	.string	"after array length"
	.align	2
.LC71:
	.string	"attribute not allowed after parenthesized declarator"
	.section	.text.declaratortypes,"ax",@progbits
	.align	2
	.type	declaratortypes, @function
declaratortypes:
	addi	sp,sp,-100
	sw	a0,0(sp)
	li	a0,73
	sw	s0,92(sp)
	sw	s1,88(sp)
	sw	ra,96(sp)
	mv	s0,a1
	mv	s1,a2
	sw	a3,24(sp)
	sw	a4,4(sp)
	call	consume
	beq	a0,zero,.L685
.L614:
	li	a1,0
	li	a0,0
	call	attr
	sw	zero,64(sp)
.L613:
	addi	a0,sp,64
	call	typequal
	bne	a0,zero,.L613
	lw	a1,64(sp)
	call	mkpointertype
	addi	a1,a0,32
	mv	a0,s0
	call	listinsert
	li	a0,73
	call	consume
	bne	a0,zero,.L614
.L685:
	lw	a3,4(s0)
	lla	a4,tok
	lw	a4,0(a4)
	sw	a3,20(sp)
	lw	a3,0(a3)
	mv	a5,a0
	sw	a3,28(sp)
	beq	s1,zero,.L615
	sw	zero,0(s1)
	li	a3,4
	beq	a4,a3,.L616
.L684:
	li	a3,64
	bne	a4,a3,.L617
	sw	a5,8(sp)
	call	next
	lw	a4,4(sp)
	lw	a5,8(sp)
	beq	a4,zero,.L619
	lla	a2,tok
	lw	a4,0(a2)
	li	a3,64
	beq	a4,a3,.L619
	li	a3,73
	beq	a4,a3,.L619
	li	a3,4
	beq	a4,a3,.L686
.L620:
	li	a1,0
	li	a0,11
	call	mktype
	mv	s0,a0
	sw	a0,16(sp)
	sw	zero,40(a0)
	sb	zero,48(a0)
	sw	zero,52(a0)
	sw	zero,56(a0)
	lw	a0,0(sp)
	call	mkscope
	addi	a5,s0,52
	sw	a5,0(sp)
	mv	s1,a0
	li	s0,0
	j	.L639
.L635:
	lw	a5,72(sp)
	andi	a5,a5,-33
	beq	a5,zero,.L636
	lla	a1,.LC67
	lla	a0,tok+8
	call	error
.L636:
	lw	t1,76(sp)
	addi	a2,sp,32
	li	a4,0
	sw	t1,32(sp)
	lw	t1,80(sp)
	addi	a3,sp,68
	li	a5,1
	sw	t1,36(sp)
	lw	t1,84(sp)
	mv	a1,s1
	addi	a0,sp,48
	sw	t1,40(sp)
	call	declarator
	lw	a5,52(sp)
	lw	a0,48(sp)
	addi	a1,sp,80
	sw	a5,80(sp)
	lw	a5,56(sp)
	sw	a0,76(sp)
	sw	a5,84(sp)
	call	typeadjust
	lw	a3,68(sp)
	lw	t1,80(sp)
	mv	a4,a0
	li	a0,48
	sw	a3,12(sp)
	sw	t1,8(sp)
	sw	a4,76(sp)
	sw	a4,4(sp)
	call	xmalloc
	li	a2,48
	li	a1,0
	mv	s0,a0
	call	memset
	lw	a3,12(sp)
	lw	a4,4(sp)
	lw	t1,8(sp)
	li	a2,1
	sw	a3,0(s0)
	sw	a2,4(s0)
	sw	zero,8(s0)
	sw	a4,12(s0)
	sw	t1,16(s0)
	beq	a4,zero,.L637
	lw	a4,8(a4)
	sw	a4,40(s0)
.L637:
	li	a4,2
	sw	a4,44(s0)
	beq	a3,zero,.L638
	mv	a1,s0
	mv	a0,s1
	call	scopeputdecl
.L638:
	lw	a5,0(sp)
	addi	a3,s0,32
	li	a0,108
	sw	s0,0(a5)
	lw	a5,16(sp)
	sw	a3,0(sp)
	lw	a4,56(a5)
	addi	a4,a4,1
	sw	a4,56(a5)
	call	consume
	beq	a0,zero,.L634
.L639:
	li	a0,96
	call	consume
	bne	a0,zero,.L687
	lla	a5,tok
	lw	a3,0(a5)
	li	a4,65
	beq	a3,a4,.L634
	li	a1,0
	call	attr
	li	a4,0
	li	a3,0
	addi	a2,sp,72
	mv	a1,s1
	addi	a0,sp,48
	call	declspecs
	lw	a4,52(sp)
	lw	a5,48(sp)
	sw	a4,80(sp)
	lw	a4,56(sp)
	sw	a5,76(sp)
	sw	a4,84(sp)
	bne	a5,zero,.L635
	lla	a1,.LC66
	lla	a0,tok+8
	call	error
	j	.L635
.L615:
	li	a3,4
	bne	a4,a3,.L684
	lla	a1,.LC64
	lla	a0,tok+8
	call	error
.L616:
	lla	a5,tok
	lw	a5,20(a5)
	sw	a5,0(s1)
	call	next
.L624:
	lla	a5,tok
	lw	a4,0(a5)
	li	a5,62
	beq	a4,a5,.L627
	li	a5,1
.L628:
	li	s0,64
	mv	s1,a5
.L631:
	li	a3,61
	beq	a4,s0,.L625
	beq	a4,a3,.L688
.L611:
	lw	ra,96(sp)
	lw	s0,92(sp)
	lw	s1,88(sp)
	addi	sp,sp,100
	jr	ra
.L687:
	lw	a5,16(sp)
	li	a4,1
	sb	a4,48(a5)
.L634:
	lla	a1,.LC68
	li	a0,65
	call	expect
	lw	a5,24(sp)
	beq	a5,zero,.L640
	lw	a5,20(sp)
	lw	a0,0(a5)
	lw	a5,28(sp)
	beq	a0,a5,.L689
.L640:
	mv	a0,s1
	call	delscope
	lw	a5,20(sp)
	mv	a4,a0
	sw	a4,0(sp)
	lw	a0,0(a5)
.L641:
	lw	a5,16(sp)
	li	a3,1
	lw	a4,56(a5)
	beq	a4,a3,.L690
.L642:
	lw	a5,16(sp)
	addi	a1,a5,32
	call	listinsert
	lla	a5,tok
	lw	a4,0(a5)
	li	a3,62
	li	a5,1
	bne	a4,a3,.L628
.L627:
	li	s0,62
.L629:
	li	a1,0
	li	a0,0
	call	attr
	mv	s1,a0
	li	a4,64
	beq	a0,zero,.L622
	lla	a5,tok
	lw	a5,0(a5)
	li	a3,61
	beq	a5,s0,.L629
	beq	a5,a4,.L625
	bne	a5,a3,.L611
	li	a1,0
	li	a0,0
	call	gnuattr
	lla	a5,tok
	lw	a4,0(a5)
	beq	a4,s0,.L629
	mv	a5,s1
	j	.L628
.L686:
	lw	a1,20(a2)
	lw	a0,0(sp)
	li	a2,1
	call	scopegetdecl
	lw	a5,8(sp)
	beq	a0,zero,.L619
	lw	a4,4(a0)
	beq	a4,zero,.L620
.L619:
	lw	a4,4(sp)
	lw	a3,24(sp)
	lw	a0,0(sp)
	mv	a2,s1
	mv	a1,s0
	sw	a5,8(sp)
	call	declaratortypes
	lla	a1,.LC63
	li	a0,65
	call	expect
	lla	a5,tok
	lw	a4,0(a5)
	li	a3,62
	lw	a5,8(sp)
	bne	a4,a3,.L628
.L622:
	call	next
	li	a2,0
	li	a3,0
	li	a1,0
	li	a0,0
	call	mkarraytype
	mv	s1,a0
	addi	s0,a0,52
.L645:
	li	a0,37
	call	consume
	bne	a0,zero,.L645
	mv	a0,s0
	call	typequal
	bne	a0,zero,.L645
	lla	a5,tok
	lw	a4,0(a5)
	li	a5,73
	beq	a4,a5,.L691
.L646:
	li	a0,63
	call	consume
	beq	a0,zero,.L692
.L647:
	lw	a5,20(sp)
	addi	a1,s1,32
	li	s0,62
	lw	a0,0(a5)
	call	listinsert
	lla	a5,tok
	lw	a5,0(a5)
	beq	a5,s0,.L627
	li	a4,64
	beq	a5,a4,.L625
	li	a4,61
	bne	a5,a4,.L611
	li	a1,0
	li	a0,0
	call	gnuattr
	lla	a5,tok
	lw	a4,0(a5)
	li	a5,1
	bne	a4,s0,.L628
	j	.L627
.L625:
	call	next
	j	.L620
.L688:
	lla	a1,.LC71
	lla	a0,tok+8
	beq	s1,zero,.L650
	li	a1,0
	li	a0,0
	call	gnuattr
	lla	a5,tok
	lw	a4,0(a5)
	li	a3,62
	bne	a4,a3,.L631
	j	.L627
.L617:
	lw	a5,4(sp)
	bne	a5,zero,.L624
	lla	a1,.LC65
	lla	a0,tok+8
	call	error
	j	.L624
.L691:
	li	a0,63
	call	peek
	beq	a0,zero,.L646
	lw	a5,4(s1)
	sb	zero,44(s1)
	ori	a5,a5,64
	sw	a5,4(s1)
	j	.L647
.L692:
	lw	a0,0(sp)
	call	assignexpr
	lw	a5,8(a0)
	mv	s0,a0
	lw	a5,4(a5)
	andi	a5,a5,2
	beq	a5,zero,.L693
.L648:
	sw	s0,48(s1)
	sb	zero,44(s1)
	lla	a1,.LC70
	li	a0,63
	call	expect
	j	.L647
.L690:
	lbu	a3,48(a5)
	bne	a3,zero,.L642
	lw	a3,12(s0)
	lw	a3,0(a3)
	bne	a3,a4,.L642
	lw	a5,0(s0)
	bne	a5,zero,.L642
	lw	a5,16(sp)
	sw	zero,52(a5)
	sw	zero,56(a5)
	j	.L642
.L650:
	call	error
	li	a1,0
	li	a0,0
	call	gnuattr
	lla	a5,tok
	lw	a4,0(a5)
	li	a5,62
	bne	a4,a5,.L631
	j	.L622
.L689:
	lw	a5,24(sp)
	sw	s1,0(a5)
	lw	a5,44(s1)
	sw	a5,0(sp)
	j	.L641
.L693:
	lla	a1,.LC69
	lla	a0,tok+8
	call	error
	j	.L648
	.size	declaratortypes, .-declaratortypes
	.section	.rodata.declarator.str1.4,"aMS",@progbits,1
	.align	2
.LC72:
	.string	"function declarator specifies function return type"
	.align	2
.LC73:
	.string	"function declarator specifies array return type"
	.align	2
.LC74:
	.string	"array element has incomplete type"
	.align	2
.LC75:
	.string	"array element has function type"
	.align	2
.LC76:
	.string	"array length must be non-negative"
	.globl	__muldi3
	.align	2
.LC77:
	.string	"array length is too large"
	.section	.text.declarator,"ax",@progbits
	.align	2
	.type	declarator, @function
declarator:
	addi	sp,sp,-68
	mv	t1,a4
	addi	a4,sp,48
	sw	a2,16(sp)
	sw	a4,48(sp)
	sw	a4,52(sp)
	sw	a0,12(sp)
	sw	ra,64(sp)
	sw	s0,60(sp)
	sw	s1,56(sp)
	lw	t0,0(a2)
	lw	t2,4(a2)
	mv	a0,a1
	mv	a2,a3
	mv	a4,a5
	beq	t1,zero,.L695
	sw	zero,0(t1)
.L695:
	mv	a3,t1
	addi	a1,sp,48
	sw	t2,4(sp)
	sw	t0,0(sp)
	call	declaratortypes
	lw	t1,48(sp)
	lw	t0,0(sp)
	lw	t2,4(sp)
.L736:
	addi	a5,sp,48
	beq	t1,a5,.L696
.L738:
	lw	a4,4(t0)
	lw	a5,-28(t1)
	lw	a3,-32(t1)
	andi	a4,a4,64
	mv	s0,t1
	mv	a2,t2
	or	a5,a5,a4
	lw	t1,0(t1)
	lw	t2,8(s0)
	sw	t0,-4(s0)
	sw	a5,-28(s0)
	sw	a2,8(s0)
	li	a5,10
	mv	s1,t0
	addi	t0,s0,-32
	beq	a3,a5,.L697
	li	a5,11
	bne	a3,a5,.L736
	lw	a5,0(s1)
	beq	a5,a3,.L737
.L699:
	li	a4,10
	bne	a5,a4,.L736
	lla	a1,.LC73
	lla	a0,tok+8
	sw	t2,8(sp)
	sw	t0,4(sp)
	sw	t1,0(sp)
	call	error
	lw	t1,0(sp)
	addi	a5,sp,48
	lw	t0,4(sp)
	lw	t2,8(sp)
	bne	t1,a5,.L738
.L696:
	lw	a4,16(sp)
	lw	ra,64(sp)
	lw	s0,60(sp)
	lw	a5,8(a4)
	sw	t0,0(a4)
	sw	t2,4(a4)
	lw	a4,12(sp)
	lw	s1,56(sp)
	sw	t0,0(a4)
	sw	t2,4(a4)
	sw	a5,8(a4)
	mv	a0,a4
	addi	sp,sp,68
	jr	ra
.L697:
	lbu	a5,44(s1)
	bne	a5,zero,.L739
	lw	a4,0(s1)
	li	a5,11
	beq	a4,a5,.L740
.L702:
	lw	a5,8(s1)
	lw	a0,16(s0)
	li	a3,0
	li	a4,0
	sw	a3,-16(s0)
	sw	a4,-12(s0)
	sw	a5,-24(s0)
	beq	a0,zero,.L736
	sw	t2,8(sp)
	sw	t0,4(sp)
	sw	t1,0(sp)
	call	eval
	lw	a3,0(a0)
	li	a4,1
	lw	t1,0(sp)
	lw	t0,4(sp)
	lw	t2,8(sp)
	mv	a5,a0
	beq	a3,a4,.L741
.L704:
	lw	a4,-28(s0)
	sw	a5,16(s0)
	sw	zero,24(s0)
	ori	a5,a4,64
	sw	a5,-28(s0)
	j	.L736
.L739:
	lla	a1,.LC74
	lla	a0,tok+8
	sw	t2,8(sp)
	sw	t0,4(sp)
	sw	t1,0(sp)
	call	error
	lw	a4,0(s1)
	li	a5,11
	lw	t2,8(sp)
	lw	t0,4(sp)
	lw	t1,0(sp)
	bne	a4,a5,.L702
.L740:
	lla	a1,.LC75
	lla	a0,tok+8
	sw	t2,8(sp)
	sw	t0,4(sp)
	sw	t1,0(sp)
	call	error
	lw	t2,8(sp)
	lw	t0,4(sp)
	lw	t1,0(sp)
	j	.L702
.L737:
	lla	a1,.LC72
	lla	a0,tok+8
	sw	t2,8(sp)
	sw	t0,4(sp)
	sw	t1,0(sp)
	call	error
	lw	a5,0(s1)
	lw	t2,8(sp)
	lw	t0,4(sp)
	lw	t1,0(sp)
	j	.L699
.L741:
	lw	a4,16(s1)
	mv	a3,a4
	sw	a4,0(sp)
	lw	a4,20(s1)
	or	a3,a3,a4
	beq	a3,zero,.L704
	lw	a2,32(a0)
	lw	a3,8(a0)
	sw	a2,8(sp)
	lw	a2,36(a0)
	lbu	a3,48(a3)
	sw	a2,4(sp)
	beq	a3,zero,.L706
	blt	a2,zero,.L742
.L706:
	lw	a3,4(sp)
	bne	a3,zero,.L710
	bne	a4,zero,.L743
.L715:
	lw	a2,8(sp)
	lw	a3,4(sp)
	lw	a0,0(sp)
	mv	a1,a4
	sw	t2,28(sp)
	sw	t0,24(sp)
	sw	t1,20(sp)
	call	__muldi3
	lw	t1,20(sp)
	lw	t0,24(sp)
	lw	t2,28(sp)
	sw	a0,-16(s0)
	sw	a1,-12(s0)
	j	.L736
.L710:
	bne	a4,zero,.L714
	lw	a3,4(sp)
	sw	a3,20(sp)
	lw	a3,0(sp)
	sw	a3,24(sp)
.L712:
	lw	a2,0(sp)
	lw	a0,8(sp)
	li	a3,0
	li	a1,0
	sw	t2,44(sp)
	sw	t0,40(sp)
	sw	t1,36(sp)
	sw	a4,32(sp)
	sw	a5,28(sp)
	call	__muldi3
	lw	a2,20(sp)
	lw	a0,24(sp)
	mv	ra,a1
	li	a3,0
	li	a1,0
	sw	ra,20(sp)
	call	__muldi3
	lw	a5,20(sp)
	lw	a4,32(sp)
	lw	t1,36(sp)
	add	a3,a5,a0
	sltu	a3,a3,a0
	add	a3,a3,a1
	lw	a5,28(sp)
	lw	t0,40(sp)
	lw	t2,44(sp)
	beq	a3,zero,.L715
.L714:
	lla	a1,.LC77
	lla	a0,tok+8
	sw	t2,28(sp)
	sw	t0,24(sp)
	sw	t1,20(sp)
	sw	a5,4(sp)
	call	error
	lw	a5,16(s1)
	lw	a4,20(s1)
	lw	t2,28(sp)
	sw	a5,0(sp)
	lw	a5,4(sp)
	lw	t0,24(sp)
	lw	t1,20(sp)
	lw	a3,32(a5)
	lw	a5,36(a5)
	sw	a3,8(sp)
	sw	a5,4(sp)
	j	.L715
.L742:
	sw	a0,0(sp)
	lla	a1,.LC76
	lla	a0,tok+8
	sw	t2,28(sp)
	sw	t0,24(sp)
	sw	t1,20(sp)
	call	error
	lw	a5,0(sp)
	lw	t2,28(sp)
	lw	t0,24(sp)
	lw	a4,32(a5)
	lw	t1,20(sp)
	sw	a4,8(sp)
	lw	a4,36(a5)
	sw	a4,4(sp)
	lw	a4,16(s1)
	sw	a4,0(sp)
	lw	a4,20(s1)
	j	.L706
.L743:
	lw	a3,8(sp)
	sw	a4,20(sp)
	sw	a3,24(sp)
	j	.L712
	.size	declarator, .-declarator
	.section	.rodata.decl.str1.4,"aMS",@progbits,1
	.align	2
.LC78:
	.string	"static"
	.align	2
.LC79:
	.string	"thread"
	.align	2
.LC80:
	.string	"external"
	.align	2
.LC81:
	.string	"internal"
	.align	2
.LC82:
	.string	"Assertion `funcscope' failed"
	.align	2
.LC83:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/decl.c:1043  \n"
	.align	2
.LC84:
	.string	"block scope declaration containing 'thread_local' must contain 'static' or 'extern'"
	.align	2
.LC85:
	.string	"external declaration must not contain 'auto'"
	.align	2
.LC86:
	.string	"external declaration must not contain 'register'"
	.align	2
.LC87:
	.string	"after __asm__"
	.align	2
.LC88:
	.string	"for assembler name"
	.align	2
.LC89:
	.string	"after assembler name"
	.align	2
.LC90:
	.string	"typedef '%s' declared with alignment specifier"
	.align	2
.LC91:
	.string	"typedef '%s' declared with assembler label"
	.align	2
.LC92:
	.string	"typedef '%s' redefined with different type"
	.align	2
.LC93:
	.string	"object '%s' requires alignment %d, which is stricter than specified alignment %d"
	.align	2
.LC94:
	.string	"object '%s' with %s storage duration cannot have variably modified type"
	.align	2
.LC95:
	.string	"object '%s' with block scope and %s linkage cannot have initializer"
	.align	2
.LC96:
	.string	"object '%s' redefined"
	.align	2
.LC97:
	.string	"function '%s' declared with alignment specifier"
	.align	2
.LC98:
	.string	"function '%s' with block scope may only have storage class 'extern'"
	.align	2
.LC99:
	.string	"function definition not allowed"
	.align	2
.LC100:
	.string	"function '%s' redefined"
	.section	.text.decl,"ax",@progbits
	.align	2
	.globl	decl
	.hidden	decl
	.type	decl, @function
decl:
	addi	sp,sp,-108
	sw	s1,96(sp)
	mv	s1,a0
	li	a0,38
	sw	ra,104(sp)
	sw	s0,100(sp)
	sw	a1,20(sp)
	call	consume
	bne	a0,zero,.L745
.L749:
	li	a1,0
	li	a0,0
	call	attr
	bne	a0,zero,.L746
.L747:
	addi	a4,sp,68
	addi	a3,sp,56
	addi	a2,sp,52
	mv	a1,s1
	addi	a0,sp,72
	call	declspecs
	lw	a4,80(sp)
	lw	a5,72(sp)
	sw	a4,16(sp)
	beq	a5,zero,.L879
	lw	a4,20(sp)
	lw	a5,52(sp)
	beq	a4,zero,.L752
	li	a4,64
	beq	a5,a4,.L880
.L754:
	li	a0,95
	call	consume
	bne	a0,zero,.L748
	lw	a5,20(sp)
	seqz	a5,a5
	sw	a5,24(sp)
.L793:
	lw	t1,72(sp)
	lw	t0,16(sp)
	li	a5,0
	sw	t1,36(sp)
	lw	t1,76(sp)
	addi	a4,sp,64
	addi	a3,sp,60
	addi	a2,sp,36
	mv	a1,s1
	addi	a0,sp,84
	sw	t0,80(sp)
	sw	t1,40(sp)
	sw	t0,44(sp)
	call	declarator
	lw	a5,84(sp)
	li	a0,60
	li	s0,0
	sw	a5,8(sp)
	lw	a5,88(sp)
	sw	a5,12(sp)
	call	consume
	bne	a0,zero,.L881
.L757:
	lw	a5,52(sp)
	lw	a1,60(sp)
	andi	a5,a5,2
	bne	a5,zero,.L758
	lw	a5,8(sp)
	lw	a4,0(a5)
	li	a5,11
	beq	a4,a5,.L882
	li	a2,0
	mv	a0,s1
	call	scopegetdecl
	mv	t1,a0
	beq	a0,zero,.L798
	lw	a4,4(a0)
	li	a5,1
	beq	a4,a5,.L798
	lw	a2,60(sp)
	sw	a0,24(sp)
	lla	a1,.LC27
	lla	a0,tok+8
	call	error
	lw	t1,24(sp)
.L798:
	lw	a4,68(sp)
	beq	a4,zero,.L766
	lw	a5,8(sp)
	lw	a3,8(a5)
	blt	a4,a3,.L883
.L766:
	lw	a5,52(sp)
	lw	a4,8(sp)
	lw	a2,60(sp)
	sw	a5,0(sp)
	lw	a5,12(sp)
	mv	a3,s0
	sw	t1,4(sp)
	li	a1,1
	mv	a0,s1
	call	declcommon
	lw	a5,68(sp)
	lw	a4,40(a0)
	mv	s0,a0
	bge	a4,a5,.L767
	sw	a5,40(a0)
.L767:
	lw	a5,52(sp)
	lw	a3,8(s0)
	andi	a4,a5,8
	or	a4,a4,a3
	bne	a4,zero,.L768
	li	a5,2
	sw	a5,44(s0)
.L769:
	lw	a5,16(sp)
	beq	a5,zero,.L772
	lw	a0,20(sp)
	mv	a1,a5
	call	funcexpr
.L772:
	li	a0,97
	call	consume
	mv	t1,a0
	beq	a0,zero,.L773
	lw	a5,20(sp)
	beq	a5,zero,.L774
	lw	a5,8(s0)
	bne	a5,zero,.L884
.L774:
	lbu	a5,28(s0)
	bne	a5,zero,.L885
.L776:
	lw	a1,12(s0)
	mv	a0,s1
	sw	t1,8(sp)
	call	parseinit
	lw	t1,8(sp)
	mv	a1,a0
.L777:
	lw	a3,20(sp)
	mv	a2,t1
	mv	a0,s0
	call	defineobj
.L764:
	li	a0,95
	call	consume
	bne	a0,zero,.L748
	lla	a1,.LC47
	li	a0,108
	call	expect
	sw	zero,24(sp)
	j	.L793
.L746:
	li	a0,95
	call	consume
	beq	a0,zero,.L747
.L748:
	li	a0,1
.L877:
	lw	ra,104(sp)
	lw	s0,100(sp)
	lw	s1,96(sp)
	addi	sp,sp,108
	jr	ra
.L758:
	li	a2,0
	mv	a0,s1
	call	scopegetdecl
	mv	t1,a0
	beq	a0,zero,.L797
	lw	a5,4(a0)
	beq	a5,zero,.L797
	sw	zero,32(sp)
.L800:
	lw	a2,60(sp)
	lla	a1,.LC27
	lla	a0,tok+8
	sw	t1,28(sp)
	call	error
	lw	a5,32(sp)
	lw	t1,28(sp)
	beq	a5,zero,.L797
.L795:
	lw	a5,68(sp)
	bne	a5,zero,.L886
.L779:
	lw	a5,20(sp)
	lw	a0,52(sp)
	beq	a5,zero,.L780
	andi	a5,a0,-5
	beq	a5,zero,.L780
	lw	a2,60(sp)
	lla	a0,tok+8
	lla	a1,.LC98
	sw	t1,28(sp)
	call	error
	lw	a0,52(sp)
	lw	t1,28(sp)
.L780:
	lw	a5,12(sp)
	lw	a4,8(sp)
	lw	a2,60(sp)
	mv	a3,s0
	sw	t1,4(sp)
	li	a1,2
	sw	a0,0(sp)
	mv	a0,s1
	sw	t1,12(sp)
	call	declcommon
	mv	s0,a0
	call	mkglobal
	lw	a4,8(s0)
	sw	a0,20(s0)
	li	a5,2
	lw	t1,12(sp)
	beq	a4,a5,.L781
	lw	a5,56(sp)
.L782:
	li	a4,0
.L783:
	lla	a3,tok
	srli	a5,a5,2
	lw	a3,0(a3)
	andi	a5,a5,1
	sb	a5,41(s0)
	sb	a4,40(s0)
	li	a5,66
	beq	a3,a5,.L887
	lw	a0,64(sp)
	beq	a0,zero,.L764
	call	delscope
	j	.L764
.L797:
	lw	a5,68(sp)
	bne	a5,zero,.L888
.L761:
	beq	s0,zero,.L762
	lw	a2,60(sp)
	lla	a1,.LC91
	lla	a0,tok+8
	sw	t1,24(sp)
	call	error
	lw	t1,24(sp)
.L762:
	beq	t1,zero,.L889
	lw	a0,12(t1)
	lw	a1,8(sp)
	sw	t1,24(sp)
	call	typesame
	beq	a0,zero,.L765
	lw	t1,24(sp)
	lw	a4,12(sp)
	lw	a5,16(t1)
	beq	a5,a4,.L764
.L765:
	lw	a2,60(sp)
	lla	a1,.LC92
	lla	a0,tok+8
	call	error
	j	.L764
.L888:
	lw	a2,60(sp)
	lla	a1,.LC90
	lla	a0,tok+8
	sw	t1,24(sp)
	call	error
	lw	t1,24(sp)
	j	.L761
.L881:
	lla	a1,.LC87
	li	a0,64
	call	expect
	lla	a1,.LC88
	li	a0,7
	call	expect
	mv	s0,a0
	lla	a1,.LC89
	li	a0,65
	sw	zero,24(sp)
	call	expect
	j	.L757
.L768:
	lw	a4,8(sp)
	srli	a5,a5,6
	andi	a5,a5,1
	lw	a4,4(a4)
	sw	a5,44(s0)
	andi	a4,a4,64
	beq	a4,zero,.L770
	lw	a2,60(sp)
	lla	a3,.LC78
	bne	a5,zero,.L890
.L771:
	lla	a1,.LC94
	lla	a0,tok+8
	call	error
.L770:
	mv	a0,s0
	call	mkglobal
	sw	a0,20(s0)
	j	.L769
.L882:
	li	a2,0
	mv	a0,s1
	call	scopegetdecl
	mv	t1,a0
	beq	a0,zero,.L795
	lw	a4,4(a0)
	li	a5,2
	beq	a4,a5,.L795
	li	a5,2
	sw	a5,32(sp)
	j	.L800
.L773:
	lw	a5,52(sp)
	andi	a5,a5,4
	bne	a5,zero,.L764
	lw	a5,8(s0)
	beq	a5,zero,.L806
	lw	a5,44(s0)
	bne	a5,zero,.L806
	lbu	a5,28(s0)
	bne	a5,zero,.L764
	lbu	a5,29(s0)
	bne	a5,zero,.L764
	lla	a5,.LANCHOR1
	lw	a3,0(a5)
	li	a4,1
	sb	a4,29(s0)
	addi	a4,s0,32
	sw	s0,0(a3)
	sw	a4,0(a5)
	j	.L764
.L745:
	mv	a0,s1
	call	staticassert.part.0
	bne	a0,zero,.L748
	j	.L749
.L781:
	lw	a5,56(sp)
	andi	a4,a5,2
	beq	a4,zero,.L782
	lw	a4,52(sp)
	andi	a4,a4,4
	bne	a4,zero,.L782
	li	a4,1
	beq	t1,zero,.L783
	lbu	a4,40(t1)
	bne	a4,zero,.L783
	j	.L782
.L886:
	lw	a2,60(sp)
	lla	a1,.LC97
	lla	a0,tok+8
	sw	t1,28(sp)
	call	error
	lw	t1,28(sp)
	j	.L779
.L889:
	lw	a5,60(sp)
	li	a0,48
	sw	a5,24(sp)
	call	xmalloc
	li	a2,48
	li	a1,0
	mv	s0,a0
	call	memset
	lw	a5,24(sp)
	mv	a1,s0
	sw	zero,4(s0)
	sw	a5,0(s0)
	lw	a5,8(sp)
	sw	zero,8(s0)
	mv	a0,s1
	sw	a5,12(s0)
	lw	a5,12(sp)
	sw	a5,16(s0)
	call	scopeputdecl
	j	.L764
.L890:
	lla	a3,.LC79
	j	.L771
.L884:
	li	a4,2
	lw	a2,60(sp)
	lla	a3,.LC80
	beq	a5,a4,.L775
	lla	a3,.LC81
.L775:
	lla	a1,.LC95
	lla	a0,tok+8
	sw	t1,8(sp)
	call	error
	lbu	a5,28(s0)
	lw	t1,8(sp)
	beq	a5,zero,.L776
.L885:
	lw	a2,60(sp)
	lla	a1,.LC96
	lla	a0,tok+8
	sw	t1,8(sp)
	call	error
	lw	t1,8(sp)
	j	.L776
.L806:
	li	a1,0
	j	.L777
.L883:
	lw	a2,60(sp)
	lla	a1,.LC93
	lla	a0,tok+8
	sw	t1,24(sp)
	call	error
	lw	t1,24(sp)
	j	.L766
.L752:
	andi	a4,a5,16
	bne	a4,zero,.L891
.L755:
	andi	a5,a5,32
	beq	a5,zero,.L754
	lla	a1,.LC86
	lla	a0,tok+8
	call	error
	j	.L754
.L879:
	li	a0,0
	j	.L877
.L887:
	lw	a5,24(sp)
	beq	a5,zero,.L892
.L785:
	lbu	a5,28(s0)
	bne	a5,zero,.L893
.L786:
	lw	a3,64(sp)
	beq	a3,zero,.L894
	lw	a1,60(sp)
	lw	a2,8(sp)
	mv	a0,s0
	sw	a3,12(sp)
	call	mkfunc
	lw	a3,12(sp)
	li	a2,0
	mv	s1,a0
	sw	a0,48(a3)
	mv	a1,a3
	sw	a3,8(sp)
	call	stmt
	lbu	a5,41(s0)
	lw	a3,8(sp)
	bne	a5,zero,.L895
.L791:
	lbu	a5,40(s0)
	beq	a5,zero,.L896
.L792:
	mv	a0,a3
	call	delscope
	mv	a0,s1
	call	delfunc
	li	a5,1
	sb	a5,28(s0)
	li	a0,1
	j	.L877
.L880:
	lla	a1,.LC84
	lla	a0,tok+8
	call	error
	j	.L754
.L893:
	lw	a2,60(sp)
	lla	a1,.LC100
	lla	a0,tok+8
	call	error
	j	.L786
.L892:
	lla	a1,.LC99
	lla	a0,tok+8
	call	error
	j	.L785
.L896:
	lw	a1,8(s0)
	mv	a0,s1
	sw	a3,8(sp)
	addi	a1,a1,-2
	seqz	a1,a1
	call	emitfunc
	lw	a3,8(sp)
	j	.L792
.L895:
	mv	a0,s1
	call	funchlt
	lw	a3,8(sp)
	j	.L791
.L891:
	lla	a1,.LC85
	lla	a0,tok+8
	call	error
	lw	a5,52(sp)
	j	.L755
.L894:
	lla	s0,.LC7
	li	a0,65
.L788:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L788
	lla	s0,.LC82
	li	a0,65
.L789:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L789
	lla	s0,.LC83
	li	a0,32
.L790:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L790
	li	a0,1
	call	halt
	.size	decl, .-decl
	.section	.rodata.stringdecl.str1.4,"aMS",@progbits,1
	.align	2
.LC101:
	.string	"Assertion `expr->kind == EXPRSTRING' failed"
	.align	2
.LC102:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/decl.c:1076  \n"
	.align	2
.LC103:
	.string	"string"
	.section	.text.stringdecl,"ax",@progbits
	.align	2
	.globl	stringdecl
	.hidden	stringdecl
	.type	stringdecl, @function
stringdecl:
	lla	a5,.LANCHOR2
	lw	a4,0(a5)
	addi	sp,sp,-36
	sw	s0,28(sp)
	sw	ra,32(sp)
	sw	s1,24(sp)
	mv	s0,a0
	beq	a4,zero,.L912
.L898:
	lw	a4,0(s0)
	li	a5,2
	bne	a4,a5,.L913
	lw	a2,32(s0)
	lw	a1,36(s0)
	addi	a0,sp,12
	call	mapkey
	addi	a1,sp,12
	lla	a0,.LANCHOR2
	call	mapput
	lw	s1,0(a0)
	beq	s1,zero,.L914
	lw	ra,32(sp)
	lw	s0,28(sp)
	mv	a0,s1
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
.L912:
	li	a1,64
	mv	a0,a5
	call	mapinit
	j	.L898
.L914:
	lw	a5,8(s0)
	sw	a0,4(sp)
	li	a0,48
	sw	a5,0(sp)
	call	xmalloc
	li	a2,48
	li	a1,0
	mv	s1,a0
	call	memset
	lw	a5,0(sp)
	lla	a4,.LC103
	sw	a4,0(s1)
	li	a4,1
	sw	a4,4(s1)
	sw	zero,8(s1)
	sw	a5,12(s1)
	sw	zero,16(s1)
	lw	t1,4(sp)
	beq	a5,zero,.L904
	lw	a5,8(a5)
	sw	a5,40(s1)
.L904:
	mv	a0,s1
	sw	t1,0(sp)
	call	mkglobal
	lw	a3,8(s0)
	mv	a5,s0
	li	a4,0
	lw	a2,16(a3)
	lw	a3,20(a3)
	li	a1,0
	sw	a0,20(s1)
	li	a0,0
	call	mkinit
	mv	a1,a0
	mv	a0,s1
	call	emitdata
	lw	t1,0(sp)
	lw	ra,32(sp)
	lw	s0,28(sp)
	sw	s1,0(t1)
	mv	a0,s1
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
.L913:
	lla	s0,.LC7
	li	a0,65
.L900:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L900
	lla	s0,.LC101
	li	a0,65
.L901:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L901
	lla	s0,.LC102
	li	a0,32
.L902:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L902
	li	a0,1
	call	halt
	.size	stringdecl, .-stringdecl
	.section	.text.emittentativedefns,"ax",@progbits
	.align	2
	.globl	emittentativedefns
	.hidden	emittentativedefns
	.type	emittentativedefns, @function
emittentativedefns:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	la s0, .LANCHOR3; lw s0, 0(s0);
	bne	s0,zero,.L918
	j	.L915
.L917:
	lw	s0,32(s0)
	beq	s0,zero,.L915
.L918:
	lbu	a5,28(s0)
	bne	a5,zero,.L917
	mv	a0,s0
	li	a3,0
	li	a2,0
	li	a1,0
	call	defineobj
	lw	s0,32(s0)
	bne	s0,zero,.L918
.L915:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	emittentativedefns, .-emittentativedefns
	.section	.text.decl_init,"ax",@progbits
	.align	2
	.globl	decl_init
	.hidden	decl_init
	.type	decl_init, @function
decl_init:
	lla	a5,.LANCHOR3
	li	a2,16
	li	a1,0
	lla	a0,.LANCHOR2
	la a4, .LANCHOR1; sw a5, 0(a4);
	sw	zero,0(a5)
	tail	memset
	.size	decl_init, .-decl_init
	.section	.bss.strings,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	strings, @object
	.size	strings, 16
strings:
	.zero	16
	.section	.rodata.inttypes.0,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	inttypes.0, @object
	.size	inttypes.0, 24
inttypes.0:
	.word	typeuint
	.word	typeint
	.word	typeulong
	.word	typelong
	.word	typeullong
	.word	typellong
	.section	.sbss.tentativedefns,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	tentativedefns, @object
	.size	tentativedefns, 4
tentativedefns:
	.zero	4
	.section	.sdata.tentativedefnsend,"aw"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	tentativedefnsend, @object
	.size	tentativedefnsend, 4
tentativedefnsend:
	.word	tentativedefns
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
