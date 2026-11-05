#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"init.c"
	.option nopic
	.text
	.section	.rodata.focus.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"internal error: init cursor has unexpected type"
	.align	2
.LC1:
	.string	"internal error: too many designators"
	.section	.text.focus,"ax",@progbits
	.align	2
	.type	focus, @function
focus:
	lw	a3,1028(a0)
	addi	sp,sp,-20
	sw	s0,12(sp)
	lw	a2,8(a3)
	sw	ra,16(sp)
	sw	s1,8(sp)
	lw	a5,0(a2)
	li	a4,10
	mv	s0,a0
	beq	a5,a4,.L2
	addi	a5,a5,-12
	li	a4,1
	bgtu	a5,a4,.L3
	lw	a5,52(a2)
	lw	s1,4(a5)
	sw	a5,16(a3)
.L4:
	addi	a5,a3,32
	lw	a2,0(a3)
	addi	a4,s0,1024
	lw	a3,4(a3)
	sw	a5,1028(s0)
	beq	a5,a4,.L11
.L5:
	lw	ra,16(sp)
	lw	s0,12(sp)
	sw	s1,8(a5)
	sw	a2,0(a5)
	sw	a3,4(a5)
	sb	zero,24(a5)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L2:
	lbu	a5,44(a2)
	li	a0,0
	li	a1,0
	lw	s1,28(a2)
	sw	a0,16(a3)
	sw	a1,20(a3)
	beq	a5,zero,.L4
	lw	a4,16(s1)
	lw	a5,20(s1)
	sw	a4,16(a2)
	sw	a5,20(a2)
	addi	a5,a3,32
	lw	a2,0(a3)
	addi	a4,s0,1024
	lw	a3,4(a3)
	sw	a5,1028(s0)
	bne	a5,a4,.L5
.L11:
	lla	a0,.LC1
	sw	a2,0(sp)
	sw	a3,4(sp)
	call	fatal
	lw	a5,1028(s0)
	lw	a2,0(sp)
	lw	a3,4(sp)
	j	.L5
.L3:
	lw	s0,12(sp)
	lw	ra,16(sp)
	lw	s1,8(sp)
	lla	a0,.LC0
	addi	sp,sp,20
	tail	fatal
	.size	focus, .-focus
	.section	.text.findmember,"ax",@progbits
	.align	2
	.type	findmember, @function
findmember:
	lw	a4,1028(a0)
	addi	sp,sp,-32
	sw	s1,20(sp)
	lw	a5,8(a4)
	addi	a3,a0,1024
	sw	s0,24(sp)
	lw	s1,52(a5)
	sw	ra,28(sp)
	sw	a0,4(sp)
	sw	a3,8(sp)
	mv	s0,a1
	bne	s1,zero,.L13
	j	.L19
.L25:
	sw	a4,0(sp)
	call	strcmp
	lw	a4,0(sp)
	beq	a0,zero,.L24
	lw	s1,28(s1)
	beq	s1,zero,.L19
.L13:
	lw	a0,0(s1)
	mv	a1,s0
	bne	a0,zero,.L25
	lw	a5,4(sp)
	lw	a3,16(s1)
	lw	a2,0(a4)
	lw	a0,4(a4)
	lw	a1,20(s1)
	addi	a4,a4,32
	lw	t1,4(s1)
	sw	a4,1028(a5)
	lw	a5,8(sp)
	add	a2,a3,a2
	sltu	a3,a2,a3
	add	a1,a1,a0
	add	a3,a3,a1
	beq	a4,a5,.L26
.L18:
	lw	a0,4(sp)
	mv	a1,s0
	sw	t1,8(a4)
	sw	a2,0(a4)
	sw	a3,4(a4)
	sb	zero,24(a4)
	call	findmember
	bne	a0,zero,.L14
	lw	a5,4(sp)
	lw	s1,28(s1)
	lw	a4,1028(a5)
	addi	a4,a4,-32
	sw	a4,1028(a5)
	bne	s1,zero,.L13
.L19:
	li	a0,0
.L14:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L24:
	lw	a3,16(s1)
	lw	a2,0(a4)
	lw	a1,20(s1)
	lw	a0,4(a4)
	lw	a5,4(sp)
	sw	s1,16(a4)
	add	a2,a3,a2
	addi	a4,a4,32
	lw	t1,4(s1)
	sltu	a3,a2,a3
	add	a1,a1,a0
	sw	a4,1028(a5)
	addi	a5,a5,1024
	add	s0,a3,a1
	beq	a4,a5,.L27
.L17:
	lw	ra,28(sp)
	sw	s0,4(a4)
	lw	s0,24(sp)
	sw	t1,8(a4)
	sw	a2,0(a4)
	sb	zero,24(a4)
	lw	s1,20(sp)
	li	a0,1
	addi	sp,sp,32
	jr	ra
.L26:
	lla	a0,.LC1
	sw	a2,16(sp)
	sw	a3,12(sp)
	sw	t1,0(sp)
	call	fatal
	lw	a5,4(sp)
	lw	a2,16(sp)
	lw	a3,12(sp)
	lw	a4,1028(a5)
	lw	t1,0(sp)
	j	.L18
.L27:
	lla	a0,.LC1
	sw	a2,8(sp)
	sw	t1,0(sp)
	call	fatal
	lw	a5,4(sp)
	lw	a2,8(sp)
	lw	t1,0(sp)
	lw	a4,1028(a5)
	j	.L17
	.size	findmember, .-findmember
	.section	.text.mkinit,"ax",@progbits
	.align	2
	.globl	mkinit
	.hidden	mkinit
	.type	mkinit, @function
mkinit:
	addi	sp,sp,-28
	mv	t1,a0
	li	a0,32
	sw	s0,20(sp)
	sw	s1,16(sp)
	sw	ra,24(sp)
	mv	s0,a5
	sw	t1,8(sp)
	sw	a1,4(sp)
	sw	a2,0(sp)
	mv	s1,a3
	sw	a4,12(sp)
	call	xmalloc
	lw	t1,8(sp)
	lw	a1,4(sp)
	lw	a2,0(sp)
	lw	a5,12(sp)
	lw	ra,24(sp)
	sw	s0,16(a0)
	lw	s0,20(sp)
	sw	s1,12(a0)
	sw	t1,0(a0)
	sw	a1,4(a0)
	sw	a2,8(a0)
	sw	a5,20(a0)
	sw	zero,24(a0)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
	.size	mkinit, .-mkinit
	.section	.rodata.parseinit.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"union"
	.align	2
.LC3:
	.string	"struct"
	.align	2
.LC4:
	.string	"AM Panic: "
	.align	2
.LC5:
	.string	"Assertion `p.cur->type->kind == TYPEARRAY' failed"
	.align	2
.LC6:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/init.c:212  \n"
	.align	2
.LC7:
	.string	"Assertion `t->prop & PROPSCALAR' failed"
	.align	2
.LC8:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/init.c:239  \n"
	.align	2
.LC9:
	.string	"initializer specified for incomplete type"
	.align	2
.LC10:
	.string	"initializer specified for variable length array type"
	.align	2
.LC11:
	.string	"index designator is only valid for array types"
	.globl	__muldi3
	.align	2
.LC12:
	.string	"index designator is larger than array length"
	.align	2
.LC13:
	.string	"for index designator"
	.align	2
.LC14:
	.string	"member designator only valid for struct/union types"
	.align	2
.LC15:
	.string	"for member designator"
	.align	2
.LC16:
	.string	"%s has no member named '%s'"
	.align	2
.LC17:
	.string	"after designator"
	.align	2
.LC18:
	.string	"too many initializers for type"
	.align	2
.LC19:
	.string	"array of unknown size has empty initializer"
	.align	2
.LC20:
	.string	"nested braces around scalar initializer"
	.align	2
.LC21:
	.string	"cannot initialize array with string literal of different width"
	.align	2
.LC22:
	.string	"expected ',' or '}' after initializer"
	.section	.text.parseinit,"ax",@progbits
	.align	2
	.globl	parseinit
	.hidden	parseinit
	.type	parseinit, @function
parseinit:
	addi	sp,sp,-1092
	addi	a5,sp,43
	sw	s1,1080(sp)
	lbu	a4,44(a1)
	andi	s1,a5,-8
	sw	s0,1084(sp)
	sw	ra,1088(sp)
	addi	a5,s1,1032
	li	a2,0
	li	a3,0
	sw	a5,16(sp)
	sw	a5,1036(s1)
	sw	zero,1024(s1)
	sw	s1,1028(s1)
	sw	a2,0(s1)
	sw	a3,4(s1)
	sw	a1,8(s1)
	sb	zero,24(s1)
	sw	zero,1032(s1)
	sw	a0,12(sp)
	lw	a5,0(a1)
	mv	s0,a1
	beq	a4,zero,.L31
	li	a4,10
	bne	a5,a4,.L32
.L36:
	lw	a4,28(s0)
	lw	a5,16(a4)
	lw	a4,20(a4)
	or	a5,a5,a4
	beq	a5,zero,.L173
	lw	t0,1024(s1)
.L38:
	beq	t0,zero,.L39
	lla	a5,tok
	lw	a5,0(a5)
	li	a4,62
	beq	a5,a4,.L40
	li	a4,68
	beq	a5,a4,.L40
	lw	a5,1028(s1)
	beq	a5,t0,.L55
	li	s0,10
.L65:
	li	a0,12
.L64:
	lw	a4,-24(a5)
	mv	a3,a5
	addi	a5,a5,-32
	lw	a2,0(a4)
	sw	a5,1028(s1)
	beq	a2,s0,.L56
	bne	a2,a0,.L58
	lw	a4,16(a5)
	lw	a4,28(a4)
	sw	a4,16(a5)
	bne	a4,zero,.L174
.L58:
	bne	a5,t0,.L64
	lla	a1,.LC18
	lla	a0,tok+8
	call	error
	lw	t0,1024(s1)
	lw	a5,1028(s1)
	j	.L65
.L32:
	lla	a1,.LC9
	lla	a0,tok+8
	call	error
	lw	a5,0(s0)
.L31:
	li	a4,10
	beq	a5,a4,.L36
	lw	t0,1024(s1)
	j	.L38
.L40:
	lw	a4,16(sp)
	lw	s0,8(t0)
	sw	t0,1028(s1)
	sw	a4,1036(s1)
	addi	a4,s1,1024
	sw	a4,0(sp)
.L42:
	li	a4,62
	beq	a5,a4,.L43
	li	a4,68
	beq	a5,a4,.L44
	lla	a1,.LC17
	li	a0,97
	call	expect
.L39:
	li	a0,66
	call	consume
	beq	a0,zero,.L66
	li	a0,67
	call	consume
	bne	a0,zero,.L175
	lw	a5,1024(s1)
	lw	t0,1028(s1)
	beq	a5,t0,.L176
.L69:
	sw	t0,1024(s1)
	li	a5,1
	sb	a5,24(t0)
	j	.L38
.L43:
	lw	a4,0(s0)
	li	a5,10
	bne	a4,a5,.L177
.L46:
	call	next
	lw	a0,12(sp)
	li	a1,0
	call	intconstexpr
	lw	a5,28(s0)
	lw	a2,16(a5)
	lw	a3,20(a5)
	sw	a2,8(sp)
	sw	a3,4(sp)
	call	__muldi3
	lw	a5,1028(s1)
	lw	a4,20(s0)
	sw	a0,16(a5)
	sw	a1,20(a5)
	bleu	a4,a1,.L178
.L47:
	lla	a1,.LC13
	li	a0,63
	call	expect
	lw	a5,1028(s1)
	lw	s0,28(s0)
	lw	a4,16(a5)
	lw	a2,0(a5)
	lw	a3,20(a5)
	lw	a1,4(a5)
	add	a2,a4,a2
	sltu	a4,a2,a4
	add	a3,a3,a1
	add	a4,a4,a3
	lw	a3,0(sp)
	addi	a5,a5,32
	sw	a5,1028(s1)
	beq	a5,a3,.L179
.L50:
	sw	s0,8(a5)
	sw	a2,0(a5)
	sw	a4,4(a5)
	sb	zero,24(a5)
.L51:
	lla	a5,tok
	lw	a5,0(a5)
	j	.L42
.L44:
	lw	a5,0(s0)
	li	a4,1
	addi	a5,a5,-12
	bgtu	a5,a4,.L180
.L52:
	call	next
	lla	a1,.LC15
	li	a0,4
	call	expect
	mv	a1,a0
	sw	a0,4(sp)
	mv	a0,s1
	call	findmember
	lw	a3,4(sp)
	bne	a0,zero,.L53
	lw	a4,0(s0)
	li	a5,13
	lla	a2,.LC2
	beq	a4,a5,.L54
	lla	a2,.LC3
.L54:
	lla	a1,.LC16
	lla	a0,tok+8
	sw	a3,4(sp)
	call	error
	lw	a3,4(sp)
.L53:
	mv	a0,a3
	call	free
	lw	a5,1028(s1)
	lw	s0,8(a5)
	j	.L51
.L66:
	lw	a0,12(sp)
	call	assignexpr
	lw	t1,1028(s1)
	li	a4,10
	mv	s0,a0
	lw	a1,8(t1)
	lw	a5,0(a1)
	beq	a5,a4,.L76
.L182:
	addi	a5,a5,-12
	li	a4,1
	bgtu	a5,a4,.L77
	lw	a0,8(s0)
	call	typecompatible
	bne	a0,zero,.L181
.L79:
	mv	a0,s1
	call	focus
	lw	t1,1028(s1)
	li	a4,10
	lw	a1,8(t1)
	lw	a5,0(a1)
	bne	a5,a4,.L182
.L76:
	lbu	a5,5(s0)
	beq	a5,zero,.L79
	lw	a5,20(s0)
	li	a4,2
	lw	a3,0(a5)
	bne	a3,a4,.L79
	lw	a0,28(a1)
	lw	a4,4(a0)
	andi	a3,a4,2
	beq	a3,zero,.L79
	lw	a2,8(a5)
	andi	a4,a4,1
	mv	a3,a1
	lw	a1,28(a2)
	beq	a4,zero,.L80
	lw	a4,4(a1)
	mv	t0,a3
	andi	a4,a4,1
	bne	a4,zero,.L81
.L80:
	sw	a3,4(sp)
	sw	a5,0(sp)
	call	typecompatible
	lw	a5,0(sp)
	lw	a3,4(sp)
	beq	a0,zero,.L82
	lw	t1,1028(s1)
	lw	t0,8(t1)
.L81:
	lbu	a4,44(a3)
	mv	s0,a5
	beq	a4,zero,.L83
	lw	a5,8(a5)
	lw	a4,16(a5)
	lw	a5,20(a5)
	sw	a4,16(a3)
	sw	a5,20(a3)
.L83:
	bltu	s1,t1,.L183
.L110:
	sw	zero,4(sp)
	li	a2,0
.L90:
	lw	a3,0(t1)
	lw	a4,16(t0)
	lw	a0,4(t1)
	lw	a5,20(t0)
	add	a4,a3,a4
	sltu	a1,a4,a3
	add	a5,a0,a5
	add	t1,a1,a5
	sw	a0,0(sp)
	li	a0,32
	sw	a2,32(sp)
	sw	a3,28(sp)
	sw	a4,24(sp)
	sw	t1,20(sp)
	call	xmalloc
	lw	t2,1036(s1)
	lw	a3,28(sp)
	sw	zero,24(a0)
	lw	a5,0(t2)
	mv	a1,a0
	sw	a3,0(a0)
	lw	a4,24(sp)
	lw	t1,20(sp)
	lw	a2,32(sp)
	lw	t0,4(sp)
	sw	a0,8(sp)
	lw	a0,0(sp)
	sw	a4,8(a1)
	sw	t1,12(a1)
	sw	a0,4(a1)
	sw	s0,16(a1)
	sh	a2,20(a1)
	sh	t0,22(a1)
	beq	a5,zero,.L91
	slli	t0,a3,3
	slli	s0,a0,3
	srli	a3,a3,29
	add	a0,t0,a2
	or	s0,a3,s0
	srai	a3,a2,31
	lw	a2,4(sp)
	slli	a1,a4,3
	slli	t1,t1,3
	srli	a4,a4,29
	or	t1,a4,t1
	srai	a4,a2,31
	sub	a2,a1,a2
	sltu	t0,a0,t0
	add	s0,s0,a3
	sgtu	a1,a2,a1
	sub	t1,t1,a4
	sw	a0,0(sp)
	sw	a2,4(sp)
	add	t0,t0,s0
	sub	t1,t1,a1
.L98:
	lw	a1,8(a5)
	lw	a4,12(a5)
	lh	a3,22(a5)
	slli	a2,a1,3
	slli	a4,a4,3
	srli	a1,a1,29
	or	a4,a1,a4
	srai	a1,a3,31
	sub	a3,a2,a3
	sgtu	a2,a3,a2
	sub	a4,a4,a1
	sub	a4,a4,a2
	bleu	a4,t0,.L184
.L113:
	lw	s0,0(a5)
	lw	a1,4(a5)
	lh	a0,20(a5)
	slli	a2,s0,3
	slli	a1,a1,3
	srli	s0,s0,29
	or	a1,s0,a1
	srai	s0,a0,31
	add	a0,a2,a0
	sltu	a2,a0,a2
	add	a1,a1,s0
	add	a2,a2,a1
	bleu	t1,a2,.L185
	bleu	a4,t1,.L186
.L92:
	addi	t2,a5,24
	lw	a5,24(a5)
	bne	a5,zero,.L98
.L91:
	lw	a4,8(sp)
	lw	a3,1028(s1)
	sw	a5,24(a4)
	sw	a4,0(t2)
	addi	a5,a4,24
	sw	a5,1036(s1)
.L105:
	lw	a5,8(a3)
	lbu	a4,44(a5)
	beq	a4,zero,.L68
	sb	zero,44(a5)
.L68:
	lw	a5,1024(s1)
	beq	a5,zero,.L169
	lla	s0,tok
	lw	a5,0(s0)
	li	a4,108
	beq	a5,a4,.L187
	li	a4,67
	bne	a5,a4,.L188
.L102:
	call	next
	lw	a3,1024(s1)
	sw	a3,1028(s1)
	mv	a5,a3
.L106:
	beq	s1,a5,.L189
	lbu	a4,-8(a5)
	addi	a5,a5,-32
	beq	a4,zero,.L106
	sw	a5,1024(s1)
	j	.L105
.L77:
	lw	a5,4(a1)
	andi	a5,a5,16
	beq	a5,zero,.L190
	mv	a0,s0
	call	exprassign
	lw	t1,1028(s1)
	mv	s0,a0
	lw	t0,8(t1)
	bgeu	s1,t1,.L110
	j	.L183
.L175:
	lw	a5,1028(s1)
	lw	a5,8(a5)
	lbu	a5,44(a5)
	beq	a5,zero,.L68
	lla	a1,.LC19
	lla	a0,tok+8
	call	error
	j	.L68
.L176:
	lw	a4,8(a5)
	lw	a5,4(a4)
	andi	a5,a5,16
	bne	a5,zero,.L191
.L70:
	lw	a4,0(a4)
	li	a5,10
	bne	a4,a5,.L192
	mv	a0,s1
	call	focus
	lw	t0,1028(s1)
	j	.L69
.L55:
	lw	a5,8(t0)
	li	a4,1
	lw	a5,0(a5)
	addi	a5,a5,-12
	bgtu	a5,a4,.L39
	mv	a0,s1
	call	focus
	j	.L39
.L178:
	lw	a3,4(sp)
	lw	a2,8(sp)
	beq	a4,a1,.L193
.L112:
	lbu	a5,44(s0)
	beq	a5,zero,.L194
.L49:
	add	a2,a0,a2
	sltu	a0,a2,a0
	add	a1,a1,a3
	add	a0,a0,a1
	sw	a2,16(s0)
	sw	a0,20(s0)
	j	.L47
.L177:
	lla	a1,.LC11
	lla	a0,tok+8
	call	error
	j	.L46
.L180:
	lla	a1,.LC14
	lla	a0,tok+8
	call	error
	j	.L52
.L183:
	lw	a5,-24(t1)
	li	a4,1
	sw	zero,4(sp)
	lw	a5,0(a5)
	li	a2,0
	addi	a5,a5,-12
	bgtu	a5,a4,.L90
	lw	a5,-16(t1)
	lh	a2,24(a5)
	lh	a5,26(a5)
	sw	a5,4(sp)
	j	.L90
.L187:
	call	next
	lw	a4,0(s0)
	li	a5,67
	beq	a4,a5,.L102
	lw	t0,1024(s1)
	j	.L38
.L56:
	lw	t2,28(a4)
	lw	ra,16(a4)
	lw	a1,16(a5)
	lw	t1,16(t2)
	lw	a2,20(a5)
	sw	t2,4(sp)
	lw	t2,20(t2)
	sw	ra,0(sp)
	add	a1,t1,a1
	sltu	ra,a1,t1
	add	a2,t2,a2
	sw	t2,8(sp)
	lw	t2,0(sp)
	add	a2,ra,a2
	sw	a1,16(a5)
	sw	a2,20(a5)
	lw	ra,20(a4)
	bne	a1,t2,.L59
	bne	a2,ra,.L59
	lbu	t2,44(a4)
	beq	t2,zero,.L58
	lw	a0,8(sp)
	add	t0,t1,a1
	sltu	a5,t0,t1
	add	a0,a0,a2
	add	a5,a5,a0
	sw	t0,16(a4)
	sw	a5,20(a4)
.L59:
	lw	a5,-32(a3)
	lw	a0,-28(a3)
	addi	a4,s1,1024
	add	a5,a1,a5
	sltu	a1,a5,a1
	add	a2,a2,a0
	sw	a3,1028(s1)
	add	s0,a1,a2
	beq	a3,a4,.L195
.L61:
	lw	a4,4(sp)
	sw	a5,0(a3)
	sw	s0,4(a3)
	sw	a4,8(a3)
	sb	zero,24(a3)
	j	.L39
.L184:
	bne	a4,t0,.L92
	lw	a2,0(sp)
	bgtu	a3,a2,.L113
	j	.L92
.L189:
	sw	zero,1024(s1)
	j	.L105
.L193:
	lw	a5,16(s0)
	bgtu	a5,a0,.L47
	j	.L112
.L185:
	bne	t1,a2,.L91
	lw	a2,4(sp)
	bleu	a2,a0,.L91
	bgtu	a4,t1,.L92
.L186:
	bne	a4,t1,.L146
	lw	a4,4(sp)
	bgtu	a3,a4,.L92
	j	.L146
.L191:
	lla	a1,.LC20
	lla	a0,tok+8
	call	error
	lw	a5,1024(s1)
	lw	a4,8(a5)
	j	.L70
.L188:
	lla	a1,.LC22
	lla	a0,tok+8
	call	error
	call	next
	lw	a3,1024(s1)
	sw	a3,1028(s1)
	mv	a5,a3
	j	.L106
.L174:
	lw	a5,16(a4)
	lw	a1,-32(a3)
	lw	a2,20(a4)
	lw	a0,-28(a3)
	add	t1,a5,a1
	sltu	a5,t1,a5
	lw	a1,4(a4)
	add	a2,a2,a0
	sw	a3,1028(s1)
	addi	a4,s1,1024
	add	s0,a5,a2
	beq	a3,a4,.L196
.L63:
	sw	a1,8(a3)
	sw	t1,0(a3)
	sw	s0,4(a3)
	sb	zero,24(a3)
	j	.L39
.L173:
	lla	a1,.LC10
	lla	a0,tok+8
	call	error
	lw	t0,1024(s1)
	j	.L38
.L198:
	lw	a1,8(a5)
	lw	a4,12(a5)
	lh	a3,22(a5)
	slli	a2,a1,3
	slli	a4,a4,3
	srli	a1,a1,29
	or	a4,a1,a4
	srai	a1,a3,31
	sub	a3,a2,a3
	sgtu	a2,a3,a2
	sub	a4,a4,a1
	sub	a4,a4,a2
	bgtu	a4,t1,.L91
	beq	a4,t1,.L197
.L146:
	lw	a5,24(a5)
	bne	a5,zero,.L198
	j	.L91
.L179:
	lla	a0,.LC1
	sw	a2,8(sp)
	sw	a4,4(sp)
	call	fatal
	lw	a5,1028(s1)
	lw	a2,8(sp)
	lw	a4,4(sp)
	j	.L50
.L194:
	lla	a1,.LC12
	lla	a0,tok+8
	call	error
	lw	a4,1028(s1)
	lw	a5,28(s0)
	lw	a0,16(a4)
	lw	a1,20(a4)
	lw	a2,16(a5)
	lw	a3,20(a5)
	j	.L49
.L197:
	lw	a4,4(sp)
	bleu	a3,a4,.L146
	j	.L91
.L195:
	lla	a0,.LC1
	sw	a5,0(sp)
	call	fatal
	lw	a3,1028(s1)
	lw	a5,0(sp)
	j	.L61
.L196:
	lla	a0,.LC1
	sw	t1,4(sp)
	sw	a1,0(sp)
	call	fatal
	lw	a3,1028(s1)
	lw	t1,4(sp)
	lw	a1,0(sp)
	j	.L63
.L181:
	lw	t1,1028(s1)
	lw	t0,8(t1)
	bgeu	s1,t1,.L110
	j	.L183
.L169:
	lw	ra,1088(sp)
	lw	s0,1084(sp)
	lw	a0,1032(s1)
	lw	s1,1080(sp)
	addi	sp,sp,1092
	jr	ra
.L82:
	lla	a1,.LC21
	lla	a0,tok+8
	sw	a3,4(sp)
	sw	a5,0(sp)
	call	error
	lw	t1,1028(s1)
	lw	a3,4(sp)
	lw	a5,0(sp)
	lw	t0,8(t1)
	j	.L81
.L190:
	lla	s0,.LC4
	li	a0,65
.L85:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L85
	lla	s0,.LC7
	li	a0,65
.L86:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L86
	lla	s0,.LC8
	li	a0,32
.L87:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L87
.L88:
	li	a0,1
	call	halt
.L192:
	lla	s0,.LC4
	li	a0,65
.L72:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L72
	lla	s0,.LC5
	li	a0,65
.L73:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L73
	lla	s0,.LC6
	li	a0,32
.L74:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L74
	j	.L88
	.size	parseinit, .-parseinit
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
