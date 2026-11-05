#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"pp.c"
	.option nopic
	.text
	.section	.rodata.ctxnext.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `i != -1' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/pp.c:172  \n"
	.section	.text.ctxnext,"ax",@progbits
	.align	2
	.type	ctxnext, @function
ctxnext:
	addi	sp,sp,-44
	sw	s1,32(sp)
	sw	ra,40(sp)
	sw	s0,36(sp)
	lla	s1,.LANCHOR1
.L2:
	li	a1,12
	lla	a0,.LANCHOR0
	call	arraylast
	lla	a3,.LANCHOR0
	lw	a5,4(a3)
	beq	a5,zero,.L8
	mv	s0,a0
	j	.L3
.L7:
	lw	a5,0(s1)
	addi	a5,a5,-1
	sw	a5,0(s1)
.L6:
	lw	a5,4(a3)
	addi	s0,s0,-12
	addi	a5,a5,-12
	sw	a5,4(a3)
	beq	a5,zero,.L8
.L3:
	lw	a4,4(s0)
	lw	a5,8(s0)
	bne	a4,zero,.L5
	beq	a5,zero,.L6
	lw	a2,0(a5)
	sb	zero,8(a5)
	li	a4,1
	bne	a2,a4,.L7
	lw	a4,16(a5)
	beq	a4,zero,.L7
	lw	a4,20(a5)
	sw	a5,0(sp)
	lw	a0,0(a4)
	call	free
	lw	a5,0(sp)
	lw	a0,20(a5)
	call	free
	lla	a3,.LANCHOR0
	j	.L7
.L5:
	mv	t1,s0
	mv	s0,a4
	lw	a4,0(t1)
	sw	a4,12(sp)
	beq	a5,zero,.L45
	lw	a1,0(a5)
	li	a2,1
	bne	a1,a2,.L45
	lw	t0,12(sp)
	li	a0,4
	lbu	a4,5(t0)
	lw	a1,0(t0)
	sw	a4,16(sp)
	beq	a1,a0,.L11
	li	a3,109
	mv	a4,s0
	mv	s0,t1
	bne	a1,a3,.L44
	lw	a3,24(t0)
	addi	a4,a4,-2
	addi	a2,t0,48
	sw	a4,4(t1)
	sw	a2,0(t1)
	beq	a3,a0,.L47
.L25:
	lla	s0,.LC0
	li	a0,65
.L16:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L16
	lla	s0,.LC1
	li	a0,65
.L17:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L17
	lla	s0,.LC2
	li	a0,32
.L18:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L18
	li	a0,1
	call	halt
.L8:
	lw	ra,40(sp)
	lw	s0,36(sp)
	li	t0,0
	lw	s1,32(sp)
	mv	a0,t0
	addi	sp,sp,44
	jr	ra
.L49:
	lw	a4,20(sp)
	lw	s0,24(sp)
	lw	t0,12(sp)
.L44:
	addi	a4,a4,-1
.L10:
	addi	a5,t0,24
	lw	ra,40(sp)
	sw	a4,4(s0)
	sw	a5,0(s0)
	lw	s0,36(sp)
	lw	s1,32(sp)
	mv	a0,t0
	addi	sp,sp,44
	jr	ra
.L47:
	lw	a4,16(a5)
	mv	a3,a4
	sw	a4,4(sp)
	lw	a4,12(a5)
	beq	a3,zero,.L25
	lw	a1,44(t0)
	mv	s0,a4
	li	s1,0
	sw	a5,8(sp)
	j	.L15
.L48:
	lw	a5,4(sp)
	addi	s1,s1,1
	lw	a1,0(sp)
	addi	s0,s0,8
	beq	a5,s1,.L25
.L15:
	lw	a0,0(s0)
	sw	a1,0(sp)
	call	strcmp
	bne	a0,zero,.L48
	lw	a5,8(sp)
	slli	s1,s1,5
	li	a1,12
	lw	a5,20(a5)
	lla	a0,.LANCHOR0
	add	s1,a5,s1
	call	arrayadd
	li	a5,1
	sw	a5,4(a0)
	lw	a5,16(sp)
	addi	t0,s1,8
	sw	t0,0(a0)
	sw	zero,8(a0)
	mv	s0,a0
	sb	a5,13(s1)
	li	a4,0
	j	.L10
.L11:
	lw	a4,16(a5)
	lw	t0,12(a5)
	sw	a4,8(sp)
	beq	a4,zero,.L45
	lw	a4,12(sp)
	li	a2,0
	sw	s0,20(sp)
	lw	a1,20(a4)
	sw	t1,24(sp)
	mv	s0,a2
	sw	a5,28(sp)
	j	.L21
.L50:
	lw	t0,4(sp)
	lw	a5,8(sp)
	addi	s0,s0,1
	lw	a1,0(sp)
	addi	t0,t0,8
	beq	a5,s0,.L49
.L21:
	lw	a0,0(t0)
	sw	t0,4(sp)
	sw	a1,0(sp)
	call	strcmp
	bne	a0,zero,.L50
	lw	a5,28(sp)
	mv	a2,s0
	slli	a2,a2,5
	lw	a5,20(a5)
	lw	s0,20(sp)
	lw	a1,12(sp)
	lw	t1,24(sp)
	add	a5,a5,a2
	lw	a2,4(a5)
	addi	a4,s0,-1
	addi	s0,a1,24
	sw	a4,4(t1)
	sw	s0,0(t1)
	beq	a2,zero,.L2
	lw	t0,0(a5)
	li	a1,12
	lla	a0,.LANCHOR0
	sw	a2,4(sp)
	sw	t0,0(sp)
	call	arrayadd
	lw	t0,0(sp)
	lw	a2,4(sp)
	lw	a5,16(sp)
	sw	t0,0(a0)
	sw	a2,4(a0)
	sw	zero,8(a0)
	mv	s0,a0
	sb	a5,5(t0)
	addi	a4,a2,-1
	j	.L10
.L45:
	mv	a4,s0
	lw	t0,12(sp)
	mv	s0,t1
	addi	a4,a4,-1
	j	.L10
	.size	ctxnext, .-ctxnext
	.section	.text.ppinit,"ax",@progbits
	.align	2
	.globl	ppinit
	.hidden	ppinit
	.type	ppinit, @function
ppinit:
	addi	sp,sp,-12
	li	a2,12
	li	a1,0
	lla	a0,.LANCHOR0
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR2; sw zero, 0(a5);
	lla	s0,.LANCHOR3
	call	memset
	li	a1,0
	mv	a0,s0
	li	a2,16
	call	memset
	mv	a0,s0
	la a5, .LANCHOR1; sw zero, 0(a5);
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a5,1
	la a4, .LANCHOR4; sb a5, 0(a4);
	li	a1,64
	addi	sp,sp,12
	tail	mapinit
	.size	ppinit, .-ppinit
	.section	.text.next,"ax",@progbits
	.align	2
	.globl	next
	.hidden	next
	.type	next, @function
next:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	ra,28(sp)
	sw	s1,20(sp)
	lla	s0,tok
.L54:
	call	ctxnext
	mv	s1,a0
	beq	a0,zero,.L77
	lw	a5,0(a0)
.L56:
	li	a3,4
	beq	a5,a3,.L78
	li	a3,2
	bne	a5,a3,.L61
.L79:
	la a5, .LANCHOR2; lw a5, 0(a5);
	andi	a5,a5,1
	beq	a5,zero,.L54
	lw	t1,0(s1)
	lw	a0,4(s1)
	lw	a1,8(s1)
	lw	a2,12(s1)
	lw	a3,16(s1)
	lw	a5,20(s1)
	sw	t1,0(s0)
	sw	a0,4(s0)
	sw	a1,8(s0)
	sw	a2,12(s0)
	sw	a3,16(s0)
	sw	a5,20(s0)
.L53:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L78:
	mv	a0,s1
	call	expand.part.0
	bne	a0,zero,.L54
	lw	a5,0(s1)
	li	a3,2
	beq	a5,a3,.L79
.L61:
	lw	t2,0(s1)
	lw	t0,4(s1)
	lw	a0,8(s1)
	lw	a1,12(s1)
	lw	a2,16(s1)
	lw	t1,20(s1)
	li	a3,4
	sw	t2,0(s0)
	sw	t0,4(s0)
	sw	a0,8(s0)
	sw	a1,12(s0)
	sw	a2,16(s0)
	sw	t1,20(s0)
	bne	a5,a3,.L53
	li	a3,72
	li	a2,0
	j	.L67
.L68:
	lw	a1,0(a1)
	sw	t0,16(sp)
	sw	t1,12(sp)
	sw	a2,8(sp)
	sw	a5,4(sp)
	sw	a3,0(sp)
	call	strcmp
	lw	a3,0(sp)
	lw	a5,4(sp)
	lw	a2,8(sp)
	lw	t1,12(sp)
	lw	t0,16(sp)
	beq	a0,zero,.L80
	bge	a0,zero,.L81
	mv	a3,a5
.L67:
	add	a5,a3,a2
	srli	a5,a5,1
	slli	t0,a5,3
	lla	a4,.LANCHOR5
	add	a1,a4,t0
	mv	a0,t1
	bgtu	a3,a2,.L68
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L77:
	lla	s1,tok
	j	.L55
.L82:
	lw	a5,0(s0)
	bne	a5,a4,.L58
	call	directive
.L55:
	mv	a0,s1
	call	scan
	lla	a5,.LANCHOR4
	lbu	a5,0(a5)
	li	a4,109
	bne	a5,zero,.L82
	lw	a5,0(s0)
.L58:
	addi	a4,a5,-2
	seqz	a4,a4
	lla	a3,.LANCHOR4
	sb	a4,0(a3)
	lla	s1,tok
	j	.L56
.L80:
	beq	s1,s0,.L83
.L66:
	lla	a5,.LANCHOR5
	add	s1,a5,t0
	lw	a5,4(s1)
	la a4, tok+20; sw zero, 0(a4);
	sw	a5,0(s0)
	j	.L53
.L81:
	addi	a2,a5,1
	j	.L67
.L83:
	mv	a0,t1
	sw	t0,0(sp)
	call	free
	lw	t0,0(sp)
	j	.L66
	.size	next, .-next
	.section	.rodata.directive.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"newline, or number after '#'"
	.align	2
.LC4:
	.string	"if"
	.align	2
.LC5:
	.string	"#if directive is not implemented"
	.align	2
.LC6:
	.string	"ifdef"
	.align	2
.LC7:
	.string	"#ifdef directive is not implemented"
	.align	2
.LC8:
	.string	"ifndef"
	.align	2
.LC9:
	.string	"#ifndef directive is not implemented"
	.align	2
.LC10:
	.string	"elif"
	.align	2
.LC11:
	.string	"#elif directive is not implemented"
	.align	2
.LC12:
	.string	"endif"
	.align	2
.LC13:
	.string	"#endif directive is not implemented"
	.align	2
.LC14:
	.string	"include"
	.align	2
.LC15:
	.string	"#include directive is not implemented"
	.align	2
.LC16:
	.string	"define"
	.align	2
.LC17:
	.string	"after #define"
	.align	2
.LC18:
	.string	"after '...'"
	.align	2
.LC19:
	.string	"or ')' after macro parameter"
	.align	2
.LC20:
	.string	"__VA_ARGS__"
	.align	2
.LC21:
	.string	"of macro parameter name or '...'"
	.align	2
.LC22:
	.string	"'##' operator is not yet implemented"
	.align	2
.LC23:
	.string	"after '#' operator"
	.align	2
.LC24:
	.string	"'%s' is not a macro parameter name"
	.globl	__udivsi3
	.align	2
.LC25:
	.string	"redefinition of macro '%s'"
	.align	2
.LC26:
	.string	"undef"
	.align	2
.LC27:
	.string	"after #undef"
	.align	2
.LC28:
	.string	"line"
	.align	2
.LC29:
	.string	"after #line"
	.align	2
.LC30:
	.string	"error"
	.align	2
.LC31:
	.string	"#error directive is not implemented"
	.align	2
.LC32:
	.string	"pragma"
	.align	2
.LC33:
	.string	"invalid preprocessor directive #%s"
	.align	2
.LC34:
	.string	"after preprocessing directive"
	.align	2
.LC35:
	.string	"__VA_ARGS__ can only be used in variadic function-like macros"
	.section	.text.directive,"ax",@progbits
	.align	2
	.type	directive, @function
directive:
	addi	sp,sp,-100
	lla	a0,tok
	sw	s0,92(sp)
	sw	ra,96(sp)
	mv	s0,a0
	sw	s1,88(sp)
	call	scan
	lw	a5,0(s0)
	li	a4,2
	beq	a5,a4,.L84
	lla	a2,.LANCHOR2
	lw	a4,0(a2)
	mv	a3,a4
	ori	a3,a3,1
	sw	a4,4(sp)
	sw	a3,0(a2)
	li	a4,5
	beq	a5,a4,.L144
	li	a1,4
	lla	a2,.LC3
	mv	a0,s0
	call	tokencheck
	lla	a1,.LC4
	sw	a0,0(sp)
	call	strcmp
	beq	a0,zero,.L187
	lw	a0,0(sp)
	lla	a1,.LC6
	call	strcmp
	beq	a0,zero,.L188
	lw	a0,0(sp)
	lla	a1,.LC8
	call	strcmp
	beq	a0,zero,.L189
	lw	a0,0(sp)
	lla	a1,.LC10
	call	strcmp
	beq	a0,zero,.L190
	lw	a0,0(sp)
	lla	a1,.LC12
	call	strcmp
	beq	a0,zero,.L191
	lw	a0,0(sp)
	lla	a1,.LC14
	call	strcmp
	beq	a0,zero,.L192
	lw	a0,0(sp)
	lla	a1,.LC16
	call	strcmp
	beq	a0,zero,.L193
	lw	a0,0(sp)
	lla	a1,.LC26
	call	strcmp
	beq	a0,zero,.L194
	lw	a0,0(sp)
	lla	a1,.LC28
	call	strcmp
	beq	a0,zero,.L195
	lw	a0,0(sp)
	lla	a1,.LC30
	call	strcmp
	beq	a0,zero,.L196
	lw	a0,0(sp)
	lla	a1,.LC32
	call	strcmp
	bne	a0,zero,.L136
	lw	a5,0(s0)
	li	a4,1
	addi	a5,a5,-1
	bleu	a5,a4,.L88
	li	s1,1
.L137:
	call	next
	lw	a5,0(s0)
	addi	a5,a5,-1
	bgtu	a5,s1,.L137
	j	.L88
.L144:
	sw	zero,0(sp)
.L86:
	lw	a0,20(s0)
	li	a2,0
	li	a1,0
	call	strtoull
	mv	a5,a0
	sw	a5,80(sp)
	lla	a0,tok
	li	a5,1
	sw	a5,84(sp)
	call	scan
	lw	a3,8(s0)
	lw	a5,0(s0)
	li	a4,7
	sw	a3,8(sp)
	beq	a5,a4,.L197
.L132:
	li	a4,5
	lla	s1,tok
	bne	a5,a4,.L134
.L133:
	mv	a0,s1
	call	scan
	lw	a4,0(s0)
	li	a5,5
	beq	a4,a5,.L133
.L134:
	lw	a5,8(sp)
	addi	a0,sp,36
	sw	a5,76(sp)
	sw	a5,36(sp)
	lw	a5,80(sp)
	sw	a5,40(sp)
	lw	a5,84(sp)
	sw	a5,44(sp)
	call	scansetloc
.L88:
	lw	a0,0(sp)
	call	free
	lla	a2,.LC34
	li	a1,2
	lla	a0,tok
	call	tokencheck
	lw	a4,4(sp)
	lla	a5,.LANCHOR2
	sw	a4,0(a5)
.L84:
	lw	ra,96(sp)
	lw	s0,92(sp)
	lw	s1,88(sp)
	addi	sp,sp,100
	jr	ra
.L187:
	lla	a1,.LC5
	lla	a0,tok+8
	call	error
	j	.L88
.L189:
	lla	a1,.LC9
	lla	a0,tok+8
	call	error
	j	.L88
.L188:
	lla	a1,.LC7
	lla	a0,tok+8
	call	error
	j	.L88
.L197:
	lw	a0,20(s0)
	li	a1,34
	call	strchr
	addi	a5,a0,1
	mv	a0,a5
	li	a1,34
	sw	a5,8(sp)
	call	strchr
	sb	zero,0(a0)
	lla	a0,tok
	call	scan
	lw	a5,0(s0)
	j	.L132
.L190:
	lla	a1,.LC11
	lla	a0,tok+8
	call	error
	j	.L88
.L192:
	lla	a1,.LC15
	lla	a0,tok+8
	call	error
	j	.L88
.L191:
	lla	a1,.LC13
	lla	a0,tok+8
	call	error
	j	.L88
.L193:
	mv	a0,s0
	call	scan
	li	a0,32
	sw	zero,52(sp)
	sw	zero,56(sp)
	sw	zero,60(sp)
	sw	zero,64(sp)
	sw	zero,68(sp)
	sw	zero,72(sp)
	call	xmalloc
	mv	a5,a0
	lla	a2,.LC17
	li	a1,4
	mv	a0,s0
	mv	s1,a5
	sw	a5,20(sp)
	call	tokencheck
	sw	a0,4(s1)
	li	a1,24
	sb	zero,8(s1)
	addi	a0,sp,64
	call	arrayadd
	mv	s1,a0
	sw	a0,12(sp)
	call	scan
	lw	a4,0(s1)
	li	a5,64
	beq	a4,a5,.L198
.L95:
	lw	a5,20(sp)
	sw	zero,0(a5)
.L102:
	lw	a2,56(sp)
	lw	a1,20(sp)
	lw	a3,52(sp)
	srli	a2,a2,3
	li	a5,4
	sw	a2,24(sp)
	sw	a3,12(a1)
	sw	a2,16(a1)
	bne	a4,a5,.L103
	beq	a2,zero,.L186
	lw	a5,12(sp)
	li	s1,0
	sw	a4,28(sp)
	lw	a1,20(a5)
	j	.L108
.L200:
	lw	a5,24(sp)
	addi	s1,s1,1
	lw	a3,8(sp)
	lw	a1,16(sp)
	beq	a5,s1,.L199
.L108:
	lw	a0,0(a3)
	addi	a3,a3,8
	sw	a1,16(sp)
	sw	a3,8(sp)
	call	strcmp
	bne	a0,zero,.L200
	lw	a4,28(sp)
.L106:
	mv	a2,a4
	j	.L122
.L203:
	li	a4,-1
	beq	s1,a4,.L116
.L143:
	lw	a5,20(sp)
	lw	a4,12(a5)
	slli	a5,s1,3
	add	a5,a4,a5
	lw	a4,4(a5)
	ori	a4,a4,1
	sw	a4,4(a5)
.L116:
	li	a5,4
	beq	a3,a5,.L117
	lw	a5,32(sp)
	li	a4,109
	mv	a2,a3
	li	s1,-1
	beq	a5,a4,.L138
.L115:
	addi	a4,a2,-1
	li	a3,1
	bleu	a4,a3,.L107
.L122:
	li	a5,110
	beq	a2,a5,.L201
.L110:
	lw	a5,12(sp)
	li	a1,24
	addi	a0,sp,64
	lw	a5,0(a5)
	sw	a5,32(sp)
	call	arrayadd
	sw	a0,12(sp)
	call	scan
	lw	a5,12(sp)
	lw	a3,0(a5)
	li	a5,4
	beq	a3,a5,.L202
.L111:
	lw	a5,20(sp)
	li	a4,1
	lw	a5,0(a5)
	beq	a5,a4,.L203
	mv	a2,a3
	j	.L115
.L202:
	lw	a5,12(sp)
	lla	a1,.LC20
	sw	a3,8(sp)
	lw	a0,20(a5)
	call	strcmp
	lw	a5,20(sp)
	lw	a3,8(sp)
	li	a4,1
	lw	a5,0(a5)
	bne	a0,zero,.L112
	beq	a5,a4,.L204
.L113:
	lw	a5,12(sp)
	lla	a1,.LC35
	addi	a0,a5,8
	call	error
	lw	a5,12(sp)
	lw	a3,0(a5)
	j	.L111
.L112:
	bne	a5,a4,.L110
.L114:
	li	a4,-1
	bne	s1,a4,.L143
.L117:
	lw	a5,20(sp)
	lw	a3,16(a5)
	lw	a4,12(a5)
	sw	a3,24(sp)
	beq	a3,zero,.L119
	lw	a5,12(sp)
	li	s1,0
	lw	a1,20(a5)
	mv	a5,s1
	mv	s1,a4
	j	.L121
.L205:
	lw	a4,24(sp)
	addi	a5,a5,1
	lw	a1,16(sp)
	addi	s1,s1,8
	beq	a4,a5,.L119
.L121:
	lw	a0,0(s1)
	slli	a4,a5,3
	sw	a5,8(sp)
	sw	a1,16(sp)
	sw	a4,28(sp)
	call	strcmp
	lw	a5,8(sp)
	bne	a0,zero,.L205
	mv	s1,a5
	lw	a5,32(sp)
	li	a4,109
	bne	a5,a4,.L110
	lw	a0,12(sp)
	lla	a2,.LC23
	li	a1,4
	call	tokencheck
.L140:
	lw	a5,20(sp)
	li	s1,-1
	lw	a4,12(a5)
	lw	a5,12(sp)
	lw	a2,0(a5)
	lw	a5,28(sp)
	add	a4,a4,a5
	lw	a3,4(a4)
	ori	a3,a3,2
	sw	a3,4(a4)
	j	.L115
.L201:
	lw	a5,12(sp)
	lla	a1,.LC22
	addi	a0,a5,8
	call	error
	j	.L110
.L119:
	lw	a4,32(sp)
	li	a5,109
	beq	a4,a5,.L138
	li	s1,-1
	j	.L110
.L103:
	addi	a3,a4,-1
	li	a2,1
	li	s1,-1
	bgtu	a3,a2,.L106
.L107:
	lw	a5,64(sp)
	lw	s1,20(sp)
	lw	a0,68(sp)
	li	a1,24
	sw	a5,24(s1)
	call	__udivsi3
	lw	a5,12(sp)
	mv	t2,s1
	lw	s1,4(s1)
	lw	a4,20(a5)
	lw	t0,0(a5)
	lw	t1,4(a5)
	lw	a1,8(a5)
	lw	a2,12(a5)
	lw	a3,16(a5)
	addi	a5,a0,-1
	sw	a5,28(t2)
	mv	a0,s1
	sw	a4,20(s0)
	sw	t0,0(s0)
	sw	t1,4(s0)
	sw	a3,16(s0)
	sw	a1,8(s0)
	sw	a2,12(s0)
	call	strlen
	mv	a2,a0
	mv	a1,s1
	addi	a0,sp,76
	call	mapkey
	addi	a1,sp,76
	lla	a0,.LANCHOR3
	call	mapput
	lw	a4,0(a0)
	mv	s0,a0
	beq	a4,zero,.L123
	lw	t2,20(sp)
	lw	a3,0(a4)
	lw	a5,0(t2)
	beq	a5,a3,.L206
.L124:
	lw	a5,20(sp)
	lla	a1,.LC25
	lla	a0,tok+8
	lw	a2,4(a5)
	call	error
.L123:
	lw	a5,20(sp)
	sw	a5,0(s0)
	j	.L88
.L194:
	lla	a0,tok
	call	scan
	lla	a2,.LC27
	li	a1,4
	lla	a0,tok
	call	tokencheck
	mv	s1,a0
	call	strlen
	mv	a2,a0
	mv	a1,s1
	addi	a0,sp,76
	call	mapkey
	addi	a1,sp,76
	lla	a0,.LANCHOR3
	call	mapput
	lw	s0,0(a0)
	sw	a0,8(sp)
	beq	s0,zero,.L130
	mv	a0,s1
	call	free
	lw	a0,12(s0)
	call	free
	lw	a0,24(s0)
	call	free
	lw	a5,8(sp)
	sw	zero,0(a5)
.L130:
	lla	a0,tok
	call	scan
	j	.L88
.L204:
	lw	a5,20(sp)
	lw	a4,16(a5)
	beq	a4,zero,.L113
	lw	a5,12(a5)
	slli	a4,a4,3
	add	a4,a5,a4
	lw	a4,-4(a4)
	andi	a4,a4,4
	bne	a4,zero,.L114
	j	.L113
.L138:
	lw	a0,12(sp)
	lla	a2,.LC23
	li	a1,4
	call	tokencheck
	lw	a5,12(sp)
	lla	a1,.LC24
	lw	a2,20(a5)
	addi	a0,a5,8
	call	error
	li	a5,-8
	sw	a5,28(sp)
	j	.L140
.L195:
	lla	a0,tok
	call	scan
	lla	a2,.LC29
	li	a1,5
	lla	a0,tok
	call	tokencheck
	j	.L86
.L206:
	li	a3,1
	beq	a5,a3,.L207
.L125:
	lw	a3,20(sp)
	lw	a5,28(a4)
	lw	a2,28(a3)
	bne	a2,a5,.L124
	lw	a5,24(a3)
	slli	a3,a2,1
	add	a3,a3,a2
	slli	a3,a3,3
	add	s1,a5,a3
	lw	a4,24(a4)
	bgeu	a5,s1,.L123
	sw	s0,12(sp)
	sw	s1,8(sp)
	mv	s0,a5
	mv	s1,a4
	j	.L128
.L209:
	lw	a0,20(s0)
	addi	s0,s0,24
	beq	a0,zero,.L127
	lw	a1,20(s1)
	call	strcmp
	bne	a0,zero,.L184
.L127:
	lw	a5,8(sp)
	addi	s1,s1,24
	bgeu	s0,a5,.L208
.L128:
	lw	a2,0(s0)
	lw	a3,0(s1)
	beq	a2,a3,.L209
.L184:
	lw	s0,12(sp)
	j	.L124
.L198:
	lw	a5,12(sp)
	lbu	a5,5(a5)
	bne	a5,zero,.L95
	lw	a4,20(sp)
	li	a5,1
	li	s1,0
	sw	a5,0(a4)
.L96:
	lla	a0,tok
	call	scan
	lw	a4,0(s0)
	li	a5,65
	beq	a4,a5,.L210
.L101:
	beq	s1,zero,.L97
	lw	a5,4(s1)
	andi	a5,a5,4
	bne	a5,zero,.L211
.L98:
	lla	a2,.LC19
	li	a1,108
	lla	a0,tok
	call	tokencheck
	lla	a0,tok
	call	scan
.L97:
	li	a1,8
	addi	a0,sp,52
	call	arrayadd
	lw	a4,0(s0)
	mv	s1,a0
	sw	zero,4(s1)
	li	a5,96
	lla	a2,.LC21
	li	a1,4
	lla	a0,tok
	bne	a4,a5,.L99
	lla	a5,.LC20
	sw	a5,0(s1)
	li	a5,4
	sw	a5,4(s1)
	lla	a0,tok
	call	scan
	lw	a4,0(s0)
	li	a5,65
	bne	a4,a5,.L101
.L210:
	lw	s1,12(sp)
	mv	a0,s1
	call	scan
	lw	a4,0(s1)
	j	.L102
.L99:
	call	tokencheck
	sw	a0,0(s1)
	j	.L96
.L211:
	lla	a2,.LC18
	li	a1,65
	lla	a0,tok
	call	tokencheck
	j	.L98
.L196:
	lla	a1,.LC31
	lla	a0,tok+8
	call	error
	j	.L88
.L199:
	lw	a4,28(sp)
.L186:
	li	s1,-1
	j	.L106
.L136:
	lw	a2,0(sp)
	lla	a1,.LC33
	lla	a0,tok+8
	call	error
	j	.L88
.L207:
	lw	a3,16(t2)
	lw	a5,16(a4)
	bne	a3,a5,.L124
	lw	a5,12(t2)
	slli	a2,a3,3
	lw	a3,12(a4)
	add	s1,a5,a2
	bgeu	a5,s1,.L125
	sw	s1,12(sp)
	sw	a0,8(sp)
	mv	s0,a5
	sw	a4,16(sp)
	mv	s1,a3
	j	.L126
.L213:
	lw	a2,4(s0)
	lw	a4,4(s1)
	addi	s0,s0,8
	addi	s1,s1,8
	bne	a2,a4,.L182
	lw	a5,12(sp)
	bgeu	s0,a5,.L212
.L126:
	lw	a1,0(s1)
	lw	a0,0(s0)
	call	strcmp
	beq	a0,zero,.L213
.L182:
	lw	s0,8(sp)
	j	.L124
.L208:
	lw	s0,12(sp)
	j	.L123
.L212:
	lw	s0,8(sp)
	lw	a4,16(sp)
	j	.L125
	.size	directive, .-directive
	.section	.rodata.expand.part.0.str1.4,"aMS",@progbits,1
	.align	2
.LC36:
	.string	"\""
	.align	2
.LC37:
	.string	"EOF when reading macro parameters"
	.align	2
.LC38:
	.string	" "
	.align	2
.LC39:
	.string	"\\"
	.align	2
.LC40:
	.string	"not enough arguments for macro '%s'"
	.align	2
.LC41:
	.string	"too many arguments for macro '%s'"
	.section	.text.expand.part.0,"ax",@progbits
	.align	2
	.type	expand.part.0, @function
expand.part.0:
	addi	sp,sp,-76
	sw	s1,64(sp)
	lw	s1,20(a0)
	sw	s0,68(sp)
	mv	s0,a0
	mv	a0,s1
	sw	ra,72(sp)
	call	strlen
	mv	a2,a0
	mv	a1,s1
	addi	a0,sp,52
	call	mapkey
	addi	a1,sp,52
	lla	a0,.LANCHOR3
	call	mapget
	sw	a0,24(sp)
	beq	a0,zero,.L215
	lbu	a5,8(a0)
	beq	a5,zero,.L216
.L215:
	li	a5,1
	sb	a5,4(s0)
	sw	zero,0(sp)
.L302:
	lw	ra,72(sp)
	lw	s0,68(sp)
	lw	a0,0(sp)
	lw	s1,64(sp)
	addi	sp,sp,76
	jr	ra
.L216:
	lbu	a5,4(s0)
	sw	a5,0(sp)
	bne	a5,zero,.L226
	lw	a5,24(sp)
	lbu	a3,5(s0)
	lw	a4,0(a5)
	sw	a3,32(sp)
	lla	a3,.LANCHOR1
	li	a5,1
	sw	a3,16(sp)
	beq	a4,a5,.L311
.L219:
	lw	a5,24(sp)
	li	a1,12
	lla	a0,.LANCHOR0
	lw	s1,24(a5)
	lw	s0,28(a5)
	call	arrayadd
	lw	a5,24(sp)
	sw	s1,0(a0)
	sw	s0,4(a0)
	sw	a5,8(a0)
	beq	s0,zero,.L273
	lw	a5,32(sp)
	sb	a5,5(s1)
.L273:
	lw	a3,16(sp)
	lw	a2,24(sp)
	lw	ra,72(sp)
	lw	a5,0(a3)
	lw	s0,68(sp)
	li	a4,1
	addi	a5,a5,1
	sw	a5,0(a3)
	li	a5,1
	sw	a5,0(sp)
	sb	a4,8(a2)
	lw	a0,0(sp)
	lw	s1,64(sp)
	addi	sp,sp,76
	jr	ra
.L311:
	call	ctxnext
	beq	a0,zero,.L220
	lw	a4,0(a0)
	li	a5,64
	beq	a4,a5,.L221
	li	a1,12
	lla	a0,.LANCHOR0
	call	arraylast
	lw	a3,0(a0)
	lw	a4,4(a0)
	addi	a3,a3,-24
	addi	a4,a4,1
	sw	a3,0(a0)
	sw	a4,4(a0)
	j	.L302
.L220:
	la a5, .LANCHOR6+4; sw zero, 0(a5);
	lla	a5,tok
	lla	s1,.LANCHOR4
	sw	a5,4(sp)
.L225:
	li	a1,24
	lla	a0,.LANCHOR6
	call	arrayadd
	mv	s0,a0
	j	.L224
.L312:
	lw	a5,0(s0)
	li	a4,109
	bne	a5,a4,.L223
	call	directive
.L224:
	mv	a0,s0
	call	scan
	lbu	a5,0(s1)
	bne	a5,zero,.L312
	lw	a5,0(s0)
.L223:
	lw	a4,4(sp)
	li	a3,2
	lw	a4,0(a4)
	addi	a4,a4,-2
	seqz	a4,a4
	sb	a4,0(s1)
	beq	a5,a3,.L225
	li	a4,64
	beq	a5,a4,.L221
	lla	a4,.LANCHOR6
	lw	s0,0(a4)
	lw	a5,4(a4)
	li	a1,12
	lbu	a4,5(s0)
	lla	a0,.LANCHOR0
	sw	a5,4(sp)
	sw	a4,8(sp)
	call	arrayadd
	mv	s1,a0
	sw	s0,0(a0)
	lw	a0,4(sp)
	li	a1,24
	call	__udivsi3
	lw	a5,4(sp)
	sw	a0,4(s1)
	sw	zero,8(s1)
	li	a3,23
	bleu	a5,a3,.L226
	lw	a4,8(sp)
	sb	a4,5(s0)
	j	.L302
.L221:
	lw	a5,24(sp)
	li	a2,32
	li	a0,0
	lw	a1,16(a5)
	lla	a5,.LANCHOR1
	lw	s0,0(a5)
	sw	a5,16(sp)
	sw	zero,52(sp)
	sw	zero,56(sp)
	sw	zero,60(sp)
	call	xreallocarray
	sw	a0,36(sp)
	call	ctxnext
	mv	s1,a0
	beq	a0,zero,.L313
.L227:
	lw	a5,24(sp)
	lw	a5,16(a5)
	beq	a5,zero,.L231
	lw	a5,36(sp)
	sw	zero,28(sp)
	sw	a5,20(sp)
.L267:
	lw	a5,24(sp)
	lw	a3,12(a5)
	lw	a5,28(sp)
	slli	a5,a5,3
	add	a5,a3,a5
	sw	a5,12(sp)
	lw	a5,4(a5)
	andi	a5,a5,2
	bne	a5,zero,.L314
.L232:
	lw	a5,20(sp)
	sw	s0,4(sp)
	sw	zero,8(sp)
	sw	zero,4(a5)
	lw	a5,0(s1)
	j	.L233
.L319:
	li	a2,65
	beq	a4,a2,.L237
	li	a2,108
	beq	a4,a2,.L315
	li	a2,64
	beq	a4,a2,.L241
.L240:
	andi	a2,a5,2
	sw	s0,4(sp)
	bne	a2,zero,.L316
.L235:
	andi	a5,a5,1
	beq	a5,zero,.L253
	lw	a4,0(s1)
	li	a5,4
	beq	a4,a5,.L254
.L256:
	li	a2,24
	mv	a1,s1
	addi	a0,sp,52
	call	arrayaddbuf
	lw	a4,20(sp)
	lw	a5,4(a4)
	addi	a5,a5,1
	sw	a5,4(a4)
.L253:
	call	ctxnext
	mv	s1,a0
	beq	a0,zero,.L317
	lw	a5,0(s1)
.L233:
	li	a4,1
	beq	a5,a4,.L318
.L234:
	lw	a5,16(sp)
	lw	a4,4(sp)
	lw	s0,0(a5)
	lw	a5,12(sp)
	lw	a5,4(a5)
	bgtu	s0,a4,.L235
	lw	a3,8(sp)
	lw	a4,0(s1)
	beq	a3,zero,.L319
	li	a2,64
	beq	a4,a2,.L241
	lw	a3,8(sp)
	addi	a2,a4,-65
	seqz	a2,a2
	sub	a3,a3,a2
	sw	a3,8(sp)
	andi	a2,a5,2
	sw	s0,4(sp)
	beq	a2,zero,.L235
.L316:
	lbu	a5,5(s1)
	bne	a5,zero,.L243
	li	a5,2
	beq	a4,a5,.L243
.L244:
	lw	a5,20(s1)
	addi	a2,a4,-6
	beq	a5,zero,.L320
.L245:
	li	a4,1
	bgtu	a2,a4,.L251
.L246:
	lbu	a4,0(a5)
	beq	a4,zero,.L310
	sw	s0,0(sp)
	mv	s0,a5
	j	.L250
.L249:
	mv	a1,s0
	li	a2,1
	addi	a0,sp,40
	addi	s0,s0,1
	call	arrayaddbuf
	lbu	a4,0(s0)
	beq	a4,zero,.L321
.L250:
	li	a5,92
	li	a3,34
	li	a2,1
	lla	a1,.LC39
	addi	a0,sp,40
	beq	a4,a5,.L248
	bne	a4,a3,.L249
.L248:
	call	arrayaddbuf
	mv	a1,s0
	li	a2,1
	addi	a0,sp,40
	addi	s0,s0,1
	call	arrayaddbuf
	lbu	a4,0(s0)
	bne	a4,zero,.L250
.L321:
	lw	s0,0(sp)
	lw	a5,12(sp)
	sw	s0,4(sp)
	lw	a5,4(a5)
	j	.L235
.L318:
	lla	a1,.LC37
	addi	a0,s1,8
	call	error
	j	.L234
.L317:
	lla	s0,tok
	lla	a5,.LANCHOR4
	sw	a5,0(sp)
	mv	s1,s0
	j	.L260
.L322:
	lw	a5,0(s0)
	bne	a5,a4,.L259
	call	directive
.L260:
	mv	a0,s1
	call	scan
	lw	a5,0(sp)
	li	a4,109
	lbu	a5,0(a5)
	bne	a5,zero,.L322
	lw	a5,0(s0)
.L259:
	lw	a3,0(sp)
	addi	a4,a5,-2
	seqz	a4,a4
	sb	a4,0(a3)
	lla	s1,tok
	j	.L233
.L241:
	lw	a3,8(sp)
	addi	a3,a3,1
	sw	a3,8(sp)
	j	.L240
.L243:
	lw	a5,44(sp)
	li	a2,1
	bleu	a5,a2,.L244
	lw	a2,40(sp)
	li	a1,32
	add	a5,a2,a5
	lbu	a5,-1(a5)
	beq	a5,a1,.L244
	li	a2,1
	lla	a1,.LC38
	addi	a0,sp,40
	call	arrayaddbuf
	lw	a4,0(s1)
	lw	a5,20(s1)
	addi	a2,a4,-6
	bne	a5,zero,.L245
.L320:
	slli	a4,a4,2
	lla	a5,tokstr
	add	a5,a5,a4
	li	a4,1
	lw	a5,0(a5)
	bleu	a2,a4,.L246
	bne	a5,zero,.L251
.L310:
	lw	a5,12(sp)
	sw	s0,4(sp)
	lw	a5,4(a5)
	j	.L235
.L315:
	andi	a2,a5,4
	bne	a2,zero,.L240
	andi	a5,a5,2
	bne	a5,zero,.L275
	call	ctxnext
	mv	s1,a0
	beq	a0,zero,.L323
.L263:
	lw	a5,24(sp)
	lw	a4,20(sp)
	lw	a3,16(a5)
	lw	a5,28(sp)
	addi	a4,a4,32
	sw	a4,20(sp)
	addi	a5,a5,1
	bgeu	a5,a3,.L324
	sw	a5,28(sp)
	j	.L267
.L251:
	mv	a0,a5
	sw	a5,0(sp)
	call	strlen
	lw	a5,0(sp)
	mv	a2,a0
	addi	a0,sp,40
	mv	a1,a5
	call	arrayaddbuf
	lw	a5,12(sp)
	sw	s0,4(sp)
	lw	a5,4(a5)
	j	.L235
.L254:
	mv	a0,s1
	call	expand.part.0
	beq	a0,zero,.L256
	j	.L253
.L275:
	li	a2,2
	lla	a1,.LC36
	addi	a0,sp,40
	call	arrayaddbuf
	lw	a4,20(sp)
	li	a3,7
	lw	a5,40(sp)
	sw	a3,8(a4)
	lw	a3,0(s1)
	sw	a5,28(a4)
	sw	zero,12(a4)
	sw	zero,16(a4)
	sw	zero,20(a4)
	sw	zero,24(a4)
	li	a5,65
	beq	a3,a5,.L262
	call	ctxnext
	mv	s1,a0
	bne	a0,zero,.L263
.L323:
	lla	a5,.LANCHOR4
	lla	s1,tok
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	a5,8(sp)
	mv	s0,a5
	j	.L266
.L325:
	lw	a5,0(sp)
	lw	a5,0(a5)
	bne	a5,a4,.L306
	call	directive
.L266:
	mv	a0,s1
	call	scan
	lbu	a5,0(s0)
	li	a4,109
	bne	a5,zero,.L325
	lw	a5,0(sp)
	lw	s0,4(sp)
	lw	a5,0(a5)
.L265:
	lw	a4,8(sp)
	addi	a5,a5,-2
	seqz	a5,a5
	sb	a5,0(a4)
	lla	s1,tok
	j	.L263
.L237:
	andi	a5,a5,2
	bne	a5,zero,.L275
.L262:
	lw	a5,24(sp)
	lw	a2,16(a5)
	lw	a5,28(sp)
	addi	a5,a5,1
	bgtu	a2,a5,.L274
.L269:
	lw	a5,36(sp)
	slli	a1,a2,5
	lw	a3,52(sp)
	mv	a4,a5
	add	a1,a1,a5
	beq	a2,zero,.L272
.L271:
	lw	a2,4(a4)
	sw	a3,0(a4)
	addi	a4,a4,32
	slli	a5,a2,1
	add	a5,a5,a2
	slli	a5,a5,3
	add	a3,a3,a5
	bne	a1,a4,.L271
.L272:
	lw	a5,24(sp)
	lw	a4,36(sp)
	sw	a4,20(a5)
	j	.L219
.L314:
	li	a2,1
	lla	a1,.LC36
	addi	a0,sp,40
	sw	zero,40(sp)
	sw	zero,44(sp)
	sw	zero,48(sp)
	call	arrayaddbuf
	j	.L232
.L324:
	lw	a5,28(sp)
	addi	a5,a5,2
	bleu	a3,a5,.L231
.L274:
	lw	a5,24(sp)
	lla	a1,.LC40
	addi	a0,s1,8
	lw	a2,4(a5)
	call	error
.L231:
	lw	a4,0(s1)
	li	a5,65
	beq	a4,a5,.L326
	lw	s0,24(sp)
	lla	a1,.LC41
	addi	a0,s1,8
	lw	a2,4(s0)
	call	error
	lw	a2,16(s0)
	j	.L269
.L306:
	lw	s0,4(sp)
	j	.L265
.L226:
	sw	zero,0(sp)
	j	.L302
.L326:
	lw	a5,24(sp)
	lw	a2,16(a5)
	j	.L269
.L313:
	lla	a5,tok
	sw	a5,4(sp)
	lla	s1,.LANCHOR4
	j	.L230
.L327:
	lw	a5,4(sp)
	lw	a5,0(a5)
	bne	a5,a4,.L229
	call	directive
.L230:
	lla	a0,tok
	call	scan
	lbu	a5,0(s1)
	li	a4,109
	bne	a5,zero,.L327
	lw	a5,4(sp)
	lw	a5,0(a5)
.L229:
	addi	a5,a5,-2
	seqz	a5,a5
	sb	a5,0(s1)
	lla	s1,tok
	j	.L227
	.size	expand.part.0, .-expand.part.0
	.section	.text.peek,"ax",@progbits
	.align	2
	.globl	peek
	.hidden	peek
	.type	peek, @function
peek:
	addi	sp,sp,-40
	sw	s0,32(sp)
	lla	s0,tok
	lw	a4,16(s0)
	lw	t1,0(s0)
	lw	a1,4(s0)
	lw	a2,8(s0)
	lw	a3,12(s0)
	lw	a5,20(s0)
	sw	s1,28(sp)
	sw	a4,20(sp)
	sw	ra,36(sp)
	mv	s1,a0
	sw	t1,4(sp)
	sw	a1,8(sp)
	sw	a2,12(sp)
	sw	a3,16(sp)
	sw	a5,24(sp)
	call	next
	lw	a4,0(s0)
	beq	a4,s1,.L332
	lla	s1,.LANCHOR7
	sw	a4,0(s1)
	lw	a4,4(sp)
	lw	a3,4(s0)
	lw	t2,8(s0)
	sw	a4,0(s0)
	lw	a4,8(sp)
	lw	t0,12(s0)
	lw	t1,16(s0)
	sw	a4,4(s0)
	lw	a4,12(sp)
	lw	a2,20(s0)
	srli	a5,a3,8
	sw	a4,8(s0)
	lw	a4,16(sp)
	andi	a5,a5,0xff
	li	a1,12
	sw	a4,12(s0)
	lw	a4,20(sp)
	lla	a0,.LANCHOR0
	sw	a5,0(sp)
	sw	a4,16(s0)
	lw	a4,24(sp)
	sw	a3,4(s1)
	sw	t2,8(s1)
	sw	a4,20(s0)
	sw	t0,12(s1)
	sw	t1,16(s1)
	sw	a2,20(s1)
	call	arrayadd
	lw	a5,0(sp)
	lw	ra,36(sp)
	lw	s0,32(sp)
	li	a4,1
	sw	s1,0(a0)
	sw	a4,4(a0)
	sw	zero,8(a0)
	sb	a5,5(s1)
	li	a0,0
	lw	s1,28(sp)
	addi	sp,sp,40
	jr	ra
.L332:
	call	next
	lw	ra,36(sp)
	lw	s0,32(sp)
	lw	s1,28(sp)
	li	a0,1
	addi	sp,sp,40
	jr	ra
	.size	peek, .-peek
	.section	.text.expect,"ax",@progbits
	.align	2
	.globl	expect
	.hidden	expect
	.type	expect, @function
expect:
	addi	sp,sp,-12
	mv	a2,a1
	mv	a1,a0
	lla	a0,tok
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	tokencheck
	mv	s0,a0
	call	next
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	expect, .-expect
	.section	.text.consume,"ax",@progbits
	.align	2
	.globl	consume
	.hidden	consume
	.type	consume, @function
consume:
	la a5, tok; lw a5, 0(a5);
	beq	a5,a0,.L342
	li	a0,0
	ret
.L342:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	next
	lw	ra,8(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
	.size	consume, .-consume
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC42:
	.string	"_Alignas"
	.align	2
.LC43:
	.string	"_Alignof"
	.align	2
.LC44:
	.string	"_Atomic"
	.align	2
.LC45:
	.string	"_Bool"
	.align	2
.LC46:
	.string	"_Complex"
	.align	2
.LC47:
	.string	"_Decimal128"
	.align	2
.LC48:
	.string	"_Decimal32"
	.align	2
.LC49:
	.string	"_Decimal64"
	.align	2
.LC50:
	.string	"_Generic"
	.align	2
.LC51:
	.string	"_Imaginary"
	.align	2
.LC52:
	.string	"_Noreturn"
	.align	2
.LC53:
	.string	"_Static_assert"
	.align	2
.LC54:
	.string	"_Thread_local"
	.align	2
.LC55:
	.string	"__alignof__"
	.align	2
.LC56:
	.string	"__asm"
	.align	2
.LC57:
	.string	"__asm__"
	.align	2
.LC58:
	.string	"__attribute__"
	.align	2
.LC59:
	.string	"__inline"
	.align	2
.LC60:
	.string	"__inline__"
	.align	2
.LC61:
	.string	"__restrict"
	.align	2
.LC62:
	.string	"__restrict__"
	.align	2
.LC63:
	.string	"__signed"
	.align	2
.LC64:
	.string	"__signed__"
	.align	2
.LC65:
	.string	"__thread"
	.align	2
.LC66:
	.string	"__typeof"
	.align	2
.LC67:
	.string	"__typeof__"
	.align	2
.LC68:
	.string	"__volatile"
	.align	2
.LC69:
	.string	"__volatile__"
	.align	2
.LC70:
	.string	"alignas"
	.align	2
.LC71:
	.string	"alignof"
	.align	2
.LC72:
	.string	"asm"
	.align	2
.LC73:
	.string	"auto"
	.align	2
.LC74:
	.string	"bool"
	.align	2
.LC75:
	.string	"break"
	.align	2
.LC76:
	.string	"case"
	.align	2
.LC77:
	.string	"char"
	.align	2
.LC78:
	.string	"const"
	.align	2
.LC79:
	.string	"constexpr"
	.align	2
.LC80:
	.string	"continue"
	.align	2
.LC81:
	.string	"default"
	.align	2
.LC82:
	.string	"do"
	.align	2
.LC83:
	.string	"else"
	.align	2
.LC84:
	.string	"enum"
	.align	2
.LC85:
	.string	"extern"
	.align	2
.LC86:
	.string	"false"
	.align	2
.LC87:
	.string	"for"
	.align	2
.LC88:
	.string	"goto"
	.align	2
.LC89:
	.string	"inline"
	.align	2
.LC90:
	.string	"int"
	.align	2
.LC91:
	.string	"long"
	.align	2
.LC92:
	.string	"nullptr"
	.align	2
.LC93:
	.string	"register"
	.align	2
.LC94:
	.string	"restrict"
	.align	2
.LC95:
	.string	"return"
	.align	2
.LC96:
	.string	"short"
	.align	2
.LC97:
	.string	"signed"
	.align	2
.LC98:
	.string	"sizeof"
	.align	2
.LC99:
	.string	"static"
	.align	2
.LC100:
	.string	"static_assert"
	.align	2
.LC101:
	.string	"struct"
	.align	2
.LC102:
	.string	"switch"
	.align	2
.LC103:
	.string	"thread_local"
	.align	2
.LC104:
	.string	"true"
	.align	2
.LC105:
	.string	"typedef"
	.align	2
.LC106:
	.string	"typeof"
	.align	2
.LC107:
	.string	"typeof_unqual"
	.align	2
.LC108:
	.string	"union"
	.align	2
.LC109:
	.string	"unsigned"
	.align	2
.LC110:
	.string	"void"
	.align	2
.LC111:
	.string	"volatile"
	.align	2
.LC112:
	.string	"while"
	.hidden	ppflags
	.globl	ppflags
	.section	.bss.ctx,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	ctx, @object
	.size	ctx, 12
ctx:
	.zero	12
	.section	.bss.macros,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	macros, @object
	.size	macros, 16
macros:
	.zero	16
	.section	.bss.pending.0,"aw",@nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	pending.0, @object
	.size	pending.0, 24
pending.0:
	.zero	24
	.section	.bss.pending.2,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	pending.2, @object
	.size	pending.2, 12
pending.2:
	.zero	12
	.section	.rodata.keywords.1,"a"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	keywords.1, @object
	.size	keywords.1, 576
keywords.1:
	.word	.LC42
	.word	8
	.word	.LC43
	.word	9
	.word	.LC44
	.word	51
	.word	.LC45
	.word	11
	.word	.LC46
	.word	53
	.word	.LC47
	.word	54
	.word	.LC48
	.word	55
	.word	.LC49
	.word	56
	.word	.LC50
	.word	57
	.word	.LC51
	.word	58
	.word	.LC52
	.word	59
	.word	.LC53
	.word	38
	.word	.LC54
	.word	41
	.word	.LC55
	.word	9
	.word	.LC56
	.word	60
	.word	.LC57
	.word	60
	.word	.LC58
	.word	61
	.word	.LC59
	.word	27
	.word	.LC60
	.word	27
	.word	.LC61
	.word	32
	.word	.LC62
	.word	32
	.word	.LC63
	.word	35
	.word	.LC64
	.word	35
	.word	.LC65
	.word	41
	.word	.LC66
	.word	44
	.word	.LC67
	.word	44
	.word	.LC68
	.word	49
	.word	.LC69
	.word	49
	.word	.LC70
	.word	8
	.word	.LC71
	.word	9
	.word	.LC72
	.word	60
	.word	.LC73
	.word	10
	.word	.LC74
	.word	11
	.word	.LC75
	.word	12
	.word	.LC76
	.word	13
	.word	.LC77
	.word	14
	.word	.LC78
	.word	15
	.word	.LC79
	.word	16
	.word	.LC80
	.word	17
	.word	.LC81
	.word	18
	.word	.LC82
	.word	19
	.word	.LC83
	.word	20
	.word	.LC84
	.word	21
	.word	.LC85
	.word	22
	.word	.LC86
	.word	23
	.word	.LC87
	.word	24
	.word	.LC88
	.word	25
	.word	.LC4
	.word	26
	.word	.LC89
	.word	27
	.word	.LC90
	.word	28
	.word	.LC91
	.word	29
	.word	.LC92
	.word	30
	.word	.LC93
	.word	31
	.word	.LC94
	.word	32
	.word	.LC95
	.word	33
	.word	.LC96
	.word	34
	.word	.LC97
	.word	35
	.word	.LC98
	.word	36
	.word	.LC99
	.word	37
	.word	.LC100
	.word	38
	.word	.LC101
	.word	39
	.word	.LC102
	.word	40
	.word	.LC103
	.word	41
	.word	.LC104
	.word	42
	.word	.LC105
	.word	43
	.word	.LC106
	.word	44
	.word	.LC107
	.word	45
	.word	.LC108
	.word	46
	.word	.LC109
	.word	47
	.word	.LC110
	.word	48
	.word	.LC111
	.word	49
	.word	.LC112
	.word	50
	.section	.sbss.macrodepth,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	macrodepth, @object
	.size	macrodepth, 4
macrodepth:
	.zero	4
	.section	.sbss.newline,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	newline, @object
	.size	newline, 1
newline:
	.zero	1
	.section	.sbss.ppflags,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	ppflags, @object
	.size	ppflags, 4
ppflags:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
