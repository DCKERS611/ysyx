#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"llex.c"
	.option nopic
	.text
	.section	.rodata.luaX_init.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"and"
	.align	2
.LC1:
	.string	"_ENV"
	.section	.text.luaX_init,"ax",@progbits
	.align	2
	.globl	luaX_init
	.hidden	luaX_init
	.type	luaX_init, @function
luaX_init:
	addi	sp,sp,-16
	li	a2,4
	lla	a1,.LC1
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a0
	call	luaS_newlstr
	mv	a1,a0
	mv	a0,s0
	call	luaC_fix
	li	s1,1
	lla	a1,.LC0
	j	.L3
.L6:
	lw	a1,0(a4)
	addi	s1,s1,1
.L3:
	mv	a0,s0
	call	luaS_new
	mv	a1,a0
	sw	a0,0(sp)
	mv	a0,s0
	call	luaC_fix
	lw	a1,0(sp)
	slli	a4,s1,2
	lla	a5,.LANCHOR0
	sb	s1,6(a1)
	li	a3,22
	add	a4,a5,a4
	bne	s1,a3,.L6
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	luaX_init, .-luaX_init
	.section	.rodata.luaX_token2str.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"'%c'"
	.align	2
.LC3:
	.string	"'%s'"
	.section	.text.luaX_token2str,"ax",@progbits
	.align	2
	.globl	luaX_token2str
	.hidden	luaX_token2str
	.type	luaX_token2str, @function
luaX_token2str:
	li	a5,256
	ble	a1,a5,.L10
	addi	a4,a1,-257
	slli	a4,a4,2
	lla	a5,.LANCHOR0
	add	a5,a5,a4
	li	a4,288
	lw	a2,0(a5)
	ble	a1,a4,.L11
	mv	a0,a2
	ret
.L11:
	lw	a0,32(a0)
	lla	a1,.LC3
	tail	luaO_pushfstring
.L10:
	lw	a0,32(a0)
	mv	a2,a1
	lla	a1,.LC2
	tail	luaO_pushfstring
	.size	luaX_token2str, .-luaX_token2str
	.section	.rodata.lexerror.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"%s near %s"
	.section	.text.lexerror,"ax",@progbits
	.align	2
	.type	lexerror, @function
lexerror:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	lw	a3,4(a0)
	mv	s1,a2
	mv	s0,a0
	lw	a2,52(a0)
	lw	a0,32(a0)
	sw	ra,16(sp)
	call	luaG_addinfo
	bne	s1,zero,.L20
.L13:
	lw	a0,32(s0)
	li	a1,3
	call	luaD_throw
.L20:
	lw	a4,32(s0)
	addi	a3,s1,-290
	li	a2,3
	sw	a0,4(sp)
	sw	a4,0(sp)
	bgtu	a3,a2,.L14
	li	a1,0
	mv	a0,s0
	call	save
	lw	a3,40(s0)
	lw	a0,32(s0)
	lla	a1,.LC3
	lw	a2,0(a3)
	call	luaO_pushfstring
	lw	a4,0(sp)
	lw	a5,4(sp)
	mv	a3,a0
.L15:
	mv	a2,a5
	lla	a1,.LC4
	mv	a0,a4
	call	luaO_pushfstring
	j	.L13
.L14:
	mv	a1,s1
	mv	a0,s0
	call	luaX_token2str
	lw	a5,4(sp)
	lw	a4,0(sp)
	mv	a3,a0
	j	.L15
	.size	lexerror, .-lexerror
	.section	.rodata.save.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"lexical element too long"
	.section	.text.save,"ax",@progbits
	.align	2
	.type	save, @function
save:
	addi	sp,sp,-16
	sw	s0,8(sp)
	lw	s0,40(a0)
	sw	s1,4(sp)
	sw	ra,12(sp)
	lw	a4,4(s0)
	lw	a2,8(s0)
	mv	s1,a1
	addi	a3,a4,1
	bgtu	a3,a2,.L22
	lw	a0,0(s0)
	sw	a3,4(s0)
	add	a0,a0,a4
	sb	s1,0(a0)
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L22:
	li	a4,1073741824
	addi	a4,a4,-2
	bgtu	a2,a4,.L26
	lw	a1,0(s0)
	lw	a0,32(a0)
	slli	a3,a2,1
	sw	a3,0(sp)
	call	luaM_realloc_
	lw	a4,4(s0)
	lw	a3,0(sp)
	sw	a0,0(s0)
	add	a0,a0,a4
	sw	a3,8(s0)
	addi	a3,a4,1
	sw	a3,4(s0)
	sb	s1,0(a0)
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L26:
	li	a2,0
	lla	a1,.LC5
	call	lexerror
	.size	save, .-save
	.section	.text.skip_sep,"ax",@progbits
	.align	2
	.type	skip_sep, @function
skip_sep:
	lw	a5,0(a0)
	addi	sp,sp,-16
	sw	s1,4(sp)
	mv	a1,a5
	mv	s1,a0
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	a5,0(sp)
	call	save
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L28
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L29:
	sw	a0,0(s1)
	li	a4,61
	li	s0,0
	beq	a0,a4,.L33
	j	.L30
.L38:
	lw	a4,4(a0)
	addi	s0,s0,1
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
	li	a4,61
	sw	a0,0(s1)
	bne	a0,a4,.L30
.L33:
	mv	a0,s1
	li	a1,61
	call	save
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	bne	a4,zero,.L38
	call	luaZ_fill
	sw	a0,0(s1)
	li	a4,61
	addi	s0,s0,1
	beq	a0,a4,.L33
.L30:
	lw	a5,0(sp)
	beq	a5,a0,.L27
	not	s0,s0
.L27:
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L28:
	call	luaZ_fill
	j	.L29
	.size	skip_sep, .-skip_sep
	.section	.text.check_next2,"ax",@progbits
	.align	2
	.type	check_next2, @function
check_next2:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	a5,a1
	sw	ra,8(sp)
	lw	a1,0(a0)
	lbu	a4,0(a5)
	mv	s0,a0
	beq	a1,a4,.L40
	lbu	a5,1(a5)
	li	a0,0
	beq	a1,a5,.L40
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L40:
	mv	a0,s0
	call	save
	lw	a0,36(s0)
	lw	a5,0(a0)
	addi	a4,a5,-1
	sw	a4,0(a0)
	beq	a5,zero,.L42
	lw	a5,4(a0)
	addi	a4,a5,1
	sw	a4,4(a0)
	lbu	a0,0(a5)
.L43:
	sw	a0,0(s0)
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L42:
	call	luaZ_fill
	j	.L43
	.size	check_next2, .-check_next2
	.section	.rodata.inclinenumber.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	"chunk has too many lines"
	.section	.text.inclinenumber,"ax",@progbits
	.align	2
	.type	inclinenumber, @function
inclinenumber:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a0
	lw	a0,36(a0)
	sw	s1,0(sp)
	sw	ra,8(sp)
	lw	a5,0(a0)
	lw	s1,0(s0)
	addi	a4,a5,-1
	sw	a4,0(a0)
	beq	a5,zero,.L47
	lw	a5,4(a0)
	addi	a4,a5,1
	sw	a4,4(a0)
	lbu	a0,0(a5)
.L48:
	sw	a0,0(s0)
	li	a5,10
	beq	a0,a5,.L49
	li	a5,13
	beq	a0,a5,.L49
.L50:
	lw	a5,4(s0)
	li	a4,-2147483648
	xori	a4,a4,-1
	addi	a5,a5,1
	sw	a5,4(s0)
	beq	a5,a4,.L55
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L49:
	beq	a0,s1,.L50
	lw	a0,36(s0)
	lw	a5,0(a0)
	addi	a4,a5,-1
	sw	a4,0(a0)
	beq	a5,zero,.L51
	lw	a5,4(a0)
	addi	a4,a5,1
	sw	a4,4(a0)
	lbu	a0,0(a5)
	sw	a0,0(s0)
	j	.L50
.L47:
	call	luaZ_fill
	j	.L48
.L51:
	call	luaZ_fill
	sw	a0,0(s0)
	j	.L50
.L55:
	li	a2,0
	lla	a1,.LC6
	mv	a0,s0
	call	lexerror
	.size	inclinenumber, .-inclinenumber
	.section	.text.esccheck.part.0,"ax",@progbits
	.align	2
	.type	esccheck.part.0, @function
esccheck.part.0:
	lw	a5,0(a0)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	li	a4,-1
	mv	s0,a0
	mv	s1,a1
	bne	a5,a4,.L61
.L57:
	li	a2,293
	mv	a1,s1
	mv	a0,s0
	call	lexerror
.L61:
	mv	a1,a5
	call	save
	lw	a0,36(s0)
	lw	a5,0(a0)
	addi	a4,a5,-1
	sw	a4,0(a0)
	beq	a5,zero,.L58
	lw	a5,4(a0)
	addi	a4,a5,1
	sw	a4,4(a0)
	lbu	a0,0(a5)
	sw	a0,0(s0)
	j	.L57
.L58:
	call	luaZ_fill
	sw	a0,0(s0)
	j	.L57
	.size	esccheck.part.0, .-esccheck.part.0
	.section	.rodata.gethexa.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"hexadecimal digit expected"
	.section	.text.gethexa,"ax",@progbits
	.align	2
	.type	gethexa, @function
gethexa:
	lw	a1,0(a0)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	save
	lw	a0,36(s0)
	lw	a5,0(a0)
	addi	a4,a5,-1
	sw	a4,0(a0)
	beq	a5,zero,.L63
	lw	a5,4(a0)
	addi	a4,a5,1
	sw	a4,4(a0)
	lbu	a0,0(a5)
.L64:
	lla	a5,luai_ctype_
	add	a5,a5,a0
	lbu	a5,1(a5)
	sw	a0,0(s0)
	andi	a5,a5,16
	beq	a5,zero,.L67
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	luaO_hexavalue
.L63:
	call	luaZ_fill
	j	.L64
.L67:
	lla	a1,.LC7
	mv	a0,s0
	call	esccheck.part.0
	.size	gethexa, .-gethexa
	.section	.rodata.read_numeral.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	"Pp"
	.align	2
.LC9:
	.string	"Ee"
	.align	2
.LC10:
	.string	"xX"
	.align	2
.LC11:
	.string	"-+"
	.align	2
.LC12:
	.string	"malformed number"
	.section	.text.read_numeral,"ax",@progbits
	.align	2
	.type	read_numeral, @function
read_numeral:
	addi	sp,sp,-24
	sw	s0,16(sp)
	lw	s0,0(a0)
	sw	a1,0(sp)
	sw	s1,12(sp)
	mv	a1,s0
	mv	s1,a0
	sw	ra,20(sp)
	call	save
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L69
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L70:
	sw	a0,0(s1)
	li	a4,48
	beq	s0,a4,.L93
.L71:
	lla	s0,.LC9
.L73:
	mv	a1,s0
	mv	a0,s1
	call	check_next2
	bne	a0,zero,.L94
.L74:
	lw	a1,0(s1)
	lla	a5,luai_ctype_
	add	a4,a5,a1
	lbu	a4,1(a4)
	andi	a4,a4,16
	bne	a4,zero,.L92
	li	a4,46
	bne	a1,a4,.L79
	li	a1,46
.L92:
	mv	a0,s1
	call	save
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L80
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
	sw	a0,0(s1)
.L95:
	mv	a1,s0
	mv	a0,s1
	call	check_next2
	beq	a0,zero,.L74
.L94:
	lla	a1,.LC11
	mv	a0,s1
	call	check_next2
	j	.L74
.L80:
	call	luaZ_fill
	sw	a0,0(s1)
	j	.L95
.L79:
	li	a1,0
	mv	a0,s1
	call	save
	lw	a4,40(s1)
	addi	a1,sp,4
	lw	a0,0(a4)
	call	luaO_str2num
	beq	a0,zero,.L96
	lw	a3,8(sp)
	li	a4,19
	lw	a5,4(sp)
	beq	a3,a4,.L97
	lw	a4,0(sp)
	lw	ra,20(sp)
	lw	s0,16(sp)
	sw	a5,0(a4)
	lw	s1,12(sp)
	li	a0,290
	addi	sp,sp,24
	jr	ra
.L93:
	lla	a1,.LC10
	mv	a0,s1
	call	check_next2
	lla	s0,.LC8
	bne	a0,zero,.L73
	j	.L71
.L97:
	lw	a4,0(sp)
	lw	ra,20(sp)
	lw	s0,16(sp)
	sw	a5,0(a4)
	lw	s1,12(sp)
	li	a0,291
	addi	sp,sp,24
	jr	ra
.L69:
	call	luaZ_fill
	j	.L70
.L96:
	li	a2,290
	lla	a1,.LC12
	mv	a0,s1
	call	lexerror
	.size	read_numeral, .-read_numeral
	.section	.text.luaX_syntaxerror,"ax",@progbits
	.align	2
	.globl	luaX_syntaxerror
	.hidden	luaX_syntaxerror
	.type	luaX_syntaxerror, @function
luaX_syntaxerror:
	lw	a2,12(a0)
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	lexerror
	.size	luaX_syntaxerror, .-luaX_syntaxerror
	.section	.text.luaX_newstring,"ax",@progbits
	.align	2
	.globl	luaX_newstring
	.hidden	luaX_newstring
	.type	luaX_newstring, @function
luaX_newstring:
	addi	sp,sp,-16
	sw	s0,8(sp)
	lw	s0,32(a0)
	sw	a0,0(sp)
	sw	ra,12(sp)
	mv	a0,s0
	sw	s1,4(sp)
	call	luaS_newlstr
	lw	a2,12(s0)
	lw	a5,0(sp)
	mv	s1,a0
	lw	a1,44(a5)
	addi	a5,a2,8
	sw	a5,12(s0)
	sw	a0,0(a2)
	lbu	a5,4(a0)
	mv	a0,s0
	ori	a5,a5,64
	sw	a5,4(a2)
	call	luaH_set
	lw	a5,4(a0)
	bne	a5,zero,.L101
	lw	a4,16(s0)
	li	a5,1
	sw	a5,0(a0)
	lw	a4,12(a4)
	sw	a5,4(a0)
	bgt	a4,zero,.L104
.L102:
	lw	a5,12(s0)
	lw	ra,12(sp)
	mv	a0,s1
	addi	a5,a5,-8
	sw	a5,12(s0)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L101:
	lw	s1,8(a0)
	j	.L102
.L104:
	mv	a0,s0
	call	luaC_step
	j	.L102
	.size	luaX_newstring, .-luaX_newstring
	.section	.rodata.read_long_string.str1.4,"aMS",@progbits,1
	.align	2
.LC13:
	.string	"string"
	.align	2
.LC14:
	.string	"comment"
	.align	2
.LC15:
	.string	"unfinished long %s (starting at line %d)"
	.section	.text.read_long_string,"ax",@progbits
	.align	2
	.type	read_long_string, @function
read_long_string:
	addi	sp,sp,-24
	lw	a5,4(a0)
	sw	s0,16(sp)
	mv	s0,a1
	lw	a1,0(a0)
	sw	s1,12(sp)
	sw	ra,20(sp)
	mv	s1,a0
	sw	a5,8(sp)
	sw	s0,0(sp)
	sw	a2,4(sp)
	call	save
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L106
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a1,0(a4)
.L107:
	sw	a1,0(s1)
	li	a4,10
	beq	a1,a4,.L108
	li	a4,13
	beq	a1,a4,.L108
	li	s0,13
.L110:
	beq	a1,s0,.L111
.L135:
	ble	a1,s0,.L133
	li	a3,93
	bne	a1,a3,.L114
	mv	a0,s1
	call	skip_sep
	lw	a5,4(sp)
	beq	a0,a5,.L134
.L117:
	lw	a1,0(s1)
	bne	a1,s0,.L135
.L111:
	li	a1,10
	mv	a0,s1
	call	save
	mv	a0,s1
	call	inclinenumber
	lw	a5,0(sp)
	bne	a5,zero,.L117
	lw	a3,40(s1)
	lw	a1,0(s1)
	sw	zero,4(a3)
	j	.L110
.L134:
	lw	a1,0(s1)
	mv	a0,s1
	call	save
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L118
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L119:
	lw	a5,0(sp)
	sw	a0,0(s1)
	beq	a5,zero,.L105
	lw	a4,40(s1)
	lw	a5,4(sp)
	mv	a0,s1
	lw	a2,4(a4)
	lw	a1,0(a4)
	addi	a5,a5,2
	slli	a3,a5,1
	add	a1,a1,a5
	sub	a2,a2,a3
	call	luaX_newstring
	lw	a5,0(sp)
	sw	a0,0(a5)
.L105:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L133:
	li	a3,-1
	beq	a1,a3,.L113
	li	a3,10
	beq	a1,a3,.L111
.L114:
	lw	a5,0(sp)
	beq	a5,zero,.L124
	mv	a0,s1
	call	save
.L124:
	lw	a0,36(s1)
	lw	a3,0(a0)
	addi	a2,a3,-1
	sw	a2,0(a0)
	beq	a3,zero,.L127
	lw	a3,4(a0)
	addi	a2,a3,1
	sw	a2,4(a0)
	lbu	a1,0(a3)
	sw	a1,0(s1)
	j	.L110
.L127:
	call	luaZ_fill
	mv	a1,a0
	sw	a1,0(s1)
	j	.L110
.L108:
	mv	a0,s1
	call	inclinenumber
	lw	a1,0(s1)
	li	s0,13
	j	.L110
.L106:
	call	luaZ_fill
	mv	a1,a0
	j	.L107
.L118:
	call	luaZ_fill
	j	.L119
.L113:
	lw	a5,0(sp)
	lla	a2,.LC13
	beq	a5,zero,.L136
.L116:
	lw	a0,32(s1)
	lw	a3,8(sp)
	lla	a1,.LC15
	call	luaO_pushfstring
	mv	a1,a0
	li	a2,289
	mv	a0,s1
	call	lexerror
.L136:
	lla	a2,.LC14
	j	.L116
	.size	read_long_string, .-read_long_string
	.section	.rodata.llex.str1.4,"aMS",@progbits,1
	.align	2
.LC16:
	.string	"invalid long string delimiter"
	.align	2
.LC17:
	.string	"unfinished string"
	.align	2
.LC18:
	.string	"missing '{'"
	.align	2
.LC19:
	.string	"UTF-8 value too large"
	.align	2
.LC20:
	.string	"missing '}'"
	.align	2
.LC21:
	.string	"invalid escape sequence"
	.align	2
.LC22:
	.string	"decimal escape too large"
	.section	.text.llex,"ax",@progbits
	.align	2
	.type	llex, @function
llex:
	lw	a4,40(a0)
	addi	sp,sp,-36
	sw	s0,28(sp)
	sw	s1,24(sp)
	sw	ra,32(sp)
	sw	a1,12(sp)
	lw	s0,0(a0)
	mv	s1,a0
	sw	zero,4(a4)
	lla	a5,.L144
.L138:
	li	a4,126
	bgt	s0,a4,.L139
.L165:
	li	a4,44
	ble	s0,a4,.L307
	addi	a4,s0,-45
	li	a3,81
	bgtu	a4,a3,.L139
	slli	a4,a4,2
	add	a4,a4,a5
	lw	a4,0(a4)
	add	a4,a4,a5
	jr	a4
	.section	.rodata.llex,"a",@progbits
	.align	2
	.align	2
.L144:
	.word	.L153-.L144
	.word	.L152-.L144
	.word	.L151-.L144
	.word	.L150-.L144
	.word	.L150-.L144
	.word	.L150-.L144
	.word	.L150-.L144
	.word	.L150-.L144
	.word	.L150-.L144
	.word	.L150-.L144
	.word	.L150-.L144
	.word	.L150-.L144
	.word	.L150-.L144
	.word	.L149-.L144
	.word	.L139-.L144
	.word	.L148-.L144
	.word	.L147-.L144
	.word	.L146-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L145-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L139-.L144
	.word	.L143-.L144
	.section	.text.llex
.L307:
	li	a4,-1
	beq	s0,a4,.L275
	addi	a3,s0,-9
	li	a4,30
	bgtu	a3,a4,.L139
	li	a4,1
	sll	a4,a4,a3
	li	a3,8388608
	addi	a3,a3,13
	and	a3,a4,a3
	bne	a3,zero,.L154
	li	a3,1107296256
	and	a3,a4,a3
	bne	a3,zero,.L155
	andi	a4,a4,18
	bne	a4,zero,.L308
.L139:
	lla	a5,luai_ctype_
	add	a4,a5,s0
	lbu	a4,1(a4)
	sw	a5,0(sp)
	andi	a4,a4,1
	bne	a4,zero,.L269
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L270
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
	sw	a0,0(s1)
	j	.L137
.L310:
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	s0,0(a4)
.L268:
	lw	a5,0(sp)
	sw	s0,0(s1)
	add	a4,a5,s0
	lbu	a4,1(a4)
	andi	a4,a4,3
	beq	a4,zero,.L309
.L269:
	mv	a0,s1
	mv	a1,s0
	call	save
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	bne	a4,zero,.L310
	call	luaZ_fill
	mv	s0,a0
	j	.L268
.L275:
	li	s0,289
.L137:
	lw	ra,32(sp)
	mv	a0,s0
	lw	s0,28(sp)
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
.L152:
	mv	a0,s1
	li	a1,46
	call	save
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L259
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L260:
	sw	a0,0(s1)
	li	a4,46
	beq	a0,a4,.L311
	lla	a4,luai_ctype_
	add	a4,a4,a0
	lbu	a4,1(a4)
	andi	a4,a4,2
	beq	a4,zero,.L137
.L150:
	lw	s0,28(sp)
	lw	a1,12(sp)
	lw	ra,32(sp)
	mv	a0,s1
	lw	s1,24(sp)
	addi	sp,sp,36
	tail	read_numeral
.L151:
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L192
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L193:
	sw	a0,0(s1)
	li	a4,47
	bne	a0,a4,.L137
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L194
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L195:
	sw	a0,0(s1)
	li	s0,279
	j	.L137
.L149:
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L200
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L201:
	sw	a0,0(s1)
	li	a4,58
	bne	a0,a4,.L137
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L202
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L203:
	sw	a0,0(s1)
	li	s0,288
	j	.L137
.L148:
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L178
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L179:
	sw	a0,0(s1)
	li	a4,61
	beq	a0,a4,.L312
	li	a4,60
	bne	a0,a4,.L137
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L183
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L184:
	sw	a0,0(s1)
	li	s0,286
	j	.L137
.L147:
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L174
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L175:
	sw	a0,0(s1)
	li	a4,61
	bne	a0,a4,.L137
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L176
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L177:
	sw	a0,0(s1)
	li	s0,282
	j	.L137
.L146:
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L185
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L186:
	sw	a0,0(s1)
	li	a4,61
	beq	a0,a4,.L313
	li	a4,62
	bne	a0,a4,.L137
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L190
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L191:
	sw	a0,0(s1)
	li	s0,287
	j	.L137
.L153:
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L159
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L160:
	sw	a0,0(s1)
	li	a4,45
	bne	a0,a4,.L137
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L161
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	s0,0(a4)
.L162:
	sw	s0,0(s1)
	li	a4,91
	beq	s0,a4,.L163
.L167:
	li	a4,10
	beq	s0,a4,.L165
	li	a3,13
.L164:
	beq	s0,a3,.L172
	li	a4,-1
	beq	s0,a4,.L172
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a2,a4,-1
	sw	a2,0(a0)
	beq	a4,zero,.L168
	lw	a4,4(a0)
	addi	a2,a4,1
	sw	a2,4(a0)
	lbu	s0,0(a4)
.L169:
	sw	s0,0(s1)
	li	a4,10
	bne	s0,a4,.L164
	j	.L138
.L145:
	mv	a0,s1
	call	skip_sep
	bge	a0,zero,.L314
	li	a4,-1
	beq	a0,a4,.L137
	li	a2,293
	lla	a1,.LC16
	mv	a0,s1
	call	lexerror
.L143:
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L196
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L197:
	sw	a0,0(s1)
	li	a4,61
	bne	a0,a4,.L137
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L198
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L199:
	sw	a0,0(s1)
	li	s0,285
	j	.L137
.L168:
	call	luaZ_fill
	mv	s0,a0
	lla	a5,.L144
	li	a3,13
	j	.L169
.L308:
	mv	a0,s1
	call	inclinenumber
	lla	a5,.L144
	lw	s0,0(s1)
	j	.L138
.L154:
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L157
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	s0,0(a4)
	sw	s0,0(s1)
	j	.L138
.L155:
	mv	a1,s0
.L208:
	mv	a0,s1
	call	save
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L204
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a1,0(a4)
	sw	a1,0(s1)
.L302:
	beq	a1,s0,.L206
	li	a4,92
	bne	a1,a4,.L315
	mv	a0,s1
	li	a1,92
	call	save
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L211
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a1,0(a4)
.L212:
	sw	a1,0(s1)
	addi	a4,a1,1
	li	a3,123
	bgtu	a4,a3,.L245
	lla	a5,.L272
	slli	a4,a4,2
	add	a4,a4,a5
	lw	a4,0(a4)
	add	a4,a4,a5
	jr	a4
	.section	.rodata.llex
	.align	2
	.align	2
.L272:
	.word	.L209-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L233-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L233-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L214-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L214-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L214-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L251-.L272
	.word	.L274-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L273-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L281-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L245-.L272
	.word	.L213-.L272
	.word	.L245-.L272
	.word	.L215-.L272
	.word	.L218-.L272
	.word	.L216-.L272
	.word	.L245-.L272
	.word	.L217-.L272
	.word	.L245-.L272
	.word	.L236-.L272
	.section	.text.llex
.L245:
	lla	a5,luai_ctype_
	add	a4,a5,a1
	lbu	a4,1(a4)
	sw	a5,0(sp)
	andi	a4,a4,2
	beq	a4,zero,.L316
	li	a2,0
	li	t1,0
.L246:
	slli	a4,t1,2
	add	a4,a4,t1
	slli	a4,a4,1
	add	a4,a4,a1
	addi	t1,a4,-48
	mv	a0,s1
	sw	a2,8(sp)
	sw	t1,4(sp)
	call	save
	lw	a0,36(s1)
	lw	t1,4(sp)
	lw	a2,8(sp)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L247
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a1,0(a4)
.L248:
	sw	a1,0(s1)
	addi	a2,a2,1
	li	a5,3
	beq	a2,a5,.L249
	lw	a5,0(sp)
	add	a4,a5,a1
	lbu	a4,1(a4)
	andi	a4,a4,2
	bne	a4,zero,.L246
.L249:
	li	a4,255
	bgt	t1,a4,.L317
	lw	a3,40(s1)
	mv	a1,t1
	mv	a0,s1
	lw	a4,4(a3)
	sub	a4,a4,a2
	sw	a4,4(a3)
	addi	a4,a4,-1
	sw	a4,4(a3)
	call	save
.L303:
	lw	a1,0(s1)
	j	.L302
.L251:
	li	a1,7
.L214:
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L252
.L318:
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L253:
	lw	a3,40(s1)
	sw	a0,0(s1)
	lw	a4,4(a3)
.L234:
	addi	a4,a4,-1
	sw	a4,4(a3)
	mv	a0,s1
	call	save
	lw	a1,0(s1)
	j	.L302
.L315:
	bgt	a1,a4,.L208
.L209:
	li	a4,10
	beq	a1,a4,.L210
	li	a4,13
	beq	a1,a4,.L210
	li	a4,-1
	bne	a1,a4,.L208
	li	a2,289
	lla	a1,.LC17
	mv	a0,s1
	call	lexerror
.L233:
	mv	a0,s1
	call	inclinenumber
	lw	a3,40(s1)
	li	a1,10
	lw	a4,4(a3)
	j	.L234
.L216:
	lw	a0,36(s1)
	li	a1,11
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	bne	a4,zero,.L318
.L252:
	sw	a1,0(sp)
	call	luaZ_fill
	lw	a1,0(sp)
	j	.L253
.L218:
	mv	a0,s1
	li	a1,117
	call	save
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L219
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L220:
	sw	a0,0(s1)
	li	a4,123
	bne	a0,a4,.L319
	mv	a0,s1
	call	gethexa
	li	a5,4
	sw	a5,8(sp)
	lla	a5,luai_ctype_
	mv	a4,a0
	sw	a5,0(sp)
	j	.L222
.L322:
	lw	a3,4(a0)
	addi	a2,a3,1
	sw	a2,4(a0)
	lbu	a0,0(a3)
.L224:
	lw	a5,0(sp)
	sw	a0,0(s1)
	add	a3,a5,a0
	lbu	a3,1(a3)
	andi	a3,a3,16
	beq	a3,zero,.L320
	slli	a4,a4,4
	sw	a4,4(sp)
	call	luaO_hexavalue
	lw	a5,8(sp)
	lw	a4,4(sp)
	addi	a5,a5,1
	sw	a5,8(sp)
	add	a4,a0,a4
	li	a5,1114112
	bgeu	a4,a5,.L321
.L222:
	lw	a1,0(s1)
	mv	a0,s1
	sw	a4,4(sp)
	call	save
	lw	a0,36(s1)
	lw	a4,4(sp)
	lw	a3,0(a0)
	addi	a2,a3,-1
	sw	a2,0(a0)
	bne	a3,zero,.L322
	sw	a4,4(sp)
	call	luaZ_fill
	lw	a4,4(sp)
	j	.L224
.L215:
	li	a1,9
	j	.L214
.L213:
	li	a1,13
	j	.L214
.L236:
	lw	a2,40(s1)
	lw	a0,36(s1)
	lw	a4,4(a2)
	lw	a3,0(a0)
	addi	a4,a4,-1
	sw	a4,4(a2)
	addi	a4,a3,-1
	sw	a4,0(a0)
	beq	a3,zero,.L237
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a1,0(a4)
.L238:
	lla	a5,luai_ctype_
	add	a4,a5,a1
	lbu	a4,1(a4)
	sw	a5,0(sp)
	sw	a1,0(s1)
	andi	a4,a4,8
	beq	a4,zero,.L302
	li	a5,10
	beq	a1,a5,.L239
.L323:
	li	a4,13
	beq	a1,a4,.L239
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L242
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a1,0(a4)
.L243:
	sw	a1,0(s1)
.L241:
	lw	a5,0(sp)
	add	a4,a5,a1
	lbu	a4,1(a4)
	andi	a4,a4,8
	beq	a4,zero,.L302
	li	a5,10
	bne	a1,a5,.L323
.L239:
	mv	a0,s1
	call	inclinenumber
	lw	a1,0(s1)
	j	.L241
.L217:
	mv	a0,s1
	call	gethexa
	mv	a1,a0
	slli	a5,a1,4
	mv	a0,s1
	sw	a5,0(sp)
	call	gethexa
	lw	a3,40(s1)
	lw	a5,0(sp)
	lw	a4,4(a3)
	add	a1,a5,a0
	addi	a4,a4,-2
	sw	a4,4(a3)
	j	.L214
.L204:
	call	luaZ_fill
	mv	a1,a0
	sw	a1,0(s1)
	j	.L302
.L211:
	call	luaZ_fill
	mv	a1,a0
	j	.L212
.L242:
	call	luaZ_fill
	mv	a1,a0
	j	.L243
.L320:
	li	a3,125
	bne	a0,a3,.L324
	lw	a0,36(s1)
	lw	a3,0(a0)
	addi	a2,a3,-1
	sw	a2,0(a0)
	beq	a3,zero,.L227
	lw	a3,4(a0)
	addi	a2,a3,1
	sw	a2,4(a0)
	lbu	a0,0(a3)
.L228:
	lw	a2,40(s1)
	lw	a5,8(sp)
	sw	a0,0(s1)
	lw	a3,4(a2)
	mv	a1,a4
	addi	a0,sp,16
	sub	a4,a3,a5
	sw	a4,4(a2)
	call	luaO_utf8esc
	addi	a5,sp,16
	sub	a4,a5,a0
	ble	a0,zero,.L303
.L231:
	lbu	a1,8(a4)
	mv	a0,s1
	addi	a4,a4,1
	sw	a4,0(sp)
	call	save
	lw	a4,0(sp)
	addi	a5,sp,16
	bne	a5,a4,.L231
	lw	a1,0(s1)
	j	.L302
.L247:
	sw	a2,8(sp)
	sw	t1,4(sp)
	call	luaZ_fill
	lw	a2,8(sp)
	lw	t1,4(sp)
	mv	a1,a0
	j	.L248
.L206:
	mv	a0,s1
	call	save
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L257
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L258:
	lw	a4,40(s1)
	sw	a0,0(s1)
	mv	a0,s1
	lw	a2,4(a4)
	lw	a1,0(a4)
	li	s0,293
	addi	a2,a2,-2
	addi	a1,a1,1
	call	luaX_newstring
	lw	a5,12(sp)
	sw	a0,0(a5)
	j	.L137
.L309:
	lw	a4,40(s1)
	mv	a0,s1
	li	s0,292
	lw	a2,4(a4)
	lw	a1,0(a4)
	call	luaX_newstring
	lw	a5,12(sp)
	sw	a0,0(a5)
	lbu	a4,4(a0)
	li	a5,4
	bne	a4,a5,.L137
	lbu	a5,6(a0)
	beq	a5,zero,.L137
	addi	s0,a5,256
	j	.L137
.L163:
	mv	a0,s1
	call	skip_sep
	lw	a4,40(s1)
	mv	a2,a0
	lla	a5,.L144
	sw	zero,4(a4)
	blt	a0,zero,.L325
	li	a1,0
	mv	a0,s1
	call	read_long_string
	lw	a4,40(s1)
	lw	s0,0(s1)
	lla	a5,.L144
	sw	zero,4(a4)
	j	.L138
.L281:
	li	a1,10
	j	.L214
.L273:
	li	a1,12
	j	.L214
.L274:
	li	a1,8
	j	.L214
.L172:
	lw	s0,0(s1)
	j	.L138
.L219:
	call	luaZ_fill
	j	.L220
.L237:
	call	luaZ_fill
	mv	a1,a0
	j	.L238
.L227:
	sw	a4,0(sp)
	call	luaZ_fill
	lw	a4,0(sp)
	j	.L228
.L311:
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L262
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L263:
	sw	a0,0(s1)
	li	a4,46
	li	s0,280
	bne	a0,a4,.L137
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L264
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a4,0(a4)
.L265:
	sw	a4,0(s1)
	li	s0,281
	j	.L137
.L313:
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L188
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L189:
	sw	a0,0(s1)
	li	s0,283
	j	.L137
.L312:
	lw	a0,36(s1)
	lw	a4,0(a0)
	addi	a3,a4,-1
	sw	a3,0(a0)
	beq	a4,zero,.L181
	lw	a4,4(a0)
	addi	a3,a4,1
	sw	a3,4(a0)
	lbu	a0,0(a4)
.L182:
	sw	a0,0(s1)
	li	s0,284
	j	.L137
.L185:
	call	luaZ_fill
	j	.L186
.L259:
	call	luaZ_fill
	j	.L260
.L159:
	call	luaZ_fill
	lla	a5,.L144
	j	.L160
.L196:
	call	luaZ_fill
	j	.L197
.L157:
	call	luaZ_fill
	mv	s0,a0
	lla	a5,.L144
	sw	s0,0(s1)
	j	.L138
.L174:
	call	luaZ_fill
	j	.L175
.L200:
	call	luaZ_fill
	j	.L201
.L192:
	call	luaZ_fill
	j	.L193
.L178:
	call	luaZ_fill
	j	.L179
.L161:
	call	luaZ_fill
	mv	s0,a0
	lla	a5,.L144
	j	.L162
.L257:
	call	luaZ_fill
	j	.L258
.L314:
	lw	a1,12(sp)
	mv	a2,a0
	mv	a0,s1
	call	read_long_string
	li	s0,293
	j	.L137
.L325:
	lw	s0,0(s1)
	j	.L167
.L181:
	call	luaZ_fill
	j	.L182
.L202:
	call	luaZ_fill
	j	.L203
.L194:
	call	luaZ_fill
	j	.L195
.L198:
	call	luaZ_fill
	j	.L199
.L188:
	call	luaZ_fill
	j	.L189
.L270:
	call	luaZ_fill
	sw	a0,0(s1)
	j	.L137
.L176:
	call	luaZ_fill
	j	.L177
.L262:
	call	luaZ_fill
	j	.L263
.L190:
	call	luaZ_fill
	j	.L191
.L183:
	call	luaZ_fill
	j	.L184
.L264:
	call	luaZ_fill
	mv	a4,a0
	j	.L265
.L210:
	li	a2,293
	lla	a1,.LC17
	mv	a0,s1
	call	lexerror
.L321:
	lla	a1,.LC19
	mv	a0,s1
	call	esccheck.part.0
.L319:
	lla	a1,.LC18
	mv	a0,s1
	call	esccheck.part.0
.L317:
	lla	a1,.LC22
	mv	a0,s1
	call	esccheck.part.0
.L324:
	lla	a1,.LC20
	mv	a0,s1
	call	esccheck.part.0
.L316:
	lla	a1,.LC21
	mv	a0,s1
	call	esccheck.part.0
	.size	llex, .-llex
	.section	.text.luaX_setinput,"ax",@progbits
	.align	2
	.globl	luaX_setinput
	.hidden	luaX_setinput
	.type	luaX_setinput, @function
luaX_setinput:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a1
	mv	t1,a2
	li	a5,1
	sw	a4,0(s0)
	li	a4,289
	sw	a4,20(s0)
	sw	t1,36(s0)
	sw	a5,4(s0)
	sw	a5,8(s0)
	sw	a3,52(s0)
	li	a2,4
	lla	a1,.LC1
	sw	zero,12(s0)
	sw	a0,32(s0)
	sw	zero,28(s0)
	call	luaS_newlstr
	lw	s1,40(s0)
	mv	a5,a0
	lw	a0,32(s0)
	lw	a2,8(s1)
	lw	a1,0(s1)
	sw	a5,56(s0)
	li	a3,32
	call	luaM_realloc_
	lw	a5,40(s0)
	lw	ra,8(sp)
	lw	s0,4(sp)
	sw	a0,0(s1)
	li	a4,32
	sw	a4,8(a5)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	luaX_setinput, .-luaX_setinput
	.section	.text.luaX_next,"ax",@progbits
	.align	2
	.globl	luaX_next
	.hidden	luaX_next
	.type	luaX_next, @function
luaX_next:
	lw	a3,4(a0)
	addi	sp,sp,-12
	lw	a4,20(a0)
	sw	s0,4(sp)
	sw	ra,8(sp)
	li	a5,289
	sw	a3,8(a0)
	mv	s0,a0
	beq	a4,a5,.L329
	lw	a3,24(a0)
	lw	ra,8(sp)
	lw	s0,4(sp)
	sw	a4,12(a0)
	sw	a5,20(a0)
	sw	a3,16(a0)
	addi	sp,sp,12
	jr	ra
.L329:
	addi	a1,a0,16
	call	llex
	lw	ra,8(sp)
	sw	a0,12(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	luaX_next, .-luaX_next
	.section	.text.luaX_lookahead,"ax",@progbits
	.align	2
	.globl	luaX_lookahead
	.hidden	luaX_lookahead
	.type	luaX_lookahead, @function
luaX_lookahead:
	addi	sp,sp,-12
	addi	a1,a0,24
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	llex
	lw	ra,8(sp)
	sw	a0,20(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	luaX_lookahead, .-luaX_lookahead
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC23:
	.string	"break"
	.align	2
.LC24:
	.string	"do"
	.align	2
.LC25:
	.string	"else"
	.align	2
.LC26:
	.string	"elseif"
	.align	2
.LC27:
	.string	"end"
	.align	2
.LC28:
	.string	"false"
	.align	2
.LC29:
	.string	"for"
	.align	2
.LC30:
	.string	"function"
	.align	2
.LC31:
	.string	"goto"
	.align	2
.LC32:
	.string	"if"
	.align	2
.LC33:
	.string	"in"
	.align	2
.LC34:
	.string	"local"
	.align	2
.LC35:
	.string	"nil"
	.align	2
.LC36:
	.string	"not"
	.align	2
.LC37:
	.string	"or"
	.align	2
.LC38:
	.string	"repeat"
	.align	2
.LC39:
	.string	"return"
	.align	2
.LC40:
	.string	"then"
	.align	2
.LC41:
	.string	"true"
	.align	2
.LC42:
	.string	"until"
	.align	2
.LC43:
	.string	"while"
	.align	2
.LC44:
	.string	"//"
	.align	2
.LC45:
	.string	".."
	.align	2
.LC46:
	.string	"..."
	.align	2
.LC47:
	.string	"=="
	.align	2
.LC48:
	.string	">="
	.align	2
.LC49:
	.string	"<="
	.align	2
.LC50:
	.string	"~="
	.align	2
.LC51:
	.string	"<<"
	.align	2
.LC52:
	.string	">>"
	.align	2
.LC53:
	.string	"::"
	.align	2
.LC54:
	.string	"<eof>"
	.align	2
.LC55:
	.string	"<number>"
	.align	2
.LC56:
	.string	"<integer>"
	.align	2
.LC57:
	.string	"<name>"
	.align	2
.LC58:
	.string	"<string>"
	.section	.rodata.luaX_tokens,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	luaX_tokens, @object
	.size	luaX_tokens, 148
luaX_tokens:
	.word	.LC0
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC55
	.word	.LC56
	.word	.LC57
	.word	.LC58
	.hidden	luaO_utf8esc
	.hidden	luaC_step
	.hidden	luaH_set
	.hidden	luaO_str2num
	.hidden	luaO_hexavalue
	.hidden	luai_ctype_
	.hidden	luaZ_fill
	.hidden	luaM_realloc_
	.hidden	luaD_throw
	.hidden	luaG_addinfo
	.hidden	luaO_pushfstring
	.hidden	luaS_new
	.hidden	luaC_fix
	.hidden	luaS_newlstr
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
