#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"stmt.c"
	.option nopic
	.text
	.section	.rodata.label.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"'case' label must be in switch"
	.align	2
.LC1:
	.string	"switch_case"
	.align	2
.LC2:
	.string	"after case expression"
	.align	2
.LC3:
	.string	"'default' label must be in switch"
	.align	2
.LC4:
	.string	"multiple 'default' labels"
	.align	2
.LC5:
	.string	"after 'default'"
	.align	2
.LC6:
	.string	"switch_default"
	.section	.text.label,"ax",@progbits
	.align	2
	.type	label, @function
label:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a1
	mv	s1,a0
	li	a1,0
	li	a0,0
	sw	ra,12(sp)
	call	attr
	lla	a4,tok
	lw	a5,0(a4)
	li	a3,13
	beq	a5,a3,.L2
	li	a3,18
	beq	a5,a3,.L3
	li	a3,4
	li	s0,0
	beq	a5,a3,.L17
.L5:
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L2:
	call	next
	lw	a5,40(s0)
	beq	a5,zero,.L18
.L6:
	lla	a0,.LC1
	call	mkblock
	mv	a1,a0
	sw	a0,0(sp)
	mv	a0,s1
	call	funclabel
	mv	a0,s0
	li	a1,1
	call	intconstexpr
	lw	a3,0(sp)
	mv	a2,a1
	mv	a1,a0
	lw	a0,40(s0)
	li	s0,1
	call	switchcase
	lla	a1,.LC2
	li	a0,93
	call	expect
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L17:
	lw	a1,20(a4)
	li	a0,93
	sw	a1,0(sp)
	call	peek
	mv	s0,a0
	beq	a0,zero,.L5
	lw	a1,0(sp)
	mv	a0,s1
	call	funcgoto
	lw	a1,0(a0)
	li	a5,1
	sb	a5,4(a0)
	mv	a0,s1
	call	funclabel
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L3:
	call	next
	lw	a5,40(s0)
	beq	a5,zero,.L19
.L7:
	lw	a5,8(a5)
	beq	a5,zero,.L8
	lla	a1,.LC4
	lla	a0,tok+8
	call	error
.L8:
	lla	a1,.LC5
	li	a0,93
	call	expect
	lw	a4,40(s0)
	lla	a0,.LC6
	sw	a4,0(sp)
	call	mkblock
	lw	a4,0(sp)
	lw	a5,40(s0)
	li	s0,1
	sw	a0,8(a4)
	lw	a1,8(a5)
	mv	a0,s1
	call	funclabel
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L19:
	lla	a1,.LC3
	lla	a0,tok+8
	call	error
	lw	a5,40(s0)
	j	.L7
.L18:
	lla	a1,.LC0
	lla	a0,tok+8
	call	error
	j	.L6
	.size	label, .-label
	.section	.rodata.stmt.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"after expression statement"
	.align	2
.LC8:
	.string	"after 'if'"
	.align	2
.LC9:
	.string	"controlling expression of if statement must have scalar type"
	.align	2
.LC10:
	.string	"after expression"
	.align	2
.LC11:
	.string	"if_true"
	.align	2
.LC12:
	.string	"if_false"
	.align	2
.LC13:
	.string	"if_join"
	.align	2
.LC14:
	.string	"after 'switch'"
	.align	2
.LC15:
	.string	"controlling expression of switch statement must have integer type"
	.align	2
.LC16:
	.string	"switch_cond"
	.align	2
.LC17:
	.string	"switch_join"
	.align	2
.LC18:
	.string	"after 'while'"
	.align	2
.LC19:
	.string	"controlling expression of loop must have scalar type"
	.align	2
.LC20:
	.string	"while_cond"
	.align	2
.LC21:
	.string	"while_body"
	.align	2
.LC22:
	.string	"while_join"
	.align	2
.LC23:
	.string	"do_body"
	.align	2
.LC24:
	.string	"do_cond"
	.align	2
.LC25:
	.string	"do_join"
	.align	2
.LC26:
	.string	"after 'do' statement"
	.align	2
.LC27:
	.string	"after while"
	.align	2
.LC28:
	.string	"for_cond"
	.align	2
.LC29:
	.string	"for_body"
	.align	2
.LC30:
	.string	"for_cont"
	.align	2
.LC31:
	.string	"for_join"
	.align	2
.LC32:
	.string	"after 'goto'"
	.align	2
.LC33:
	.string	"after 'goto' statement"
	.align	2
.LC34:
	.string	"'continue' statement must be in loop"
	.align	2
.LC35:
	.string	"after 'continue' statement"
	.align	2
.LC36:
	.string	"'break' statement must be in loop or switch"
	.align	2
.LC37:
	.string	"after 'break' statement"
	.align	2
.LC38:
	.string	"after 'return' statement"
	.align	2
.LC39:
	.string	"after __asm__"
	.align	2
.LC40:
	.string	"in asm statement"
	.align	2
.LC41:
	.string	"asm string must be a narrow string literal"
	.align	2
.LC42:
	.string	"asm operand name"
	.align	2
.LC43:
	.string	"asm constraint"
	.align	2
.LC44:
	.string	"before asm operand expr"
	.align	2
.LC45:
	.string	"after asm operand expr"
	.align	2
.LC46:
	.string	"asm clobber"
	.align	2
.LC47:
	.string	"after asm string"
	.align	2
.LC48:
	.string	"after asm statement"
	.section	.text.stmt,"ax",@progbits
	.align	2
	.globl	stmt
	.hidden	stmt
	.type	stmt, @function
stmt:
	addi	sp,sp,-60
	sw	s0,52(sp)
	sw	s1,48(sp)
	mv	s0,a0
	mv	s1,a1
	li	a0,0
	li	a1,0
	sw	ra,56(sp)
	sw	a2,0(sp)
	call	attr
	lla	a5,tok
	lw	a5,0(a5)
	li	a4,83
	addi	a5,a5,-12
	bgtu	a5,a4,.L21
	lla	a4,.L23
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.stmt,"a",@progbits
	.align	2
	.align	2
.L23:
	.word	.L34-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L33-.L23
	.word	.L21-.L23
	.word	.L32-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L31-.L23
	.word	.L30-.L23
	.word	.L29-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L28-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L27-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L26-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L25-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L24-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L21-.L23
	.word	.L22-.L23
	.section	.text.stmt
.L21:
	mv	a0,s1
	call	expr
	mv	a1,a0
	mv	s1,a0
	mv	a0,s0
	call	funcexpr
	lw	a4,0(sp)
	mv	s0,a0
	beq	a4,zero,.L40
	lw	a5,8(s1)
	sw	a5,0(a4)
.L40:
	mv	a0,s1
	call	delexpr
	lla	a1,.LC7
	li	a0,95
	call	expect
.L20:
	lw	ra,56(sp)
	mv	a0,s0
	lw	s0,52(sp)
	lw	s1,48(sp)
	addi	sp,sp,60
	jr	ra
.L34:
	call	next
	lw	a1,32(s1)
	beq	a1,zero,.L115
.L61:
	mv	a0,s0
	call	funcjmp
	lla	a1,.LC37
	li	a0,95
	call	expect
	li	s0,0
	j	.L20
.L33:
	call	next
	lw	a1,36(s1)
	beq	a1,zero,.L116
.L60:
	mv	a0,s0
	call	funcjmp
	lla	a1,.LC35
	li	a0,95
	call	expect
	li	s0,0
	j	.L20
.L32:
	call	next
	lla	a0,.LC23
	call	mkblock
	mv	a5,a0
	lla	a0,.LC24
	sw	a5,4(sp)
	call	mkblock
	mv	a5,a0
	lla	a0,.LC25
	sw	a5,8(sp)
	call	mkblock
	mv	a5,a0
	mv	a0,s1
	sw	a5,0(sp)
	call	mkscope
	call	mkscope
	lw	a4,8(sp)
	lw	a1,4(sp)
	mv	s1,a0
	sw	a4,36(a0)
	lw	a4,0(sp)
	sw	a4,32(a0)
	mv	a0,s0
	call	funclabel
.L51:
	mv	a1,s1
	mv	a0,s0
	call	label
	bne	a0,zero,.L51
	li	a2,0
	mv	a1,s1
	mv	a0,s0
	call	stmt
	mv	a0,s1
	call	delscope
	mv	s1,a0
	lla	a1,.LC26
	li	a0,50
	call	expect
	lla	a1,.LC18
	li	a0,64
	call	expect
	lw	a1,8(sp)
	mv	a0,s0
	call	funclabel
	mv	a0,s1
	call	expr
	lw	a2,8(a0)
	mv	a5,a0
	lw	a4,4(a2)
	andi	a4,a4,16
	beq	a4,zero,.L117
.L52:
	lla	a1,.LC10
	li	a0,65
	sw	a2,12(sp)
	sw	a5,8(sp)
	call	expect
	lw	a5,8(sp)
	mv	a0,s0
	mv	a1,a5
	call	funcexpr
	lw	a4,0(sp)
	lw	a3,4(sp)
	lw	a2,12(sp)
	mv	a1,a0
	mv	a0,s0
	call	funcjnz
	lw	a1,0(sp)
	mv	a0,s0
	li	s0,0
	call	funclabel
	mv	a0,s1
	call	delscope
	lla	a1,.LC26
	li	a0,95
	call	expect
	j	.L20
.L31:
	call	next
	lla	a1,.LC27
	li	a0,64
	call	expect
	mv	a0,s1
	call	mkscope
	mv	a1,s0
	mv	s1,a0
	call	decl
	bne	a0,zero,.L53
	lla	a5,tok
	lw	a4,0(a5)
	li	a5,95
	beq	a4,a5,.L54
	mv	a0,s1
	call	expr
	mv	a1,a0
	sw	a0,0(sp)
	mv	a0,s0
	call	funcexpr
	lw	a1,0(sp)
	mv	a0,a1
	call	delexpr
.L54:
	li	a1,0
	li	a0,95
	call	expect
.L53:
	lla	a0,.LC28
	call	mkblock
	mv	a5,a0
	lla	a0,.LC29
	sw	a5,4(sp)
	call	mkblock
	mv	a5,a0
	lla	a0,.LC30
	sw	a5,12(sp)
	call	mkblock
	mv	a5,a0
	lla	a0,.LC31
	sw	a5,8(sp)
	call	mkblock
	lw	a1,4(sp)
	mv	a5,a0
	mv	a0,s0
	sw	a5,0(sp)
	call	funclabel
	lla	a5,tok
	lw	a4,0(a5)
	li	a5,95
	bne	a4,a5,.L118
.L55:
	li	a1,0
	li	a0,95
	call	expect
	lla	a5,tok
	lw	a4,0(a5)
	sw	zero,16(sp)
	li	a5,65
	bne	a4,a5,.L119
.L57:
	li	a1,0
	li	a0,65
	call	expect
	lw	a1,12(sp)
	mv	a0,s0
	call	funclabel
	mv	a0,s1
	call	mkscope
	lw	a5,0(sp)
	mv	s1,a0
	sw	a5,32(a0)
	lw	a5,8(sp)
	sw	a5,36(a0)
.L58:
	mv	a1,s1
	mv	a0,s0
	call	label
	bne	a0,zero,.L58
	mv	a1,s1
	li	a2,0
	mv	a0,s0
	call	stmt
	mv	a0,s1
	call	delscope
	lw	a1,8(sp)
	mv	a5,a0
	mv	a0,s0
	sw	a5,8(sp)
	call	funclabel
	lw	s1,16(sp)
	beq	s1,zero,.L59
	mv	a1,s1
	mv	a0,s0
	call	funcexpr
	mv	a0,s1
	call	delexpr
.L59:
	lw	a1,4(sp)
	mv	a0,s0
	call	funcjmp
	lw	a1,0(sp)
	mv	a0,s0
	li	s0,0
	call	funclabel
	lw	a0,8(sp)
	call	delscope
	j	.L20
.L30:
	call	next
	lla	a1,.LC32
	li	a0,4
	call	expect
	mv	a1,a0
	mv	a0,s0
	call	funcgoto
	lw	a1,0(a0)
	mv	a0,s0
	li	s0,0
	call	funcjmp
	lla	a1,.LC33
	li	a0,95
	call	expect
	j	.L20
.L29:
	call	next
	mv	a0,s1
	call	mkscope
	lla	a1,.LC8
	mv	s1,a0
	li	a0,64
	call	expect
	mv	a0,s1
	call	expr
	lw	a2,8(a0)
	mv	a5,a0
	lw	a4,4(a2)
	andi	a4,a4,16
	beq	a4,zero,.L120
.L41:
	mv	a1,a5
	mv	a0,s0
	sw	a2,8(sp)
	sw	a5,0(sp)
	call	funcexpr
	lw	a5,0(sp)
	mv	a4,a0
	sw	a4,4(sp)
	mv	a0,a5
	call	delexpr
	lla	a1,.LC10
	li	a0,65
	call	expect
	lla	a0,.LC11
	call	mkblock
	mv	a3,a0
	lla	a0,.LC12
	sw	a3,0(sp)
	call	mkblock
	lw	a5,4(sp)
	lw	a2,8(sp)
	lw	a3,0(sp)
	mv	a4,a0
	mv	a1,a5
	sw	a0,12(sp)
	mv	a0,s0
	call	funcjnz
	lw	a3,0(sp)
	mv	a0,s0
	mv	a1,a3
	call	funclabel
	mv	a0,s1
	call	mkscope
	mv	s1,a0
.L42:
	mv	a1,s1
	mv	a0,s0
	call	label
	bne	a0,zero,.L42
	mv	a1,s1
	li	a2,0
	mv	a0,s0
	call	stmt
	mv	a0,s1
	call	delscope
	mv	s1,a0
	li	a0,20
	call	consume
	beq	a0,zero,.L43
	lla	a0,.LC13
	call	mkblock
	mv	a1,a0
	sw	a0,0(sp)
	mv	a0,s0
	call	funcjmp
	lw	a1,12(sp)
	mv	a0,s0
	call	funclabel
	mv	a0,s1
	call	mkscope
	mv	s1,a0
.L44:
	mv	a1,s1
	mv	a0,s0
	call	label
	bne	a0,zero,.L44
	mv	a1,s1
	li	a2,0
	mv	a0,s0
	call	stmt
	mv	a0,s1
	call	delscope
	lw	a1,0(sp)
	mv	s1,a0
	mv	a0,s0
	call	funclabel
	j	.L45
.L28:
	call	next
	mv	a0,s0
	call	functype
	lw	a3,28(a0)
	sw	a0,0(sp)
	lla	a4,typevoid
	li	a1,0
	beq	a3,a4,.L62
	mv	a0,s1
	call	expr
	lw	a5,0(sp)
	lw	a1,28(a5)
	call	exprassign
	mv	a1,a0
	mv	s1,a0
	mv	a0,s0
	call	funcexpr
	mv	a1,a0
	mv	a0,s1
	sw	a1,0(sp)
	call	delexpr
	lw	a1,0(sp)
.L62:
	mv	a0,s0
	call	funcret
	lla	a1,.LC38
	li	a0,95
	call	expect
	li	s0,0
	j	.L20
.L27:
	call	next
	mv	a0,s1
	call	mkscope
	lla	a1,.LC14
	mv	s1,a0
	li	a0,64
	call	expect
	mv	a0,s1
	call	expr
	sw	a0,0(sp)
	lla	a1,.LC10
	li	a0,65
	call	expect
	lw	a5,0(sp)
	lw	a4,8(a5)
	lw	a4,4(a4)
	andi	a4,a4,2
	beq	a4,zero,.L121
.L46:
	mv	a0,a5
	call	exprpromote
	lw	a5,8(a0)
	sw	a0,0(sp)
	lla	a0,.LC16
	sw	a5,40(sp)
	sw	zero,36(sp)
	sw	zero,44(sp)
	call	mkblock
	mv	a5,a0
	lla	a0,.LC17
	sw	a5,4(sp)
	call	mkblock
	lw	a1,0(sp)
	mv	a5,a0
	mv	a0,s0
	sw	a5,0(sp)
	call	funcexpr
	lw	a1,4(sp)
	mv	a5,a0
	mv	a0,s0
	sw	a5,8(sp)
	call	funcjmp
	mv	a0,s1
	call	mkscope
	lw	a5,0(sp)
	mv	s1,a0
	sw	a5,32(a0)
	addi	a5,sp,36
	sw	a5,40(a0)
.L47:
	mv	a1,s1
	mv	a0,s0
	call	label
	bne	a0,zero,.L47
	li	a2,0
	mv	a1,s1
	mv	a0,s0
	call	stmt
	lw	a1,0(sp)
	mv	a0,s0
	call	funcjmp
	lw	a1,4(sp)
	mv	a0,s0
	call	funclabel
	lw	a3,44(sp)
	beq	a3,zero,.L122
.L48:
	lw	a1,8(sp)
	addi	a2,sp,36
	mv	a0,s0
	call	funcswitch
	mv	a0,s1
	call	delscope
	lw	a1,0(sp)
	mv	s1,a0
.L114:
	mv	a0,s0
	call	funclabel
.L45:
	mv	a0,s1
	call	delscope
	li	s0,0
	lw	ra,56(sp)
	mv	a0,s0
	lw	s0,52(sp)
	lw	s1,48(sp)
	addi	sp,sp,60
	jr	ra
.L26:
	call	next
	mv	a0,s1
	call	mkscope
	lla	a1,.LC18
	mv	s1,a0
	li	a0,64
	call	expect
	mv	a0,s1
	call	expr
	lw	a2,8(a0)
	mv	a5,a0
	lw	a4,4(a2)
	andi	a4,a4,16
	beq	a4,zero,.L123
.L49:
	lla	a1,.LC10
	li	a0,65
	sw	a2,16(sp)
	sw	a5,12(sp)
	call	expect
	lla	a0,.LC20
	call	mkblock
	mv	a4,a0
	lla	a0,.LC21
	sw	a4,0(sp)
	call	mkblock
	mv	a3,a0
	lla	a0,.LC22
	sw	a3,8(sp)
	call	mkblock
	lw	a1,0(sp)
	mv	a4,a0
	mv	a0,s0
	sw	a4,4(sp)
	call	funclabel
	lw	a5,12(sp)
	mv	a0,s0
	mv	a1,a5
	call	funcexpr
	lw	a4,4(sp)
	lw	a2,16(sp)
	lw	a3,8(sp)
	mv	a1,a0
	mv	a0,s0
	call	funcjnz
	lw	a3,8(sp)
	mv	a0,s0
	mv	a1,a3
	call	funclabel
	mv	a0,s1
	call	mkscope
	lw	a5,0(sp)
	mv	s1,a0
	sw	a5,36(a0)
	lw	a5,4(sp)
	sw	a5,32(a0)
.L50:
	mv	a1,s1
	mv	a0,s0
	call	label
	bne	a0,zero,.L50
	mv	a1,s1
	li	a2,0
	mv	a0,s0
	call	stmt
	mv	a0,s1
	call	delscope
	lw	a1,0(sp)
	mv	a5,a0
	mv	a0,s0
	mv	s1,a5
	call	funcjmp
	lw	a1,4(sp)
	j	.L114
.L25:
	call	next
	lla	a5,tok
	lw	a4,0(a5)
	li	a5,49
	beq	a4,a5,.L124
.L63:
	li	a1,0
	li	a0,0
	call	attr
	lla	a1,.LC39
	li	a0,64
	call	expect
	lla	a2,.LC40
	li	a1,7
	lla	a0,tok
	call	tokencheck
	li	a1,0
	addi	a0,sp,36
	sw	zero,24(sp)
	sw	zero,28(sp)
	sw	zero,32(sp)
	call	stringconcat
	lw	a4,16(a0)
	li	a5,1
	bne	a4,a5,.L88
	lw	a5,20(a0)
	beq	a5,zero,.L64
.L88:
	lla	a1,.LC41
	lla	a0,tok+8
	call	error
.L64:
	lla	a5,tok
	lw	a4,0(a5)
	sw	zero,0(sp)
	li	a5,93
	beq	a4,a5,.L125
.L66:
	li	a4,0
	sw	zero,4(sp)
.L78:
	lw	a3,4(sp)
	lw	a2,0(sp)
	lw	a1,40(sp)
	mv	a0,s0
	li	s0,0
	call	funcasm
	lla	a1,.LC47
	li	a0,65
	call	expect
	lla	a1,.LC48
	li	a0,95
	call	expect
	j	.L20
.L24:
	call	next
	mv	a0,s1
	call	mkscope
	mv	s1,a0
	j	.L36
.L38:
	mv	a1,s1
	mv	a0,s0
	call	label
	beq	a0,zero,.L126
.L36:
	lla	a5,tok
	lw	a5,0(a5)
	li	a4,67
	bne	a5,a4,.L38
	mv	a0,s1
	call	delscope
	call	next
	li	s0,0
	j	.L20
.L22:
	call	next
	li	s0,0
	j	.L20
.L126:
	mv	a1,s0
	mv	a0,s1
	call	decl
	bne	a0,zero,.L36
	li	a2,0
	mv	a1,s1
	mv	a0,s0
	call	stmt
	j	.L36
.L43:
	lw	a1,12(sp)
	j	.L114
.L118:
	mv	a0,s1
	call	expr
	lw	a2,8(a0)
	mv	t1,a0
	lw	a5,4(a2)
	andi	a5,a5,16
	beq	a5,zero,.L127
.L56:
	mv	a1,t1
	mv	a0,s0
	sw	t1,16(sp)
	sw	a2,20(sp)
	call	funcexpr
	lw	a4,0(sp)
	lw	a3,12(sp)
	lw	a2,20(sp)
	mv	a1,a0
	mv	a0,s0
	call	funcjnz
	lw	t1,16(sp)
	mv	a0,t1
	call	delexpr
	j	.L55
.L119:
	mv	a0,s1
	call	expr
	sw	a0,16(sp)
	j	.L57
.L120:
	sw	a0,0(sp)
	lla	a1,.LC9
	lla	a0,tok+8
	sw	a2,4(sp)
	call	error
	lw	a2,4(sp)
	lw	a5,0(sp)
	j	.L41
.L117:
	sw	a0,8(sp)
	lla	a1,.LC19
	lla	a0,tok+8
	sw	a2,12(sp)
	call	error
	lw	a2,12(sp)
	lw	a5,8(sp)
	j	.L52
.L123:
	sw	a0,0(sp)
	lla	a1,.LC19
	lla	a0,tok+8
	sw	a2,4(sp)
	call	error
	lw	a2,4(sp)
	lw	a5,0(sp)
	j	.L49
.L121:
	lla	a1,.LC15
	lla	a0,tok+8
	call	error
	lw	a5,0(sp)
	j	.L46
.L122:
	lw	a3,0(sp)
	j	.L48
.L124:
	call	next
	j	.L63
.L125:
	sw	a4,0(sp)
	call	next
	lla	a5,tok
	lw	a5,0(a5)
	lw	a4,0(sp)
	addi	a3,sp,24
	beq	a5,a4,.L72
	sw	s1,0(sp)
	sw	s0,4(sp)
	mv	s1,a3
	j	.L67
.L69:
	lla	a2,.LC43
	li	a1,7
	lla	a0,tok
	call	tokencheck
	lla	a5,tok
	lw	a5,20(a5)
	sw	a5,0(s0)
	call	next
	lla	a1,.LC44
	li	a0,64
	call	expect
	lw	a0,0(sp)
	call	assignexpr
	sw	a0,4(s0)
	lla	a1,.LC45
	li	a0,65
	call	expect
	lla	a5,tok
	lw	a5,0(a5)
	li	a4,108
	sw	s0,0(s1)
	addi	s1,s0,8
	beq	a5,a4,.L128
.L70:
	li	a4,93
	beq	a5,a4,.L108
.L67:
	li	a4,65
	beq	a5,a4,.L129
	li	a0,12
	call	xmalloc
	li	a2,12
	li	a1,0
	mv	s0,a0
	call	memset
	lla	a5,tok
	lw	a4,0(a5)
	li	a5,62
	bne	a4,a5,.L69
	call	next
	lla	a1,.LC42
	li	a0,4
	call	expect
	lla	a1,.LC42
	li	a0,63
	call	expect
	j	.L69
.L128:
	call	next
	lla	a5,tok
	lw	a5,0(a5)
	j	.L70
.L129:
	lla	a5,tok
	lw	a3,24(sp)
	lw	a4,0(a5)
	lw	s1,0(sp)
	li	a5,93
	sw	a3,0(sp)
	lw	s0,4(sp)
	bne	a4,a5,.L66
.L72:
	call	next
	lla	a5,tok
	lw	a5,0(a5)
	li	a4,93
	addi	a3,sp,28
	beq	a5,a4,.L77
	sw	s1,0(sp)
	sw	s0,4(sp)
	mv	s1,a3
	j	.L81
.L73:
	lla	a2,.LC43
	li	a1,7
	lla	a0,tok
	call	tokencheck
	lla	a5,tok
	lw	a5,20(a5)
	sw	a5,0(s0)
	call	next
	lla	a1,.LC44
	li	a0,64
	call	expect
	lw	a0,0(sp)
	call	assignexpr
	sw	a0,4(s0)
	lla	a1,.LC45
	li	a0,65
	call	expect
	lla	a5,tok
	lw	a5,0(a5)
	li	a4,108
	sw	s0,0(s1)
	addi	s1,s0,8
	beq	a5,a4,.L130
.L74:
	li	a4,93
	beq	a5,a4,.L109
.L81:
	li	a4,65
	beq	a5,a4,.L131
	li	a0,12
	call	xmalloc
	li	a2,12
	li	a1,0
	mv	s0,a0
	call	memset
	lla	a5,tok
	lw	a4,0(a5)
	li	a5,62
	bne	a4,a5,.L73
	call	next
	lla	a1,.LC42
	li	a0,4
	call	expect
	lla	a1,.LC42
	li	a0,63
	call	expect
	j	.L73
.L130:
	call	next
	lla	a5,tok
	lw	a5,0(a5)
	j	.L74
.L131:
	lw	a3,24(sp)
	lla	a5,tok
	lw	a4,0(a5)
	sw	a3,0(sp)
	lw	a3,28(sp)
	lw	s0,4(sp)
	li	a5,93
	sw	a3,4(sp)
	bne	a4,a5,.L113
.L77:
	call	next
	lw	a3,24(sp)
	lla	a5,tok
	lw	a4,0(a5)
	sw	a3,0(sp)
	lw	a3,28(sp)
	li	a5,65
	sw	a3,4(sp)
	addi	a3,sp,32
	beq	a4,a5,.L113
	mv	s1,a3
	sw	s0,8(sp)
	j	.L80
.L79:
	li	a5,65
	beq	a4,a5,.L132
.L80:
	li	a0,12
	call	xmalloc
	li	a1,0
	li	a2,12
	mv	s0,a0
	call	memset
	lla	a2,.LC46
	li	a1,7
	lla	a0,tok
	call	tokencheck
	lla	a5,tok
	lw	a4,20(a5)
	sw	a4,0(s0)
	call	next
	lla	a5,tok
	lw	a4,0(a5)
	li	a3,108
	sw	s0,0(s1)
	addi	s1,s0,8
	bne	a4,a3,.L79
	call	next
	lla	a5,tok
	lw	a4,0(a5)
	j	.L79
.L132:
	lw	s0,8(sp)
	lw	a4,32(sp)
	j	.L78
.L115:
	lla	a1,.LC36
	lla	a0,tok+8
	call	error
	lw	a1,32(s1)
	j	.L61
.L116:
	lla	a1,.LC34
	lla	a0,tok+8
	call	error
	lw	a1,36(s1)
	j	.L60
.L127:
	sw	a0,16(sp)
	lla	a1,.LC19
	lla	a0,tok+8
	sw	a2,20(sp)
	call	error
	lw	a2,20(sp)
	lw	t1,16(sp)
	j	.L56
.L109:
	lw	s0,4(sp)
	j	.L77
.L108:
	lw	s0,4(sp)
	lw	s1,0(sp)
	j	.L72
.L113:
	li	a4,0
	j	.L78
	.size	stmt, .-stmt
	.section	.rodata.stmt_expr.str1.4,"aMS",@progbits,1
	.align	2
.LC49:
	.string	"start of statement expression"
	.section	.text.stmt_expr,"ax",@progbits
	.align	2
	.globl	stmt_expr
	.hidden	stmt_expr
	.type	stmt_expr, @function
stmt_expr:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	s1,20(sp)
	mv	s0,a1
	mv	s1,a0
	lla	a1,.LC49
	li	a0,66
	sw	a2,4(sp)
	sw	ra,28(sp)
	sw	s1,0(sp)
	call	expect
	mv	a0,s0
	call	mkscope
	sw	s1,48(a0)
	mv	s0,a0
	lla	a3,typevoid
	li	a2,0
	lla	s1,tok
	j	.L135
.L138:
	call	label
	li	a2,0
	lla	a3,typevoid
	beq	a0,zero,.L150
.L135:
	lw	a4,0(s1)
	li	a5,67
	lw	a0,0(sp)
	mv	a1,s0
	bne	a4,a5,.L138
	mv	a0,s0
	sw	a2,0(sp)
	sw	a3,8(sp)
	call	delscope
	call	next
	lw	a5,4(sp)
	lw	a2,0(sp)
	beq	a5,zero,.L133
	lw	a3,8(sp)
	sw	a3,0(a5)
.L133:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	mv	a0,a2
	addi	sp,sp,32
	jr	ra
.L150:
	lw	a1,0(sp)
	mv	a0,s0
	sw	a2,12(sp)
	sw	a3,8(sp)
	call	decl
	lw	a3,8(sp)
	lw	a2,12(sp)
	bne	a0,zero,.L135
	lw	a0,0(sp)
	addi	a2,sp,16
	mv	a1,s0
	call	stmt
	lw	a3,8(sp)
	mv	a2,a0
	beq	a0,zero,.L135
	lw	a3,16(sp)
	j	.L135
	.size	stmt_expr, .-stmt_expr
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
