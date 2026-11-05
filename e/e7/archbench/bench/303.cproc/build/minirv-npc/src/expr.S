#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"expr.c"
	.option nopic
	.text
	.section	.text.encodechar32,"ax",@progbits
	.align	2
	.type	encodechar32, @function
encodechar32:
	sw	a1,0(a0)
	li	a0,4
	ret
	.size	encodechar32, .-encodechar32
	.section	.text.encodechar8,"ax",@progbits
	.align	2
	.type	encodechar8, @function
encodechar8:
	mv	a5,a0
	beq	a2,zero,.L5
	sb	a1,0(a5)
	li	a0,1
	ret
.L5:
	tail	utf8enc
	.size	encodechar8, .-encodechar8
	.section	.rodata.decodechar.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `isxdigit(*s)' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/expr.c:436  \n"
	.align	2
.LC3:
	.string	"Assertion `isodigit(*s)' failed"
	.align	2
.LC4:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/expr.c:445  \n"
	.align	2
.LC5:
	.string	"%s contains invalid UTF-8"
	.section	.text.decodechar,"ax",@progbits
	.align	2
	.type	decodechar, @function
decodechar:
	addi	sp,sp,-28
	sw	s0,20(sp)
	sw	ra,24(sp)
	sw	s1,16(sp)
	lbu	t1,0(a0)
	mv	s0,a0
	sw	a1,0(sp)
	li	a0,92
	sw	a2,4(sp)
	bne	t1,a0,.L7
	lbu	a4,1(s0)
	li	a3,63
	bleu	a4,a3,.L52
	addi	a3,a4,-92
	andi	a3,a3,0xff
	li	a2,28
	bgtu	a3,a2,.L51
	lla	a2,.L12
	slli	a3,a3,2
	add	a3,a3,a2
	lw	a3,0(a3)
	add	a3,a3,a2
	jr	a3
	.section	.rodata.decodechar,"a",@progbits
	.align	2
	.align	2
.L12:
	.word	.L20-.L12
	.word	.L10-.L12
	.word	.L10-.L12
	.word	.L10-.L12
	.word	.L10-.L12
	.word	.L19-.L12
	.word	.L18-.L12
	.word	.L10-.L12
	.word	.L10-.L12
	.word	.L10-.L12
	.word	.L17-.L12
	.word	.L10-.L12
	.word	.L10-.L12
	.word	.L10-.L12
	.word	.L10-.L12
	.word	.L10-.L12
	.word	.L10-.L12
	.word	.L10-.L12
	.word	.L16-.L12
	.word	.L10-.L12
	.word	.L10-.L12
	.word	.L10-.L12
	.word	.L15-.L12
	.word	.L10-.L12
	.word	.L14-.L12
	.word	.L10-.L12
	.word	.L13-.L12
	.word	.L10-.L12
	.word	.L11-.L12
	.section	.text.decodechar
.L52:
	li	a3,33
	bgtu	a4,a3,.L53
.L10:
	addi	a3,a4,-48
	li	a0,8
	bgtu	a3,a0,.L51
	lbu	a2,2(s0)
	addi	s1,s0,2
	addi	a2,a2,-48
	bgtu	a2,a0,.L39
	lbu	a1,3(s0)
	slli	a3,a3,3
	addi	s1,s0,3
	addi	a1,a1,-48
	add	a3,a3,a2
	bgtu	a1,a0,.L39
	slli	a3,a3,3
	addi	s1,s0,4
	add	a3,a3,a1
.L39:
	lw	a5,4(sp)
	beq	a5,zero,.L23
	li	a2,1
	sb	a2,0(a5)
	j	.L23
.L53:
	li	a3,536870912
	addi	a2,a4,-34
	addi	a3,a3,33
	srl	a3,a3,a2
	andi	a3,a3,1
	beq	a3,zero,.L10
.L20:
	mv	a3,a4
	addi	s1,s0,2
	j	.L23
.L7:
	li	a2,4
	mv	a1,s0
	addi	a0,sp,12
	sw	a4,8(sp)
	sw	a3,4(sp)
	call	utf8dec
	li	a2,-1
	lw	a3,4(sp)
	lw	a4,8(sp)
	mv	s1,a0
	beq	a0,a2,.L54
.L40:
	lw	a3,12(sp)
	add	s1,s0,s1
.L23:
	lw	a5,0(sp)
	sub	a0,s1,s0
	lw	ra,24(sp)
	lw	s0,20(sp)
	sw	a3,0(a5)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L16:
	addi	s1,s0,2
	li	a3,10
	j	.L23
.L15:
	addi	s1,s0,2
	li	a3,13
	j	.L23
.L14:
	addi	s1,s0,2
	li	a3,9
	j	.L23
.L13:
	addi	s1,s0,2
	li	a3,11
	j	.L23
.L18:
	addi	s1,s0,2
	li	a3,8
	j	.L23
.L17:
	addi	s1,s0,2
	li	a3,12
	j	.L23
.L19:
	addi	s1,s0,2
	li	a3,7
	j	.L23
.L11:
	lbu	a0,2(s0)
	addi	s1,s0,2
	call	isxdigit
	beq	a0,zero,.L55
	sw	zero,12(sp)
	li	a3,0
	j	.L31
.L29:
	lbu	a0,1(s1)
	add	a3,a3,a2
	sw	a3,12(sp)
	call	isxdigit
	addi	s1,s1,1
	beq	a0,zero,.L30
	lw	a3,12(sp)
.L31:
	lbu	a0,0(s1)
	li	a5,57
	slli	a3,a3,4
	addi	a2,a0,-48
	bleu	a0,a5,.L29
	sw	a3,8(sp)
	call	tolower
	lw	a3,8(sp)
	addi	a2,a0,-87
	j	.L29
.L54:
	mv	a2,a3
	lla	a1,.LC5
	mv	a0,a4
	call	error
	j	.L40
.L30:
	lw	a5,4(sp)
	lw	a3,12(sp)
	beq	a5,zero,.L23
	lw	a5,4(sp)
	li	a2,1
	sb	a2,0(a5)
	j	.L23
.L51:
	lla	s0,.LC0
	li	a0,65
.L34:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L34
	lla	s0,.LC3
	li	a0,65
.L35:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L35
	lla	s0,.LC4
	li	a0,32
.L36:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L36
.L37:
	li	a0,1
	call	halt
.L55:
	lla	s0,.LC0
	li	a0,65
.L25:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L25
	lla	s0,.LC1
	li	a0,65
.L26:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L26
	lla	s0,.LC2
	li	a0,32
.L27:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L27
	j	.L37
	.size	decodechar, .-decodechar
	.section	.text.encodechar16,"ax",@progbits
	.align	2
	.type	encodechar16, @function
encodechar16:
	beq	a2,zero,.L63
	sh	a1,0(a0)
	li	a0,2
	ret
.L63:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	utf16enc
	lw	ra,8(sp)
	slli	a0,a0,1
	addi	sp,sp,12
	jr	ra
	.size	encodechar16, .-encodechar16
	.section	.rodata.mkincdecexpr.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	"operand of '%s' operator must be an lvalue"
	.align	2
.LC7:
	.string	"operand of '%s' operator is const qualified"
	.section	.text.mkincdecexpr,"ax",@progbits
	.align	2
	.type	mkincdecexpr, @function
mkincdecexpr:
	lbu	a5,4(a1)
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	sw	a2,0(sp)
	mv	s1,a1
	mv	s0,a0
	beq	a5,zero,.L71
	lw	a5,12(s1)
	andi	a5,a5,2
	bne	a5,zero,.L72
.L66:
	lw	a3,8(s1)
	li	a0,40
	sw	a3,4(sp)
	call	xmalloc
	lw	a3,4(sp)
	lw	a4,0(sp)
	lw	ra,16(sp)
	sw	s0,16(a0)
	lw	s0,12(sp)
	sw	a3,8(a0)
	li	a3,5
	sw	s1,20(a0)
	sw	zero,12(a0)
	sw	a3,0(a0)
	sh	zero,4(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sb	a4,32(a0)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L71:
	slli	a3,a0,2
	lla	a5,tokstr
	add	a5,a5,a3
	lw	a2,0(a5)
	lla	a1,.LC6
	lla	a0,tok+8
	call	error
	lw	a5,12(s1)
	andi	a5,a5,2
	beq	a5,zero,.L66
.L72:
	slli	a3,s0,2
	lla	a5,tokstr
	add	a5,a5,a3
	lw	a2,0(a5)
	lla	a1,.LC7
	lla	a0,tok+8
	call	error
	j	.L66
	.size	mkincdecexpr, .-mkincdecexpr
	.section	.text.commonreal,"ax",@progbits
	.align	2
	.type	commonreal, @function
commonreal:
	lw	a5,0(a0)
	addi	sp,sp,-20
	sw	s1,8(sp)
	lw	a3,0(a5)
	sw	a1,0(sp)
	sw	ra,16(sp)
	sw	s0,12(sp)
	li	a4,4
	mv	s1,a0
	li	a1,-1
	lw	a0,8(a5)
	bne	a3,a4,.L74
	lh	a4,32(a5)
	lw	a1,16(a0)
	lh	a5,34(a5)
	slli	a1,a1,3
	add	a5,a4,a5
	sub	a1,a1,a5
.L74:
	lw	a5,0(sp)
	li	a4,4
	li	a3,-1
	lw	a5,0(a5)
	lw	t1,0(a5)
	lw	a2,8(a5)
	bne	t1,a4,.L75
	lh	a4,32(a5)
	lw	a3,16(a2)
	lh	a5,34(a5)
	slli	a3,a3,3
	add	a5,a4,a5
	sub	a3,a3,a5
.L75:
	call	typecommonreal
	lw	a5,0(s1)
	mv	a1,a0
	mv	s0,a0
	lw	a0,8(a5)
	sw	a5,4(sp)
	call	typecompatible
	lw	a5,4(sp)
	bne	a0,zero,.L76
	li	a0,40
	call	xmalloc
	lw	a5,4(sp)
	sw	zero,12(a0)
	sw	s0,8(a0)
	sw	a5,20(a0)
	li	a5,8
	sw	a5,0(a0)
	sh	zero,4(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	mv	a5,a0
.L76:
	sw	a5,0(s1)
	lw	a5,0(sp)
	mv	a1,s0
	lw	s1,0(a5)
	lw	a0,8(s1)
	call	typecompatible
	bne	a0,zero,.L77
	li	a0,40
	call	xmalloc
	li	a5,8
	sw	s1,20(a0)
	sw	zero,12(a0)
	sw	s0,8(a0)
	sw	a5,0(a0)
	sh	zero,4(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	mv	s1,a0
.L77:
	lw	a5,0(sp)
	lw	ra,16(sp)
	mv	a0,s0
	lw	s0,12(sp)
	sw	s1,0(a5)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
	.size	commonreal, .-commonreal
	.section	.rodata.mkunaryexpr.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	"'&' operand is not an lvalue or function designator"
	.align	2
.LC9:
	.string	"cannot take address of bit-field"
	.align	2
.LC10:
	.string	"cannot dereference non-pointer"
	.align	2
.LC11:
	.string	"internal error: unknown unary operator %d"
	.section	.text.mkunaryexpr,"ax",@progbits
	.align	2
	.type	mkunaryexpr, @function
mkunaryexpr:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	li	a5,72
	mv	s0,a1
	beq	a0,a5,.L83
	li	a5,73
	beq	a0,a5,.L84
	mv	a1,a0
	lla	a0,.LC11
	call	fatal
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
.L83:
	lbu	a5,5(a1)
	bne	a5,zero,.L98
.L86:
	lbu	a5,4(s0)
	bne	a5,zero,.L87
	lw	a5,8(s0)
	li	a4,2
	lw	a5,0(a5)
	addi	a5,a5,-11
	bleu	a5,a4,.L87
	lla	a1,.LC8
	lla	a0,tok+8
	call	error
.L87:
	lw	a4,0(s0)
	li	a5,4
	beq	a4,a5,.L99
.L88:
	lw	a1,12(s0)
	lw	a0,8(s0)
	call	mkpointertype
	mv	s1,a0
	li	a0,40
	call	xmalloc
	lw	ra,8(sp)
	li	a5,7
	sw	s0,20(a0)
	lw	s0,4(sp)
	sw	a5,0(a0)
	li	a5,72
	sw	s1,8(a0)
	sw	zero,12(a0)
	sh	zero,4(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	a5,16(a0)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L84:
	lw	a5,8(a1)
	li	a4,9
	lw	a3,0(a5)
	bne	a3,a4,.L100
	lw	a3,0(s0)
	li	a4,7
	lw	s1,28(a5)
	bne	a3,a4,.L91
.L101:
	lw	a4,16(s0)
	li	a5,72
	bne	a4,a5,.L91
	lw	a0,20(s0)
	sw	s1,8(a0)
	j	.L92
.L91:
	li	a0,40
	call	xmalloc
	sw	s1,8(a0)
	lw	a5,8(s0)
	li	a4,7
	lw	a5,40(a5)
	sb	zero,5(a0)
	sw	a4,0(a0)
	sw	a5,12(a0)
	li	a5,1
	sb	a5,4(a0)
	li	a5,73
	sw	s0,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	a5,16(a0)
.L92:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	decay
.L100:
	lla	a1,.LC10
	lla	a0,tok+8
	call	error
	lw	a5,8(s0)
	lw	a3,0(s0)
	li	a4,7
	lw	s1,28(a5)
	beq	a3,a4,.L101
	j	.L91
.L98:
	lw	s1,20(a1)
	mv	a0,a1
	call	free
	mv	s0,s1
	j	.L86
.L99:
	lla	a1,.LC9
	lla	a0,tok+8
	call	error
	j	.L88
	.size	mkunaryexpr, .-mkunaryexpr
	.section	.text.decay,"ax",@progbits
	.align	2
	.type	decay, @function
decay:
	addi	sp,sp,-16
	sw	s1,4(sp)
	lw	s1,8(a0)
	sw	s0,8(sp)
	sw	ra,12(sp)
	lw	a5,0(s1)
	li	a4,10
	lw	a3,12(a0)
	mv	s0,a0
	beq	a5,a4,.L103
	li	a4,11
	bne	a5,a4,.L105
	mv	a1,a0
	li	a0,72
	call	mkunaryexpr
	li	a5,1
	mv	s0,a0
	sb	a5,5(a0)
.L105:
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L103:
	mv	a1,a0
	li	a0,72
	sw	a3,0(sp)
	call	mkunaryexpr
	lw	a1,40(s1)
	lw	a3,0(sp)
	mv	s0,a0
	lw	a0,28(s1)
	or	a1,a3,a1
	call	mkpointertype
	li	a5,1
	sw	a0,8(s0)
	lw	ra,12(sp)
	sb	a5,5(s0)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	decay, .-decay
	.section	.text.delexpr,"ax",@progbits
	.align	2
	.globl	delexpr
	.hidden	delexpr
	.type	delexpr, @function
delexpr:
	lw	a5,0(a0)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	li	a4,9
	addi	a5,a5,-3
	mv	s0,a0
	bgtu	a5,a4,.L108
	lla	a4,.L110
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.delexpr,"a",@progbits
	.align	2
	.align	2
.L110:
	.word	.L114-.L110
	.word	.L113-.L110
	.word	.L113-.L110
	.word	.L108-.L110
	.word	.L113-.L110
	.word	.L113-.L110
	.word	.L126-.L110
	.word	.L111-.L110
	.word	.L108-.L110
	.word	.L125-.L110
	.section	.text.delexpr
.L125:
	lw	a0,20(s0)
	beq	a0,zero,.L108
.L115:
	lw	a5,24(a0)
	sw	a5,20(s0)
	call	delexpr
	lw	a0,20(s0)
	bne	a0,zero,.L115
.L108:
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	free
.L111:
	lw	a0,20(a0)
	call	delexpr
.L126:
	lw	a0,32(s0)
	call	delexpr
	lw	a0,36(s0)
	call	delexpr
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	free
.L113:
	lw	a0,20(a0)
	call	delexpr
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	free
.L114:
	lw	a0,20(a0)
	call	delexpr
	lw	a0,32(s0)
	beq	a0,zero,.L108
.L117:
	lw	a5,24(a0)
	sw	a5,32(s0)
	call	delexpr
	lw	a0,32(s0)
	bne	a0,zero,.L117
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	free
	.size	delexpr, .-delexpr
	.section	.rodata.exprassign.str1.4,"aMS",@progbits,1
	.align	2
.LC12:
	.string	"Assertion `t->prop & PROPARITH' failed"
	.align	2
.LC13:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/expr.c:204  \n"
	.align	2
.LC14:
	.string	"assignment to bool must be from arithmetic, pointer, or nullptr_t type"
	.align	2
.LC15:
	.string	"assignment to pointer must be from pointer or null pointer constant"
	.align	2
.LC16:
	.string	"base types of pointer assignment must be compatible or void"
	.align	2
.LC17:
	.string	"assignment to pointer discards qualifiers"
	.align	2
.LC18:
	.string	"assignment to nullptr_t must be from null pointer constant or expression with type nullptr_t"
	.align	2
.LC19:
	.string	"assignment to %s type must be from compatible type"
	.align	2
.LC20:
	.string	"assignment to arithmetic type must be from arithmetic type"
	.section	.text.exprassign,"ax",@progbits
	.align	2
	.globl	exprassign
	.hidden	exprassign
	.type	exprassign, @function
exprassign:
	lw	a5,0(a1)
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	li	a3,13
	lw	a4,8(a0)
	mv	s1,a1
	mv	s0,a0
	bgtu	a5,a3,.L128
	li	a3,11
	bgtu	a5,a3,.L129
	li	a3,2
	beq	a5,a3,.L130
	li	a3,9
	bne	a5,a3,.L132
	lw	a1,0(a0)
	li	a2,1
	lw	a3,0(a4)
	beq	a1,a2,.L174
.L135:
	li	a5,9
	bne	a3,a5,.L137
.L141:
	lw	a0,28(s1)
	lla	a5,typevoid
	beq	a0,a5,.L143
	lw	a1,28(a4)
	beq	a1,a5,.L143
.L156:
	sw	a4,0(sp)
	call	typecompatible
	lw	a4,0(sp)
	beq	a0,zero,.L175
.L143:
	lw	a4,40(a4)
	lw	a5,40(s1)
	and	a5,a4,a5
	beq	a4,a5,.L173
	lla	a1,.LC17
	lla	a0,tok+8
	call	error
	lw	a4,8(s0)
	j	.L134
.L128:
	li	a3,14
	bne	a5,a3,.L132
	lw	a2,0(a0)
	li	a3,1
	bne	a2,a3,.L146
	lw	a3,0(a4)
	beq	a3,a5,.L134
	lw	a5,4(a4)
	andi	a5,a5,2
	bne	a5,zero,.L147
	li	a5,9
	bne	a3,a5,.L146
	lw	a3,28(a4)
	lla	a5,typevoid
	beq	a3,a5,.L147
.L146:
	lla	a1,.LC18
	lla	a0,tok+8
	call	error
	lw	a4,8(s0)
	j	.L134
.L129:
	mv	a1,a4
	mv	a0,s1
	call	typecompatible
	beq	a0,zero,.L149
.L173:
	lw	a4,8(s0)
.L134:
	mv	a1,s1
	mv	a0,a4
	call	typecompatible
	bne	a0,zero,.L161
	li	a0,40
	call	xmalloc
	li	a5,8
	sw	s0,20(a0)
	sw	zero,12(a0)
	sw	s1,8(a0)
	sw	a5,0(a0)
	sh	zero,4(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	mv	s0,a0
.L161:
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L132:
	lw	a5,4(s1)
	andi	a5,a5,8
	beq	a5,zero,.L176
	lw	a5,4(a4)
	andi	a5,a5,8
	bne	a5,zero,.L134
	lla	a1,.LC20
	lla	a0,tok+8
	call	error
	j	.L173
.L130:
	lw	a5,4(a4)
	andi	a5,a5,8
	bne	a5,zero,.L134
	lw	a5,0(a4)
	li	a3,9
	beq	a5,a3,.L134
	li	a3,14
	beq	a5,a3,.L134
	lla	a1,.LC14
	lla	a0,tok+8
	call	error
	lw	a4,8(s0)
	j	.L134
.L174:
	li	a2,14
	beq	a3,a2,.L134
	lw	a2,4(a4)
	andi	a2,a2,2
	bne	a2,zero,.L136
	bne	a3,a5,.L137
	lw	a1,28(a4)
	lla	a5,typevoid
	beq	a1,a5,.L177
	lw	a0,28(s1)
	bne	a0,a5,.L156
	j	.L143
.L149:
	lw	a4,0(s1)
	lla	a5,tokstr
	lla	a1,.LC19
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a2,0(a5)
	lla	a0,tok+8
	call	error
	lw	a4,8(s0)
	j	.L134
.L137:
	lla	a1,.LC15
	lla	a0,tok+8
	sw	a4,0(sp)
	call	error
	lw	a4,0(sp)
	j	.L141
.L147:
	lw	a5,32(s0)
	lw	a3,36(s0)
	or	a5,a5,a3
	beq	a5,zero,.L134
	j	.L146
.L136:
	lw	a5,32(a0)
	lw	a2,36(a0)
	or	a5,a5,a2
	beq	a5,zero,.L134
	j	.L135
.L175:
	lla	a1,.LC16
	lla	a0,tok+8
	call	error
	lw	a4,0(sp)
	j	.L143
.L176:
	lla	s0,.LC0
	li	a0,65
.L151:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L151
	lla	s0,.LC12
	li	a0,65
.L152:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L152
	lla	s0,.LC13
	li	a0,32
.L153:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L153
	li	a0,1
	call	halt
.L177:
	lw	a5,32(a0)
	lw	a3,36(a0)
	or	a5,a5,a3
	beq	a5,zero,.L134
	j	.L143
	.size	exprassign, .-exprassign
	.section	.text.exprpromote,"ax",@progbits
	.align	2
	.globl	exprpromote
	.hidden	exprpromote
	.type	exprpromote, @function
exprpromote:
	lw	a4,0(a0)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	li	a5,4
	mv	s0,a0
	li	a1,-1
	lw	a0,8(a0)
	bne	a4,a5,.L179
	lw	a1,16(a0)
	lh	a5,32(s0)
	lh	a4,34(s0)
	slli	a1,a1,3
	add	a5,a5,a4
	sub	a1,a1,a5
.L179:
	call	typepromote
	mv	s1,a0
	lw	a0,8(s0)
	mv	a1,s1
	call	typecompatible
	bne	a0,zero,.L180
	li	a0,40
	call	xmalloc
	li	a4,8
	sw	s0,20(a0)
	sw	zero,12(a0)
	sw	s1,8(a0)
	sw	a4,0(a0)
	sh	zero,4(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	mv	s0,a0
.L180:
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	exprpromote, .-exprpromote
	.section	.rodata.mkbinaryexpr.str1.4,"aMS",@progbits,1
	.align	2
.LC21:
	.string	"left operand of '%s' operator must be scalar"
	.align	2
.LC22:
	.string	"right operand of '%s' operator must be scalar"
	.align	2
.LC23:
	.string	"invalid operands to '%s' operator"
	.align	2
.LC24:
	.string	"pointer operands to '%s' operator are to incompatible types"
	.align	2
.LC25:
	.string	"pointer operands to '%s' operator must be to compatible object types"
	.align	2
.LC26:
	.string	"invalid operands to '+' operator"
	.align	2
.LC27:
	.string	"pointer operand to '+' must be to complete object type"
	.align	2
.LC28:
	.string	"invalid operands to '-' operator"
	.align	2
.LC29:
	.string	"pointer operand to '-' must be to complete object type"
	.align	2
.LC30:
	.string	"pointer operands to '-' are to incompatible types"
	.align	2
.LC31:
	.string	"operands to '%%' operator must be integer"
	.align	2
.LC32:
	.string	"operands to '%s' operator must be arithmetic"
	.align	2
.LC33:
	.string	"operands to '%s' operator must be integer"
	.align	2
.LC34:
	.string	"internal error: unknown binary operator %d"
	.section	.text.mkbinaryexpr,"ax",@progbits
	.align	2
	.type	mkbinaryexpr, @function
mkbinaryexpr:
	addi	sp,sp,-44
	sw	ra,40(sp)
	sw	s1,32(sp)
	lw	ra,8(a3)
	lw	s1,8(a2)
	sw	s0,36(sp)
	mv	a4,a2
	sw	a2,28(sp)
	sw	a3,24(sp)
	addi	a5,a1,-72
	li	a2,19
	mv	t2,a3
	lw	t1,4(ra)
	lw	a3,4(s1)
	mv	s0,a1
	bgtu	a5,a2,.L185
	lla	a2,.L187
	slli	a5,a5,2
	add	a5,a5,a2
	lw	a5,0(a5)
	mv	t0,a0
	add	a5,a5,a2
	jr	a5
	.section	.rodata.mkbinaryexpr,"a",@progbits
	.align	2
	.align	2
.L187:
	.word	.L240-.L187
	.word	.L193-.L187
	.word	.L195-.L187
	.word	.L194-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L193-.L187
	.word	.L192-.L187
	.word	.L191-.L187
	.word	.L191-.L187
	.word	.L190-.L187
	.word	.L190-.L187
	.word	.L190-.L187
	.word	.L190-.L187
	.word	.L189-.L187
	.word	.L189-.L187
	.word	.L240-.L187
	.word	.L240-.L187
	.word	.L186-.L187
	.word	.L186-.L187
	.section	.text.mkbinaryexpr
.L193:
	andi	a3,a3,8
	beq	a3,zero,.L239
	andi	s1,t1,8
	bne	s1,zero,.L240
.L239:
	slli	a4,s0,2
	lla	a5,tokstr
	add	a5,a5,a4
	lw	a2,0(a5)
	lla	a1,.LC32
	mv	a0,t0
	call	error
.L240:
	addi	a1,sp,24
	addi	a0,sp,28
	call	commonreal
	mv	s1,a0
.L198:
	li	a0,40
	call	xmalloc
	lw	a3,28(sp)
	lw	a4,24(sp)
	lw	ra,40(sp)
	sw	s0,16(a0)
	lw	s0,36(sp)
	li	a2,9
	sw	s1,8(a0)
	sw	zero,12(a0)
	sw	a2,0(a0)
	sh	zero,4(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	a3,32(a0)
	sw	a4,36(a0)
	lw	s1,32(sp)
	addi	sp,sp,44
	jr	ra
.L190:
	andi	a3,a3,4
	beq	a3,zero,.L215
	andi	a5,t1,4
	bne	a5,zero,.L216
.L215:
	lw	a5,0(s1)
	li	a4,9
	bne	a5,a4,.L217
	lw	a4,0(ra)
	bne	a4,a5,.L217
	lw	a1,28(ra)
	lw	a0,28(s1)
	sw	t0,0(sp)
	call	typecompatible
	lw	t0,0(sp)
	beq	a0,zero,.L218
	lw	a4,28(sp)
	li	a5,11
	lw	a4,8(a4)
	lw	a4,28(a4)
	lw	a4,0(a4)
	bne	a4,a5,.L284
.L218:
	slli	a4,s0,2
	lla	a5,tokstr
	add	a5,a5,a4
	lw	a2,0(a5)
	lla	a1,.LC25
	mv	a0,t0
	call	error
	lla	s1,typeint
	j	.L198
.L186:
	andi	a3,a3,16
	beq	a3,zero,.L287
.L196:
	andi	s1,t1,16
	beq	s1,zero,.L197
.L284:
	lla	s1,typeint
	j	.L198
.L189:
	andi	a3,a3,8
	beq	a3,zero,.L199
	andi	a5,t1,8
	bne	a5,zero,.L216
.L199:
	lw	a3,0(s1)
	li	a5,9
	beq	a3,a5,.L200
	lw	a3,0(ra)
	sw	t2,28(sp)
	sw	a4,24(sp)
	mv	t2,a4
	beq	a3,a5,.L200
	slli	a4,s0,2
	lla	a5,tokstr
	add	a5,a5,a4
	lw	a2,0(a5)
	mv	a0,t0
	lla	a1,.LC23
	sw	t0,0(sp)
	call	error
	lw	t2,24(sp)
	lw	t0,0(sp)
.L200:
	mv	a0,t2
	sw	t0,0(sp)
	call	eval
	lw	a4,0(a0)
	li	a5,1
	lw	t0,0(sp)
	bne	a4,a5,.L201
	lw	a4,8(a0)
	li	a5,14
	lw	a3,0(a4)
	beq	a3,a5,.L202
	lw	a5,4(a4)
	andi	a5,a5,2
	bne	a5,zero,.L203
	li	a5,9
	bne	a3,a5,.L201
	lw	a4,28(a4)
	lla	a5,typevoid
	bne	a4,a5,.L201
.L203:
	lw	a5,32(a0)
	lw	a4,36(a0)
	or	a5,a5,a4
	bne	a5,zero,.L201
.L202:
	lw	s1,24(sp)
	lw	a5,28(sp)
	lw	a0,8(s1)
	lw	a1,8(a5)
	sw	a1,0(sp)
	call	typecompatible
	bne	a0,zero,.L213
	li	a0,40
	call	xmalloc
	lw	a1,0(sp)
	sw	s1,20(a0)
	sw	zero,12(a0)
	sw	a1,8(a0)
.L286:
	li	a5,8
	sw	a5,0(a0)
	sh	zero,4(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	mv	s1,a0
.L213:
	sw	s1,24(sp)
	lla	s1,typeint
	j	.L198
.L191:
	andi	a3,a3,2
	beq	a3,zero,.L241
	andi	s1,t1,2
	bne	s1,zero,.L242
.L241:
	slli	a4,s0,2
	lla	a5,tokstr
	add	a5,a5,a4
	lw	a2,0(a5)
	lla	a1,.LC33
	mv	a0,t0
	call	error
	lw	a4,28(sp)
.L242:
	mv	a0,a4
	call	exprpromote
	mv	a5,a0
	lw	a0,24(sp)
	sw	a5,28(sp)
	call	exprpromote
	lw	a5,28(sp)
	sw	a0,24(sp)
	lw	s1,8(a5)
	j	.L198
.L194:
	andi	a3,a3,8
	beq	a3,zero,.L227
	andi	a5,t1,8
	bne	a5,zero,.L240
.L227:
	lw	a5,0(s1)
	li	a4,9
	andi	a3,t1,2
	bne	a5,a4,.L228
	bne	a3,zero,.L229
	lw	a4,0(ra)
	beq	a4,a5,.L229
.L228:
	mv	a0,t0
	lla	a1,.LC28
	sw	a3,8(sp)
	sw	t0,0(sp)
	call	error
	lw	a5,28(sp)
	lw	a3,8(sp)
	lw	t0,0(sp)
	lw	s1,8(a5)
.L229:
	lw	a5,28(s1)
	lbu	a4,44(a5)
	bne	a4,zero,.L230
	lw	a4,0(a5)
	li	a5,11
	beq	a4,a5,.L230
.L231:
	lw	a2,24(sp)
	sw	a2,8(sp)
	lw	a0,8(a2)
	bne	a3,zero,.L288
	lw	a1,28(a0)
	lw	a0,28(s1)
	sw	t0,0(sp)
	call	typecompatible
	lw	t0,0(sp)
	beq	a0,zero,.L289
.L234:
	lw	s0,28(sp)
	lla	a1,typelong
	sw	t0,0(sp)
	lw	a0,8(s0)
	call	typecompatible
	lw	t0,0(sp)
	bne	a0,zero,.L235
	li	a0,40
	call	xmalloc
	lla	a5,typelong
	lw	t0,0(sp)
	sw	a5,8(a0)
	li	a5,8
	sw	s0,20(a0)
	sw	zero,12(a0)
	sw	a5,0(a0)
	sh	zero,4(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	mv	s0,a0
.L235:
	lw	s1,24(sp)
	lla	a1,typelong
	sw	t0,0(sp)
	lw	a0,8(s1)
	call	typecompatible
	lw	t0,0(sp)
	bne	a0,zero,.L236
	li	a0,40
	call	xmalloc
	lla	a5,typelong
	lw	t0,0(sp)
	sw	a5,8(a0)
	li	a5,8
	sw	s1,20(a0)
	sw	zero,12(a0)
	sw	a5,0(a0)
	sh	zero,4(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	mv	s1,a0
.L236:
	mv	a2,s0
	mv	a3,s1
	li	a1,75
	mv	a0,t0
	call	mkbinaryexpr
	lw	a5,28(sp)
	mv	a3,a0
	li	a0,40
	lw	a5,8(a5)
	sw	a3,8(sp)
	lla	s1,typelong
	lw	a5,28(a5)
	li	s0,78
	lw	a4,16(a5)
	lw	a5,20(a5)
	sw	a4,0(sp)
	sw	a5,4(sp)
	call	xmalloc
	lw	a4,0(sp)
	lw	a5,4(sp)
	lw	a3,8(sp)
	li	a2,1
	sw	a2,0(a0)
	sw	zero,12(a0)
	sw	s1,8(a0)
	sh	zero,4(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	a4,32(a0)
	sw	a5,36(a0)
	sw	a0,24(sp)
	sw	a3,28(sp)
	j	.L198
.L192:
	andi	a3,a3,2
	beq	a3,zero,.L237
	andi	s1,t1,2
	bne	s1,zero,.L240
.L237:
	lla	a1,.LC31
	mv	a0,t0
	call	error
	j	.L240
.L195:
	andi	a5,a3,8
	beq	a5,zero,.L219
	andi	a5,t1,8
	bne	a5,zero,.L240
.L219:
	lw	a2,0(ra)
	li	a5,9
	beq	a2,a5,.L290
	lw	a4,0(s1)
	beq	a4,a5,.L221
.L223:
	mv	a0,t0
	lla	a1,.LC26
	sw	t0,0(sp)
	call	error
	lw	t0,0(sp)
.L222:
	lw	a5,28(sp)
	lw	s1,8(a5)
	lw	a5,28(s1)
	lbu	a4,44(a5)
	bne	a4,zero,.L224
	lw	a4,0(a5)
	li	a5,11
	beq	a4,a5,.L224
.L225:
	lw	a2,24(sp)
	lla	a1,typeulong
	sw	t0,8(sp)
	lw	a0,8(a2)
	sw	a2,0(sp)
	call	typecompatible
	lw	a2,0(sp)
	lw	t0,8(sp)
	beq	a0,zero,.L291
.L226:
	lw	a5,28(s1)
	li	a0,40
	sw	t0,16(sp)
	lw	a4,16(a5)
	lw	a5,20(a5)
	sw	a2,8(sp)
	sw	a4,0(sp)
	sw	a5,4(sp)
	call	xmalloc
	lla	a5,typeulong
	sw	a5,8(a0)
	lw	a4,0(sp)
	lw	a5,4(sp)
	lw	t0,16(sp)
	lw	a2,8(sp)
	li	a1,1
	sw	a1,0(a0)
	mv	a3,a0
	sw	zero,12(a0)
	sh	zero,4(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	a4,32(a0)
	sw	a5,36(a0)
	li	a1,73
	mv	a0,t0
	call	mkbinaryexpr
	sw	a0,24(sp)
	j	.L198
.L185:
	mv	a1,s0
	lla	a0,.LC34
	call	fatal
	li	s1,0
	j	.L198
.L217:
	slli	a4,s0,2
	lla	a5,tokstr
	add	a5,a5,a4
	lw	a2,0(a5)
	lla	a1,.LC23
	mv	a0,t0
	call	error
	lla	s1,typeint
	j	.L198
.L201:
	lw	a0,28(sp)
	sw	t0,0(sp)
	call	eval
	lw	a4,0(a0)
	li	a5,1
	lw	t0,0(sp)
	bne	a4,a5,.L205
	lw	a4,8(a0)
	li	a5,14
	lw	a3,0(a4)
	beq	a3,a5,.L206
	lw	a5,4(a4)
	andi	a5,a5,2
	bne	a5,zero,.L207
	li	a5,9
	bne	a3,a5,.L205
	lw	a4,28(a4)
	lla	a5,typevoid
	bne	a4,a5,.L205
.L207:
	lw	a5,32(a0)
	lw	a4,36(a0)
	or	a5,a5,a4
	bne	a5,zero,.L205
.L206:
	lw	s1,28(sp)
	lw	a5,24(sp)
	lw	a0,8(s1)
	lw	a1,8(a5)
	sw	a1,0(sp)
	call	typecompatible
	bne	a0,zero,.L208
	li	a0,40
	call	xmalloc
	lw	a1,0(sp)
	li	a5,8
	sw	s1,20(a0)
	sw	zero,12(a0)
	sw	a1,8(a0)
	sw	a5,0(a0)
	sh	zero,4(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	mv	s1,a0
.L208:
	sw	s1,28(sp)
	lla	s1,typeint
	j	.L198
.L205:
	lw	s1,24(sp)
	li	a5,9
	lw	a4,8(s1)
	lw	a3,0(a4)
	bne	a3,a5,.L292
.L209:
	lw	t1,28(sp)
	lw	a1,28(a4)
	li	a5,1
	lw	a3,8(t1)
	lw	t2,0(a1)
	lw	a0,28(a3)
	lw	a2,0(a0)
	beq	a2,a5,.L293
	beq	t2,a5,.L211
.L212:
	sw	t0,0(sp)
	call	typecompatible
	lw	t0,0(sp)
	bne	a0,zero,.L284
	slli	a4,s0,2
	lla	a5,tokstr
	add	a5,a5,a4
	lw	a2,0(a5)
	lla	a1,.LC24
	mv	a0,t0
	call	error
	lla	s1,typeint
	j	.L198
.L288:
	lla	a1,typeulong
	sw	t0,16(sp)
	call	typecompatible
	lla	a5,typeulong
	sw	a5,0(sp)
	lw	t0,16(sp)
	lw	a2,8(sp)
	bne	a0,zero,.L233
	li	a0,40
	call	xmalloc
	lw	a5,0(sp)
	lw	a2,8(sp)
	lw	t0,16(sp)
	sw	a5,8(a0)
	li	a5,8
	sw	a2,20(a0)
	sw	zero,12(a0)
	sw	a5,0(a0)
	sh	zero,4(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	mv	a2,a0
.L233:
	lw	a5,28(s1)
	li	a0,40
	sw	t0,20(sp)
	lw	a4,16(a5)
	lw	a5,20(a5)
	sw	a2,16(sp)
	sw	a4,8(sp)
	sw	a5,12(sp)
	call	xmalloc
	lw	a5,0(sp)
	lw	a4,8(sp)
	lw	t0,20(sp)
	sw	a5,8(a0)
	lw	a5,12(sp)
	lw	a2,16(sp)
	li	a1,1
	sw	a1,0(a0)
	mv	a3,a0
	sw	zero,12(a0)
	sh	zero,4(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	a4,32(a0)
	sw	a5,36(a0)
	li	a1,73
	mv	a0,t0
	call	mkbinaryexpr
	sw	a0,24(sp)
	j	.L198
.L291:
	li	a0,40
	call	xmalloc
	lw	a2,0(sp)
	lla	a5,typeulong
	sw	a5,8(a0)
	li	a5,8
	sw	a2,20(a0)
	lw	t0,8(sp)
	sw	zero,12(a0)
	sw	a5,0(a0)
	sh	zero,4(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	mv	a2,a0
	j	.L226
.L197:
	slli	a4,s0,2
	lla	a5,tokstr
	add	a5,a5,a4
	lw	a2,0(a5)
	lla	a1,.LC22
	mv	a0,t0
	call	error
	lla	s1,typeint
	j	.L198
.L292:
	slli	a4,s0,2
	lla	a5,tokstr
	add	a5,a5,a4
	lw	a2,0(a5)
	mv	a0,t0
	lla	a1,.LC23
	sw	t0,0(sp)
	call	error
	lw	s1,24(sp)
	lw	t0,0(sp)
	lw	a4,8(s1)
	j	.L209
.L293:
	mv	ra,a1
	mv	a5,a4
	sw	s1,28(sp)
	mv	a1,a0
	mv	a4,a3
	sw	t1,24(sp)
	mv	a2,t2
	mv	a0,ra
	mv	a3,a5
	mv	s1,t1
.L211:
	li	a5,11
	beq	a2,a5,.L212
	mv	a1,a3
	mv	a0,a4
	sw	a3,0(sp)
	call	typecompatible
	bne	a0,zero,.L213
	li	a0,40
	call	xmalloc
	lw	a3,0(sp)
	sw	s1,20(a0)
	sw	zero,12(a0)
	sw	a3,8(a0)
	j	.L286
.L230:
	mv	a0,t0
	lla	a1,.LC29
	sw	a3,8(sp)
	sw	t0,0(sp)
	call	error
	lw	a5,28(sp)
	lw	a3,8(sp)
	lw	t0,0(sp)
	lw	s1,8(a5)
	j	.L231
.L224:
	mv	a0,t0
	lla	a1,.LC27
	sw	t0,0(sp)
	call	error
	lw	t0,0(sp)
	j	.L225
.L216:
	addi	a1,sp,24
	addi	a0,sp,28
	call	commonreal
	lla	s1,typeint
	j	.L198
.L290:
	sw	t2,28(sp)
	sw	a4,24(sp)
	mv	t1,a3
.L221:
	andi	s1,t1,2
	beq	s1,zero,.L223
	j	.L222
.L287:
	slli	a4,a1,2
	lla	a5,tokstr
	add	a5,a5,a4
	lw	a2,0(a5)
	lla	a1,.LC21
	sw	t1,8(sp)
	sw	a0,0(sp)
	call	error
	lw	t1,8(sp)
	lw	t0,0(sp)
	j	.L196
.L289:
	lla	a1,.LC30
	lla	a0,tok+8
	call	error
	lw	t0,0(sp)
	j	.L234
	.size	mkbinaryexpr, .-mkbinaryexpr
	.section	.rodata.stringconcat.str1.4,"aMS",@progbits,1
	.align	2
.LC35:
	.string	"Assertion `tok.kind == TSTRINGLIT' failed"
	.align	2
.LC36:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/expr.c:498  \n"
	.align	2
.LC37:
	.string	"Assertion `0' failed"
	.align	2
.LC38:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/expr.c:511  \n"
	.align	2
.LC39:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/expr.c:532  \n"
	.align	2
.LC40:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/expr.c:547  \n"
	.align	2
.LC41:
	.string	"adjacent string literals have differing prefixes"
	.align	2
.LC42:
	.string	"string literal"
	.globl	__udivsi3
	.section	.text.stringconcat,"ax",@progbits
	.align	2
	.globl	stringconcat
	.hidden	stringconcat
	.type	stringconcat, @function
stringconcat:
	addi	sp,sp,-44
	sw	s0,36(sp)
	lla	s0,tok
	lw	a4,0(s0)
	sw	ra,40(sp)
	sw	s1,32(sp)
	li	a5,7
	sw	a0,16(sp)
	sw	a1,8(sp)
	bne	a4,a5,.L367
	la a5, .LANCHOR0+4; sw zero, 0(a5);
	sw	zero,0(sp)
	sw	zero,4(sp)
	j	.L310
.L370:
	li	a3,34
	bne	a5,a3,.L368
.L301:
	li	a1,16
	lla	a0,.LANCHOR0
	call	arrayadd
	lw	a3,16(s0)
	lw	a1,8(s0)
	lw	a2,12(s0)
	addi	a5,s1,1
	sw	a3,8(a0)
	sw	a1,0(a0)
	sw	a2,4(a0)
	sw	a5,12(a0)
	mv	a0,s1
	call	strlen
	lw	a5,0(sp)
	add	s1,a0,a5
	call	next
	lw	a4,0(s0)
	addi	a3,s1,-2
	li	a5,7
	sw	a3,0(sp)
	bne	a4,a5,.L369
.L310:
	lw	s1,20(s0)
	li	a4,85
	lbu	a5,0(s1)
	beq	a5,a4,.L299
	bleu	a5,a4,.L370
	li	a3,117
	bne	a5,a3,.L329
	lbu	a5,1(s1)
	li	a3,56
	addi	s1,s1,1
	beq	a5,a3,.L299
	lw	a4,4(sp)
	li	a5,117
	beq	a4,a5,.L301
.L304:
	lw	a4,4(sp)
	beq	a4,zero,.L305
	lla	a1,.LC41
	lla	a0,tok+8
	sw	a5,4(sp)
	call	error
	j	.L301
.L368:
	li	a3,76
	bne	a5,a3,.L329
.L299:
	lw	a4,4(sp)
	addi	s1,s1,1
	bne	a4,a5,.L304
.L305:
	sw	a5,4(sp)
	j	.L301
.L369:
	lw	a5,8(sp)
	addi	a1,s1,-1
	bne	a5,zero,.L330
	lw	a4,4(sp)
	li	a5,76
	beq	a4,a5,.L312
	bgt	a4,a5,.L313
	bne	a4,zero,.L371
	lla	a5,typechar
	sw	a5,8(sp)
.L311:
	lw	a4,8(sp)
	li	a3,2
	lw	a5,16(a4)
	lw	a4,20(a4)
	beq	a5,a3,.L372
.L340:
	li	a3,4
	bne	a5,a3,.L341
	bne	a4,zero,.L341
	li	a5,4
	sw	a5,12(sp)
	lla	a5,encodechar32
	sw	a5,4(sp)
.L318:
	lw	a2,12(sp)
	li	a0,0
	call	xreallocarray
	lla	a4,.LANCHOR0
	lw	a3,16(sp)
	lw	a5,4(a4)
	sw	a0,20(sp)
	sw	a0,4(a3)
	lw	a4,0(a4)
	mv	s0,a0
	beq	a5,zero,.L338
.L328:
	lw	s1,12(a4)
	li	a3,34
	lbu	a2,0(s1)
	beq	a2,a3,.L326
	lla	a3,.LC42
.L327:
	addi	a2,sp,27
	addi	a1,sp,28
	mv	a0,s1
	sw	a4,0(sp)
	sb	zero,27(sp)
	call	decodechar
	lbu	a2,27(sp)
	lw	a1,28(sp)
	lw	a5,4(sp)
	add	s1,s1,a0
	mv	a0,s0
	jalr	a5
	lbu	a1,0(s1)
	li	a2,34
	lw	a4,0(sp)
	add	s0,s0,a0
	lla	a3,.LC42
	bne	a1,a2,.L327
.L326:
	lla	a3,.LANCHOR0
	lw	a5,0(a3)
	lw	a3,4(a3)
	addi	a4,a4,16
	add	a5,a5,a3
	bne	a4,a5,.L328
.L325:
	lw	a5,4(sp)
	li	a2,0
	li	a1,0
	mv	a0,s0
	jalr	a5
	lw	a5,20(sp)
	lw	a1,12(sp)
	add	a0,s0,a0
	sub	a0,a0,a5
	call	__udivsi3
	lw	a5,16(sp)
	lw	ra,40(sp)
	lw	s0,36(sp)
	sw	a0,0(a5)
	lw	s1,32(sp)
	lw	a0,8(sp)
	addi	sp,sp,44
	jr	ra
.L330:
	lla	a5,typeuchar
	sw	a5,8(sp)
	lw	a4,8(sp)
	li	a3,2
	lw	a5,16(a4)
	lw	a4,20(a4)
	bne	a5,a3,.L340
.L372:
	bne	a4,zero,.L340
	li	a5,2
	sw	a5,12(sp)
	lla	a5,encodechar16
	sw	a5,4(sp)
	j	.L318
.L341:
	li	a3,1
	bne	a5,a3,.L342
	beq	a4,zero,.L363
.L342:
	lla	s0,.LC0
	li	a0,65
.L322:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L322
	lla	s0,.LC37
	li	a0,65
.L323:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L323
	lla	s0,.LC40
	li	a0,32
.L324:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L324
.L309:
	li	a0,1
	call	halt
.L313:
	lw	a4,4(sp)
	li	a5,85
	bne	a4,a5,.L373
	lla	a5,typeuint
	sw	a5,8(sp)
	j	.L311
.L363:
	li	a5,1
	sw	a5,12(sp)
	lla	a5,encodechar8
	sw	a5,4(sp)
	j	.L318
.L373:
	lla	a3,typeushort
	li	a5,117
	sw	a3,8(sp)
	beq	a4,a5,.L311
.L366:
	lla	s0,.LC0
	li	a0,65
.L315:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L315
	lla	s0,.LC37
	li	a0,65
.L316:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L316
	lla	s0,.LC39
	li	a0,32
.L317:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L317
	j	.L309
.L371:
	lla	a3,typeuchar
	li	a5,56
	sw	a3,8(sp)
	beq	a4,a5,.L311
	j	.L366
.L338:
	lw	s0,20(sp)
	j	.L325
.L312:
	la a5, targ; lw a5, 0(a5);
	lw	a5,8(a5)
	sw	a5,8(sp)
	j	.L311
.L329:
	lla	s0,.LC0
	li	a0,65
.L306:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L306
	lla	s0,.LC37
	li	a0,65
.L307:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L307
	lla	s0,.LC38
	li	a0,32
.L308:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L308
	j	.L309
.L367:
	lla	s0,.LC0
	li	a0,65
.L296:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L296
	lla	s0,.LC35
	li	a0,65
.L297:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L297
	lla	s0,.LC36
	li	a0,32
.L298:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L298
	j	.L309
	.size	stringconcat, .-stringconcat
	.section	.text.expr,"ax",@progbits
	.align	2
	.globl	expr
	.hidden	expr
	.type	expr, @function
expr:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s1,a0
	mv	s0,sp
	j	.L376
.L381:
	call	next
.L376:
	mv	a0,s1
	call	assignexpr
	lla	a5,tok
	lw	a5,0(a5)
	li	a4,108
	sw	a0,0(s0)
	addi	s0,a0,24
	beq	a5,a4,.L381
	lw	s0,0(sp)
	lw	a4,24(s0)
	mv	a5,s0
	beq	a4,zero,.L374
	lw	s1,8(a0)
	li	a0,40
	call	xmalloc
	li	a4,12
	mv	a5,a0
	sw	zero,12(a0)
	sw	s1,8(a0)
	sw	a4,0(a0)
	sh	zero,4(a0)
	sw	s0,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
.L374:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	mv	a0,a5
	addi	sp,sp,16
	jr	ra
	.size	expr, .-expr
	.section	.rodata.postfixexpr.str1.4,"aMS",@progbits,1
	.align	2
.LC43:
	.string	"Assertion `*src == '\\''' failed"
	.align	2
.LC44:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/expr.c:661  \n"
	.align	2
.LC45:
	.string	""
	.align	2
.LC46:
	.string	"union"
	.align	2
.LC47:
	.string	"struct"
	.align	2
.LC48:
	.string	".pP"
	.align	2
.LC49:
	.string	".eE"
	.align	2
.LC50:
	.string	"undeclared identifier: %s"
	.align	2
.LC51:
	.string	"character constant"
	.align	2
.LC52:
	.string	"character constant contains more than one character: %c"
	.align	2
.LC53:
	.string	"floating constants are not supported"
	.align	2
.LC54:
	.string	"invalid integer constant '%s'"
	.align	2
.LC55:
	.string	"no suitable type for constant '%s'"
	.align	2
.LC56:
	.string	"after expression"
	.align	2
.LC57:
	.string	"after '_Generic'"
	.align	2
.LC58:
	.string	"after generic selector expression"
	.align	2
.LC59:
	.string	"multiple default expressions in generic association list"
	.align	2
.LC60:
	.string	"after 'default'"
	.align	2
.LC61:
	.string	"expected typename for generic association"
	.align	2
.LC62:
	.string	"generic association must have object type"
	.align	2
.LC63:
	.string	"generic association must have complete type"
	.align	2
.LC64:
	.string	"generic association has variably modified type"
	.align	2
.LC65:
	.string	"after type name"
	.align	2
.LC66:
	.string	"generic selector matches multiple associations"
	.align	2
.LC67:
	.string	"after generic assocation list"
	.align	2
.LC68:
	.string	"generic selector matches no associations and no default was specified"
	.align	2
.LC69:
	.string	"expected primary expression"
	.align	2
.LC70:
	.string	"either array or index must be pointer type"
	.align	2
.LC71:
	.string	"array is pointer to incomplete type"
	.align	2
.LC72:
	.string	"index is not an integer type"
	.align	2
.LC73:
	.string	"after array index"
	.align	2
.LC74:
	.string	"after ','"
	.align	2
.LC75:
	.string	"type is not a struct/union type"
	.align	2
.LC76:
	.string	"struct/union has no member named '%s'"
	.align	2
.LC77:
	.string	"index designator is only valid for array types"
	.align	2
.LC78:
	.string	"for index designator"
	.globl	__muldi3
	.align	2
.LC79:
	.string	"member designator only valid for struct/union types"
	.align	2
.LC80:
	.string	"for member designator"
	.align	2
.LC81:
	.string	"%s has no member named '%s'"
	.align	2
.LC82:
	.string	"va_arg argument must have type va_list"
	.align	2
.LC83:
	.string	"after va_list"
	.align	2
.LC84:
	.string	"va_copy destination must have type va_list"
	.align	2
.LC85:
	.string	"after target va_list"
	.align	2
.LC86:
	.string	"va_copy source must have type va_list"
	.align	2
.LC87:
	.string	"va_end argument must have type va_list"
	.align	2
.LC88:
	.string	"va_start argument must have type va_list"
	.align	2
.LC89:
	.string	"internal error; unknown builtin"
	.align	2
.LC90:
	.string	"after builtin parameters"
	.align	2
.LC91:
	.string	"called object is not a function"
	.align	2
.LC92:
	.string	"or ')' after function call argument"
	.align	2
.LC93:
	.string	"too many arguments for function call"
	.align	2
.LC94:
	.string	"not enough arguments for function call"
	.align	2
.LC95:
	.string	"'%s' operator must be applied to pointer to struct/union"
	.align	2
.LC96:
	.string	"expected identifier after '%s' operator"
	.align	2
.LC97:
	.string	"invalid integer constant suffix '%s'"
	.section	.text.postfixexpr,"ax",@progbits
	.align	2
	.type	postfixexpr, @function
postfixexpr:
	addi	sp,sp,-72
	addi	a4,sp,47
	andi	a4,a4,-8
	sw	s0,64(sp)
	lla	a5,tok
	sw	ra,68(sp)
	sw	s1,60(sp)
	sw	a0,4(sp)
	sw	a4,16(sp)
	lw	a5,0(a5)
	mv	s0,a1
	beq	a1,zero,.L570
.L383:
	mv	s1,s0
.L435:
	lla	a5,tok
	lw	s0,0(a5)
	li	a4,9
	addi	a5,s0,-62
	bgtu	a5,a4,.L524
.L571:
	lla	a4,.L438
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.postfixexpr,"a",@progbits
	.align	2
	.align	2
.L438:
	.word	.L442-.L438
	.word	.L524-.L438
	.word	.L441-.L438
	.word	.L524-.L438
	.word	.L524-.L438
	.word	.L524-.L438
	.word	.L440-.L438
	.word	.L439-.L438
	.word	.L437-.L438
	.word	.L437-.L438
	.section	.text.postfixexpr
.L437:
	mv	a1,s1
	li	a2,1
	mv	a0,s0
	call	mkincdecexpr
	mv	s1,a0
	call	next
	lla	a5,tok
	lw	s0,0(a5)
	li	a4,9
	addi	a5,s0,-62
	bleu	a5,a4,.L571
.L524:
	lw	ra,68(sp)
	lw	s0,64(sp)
	mv	a0,s1
	lw	s1,60(sp)
	addi	sp,sp,72
	jr	ra
.L440:
	mv	a1,s1
	li	a0,72
	call	mkunaryexpr
	lla	a5,tok
	lw	s0,0(a5)
	mv	s1,a0
.L439:
	lw	a5,8(s1)
	li	a4,9
	lw	a3,0(a5)
	beq	a3,a4,.L490
	slli	a4,s0,2
	lla	a5,tokstr
	add	a5,a5,a4
	lw	a2,0(a5)
	lla	a1,.LC95
	lla	a0,tok+8
	call	error
	lw	a5,8(s1)
.L490:
	lw	a3,28(a5)
	lw	a5,40(a5)
	li	a4,1
	sw	a5,20(sp)
	lw	a5,0(a3)
	addi	a5,a5,-12
	bleu	a5,a4,.L491
	slli	a4,s0,2
	lla	a5,tokstr
	add	a5,a5,a4
	lw	a2,0(a5)
	lla	a1,.LC95
	lla	a0,tok+8
	sw	a3,0(sp)
	call	error
	lw	a3,0(sp)
.L491:
	sw	a3,0(sp)
	call	next
	lla	a5,tok
	lw	a4,0(a5)
	li	a5,4
	lw	a3,0(sp)
	beq	a4,a5,.L492
	slli	a4,s0,2
	lla	a5,tokstr
	add	a5,a5,a4
	lw	a2,0(a5)
	lla	a1,.LC96
	lla	a0,tok+8
	call	error
	lw	a3,0(sp)
.L492:
	li	a4,1
	li	a5,69
	sw	a4,0(sp)
	beq	s0,a5,.L493
	lw	a5,20(s1)
	lbu	a5,4(a5)
	sw	a5,0(sp)
.L493:
	lla	a5,tok
	lw	a1,20(a5)
	lw	a5,16(sp)
	mv	a0,a3
	li	a4,0
	mv	a3,a5
	addi	a2,a5,8
	li	a5,0
	sw	a4,8(a3)
	sw	a5,12(a3)
	call	typemember
	sw	a0,8(sp)
	beq	a0,zero,.L572
.L494:
	lw	a0,8(s1)
	lla	a1,typeulong
	mv	s0,a1
	call	typecompatible
	bne	a0,zero,.L495
	li	a0,40
	call	xmalloc
	li	a5,8
	sw	s1,20(a0)
	sw	zero,12(a0)
	sw	s0,8(a0)
	sw	a5,0(a0)
	sh	zero,4(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	mv	s1,a0
.L495:
	lw	a5,16(sp)
	li	a0,40
	lw	a4,8(a5)
	lw	a5,12(a5)
	sw	a4,24(sp)
	sw	a5,28(sp)
	call	xmalloc
	lw	a4,24(sp)
	lw	a5,28(sp)
	mv	a3,a0
	sw	s0,8(a0)
	sw	zero,12(a0)
	li	a0,1
	mv	a2,s1
	sw	a0,0(a3)
	sw	a4,32(a3)
	sw	a5,36(a3)
	sh	zero,4(a3)
	sw	zero,20(a3)
	sw	zero,24(a3)
	sw	zero,28(a3)
	li	a1,74
	lla	a0,tok+8
	call	mkbinaryexpr
	lw	s1,8(sp)
	lw	a5,20(sp)
	mv	s0,a0
	lw	a1,8(s1)
	lw	a0,4(s1)
	or	a1,a5,a1
	call	mkpointertype
	sw	a0,8(s0)
	mv	a1,s0
	li	a0,73
	call	mkunaryexpr
	lw	a4,0(sp)
	lw	a5,24(s1)
	mv	s1,a0
	sb	a4,4(a0)
	bne	a5,zero,.L573
.L496:
	call	next
	j	.L435
.L442:
	call	next
	lw	a0,4(sp)
	call	expr
	lw	a5,8(s1)
	li	a4,9
	mv	s0,a0
	lw	a3,0(a5)
	beq	a3,a4,.L508
	lw	a5,8(a0)
	lw	a3,0(a5)
	bne	a3,a4,.L574
.L443:
	lw	a5,28(a5)
	lbu	a5,44(a5)
	bne	a5,zero,.L575
.L444:
	lw	a5,8(s1)
	lw	a5,4(a5)
	andi	a5,a5,2
	beq	a5,zero,.L576
.L445:
	mv	a3,s1
	mv	a2,s0
	li	a1,74
	lla	a0,tok+8
	call	mkbinaryexpr
	mv	a1,a0
	li	a0,73
	call	mkunaryexpr
	mv	s1,a0
	lla	a1,.LC73
	li	a0,63
	call	expect
	j	.L435
.L441:
	call	next
	lw	a5,0(s1)
	bne	a5,zero,.L447
	lw	a5,32(s1)
	li	a4,4
	lw	a3,4(a5)
	beq	a3,a4,.L577
.L447:
	lw	a5,8(s1)
	li	a4,9
	lw	a3,0(a5)
	bne	a3,a4,.L480
	lw	a5,28(a5)
	mv	a4,a5
	lw	a4,0(a4)
	sw	a5,8(sp)
	li	a5,11
	beq	a4,a5,.L481
.L480:
	lla	a1,.LC91
	lla	a0,tok+8
	call	error
	lw	a5,8(s1)
	lw	a5,28(a5)
	sw	a5,8(sp)
.L481:
	lw	a5,8(sp)
	li	a0,40
	lw	a5,28(a5)
	sw	a5,0(sp)
	call	xmalloc
	lw	a5,0(sp)
	lw	a4,8(sp)
	lla	a3,tok
	lw	a3,0(a3)
	sh	zero,4(a0)
	sw	a5,8(a0)
	sw	s1,20(a0)
	li	a5,3
	lw	s1,52(a4)
	addi	a4,a0,32
	sw	a5,0(a0)
	sw	zero,12(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	zero,32(a0)
	sw	zero,36(a0)
	li	a5,65
	sw	a4,0(sp)
	mv	s0,a0
	beq	a3,a5,.L483
.L482:
	beq	s1,zero,.L578
.L485:
	lw	a0,4(sp)
	call	assignexpr
	lw	a4,0(sp)
	mv	a5,a0
	sw	a0,0(a4)
.L497:
	lw	a1,12(s1)
	mv	a0,a5
	call	exprassign
	lw	a5,0(sp)
	lw	s1,32(s1)
	addi	a4,a0,24
	sw	a0,0(a5)
	lw	a5,36(s0)
	sw	a4,0(sp)
	addi	a5,a5,1
	sw	a5,36(s0)
	lla	a5,tok
	lw	a3,0(a5)
	li	a5,65
	beq	a3,a5,.L483
.L488:
	lw	a5,32(s0)
	beq	a5,zero,.L482
	lla	a1,.LC92
	li	a0,108
	call	expect
	bne	s1,zero,.L485
.L578:
	lw	a5,8(sp)
	lbu	a5,48(a5)
	beq	a5,zero,.L579
.L486:
	lw	a0,4(sp)
	call	assignexpr
	lw	a4,0(sp)
	mv	a5,a0
	sw	a0,0(a4)
	lw	a4,8(sp)
	lbu	a3,48(a4)
	beq	a3,zero,.L497
	call	exprpromote
	lw	a5,0(sp)
	addi	a4,a0,24
	sw	a4,0(sp)
	sw	a0,0(a5)
	lw	a5,36(s0)
	addi	a5,a5,1
	sw	a5,36(s0)
	lla	a5,tok
	lw	a3,0(a5)
	li	a5,65
	bne	a3,a5,.L488
.L483:
	beq	s1,zero,.L489
	lw	a5,8(sp)
	lbu	a5,48(a5)
	beq	a5,zero,.L580
.L489:
	mv	a0,s0
	call	decay
	mv	s1,a0
	call	next
	j	.L435
.L573:
	li	a0,40
	lw	s0,8(s1)
	call	xmalloc
	lw	a5,8(sp)
	li	a4,4
	lw	a5,24(a5)
	sw	a4,0(a0)
	lw	a4,0(sp)
	sw	s1,20(a0)
	sw	zero,12(a0)
	sw	s0,8(a0)
	sb	zero,5(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sb	a4,4(a0)
	sw	a5,32(a0)
	mv	s1,a0
	j	.L496
.L579:
	lla	a1,.LC93
	lla	a0,tok+8
	call	error
	j	.L486
.L574:
	lla	a1,.LC70
	lla	a0,tok+8
	call	error
	lw	a5,8(s0)
	lw	a5,28(a5)
	lbu	a5,44(a5)
	beq	a5,zero,.L444
.L575:
	lla	a1,.LC71
	lla	a0,tok+8
	call	error
	lw	a5,8(s1)
	lw	a5,4(a5)
	andi	a5,a5,2
	bne	a5,zero,.L445
.L576:
	lla	a1,.LC72
	lla	a0,tok+8
	call	error
	j	.L445
.L577:
	lw	a5,40(a5)
	li	a4,10
	bgtu	a5,a4,.L448
	lla	a4,.L450
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.postfixexpr
	.align	2
	.align	2
.L450:
	.word	.L459-.L450
	.word	.L458-.L450
	.word	.L457-.L450
	.word	.L456-.L450
	.word	.L455-.L450
	.word	.L454-.L450
	.word	.L453-.L450
	.word	.L452-.L450
	.word	.L451-.L450
	.word	.L448-.L450
	.word	.L449-.L450
	.section	.text.postfixexpr
.L572:
	lla	a5,tok
	lw	a2,20(a5)
	lla	a1,.LC76
	lla	a0,tok+8
	call	error
	j	.L494
.L508:
	mv	s0,s1
	mv	s1,a0
	j	.L443
.L570:
	addi	a5,a5,-4
	li	a4,60
	bgtu	a5,a4,.L384
	lla	a4,.L386
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.postfixexpr
	.align	2
	.align	2
.L386:
	.word	.L393-.L386
	.word	.L392-.L386
	.word	.L391-.L386
	.word	.L390-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L389-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L388-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L387-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L384-.L386
	.word	.L385-.L386
	.section	.text.postfixexpr
.L580:
	lla	a1,.LC94
	lla	a0,tok+8
	call	error
	mv	a0,s0
	call	decay
	mv	s1,a0
	call	next
	j	.L435
.L384:
	lla	a1,.LC69
	lla	a0,tok+8
	call	error
	j	.L383
.L457:
	lw	s0,4(sp)
	mv	a0,s0
	call	assignexpr
	lla	a1,.LC56
	mv	s1,a0
	li	a0,108
	call	expect
	mv	a0,s0
	call	assignexpr
	call	delexpr
.L460:
	lla	a1,.LC90
	li	a0,65
	call	expect
	j	.L435
.L456:
	lw	a0,4(sp)
	li	a2,0
	li	a1,0
	call	typename
	mv	s0,a0
	lla	a1,.LC65
	li	a0,108
	call	expect
	lla	a1,.LC74
	li	a0,4
	call	expect
	lw	a5,0(s0)
	li	a4,1
	sw	a0,0(sp)
	addi	a5,a5,-12
	bleu	a5,a4,.L461
	lla	a1,.LC75
	lla	a0,tok+8
	call	error
.L461:
	lw	a3,16(sp)
	lw	a1,0(sp)
	mv	a0,s0
	li	a4,0
	li	a5,0
	mv	a2,a3
	sw	a4,0(a3)
	sw	a5,4(a3)
	call	typemember
	mv	s0,a0
	beq	a0,zero,.L581
.L462:
	lw	s1,4(s0)
	lw	s0,16(sp)
.L463:
	lla	a5,tok
	lw	a5,0(a5)
	li	a4,62
	beq	a5,a4,.L464
	li	a4,68
	beq	a5,a4,.L465
	lw	a5,16(sp)
	li	a0,40
	lla	s0,typeulong
	lw	a4,0(a5)
	lw	a5,4(a5)
	sw	a4,8(sp)
	sw	a5,12(sp)
	call	xmalloc
	lw	a4,8(sp)
	lw	a5,12(sp)
	li	a3,1
	mv	s1,a0
	sw	s0,8(a0)
	sw	a3,0(a0)
	sw	a4,32(a0)
	sw	a5,36(a0)
	sw	zero,12(a0)
	sh	zero,4(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	lw	a0,0(sp)
	call	free
	j	.L460
.L455:
	lw	s1,4(sp)
	li	a2,0
	li	a1,0
	mv	a0,s1
	call	typename
	mv	s0,a0
	lla	a1,.LC65
	li	a0,108
	call	expect
	li	a2,0
	li	a1,0
	mv	a0,s1
	call	typename
	mv	a1,a0
	mv	a0,s0
	call	typecompatible
	mv	s0,a0
	li	a0,40
.L569:
	call	xmalloc
	lla	a5,typeint
	sw	a5,8(a0)
	li	a5,1
	mv	s1,a0
	sw	zero,12(a0)
	sw	a5,0(a0)
	sh	zero,4(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	s0,32(a0)
	sw	zero,36(a0)
	j	.L460
.L453:
	lw	a0,4(sp)
	lla	s0,typeadjvalist
	call	assignexpr
	mv	a4,a0
	li	a0,40
	sw	a4,0(sp)
	call	xmalloc
	lw	a4,0(sp)
	sw	zero,8(a0)
	mv	s1,a0
	li	a5,13
	lw	a0,8(a4)
	lw	a1,0(s0)
	sw	a5,0(s1)
	li	a5,6
	sw	zero,12(s1)
	sh	zero,4(s1)
	sw	a4,20(s1)
	sw	zero,24(s1)
	sw	zero,28(s1)
	sw	a5,32(s1)
	call	typesame
	beq	a0,zero,.L582
.L472:
	la a5, targ; lw a5, 0(a5);
	lw	a4,4(a5)
	lw	a5,0(s0)
	beq	a4,a5,.L583
.L473:
	lla	a1,.LC83
	li	a0,108
	call	expect
	lw	a0,4(sp)
	addi	a2,sp,36
	addi	a1,s1,12
	call	typename
	lw	a5,36(sp)
	sw	a0,8(s1)
	sw	a5,28(s1)
	j	.L460
.L452:
	li	a0,40
	call	xmalloc
	lla	a5,typevoid
	sw	a5,8(a0)
	li	a5,11
	sw	a5,0(a0)
	mv	s1,a0
	sw	zero,12(a0)
	sh	zero,4(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	lw	a0,4(sp)
	lla	s0,typeadjvalist
	call	assignexpr
	mv	a5,a0
	lw	a1,0(s0)
	lw	a0,8(a0)
	sw	a5,32(s1)
	call	typesame
	beq	a0,zero,.L584
.L474:
	lla	a3,targ
	lw	a4,0(a3)
	lw	a5,0(s0)
	lw	a4,4(a4)
	beq	a4,a5,.L475
	lw	a1,32(s1)
	li	a0,73
	call	mkunaryexpr
	sw	a0,32(s1)
.L475:
	lla	a1,.LC85
	li	a0,108
	call	expect
	lw	a0,4(sp)
	call	assignexpr
	mv	a5,a0
	lw	a1,0(s0)
	lw	a0,8(a0)
	sw	a5,36(s1)
	call	typesame
	lla	a3,targ
	beq	a0,zero,.L585
.L476:
	lw	a4,0(a3)
	lw	a5,0(s0)
	lw	a4,4(a4)
	beq	a4,a5,.L460
	lw	a1,36(s1)
	li	a0,73
	call	mkunaryexpr
	sw	a0,36(s1)
	j	.L460
.L451:
	lw	a0,4(sp)
	call	assignexpr
	mv	s0,a0
	lw	a0,8(a0)
	la a1, typeadjvalist; lw a1, 0(a1);
	call	typesame
	beq	a0,zero,.L586
.L477:
	li	a0,40
	call	xmalloc
	lla	a5,typevoid
	sw	a5,8(a0)
	li	a5,8
	mv	s1,a0
	sw	zero,12(a0)
	sw	a5,0(a0)
	sh	zero,4(a0)
	sw	s0,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	j	.L460
.L454:
	li	a0,40
	call	xmalloc
	lla	a5,typevoid
	sw	a5,8(a0)
	li	a5,13
	sw	a5,0(a0)
	li	a5,5
	mv	s1,a0
	sw	zero,12(a0)
	sh	zero,4(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	a5,32(a0)
	j	.L460
.L459:
	lw	a0,4(sp)
	call	assignexpr
	lla	a1,typeulong
	call	exprassign
	mv	s0,a0
	li	a1,0
	lla	a0,typevoid
	call	mkpointertype
	mv	s1,a0
	li	a0,40
	sw	s1,0(sp)
	call	xmalloc
	lw	a5,0(sp)
	mv	s1,a0
	sw	zero,12(a0)
	sw	a5,8(a0)
	li	a5,13
	sw	a5,0(a0)
	sh	zero,4(a0)
	sw	s0,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	zero,32(a0)
	j	.L460
.L458:
	lw	a0,4(sp)
	call	condexpr
	call	eval
	lw	s0,0(a0)
	li	a0,40
	addi	s0,s0,-1
	seqz	s0,s0
	j	.L569
.L449:
	lw	a0,4(sp)
	lla	s0,typeadjvalist
	call	assignexpr
	mv	a4,a0
	li	a0,40
	sw	a4,0(sp)
	call	xmalloc
	lw	a4,0(sp)
	lla	a5,typevoid
	sw	a5,8(a0)
	mv	s1,a0
	li	a5,13
	lw	a0,8(a4)
	lw	a1,0(s0)
	sw	a5,0(s1)
	li	a5,10
	sw	zero,12(s1)
	sh	zero,4(s1)
	sw	a4,20(s1)
	sw	zero,24(s1)
	sw	zero,28(s1)
	sw	a5,32(s1)
	call	typesame
	beq	a0,zero,.L587
.L478:
	la a5, targ; lw a5, 0(a5);
	lw	a4,4(a5)
	lw	a5,0(s0)
	beq	a4,a5,.L588
.L479:
	li	a0,108
	call	consume
	beq	a0,zero,.L460
	lw	a0,4(sp)
	call	assignexpr
	call	delexpr
	j	.L460
.L448:
	lla	a0,.LC89
	call	fatal
	li	s1,0
	j	.L460
.L393:
	lla	a5,tok
	lw	a1,20(a5)
	lw	a0,4(sp)
	li	a2,1
	call	scopegetdecl
	mv	s1,a0
	beq	a0,zero,.L589
.L394:
	lw	a2,12(s1)
	li	a0,40
	sw	a2,0(sp)
	call	xmalloc
	lw	a4,4(s1)
	lw	a3,16(s1)
	lw	a2,0(sp)
	addi	a5,a4,-1
	seqz	a5,a5
	sb	a5,4(a0)
	sw	a2,8(a0)
	sb	zero,5(a0)
	sw	zero,0(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	a3,12(a0)
	sw	s1,32(a0)
	li	a5,4
	mv	s0,a0
	beq	a4,a5,.L568
	call	decay
	mv	s0,a0
.L568:
	call	next
	j	.L383
.L385:
	call	next
	lw	a0,4(sp)
	call	expr
	mv	s0,a0
	lla	a1,.LC56
	li	a0,65
	call	expect
	j	.L383
.L389:
	li	a0,40
	call	xmalloc
	lla	a5,tok
	lw	a5,0(a5)
	lla	a4,typebool
	sw	a4,8(a0)
	addi	a5,a5,-42
	seqz	a5,a5
	li	a4,1
	mv	s0,a0
	sw	zero,12(a0)
	sw	a4,0(a0)
	sh	zero,4(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	a5,32(a0)
	sw	zero,36(a0)
	j	.L568
.L390:
	li	a0,40
	call	xmalloc
	li	a5,2
	mv	s0,a0
	sw	a5,0(a0)
	li	a1,0
	sw	zero,12(a0)
	sw	zero,8(a0)
	sh	zero,4(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	addi	a0,a0,32
	call	stringconcat
	lw	a2,32(s0)
	li	a3,0
	li	a1,0
	call	mkarraytype
	li	a5,1
	sw	a0,8(s0)
	sb	a5,4(s0)
	mv	a0,s0
	call	decay
	mv	s0,a0
	j	.L383
.L391:
	lla	a5,tok
	lw	a5,20(a5)
	li	a4,85
	lbu	s1,0(a5)
	beq	s1,a4,.L397
	li	a4,117
	beq	s1,a4,.L398
	li	a4,76
	lla	t1,typeint
	beq	s1,a4,.L590
.L399:
	li	a4,39
	bne	s1,a4,.L591
	addi	s0,a5,1
	lla	a3,.LC51
	li	a2,0
	lla	a4,tok+8
	addi	a1,sp,36
	mv	a0,s0
	sw	t1,20(sp)
	call	decodechar
	lw	a4,36(sp)
	mv	a5,a0
	add	a5,s0,a5
	li	a0,40
	sw	a4,8(sp)
	sw	a5,0(sp)
	call	xmalloc
	lw	t1,20(sp)
	lw	a4,8(sp)
	lw	a5,0(sp)
	li	a3,1
	sw	zero,12(a0)
	sw	t1,8(a0)
	sw	a3,0(a0)
	sh	zero,4(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	a4,32(a0)
	sw	zero,36(a0)
	lbu	a2,0(a5)
	mv	s0,a0
	beq	a2,s1,.L568
	lla	a1,.LC52
	lla	a0,tok+8
	call	error
	j	.L568
.L392:
	li	a0,40
	call	xmalloc
	lla	a5,tok
	lw	a5,20(a5)
	li	a4,1
	sw	a4,0(a0)
	sw	zero,12(a0)
	sw	zero,8(a0)
	sh	zero,4(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	lbu	a3,0(a5)
	li	a2,10
	sw	a0,24(sp)
	li	a4,48
	sw	a2,32(sp)
	lla	a1,.LC49
	beq	a3,a4,.L592
.L406:
	mv	a0,a5
	call	strpbrk
	beq	a0,zero,.L593
.L410:
	lla	a1,.LC53
	lla	a0,tok+8
	call	error
.L412:
	call	next
	lw	s0,24(sp)
	j	.L383
.L387:
	call	next
	lla	a1,.LC57
	li	a0,64
	call	expect
	lw	a0,4(sp)
	call	assignexpr
	mv	s1,a0
	lla	a1,.LC58
	li	a0,108
	call	expect
	lw	a5,8(s1)
	mv	a0,s1
	li	s1,0
	sw	a5,8(sp)
	call	delexpr
	sw	s0,20(sp)
	lw	s0,4(sp)
	j	.L432
.L595:
	beq	s1,zero,.L425
	lla	a1,.LC59
	lla	a0,tok+8
	call	error
.L425:
	lla	a1,.LC60
	li	a0,93
	call	expect
	mv	a0,s0
	call	assignexpr
	mv	s1,a0
.L426:
	li	a0,108
	call	consume
	beq	a0,zero,.L594
.L432:
	li	a0,18
	call	consume
	bne	a0,zero,.L595
	li	a2,0
	addi	a1,sp,36
	mv	a0,s0
	sw	zero,36(sp)
	call	typename
	mv	a5,a0
	beq	a0,zero,.L596
.L427:
	lw	a3,0(a5)
	li	a4,11
	beq	a3,a4,.L597
.L428:
	lbu	a4,44(a5)
	bne	a4,zero,.L598
.L429:
	lw	a4,4(a5)
	andi	a4,a4,64
	bne	a4,zero,.L599
.L430:
	lla	a1,.LC65
	li	a0,93
	sw	a5,0(sp)
	call	expect
	mv	a0,s0
	call	assignexpr
	lw	a5,0(sp)
	lw	a1,8(sp)
	mv	a4,a0
	mv	a0,a5
	sw	a4,0(sp)
	call	typecompatible
	lw	a4,0(sp)
	beq	a0,zero,.L431
	lw	a5,36(sp)
	bne	a5,zero,.L431
	lw	a5,20(sp)
	beq	a5,zero,.L506
	lla	a1,.LC66
	lla	a0,tok+8
	call	error
	lw	a4,0(sp)
	sw	a4,20(sp)
	j	.L426
.L388:
	li	a0,40
	call	xmalloc
	lla	a5,typenullptr
	sw	a5,8(a0)
	li	a5,1
	sw	a5,0(a0)
	li	a4,0
	li	a5,0
	sw	zero,12(a0)
	sh	zero,4(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	a4,32(a0)
	sw	a5,36(a0)
	mv	s0,a0
	call	next
	j	.L383
.L431:
	mv	a0,a4
	call	delexpr
	j	.L426
.L464:
	lw	a4,0(s1)
	li	a5,10
	beq	a4,a5,.L467
	lla	a1,.LC77
	lla	a0,tok+8
	call	error
.L467:
	call	next
	lw	a0,4(sp)
	li	a1,0
	call	intconstexpr
	mv	a4,a0
	mv	a5,a1
	li	a0,63
	lla	a1,.LC78
	sw	a4,20(sp)
	sw	a5,8(sp)
	call	expect
	lw	s1,28(s1)
	lw	a4,20(sp)
	lw	a5,8(sp)
	lw	a3,20(s1)
	lw	a2,16(s1)
	mv	a0,a4
	mv	a1,a5
	call	__muldi3
	lw	a5,0(s0)
	lw	a3,4(s0)
	add	a4,a5,a0
	sltu	a5,a4,a5
	add	a3,a3,a1
	add	a5,a5,a3
	sw	a4,0(s0)
	sw	a5,4(s0)
	j	.L463
.L465:
	lw	a5,0(s1)
	li	a4,1
	addi	a5,a5,-12
	bleu	a5,a4,.L469
	lla	a1,.LC79
	lla	a0,tok+8
	call	error
.L469:
	call	next
	lla	a1,.LC80
	li	a0,4
	call	expect
	mv	a1,a0
	sw	a0,8(sp)
	mv	a2,s0
	mv	a0,s1
	call	typemember
	lw	a3,8(sp)
	mv	a5,a0
	beq	a0,zero,.L600
.L470:
	mv	a0,a3
	sw	a5,8(sp)
	call	free
	lw	a5,8(sp)
	lw	s1,4(a5)
	j	.L463
.L599:
	lla	a1,.LC64
	lla	a0,tok+8
	sw	a5,0(sp)
	call	error
	lw	a5,0(sp)
	j	.L430
.L598:
	lla	a1,.LC63
	lla	a0,tok+8
	sw	a5,0(sp)
	call	error
	lw	a5,0(sp)
	j	.L429
.L594:
	lw	s0,20(sp)
	lla	a1,.LC67
	li	a0,65
	call	expect
	beq	s0,zero,.L601
	beq	s1,zero,.L383
	mv	a0,s1
	call	delexpr
	j	.L383
.L597:
	lla	a1,.LC62
	lla	a0,tok+8
	sw	a5,0(sp)
	call	error
	lw	a5,0(sp)
	j	.L428
.L596:
	sw	a0,0(sp)
	lla	a1,.LC61
	lla	a0,tok+8
	call	error
	lw	a5,0(sp)
	j	.L427
.L506:
	sw	a4,20(sp)
	j	.L426
.L584:
	lla	a1,.LC84
	lla	a0,tok+8
	call	error
	j	.L474
.L586:
	lla	a1,.LC87
	lla	a0,tok+8
	call	error
	j	.L477
.L585:
	lla	a1,.LC86
	lla	a0,tok+8
	call	error
	lla	a3,targ
	j	.L476
.L582:
	lla	a1,.LC82
	lla	a0,tok+8
	call	error
	j	.L472
.L587:
	lla	a1,.LC88
	lla	a0,tok+8
	call	error
	j	.L478
.L600:
	lw	a1,0(s1)
	li	a4,13
	lla	a2,.LC46
	beq	a1,a4,.L471
	lla	a2,.LC47
.L471:
	lla	a1,.LC81
	lla	a0,tok+8
	sw	a5,20(sp)
	sw	a3,8(sp)
	call	error
	lw	a5,20(sp)
	lw	a3,8(sp)
	j	.L470
.L601:
	beq	s1,zero,.L602
	mv	s0,s1
	j	.L383
.L593:
	lla	a5,tok
	lw	s1,20(a5)
.L499:
	lw	a2,32(sp)
	addi	a1,sp,36
	mv	a0,s1
	call	strtoull
	lw	a5,24(sp)
	sw	a0,0(sp)
	sw	a1,8(sp)
	sw	a0,32(a5)
	sw	a1,36(a5)
	lw	s0,36(sp)
	beq	s1,s0,.L603
.L413:
	lbu	a0,0(s0)
	mv	s1,s0
	beq	a0,zero,.L416
.L414:
	call	tolower
	sb	a0,0(s1)
	lbu	a0,1(s1)
	addi	s1,s1,1
	bne	a0,zero,.L414
.L416:
	li	s1,0
	lla	a5,.LANCHOR1
	lla	a1,.LC45
	mv	a0,s0
	sw	s1,20(sp)
	mv	s1,a5
	call	strcmp
	beq	a0,zero,.L417
.L604:
	lw	a1,8(s1)
	beq	a1,zero,.L418
	mv	a0,s0
	call	strcmp
	beq	a0,zero,.L417
.L418:
	lw	a5,20(sp)
	li	a4,6
	addi	s1,s1,12
	addi	a5,a5,1
	sw	a5,20(sp)
	beq	a5,a4,.L419
	lw	a1,4(s1)
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L604
.L417:
	lw	s1,20(sp)
	li	a4,2
	sw	a4,20(sp)
	andi	a5,s1,1
	beq	a5,zero,.L605
.L420:
	mv	s0,s1
	j	.L422
.L606:
	lw	a5,20(sp)
	add	s0,s0,a5
	li	a5,5
	bgtu	s0,a5,.L423
.L422:
	slli	a5,s0,1
	add	a5,a5,s0
	slli	a5,a5,2
	lla	a4,.LANCHOR1
	add	a5,a4,a5
	lw	s1,0(a5)
	lw	a1,0(sp)
	lw	a2,8(sp)
	li	a3,0
	mv	a0,s1
	call	typehasint
	beq	a0,zero,.L606
	mv	s0,s1
.L421:
	lw	a5,24(sp)
	sw	s0,8(a5)
	j	.L412
.L605:
	lw	a5,32(sp)
	addi	a5,a5,-10
	seqz	a5,a5
	addi	a5,a5,1
	sw	a5,20(sp)
	j	.L420
.L590:
	la a4, targ; lw a4, 0(a4);
	lbu	s1,1(a5)
	lw	t1,8(a4)
	addi	a5,a5,1
	j	.L399
.L398:
	lbu	s1,1(a5)
	li	a4,56
	beq	s1,a4,.L400
	addi	a5,a5,1
	lla	t1,typeushort
	j	.L399
.L397:
	lbu	s1,1(a5)
	lla	t1,typeuint
	addi	a5,a5,1
	j	.L399
.L419:
	mv	a2,s0
	lla	a1,.LC97
	lla	a0,tok+8
	call	error
.L423:
	lla	a5,tok
	lw	a2,20(a5)
	lla	a1,.LC55
	lla	a0,tok+8
	call	error
	li	s0,0
	j	.L421
.L581:
	lw	a2,0(sp)
	lla	a1,.LC76
	lla	a0,tok+8
	call	error
	j	.L462
.L583:
	lw	a1,20(s1)
	li	a0,72
	call	mkunaryexpr
	sw	a0,20(s1)
	j	.L473
.L588:
	lw	a1,20(s1)
	li	a0,72
	call	mkunaryexpr
	sw	a0,20(s1)
	j	.L479
.L592:
	lbu	a0,1(a5)
	sw	a1,0(sp)
	call	tolower
	li	a4,98
	lw	a1,0(sp)
	beq	a0,a4,.L407
	li	a4,120
	beq	a0,a4,.L408
	lla	a5,tok
	li	a4,8
	lw	a5,20(a5)
	sw	a4,32(sp)
	j	.L406
.L589:
	lla	a5,tok
	lw	a2,20(a5)
	lla	a1,.LC50
	lla	a0,tok+8
	call	error
	j	.L394
.L400:
	lbu	s1,2(a5)
	lla	t1,typeuchar
	addi	a5,a5,2
	j	.L399
.L603:
	lla	a5,tok
	lw	a2,20(a5)
	lla	a1,.LC54
	lla	a0,tok+8
	call	error
	lw	a5,24(sp)
	lw	s0,36(sp)
	lw	a4,32(a5)
	lw	a5,36(a5)
	sw	a4,0(sp)
	sw	a5,8(sp)
	j	.L413
.L408:
	lla	a5,tok
	li	a4,16
	lw	a5,20(a5)
	sw	a4,32(sp)
	lla	a1,.LC48
	j	.L406
.L407:
	lla	a5,tok
	lw	s1,20(a5)
	mv	a0,s1
	call	strpbrk
	bne	a0,zero,.L410
	li	a5,2
	addi	s1,s1,2
	sw	a5,32(sp)
	j	.L499
.L602:
	lla	a1,.LC68
	lla	a0,tok+8
	call	error
	j	.L383
.L591:
	lla	s0,.LC0
	li	a0,65
.L402:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L402
	lla	s0,.LC43
	li	a0,65
.L403:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L403
	lla	s0,.LC44
	li	a0,32
.L404:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L404
	li	a0,1
	call	halt
	.size	postfixexpr, .-postfixexpr
	.section	.rodata.unaryexpr.str1.4,"aMS",@progbits,1
	.align	2
.LC98:
	.string	"operand of unary '+' operator must have arithmetic type"
	.align	2
.LC99:
	.string	"operand of unary '-' operator must have arithmetic type"
	.align	2
.LC100:
	.string	"operand of '~' operator must have integer type"
	.align	2
.LC101:
	.string	"operator '!' must have scalar operand"
	.align	2
.LC102:
	.string	"expected ')' after 'alignof'"
	.align	2
.LC103:
	.string	"%s operator applied to bitfield expression"
	.align	2
.LC104:
	.string	"%s operator applied to incomplete type"
	.align	2
.LC105:
	.string	"%s operator applied to function type"
	.section	.text.unaryexpr,"ax",@progbits
	.align	2
	.type	unaryexpr, @function
unaryexpr:
	addi	sp,sp,-20
	lla	a4,tok
	sw	s1,8(sp)
	lw	s1,0(a4)
	sw	s0,12(sp)
	sw	ra,16(sp)
	li	a3,68
	addi	a5,s1,-9
	mv	s0,a0
	bgtu	a5,a3,.L608
	lla	a3,.L610
	slli	a5,a5,2
	add	a5,a5,a3
	lw	a5,0(a5)
	add	a5,a5,a3
	jr	a5
	.section	.rodata.unaryexpr,"a",@progbits
	.align	2
	.align	2
.L610:
	.word	.L616-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L616-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L608-.L610
	.word	.L615-.L610
	.word	.L615-.L610
	.word	.L614-.L610
	.word	.L614-.L610
	.word	.L613-.L610
	.word	.L612-.L610
	.word	.L611-.L610
	.word	.L609-.L610
	.section	.text.unaryexpr
.L608:
	mv	a0,s0
	lw	s0,12(sp)
	lw	ra,16(sp)
	lw	s1,8(sp)
	li	a1,0
	addi	sp,sp,20
	tail	postfixexpr
.L616:
	call	next
	li	a0,64
	call	consume
	bne	a0,zero,.L651
	li	a5,36
	bne	s1,a5,.L627
	mv	a0,s0
	call	unaryexpr
	mv	a3,a0
.L626:
	lbu	a5,5(a3)
	beq	a5,zero,.L628
	lw	a3,20(a3)
.L628:
	lw	a4,0(a3)
	li	a5,4
	beq	a4,a5,.L652
.L629:
	lw	a5,8(a3)
.L625:
	lbu	a4,44(a5)
	bne	a4,zero,.L653
.L630:
	lw	a4,0(a5)
	li	a2,11
	beq	a4,a2,.L654
.L631:
	li	a2,10
	beq	a4,a2,.L655
.L632:
	li	a4,36
	beq	s1,a4,.L656
.L633:
	lw	s1,8(a5)
	srai	a5,s1,31
.L634:
	li	a0,40
	sw	a5,0(sp)
	call	xmalloc
	lw	a5,0(sp)
	lla	a4,typeulong
	sw	a4,8(a0)
	li	a4,1
	mv	s0,a0
	sw	zero,12(a0)
	sw	a4,0(a0)
	sh	zero,4(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	s1,32(a0)
	sw	a5,36(a0)
.L607:
	lw	ra,16(sp)
	mv	a0,s0
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L615:
	call	next
	mv	a0,s0
	call	unaryexpr
	lw	s0,12(sp)
	lw	ra,16(sp)
	mv	a1,a0
	mv	a0,s1
	lw	s1,8(sp)
	li	a2,0
	addi	sp,sp,20
	tail	mkincdecexpr
.L614:
	call	next
	mv	a0,s0
	call	castexpr
	lw	s0,12(sp)
	lw	ra,16(sp)
	mv	a1,a0
	mv	a0,s1
	lw	s1,8(sp)
	addi	sp,sp,20
	tail	mkunaryexpr
.L609:
	call	next
	mv	a0,s0
	call	castexpr
	lw	a5,8(a0)
	mv	s0,a0
	lw	a5,4(a5)
	andi	a5,a5,16
	beq	a5,zero,.L657
.L622:
	li	a0,40
	call	xmalloc
	lla	a5,typeint
	sw	a5,8(a0)
	mv	a2,s0
	li	a5,1
	lw	s0,12(sp)
	sw	a5,0(a0)
	lw	ra,16(sp)
	lw	s1,8(sp)
	li	a4,0
	li	a5,0
	sw	zero,12(a0)
	sh	zero,4(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	a4,32(a0)
	sw	a5,36(a0)
	mv	a3,a0
	li	a1,86
	lla	a0,tok+8
	addi	sp,sp,20
	tail	mkbinaryexpr
.L612:
	call	next
	mv	a0,s0
	call	castexpr
	lw	a4,8(a0)
	mv	s1,a0
	lw	a5,4(a4)
	andi	a3,a5,8
	beq	a3,zero,.L658
.L619:
	andi	a5,a5,2
	bne	a5,zero,.L659
.L620:
	li	a0,40
	sw	a4,0(sp)
	call	xmalloc
	lw	a4,0(sp)
	li	a5,7
	sw	a5,0(a0)
	mv	s0,a0
	li	a5,75
	sw	s1,20(a0)
	lw	ra,16(sp)
	sw	zero,12(a0)
	sw	a4,8(a0)
	sh	zero,4(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	a5,16(a0)
	mv	a0,s0
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L613:
	call	next
	mv	a0,s0
	call	castexpr
	lw	a5,8(a0)
	mv	s0,a0
	lw	a5,4(a5)
	andi	a4,a5,8
	beq	a4,zero,.L660
.L617:
	andi	a5,a5,2
	beq	a5,zero,.L607
	mv	a0,s0
	lw	s0,12(sp)
	lw	ra,16(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	tail	exprpromote
.L611:
	call	next
	mv	a0,s0
	call	castexpr
	lw	a5,8(a0)
	mv	s0,a0
	lw	a5,4(a5)
	andi	a5,a5,2
	beq	a5,zero,.L661
.L621:
	mv	a0,s0
	call	exprpromote
	lw	s1,8(a0)
	mv	s0,a0
	li	a0,40
	call	xmalloc
	li	a5,1
	mv	a2,s0
	lw	s0,12(sp)
	sw	s1,8(a0)
	sw	a5,0(a0)
	lw	ra,16(sp)
	lw	s1,8(sp)
	li	a4,-1
	li	a5,-1
	sw	zero,12(a0)
	sh	zero,4(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	a4,32(a0)
	sw	a5,36(a0)
	mv	a3,a0
	li	a1,88
	lla	a0,tok+8
	addi	sp,sp,20
	tail	mkbinaryexpr
.L652:
	slli	a4,s1,2
	lla	a5,tokstr
	add	a5,a5,a4
	lw	a2,0(a5)
	lla	a1,.LC103
	lla	a0,tok+8
	sw	a3,0(sp)
	call	error
	lw	a3,0(sp)
	j	.L629
.L659:
	mv	a0,s1
	call	exprpromote
	lw	a4,8(a0)
	mv	s1,a0
	j	.L620
.L658:
	lla	a1,.LC99
	lla	a0,tok+8
	call	error
	lw	a4,8(s1)
	lw	a5,4(a4)
	j	.L619
.L657:
	lla	a1,.LC101
	lla	a0,tok+8
	call	error
	j	.L622
.L660:
	lla	a1,.LC98
	lla	a0,tok+8
	call	error
	lw	a5,8(s0)
	lw	a5,4(a5)
	j	.L617
.L651:
	li	a2,0
	li	a1,0
	mv	a0,s0
	call	typename
	sw	a0,0(sp)
	beq	a0,zero,.L624
	lla	a1,.LC65
	li	a0,65
	call	expect
	li	a2,36
	lw	a5,0(sp)
	li	a3,0
	lla	a4,tok
	bne	s1,a2,.L625
	lw	a2,0(a4)
	li	a4,66
	bne	a2,a4,.L625
	mv	a1,a5
	mv	a0,s0
	sw	a3,4(sp)
	call	parseinit
	lw	a5,0(sp)
	lw	a3,4(sp)
	j	.L625
.L661:
	lla	a1,.LC100
	lla	a0,tok+8
	call	error
	j	.L621
.L655:
	lw	a4,16(a5)
	lw	a2,20(a5)
	or	a4,a4,a2
	bne	a4,zero,.L632
	li	a4,36
	bne	s1,a4,.L633
	li	a0,40
	sw	a5,4(sp)
	sw	a3,0(sp)
	call	xmalloc
	lw	a3,0(sp)
	lw	a5,4(sp)
	lla	a4,typeulong
	sw	a4,8(a0)
	li	a4,15
	mv	s0,a0
	sw	zero,12(a0)
	sw	a4,0(a0)
	sh	zero,4(a0)
	sw	a3,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	a5,32(a0)
	j	.L607
.L653:
	slli	a2,s1,2
	lla	a4,tokstr
	add	a4,a4,a2
	lw	a2,0(a4)
	lla	a1,.LC104
	lla	a0,tok+8
	sw	a5,4(sp)
	sw	a3,0(sp)
	call	error
	lw	a5,4(sp)
	lw	a3,0(sp)
	j	.L630
.L656:
	lw	s1,16(a5)
	lw	a5,20(a5)
	j	.L634
.L627:
	lla	a1,.LC102
	lla	a0,tok+8
	call	error
	li	s0,0
	j	.L607
.L654:
	slli	a2,s1,2
	lla	a4,tokstr
	add	a4,a4,a2
	lw	a2,0(a4)
	lla	a1,.LC105
	lla	a0,tok+8
	sw	a5,4(sp)
	sw	a3,0(sp)
	call	error
	lw	a5,4(sp)
	lw	a3,0(sp)
	lw	a4,0(a5)
	j	.L631
.L624:
	mv	a0,s0
	call	expr
	mv	a3,a0
	lla	a1,.LC56
	li	a0,65
	sw	a3,0(sp)
	call	expect
	li	a5,36
	lw	a3,0(sp)
	bne	s1,a5,.L626
	mv	a1,a3
	mv	a0,s0
	call	postfixexpr
	mv	a3,a0
	j	.L626
	.size	unaryexpr, .-unaryexpr
	.section	.rodata.castexpr.str1.4,"aMS",@progbits,1
	.align	2
.LC106:
	.string	"statement expression outside of function"
	.align	2
.LC107:
	.string	"after statement expression"
	.align	2
.LC108:
	.string	"after expression to match '('"
	.align	2
.LC109:
	.string	"cast type must be scalar"
	.align	2
.LC110:
	.string	"cast operand must have scalar type"
	.section	.text.castexpr,"ax",@progbits
	.align	2
	.type	castexpr, @function
castexpr:
	addi	sp,sp,-40
	addi	a5,sp,16
	sw	s1,28(sp)
	sw	ra,36(sp)
	sw	s0,32(sp)
	mv	s1,a0
	sw	a5,0(sp)
	sw	zero,4(sp)
	j	.L663
.L669:
	li	a0,40
	call	xmalloc
	lw	a5,20(sp)
	li	a4,8
	sw	zero,12(a0)
	sw	a5,28(a0)
	lw	a5,0(sp)
	sw	s0,8(a0)
	sw	a4,0(a0)
	sh	zero,4(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	a0,0(a5)
	addi	a5,a0,20
	sw	s0,4(sp)
	sw	a5,0(sp)
.L663:
	li	a0,64
	call	consume
	mv	a5,a0
	addi	a2,sp,20
	addi	a1,sp,12
	mv	a0,s1
	beq	a5,zero,.L676
	sw	zero,12(sp)
	call	typename
	mv	s0,a0
	lla	a1,.LC65
	li	a0,65
	beq	s0,zero,.L677
	call	expect
	la a4, tok; lw a4, 0(a4);
	li	a5,66
	lla	a3,typevoid
	beq	a4,a5,.L678
	beq	s0,a3,.L669
	lw	a5,4(s0)
	andi	a5,a5,16
	bne	a5,zero,.L669
	lla	a1,.LC109
	lla	a0,tok+8
	call	error
	j	.L669
.L676:
	call	unaryexpr
	mv	s1,a0
.L667:
	lw	a4,4(sp)
	beq	a4,zero,.L671
	lla	a5,typevoid
	beq	a4,a5,.L671
	lw	a5,8(s1)
	lw	a5,4(a5)
	andi	a5,a5,16
	beq	a5,zero,.L679
.L671:
	lw	a5,0(sp)
	lw	ra,36(sp)
	lw	s0,32(sp)
	sw	s1,0(a5)
	lw	a0,16(sp)
	lw	s1,28(sp)
	addi	sp,sp,40
	jr	ra
.L677:
	la a4, tok; lw a4, 0(a4);
	li	a5,66
	bne	a4,a5,.L665
	lw	a0,48(s1)
	beq	a0,zero,.L680
.L666:
	addi	a2,sp,24
	mv	a1,s1
	call	stmt_expr
	lla	a1,.LC107
	mv	s0,a0
	li	a0,65
	call	expect
	lw	a4,24(sp)
	li	a0,40
	sw	a4,8(sp)
	call	xmalloc
	lw	a4,8(sp)
	mv	a1,a0
	sw	zero,12(a0)
	sw	a4,8(a0)
	li	a4,14
	sw	a4,0(a0)
	sh	zero,4(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	s0,32(a0)
	mv	a0,s1
	call	postfixexpr
	mv	s1,a0
	j	.L667
.L678:
	li	a0,40
	call	xmalloc
	mv	a5,a0
	sw	s0,8(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	lw	a0,20(sp)
	lw	a3,12(sp)
	mv	a2,s0
	sw	a0,28(a5)
	li	a0,6
	sw	a0,0(a5)
	li	a0,1
	sw	a3,12(a5)
	sh	a0,4(a5)
	li	a4,0
	li	a1,1
	li	a0,0
	sw	a5,8(sp)
	call	mkdecl
	lla	a4,filescope
	sub	a4,s1,a4
	lw	a5,8(sp)
	snez	a4,a4
	slli	a4,a4,1
	sw	a4,44(a0)
	mv	a1,s0
	sw	a0,32(a5)
	mv	a0,s1
	call	parseinit
	lw	a5,8(sp)
	sw	a0,36(a5)
	mv	a0,a5
	call	decay
	mv	a1,a0
	mv	a0,s1
	call	postfixexpr
	mv	s1,a0
	j	.L667
.L665:
	mv	a0,s1
	call	expr
	mv	s0,a0
	lla	a1,.LC108
	li	a0,65
	call	expect
	mv	a0,s1
	mv	a1,s0
	call	postfixexpr
	mv	s1,a0
	j	.L667
.L679:
	lla	a0,tok+8
	lla	a1,.LC110
	call	error
	lw	a5,0(sp)
	lw	ra,36(sp)
	lw	s0,32(sp)
	sw	s1,0(a5)
	lw	a0,16(sp)
	lw	s1,28(sp)
	addi	sp,sp,40
	jr	ra
.L680:
	lla	a0,tok+8
	lla	a1,.LC106
	call	error
	lw	a0,48(s1)
	j	.L666
	.size	castexpr, .-castexpr
	.section	.text.binaryexpr,"ax",@progbits
	.align	2
	.type	binaryexpr, @function
binaryexpr:
	addi	sp,sp,-40
	sw	s0,32(sp)
	sw	ra,36(sp)
	sw	s1,28(sp)
	sw	a1,4(sp)
	sw	a2,12(sp)
	mv	s0,a0
	beq	a1,zero,.L694
.L682:
	lla	s1,tok
	lw	a5,0(s1)
	li	a3,-1
	li	a4,19
	sw	a5,8(sp)
	sw	a3,0(sp)
	addi	a5,a5,-72
	bgtu	a5,a4,.L687
.L696:
	slli	a5,a5,2
	lla	a4,.LANCHOR2
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,0(sp)
.L687:
	lw	a5,12(sp)
	lw	a4,0(sp)
	bgt	a5,a4,.L695
.L688:
	lw	a4,12(s1)
	lw	a5,16(s1)
	lw	a3,8(s1)
	sw	a4,20(sp)
	sw	a5,24(sp)
	sw	a3,16(sp)
	call	next
	mv	a0,s0
	call	castexpr
	lw	a5,0(s1)
	li	a4,19
	mv	a1,a0
	addi	a5,a5,-72
	bleu	a5,a4,.L684
.L685:
	mv	a3,a1
	lw	a2,4(sp)
	lw	a1,8(sp)
	addi	a0,sp,16
	call	mkbinaryexpr
	lw	a5,0(s1)
	li	a3,-1
	sw	a0,4(sp)
	sw	a5,8(sp)
	li	a4,19
	sw	a3,0(sp)
	addi	a5,a5,-72
	bleu	a5,a4,.L696
	lw	a5,12(sp)
	lw	a4,0(sp)
	ble	a5,a4,.L688
.L695:
	lw	ra,36(sp)
	lw	s0,32(sp)
	lw	a0,4(sp)
	lw	s1,28(sp)
	addi	sp,sp,40
	jr	ra
.L684:
	slli	a5,a5,2
	lla	a4,.LANCHOR2
	add	a5,a4,a5
	lw	a2,0(a5)
	lw	a5,0(sp)
	mv	a0,s0
	ble	a2,a5,.L685
	call	binaryexpr
	lw	a5,0(s1)
	li	a4,19
	mv	a1,a0
	addi	a5,a5,-72
	bgtu	a5,a4,.L685
	j	.L684
.L694:
	call	castexpr
	sw	a0,4(sp)
	j	.L682
	.size	binaryexpr, .-binaryexpr
	.section	.rodata.condexpr.str1.4,"aMS",@progbits,1
	.align	2
.LC111:
	.string	"in conditional expression"
	.align	2
.LC112:
	.string	"operands of conditional operator must have compatible types"
	.align	2
.LC113:
	.string	"invalid operands to conditional operator"
	.section	.text.condexpr,"ax",@progbits
	.align	2
	.globl	condexpr
	.hidden	condexpr
	.type	condexpr, @function
condexpr:
	addi	sp,sp,-28
	li	a2,0
	li	a1,0
	sw	s0,20(sp)
	sw	s1,16(sp)
	sw	ra,24(sp)
	mv	s1,a0
	call	binaryexpr
	mv	s0,a0
	li	a0,92
	call	consume
	bne	a0,zero,.L730
.L697:
	lw	ra,24(sp)
	mv	a0,s0
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L730:
	mv	a0,s1
	call	expr
	mv	a5,a0
	lla	a1,.LC111
	li	a0,93
	sw	a5,8(sp)
	call	expect
	mv	a0,s1
	call	condexpr
	lw	a3,8(sp)
	lw	s1,8(a0)
	sw	a0,12(sp)
	lw	a5,8(a3)
	beq	a5,s1,.L699
	lw	a4,4(a5)
	andi	a4,a4,8
	beq	a4,zero,.L700
	lw	a4,4(s1)
	andi	a4,a4,8
	bne	a4,zero,.L731
.L700:
	lla	a4,typevoid
	beq	a5,a4,.L732
.L701:
	mv	a0,a3
	sw	a5,0(sp)
	call	eval
	mv	a3,a0
	lw	a0,12(sp)
	sw	a3,8(sp)
	call	eval
	lw	a3,8(sp)
	sw	a0,12(sp)
	li	a2,1
	lw	a1,0(a3)
	lw	a5,0(sp)
	lla	a4,typevoid
	bne	a1,a2,.L702
	lw	a1,8(a3)
	li	a2,14
	lw	t1,0(a1)
	beq	t1,a2,.L703
	lw	a2,4(a1)
	andi	a2,a2,2
	bne	a2,zero,.L704
	li	a2,9
	beq	t1,a2,.L733
.L702:
	lw	a2,0(a0)
	li	a3,1
	bne	a2,a3,.L705
	lw	a2,8(a0)
	li	a3,14
	lw	a1,0(a2)
	beq	a1,a3,.L706
	lw	a3,4(a2)
	andi	a3,a3,2
	bne	a3,zero,.L707
	li	a3,9
	beq	a1,a3,.L734
.L705:
	lw	a3,0(a5)
	li	a2,9
	bne	a3,a2,.L708
	lw	a2,0(s1)
	bne	a2,a3,.L708
	lw	a3,40(a5)
	lw	a2,40(s1)
	lw	a5,28(a5)
	lw	s1,28(s1)
	or	a3,a3,a2
	beq	a5,a4,.L716
	beq	s1,a4,.L709
	mv	a1,s1
	mv	a0,a5
	sw	a3,4(sp)
	sw	a5,0(sp)
	call	typecompatible
	beq	a0,zero,.L710
	lw	a5,0(sp)
	mv	a1,s1
	mv	a0,a5
	call	typecomposite
	lw	a3,4(sp)
	mv	s1,a0
.L709:
	mv	a0,s1
	mv	a1,a3
	call	mkpointertype
	mv	s1,a0
.L699:
	mv	a0,s0
	call	eval
	lw	a3,0(a0)
	li	a4,1
	mv	a5,a0
	bne	a3,a4,.L711
	lw	a4,8(a0)
	lw	a4,4(a4)
	andi	a4,a4,2
	beq	a4,zero,.L711
	lw	a4,32(a0)
	lw	a5,36(a0)
	or	a4,a4,a5
	beq	a4,zero,.L712
	lw	s0,8(sp)
.L714:
	lw	a0,8(s0)
	mv	a1,s1
	call	typecompatible
	bne	a0,zero,.L697
	li	a0,40
	call	xmalloc
	li	a5,8
	sw	s0,20(a0)
	sw	zero,12(a0)
	sw	s1,8(a0)
	sw	a5,0(a0)
	sh	zero,4(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	mv	s0,a0
	j	.L697
.L711:
	li	a0,40
	sw	a5,0(sp)
	call	xmalloc
	lw	a3,8(sp)
	lw	a4,12(sp)
	lw	a5,0(sp)
	mv	s0,a0
	li	a2,10
	sw	s1,8(a0)
	lw	ra,24(sp)
	sw	zero,12(a0)
	sw	a2,0(a0)
	sh	zero,4(a0)
	sw	a5,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	a3,32(a0)
	sw	a4,36(a0)
	mv	a0,s0
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L732:
	bne	s1,a5,.L701
	j	.L699
.L731:
	addi	a1,sp,12
	addi	a0,sp,8
	call	commonreal
	mv	s1,a0
	j	.L699
.L734:
	lw	a3,28(a2)
	bne	a3,a4,.L705
.L707:
	lw	a3,32(a0)
	lw	a2,36(a0)
	or	a3,a3,a2
	bne	a3,zero,.L705
.L706:
	lw	a3,0(a5)
	li	a4,9
	beq	a3,a4,.L735
.L708:
	lla	a1,.LC113
	lla	a0,tok+8
	call	error
	li	s0,0
	j	.L697
.L733:
	lw	a2,28(a1)
	bne	a2,a4,.L702
.L704:
	lw	a2,32(a3)
	lw	a3,36(a3)
	or	a2,a2,a3
	bne	a2,zero,.L702
.L703:
	lw	a2,0(s1)
	li	a3,9
	bne	a2,a3,.L702
	j	.L699
.L712:
	lw	s0,12(sp)
	j	.L714
.L735:
	mv	s1,a5
	j	.L699
.L716:
	mv	s1,a4
	j	.L709
.L710:
	lla	a1,.LC112
	lla	a0,tok+8
	call	error
	li	s0,0
	j	.L697
	.size	condexpr, .-condexpr
	.section	.rodata.intconstexpr.str1.4,"aMS",@progbits,1
	.align	2
.LC114:
	.string	"not an integer constant expression"
	.align	2
.LC115:
	.string	"integer constant expression cannot be negative"
	.section	.text.intconstexpr,"ax",@progbits
	.align	2
	.globl	intconstexpr
	.hidden	intconstexpr
	.type	intconstexpr, @function
intconstexpr:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s1,a1
	call	condexpr
	call	eval
	lw	a4,0(a0)
	li	a5,1
	mv	s0,a0
	bne	a4,a5,.L737
	lw	a5,8(a0)
	lw	a5,4(a5)
	andi	a5,a5,2
	beq	a5,zero,.L737
.L738:
	lw	a0,32(s0)
	lw	a1,36(s0)
	bne	s1,zero,.L736
	lw	a5,8(s0)
	lbu	a5,48(a5)
	beq	a5,zero,.L736
	blt	a1,zero,.L745
.L736:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L737:
	lla	a1,.LC114
	lla	a0,tok+8
	call	error
	j	.L738
.L745:
	lla	a1,.LC115
	lla	a0,tok+8
	call	error
	lw	a0,32(s0)
	lw	a1,36(s0)
	j	.L736
	.size	intconstexpr, .-intconstexpr
	.section	.rodata.assignexpr.str1.4,"aMS",@progbits,1
	.align	2
.LC116:
	.string	"left side of assignment expression is not an lvalue"
	.section	.text.assignexpr,"ax",@progbits
	.align	2
	.globl	assignexpr
	.hidden	assignexpr
	.type	assignexpr, @function
assignexpr:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	ra,28(sp)
	mv	s0,a0
	call	condexpr
	lw	a4,0(a0)
	li	a3,12
	mv	s1,a0
	beq	a4,a3,.L746
	addi	a4,a4,-8
	li	a3,1
	bleu	a4,a3,.L746
	la a4, tok; lw a4, 0(a4);
	addi	a4,a4,-97
	li	a3,10
	bgtu	a4,a3,.L746
	slli	a4,a4,2
	lla	a3,.LANCHOR3
	add	a4,a3,a4
	lw	a5,0(a4)
	lbu	a2,4(a0)
	sw	a5,0(sp)
	beq	a2,zero,.L758
.L748:
	call	next
	mv	a0,s0
	call	assignexpr
	lw	a5,0(sp)
	sw	a0,4(sp)
	beq	a5,zero,.L759
	lw	a3,0(s1)
	li	a4,4
	li	s0,0
	bne	a3,a4,.L751
	mv	s0,s1
	lw	s1,20(s1)
.L751:
	lw	a1,12(s1)
	lw	a0,8(s1)
	call	mkpointertype
	mv	a3,a0
	li	a0,40
	sw	a3,8(sp)
	call	xmalloc
	lw	a3,8(sp)
	li	a5,14
	sw	a5,0(a0)
	li	a5,1
	mv	a1,s1
	sw	a3,8(a0)
	sh	a5,4(a0)
	sw	zero,12(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	zero,32(a0)
	sw	a0,8(sp)
	li	a0,72
	call	mkunaryexpr
	lw	a4,8(sp)
	mv	s1,a0
	li	a0,40
	lw	a5,8(a4)
	sw	a4,12(sp)
	sw	a5,8(sp)
	call	xmalloc
	lw	a5,8(sp)
	lw	a4,12(sp)
	mv	t1,a0
	sw	a5,8(a0)
	lw	a1,8(a4)
	lw	a0,8(s1)
	li	a5,11
	sw	a4,32(t1)
	sw	zero,12(t1)
	sw	a5,0(t1)
	sh	zero,4(t1)
	sw	zero,20(t1)
	sw	zero,24(t1)
	sw	zero,28(t1)
	sw	t1,8(sp)
	sw	a1,16(sp)
	call	typecompatible
	lw	t1,8(sp)
	lw	a4,12(sp)
	bne	a0,zero,.L752
	li	a0,40
	sw	t1,12(sp)
	sw	a4,8(sp)
	call	xmalloc
	lw	a1,16(sp)
	lw	t1,12(sp)
	lw	a4,8(sp)
	li	a5,8
	sw	s1,20(a0)
	sw	zero,12(a0)
	sw	a1,8(a0)
	sw	a5,0(a0)
	sh	zero,4(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	mv	s1,a0
.L752:
	sw	s1,36(t1)
	mv	a1,a4
	li	a0,73
	sw	t1,8(sp)
	call	mkunaryexpr
	lw	t1,8(sp)
	beq	s0,zero,.L756
	sw	a0,20(s0)
.L753:
	lw	a3,4(sp)
	lw	a1,0(sp)
	mv	a2,s0
	lla	a0,tok+8
	sw	t1,8(sp)
	call	mkbinaryexpr
	lw	a4,8(s0)
	mv	s1,a0
	li	a0,40
	sw	a4,0(sp)
	call	xmalloc
	lw	a4,0(sp)
	mv	a5,a0
	sw	a5,0(sp)
	sw	a4,8(a0)
	lw	a1,8(s0)
	lw	a0,8(s1)
	li	a4,11
	sw	zero,12(a5)
	sw	a4,0(a5)
	sh	zero,4(a5)
	sw	zero,20(a5)
	sw	zero,24(a5)
	sw	zero,28(a5)
	sw	s0,32(a5)
	sw	a1,4(sp)
	call	typecompatible
	lw	a5,0(sp)
	lw	t1,8(sp)
	bne	a0,zero,.L754
	li	a0,40
	sw	a5,8(sp)
	sw	t1,0(sp)
	call	xmalloc
	lw	a1,4(sp)
	lw	a5,8(sp)
	lw	t1,0(sp)
	li	a4,8
	sw	s1,20(a0)
	sw	zero,12(a0)
	sw	a1,8(a0)
	sw	a4,0(a0)
	sh	zero,4(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	mv	s1,a0
.L754:
	sw	s1,36(a5)
	lw	s0,8(s0)
	li	a0,40
	sw	a5,24(t1)
	sw	t1,0(sp)
	call	xmalloc
	lw	t1,0(sp)
	li	a4,12
	mv	s1,a0
	sw	zero,12(a0)
	sw	s0,8(a0)
	sw	a4,0(a0)
	sh	zero,4(a0)
	sw	t1,20(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
.L746:
	lw	ra,28(sp)
	lw	s0,24(sp)
	mv	a0,s1
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L758:
	lla	a1,.LC116
	lla	a0,tok+8
	call	error
	j	.L748
.L756:
	mv	s0,a0
	j	.L753
.L759:
	lw	a5,8(s1)
	li	a0,40
	sw	a5,0(sp)
	call	xmalloc
	lw	a5,0(sp)
	mv	s0,a0
	li	a4,11
	sw	a5,8(a0)
	lw	a5,4(sp)
	lw	a1,8(s1)
	lw	a0,8(a5)
	sw	zero,12(s0)
	sw	a4,0(s0)
	sh	zero,4(s0)
	sw	zero,20(s0)
	sw	zero,24(s0)
	sw	zero,28(s0)
	sw	s1,32(s0)
	sw	a1,0(sp)
	call	typecompatible
	bne	a0,zero,.L750
	li	a0,40
	call	xmalloc
	lw	a5,4(sp)
	lw	a1,0(sp)
	sw	zero,12(a0)
	sw	a5,20(a0)
	li	a5,8
	sw	a1,8(a0)
	sw	a5,0(a0)
	sh	zero,4(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	a0,4(sp)
.L750:
	lw	a5,4(sp)
	mv	s1,s0
	sw	a5,36(s0)
	j	.L746
	.size	assignexpr, .-assignexpr
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC117:
	.string	"u"
	.align	2
.LC118:
	.string	"l"
	.align	2
.LC119:
	.string	"ul"
	.align	2
.LC120:
	.string	"lu"
	.align	2
.LC121:
	.string	"ll"
	.align	2
.LC122:
	.string	"ull"
	.align	2
.LC123:
	.string	"llu"
	.section	.bss.parts.1,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	parts.1, @object
	.size	parts.1, 12
parts.1:
	.zero	12
	.section	.rodata.CSWTCH.105,"a"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	CSWTCH.105, @object
	.size	CSWTCH.105, 80
CSWTCH.105:
	.word	4
	.word	9
	.word	8
	.word	8
	.word	-1
	.word	-1
	.word	9
	.word	9
	.word	7
	.word	7
	.word	6
	.word	6
	.word	6
	.word	6
	.word	5
	.word	5
	.word	3
	.word	2
	.word	1
	.word	0
	.section	.rodata.CSWTCH.132,"a"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	CSWTCH.132, @object
	.size	CSWTCH.132, 44
CSWTCH.132:
	.word	0
	.word	73
	.word	78
	.word	79
	.word	74
	.word	75
	.word	80
	.word	81
	.word	72
	.word	88
	.word	89
	.section	.rodata.limits.0,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	limits.0, @object
	.size	limits.0, 72
limits.0:
	.word	typeint
	.word	.LC45
	.word	0
	.word	typeuint
	.word	.LC117
	.word	0
	.word	typelong
	.word	.LC118
	.word	0
	.word	typeulong
	.word	.LC119
	.word	.LC120
	.word	typellong
	.word	.LC121
	.word	0
	.word	typeullong
	.word	.LC122
	.word	.LC123
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
