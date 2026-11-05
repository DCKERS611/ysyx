#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lparser.c"
	.option nopic
	.text
	.section	.rodata.newlabelentry.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"labels/gotos"
	.section	.text.newlabelentry,"ax",@progbits
	.align	2
	.type	newlabelentry, @function
newlabelentry:
	addi	sp,sp,-28
	lw	a5,8(a1)
	sw	s1,16(sp)
	lw	s1,4(a1)
	sw	s0,20(sp)
	sw	ra,24(sp)
	sw	a4,0(sp)
	mv	s0,a1
	mv	t1,a0
	lw	a1,0(a1)
	mv	t2,a2
	mv	t0,a3
	ble	a5,s1,.L5
.L2:
	lw	a5,28(t1)
	slli	a4,s1,4
	add	a0,a1,a4
	sw	t2,0(a0)
	sw	t0,8(a0)
	lbu	a4,42(a5)
	lw	a3,0(sp)
	addi	a5,s1,1
	sb	a4,12(a0)
	sw	a3,4(a0)
	lw	ra,24(sp)
	sw	a5,4(s0)
	lw	s0,20(sp)
	mv	a0,s1
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L5:
	lw	a0,32(a0)
	li	a4,32768
	sw	a3,12(sp)
	sw	a2,8(sp)
	lla	a5,.LC0
	addi	a4,a4,-1
	li	a3,16
	addi	a2,s0,8
	sw	t1,4(sp)
	call	luaM_growaux_
	lw	t0,12(sp)
	lw	t2,8(sp)
	lw	t1,4(sp)
	mv	a1,a0
	sw	a0,0(s0)
	j	.L2
	.size	newlabelentry, .-newlabelentry
	.section	.rodata.errorlimit.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"main function"
	.align	2
.LC2:
	.string	"function at line %d"
	.align	2
.LC3:
	.string	"too many %s (limit is %d) in %s"
	.section	.text.errorlimit,"ax",@progbits
	.align	2
	.type	errorlimit, @function
errorlimit:
	lw	a4,0(a0)
	addi	sp,sp,-20
	lw	a5,8(a0)
	sw	s0,12(sp)
	mv	s0,a0
	lw	a0,36(a4)
	sw	s1,8(sp)
	sw	ra,16(sp)
	lw	a5,32(a5)
	mv	a3,a1
	mv	s1,a2
	lla	a4,.LC1
	bne	a0,zero,.L12
.L7:
	lla	a1,.LC3
	mv	a2,s1
	mv	a0,a5
	call	luaO_pushfstring
	mv	a1,a0
	lw	a0,8(s0)
	call	luaX_syntaxerror
.L12:
	sw	a1,4(sp)
	mv	a2,a0
	lla	a1,.LC2
	mv	a0,a5
	sw	a5,0(sp)
	call	luaO_pushfstring
	lw	a3,4(sp)
	lw	a5,0(sp)
	mv	a4,a0
	j	.L7
	.size	errorlimit, .-errorlimit
	.section	.rodata.newupvalue.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"upvalues"
	.section	.text.newupvalue,"ax",@progbits
	.align	2
	.type	newupvalue, @function
newupvalue:
	addi	sp,sp,-24
	sw	s1,12(sp)
	sw	ra,20(sp)
	sw	s0,16(sp)
	lw	s1,0(a0)
	lbu	a5,43(a0)
	li	a4,255
	lw	t2,12(s1)
	beq	a5,a4,.L28
	mv	t0,a1
	mv	s0,a0
	lw	a1,64(s1)
	mv	t1,a2
	bge	a5,t2,.L29
.L15:
	lw	a4,0(t1)
	slli	a3,a5,3
	add	a1,a1,a3
	addi	a4,a4,-8
	seqz	a4,a4
	sb	a4,4(a1)
	lw	a4,4(t1)
	sw	t0,0(a1)
	sb	a4,5(a1)
	lbu	a4,5(s1)
	andi	a4,a4,4
	beq	a4,zero,.L18
	lbu	a4,5(t0)
	andi	a4,a4,3
	bne	a4,zero,.L30
.L18:
	addi	a4,a5,1
	sb	a4,43(s0)
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	mv	a0,a5
	addi	sp,sp,24
	jr	ra
.L29:
	lw	a4,8(a0)
	sw	a2,8(sp)
	lla	a5,.LC4
	lw	a0,32(a4)
	li	a3,8
	li	a4,255
	addi	a2,s1,12
	sw	t0,4(sp)
	sw	t2,0(sp)
	call	luaM_growaux_
	lw	a4,12(s1)
	lw	t2,0(sp)
	sw	a0,64(s1)
	lw	t0,4(sp)
	lw	t1,8(sp)
	mv	a1,a0
	bge	t2,a4,.L27
	slli	a5,t2,3
	slli	a4,a4,3
	add	a5,a0,a5
	add	a4,a0,a4
.L17:
	sw	zero,0(a5)
	addi	a5,a5,8
	bne	a4,a5,.L17
.L27:
	lbu	a5,43(s0)
	j	.L15
.L30:
	lw	a5,8(s0)
	mv	a1,s1
	mv	a2,t0
	lw	a0,32(a5)
	call	luaC_barrier_
	lbu	a5,43(s0)
	addi	a4,a5,1
	sb	a4,43(s0)
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	mv	a0,a5
	addi	sp,sp,24
	jr	ra
.L28:
	lla	a2,.LC4
	li	a1,255
	call	errorlimit
	.size	newupvalue, .-newupvalue
	.section	.rodata.new_localvar.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"local variables"
	.section	.text.new_localvar,"ax",@progbits
	.align	2
	.type	new_localvar, @function
new_localvar:
	lw	t1,28(a0)
	addi	sp,sp,-32
	sw	s1,20(sp)
	lw	s1,0(t1)
	sw	s0,24(sp)
	lh	s0,40(t1)
	lw	t2,32(s1)
	sw	a1,4(sp)
	sw	ra,28(sp)
	sw	a0,0(sp)
	lw	t0,48(a0)
	lw	a1,60(s1)
	ble	t2,s0,.L47
.L32:
	slli	a5,s0,1
	lw	a4,4(sp)
	add	a5,a5,s0
	slli	a5,a5,2
	add	a1,a1,a5
	sw	a4,0(a1)
	lbu	a5,5(s1)
	andi	a5,a5,4
	beq	a5,zero,.L35
	lbu	a5,5(a4)
	andi	a5,a5,3
	bne	a5,zero,.L48
.L35:
	lw	a5,4(t0)
	lw	a3,36(t1)
	addi	a2,s0,1
	addi	a4,a5,1
	sh	a2,40(t1)
	sub	a3,a4,a3
	li	a2,200
	bgt	a3,a2,.L49
	lw	a3,8(t0)
	lw	a1,0(t0)
	bge	a4,a3,.L50
.L37:
	slli	a5,a5,1
	sw	a4,4(t0)
	add	a1,a1,a5
	lw	ra,28(sp)
	sh	s0,0(a1)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L47:
	lw	a0,32(a0)
	li	a4,32768
	li	a3,12
	lla	a5,.LC5
	addi	a4,a4,-1
	addi	a2,s1,32
	sw	t2,16(sp)
	sw	t0,12(sp)
	sw	t1,8(sp)
	call	luaM_growaux_
	lw	a3,32(s1)
	lw	t2,16(sp)
	sw	a0,60(s1)
	lw	t1,8(sp)
	lw	t0,12(sp)
	mv	a1,a0
	ble	a3,t2,.L46
	slli	a5,t2,1
	slli	a4,a3,1
	add	a5,a5,t2
	add	a4,a4,a3
	slli	a5,a5,2
	slli	a4,a4,2
	add	a5,a0,a5
	add	a4,a0,a4
.L34:
	sw	zero,0(a5)
	addi	a5,a5,12
	bne	a4,a5,.L34
.L46:
	lh	s0,40(t1)
	j	.L32
.L50:
	lw	a5,0(sp)
	li	a4,-2147483648
	xori	a4,a4,-1
	lw	a0,32(a5)
	addi	a2,t0,8
	lla	a5,.LC5
	li	a3,2
	sw	t0,0(sp)
	call	luaM_growaux_
	lw	t0,0(sp)
	mv	a1,a0
	lw	a5,4(t0)
	sw	a0,0(t0)
	addi	a4,a5,1
	j	.L37
.L48:
	lw	a5,0(sp)
	mv	a2,a4
	mv	a1,s1
	lw	a0,32(a5)
	sw	t0,12(sp)
	sw	t1,8(sp)
	call	luaC_barrier_
	lw	t1,8(sp)
	lw	t0,12(sp)
	lh	s0,40(t1)
	j	.L35
.L49:
	lla	a2,.LC5
	li	a1,200
	mv	a0,t1
	call	errorlimit
	.size	new_localvar, .-new_localvar
	.section	.rodata.error_expected.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	"%s expected"
	.section	.text.error_expected,"ax",@progbits
	.align	2
	.type	error_expected, @function
error_expected:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lw	s1,32(a0)
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	luaX_token2str
	mv	a2,a0
	lla	a1,.LC6
	mv	a0,s1
	call	luaO_pushfstring
	mv	a1,a0
	mv	a0,s0
	call	luaX_syntaxerror
	.size	error_expected, .-error_expected
	.section	.text.adjust_assign,"ax",@progbits
	.align	2
	.type	adjust_assign, @function
adjust_assign:
	lw	t1,0(a3)
	addi	sp,sp,-28
	sw	s0,20(sp)
	sw	s1,16(sp)
	mv	s0,a2
	mv	s1,a1
	sw	ra,24(sp)
	addi	a1,t1,-13
	li	a2,1
	mv	a5,a0
	sub	a4,s1,s0
	lw	a0,28(a0)
	bleu	a1,a2,.L65
	bne	t1,zero,.L66
	bgt	a4,zero,.L67
.L57:
	bge	s1,s0,.L53
	lw	a3,28(a5)
	lbu	a5,44(a3)
	add	a5,a5,a4
	sb	a5,44(a3)
.L53:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L67:
	lbu	a3,44(a0)
	mv	a1,a4
	sw	a5,12(sp)
	sw	a3,8(sp)
	sw	a4,0(sp)
	sw	a0,4(sp)
	call	luaK_reserveregs
	lw	a4,0(sp)
	lw	a3,8(sp)
	lw	a0,4(sp)
	mv	a2,a4
	mv	a1,a3
	call	luaK_nil
	lw	a5,12(sp)
	lw	a4,0(sp)
	j	.L57
.L66:
	mv	a1,a3
	sw	a4,8(sp)
	sw	a5,4(sp)
	sw	a0,0(sp)
	call	luaK_exp2nextreg
	lw	a4,8(sp)
	lw	a5,4(sp)
	lw	a0,0(sp)
	ble	a4,zero,.L57
	j	.L67
.L65:
	addi	a2,a4,1
	not	a1,a2
	srai	a1,a1,31
	and	a2,a2,a1
	mv	a1,a3
	sw	a5,4(sp)
	sw	a4,0(sp)
	sw	a2,12(sp)
	sw	a0,8(sp)
	call	luaK_setreturns
	lw	a4,0(sp)
	lw	a5,4(sp)
	ble	a4,zero,.L57
	lw	a2,12(sp)
	lw	a0,8(sp)
	sw	a4,4(sp)
	addi	a1,a2,-1
	sw	a5,0(sp)
	call	luaK_reserveregs
	lw	a5,0(sp)
	lw	a4,4(sp)
	j	.L57
	.size	adjust_assign, .-adjust_assign
	.section	.rodata.check_match.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"%s expected (to close %s at line %d)"
	.section	.text.check_match,"ax",@progbits
	.align	2
	.type	check_match, @function
check_match:
	lw	a5,12(a0)
	beq	a1,a5,.L69
	lw	a5,4(a0)
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	mv	s0,a0
	mv	s1,a3
	beq	a5,a3,.L76
	lw	a5,32(a0)
	sw	a2,0(sp)
	sw	a5,4(sp)
	call	luaX_token2str
	lw	a2,0(sp)
	sw	a0,0(sp)
	mv	a0,s0
	mv	a1,a2
	call	luaX_token2str
	lw	a5,4(sp)
	lw	a2,0(sp)
	mv	a3,a0
	lla	a1,.LC7
	mv	a4,s1
	mv	a0,a5
	call	luaO_pushfstring
	mv	a1,a0
	mv	a0,s0
	call	luaX_syntaxerror
.L76:
	call	error_expected
.L69:
	tail	luaX_next
	.size	check_match, .-check_match
	.section	.text.adjustlocalvars.isra.0,"ax",@progbits
	.align	2
	.type	adjustlocalvars.isra.0, @function
adjustlocalvars.isra.0:
	lbu	a5,42(a0)
	add	a5,a5,a1
	andi	a5,a5,0xff
	sb	a5,42(a0)
	beq	a1,zero,.L77
	lw	a4,8(a0)
	lw	a3,36(a0)
	lw	t1,0(a0)
	lw	a2,48(a4)
	sub	a4,a3,a1
	add	a4,a4,a5
	lw	a2,0(a2)
	add	a3,a3,a5
	lw	t1,60(t1)
	lw	a1,16(a0)
	slli	a4,a4,1
	slli	a3,a3,1
	add	a4,a2,a4
	add	a2,a2,a3
.L79:
	lh	a3,0(a4)
	addi	a4,a4,2
	slli	a5,a3,1
	add	a5,a5,a3
	slli	a5,a5,2
	add	a5,t1,a5
	sw	a1,4(a5)
	bne	a2,a4,.L79
.L77:
	ret
	.size	adjustlocalvars.isra.0, .-adjustlocalvars.isra.0
	.section	.text.singlevaraux,"ax",@progbits
	.align	2
	.type	singlevaraux, @function
singlevaraux:
	addi	sp,sp,-16
	sw	s1,4(sp)
	sw	ra,12(sp)
	sw	s0,8(sp)
	mv	s1,a2
	beq	a0,zero,.L107
	lbu	a5,42(a0)
	lw	t0,0(a0)
	mv	s0,a0
	addi	t1,a5,-1
	beq	a5,zero,.L85
	lw	a4,8(a0)
	lw	a0,36(a0)
	lw	a2,60(t0)
	lw	a4,48(a4)
	add	a5,a5,a0
	slli	a5,a5,1
	lw	a4,0(a4)
	li	a0,-1
	add	a4,a4,a5
	j	.L88
.L86:
	addi	t1,t1,-1
	beq	t1,a0,.L85
.L88:
	lh	t2,-2(a4)
	addi	a4,a4,-2
	slli	a5,t2,1
	add	a5,a5,t2
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,0(a5)
	bne	a1,a5,.L86
	li	a5,-1
	sw	a5,8(s1)
	sw	a5,12(s1)
	li	a5,8
	sw	a5,0(s1)
	sw	t1,4(s1)
	bne	a3,zero,.L82
	lw	a5,12(s0)
	lbu	a4,12(a5)
	ble	a4,t1,.L89
.L90:
	lw	a5,0(a5)
	lbu	a4,12(a5)
	bgt	a4,t1,.L90
.L89:
	li	a4,1
	sb	a4,13(a5)
.L82:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L107:
	lw	ra,12(sp)
	lw	s0,8(sp)
	li	a5,-1
	sw	a5,8(a2)
	sw	a5,12(a2)
	sw	zero,0(a2)
	sw	zero,4(a2)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L85:
	lbu	a3,43(s0)
	lw	a5,64(t0)
	li	a0,0
	bne	a3,zero,.L92
	j	.L93
.L108:
	addi	a0,a0,1
	beq	a0,a3,.L93
.L92:
	lw	a4,0(a5)
	addi	a5,a5,8
	bne	a1,a4,.L108
.L91:
	li	a5,-1
	lw	ra,12(sp)
	lw	s0,8(sp)
	sw	a5,8(s1)
	sw	a5,12(s1)
	li	a5,9
	sw	a5,0(s1)
	sw	a0,4(s1)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L93:
	lw	a0,4(s0)
	li	a3,0
	mv	a2,s1
	sw	a1,0(sp)
	call	singlevaraux
	lw	a5,0(s1)
	beq	a5,zero,.L82
	lw	a1,0(sp)
	mv	a2,s1
	mv	a0,s0
	call	newupvalue
	j	.L91
	.size	singlevaraux, .-singlevaraux
	.section	.text.fieldsel,"ax",@progbits
	.align	2
	.type	fieldsel, @function
fieldsel:
	addi	sp,sp,-36
	sw	s1,24(sp)
	lw	s1,28(a0)
	sw	s0,28(sp)
	mv	s0,a0
	mv	a0,s1
	sw	ra,32(sp)
	sw	a1,0(sp)
	call	luaK_exp2anyregup
	mv	a0,s0
	call	luaX_next
	lw	a3,12(s0)
	li	a4,292
	bne	a3,a4,.L112
	lw	a1,16(s0)
	mv	a0,s0
	sw	a1,4(sp)
	call	luaX_next
	lw	a1,4(sp)
	lw	a0,28(s0)
	call	luaK_stringK
	lw	a1,0(sp)
	mv	a3,a0
	li	a4,-1
	addi	a2,sp,8
	mv	a0,s1
	li	a5,4
	sw	a4,16(sp)
	sw	a4,20(sp)
	sw	a5,8(sp)
	sw	a3,12(sp)
	call	luaK_indexed
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
.L112:
	li	a1,292
	mv	a0,s0
	call	error_expected
	.size	fieldsel, .-fieldsel
	.section	.text.singlevar,"ax",@progbits
	.align	2
	.type	singlevar, @function
singlevar:
	lw	a3,12(a0)
	addi	sp,sp,-36
	sw	ra,32(sp)
	sw	s0,28(sp)
	sw	s1,24(sp)
	li	a4,292
	bne	a3,a4,.L117
	lw	a5,16(a0)
	mv	s1,a1
	mv	s0,a0
	sw	a5,0(sp)
	call	luaX_next
	lw	a4,28(s0)
	lw	a1,0(sp)
	li	a3,1
	mv	a0,a4
	mv	a2,s1
	sw	a4,4(sp)
	call	singlevaraux
	lw	a3,0(s1)
	lw	a4,4(sp)
	beq	a3,zero,.L118
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
.L118:
	lw	a1,56(s0)
	mv	a2,s1
	mv	a0,a4
	li	a3,1
	call	singlevaraux
	lw	a1,0(sp)
	lw	a0,28(s0)
	call	luaK_stringK
	lw	a4,4(sp)
	mv	t1,a0
	li	a3,-1
	addi	a2,sp,8
	mv	a1,s1
	li	a5,4
	mv	a0,a4
	sw	a3,16(sp)
	sw	a3,20(sp)
	sw	a5,8(sp)
	sw	t1,12(sp)
	call	luaK_indexed
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
.L117:
	li	a1,292
	call	error_expected
	.size	singlevar, .-singlevar
	.section	.rodata.closegoto.isra.0.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	"<goto %s> at line %d jumps into the scope of local '%s'"
	.section	.text.closegoto.isra.0,"ax",@progbits
	.align	2
	.type	closegoto.isra.0, @function
closegoto.isra.0:
	addi	sp,sp,-20
	sw	s0,12(sp)
	lw	s0,48(a0)
	slli	a4,a1,4
	sw	s1,8(sp)
	lw	a5,12(s0)
	sw	ra,16(sp)
	mv	t0,a1
	add	a5,a5,a4
	lbu	a1,12(a5)
	mv	s1,a0
	lw	a0,28(a0)
	bltu	a1,a3,.L127
	lw	a1,4(a5)
	sw	t0,4(sp)
	sw	a4,0(sp)
	call	luaK_patchlist
	lw	a0,16(s0)
	lw	t0,4(sp)
	lw	a4,0(sp)
	addi	t1,a0,-1
	bge	t0,t1,.L123
	lw	a5,12(s0)
	slli	a0,a0,4
	addi	a3,a5,-16
	add	a0,a0,a3
	add	a5,a5,a4
.L122:
	lw	a1,16(a5)
	lw	a2,20(a5)
	lw	a3,24(a5)
	lw	a4,28(a5)
	sw	a1,0(a5)
	sw	a2,4(a5)
	sw	a3,8(a5)
	sw	a4,12(a5)
	addi	a5,a5,16
	bne	a5,a0,.L122
.L123:
	lw	ra,16(sp)
	sw	t1,16(s0)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L127:
	lw	a3,8(a0)
	lw	a4,36(a0)
	lw	a2,0(a0)
	lw	a3,48(a3)
	add	a4,a1,a4
	slli	a4,a4,1
	lw	a3,0(a3)
	lw	a1,60(a2)
	lw	a2,0(a5)
	add	a4,a3,a4
	lh	a4,0(a4)
	lw	a3,8(a5)
	lw	a0,32(s1)
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a1,a5
	lw	a4,0(a5)
	lla	a1,.LC8
	addi	a2,a2,16
	addi	a4,a4,16
	call	luaO_pushfstring
	mv	a1,a0
	sw	zero,12(s1)
	mv	a0,s1
	call	luaX_syntaxerror
	.size	closegoto.isra.0, .-closegoto.isra.0
	.section	.text.findlabel,"ax",@progbits
	.align	2
	.type	findlabel, @function
findlabel:
	addi	sp,sp,-16
	sw	s1,4(sp)
	mv	s1,a0
	lw	a0,28(a0)
	lw	t0,48(s1)
	slli	a4,a1,4
	lw	a5,12(a0)
	lw	a2,12(t0)
	lw	a3,28(t0)
	lw	a5,4(a5)
	sw	ra,12(sp)
	sw	s0,8(sp)
	mv	t1,a1
	add	a1,a2,a4
	ble	a3,a5,.L133
	lw	s0,24(t0)
	slli	a4,a5,4
	lw	a2,0(a1)
	add	s0,s0,a4
	j	.L132
.L130:
	addi	s0,s0,16
	beq	a3,a5,.L133
.L132:
	lw	a4,0(s0)
	addi	a5,a5,1
	bne	a4,a2,.L130
	lbu	a3,12(s0)
	lbu	a5,12(a1)
	bleu	a5,a3,.L131
	lw	a1,4(a1)
	mv	a2,a3
	sw	t1,0(sp)
	call	luaK_patchclose
	lbu	a3,12(s0)
	lw	t1,0(sp)
.L131:
	lw	a2,4(s0)
	mv	a0,s1
	mv	a1,t1
	call	closegoto.isra.0
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
.L133:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
	.size	findlabel, .-findlabel
	.section	.rodata.gotostat.str1.4,"aMS",@progbits,1
	.align	2
.LC9:
	.string	"break"
	.section	.text.gotostat,"ax",@progbits
	.align	2
	.type	gotostat, @function
gotostat:
	lw	a3,4(a0)
	lw	a2,12(a0)
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	li	a5,266
	sw	a3,0(sp)
	mv	s0,a0
	mv	s1,a1
	beq	a2,a5,.L137
	call	luaX_next
	lw	a0,32(s0)
	lla	a1,.LC9
	call	luaS_new
	lw	a3,0(sp)
	mv	a2,a0
.L138:
	lw	a1,48(s0)
	mv	a4,s1
	mv	a0,s0
	addi	a1,a1,12
	call	newlabelentry
	mv	a1,a0
	mv	a0,s0
	lw	s0,12(sp)
	lw	ra,16(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	tail	findlabel
.L137:
	call	luaX_next
	lw	a4,12(s0)
	li	a5,292
	lw	a3,0(sp)
	bne	a4,a5,.L141
	lw	a2,16(s0)
	mv	a0,s0
	sw	a3,4(sp)
	sw	a2,0(sp)
	call	luaX_next
	lw	a3,4(sp)
	lw	a2,0(sp)
	j	.L138
.L141:
	li	a1,292
	mv	a0,s0
	call	error_expected
	.size	gotostat, .-gotostat
	.section	.text.findgotos,"ax",@progbits
	.align	2
	.type	findgotos, @function
findgotos:
	lw	a5,28(a0)
	lw	t1,48(a0)
	addi	sp,sp,-20
	lw	a5,12(a5)
	sw	s0,12(sp)
	lw	a2,16(t1)
	lw	s0,8(a5)
	sw	ra,16(sp)
	sw	s1,8(sp)
	bge	s0,a2,.L142
	mv	s1,a1
.L146:
	lw	a5,12(t1)
	slli	a4,s0,4
	lw	a3,0(s1)
	add	a5,a5,a4
	lw	a5,0(a5)
	beq	a5,a3,.L149
	addi	s0,s0,1
	bgt	a2,s0,.L146
.L142:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L149:
	lw	a2,4(s1)
	lbu	a3,12(s1)
	mv	a1,s0
	sw	t1,4(sp)
	sw	a0,0(sp)
	call	closegoto.isra.0
	lw	t1,4(sp)
	lw	a0,0(sp)
	lw	a2,16(t1)
	bgt	a2,s0,.L146
	j	.L142
	.size	findgotos, .-findgotos
	.section	.rodata.leaveblock.str1.4,"aMS",@progbits,1
	.align	2
.LC10:
	.string	"<%s> at line %d not inside a loop"
	.align	2
.LC11:
	.string	"no visible label '%s' for <goto> at line %d"
	.section	.text.leaveblock,"ax",@progbits
	.align	2
	.type	leaveblock, @function
leaveblock:
	addi	sp,sp,-24
	lw	a5,8(a0)
	sw	s1,12(sp)
	lw	s1,12(a0)
	sw	a5,0(sp)
	sw	s0,16(sp)
	lw	a5,0(s1)
	sw	ra,20(sp)
	mv	s0,a0
	beq	a5,zero,.L151
	lbu	a5,13(s1)
	bne	a5,zero,.L179
.L151:
	lbu	a5,14(s1)
	bne	a5,zero,.L180
.L152:
	lw	a4,8(s0)
	lw	a3,0(s1)
	lbu	a5,42(s0)
	lw	t1,48(a4)
	sw	a3,12(s0)
	lbu	a2,12(s1)
	lw	a4,4(t1)
	sw	a3,4(sp)
	sub	a3,a5,a2
	sub	a4,a4,a3
	sw	a4,4(t1)
	bge	a2,a5,.L153
	lw	a4,0(s0)
	lw	t0,0(t1)
	lw	a0,36(s0)
	lw	a1,16(s0)
	lw	t2,60(a4)
	addi	a4,a5,-1
	andi	a4,a4,0xff
	sw	s1,8(sp)
.L154:
	add	a5,a4,a0
	slli	a5,a5,1
	add	a5,t0,a5
	lh	s1,0(a5)
	mv	a5,a4
	addi	a4,a4,-1
	slli	a3,s1,1
	add	a3,a3,s1
	slli	a3,a3,2
	add	a3,t2,a3
	sw	a1,8(a3)
	andi	a4,a4,0xff
	blt	a2,a5,.L154
	lw	s1,8(sp)
	sb	a5,42(s0)
	sw	a1,8(a3)
.L153:
	sb	a5,44(s0)
	lw	a5,0(sp)
	lw	a3,4(s1)
	lw	a4,48(a5)
	lw	a5,8(s1)
	sw	a3,28(a4)
	lw	a3,4(sp)
	beq	a3,zero,.L155
	lw	a4,16(t1)
	ble	a4,a5,.L150
	sw	s1,0(sp)
	sw	s0,4(sp)
	mv	s1,t1
	mv	s0,a5
.L160:
	lw	a4,12(s1)
	slli	a3,s0,4
	add	a4,a4,a3
	lbu	a3,12(a4)
	bleu	a3,a2,.L157
	lw	a5,0(sp)
	lbu	a3,13(a5)
	bne	a3,zero,.L181
.L158:
	sb	a2,12(a4)
.L157:
	lw	a5,4(sp)
	mv	a1,s0
	lw	a0,8(a5)
	call	findlabel
	lw	a4,16(s1)
	seqz	a0,a0
	add	s0,s0,a0
	ble	a4,s0,.L150
	lw	a5,0(sp)
	lbu	a2,12(a5)
	j	.L160
.L155:
	lw	a3,16(a4)
	bgt	a3,a5,.L182
.L150:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L181:
	lw	a1,4(a4)
	lw	a0,4(sp)
	sw	a4,8(sp)
	call	luaK_patchclose
	lw	a5,0(sp)
	lw	a4,8(sp)
	lbu	a2,12(a5)
	j	.L158
.L179:
	call	luaK_jump
	lbu	a2,12(s1)
	mv	a1,a0
	sw	a0,4(sp)
	mv	a0,s0
	call	luaK_patchclose
	lw	a1,4(sp)
	mv	a0,s0
	call	luaK_patchtohere
	lbu	a5,14(s1)
	beq	a5,zero,.L152
.L180:
	lw	a0,0(sp)
	lla	a1,.LC9
	lw	a0,32(a0)
	call	luaS_new
	mv	a2,a0
	lw	a0,0(sp)
	li	a3,0
	lw	a5,28(a0)
	lw	a1,48(a0)
	lw	a4,16(a5)
	addi	a1,a1,24
	call	newlabelentry
	lw	a3,0(sp)
	slli	a5,a0,4
	lw	a4,48(a3)
	mv	a0,a3
	lw	a1,24(a4)
	add	a1,a1,a5
	call	findgotos
	j	.L152
.L182:
	lw	a4,12(a4)
	slli	a5,a5,4
	li	a0,4
	add	a5,a4,a5
	lw	a2,0(a5)
	lw	a3,8(a5)
	lla	a1,.LC11
	lbu	a5,4(a2)
	beq	a5,a0,.L183
.L161:
	lw	s0,0(sp)
	addi	a2,a2,16
	lw	a0,32(s0)
	call	luaO_pushfstring
	mv	a1,a0
	sw	zero,12(s0)
	mv	a0,s0
	call	luaX_syntaxerror
.L183:
	lbu	a5,6(a2)
	beq	a5,zero,.L161
	lla	a1,.LC10
	j	.L161
	.size	leaveblock, .-leaveblock
	.section	.text.close_func,"ax",@progbits
	.align	2
	.type	close_func, @function
close_func:
	addi	sp,sp,-20
	sw	s0,12(sp)
	mv	a5,a0
	lw	s0,28(a0)
	lw	a5,32(a5)
	li	a2,0
	sw	a0,4(sp)
	li	a1,0
	mv	a0,s0
	sw	a5,0(sp)
	sw	ra,16(sp)
	sw	s1,8(sp)
	lw	s1,0(s0)
	call	luaK_ret
	mv	a0,s0
	call	leaveblock
	lw	a3,16(s0)
	li	a5,1073741824
	addi	a2,a3,1
	bgeu	a2,a5,.L192
	lw	a2,20(s1)
	lw	a1,48(s1)
	lw	a0,0(sp)
	slli	a3,a3,2
	slli	a2,a2,2
	call	luaM_realloc_
	lw	a3,16(s0)
	li	a5,1073741824
	sw	a0,48(s1)
	sw	a3,20(s1)
	addi	a2,a3,1
	bgeu	a2,a5,.L192
	lw	a2,24(s1)
	lw	a1,56(s1)
	lw	a0,0(sp)
	slli	a3,a3,2
	slli	a2,a2,2
	call	luaM_realloc_
	lw	a2,16(s0)
	lw	a3,28(s0)
	sw	a0,56(s1)
	sw	a2,24(s1)
	addi	a1,a3,1
	li	a2,536870912
	bgeu	a1,a2,.L192
	lw	a2,16(s1)
	lw	a1,44(s1)
	lw	a0,0(sp)
	slli	a3,a3,3
	slli	a2,a2,3
	call	luaM_realloc_
	lw	a2,28(s0)
	lw	a3,32(s0)
	li	a5,1073741824
	sw	a2,16(s1)
	sw	a0,44(s1)
	addi	a2,a3,1
	bgeu	a2,a5,.L192
	lw	a2,28(s1)
	lw	a1,52(s1)
	lw	a0,0(sp)
	slli	a3,a3,2
	slli	a2,a2,2
	call	luaM_realloc_
	lh	t2,40(s0)
	lw	t0,32(s1)
	lw	t1,32(s0)
	slli	a3,t2,1
	slli	a2,t0,1
	lw	a1,60(s1)
	sw	a0,52(s1)
	lw	a0,0(sp)
	add	a3,a3,t2
	add	a2,a2,t0
	slli	a3,a3,2
	slli	a2,a2,2
	sw	t1,28(s1)
	call	luaM_realloc_
	lh	a3,40(s0)
	sw	a0,60(s1)
	lw	a2,12(s1)
	sw	a3,32(s1)
	lbu	a3,43(s0)
	lw	a1,64(s1)
	lw	a0,0(sp)
	slli	a2,a2,3
	slli	a3,a3,3
	call	luaM_realloc_
	sw	a0,64(s1)
	lw	a0,0(sp)
	lbu	a2,43(s0)
	lw	a3,4(s0)
	lw	a1,16(a0)
	lw	a5,4(sp)
	lw	a4,12(a1)
	sw	a2,12(s1)
	sw	a3,28(a5)
	bgt	a4,zero,.L193
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L193:
	lw	s0,12(sp)
	lw	ra,16(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	tail	luaC_step
.L192:
	lw	a0,0(sp)
	call	luaM_toobig
	.size	close_func, .-close_func
	.section	.text.test_then_block,"ax",@progbits
	.align	2
	.type	test_then_block, @function
test_then_block:
	lw	a5,28(a0)
	addi	sp,sp,-52
	sw	ra,48(sp)
	sw	s0,44(sp)
	sw	a5,0(sp)
	mv	s0,a0
	sw	a1,4(sp)
	sw	s1,40(sp)
	call	luaX_next
	li	a2,0
	addi	a1,sp,24
	mv	a0,s0
	call	subexpr
	lw	a3,12(s0)
	li	a4,275
	bne	a3,a4,.L211
	mv	a0,s0
	call	luaX_next
	lw	a4,12(s0)
	li	a3,258
	lw	a0,28(s0)
	andi	a4,a4,-9
	addi	a1,sp,24
	bne	a4,a3,.L196
	call	luaK_goiffalse
	lw	a5,0(sp)
	sb	zero,22(sp)
	lw	a1,32(sp)
	lbu	a4,42(a5)
	addi	t1,sp,8
	mv	a0,s0
	sb	a4,20(sp)
	lw	a4,8(a5)
	sb	zero,21(sp)
	lw	a3,12(a5)
	lw	a4,48(a4)
	li	s1,59
	sw	a3,8(sp)
	lw	a2,28(a4)
	lw	a4,16(a4)
	sw	t1,12(a5)
	sw	a2,12(sp)
	sw	a4,16(sp)
	call	gotostat
	j	.L197
.L198:
	mv	a0,s0
	call	statement
.L197:
	lw	a4,12(s0)
	beq	a4,s1,.L198
	li	a3,288
	beq	a4,a3,.L198
	li	a3,262
	ble	a4,a3,.L212
	li	a3,289
	beq	a4,a3,.L200
.L201:
	lw	a0,0(sp)
	call	luaK_jump
	mv	s1,a0
.L210:
	lw	a2,12(s0)
	li	a1,29
	addi	a3,a2,-260
	bgtu	a3,a1,.L206
	li	a4,537001984
	addi	a4,a4,7
	srl	a4,a4,a3
	andi	a4,a4,1
	bne	a4,zero,.L205
	li	a4,274
	beq	a2,a4,.L213
.L206:
	mv	a0,s0
	call	statement
	j	.L210
.L212:
	li	a3,259
	ble	a4,a3,.L201
.L200:
	lw	a0,0(sp)
	call	leaveblock
	lw	ra,48(sp)
	lw	s0,44(sp)
	lw	s1,40(sp)
	addi	sp,sp,52
	jr	ra
.L213:
	mv	a0,s0
	call	statement
.L205:
	lw	a0,0(sp)
	call	leaveblock
	lw	a5,12(s0)
	li	a4,1
	addi	a5,a5,-260
	bleu	a5,a4,.L214
.L208:
	lw	a0,0(sp)
	mv	a1,s1
	call	luaK_patchtohere
	lw	ra,48(sp)
	lw	s0,44(sp)
	lw	s1,40(sp)
	addi	sp,sp,52
	jr	ra
.L196:
	call	luaK_goiftrue
	lw	a5,0(sp)
	sb	zero,22(sp)
	addi	a2,sp,8
	lbu	a4,42(a5)
	lw	s1,36(sp)
	sb	a4,20(sp)
	lw	a4,8(a5)
	sb	zero,21(sp)
	lw	a3,12(a5)
	lw	a4,48(a4)
	sw	a3,8(sp)
	lw	a3,28(a4)
	lw	a4,16(a4)
	sw	a2,12(a5)
	sw	a3,12(sp)
	sw	a4,16(sp)
	j	.L210
.L214:
	lw	s0,0(sp)
	mv	a0,s0
	call	luaK_jump
	lw	a1,4(sp)
	mv	a2,a0
	mv	a0,s0
	call	luaK_concat
	j	.L208
.L211:
	li	a1,275
	mv	a0,s0
	call	error_expected
	.size	test_then_block, .-test_then_block
	.section	.rodata.statement.str1.4,"aMS",@progbits,1
	.align	2
.LC12:
	.string	"C levels"
	.align	2
.LC13:
	.string	"(for index)"
	.align	2
.LC14:
	.string	"(for limit)"
	.align	2
.LC15:
	.string	"(for step)"
	.align	2
.LC16:
	.string	"(for generator)"
	.align	2
.LC17:
	.string	"(for state)"
	.align	2
.LC18:
	.string	"(for control)"
	.align	2
.LC19:
	.string	"'=' or 'in' expected"
	.align	2
.LC20:
	.string	"label '%s' already defined on line %d"
	.align	2
.LC21:
	.string	"syntax error"
	.section	.text.statement,"ax",@progbits
	.align	2
	.type	statement, @function
statement:
	lw	a3,32(a0)
	lw	a5,4(a0)
	addi	sp,sp,-92
	lhu	a4,110(a3)
	sw	s0,84(sp)
	sw	ra,88(sp)
	addi	a4,a4,1
	slli	a4,a4,16
	sw	s1,80(sp)
	srli	a4,a4,16
	lw	s0,28(a0)
	sw	a5,0(sp)
	li	a2,200
	sh	a4,110(a3)
	bgtu	a4,a2,.L325
	lw	a4,12(a0)
	li	a3,59
	mv	s1,a0
	beq	a4,a3,.L324
	addi	a4,a4,-258
	li	a3,30
	bgtu	a4,a3,.L218
	lla	a3,.L220
	slli	a4,a4,2
	add	a4,a4,a3
	lw	a4,0(a4)
	add	a4,a4,a3
	jr	a4
	.section	.rodata.statement,"a",@progbits
	.align	2
	.align	2
.L220:
	.word	.L226-.L220
	.word	.L229-.L220
	.word	.L218-.L220
	.word	.L218-.L220
	.word	.L218-.L220
	.word	.L218-.L220
	.word	.L228-.L220
	.word	.L227-.L220
	.word	.L226-.L220
	.word	.L225-.L220
	.word	.L218-.L220
	.word	.L224-.L220
	.word	.L218-.L220
	.word	.L218-.L220
	.word	.L218-.L220
	.word	.L223-.L220
	.word	.L222-.L220
	.word	.L218-.L220
	.word	.L218-.L220
	.word	.L218-.L220
	.word	.L221-.L220
	.word	.L218-.L220
	.word	.L218-.L220
	.word	.L218-.L220
	.word	.L218-.L220
	.word	.L218-.L220
	.word	.L218-.L220
	.word	.L218-.L220
	.word	.L218-.L220
	.word	.L218-.L220
	.word	.L219-.L220
	.section	.text.statement
.L218:
	addi	a1,sp,64
	mv	a0,s1
	call	suffixedexp
	lw	a4,12(s1)
	li	a3,61
	beq	a4,a3,.L287
	li	a3,44
	beq	a4,a3,.L287
	lw	a3,64(sp)
	li	a4,13
	bne	a3,a4,.L326
	lw	a4,0(s0)
	li	a2,-8372224
	addi	a2,a2,-1
	lw	a3,48(a4)
	lw	a4,68(sp)
	slli	a4,a4,2
	add	a3,a3,a4
	lw	a4,0(a3)
	and	a4,a4,a2
	li	a2,16384
	or	a4,a4,a2
	sw	a4,0(a3)
.L289:
	lw	s0,28(s1)
	j	.L230
.L226:
	mv	a0,s0
	call	luaK_jump
	mv	a1,a0
	mv	a0,s1
	call	gotostat
	lw	s0,28(s1)
.L230:
	lbu	a4,42(s0)
	sb	a4,44(s0)
	lw	a4,32(s1)
	lw	ra,88(sp)
	lw	s0,84(sp)
	lhu	a5,110(a4)
	lw	s1,80(sp)
	addi	a5,a5,-1
	sh	a5,110(a4)
	addi	sp,sp,92
	jr	ra
.L229:
	call	luaX_next
	mv	a0,s1
	call	block
	lw	a3,0(sp)
	li	a2,259
	li	a1,262
	mv	a0,s1
	call	check_match
	lw	s0,28(s1)
	j	.L230
.L228:
	li	a4,1
	sb	a4,58(sp)
	lbu	a4,42(s0)
	sb	a4,56(sp)
	lw	a4,8(s0)
	lw	a4,48(a4)
	lw	a3,16(a4)
	lw	a2,28(a4)
	sb	zero,57(sp)
	lw	a4,12(s0)
	sw	a3,52(sp)
	sw	a2,48(sp)
	sw	a4,44(sp)
	addi	a4,sp,44
	sw	a4,12(s0)
	call	luaX_next
	lw	a3,12(s1)
	li	a4,292
	bne	a3,a4,.L249
	lw	a5,16(s1)
	mv	a0,s1
	sw	a5,8(sp)
	call	luaX_next
	lw	a4,12(s1)
	li	a3,61
	beq	a4,a3,.L237
	li	a3,268
	beq	a4,a3,.L238
	li	a3,44
	beq	a4,a3,.L238
	lla	a1,.LC19
	mv	a0,s1
	call	luaX_syntaxerror
.L227:
	call	luaX_next
	addi	a1,sp,44
	mv	a0,s1
	call	singlevar
	lw	a4,12(s1)
	li	a3,46
	bne	a4,a3,.L257
	li	s0,46
.L258:
	addi	a1,sp,44
	mv	a0,s1
	call	fieldsel
	lw	a4,12(s1)
	beq	a4,s0,.L258
.L257:
	li	a3,58
	li	a2,0
	beq	a4,a3,.L327
.L259:
	lw	s0,0(sp)
	addi	a5,sp,60
	mv	a1,a5
	mv	a3,s0
	mv	a0,s1
	call	body
	lw	a0,28(s1)
	addi	a5,sp,44
	mv	a1,a5
	addi	a2,sp,60
	call	luaK_storevar
	lw	a0,28(s1)
	mv	a1,s0
	call	luaK_fixline
	lw	s0,28(s1)
	j	.L230
.L225:
	addi	a3,sp,60
	li	a4,-1
	mv	a1,a3
	sw	a4,60(sp)
	sw	a3,4(sp)
	call	test_then_block
	lw	a4,12(s1)
	li	a2,261
	bne	a4,a2,.L231
	lw	a3,4(sp)
	sw	s0,8(sp)
	mv	s0,a3
.L232:
	mv	a1,s0
	mv	a0,s1
	call	test_then_block
	lw	a4,12(s1)
	li	a5,261
	beq	a4,a5,.L232
	lw	s0,8(sp)
.L231:
	li	a3,260
	beq	a4,a3,.L328
.L233:
	lw	a3,0(sp)
	li	a2,267
	li	a1,262
	mv	a0,s1
	call	check_match
	lw	a1,60(sp)
	mv	a0,s0
	call	luaK_patchtohere
	lw	s0,28(s1)
	j	.L230
.L224:
	call	luaX_next
	lw	a4,12(s1)
	li	a3,265
	beq	a4,a3,.L260
	li	a3,292
	li	a5,0
	li	s0,44
	bne	a4,a3,.L249
.L261:
	lw	a1,16(s1)
	addi	a5,a5,1
	mv	a0,s1
	sw	a5,0(sp)
	sw	a1,4(sp)
	call	luaX_next
	lw	a1,4(sp)
	mv	a0,s1
	call	new_localvar
	lw	a4,12(s1)
	lw	a5,0(sp)
	beq	a4,s0,.L262
	li	a3,61
	beq	a4,a3,.L329
	sw	zero,60(sp)
	li	a4,0
	addi	a3,sp,60
.L266:
	mv	a1,a5
	mv	a0,s1
	mv	a2,a4
	sw	a5,0(sp)
	call	adjust_assign
	lw	a5,0(sp)
	lw	s0,28(s1)
	mv	a1,a5
	mv	a0,s0
	call	adjustlocalvars.isra.0
	j	.L230
.L223:
	mv	a0,s0
	call	luaK_getlabel
	lbu	a2,42(s0)
	li	a4,1
	sb	a4,42(sp)
	sb	a2,40(sp)
	lw	a4,8(s0)
	sb	zero,41(sp)
	lw	a1,12(s0)
	lw	a4,48(a4)
	addi	a5,sp,28
	mv	t1,a0
	lw	a3,28(a4)
	lw	a4,16(a4)
	sb	a2,56(sp)
	sb	zero,58(sp)
	sw	a3,48(sp)
	sw	a4,52(sp)
	sb	zero,57(sp)
	sw	a5,44(sp)
	addi	a2,sp,44
	sw	a2,12(s0)
	mv	a0,s1
	sw	t1,4(sp)
	sw	a3,32(sp)
	sw	a4,36(sp)
	sw	a1,28(sp)
	call	luaX_next
.L251:
	lw	a3,12(s1)
	li	a5,29
	addi	a4,a3,-260
	bgtu	a4,a5,.L253
	li	a5,537001984
	addi	a5,a5,7
	srl	a5,a5,a4
	andi	a5,a5,1
	bne	a5,zero,.L252
	li	a5,274
	beq	a3,a5,.L330
.L253:
	mv	a0,s1
	call	statement
	j	.L251
.L222:
	call	luaX_next
	lw	a4,12(s1)
	li	a2,29
	lw	a5,28(s1)
	addi	a3,a4,-260
	bgtu	a3,a2,.L277
	li	a4,537001984
	addi	a4,a4,7
	srl	a4,a4,a3
	andi	a4,a4,1
	bne	a4,zero,.L331
.L279:
	addi	a3,sp,60
	li	a2,0
	mv	a1,a3
	mv	a0,s1
	sw	a5,4(sp)
	sw	a3,0(sp)
	call	subexpr
	lw	a2,12(s1)
	li	a4,44
	lw	a3,0(sp)
	lw	a5,4(sp)
	beq	a2,a4,.L300
	lw	a4,60(sp)
	li	a2,1
	addi	a4,a4,-13
	bleu	a4,a2,.L332
	mv	a1,a3
	mv	a0,a5
	sw	a5,0(sp)
	call	luaK_exp2anyreg
	lw	a5,0(sp)
	mv	a1,a0
	li	s0,1
.L278:
	mv	a2,s0
	mv	a0,a5
	call	luaK_ret
	lw	a3,12(s1)
	li	a4,59
	bne	a3,a4,.L289
	mv	a0,s1
.L324:
	call	luaX_next
	lw	s0,28(s1)
	j	.L230
.L221:
	call	luaX_next
	mv	a0,s0
	call	luaK_getlabel
	addi	a3,sp,60
	mv	a4,a0
	li	a2,0
	mv	a1,a3
	mv	a0,s1
	sw	a3,8(sp)
	sw	a4,4(sp)
	call	subexpr
	lw	a2,60(sp)
	li	a4,1
	lw	a3,8(sp)
	bne	a2,a4,.L234
	li	a4,3
	sw	a4,60(sp)
.L234:
	lw	a0,28(s1)
	mv	a1,a3
	sw	a3,8(sp)
	call	luaK_goiftrue
	li	a4,1
	lw	t1,72(sp)
	sb	a4,74(sp)
	lbu	a4,42(s0)
	lw	a3,8(sp)
	lw	a1,12(s1)
	sb	a4,72(sp)
	lw	a4,8(s0)
	li	a2,259
	lw	a4,48(a4)
	lw	t0,28(a4)
	lw	a0,16(a4)
	sb	zero,73(sp)
	lw	a4,12(s0)
	sw	t0,64(sp)
	sw	a0,68(sp)
	sw	a4,60(sp)
	sw	a3,12(s0)
	bne	a1,a2,.L333
	mv	a0,s1
	sw	t1,8(sp)
	call	luaX_next
	mv	a0,s1
	call	block
	mv	a0,s0
	call	luaK_jump
	lw	a2,4(sp)
	mv	a1,a0
	mv	a0,s0
	call	luaK_patchlist
	lw	a3,0(sp)
	li	a2,278
	li	a1,262
	mv	a0,s1
	call	check_match
	mv	a0,s0
	call	leaveblock
	lw	t1,8(sp)
	mv	a0,s0
	mv	a1,t1
	call	luaK_patchtohere
	lw	s0,28(s1)
	j	.L230
.L219:
	call	luaX_next
	lw	a3,12(s1)
	li	a4,292
	bne	a3,a4,.L249
	mv	a0,s1
	lw	s0,16(s1)
	call	luaX_next
	lw	a4,28(s1)
	lw	a5,48(s1)
	sw	a4,4(sp)
	lw	a4,12(a4)
	lw	a0,28(a5)
	sw	a5,8(sp)
	lw	a4,4(a4)
	lw	a3,24(a5)
	addi	a1,a5,24
	ble	a0,a4,.L268
	slli	a2,a4,4
	add	a3,a3,a2
.L270:
	lw	a5,0(a3)
	beq	s0,a5,.L334
	addi	a4,a4,1
	addi	a3,a3,16
	bne	a0,a4,.L270
.L268:
	lw	a3,12(s1)
	li	a4,288
	bne	a3,a4,.L335
	mv	a0,s1
	sw	a1,12(sp)
	call	luaX_next
	lw	a0,4(sp)
	call	luaK_getlabel
	lw	a3,0(sp)
	lw	a1,12(sp)
	mv	a4,a0
	mv	a2,s0
	mv	a0,s1
	call	newlabelentry
	sw	a0,0(sp)
	li	s0,59
	j	.L272
.L273:
	mv	a0,s1
	call	statement
.L272:
	lw	a4,12(s1)
	beq	a4,s0,.L273
	li	a5,288
	beq	a4,a5,.L273
	lw	a5,8(sp)
	li	a2,262
	lw	a1,24(a5)
	lw	a5,0(sp)
	slli	a3,a5,4
	add	a1,a1,a3
	ble	a4,a2,.L336
	li	a3,289
	beq	a4,a3,.L275
.L276:
	mv	a0,s1
	call	findgotos
	lw	s0,28(s1)
	j	.L230
.L336:
	li	a3,259
	ble	a4,a3,.L276
.L275:
	lw	a5,4(sp)
	lw	a4,12(a5)
	lbu	a4,12(a4)
	sb	a4,12(a1)
	j	.L276
.L330:
	mv	a0,s1
	call	statement
.L252:
	lw	a3,0(sp)
	li	a2,273
	li	a1,277
	mv	a0,s1
	call	check_match
	addi	a3,sp,60
	li	a2,0
	mv	a1,a3
	mv	a0,s1
	sw	a3,0(sp)
	call	subexpr
	lw	a2,60(sp)
	li	a4,1
	lw	a3,0(sp)
	bne	a2,a4,.L255
	li	a4,3
	sw	a4,60(sp)
.L255:
	lw	a0,28(s1)
	mv	a1,a3
	call	luaK_goiftrue
	lbu	a4,57(sp)
	lw	a1,72(sp)
	bne	a4,zero,.L337
.L256:
	mv	a0,s0
	sw	a1,0(sp)
	call	leaveblock
	lw	a2,4(sp)
	lw	a1,0(sp)
	mv	a0,s0
	call	luaK_patchlist
	mv	a0,s0
	call	leaveblock
	lw	s0,28(s1)
	j	.L230
.L238:
	lw	a5,28(s1)
	li	a2,15
	lla	a1,.LC16
	sw	a5,12(sp)
	lbu	a5,44(a5)
	mv	a0,s1
	sw	a5,16(sp)
	call	luaX_newstring
	mv	a1,a0
	mv	a0,s1
	call	new_localvar
	li	a2,11
	lla	a1,.LC17
	mv	a0,s1
	call	luaX_newstring
	mv	a1,a0
	mv	a0,s1
	call	new_localvar
	li	a2,13
	lla	a1,.LC18
	mv	a0,s1
	call	luaX_newstring
	mv	a1,a0
	mv	a0,s1
	call	new_localvar
	lw	a1,8(sp)
	mv	a0,s1
	call	new_localvar
	lw	a4,12(s1)
	li	a5,4
	li	a3,44
	sw	a5,4(sp)
	beq	a4,a3,.L293
.L250:
	li	a3,268
	bne	a4,a3,.L338
	mv	a0,s1
	call	luaX_next
	lw	a5,4(s1)
	addi	a3,sp,60
	li	a2,0
	mv	a1,a3
	mv	a0,s1
	sw	a3,20(sp)
	sw	a5,8(sp)
	call	subexpr
	lw	a2,12(s1)
	li	a4,44
	lw	a3,20(sp)
	beq	a2,a4,.L294
	li	a4,1
.L248:
	mv	a2,a4
	mv	a0,s1
	li	a1,3
	call	adjust_assign
	lw	a0,12(sp)
	li	a1,3
	call	luaK_checkstack
	lw	a5,4(sp)
	lw	a2,8(sp)
	lw	a1,16(sp)
	li	a4,0
	addi	a3,a5,-3
	mv	a0,s1
	call	forbody
.L244:
	lw	a3,0(sp)
	li	a2,264
	li	a1,262
	mv	a0,s1
	call	check_match
	mv	a0,s0
	call	leaveblock
	lw	s0,28(s1)
	j	.L230
.L237:
	lw	a5,28(s1)
	li	a2,11
	lla	a1,.LC13
	sw	a5,4(sp)
	lbu	a5,44(a5)
	mv	a0,s1
	sw	a4,16(sp)
	sw	a5,12(sp)
	call	luaX_newstring
	mv	a1,a0
	mv	a0,s1
	call	new_localvar
	li	a2,11
	lla	a1,.LC14
	mv	a0,s1
	call	luaX_newstring
	mv	a1,a0
	mv	a0,s1
	call	new_localvar
	li	a2,10
	lla	a1,.LC15
	mv	a0,s1
	call	luaX_newstring
	mv	a1,a0
	mv	a0,s1
	call	new_localvar
	lw	a1,8(sp)
	mv	a0,s1
	call	new_localvar
	lw	a3,12(s1)
	lw	a4,16(sp)
	bne	a3,a4,.L339
	mv	a0,s1
	call	luaX_next
	li	a2,0
	addi	a1,sp,60
	mv	a0,s1
	call	subexpr
	lw	a0,28(s1)
	addi	a1,sp,60
	call	luaK_exp2nextreg
	lw	a4,12(s1)
	li	a3,44
	bne	a4,a3,.L340
	mv	a0,s1
	sw	a4,8(sp)
	call	luaX_next
	li	a2,0
	addi	a1,sp,60
	mv	a0,s1
	call	subexpr
	lw	a0,28(s1)
	addi	a1,sp,60
	call	luaK_exp2nextreg
	lw	a3,12(s1)
	lw	a4,8(sp)
	beq	a3,a4,.L242
	lw	a5,4(sp)
	li	a1,1
	lbu	a4,44(a5)
	mv	a0,a5
	sw	a4,8(sp)
	call	luaK_intK
	lw	a4,8(sp)
	mv	a2,a0
	lw	a0,4(sp)
	mv	a1,a4
	call	luaK_codek
	lw	a0,4(sp)
	li	a1,1
	call	luaK_reserveregs
.L243:
	lw	a2,0(sp)
	lw	a1,12(sp)
	li	a4,1
	li	a3,1
	mv	a0,s1
	call	forbody
	j	.L244
.L287:
	li	a2,1
	addi	a1,sp,60
	mv	a0,s1
	sw	zero,60(sp)
	call	assignment
	lw	s0,28(s1)
	j	.L230
.L300:
	li	s0,1
	sw	s0,0(sp)
	sw	a5,4(sp)
	mv	s0,s1
	mv	s1,a3
.L280:
	mv	a0,s0
	call	luaX_next
	lw	a5,0(sp)
	lw	a0,28(s0)
	mv	a1,s1
	addi	a5,a5,1
	sw	a5,0(sp)
	call	luaK_exp2nextreg
	li	a2,0
	mv	a1,s1
	mv	a0,s0
	call	subexpr
	lw	a4,12(s0)
	li	a5,44
	beq	a4,a5,.L280
	lw	a4,60(sp)
	li	a2,1
	mv	a3,s1
	addi	a4,a4,-13
	mv	s1,s0
	lw	a5,4(sp)
	lw	s0,0(sp)
	bleu	a4,a2,.L341
	mv	a1,a3
	mv	a0,a5
	sw	a5,0(sp)
	call	luaK_exp2nextreg
	lw	a5,0(sp)
	lbu	a1,42(a5)
	j	.L278
.L337:
	lbu	a2,56(sp)
	mv	a0,s0
	sw	a1,0(sp)
	call	luaK_patchclose
	lw	a1,0(sp)
	j	.L256
.L262:
	mv	a0,s1
	sw	a5,0(sp)
	call	luaX_next
	lw	a3,12(s1)
	li	a4,292
	lw	a5,0(sp)
	beq	a3,a4,.L261
.L249:
	li	a1,292
	mv	a0,s1
	call	error_expected
.L260:
	mv	a0,s1
	call	luaX_next
	lw	a3,12(s1)
	li	a4,292
	lw	s0,28(s1)
	bne	a3,a4,.L249
	lw	a1,16(s1)
	mv	a0,s1
	sw	a1,0(sp)
	call	luaX_next
	lw	a1,0(sp)
	mv	a0,s1
	call	new_localvar
	lw	a3,28(s1)
	li	a2,0
	addi	a1,sp,60
	lbu	a4,42(a3)
	lw	a0,8(a3)
	lw	t1,36(a3)
	addi	a4,a4,1
	andi	a4,a4,0xff
	sb	a4,42(a3)
	lw	a0,48(a0)
	add	a4,a4,t1
	addi	a4,a4,-1
	lw	a0,0(a0)
	slli	a4,a4,1
	lw	t0,0(a3)
	add	a4,a0,a4
	lh	t1,0(a4)
	lw	a0,60(t0)
	lw	t0,16(a3)
	slli	a4,t1,1
	add	a4,a4,t1
	lw	a3,4(s1)
	slli	a4,a4,2
	add	a4,a0,a4
	sw	t0,4(a4)
	mv	a0,s1
	call	body
	lw	a4,8(s0)
	lw	a1,36(s0)
	lw	a3,0(s0)
	lw	a2,48(a4)
	lw	a4,64(sp)
	lw	a3,60(a3)
	lw	a2,0(a2)
	add	a4,a4,a1
	slli	a4,a4,1
	add	a4,a2,a4
	lh	a2,0(a4)
	lw	a1,16(s0)
	lw	s0,28(s1)
	slli	a4,a2,1
	add	a4,a4,a2
	slli	a4,a4,2
	add	a4,a3,a4
	sw	a1,4(a4)
	j	.L230
.L328:
	mv	a0,s1
	call	luaX_next
	mv	a0,s1
	call	block
	j	.L233
.L327:
	addi	a1,sp,44
	mv	a0,s1
	call	fieldsel
	li	a2,1
	j	.L259
.L277:
	li	a3,59
	li	s0,0
	li	a1,0
	beq	a4,a3,.L278
	j	.L279
.L329:
	mv	a0,s1
	sw	a5,4(sp)
	call	luaX_next
	addi	a3,sp,60
	li	a2,0
	mv	a1,a3
	mv	a0,s1
	sw	a3,0(sp)
	call	subexpr
	lw	a2,12(s1)
	lw	a3,0(sp)
	lw	a5,4(sp)
	li	a4,1
	bne	a2,s0,.L266
	li	s0,44
	sw	a5,8(sp)
	sw	a4,0(sp)
	sw	a3,4(sp)
.L267:
	mv	a0,s1
	call	luaX_next
	lw	a5,0(sp)
	lw	a1,4(sp)
	lw	a0,28(s1)
	addi	a5,a5,1
	sw	a5,0(sp)
	call	luaK_exp2nextreg
	lw	a1,4(sp)
	li	a2,0
	mv	a0,s1
	call	subexpr
	lw	a4,12(s1)
	beq	a4,s0,.L267
	lw	a5,8(sp)
	lw	a4,0(sp)
	lw	a3,4(sp)
	j	.L266
.L331:
	li	s0,0
	li	a1,0
	j	.L278
.L294:
	li	a4,1
	sw	s0,24(sp)
	sw	a4,20(sp)
	mv	s0,a3
.L247:
	mv	a0,s1
	call	luaX_next
	lw	a5,20(sp)
	lw	a0,28(s1)
	mv	a1,s0
	addi	a5,a5,1
	sw	a5,20(sp)
	call	luaK_exp2nextreg
	li	a2,0
	mv	a1,s0
	mv	a0,s1
	call	subexpr
	lw	a3,12(s1)
	li	a5,44
	beq	a3,a5,.L247
	mv	a3,s0
	lw	a4,20(sp)
	lw	s0,24(sp)
	j	.L248
.L293:
	mv	a5,s1
	mv	s1,s0
	mv	s0,a5
.L245:
	mv	a0,s0
	call	luaX_next
	lw	a5,12(s0)
	li	a4,292
	bne	a5,a4,.L319
	lw	a5,4(sp)
	lw	a1,16(s0)
	mv	a0,s0
	addi	a5,a5,1
	sw	a5,4(sp)
	sw	a1,8(sp)
	call	luaX_next
	lw	a1,8(sp)
	mv	a0,s0
	call	new_localvar
	lw	a4,12(s0)
	li	a5,44
	beq	a4,a5,.L245
	mv	a5,s0
	mv	s0,s1
	mv	s1,a5
	j	.L250
.L242:
	mv	a0,s1
	call	luaX_next
	addi	a1,sp,60
	li	a2,0
	mv	a0,s1
	call	subexpr
	lw	a0,28(s1)
	addi	a1,sp,60
	call	luaK_exp2nextreg
	j	.L243
.L332:
	mv	a1,a3
	mv	a0,a5
	li	a2,-1
	sw	a5,0(sp)
	call	luaK_setreturns
	lw	a3,60(sp)
	li	a4,13
	lw	a5,0(sp)
	beq	a3,a4,.L342
.L291:
	lbu	a1,42(a5)
	li	s0,-1
	j	.L278
.L341:
	mv	a0,a5
	li	a2,-1
	mv	a1,a3
	sw	a5,0(sp)
	call	luaK_setreturns
	lw	a5,0(sp)
	j	.L291
.L334:
	lw	s1,4(sp)
	lw	a3,8(a3)
	lla	a1,.LC20
	lw	a5,8(s1)
	addi	a2,s0,16
	lw	a0,32(a5)
	call	luaO_pushfstring
	mv	a1,a0
	lw	a0,8(s1)
	sw	zero,12(a0)
	call	luaX_syntaxerror
.L325:
	lla	a2,.LC12
	li	a1,200
	mv	a0,s0
	call	errorlimit
.L342:
	lw	a4,0(a5)
	lw	a3,48(a4)
	lw	a4,64(sp)
	slli	a4,a4,2
	add	a3,a3,a4
	lw	a4,0(a3)
	andi	a4,a4,-64
	ori	a4,a4,37
	sw	a4,0(a3)
	j	.L291
.L338:
	li	a1,268
	mv	a0,s1
	call	error_expected
.L335:
	li	a1,288
	mv	a0,s1
	call	error_expected
.L326:
	lla	a1,.LC21
	mv	a0,s1
	call	luaX_syntaxerror
.L340:
	li	a1,44
	mv	a0,s1
	call	error_expected
.L339:
	li	a1,61
	mv	a0,s1
	call	error_expected
.L333:
	li	a1,259
	mv	a0,s1
	call	error_expected
.L319:
	mv	s1,s0
	j	.L249
	.size	statement, .-statement
	.section	.text.block,"ax",@progbits
	.align	2
	.type	block, @function
block:
	addi	sp,sp,-28
	sw	s1,16(sp)
	lw	s1,28(a0)
	sw	s0,20(sp)
	sw	ra,24(sp)
	lbu	a5,42(s1)
	sb	zero,14(sp)
	mv	s0,a0
	sb	a5,12(sp)
	lw	a5,8(s1)
	sb	zero,13(sp)
	lw	a4,12(s1)
	lw	a5,48(a5)
	li	a2,29
	sw	a4,0(sp)
	lw	a4,28(a5)
	lw	a5,16(a5)
	sw	sp,12(s1)
	sw	a4,4(sp)
	sw	a5,8(sp)
.L344:
	lw	a3,12(s0)
	li	a5,537001984
	addi	a5,a5,7
	addi	a4,a3,-260
	srl	a5,a5,a4
	andi	a5,a5,1
	mv	a0,s0
	li	a1,274
	bgtu	a4,a2,.L346
	bne	a5,zero,.L345
	beq	a3,a1,.L349
.L346:
	call	statement
	li	a2,29
	j	.L344
.L349:
	mv	a0,s0
	call	statement
.L345:
	mv	a0,s1
	call	leaveblock
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
	.size	block, .-block
	.section	.text.forbody,"ax",@progbits
	.align	2
	.type	forbody, @function
forbody:
	addi	sp,sp,-48
	sw	s1,36(sp)
	lw	s1,28(a0)
	sw	ra,44(sp)
	sw	s0,40(sp)
	lbu	a5,42(s1)
	mv	s0,a0
	lw	a0,8(s1)
	addi	a5,a5,3
	andi	a5,a5,0xff
	sb	a5,42(s1)
	lw	ra,48(a0)
	lw	t2,0(s1)
	lw	a0,36(s1)
	lw	ra,0(ra)
	lw	t2,60(t2)
	add	a5,a5,a0
	lw	a0,16(s1)
	slli	a5,a5,1
	sw	a3,0(sp)
	sw	a4,8(sp)
	sw	a1,12(sp)
	sw	a2,16(sp)
	add	a4,ra,a5
	li	a3,3
.L351:
	lh	a2,-6(a4)
	addi	a3,a3,-1
	addi	a4,a4,2
	slli	a5,a2,1
	add	a5,a5,a2
	slli	a5,a5,2
	add	a5,t2,a5
	sw	a0,4(a5)
	bne	a3,zero,.L351
	lw	a4,12(s0)
	li	a5,259
	bne	a4,a5,.L359
	mv	a0,s0
	call	luaX_next
	lw	a5,8(sp)
	bne	a5,zero,.L360
	mv	a0,s1
	call	luaK_jump
	sw	a0,4(sp)
.L354:
	lbu	a5,42(s1)
	sb	zero,34(sp)
	lw	a0,28(s0)
	sb	a5,32(sp)
	lw	a5,8(s1)
	sb	zero,33(sp)
	lw	a4,12(s1)
	lw	a5,48(a5)
	lw	a1,0(sp)
	addi	a2,sp,20
	lw	a3,28(a5)
	lw	a5,16(a5)
	sw	a2,12(s1)
	sw	a3,24(sp)
	sw	a5,28(sp)
	sw	a4,20(sp)
	call	adjustlocalvars.isra.0
	lw	a1,0(sp)
	mv	a0,s1
	call	luaK_reserveregs
	mv	a0,s0
	call	block
	mv	a0,s1
	call	leaveblock
	lw	a1,4(sp)
	mv	a0,s1
	call	luaK_patchtohere
	lw	a5,8(sp)
	beq	a5,zero,.L355
	lw	a2,12(sp)
	li	a3,131072
	li	a1,39
	addi	a3,a3,-2
	mv	a0,s1
	call	luaK_codeABx
	mv	a1,a0
.L356:
	lw	a5,4(sp)
	mv	a0,s1
	addi	a2,a5,1
	call	luaK_patchlist
	lw	a1,16(sp)
	mv	a0,s1
	call	luaK_fixline
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
.L360:
	lw	a2,12(sp)
	li	a3,131072
	addi	a3,a3,-2
	li	a1,40
	mv	a0,s1
	call	luaK_codeABx
	sw	a0,4(sp)
	j	.L354
.L355:
	lw	s0,12(sp)
	lw	a4,0(sp)
	li	a3,0
	mv	a2,s0
	li	a1,41
	mv	a0,s1
	call	luaK_codeABC
	lw	a1,16(sp)
	mv	a0,s1
	call	luaK_fixline
	li	a3,131072
	li	a1,42
	addi	a3,a3,-2
	addi	a2,s0,2
	mv	a0,s1
	call	luaK_codeABx
	mv	a1,a0
	j	.L356
.L359:
	li	a1,259
	mv	a0,s0
	call	error_expected
	.size	forbody, .-forbody
	.section	.rodata.body.str1.4,"aMS",@progbits,1
	.align	2
.LC22:
	.string	"functions"
	.align	2
.LC23:
	.string	"self"
	.align	2
.LC24:
	.string	"<name> or '...' expected"
	.section	.text.body,"ax",@progbits
	.align	2
	.type	body, @function
body:
	lw	t1,28(a0)
	addi	sp,sp,-100
	sw	s0,92(sp)
	lw	s0,0(t1)
	lw	a5,32(t1)
	sw	s1,88(sp)
	lw	t2,28(s0)
	sw	ra,96(sp)
	sw	a1,16(sp)
	sw	a2,0(sp)
	sw	a3,4(sp)
	lw	t0,32(a0)
	mv	s1,a0
	bge	a5,t2,.L362
.L365:
	mv	a0,t0
	sw	t1,12(sp)
	sw	t0,8(sp)
	call	luaF_newproto
	lw	t1,12(sp)
	lw	a4,52(s0)
	lw	t0,8(sp)
	lw	a5,32(t1)
	mv	a2,a0
	addi	a3,a5,1
	slli	a5,a5,2
	sw	a3,32(t1)
	add	a4,a4,a5
	sw	a0,0(a4)
	lbu	a5,5(s0)
	andi	a5,a5,4
	beq	a5,zero,.L364
	lbu	a5,5(a0)
	andi	a5,a5,3
	bne	a5,zero,.L389
.L364:
	lw	a4,4(sp)
	lw	a5,48(s1)
	addi	a3,sp,40
	sw	a4,36(a2)
	sw	zero,80(sp)
	sb	zero,84(sp)
	lw	a4,4(a5)
	lw	a0,28(s1)
	sw	a3,28(s1)
	li	a3,-1
	sw	a3,64(sp)
	sw	a4,76(sp)
	sw	s1,48(sp)
	li	a4,2
	sw	zero,56(sp)
	sw	zero,60(sp)
	sw	zero,68(sp)
	sw	zero,72(sp)
	lw	a1,52(s1)
	sb	a4,8(a2)
	lw	a3,28(a5)
	lw	a5,16(a5)
	lw	a4,12(s1)
	sw	a2,40(sp)
	sw	a5,32(sp)
	addi	a5,sp,24
	sw	a5,52(sp)
	sw	a0,44(sp)
	sw	a1,72(a2)
	sw	a3,28(sp)
	sh	zero,36(sp)
	sb	zero,38(sp)
	sw	zero,24(sp)
	li	a5,40
	bne	a4,a5,.L390
	mv	a0,s1
	call	luaX_next
	lw	a5,0(sp)
	bne	a5,zero,.L368
	lw	s0,28(s1)
	li	a3,41
	lw	a5,0(s0)
	sw	a5,0(sp)
	lw	a5,0(sp)
	sb	zero,7(a5)
	lw	a4,12(s1)
	beq	a4,a3,.L381
.L393:
	li	a3,0
	sw	s0,8(sp)
	mv	s0,a3
.L375:
	li	a5,281
	beq	a4,a5,.L371
	li	a5,292
	bne	a4,a5,.L372
	lw	a1,16(s1)
	mv	a0,s1
	addi	s0,s0,1
	sw	a1,12(sp)
	call	luaX_next
	lw	a1,12(sp)
	mv	a0,s1
	call	new_localvar
	lw	a5,0(sp)
	lbu	a5,7(a5)
	bne	a5,zero,.L388
	lw	a4,12(s1)
	li	a5,44
	beq	a4,a5,.L374
.L388:
	mv	a3,s0
	lw	a0,28(s1)
	lw	s0,8(sp)
.L370:
	mv	a1,a3
	call	adjustlocalvars.isra.0
	lw	a5,0(sp)
	lbu	a1,42(s0)
	mv	a0,s0
	sb	a1,6(a5)
	call	luaK_reserveregs
	lw	a4,12(s1)
	li	a5,41
	bne	a4,a5,.L391
	mv	a0,s1
	call	luaX_next
	li	s0,29
.L377:
	lw	a3,12(s1)
	addi	a4,a3,-260
	bgtu	a4,s0,.L379
	li	a5,537001984
	addi	a5,a5,7
	srl	a5,a5,a4
	andi	a5,a5,1
	bne	a5,zero,.L378
	li	a5,274
	beq	a3,a5,.L392
.L379:
	mv	a0,s1
	call	statement
	j	.L377
.L392:
	mv	a0,s1
	call	statement
.L378:
	lw	a4,4(s1)
	lw	a5,40(sp)
	lw	a3,4(sp)
	mv	a0,s1
	sw	a4,40(a5)
	li	a2,265
	li	a1,262
	call	check_match
	lw	a5,28(s1)
	li	a2,0
	li	a1,44
	lw	s0,4(a5)
	lw	a3,32(s0)
	mv	a0,s0
	addi	a3,a3,-1
	call	luaK_codeABx
	lw	a4,16(sp)
	li	a5,-1
	sw	a5,8(a4)
	sw	a5,12(a4)
	li	a5,12
	sw	a0,4(a4)
	sw	a5,0(a4)
	mv	a0,s0
	mv	a1,a4
	call	luaK_exp2nextreg
	mv	a0,s1
	call	close_func
	lw	ra,96(sp)
	lw	s0,92(sp)
	lw	s1,88(sp)
	addi	sp,sp,100
	jr	ra
.L371:
	mv	a0,s1
	sw	s0,12(sp)
	lw	s0,8(sp)
	call	luaX_next
	lw	a5,0(sp)
	li	a4,1
	lw	a3,12(sp)
	sb	a4,7(a5)
	lw	a0,28(s1)
	j	.L370
.L362:
	lw	a1,52(s0)
	li	a4,262144
	lla	a5,.LC22
	mv	a0,t0
	addi	a4,a4,-1
	li	a3,4
	addi	a2,s0,28
	sw	t2,20(sp)
	sw	t1,12(sp)
	sw	t0,8(sp)
	call	luaM_growaux_
	lw	a5,28(s0)
	lw	t2,20(sp)
	sw	a0,52(s0)
	lw	t0,8(sp)
	lw	t1,12(sp)
	bge	t2,a5,.L365
	slli	t2,t2,2
	slli	a5,a5,2
	add	t2,a0,t2
	add	a0,a0,a5
.L366:
	sw	zero,0(t2)
	addi	t2,t2,4
	bne	a0,t2,.L366
	j	.L365
.L368:
	li	a2,4
	lla	a1,.LC23
	mv	a0,s1
	call	luaX_newstring
	mv	a1,a0
	mv	a0,s1
	call	new_localvar
	lw	s0,28(s1)
	lbu	a4,42(s0)
	lw	a3,8(s0)
	lw	a2,36(s0)
	addi	a4,a4,1
	andi	a4,a4,0xff
	sb	a4,42(s0)
	lw	a3,48(a3)
	add	a4,a4,a2
	addi	a4,a4,-1
	lw	a3,0(a3)
	slli	a4,a4,1
	lw	a5,0(s0)
	add	a4,a3,a4
	lh	a2,0(a4)
	lw	a3,60(a5)
	lw	a1,16(s0)
	slli	a4,a2,1
	sw	a5,0(sp)
	add	a4,a4,a2
	lw	a5,0(sp)
	slli	a4,a4,2
	add	a4,a3,a4
	sw	a1,4(a4)
	sb	zero,7(a5)
	lw	a4,12(s1)
	li	a3,41
	bne	a4,a3,.L393
.L381:
	mv	a0,s0
	li	a3,0
	j	.L370
.L389:
	sw	a0,8(sp)
	mv	a1,s0
	mv	a0,t0
	call	luaC_barrier_
	lw	a2,8(sp)
	j	.L364
.L374:
	mv	a0,s1
	call	luaX_next
	lw	a4,12(s1)
	j	.L375
.L372:
	lla	a1,.LC24
	mv	a0,s1
	call	luaX_syntaxerror
.L391:
	li	a1,41
	mv	a0,s1
	call	error_expected
.L390:
	li	a1,40
	mv	a0,s1
	call	error_expected
	.size	body, .-body
	.section	.rodata.subexpr.str1.4,"aMS",@progbits,1
	.align	2
.LC25:
	.string	"cannot use '...' outside a vararg function"
	.section	.text.subexpr,"ax",@progbits
	.align	2
	.type	subexpr, @function
subexpr:
	lw	a4,32(a0)
	addi	sp,sp,-40
	sw	ra,36(sp)
	lhu	a5,110(a4)
	sw	s0,32(sp)
	sw	s1,28(sp)
	addi	a5,a5,1
	slli	a5,a5,16
	srli	a5,a5,16
	lw	t1,28(a0)
	li	a3,200
	sh	a5,110(a4)
	sw	a1,0(sp)
	sw	a2,8(sp)
	bgtu	a5,a3,.L456
	lw	a5,12(a0)
	li	a4,126
	mv	s0,a0
	beq	a5,a4,.L440
	bgt	a5,a4,.L397
	li	a4,35
	beq	a5,a4,.L441
	li	a3,45
	li	s1,0
	bne	a5,a3,.L457
.L396:
	lw	a3,4(s0)
	mv	a0,s0
	sw	a3,4(sp)
	call	luaX_next
	lw	a1,0(sp)
	li	a2,12
	mv	a0,s0
	call	subexpr
	lw	a3,4(sp)
	lw	a2,0(sp)
	lw	a0,28(s0)
	mv	a1,s1
	call	luaK_prefix
.L409:
	lw	a5,12(s0)
	li	a4,126
	beq	a5,a4,.L444
	bgt	a5,a4,.L413
	li	a4,94
	bgt	a5,a4,.L414
	li	a4,36
	ble	a5,a4,.L451
	addi	a5,a5,-37
	li	a4,57
	bgtu	a5,a4,.L451
	lla	a4,.L428
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.subexpr,"a",@progbits
	.align	2
	.align	2
.L428:
	.word	.L435-.L428
	.word	.L434-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L433-.L428
	.word	.L432-.L428
	.word	.L451-.L428
	.word	.L431-.L428
	.word	.L451-.L428
	.word	.L430-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L429-.L428
	.word	.L451-.L428
	.word	.L448-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L451-.L428
	.word	.L427-.L428
	.section	.text.subexpr
.L413:
	addi	a5,a5,-257
	li	a4,30
	bgtu	a5,a4,.L451
	lla	a4,.L418
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.subexpr
	.align	2
	.align	2
.L418:
	.word	.L446-.L418
	.word	.L451-.L418
	.word	.L451-.L418
	.word	.L451-.L418
	.word	.L451-.L418
	.word	.L451-.L418
	.word	.L451-.L418
	.word	.L451-.L418
	.word	.L451-.L418
	.word	.L451-.L418
	.word	.L451-.L418
	.word	.L451-.L418
	.word	.L451-.L418
	.word	.L451-.L418
	.word	.L451-.L418
	.word	.L426-.L418
	.word	.L451-.L418
	.word	.L451-.L418
	.word	.L451-.L418
	.word	.L451-.L418
	.word	.L451-.L418
	.word	.L451-.L418
	.word	.L425-.L418
	.word	.L424-.L418
	.word	.L451-.L418
	.word	.L423-.L418
	.word	.L422-.L418
	.word	.L421-.L418
	.word	.L420-.L418
	.word	.L419-.L418
	.word	.L417-.L418
	.section	.text.subexpr
.L451:
	li	s1,21
.L416:
	lw	a4,32(s0)
	lw	ra,36(sp)
	lw	s0,32(sp)
	lhu	a5,110(a4)
	mv	a0,s1
	lw	s1,28(sp)
	addi	a5,a5,-1
	sh	a5,110(a4)
	addi	sp,sp,40
	jr	ra
.L397:
	li	a3,271
	li	s1,2
	beq	a5,a3,.L396
	addi	a5,a5,-263
	li	a4,30
	bgtu	a5,a4,.L399
	lla	a4,.L401
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.subexpr
	.align	2
	.align	2
.L401:
	.word	.L408-.L401
	.word	.L399-.L401
	.word	.L407-.L401
	.word	.L399-.L401
	.word	.L399-.L401
	.word	.L399-.L401
	.word	.L399-.L401
	.word	.L406-.L401
	.word	.L399-.L401
	.word	.L399-.L401
	.word	.L399-.L401
	.word	.L399-.L401
	.word	.L399-.L401
	.word	.L405-.L401
	.word	.L399-.L401
	.word	.L399-.L401
	.word	.L399-.L401
	.word	.L399-.L401
	.word	.L404-.L401
	.word	.L399-.L401
	.word	.L399-.L401
	.word	.L399-.L401
	.word	.L399-.L401
	.word	.L399-.L401
	.word	.L399-.L401
	.word	.L399-.L401
	.word	.L399-.L401
	.word	.L403-.L401
	.word	.L402-.L401
	.word	.L399-.L401
	.word	.L400-.L401
	.section	.text.subexpr
.L414:
	li	a3,124
	li	a4,4
	li	s1,8
	bne	a5,a3,.L451
.L437:
	lw	a5,8(sp)
	ble	a4,a5,.L416
.L438:
	lw	a4,4(s0)
	mv	a0,s0
	sw	a4,4(sp)
	call	luaX_next
	lw	a2,0(sp)
	lw	a0,28(s0)
	mv	a1,s1
	call	luaK_infix
	lla	a4,.LANCHOR0
	slli	a5,s1,1
	add	a5,a4,a5
	lbu	a2,1(a5)
	addi	a1,sp,12
	mv	a0,s0
	call	subexpr
	mv	a5,a0
	lw	a4,4(sp)
	lw	a0,28(s0)
	lw	a2,0(sp)
	mv	a1,s1
	addi	a3,sp,12
	mv	s1,a5
	call	luaK_posfix
	li	a4,21
	beq	s1,a4,.L451
	lla	a5,.LANCHOR0
	slli	a4,s1,1
	add	a4,a5,a4
	lbu	a4,0(a4)
	lw	a5,8(sp)
	bgt	a4,a5,.L438
	j	.L416
.L441:
	li	s1,3
	j	.L396
.L440:
	li	s1,1
	j	.L396
.L399:
	lw	a1,0(sp)
	mv	a0,s0
	call	suffixedexp
	j	.L409
.L446:
	li	a4,2
	li	s1,19
	j	.L437
.L424:
	li	a4,9
	li	s1,12
	j	.L437
.L419:
	li	a4,7
	li	s1,10
	j	.L437
.L425:
	li	a4,11
	li	s1,6
	j	.L437
.L421:
	li	a4,3
	li	s1,15
	j	.L437
.L422:
	li	a4,3
	li	s1,18
	j	.L437
.L423:
	li	a4,3
	li	s1,13
	j	.L437
.L417:
	li	a4,7
	li	s1,11
	j	.L437
.L420:
	li	a4,3
	li	s1,16
	j	.L437
.L426:
	li	a4,1
	li	s1,20
	j	.L437
.L427:
	li	a4,14
	li	s1,4
	j	.L437
.L434:
	li	a4,6
	li	s1,7
	j	.L437
.L430:
	li	a4,11
	li	s1,5
	j	.L437
.L431:
	li	a4,10
	li	s1,1
	j	.L437
.L432:
	li	a4,10
	li	s1,0
	j	.L437
.L435:
	li	a4,11
	li	s1,3
	j	.L437
.L429:
	li	a4,3
	li	s1,14
	j	.L437
.L400:
	lw	a1,16(a0)
	mv	a0,t1
	call	luaK_stringK
	lw	a4,0(sp)
	li	a5,-1
	sw	a5,8(a4)
	sw	a5,12(a4)
	li	a5,4
	sw	a5,0(a4)
	sw	a0,4(a4)
.L410:
	mv	a0,s0
	call	luaX_next
	j	.L409
.L408:
	lw	a4,0(sp)
	li	a5,-1
	sw	a5,8(a4)
	sw	a5,12(a4)
	li	a5,3
	sw	a5,0(a4)
	sw	zero,4(a4)
	j	.L410
.L403:
	lw	a3,0(sp)
	lw	a4,16(a0)
	li	a5,-1
	sw	a5,8(a3)
	sw	a5,12(a3)
	li	a5,5
	sw	a5,0(a3)
	sw	a4,4(a3)
	j	.L410
.L402:
	lw	a3,0(sp)
	lw	a4,16(a0)
	li	a5,-1
	sw	a5,8(a3)
	sw	a5,12(a3)
	li	a5,6
	sw	a5,0(a3)
	sw	a4,4(a3)
	j	.L410
.L407:
	call	luaX_next
	lw	a3,4(s0)
	lw	a1,0(sp)
	li	a2,0
	mv	a0,s0
	call	body
	j	.L409
.L406:
	lw	a4,0(sp)
	li	a5,-1
	sw	a5,8(a4)
	sw	a5,12(a4)
	li	a5,1
	sw	a5,0(a4)
	sw	zero,4(a4)
	j	.L410
.L405:
	lw	a4,0(sp)
	li	a5,-1
	sw	a5,8(a4)
	sw	a5,12(a4)
	li	a5,2
	sw	a5,0(a4)
	sw	zero,4(a4)
	j	.L410
.L404:
	lw	a5,0(t1)
	lbu	a5,7(a5)
	beq	a5,zero,.L458
	li	a4,0
	li	a3,1
	li	a2,0
	li	a1,45
	mv	a0,t1
	call	luaK_codeABC
	lw	a4,0(sp)
	li	a5,-1
	sw	a5,8(a4)
	sw	a5,12(a4)
	li	a5,14
	sw	a5,0(a4)
	sw	a0,4(a4)
	j	.L410
.L448:
	li	a4,3
	li	s1,17
	j	.L437
.L433:
	li	a4,11
	li	s1,2
	j	.L437
.L444:
	li	a4,5
	li	s1,9
	j	.L437
.L456:
	lla	a2,.LC12
	li	a1,200
	mv	a0,t1
	call	errorlimit
.L458:
	lla	a1,.LC25
	call	luaX_syntaxerror
.L457:
	li	a4,123
	bne	a5,a4,.L399
	call	constructor
	j	.L409
	.size	subexpr, .-subexpr
	.section	.text.recfield,"ax",@progbits
	.align	2
	.type	recfield, @function
recfield:
	addi	sp,sp,-56
	sw	s1,44(sp)
	lw	s1,28(a0)
	sw	s0,48(sp)
	sw	ra,52(sp)
	lbu	a5,44(s1)
	lw	a3,12(a0)
	li	a4,292
	sw	a5,4(sp)
	sw	a1,0(sp)
	mv	s0,a0
	beq	a3,a4,.L465
	call	luaX_next
	li	a2,0
	addi	a1,sp,12
	mv	a0,s0
	call	subexpr
	lw	a0,28(s0)
	addi	a1,sp,12
	call	luaK_exp2val
	lw	a3,12(s0)
	li	a4,93
	bne	a3,a4,.L466
	mv	a0,s0
	call	luaX_next
.L461:
	lw	a5,0(sp)
	lw	a2,12(s0)
	li	a3,61
	lw	a4,20(a5)
	addi	a4,a4,1
	sw	a4,20(a5)
	bne	a2,a3,.L467
	mv	a0,s0
	call	luaX_next
	addi	a1,sp,12
	mv	a0,s1
	call	luaK_exp2RK
	mv	a3,a0
	li	a2,0
	addi	a1,sp,28
	mv	a0,s0
	sw	a3,8(sp)
	call	subexpr
	lw	a5,0(sp)
	addi	a1,sp,28
	mv	a0,s1
	lw	a5,16(a5)
	lw	s0,4(a5)
	call	luaK_exp2RK
	lw	a3,8(sp)
	mv	a4,a0
	mv	a2,s0
	mv	a0,s1
	li	a1,10
	call	luaK_codeABC
	lw	a5,4(sp)
	sb	a5,44(s1)
	lw	ra,52(sp)
	lw	s0,48(sp)
	lw	s1,44(sp)
	addi	sp,sp,56
	jr	ra
.L465:
	lw	a1,16(a0)
	sw	a1,8(sp)
	call	luaX_next
	lw	a1,8(sp)
	lw	a0,28(s0)
	call	luaK_stringK
	li	a4,-1
	sw	a4,20(sp)
	sw	a4,24(sp)
	li	a4,4
	sw	a4,12(sp)
	sw	a0,16(sp)
	j	.L461
.L467:
	li	a1,61
	mv	a0,s0
	call	error_expected
.L466:
	li	a1,93
	mv	a0,s0
	call	error_expected
	.size	recfield, .-recfield
	.section	.text.constructor,"ax",@progbits
	.align	2
	.type	constructor, @function
constructor:
	addi	sp,sp,-56
	sw	s0,48(sp)
	sw	s1,44(sp)
	lw	s0,28(a0)
	mv	s1,a0
	lw	a5,4(s1)
	mv	t1,a1
	li	a4,0
	li	a3,0
	li	a2,0
	li	a1,11
	mv	a0,s0
	sw	ra,52(sp)
	sw	t1,8(sp)
	sw	a5,0(sp)
	call	luaK_codeABC
	lw	t1,8(sp)
	mv	a3,a0
	lw	a0,28(s1)
	li	a4,-1
	mv	a5,a3
	sw	a3,4(sp)
	li	a3,12
	sw	a4,8(t1)
	sw	a4,12(t1)
	sw	a3,0(t1)
	sw	a5,4(t1)
	mv	a1,t1
	sw	a4,20(sp)
	sw	a4,24(sp)
	sw	zero,40(sp)
	sw	zero,32(sp)
	sw	zero,36(sp)
	sw	t1,28(sp)
	sw	zero,12(sp)
	sw	zero,16(sp)
	call	luaK_exp2nextreg
	lw	a3,12(s1)
	li	a4,123
	bne	a3,a4,.L492
.L469:
	mv	a0,s1
	call	luaX_next
	lw	a4,12(s1)
	li	a3,125
	beq	a4,a3,.L470
	lw	a3,12(sp)
	beq	a3,zero,.L472
	addi	a1,sp,12
	mv	a0,s0
	call	luaK_exp2nextreg
	lw	a4,40(sp)
	sw	zero,12(sp)
	li	a5,50
	beq	a4,a5,.L489
	lw	a4,12(s1)
.L472:
	li	a3,91
	beq	a4,a3,.L474
	li	a3,292
	bne	a4,a3,.L475
	mv	a0,s1
	call	luaX_lookahead
	li	a4,61
	beq	a0,a4,.L474
.L475:
	li	a2,0
	addi	a1,sp,12
	mv	a0,s1
	call	subexpr
	lw	a3,36(sp)
	lw	a4,40(sp)
	addi	a3,a3,1
	addi	a4,a4,1
	sw	a3,36(sp)
	sw	a4,40(sp)
.L477:
	lw	a4,12(s1)
	li	a3,44
	beq	a4,a3,.L469
	li	a3,59
	beq	a4,a3,.L469
.L470:
	lw	a3,0(sp)
	li	a2,123
	li	a1,125
	mv	a0,s1
	call	check_match
	lw	a3,40(sp)
	beq	a3,zero,.L491
	lw	a5,12(sp)
	li	a4,1
	addi	a2,a5,-13
	bleu	a2,a4,.L493
	bne	a5,zero,.L494
.L483:
	lw	a5,28(sp)
	lw	a2,36(sp)
	mv	a0,s0
	lw	a1,4(a5)
	call	luaK_setlist
.L491:
	lw	a0,36(sp)
.L481:
	lw	a5,0(s0)
	lw	a4,4(sp)
	lw	a5,48(a5)
	slli	a4,a4,2
	sw	a4,0(sp)
	add	a5,a5,a4
	lw	s1,0(a5)
	call	luaO_int2fb
	lw	a5,0(s0)
	lw	a4,0(sp)
	slli	s1,s1,9
	lw	a5,48(a5)
	slli	a0,a0,23
	srli	s1,s1,9
	add	a5,a5,a4
	or	s1,a0,s1
	sw	s1,0(a5)
	lw	a0,32(sp)
	call	luaO_int2fb
	lw	a5,0(s0)
	li	a3,8372224
	slli	a0,a0,14
	lw	a4,0(sp)
	lw	a5,48(a5)
	and	a0,a0,a3
	li	a3,-8372224
	addi	a3,a3,-1
	lw	ra,52(sp)
	lw	s0,48(sp)
	and	s1,s1,a3
	or	a0,a0,s1
	add	a5,a5,a4
	sw	a0,0(a5)
	lw	s1,44(sp)
	addi	sp,sp,56
	jr	ra
.L474:
	addi	a1,sp,12
	mv	a0,s1
	call	recfield
	j	.L477
.L493:
	li	a2,-1
	addi	a1,sp,12
	mv	a0,s0
	call	luaK_setreturns
	lw	a5,28(sp)
	lw	a2,36(sp)
	mv	a0,s0
	lw	a1,4(a5)
	li	a3,-1
	call	luaK_setlist
	lw	a0,36(sp)
	addi	a0,a0,-1
	sw	a0,36(sp)
	j	.L481
.L494:
	addi	a1,sp,12
	mv	a0,s0
	call	luaK_exp2nextreg
	lw	a3,40(sp)
	j	.L483
.L489:
	lw	a4,28(sp)
	lw	a2,36(sp)
	li	a3,50
	lw	a1,4(a4)
	mv	a0,s0
	call	luaK_setlist
	lw	a4,12(s1)
	sw	zero,40(sp)
	j	.L472
.L492:
	li	a1,123
	mv	a0,s1
	call	error_expected
	.size	constructor, .-constructor
	.section	.rodata.funcargs.str1.4,"aMS",@progbits,1
	.align	2
.LC26:
	.string	"function arguments expected"
	.section	.text.funcargs,"ax",@progbits
	.align	2
	.type	funcargs, @function
funcargs:
	lw	a3,12(a0)
	addi	sp,sp,-36
	sw	s0,28(sp)
	sw	s1,24(sp)
	sw	ra,32(sp)
	li	t1,123
	sw	a2,0(sp)
	lw	s0,28(a0)
	mv	s1,a1
	beq	a3,t1,.L496
	li	a2,293
	beq	a3,a2,.L497
	sw	a0,4(sp)
	li	a2,40
	beq	a3,a2,.L513
	lla	a1,.LC26
	call	luaX_syntaxerror
.L496:
	addi	a1,sp,8
	call	constructor
.L503:
	lw	a4,8(sp)
	li	a3,1
	lw	a2,4(s1)
	addi	a1,a4,-13
	bleu	a1,a3,.L506
	bne	a4,zero,.L514
.L505:
	lbu	a3,44(s0)
	addi	a5,a2,1
	sw	a5,4(sp)
	sub	a3,a3,a2
.L504:
	li	a4,2
	li	a1,36
	mv	a0,s0
	call	luaK_codeABC
	li	a4,-1
	lw	a1,0(sp)
	sw	a4,8(s1)
	sw	a4,12(s1)
	li	a4,13
	sw	a0,4(s1)
	sw	a4,0(s1)
	mv	a0,s0
	call	luaK_fixline
	lw	a5,4(sp)
	sb	a5,44(s0)
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
.L506:
	addi	a5,a2,1
	li	a3,0
	sw	a5,4(sp)
	j	.L504
.L513:
	call	luaX_next
	lw	a4,4(sp)
	li	a3,41
	lw	a2,12(a4)
	bne	a2,a3,.L499
	sw	zero,8(sp)
.L500:
	lw	a3,0(sp)
	li	a2,40
	li	a1,41
	mv	a0,a4
	call	check_match
	j	.L503
.L497:
	lw	a1,16(a0)
	sw	a0,4(sp)
	mv	a0,s0
	call	luaK_stringK
	lw	a4,4(sp)
	mv	a2,a0
	li	a3,-1
	mv	a0,a4
	li	a4,4
	sw	a3,16(sp)
	sw	a3,20(sp)
	sw	a4,8(sp)
	sw	a2,12(sp)
	call	luaX_next
	j	.L503
.L499:
	li	a2,0
	mv	a0,a4
	addi	a1,sp,8
	sw	a4,4(sp)
	call	subexpr
	lw	a4,4(sp)
	li	a3,44
	lw	a2,12(a4)
	beq	a2,a3,.L501
.L502:
	li	a2,-1
	addi	a1,sp,8
	mv	a0,s0
	sw	a4,4(sp)
	call	luaK_setreturns
	lw	a4,4(sp)
	j	.L500
.L514:
	addi	a1,sp,8
	mv	a0,s0
	sw	a2,4(sp)
	call	luaK_exp2nextreg
	lw	a2,4(sp)
	j	.L505
.L501:
	mv	a0,a4
	sw	a4,4(sp)
	call	luaX_next
	lw	a4,4(sp)
	addi	a1,sp,8
	lw	a0,28(a4)
	call	luaK_exp2nextreg
	lw	a4,4(sp)
	li	a2,0
	addi	a1,sp,8
	mv	a0,a4
	call	subexpr
	lw	a4,4(sp)
	li	a5,44
	lw	a3,12(a4)
	bne	a3,a5,.L502
	j	.L501
	.size	funcargs, .-funcargs
	.section	.rodata.suffixedexp.str1.4,"aMS",@progbits,1
	.align	2
.LC27:
	.string	"unexpected symbol"
	.section	.text.suffixedexp,"ax",@progbits
	.align	2
	.type	suffixedexp, @function
suffixedexp:
	lw	a4,28(a0)
	addi	sp,sp,-40
	lw	a5,12(a0)
	sw	a4,0(sp)
	lw	a4,4(a0)
	sw	s0,32(sp)
	sw	s1,28(sp)
	sw	ra,36(sp)
	li	a3,40
	sw	a4,4(sp)
	mv	s1,a0
	mv	s0,a1
	beq	a5,a3,.L516
	li	a3,292
	bne	a5,a3,.L532
	call	singlevar
.L519:
	lw	a5,12(s1)
	li	a3,58
	beq	a5,a3,.L521
.L535:
	ble	a5,a3,.L533
	li	a3,91
	beq	a5,a3,.L526
	li	a3,90
	bgt	a5,a3,.L534
.L515:
	lw	ra,36(sp)
	lw	s0,32(sp)
	lw	s1,28(sp)
	addi	sp,sp,40
	jr	ra
.L533:
	li	a3,40
	beq	a5,a3,.L523
	li	a3,46
	bne	a5,a3,.L515
	mv	a1,s0
	mv	a0,s1
	call	fieldsel
	lw	a5,12(s1)
	li	a3,58
	bne	a5,a3,.L535
.L521:
	mv	a0,s1
	call	luaX_next
	lw	a3,12(s1)
	li	a5,292
	bne	a3,a5,.L536
	lw	a1,16(s1)
	mv	a0,s1
	sw	a1,8(sp)
	call	luaX_next
	lw	a1,8(sp)
	lw	a0,28(s1)
	call	luaK_stringK
	mv	a3,a0
	lw	a0,0(sp)
	li	a5,-1
	addi	a2,sp,12
	mv	a1,s0
	sw	a5,20(sp)
	sw	a5,24(sp)
	li	a5,4
	sw	a5,12(sp)
	sw	a3,16(sp)
	call	luaK_self
	lw	a2,4(sp)
	mv	a1,s0
	mv	a0,s1
	call	funcargs
	j	.L519
.L534:
	li	a3,123
	beq	a5,a3,.L523
	li	a3,293
	bne	a5,a3,.L515
.L523:
	lw	a0,0(sp)
	mv	a1,s0
	call	luaK_exp2nextreg
	lw	a2,4(sp)
	mv	a1,s0
	mv	a0,s1
	call	funcargs
	j	.L519
.L526:
	lw	a0,0(sp)
	mv	a1,s0
	call	luaK_exp2anyregup
	mv	a0,s1
	call	luaX_next
	li	a2,0
	addi	a1,sp,12
	mv	a0,s1
	call	subexpr
	lw	a0,28(s1)
	addi	a1,sp,12
	call	luaK_exp2val
	lw	a3,12(s1)
	li	a5,93
	bne	a3,a5,.L537
	mv	a0,s1
	call	luaX_next
	lw	a0,0(sp)
	addi	a2,sp,12
	mv	a1,s0
	call	luaK_indexed
	j	.L519
.L516:
	call	luaX_next
	mv	a1,s0
	li	a2,0
	mv	a0,s1
	call	subexpr
	lw	a3,4(sp)
	mv	a0,s1
	li	a2,40
	li	a1,41
	call	check_match
	lw	a0,28(s1)
	mv	a1,s0
	call	luaK_dischargevars
	j	.L519
.L536:
	li	a1,292
	mv	a0,s1
	call	error_expected
.L537:
	li	a1,93
	mv	a0,s1
	call	error_expected
.L532:
	lla	a1,.LC27
	call	luaX_syntaxerror
	.size	suffixedexp, .-suffixedexp
	.section	.text.assignment,"ax",@progbits
	.align	2
	.type	assignment, @function
assignment:
	lw	a4,4(a1)
	addi	sp,sp,-44
	sw	ra,40(sp)
	sw	s0,36(sp)
	sw	s1,32(sp)
	sw	a1,0(sp)
	addi	a4,a4,-8
	li	a3,2
	bgtu	a4,a3,.L564
	lw	a4,12(a0)
	li	a5,44
	mv	s0,a0
	beq	a4,a5,.L540
	li	a3,61
	bne	a4,a3,.L565
	sw	a2,4(sp)
	addi	s1,sp,12
	call	luaX_next
	li	a2,0
	mv	a1,s1
	mv	a0,s0
	call	subexpr
	lw	a4,12(s0)
	li	a5,44
	lw	t1,4(sp)
	beq	a4,a5,.L555
	li	a4,1
.L545:
	beq	t1,a4,.L566
	mv	a3,s1
	mv	a2,a4
	mv	a1,t1
	mv	a0,s0
	call	adjust_assign
.L553:
	lw	a0,28(s0)
	lw	a3,0(sp)
	li	a4,-1
	lbu	a5,44(a0)
	mv	a2,s1
	sw	a4,20(sp)
	sw	a4,24(sp)
	addi	a5,a5,-1
	li	a4,7
	addi	a1,a3,4
	sw	a4,12(sp)
	sw	a5,16(sp)
	call	luaK_storevar
	lw	ra,40(sp)
	lw	s0,36(sp)
	lw	s1,32(sp)
	addi	sp,sp,44
	jr	ra
.L540:
	sw	a2,4(sp)
	call	luaX_next
	lw	a5,0(sp)
	mv	a0,s0
	addi	a1,sp,16
	sw	a5,12(sp)
	call	suffixedexp
	lw	a0,16(sp)
	li	a4,10
	lw	t1,4(sp)
	lw	s1,28(s0)
	bne	a0,a4,.L546
.L547:
	lw	a4,32(s0)
	li	a3,200
	lhu	a4,110(a4)
	add	a4,a4,t1
	bgt	a4,a3,.L567
	addi	s1,sp,12
	addi	a2,t1,1
	mv	a1,s1
	mv	a0,s0
	call	assignment
	j	.L553
.L546:
	lw	a4,0(sp)
	lbu	a2,44(s1)
	li	t2,0
	li	a1,10
	li	t0,8
	j	.L550
.L548:
	lw	a4,0(a4)
	beq	a4,zero,.L568
.L550:
	lw	a3,4(a4)
	bne	a3,a1,.L548
	lbu	a3,11(a4)
	beq	a0,a3,.L569
.L549:
	bne	a0,t0,.L548
	lh	ra,8(a4)
	lw	a3,20(sp)
	bne	ra,a3,.L548
	sh	a2,8(a4)
	li	t2,1
	j	.L548
.L569:
	lbu	ra,10(a4)
	lw	a3,20(sp)
	bne	ra,a3,.L549
	sb	t0,11(a4)
	sb	a2,10(a4)
	li	t2,1
	j	.L549
.L566:
	lw	a0,28(s0)
	mv	a1,s1
	call	luaK_setoneret
	lw	a5,0(sp)
	lw	a0,28(s0)
	mv	a2,s1
	addi	a1,a5,4
	call	luaK_storevar
	lw	ra,40(sp)
	lw	s0,36(sp)
	lw	s1,32(sp)
	addi	sp,sp,44
	jr	ra
.L555:
	li	a4,1
.L542:
	mv	a0,s0
	sw	t1,8(sp)
	sw	a4,4(sp)
	call	luaX_next
	lw	a4,4(sp)
	lw	a0,28(s0)
	mv	a1,s1
	addi	a4,a4,1
	sw	a4,4(sp)
	call	luaK_exp2nextreg
	li	a2,0
	mv	a1,s1
	mv	a0,s0
	call	subexpr
	lw	a2,12(s0)
	li	a5,44
	lw	a4,4(sp)
	lw	t1,8(sp)
	bne	a2,a5,.L545
	j	.L542
.L568:
	beq	t2,zero,.L547
	li	a4,8
	li	a1,0
	beq	a0,a4,.L551
	li	a1,5
.L551:
	lw	a3,20(sp)
	li	a4,0
	mv	a0,s1
	sw	t1,4(sp)
	call	luaK_codeABC
	mv	a0,s1
	li	a1,1
	call	luaK_reserveregs
	lw	t1,4(sp)
	lw	s1,28(s0)
	j	.L547
.L564:
	lla	a1,.LC21
	call	luaX_syntaxerror
.L565:
	li	a1,61
	call	error_expected
.L567:
	lla	a2,.LC12
	li	a1,200
	mv	a0,s1
	call	errorlimit
	.size	assignment, .-assignment
	.section	.text.luaY_parser,"ax",@progbits
	.align	2
	.globl	luaY_parser
	.hidden	luaY_parser
	.type	luaY_parser, @function
luaY_parser:
	addi	sp,sp,-176
	mv	t2,a2
	mv	a2,a1
	li	a1,1
	sw	ra,172(sp)
	sw	a2,16(sp)
	sw	t2,12(sp)
	sw	a4,8(sp)
	sw	s0,168(sp)
	sw	s1,164(sp)
	mv	s0,a0
	sw	a3,20(sp)
	sw	a5,4(sp)
	call	luaF_newLclosure
	lw	a5,12(s0)
	li	a3,70
	sw	a0,0(sp)
	sw	a0,0(a5)
	sw	a3,4(a5)
	mv	a0,s0
	call	luaD_inctop
	mv	a0,s0
	call	luaH_new
	lw	a5,12(s0)
	li	a3,69
	sw	a0,148(sp)
	sw	a0,0(a5)
	sw	a3,4(a5)
	mv	a0,s0
	call	luaD_inctop
	mv	a0,s0
	call	luaF_newproto
	lw	t1,8(sp)
	lw	a4,0(sp)
	mv	s1,a0
	mv	a1,t1
	sw	a0,12(a4)
	mv	a0,s0
	sw	s1,56(sp)
	call	luaS_new
	lw	a5,56(sp)
	sw	a0,72(s1)
	lw	t0,20(sp)
	lw	a3,72(a5)
	lw	t2,12(sp)
	lw	a4,4(sp)
	lw	a2,16(sp)
	addi	s1,sp,104
	mv	a1,s1
	mv	a0,s0
	sw	zero,28(t0)
	sw	zero,16(t0)
	sw	zero,4(t0)
	sw	t2,144(sp)
	sw	t0,152(sp)
	call	luaX_setinput
	lw	a3,152(sp)
	sw	zero,96(sp)
	sb	zero,100(sp)
	lw	a2,4(a3)
	lw	a4,56(sp)
	li	a5,-1
	addi	a0,sp,56
	lw	a1,132(sp)
	sw	a5,80(sp)
	sw	a2,92(sp)
	sw	s1,64(sp)
	sw	a0,132(sp)
	sw	zero,72(sp)
	sw	zero,76(sp)
	sw	zero,84(sp)
	sw	zero,88(sp)
	li	a2,2
	lw	t0,156(sp)
	sb	a2,8(a4)
	lw	a2,28(a3)
	lw	a3,16(a3)
	sw	a1,60(sp)
	sw	a2,28(sp)
	sw	a3,32(sp)
	addi	a3,sp,24
	sw	a3,68(sp)
	sh	zero,36(sp)
	li	a3,1
	sb	zero,38(sp)
	sb	a3,7(a4)
	lw	a1,160(sp)
	addi	a2,sp,40
	sw	t0,72(a4)
	sw	a5,48(sp)
	sw	a5,52(sp)
	li	a5,8
	sw	a5,40(sp)
	sw	zero,24(sp)
	sw	zero,44(sp)
	call	newupvalue
	mv	a0,s1
	call	luaX_next
	li	a2,29
.L571:
	lw	a4,116(sp)
	addi	a3,a4,-260
	bgtu	a3,a2,.L573
	li	a5,537001984
	addi	a5,a5,7
	srl	a5,a5,a3
	andi	a5,a5,1
	bne	a5,zero,.L572
	li	a5,274
	beq	a4,a5,.L577
.L573:
	mv	a0,s1
	call	statement
	li	a2,29
	j	.L571
.L577:
	mv	a0,s1
	call	statement
	lw	a4,116(sp)
.L572:
	li	a5,289
	bne	a4,a5,.L578
	mv	a0,s1
	call	close_func
	lw	a5,12(s0)
	lw	ra,172(sp)
	lw	a0,0(sp)
	addi	a5,a5,-8
	sw	a5,12(s0)
	lw	s0,168(sp)
	lw	s1,164(sp)
	addi	sp,sp,176
	jr	ra
.L578:
	li	a1,289
	mv	a0,s1
	call	error_expected
	.size	luaY_parser, .-luaY_parser
	.section	.rodata.priority,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	priority, @object
	.size	priority, 42
priority:
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	14
	.byte	13
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	6
	.byte	6
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	9
	.byte	8
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	1
	.hidden	luaX_setinput
	.hidden	luaH_new
	.hidden	luaD_inctop
	.hidden	luaF_newLclosure
	.hidden	luaK_setoneret
	.hidden	luaK_dischargevars
	.hidden	luaK_self
	.hidden	luaO_int2fb
	.hidden	luaK_setlist
	.hidden	luaX_lookahead
	.hidden	luaK_exp2RK
	.hidden	luaK_exp2val
	.hidden	luaK_posfix
	.hidden	luaK_infix
	.hidden	luaK_prefix
	.hidden	luaF_newproto
	.hidden	luaK_codeABC
	.hidden	luaK_codeABx
	.hidden	luaK_codek
	.hidden	luaK_intK
	.hidden	luaK_checkstack
	.hidden	luaX_newstring
	.hidden	luaK_exp2anyreg
	.hidden	luaK_getlabel
	.hidden	luaK_fixline
	.hidden	luaK_storevar
	.hidden	luaK_concat
	.hidden	luaK_goiftrue
	.hidden	luaK_goiffalse
	.hidden	luaM_toobig
	.hidden	luaC_step
	.hidden	luaM_realloc_
	.hidden	luaK_ret
	.hidden	luaK_patchtohere
	.hidden	luaK_jump
	.hidden	luaS_new
	.hidden	luaK_patchclose
	.hidden	luaK_patchlist
	.hidden	luaK_indexed
	.hidden	luaK_stringK
	.hidden	luaK_exp2anyregup
	.hidden	luaX_next
	.hidden	luaK_setreturns
	.hidden	luaK_exp2nextreg
	.hidden	luaK_nil
	.hidden	luaK_reserveregs
	.hidden	luaX_token2str
	.hidden	luaC_barrier_
	.hidden	luaX_syntaxerror
	.hidden	luaO_pushfstring
	.hidden	luaM_growaux_
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
