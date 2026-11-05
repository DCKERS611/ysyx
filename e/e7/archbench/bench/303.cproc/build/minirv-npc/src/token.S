#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"token.c"
	.option nopic
	.text
	.section	.rodata.tokendesc.constprop.0.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EOF"
	.align	2
.LC1:
	.string	"%s '%s'"
	.align	2
.LC2:
	.string	"string"
	.align	2
.LC3:
	.string	"%s %s"
	.align	2
.LC4:
	.string	"number"
	.align	2
.LC5:
	.string	"identifier"
	.align	2
.LC6:
	.string	"newline"
	.align	2
.LC7:
	.string	"character"
	.align	2
.LC8:
	.string	"'%s'"
	.align	2
.LC9:
	.string	"<U+%04x>"
	.align	2
.LC10:
	.string	"<unknown>"
	.align	2
.LC11:
	.string	"%s"
	.section	.text.tokendesc.constprop.0,"ax",@progbits
	.align	2
	.type	tokendesc.constprop.0, @function
tokendesc.constprop.0:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	ra,12(sp)
	li	a5,7
	mv	s0,a0
	bgtu	a1,a5,.L2
	lla	a0,.L4
	slli	a5,a1,2
	add	a5,a5,a0
	lw	a5,0(a5)
	mv	a4,a2
	add	a5,a5,a0
	jr	a5
	.section	.rodata.tokendesc.constprop.0,"a",@progbits
	.align	2
	.align	2
.L4:
	.word	.L2-.L4
	.word	.L10-.L4
	.word	.L9-.L4
	.word	.L8-.L4
	.word	.L7-.L4
	.word	.L6-.L4
	.word	.L5-.L4
	.word	.L3-.L4
	.section	.text.tokendesc.constprop.0
.L3:
	lla	a3,.LC2
	lla	a2,.LC3
	beq	a4,zero,.L14
.L13:
	mv	a0,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	li	a1,64
	addi	sp,sp,16
	tail	snprintf
.L10:
	lla	a3,.LC0
	beq	a2,zero,.L14
	lla	a2,.LC1
	j	.L13
.L9:
	lla	a3,.LC6
	lla	a2,.LC1
	bne	a4,zero,.L13
.L14:
	lla	a2,.LC11
.L23:
	mv	a0,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	li	a1,64
	addi	sp,sp,16
	tail	snprintf
.L7:
	lla	a3,.LC5
	lla	a2,.LC1
	bne	a4,zero,.L13
	j	.L14
.L6:
	lla	a3,.LC4
	lla	a2,.LC1
	bne	a4,zero,.L13
	j	.L14
.L5:
	lla	a3,.LC7
	lla	a2,.LC3
	bne	a4,zero,.L13
	j	.L14
.L2:
	li	a5,110
	bleu	a1,a5,.L25
.L11:
	mv	a0,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	lla	a2,.LC10
	li	a1,64
	addi	sp,sp,16
	tail	snprintf
.L25:
	slli	a1,a1,2
	lla	a5,.LANCHOR0
	add	a5,a5,a1
	lw	a4,0(a5)
	beq	a4,zero,.L11
.L12:
	mv	a0,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	mv	a3,a4
	lla	a2,.LC8
	li	a1,64
	addi	sp,sp,16
	tail	snprintf
.L8:
	lbu	a0,0(a2)
	sw	a2,0(sp)
	call	isprint
	lw	a4,0(sp)
	bne	a0,zero,.L12
	lbu	a3,0(a4)
	lla	a2,.LC9
	j	.L23
	.size	tokendesc.constprop.0, .-tokendesc.constprop.0
	.section	.rodata.tokenprint.str1.4,"aMS",@progbits,1
	.align	2
.LC12:
	.string	"\n"
	.align	2
.LC13:
	.string	"cannot print token %d"
	.section	.text.tokenprint,"ax",@progbits
	.align	2
	.globl	tokenprint
	.hidden	tokenprint
	.type	tokenprint, @function
tokenprint:
	lbu	a5,5(a0)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	bne	a5,zero,.L38
	lw	a1,0(s0)
	li	a5,2
	beq	a1,a5,.L33
.L40:
	bgtu	a1,a5,.L29
	li	a5,1
	bne	a1,a5,.L31
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L29:
	addi	a5,a1,-4
	li	a4,3
	bgtu	a5,a4,.L31
	lw	s0,20(s0)
	beq	s0,zero,.L39
.L28:
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a1, stdout; lw a1, 0(a1);
	addi	sp,sp,12
	tail	fputs
.L38:
	la a1, stdout; lw a1, 0(a1);
	li	a0,32
	call	fputc
	lw	a1,0(s0)
	li	a5,2
	bne	a1,a5,.L40
.L33:
	lla	s0,.LC12
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a1, stdout; lw a1, 0(a1);
	addi	sp,sp,12
	tail	fputs
.L31:
	slli	a4,a1,2
	lla	a5,.LANCHOR0
	add	a5,a5,a4
	lw	s0,0(a5)
	bne	s0,zero,.L28
.L39:
	lla	a0,.LC13
	call	fatal
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a1, stdout; lw a1, 0(a1);
	addi	sp,sp,12
	tail	fputs
	.size	tokenprint, .-tokenprint
	.section	.rodata.error.str1.4,"aMS",@progbits,1
	.align	2
.LC14:
	.string	"%s:%u:%u: error: "
	.section	.text.error,"ax",@progbits
	.align	2
	.globl	error
	.hidden	error
	.type	error, @function
error:
	addi	sp,sp,-32
	sw	a2,16(sp)
	sw	a3,20(sp)
	lw	a3,4(a0)
	lw	a2,0(a0)
	mv	t1,a0
	sw	s0,8(sp)
	sw	a4,24(sp)
	lla	s0,stderr
	lw	a4,8(t1)
	lw	a0,0(s0)
	sw	s1,4(sp)
	mv	s1,a1
	lla	a1,.LC14
	sw	ra,12(sp)
	sw	a5,28(sp)
	call	fprintf
	lw	a0,0(s0)
	addi	a2,sp,16
	mv	a1,s1
	sw	a2,0(sp)
	call	vfprintf
	lw	a1,0(s0)
	li	a0,10
	call	putc
	li	a0,1
	call	exit
	.size	error, .-error
	.section	.rodata.tokencheck.str1.4,"aMS",@progbits,1
	.align	2
.LC15:
	.string	"expected %s %s, saw %s"
	.section	.text.tokencheck,"ax",@progbits
	.align	2
	.globl	tokencheck
	.hidden	tokencheck
	.type	tokencheck, @function
tokencheck:
	lw	a5,0(a0)
	addi	sp,sp,-140
	sw	s0,132(sp)
	sw	ra,136(sp)
	sw	s1,128(sp)
	mv	s0,a0
	bne	a5,a1,.L46
	lw	ra,136(sp)
	lw	s0,132(sp)
	lw	a0,20(a0)
	lw	s1,128(sp)
	addi	sp,sp,140
	jr	ra
.L46:
	mv	s1,a2
	mv	a0,sp
	li	a2,0
	call	tokendesc.constprop.0
	lw	a1,0(s0)
	lw	a2,20(s0)
	addi	a0,sp,64
	call	tokendesc.constprop.0
	addi	a4,sp,64
	mv	a3,s1
	mv	a2,sp
	lla	a1,.LC15
	addi	a0,s0,8
	call	error
	.size	tokencheck, .-tokencheck
	.section	.text.token_init,"ax",@progbits
	.align	2
	.globl	token_init
	.hidden	token_init
	.type	token_init, @function
token_init:
	li	a2,24
	li	a1,0
	lla	a0,.LANCHOR1
	tail	memset
	.size	token_init, .-token_init
	.hidden	tokstr
	.globl	tokstr
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC16:
	.string	"alignas"
	.align	2
.LC17:
	.string	"alignof"
	.align	2
.LC18:
	.string	"auto"
	.align	2
.LC19:
	.string	"bool"
	.align	2
.LC20:
	.string	"break"
	.align	2
.LC21:
	.string	"case"
	.align	2
.LC22:
	.string	"char"
	.align	2
.LC23:
	.string	"const"
	.align	2
.LC24:
	.string	"constexpr"
	.align	2
.LC25:
	.string	"continue"
	.align	2
.LC26:
	.string	"default"
	.align	2
.LC27:
	.string	"do"
	.align	2
.LC28:
	.string	"else"
	.align	2
.LC29:
	.string	"enum"
	.align	2
.LC30:
	.string	"extern"
	.align	2
.LC31:
	.string	"false"
	.align	2
.LC32:
	.string	"for"
	.align	2
.LC33:
	.string	"goto"
	.align	2
.LC34:
	.string	"if"
	.align	2
.LC35:
	.string	"inline"
	.align	2
.LC36:
	.string	"int"
	.align	2
.LC37:
	.string	"long"
	.align	2
.LC38:
	.string	"nullptr"
	.align	2
.LC39:
	.string	"register"
	.align	2
.LC40:
	.string	"restrict"
	.align	2
.LC41:
	.string	"return"
	.align	2
.LC42:
	.string	"short"
	.align	2
.LC43:
	.string	"signed"
	.align	2
.LC44:
	.string	"sizeof"
	.align	2
.LC45:
	.string	"static"
	.align	2
.LC46:
	.string	"static_assert"
	.align	2
.LC47:
	.string	"struct"
	.align	2
.LC48:
	.string	"switch"
	.align	2
.LC49:
	.string	"thread_local"
	.align	2
.LC50:
	.string	"true"
	.align	2
.LC51:
	.string	"typedef"
	.align	2
.LC52:
	.string	"typeof"
	.align	2
.LC53:
	.string	"typeof_unqual"
	.align	2
.LC54:
	.string	"union"
	.align	2
.LC55:
	.string	"unsigned"
	.align	2
.LC56:
	.string	"void"
	.align	2
.LC57:
	.string	"volatile"
	.align	2
.LC58:
	.string	"while"
	.align	2
.LC59:
	.string	"_Atomic"
	.align	2
.LC60:
	.string	"_BitInt"
	.align	2
.LC61:
	.string	"_Complex"
	.align	2
.LC62:
	.string	"_Decimal128"
	.align	2
.LC63:
	.string	"_Decimal32"
	.align	2
.LC64:
	.string	"_Decimal64"
	.align	2
.LC65:
	.string	"_Generic"
	.align	2
.LC66:
	.string	"_Imaginary"
	.align	2
.LC67:
	.string	"_Noreturn"
	.align	2
.LC68:
	.string	"__asm__"
	.align	2
.LC69:
	.string	"__attribute__"
	.align	2
.LC70:
	.string	"["
	.align	2
.LC71:
	.string	"]"
	.align	2
.LC72:
	.string	"("
	.align	2
.LC73:
	.string	")"
	.align	2
.LC74:
	.string	"{"
	.align	2
.LC75:
	.string	"}"
	.align	2
.LC76:
	.string	"."
	.align	2
.LC77:
	.string	"->"
	.align	2
.LC78:
	.string	"++"
	.align	2
.LC79:
	.string	"--"
	.align	2
.LC80:
	.string	"&"
	.align	2
.LC81:
	.string	"*"
	.align	2
.LC82:
	.string	"+"
	.align	2
.LC83:
	.string	"-"
	.align	2
.LC84:
	.string	"~"
	.align	2
.LC85:
	.string	"!"
	.align	2
.LC86:
	.string	"/"
	.align	2
.LC87:
	.string	"%"
	.align	2
.LC88:
	.string	"<<"
	.align	2
.LC89:
	.string	">>"
	.align	2
.LC90:
	.string	"<"
	.align	2
.LC91:
	.string	">"
	.align	2
.LC92:
	.string	"<="
	.align	2
.LC93:
	.string	">="
	.align	2
.LC94:
	.string	"=="
	.align	2
.LC95:
	.string	"!="
	.align	2
.LC96:
	.string	"^"
	.align	2
.LC97:
	.string	"|"
	.align	2
.LC98:
	.string	"&&"
	.align	2
.LC99:
	.string	"||"
	.align	2
.LC100:
	.string	"?"
	.align	2
.LC101:
	.string	":"
	.align	2
.LC102:
	.string	"::"
	.align	2
.LC103:
	.string	";"
	.align	2
.LC104:
	.string	"..."
	.align	2
.LC105:
	.string	"="
	.align	2
.LC106:
	.string	"*="
	.align	2
.LC107:
	.string	"/="
	.align	2
.LC108:
	.string	"%="
	.align	2
.LC109:
	.string	"+="
	.align	2
.LC110:
	.string	"-="
	.align	2
.LC111:
	.string	"<<="
	.align	2
.LC112:
	.string	">>="
	.align	2
.LC113:
	.string	"&="
	.align	2
.LC114:
	.string	"^="
	.align	2
.LC115:
	.string	"|="
	.align	2
.LC116:
	.string	","
	.align	2
.LC117:
	.string	"#"
	.align	2
.LC118:
	.string	"##"
	.hidden	tok
	.globl	tok
	.section	.bss.tok,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	tok, @object
	.size	tok, 24
tok:
	.zero	24
	.section	.data.tokstr,"aw"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	tokstr, @object
	.size	tokstr, 444
tokstr:
	.zero	32
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
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
	.word	.LC59
	.word	.LC60
	.word	.LC61
	.word	.LC62
	.word	.LC63
	.word	.LC64
	.word	.LC65
	.word	.LC66
	.word	.LC67
	.word	.LC68
	.word	.LC69
	.word	.LC70
	.word	.LC71
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LC82
	.word	.LC83
	.word	.LC84
	.word	.LC85
	.word	.LC86
	.word	.LC87
	.word	.LC88
	.word	.LC89
	.word	.LC90
	.word	.LC91
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC95
	.word	.LC96
	.word	.LC97
	.word	.LC98
	.word	.LC99
	.word	.LC100
	.word	.LC101
	.word	.LC102
	.word	.LC103
	.word	.LC104
	.word	.LC105
	.word	.LC106
	.word	.LC107
	.word	.LC108
	.word	.LC109
	.word	.LC110
	.word	.LC111
	.word	.LC112
	.word	.LC113
	.word	.LC114
	.word	.LC115
	.word	.LC116
	.word	.LC117
	.word	.LC118
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
