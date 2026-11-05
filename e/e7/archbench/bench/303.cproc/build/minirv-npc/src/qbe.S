#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"qbe.c"
	.option nopic
	.text
	.section	.text.strip_quotes,"ax",@progbits
	.align	2
	.type	strip_quotes, @function
strip_quotes:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s1,a0
	call	strlen
	li	a5,1
	mv	s0,a0
	bleu	a0,a5,.L2
	lbu	a5,0(s1)
	li	a4,34
	beq	a5,a4,.L6
.L2:
	addi	a0,s0,1
	call	xmalloc
	mv	a1,s1
	mv	s0,a0
	call	strcpy
.L1:
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L6:
	addi	a0,a0,-1
	add	a4,s1,a0
	lbu	a4,0(a4)
	bne	a4,a5,.L2
	call	xmalloc
	addi	a2,s0,-2
	addi	a1,s1,1
	mv	s0,a0
	sw	a2,0(sp)
	call	memcpy
	lw	a2,0(sp)
	add	a5,s0,a2
	sb	zero,0(a5)
	j	.L1
	.size	strip_quotes, .-strip_quotes
	.section	.rodata.get_ret_reg.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"%rax"
	.align	2
.LC1:
	.string	"x0"
	.align	2
.LC2:
	.string	"a0"
	.align	2
.LC3:
	.string	"unknown_reg"
	.align	2
.LC4:
	.string	"x86_64-sysv"
	.align	2
.LC5:
	.string	"aarch64"
	.align	2
.LC6:
	.string	"riscv"
	.section	.text.get_ret_reg,"ax",@progbits
	.align	2
	.type	get_ret_reg, @function
get_ret_reg:
	addi	sp,sp,-12
	la a5, targ; lw a5, 0(a5);
	sw	s0,4(sp)
	lw	s0,0(a5)
	lla	a1,.LC4
	sw	ra,8(sp)
	mv	a0,s0
	call	strcmp
	lla	a5,.LC0
	beq	a0,zero,.L7
	lla	a1,.LC5
	mv	a0,s0
	call	strcmp
	lla	a5,.LC1
	beq	a0,zero,.L7
	li	a2,5
	lla	a1,.LC6
	mv	a0,s0
	call	strncmp
	lla	a5,.LC3
	beq	a0,zero,.L15
.L7:
	lw	ra,8(sp)
	lw	s0,4(sp)
	mv	a0,a5
	addi	sp,sp,12
	jr	ra
.L15:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lla	a5,.LC2
	mv	a0,a5
	addi	sp,sp,12
	jr	ra
	.size	get_ret_reg, .-get_ret_reg
	.section	.rodata.emitname.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"invalid value"
	.align	2
.LC8:
	.string	".L"
	.align	2
.LC9:
	.string	".%u"
	.section	.text.emitname,"ax",@progbits
	.align	2
	.type	emitname, @function
emitname:
	addi	sp,sp,-16
	sw	s0,8(sp)
	lw	s0,0(a0)
	sw	s1,4(sp)
	sw	ra,12(sp)
	andi	a5,s0,8
	mv	s1,a0
	andi	s0,s0,15
	bne	a5,zero,.L32
	lla	a5,.LANCHOR0
	add	a4,a5,s0
	lbu	a0,0(a4)
	beq	a0,zero,.L17
	call	my_putchar
	li	a5,1
	beq	s0,a5,.L33
.L19:
	lw	a0,8(s1)
	beq	a0,zero,.L21
.L24:
	la a1, stdout; lw a1, 0(a1);
	call	my_fputs
.L21:
	lw	a1,4(s1)
	bne	a1,zero,.L34
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L32:
	lla	a5,.LANCHOR0
.L17:
	lla	a0,.LC7
	sw	a5,0(sp)
	call	fatal
	lw	a5,0(sp)
	add	a5,a5,s0
	lbu	a0,0(a5)
	call	my_putchar
	li	a5,1
	bne	s0,a5,.L19
.L33:
	lw	a5,4(s1)
	bne	a5,zero,.L35
	lw	a0,8(s1)
	bne	a0,zero,.L24
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L34:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	lla	a0,.LC9
	addi	sp,sp,16
	tail	my_printf
.L35:
	la a1, stdout; lw a1, 0(a1);
	lla	a0,.LC8
	call	my_fputs
	j	.L19
	.size	emitname, .-emitname
	.section	.rodata.emitvalue.str1.4,"aMS",@progbits,1
	.align	2
.LC10:
	.string	"%llu"
	.align	2
.LC11:
	.string	"\\n"
	.align	2
.LC12:
	.string	"\\t"
	.align	2
.LC13:
	.string	"\\r"
	.align	2
.LC14:
	.string	"\\\\"
	.align	2
.LC15:
	.string	"\\\""
	.align	2
.LC16:
	.string	"\\%03o"
	.align	2
.LC17:
	.string	"thread "
	.section	.text.emitvalue,"ax",@progbits
	.align	2
	.type	emitvalue, @function
emitvalue:
	lw	a4,0(a0)
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	li	a3,2
	andi	a5,a4,15
	mv	s0,a0
	beq	a5,a3,.L37
	li	a3,8
	beq	a5,a3,.L38
	li	a3,1
	beq	a5,a3,.L60
.L40:
	mv	a0,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	emitname
.L37:
	lw	s0,8(sp)
	lw	a1,8(a0)
	lw	a2,12(a0)
	lw	ra,12(sp)
	lw	s1,4(sp)
	lla	a0,.LC10
	addi	sp,sp,16
	tail	my_printf
.L60:
	andi	a4,a4,16
	beq	a4,zero,.L40
	la a1, stdout; lw a1, 0(a1);
	lla	a0,.LC17
	call	my_fputs
	j	.L40
.L38:
	lla	a5,stdout
	lw	a1,0(a5)
	li	a0,34
	call	my_fputc
	lw	s1,8(s0)
	lbu	a1,0(s1)
	beq	a1,zero,.L41
	li	s0,13
.L51:
	beq	a1,s0,.L42
	bgtu	a1,s0,.L43
	li	a4,9
	beq	a1,a4,.L44
	li	a4,10
	bne	a1,a4,.L46
	lla	a5,stdout
	lw	a1,0(a5)
	lla	a0,.LC11
	call	my_fputs
.L49:
	lbu	a1,1(s1)
	addi	s1,s1,1
	bne	a1,zero,.L51
.L41:
	lw	s0,8(sp)
	lla	a5,stdout
	lw	ra,12(sp)
	lw	s1,4(sp)
	lw	a1,0(a5)
	li	a0,34
	addi	sp,sp,16
	tail	my_fputc
.L43:
	li	a4,34
	beq	a1,a4,.L47
	li	a4,92
	bne	a1,a4,.L46
	lla	a5,stdout
	lw	a1,0(a5)
	lla	a0,.LC14
	call	my_fputs
	j	.L49
.L42:
	lla	a5,stdout
	lw	a1,0(a5)
	lla	a0,.LC13
	call	my_fputs
	j	.L49
.L47:
	lla	a5,stdout
	lw	a1,0(a5)
	lla	a0,.LC15
	call	my_fputs
	j	.L49
.L46:
	mv	a0,a1
	sw	a1,0(sp)
	call	isprint
	lw	a1,0(sp)
	beq	a0,zero,.L50
	mv	a0,a1
	call	my_putchar
	j	.L49
.L44:
	lla	a5,stdout
	lw	a1,0(a5)
	lla	a0,.LC12
	call	my_fputs
	j	.L49
.L50:
	lla	a0,.LC16
	call	my_printf
	j	.L49
	.size	emitvalue, .-emitvalue
	.section	.rodata.dataitem.str1.4,"aMS",@progbits,1
	.align	2
.LC18:
	.string	"AM Panic: "
	.align	2
.LC19:
	.string	"Assertion `0' failed"
	.align	2
.LC20:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/qbe.c:1569  \n"
	.align	2
.LC21:
	.string	"not a address expr"
	.align	2
.LC22:
	.string	"initializer is not a constant expression"
	.align	2
.LC23:
	.string	" + "
	.align	2
.LC24:
	.string	"%u "
	.globl	__muldi3
	.align	2
.LC25:
	.string	", z %llu"
	.section	.text.dataitem,"ax",@progbits
	.align	2
	.type	dataitem, @function
dataitem:
	mv	a5,a0
	lw	a4,0(a5)
	addi	sp,sp,-28
	sw	s1,16(sp)
	sw	ra,24(sp)
	sw	s0,20(sp)
	sw	a1,12(sp)
	sw	a2,0(sp)
	li	a3,7
	lla	s1,stdout
	beq	a4,a3,.L62
.L120:
	bgtu	a4,a3,.L63
	li	a3,1
	beq	a4,a3,.L64
	li	a2,2
	bne	a4,a2,.L66
	lw	a4,8(a5)
	lw	a4,28(a4)
	lw	s1,16(a4)
	beq	s1,a3,.L74
	lw	s0,32(a5)
	beq	s0,zero,.L95
	lw	a3,0(sp)
	lw	a4,12(sp)
	li	s0,0
	or	a1,a4,a3
	mv	a3,s1
	bne	a1,zero,.L106
	j	.L61
.L85:
	lw	a1,36(a5)
	slli	t1,s0,1
	lla	a0,.LC24
	add	a1,a1,t1
	lhu	a1,0(a1)
	sw	a3,8(sp)
	sw	a5,4(sp)
	call	my_printf
	lw	a5,4(sp)
	lw	a3,8(sp)
.L88:
	lw	a1,32(a5)
	addi	s0,s0,1
	mv	t0,a3
	li	t1,0
	bleu	a1,s0,.L75
	lw	a4,0(sp)
	add	a3,a3,s1
	beq	a4,zero,.L117
.L106:
	li	a4,2
	beq	s1,a4,.L85
	li	a1,4
	bne	s1,a1,.L118
	lw	a1,36(a5)
	slli	t1,s0,2
	lla	a0,.LC24
	add	a1,a1,t1
	lw	a1,0(a1)
	sw	a3,8(sp)
	sw	a5,4(sp)
	call	my_printf
	lw	a5,4(sp)
	lw	a3,8(sp)
	j	.L88
.L63:
	li	a2,9
	bne	a4,a2,.L66
	lw	a2,16(a5)
	li	a4,74
	bne	a2,a4,.L71
	lw	a0,32(a5)
	lw	a4,0(a0)
	beq	a4,a3,.L119
.L71:
	lla	a0,tok+8
	lla	a1,.LC22
	sw	a5,0(sp)
	call	error
	lw	a5,0(sp)
	lw	a0,32(a5)
.L72:
	li	a1,0
	li	a2,0
	sw	a5,4(sp)
	call	dataitem
	lw	a1,0(s1)
	lla	a0,.LC23
	sw	zero,12(sp)
	call	my_fputs
	lw	a5,4(sp)
	sw	zero,0(sp)
	li	a3,7
	lw	a5,36(a5)
	lw	a4,0(a5)
	bne	a4,a3,.L120
.L62:
	lw	a3,16(a5)
	li	a4,72
	bne	a3,a4,.L121
	lw	s0,20(a5)
	lw	a5,0(s0)
	bne	a5,zero,.L122
.L69:
	lw	s0,32(s0)
	li	a5,1
	lw	a4,4(s0)
	beq	a4,a5,.L123
.L70:
	lw	a0,20(s0)
	lw	s0,20(sp)
	lw	ra,24(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	tail	emitname
.L66:
	lw	s0,20(sp)
	lw	ra,24(sp)
	lw	s1,16(sp)
	lla	a1,.LC22
	lla	a0,tok+8
	addi	sp,sp,28
	tail	error
.L64:
	lw	a1,32(a5)
	lw	a2,36(a5)
	lla	a0,.LC10
.L116:
	lw	s0,20(sp)
	lw	ra,24(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	tail	my_printf
.L121:
	lla	a0,.LC21
	sw	a5,0(sp)
	call	fatal
	lw	a5,0(sp)
	lw	s0,20(a5)
	lw	a5,0(s0)
	beq	a5,zero,.L69
	j	.L122
.L123:
	lw	a5,44(s0)
	beq	a5,zero,.L70
	lla	a1,.LC22
	lla	a0,tok+8
	call	error
	j	.L70
.L122:
	lla	a1,.LC22
	lla	a0,tok+8
	call	error
	j	.L69
.L74:
	sw	a5,4(sp)
	lla	a5,stdout
	lw	a1,0(a5)
	li	a0,34
	call	my_fputc
	lw	a5,4(sp)
	lw	s0,32(a5)
	beq	s0,zero,.L97
	lw	a4,12(sp)
	lw	a3,0(sp)
	or	a3,a4,a3
	beq	a3,zero,.L98
	li	s0,0
	j	.L111
.L125:
	li	a4,34
	beq	a1,a4,.L80
	li	a3,92
	beq	a1,a3,.L80
	mv	a0,a1
	sw	a5,4(sp)
	call	my_putchar
	lw	a5,4(sp)
.L81:
	lw	a3,32(a5)
	addi	s0,s0,1
	mv	t0,s0
	li	t1,0
	bleu	a3,s0,.L78
	lw	a4,0(sp)
	beq	a4,zero,.L124
.L111:
	lw	a3,36(a5)
	sw	a5,8(sp)
	add	a3,a3,s0
	lbu	a1,0(a3)
	mv	a0,a1
	sw	a1,4(sp)
	call	isprint
	lw	a1,4(sp)
	lw	a5,8(sp)
	bne	a0,zero,.L125
.L80:
	lla	a0,.LC16
	sw	a5,4(sp)
	call	my_printf
	lw	a5,4(sp)
	j	.L81
.L127:
	beq	a5,t1,.L126
.L61:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L97:
	li	t0,0
	li	t1,0
.L78:
	lla	a5,stdout
	lw	a1,0(a5)
	li	a0,34
	sw	t1,8(sp)
	sw	t0,4(sp)
	call	my_fputc
	lw	t0,4(sp)
	lw	t1,8(sp)
.L75:
	lw	a5,0(sp)
	bleu	a5,t1,.L127
.L99:
	mv	a2,s0
	li	a3,0
	mv	a0,s1
	li	a1,0
	call	__muldi3
	lw	a5,12(sp)
	sub	a0,a5,a0
	sgtu	a2,a0,a5
	lw	a5,0(sp)
	sub	s0,a5,a1
	sub	a2,s0,a2
	mv	a1,a0
	lla	a0,.LC25
	j	.L116
.L117:
	lw	a4,12(sp)
	bgtu	a4,t0,.L106
	j	.L61
.L119:
	lw	a3,36(a5)
	li	a4,1
	lw	a3,0(a3)
	bne	a3,a4,.L71
	j	.L72
.L126:
	lw	a5,12(sp)
	bgtu	a5,t0,.L99
	j	.L61
.L124:
	lw	a4,12(sp)
	bgtu	a4,s0,.L111
	j	.L78
.L95:
	li	t0,0
	li	t1,0
	j	.L75
.L98:
	lw	t0,12(sp)
	lw	t1,0(sp)
	li	s0,0
	j	.L78
.L118:
	lla	s0,.LC18
	li	a0,65
.L87:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L87
	lla	s0,.LC19
	li	a0,65
.L89:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L89
	lla	s0,.LC20
	li	a0,32
.L90:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L90
	li	a0,1
	call	halt
	.size	dataitem, .-dataitem
	.section	.text.process_asm_string.part.0,"ax",@progbits
	.align	2
	.type	process_asm_string.part.0, @function
process_asm_string.part.0:
	addi	sp,sp,-48
	sw	s1,36(sp)
	mv	s1,a0
	li	a0,16
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	a1,32(sp)
	call	xmalloc
	lbu	a5,0(s1)
	sw	a0,24(sp)
	beq	a5,zero,.L129
	li	a5,4
	sw	zero,12(sp)
	sw	a5,28(sp)
	mv	a3,s1
.L152:
	mv	a0,a3
	li	a1,10
	sw	a3,0(sp)
	call	strchr
	lw	a3,0(sp)
	sw	a0,4(sp)
	sub	s1,a0,a3
	beq	a0,zero,.L188
	addi	a0,s1,1
	sw	a3,8(sp)
	call	xmalloc
	sw	a0,0(sp)
	beq	s1,zero,.L157
.L194:
	lw	a3,8(sp)
	mv	a4,a0
	li	a5,0
	lbu	a1,0(a3)
	li	t1,34
	li	s0,47
	li	t0,92
.L133:
	addi	a2,a5,1
	add	a0,a3,a2
	beq	a1,t1,.L140
.L156:
	mv	a5,a2
	bgtu	s1,a2,.L189
	addi	a4,a4,1
	sb	a1,-1(a4)
.L132:
	lw	s1,0(sp)
	sb	zero,0(a4)
	lbu	a0,0(s1)
	bne	a0,zero,.L143
	j	.L144
.L145:
	lbu	a0,1(s1)
	addi	s1,s1,1
	beq	a0,zero,.L144
.L143:
	call	isspace
	bne	a0,zero,.L145
.L144:
	mv	a0,s1
	call	strlen
	add	s0,s1,a0
	bgtu	s0,s1,.L146
	j	.L147
.L148:
	addi	s0,s0,-1
	beq	s0,s1,.L147
.L146:
	lbu	a0,-1(s0)
	call	isspace
	bne	a0,zero,.L148
.L147:
	sb	zero,0(s0)
	lbu	a4,0(s1)
	beq	a4,zero,.L149
	lw	a5,12(sp)
	lw	a4,28(sp)
	beq	a5,a4,.L190
.L150:
	lw	s0,12(sp)
	lw	a5,24(sp)
	mv	a0,s1
	slli	a4,s0,2
	add	a4,a5,a4
	sw	a4,20(sp)
	call	strlen
	addi	a0,a0,1
	call	xmalloc
	addi	a2,s0,1
	mv	a1,s1
	sw	a2,8(sp)
	sw	a0,16(sp)
	call	strcpy
	lw	a2,8(sp)
	lw	a3,16(sp)
	lw	a4,20(sp)
	sw	a2,12(sp)
	sw	a3,0(a4)
.L149:
	lw	a0,0(sp)
	call	free
	lw	a4,4(sp)
	beq	a4,zero,.L151
	lbu	a5,1(a4)
	addi	a3,a4,1
	bne	a5,zero,.L152
.L151:
	lw	a4,32(sp)
	lw	a5,12(sp)
	sw	a5,0(a4)
	beq	a5,zero,.L154
	lw	s0,40(sp)
	lw	a1,12(sp)
	lw	a0,24(sp)
	lw	ra,44(sp)
	lw	s1,36(sp)
	li	a2,4
	addi	sp,sp,48
	tail	xreallocarray
.L189:
	beq	a1,s0,.L191
.L136:
	sb	a1,0(a4)
	lbu	a1,0(a0)
	addi	a0,a0,1
	addi	a4,a4,1
	addi	a2,a2,1
	bne	a1,t1,.L156
.L140:
	sb	t1,0(a4)
	addi	a2,a5,1
	addi	a0,a4,1
	bleu	s1,a2,.L158
	add	a5,a3,a2
	lbu	a1,0(a5)
.L134:
	sb	a1,0(a0)
	addi	a5,a2,1
	addi	a4,a0,1
	beq	a1,t0,.L192
.L137:
	add	a2,a3,a5
	beq	a1,t1,.L193
	bleu	s1,a5,.L132
	lbu	a1,0(a2)
	mv	a0,a4
	mv	a2,a5
	sb	a1,0(a0)
	addi	a5,a2,1
	addi	a4,a0,1
	bne	a1,t0,.L137
.L192:
	addi	a2,a2,2
	add	a1,a3,a5
	add	t2,a3,a2
	bleu	s1,a5,.L132
	lbu	a5,0(a1)
	addi	a4,a0,2
	sb	a5,1(a0)
	bleu	s1,a2,.L132
	lbu	a1,0(t2)
	mv	a0,a4
	j	.L134
.L193:
	bleu	s1,a5,.L132
	lbu	a1,0(a2)
	j	.L133
.L191:
	lbu	t2,0(a0)
	bne	t2,a1,.L136
	j	.L132
.L188:
	mv	a0,a3
	call	strlen
	lw	a3,0(sp)
	mv	s1,a0
	addi	a0,s1,1
	sw	a3,8(sp)
	call	xmalloc
	sw	a0,0(sp)
	bne	s1,zero,.L194
.L157:
	lw	a4,0(sp)
	j	.L132
.L190:
	lw	a0,24(sp)
	slli	a5,a5,1
	li	a2,4
	mv	a1,a5
	sw	a5,28(sp)
	call	xreallocarray
	sw	a0,24(sp)
	j	.L150
.L158:
	mv	a4,a0
	j	.L132
.L129:
	lw	a5,32(sp)
	sw	zero,0(a5)
.L154:
	lw	a0,24(sp)
	call	free
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	li	a0,0
	addi	sp,sp,48
	jr	ra
	.size	process_asm_string.part.0, .-process_asm_string.part.0
	.section	.rodata.qbetype.str1.4,"aMS",@progbits,1
	.align	2
.LC26:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/qbe.c:196  \n"
	.globl	__ucmpdi2
	.align	2
.LC27:
	.string	"int128 is not yet supported"
	.section	.text.qbetype,"ax",@progbits
	.align	2
	.type	qbetype, @function
qbetype:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	lla	a5,typevoid
	mv	s0,a0
	beq	a1,a5,.L215
	lw	a5,4(a1)
	mv	s1,a1
	andi	a5,a5,16
	beq	a5,zero,.L202
	lw	a0,16(a1)
	lw	a1,20(a1)
	li	a2,16
	li	a3,0
	call	__ucmpdi2
	li	a5,1
	bgtu	a0,a5,.L199
	lw	a5,16(s1)
	lla	a4,.L201
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.qbetype,"a",@progbits
	.align	2
	.align	2
.L201:
	.word	.L199-.L201
	.word	.L205-.L201
	.word	.L204-.L201
	.word	.L199-.L201
	.word	.L203-.L201
	.word	.L199-.L201
	.word	.L199-.L201
	.word	.L199-.L201
	.word	.L202-.L201
	.word	.L199-.L201
	.word	.L199-.L201
	.word	.L199-.L201
	.word	.L199-.L201
	.word	.L199-.L201
	.word	.L199-.L201
	.word	.L199-.L201
	.word	.L200-.L201
	.section	.text.qbetype
.L202:
	li	a5,28672
	addi	a5,a5,-916
	sh	a5,0(s0)
	li	a5,23
	sw	a5,4(s0)
	li	a5,17
	sw	a5,8(s0)
.L195:
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L203:
	li	a5,28672
	addi	a5,a5,1911
	sh	a5,0(s0)
	li	a5,24
	sw	a5,4(s0)
	li	a5,18
	lw	ra,8(sp)
	sw	a5,8(s0)
	mv	a0,s0
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L204:
	lbu	a5,48(s1)
	beq	a5,zero,.L207
	li	a5,28672
	addi	a5,a5,-1929
	sh	a5,0(s0)
	li	a5,25
	sw	a5,4(s0)
	li	a5,19
	sw	a5,8(s0)
	j	.L195
.L205:
	lbu	a5,48(s1)
	beq	a5,zero,.L206
	li	a5,24576
	addi	a5,a5,631
	sh	a5,0(s0)
	li	a5,27
	sw	a5,4(s0)
	li	a5,20
	sw	a5,8(s0)
	j	.L195
.L215:
	lw	ra,8(sp)
	sw	zero,0(a0)
	sw	zero,4(a0)
	sw	zero,8(a0)
	mv	a0,s0
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L206:
	li	a5,24576
	addi	a5,a5,631
	sh	a5,0(s0)
	li	a5,28
	sw	a5,4(s0)
	li	a5,20
	sw	a5,8(s0)
	j	.L195
.L207:
	li	a5,28672
	addi	a5,a5,-1929
	sh	a5,0(s0)
	li	a5,26
	sw	a5,4(s0)
	li	a5,19
	sw	a5,8(s0)
	j	.L195
.L200:
	lla	a0,.LC27
	call	fatal
.L199:
	lla	s0,.LC18
	li	a0,65
.L208:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L208
	lla	s0,.LC19
	li	a0,65
.L209:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L209
	lla	s0,.LC26
	li	a0,32
.L210:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L210
	li	a0,1
	call	halt
	.size	qbetype, .-qbetype
	.section	.rodata.emittype.part.0.str1.4,"aMS",@progbits,1
	.align	2
.LC28:
	.string	"type "
	.align	2
.LC29:
	.string	" = align %d { %llu }\n"
	.align	2
.LC30:
	.string	" = { "
	.align	2
.LC31:
	.string	"{ "
	.align	2
.LC32:
	.string	"type has no QBE representation"
	.globl	__udivdi3
	.align	2
.LC33:
	.string	" %llu"
	.align	2
.LC34:
	.string	", "
	.align	2
.LC35:
	.string	" } "
	.align	2
.LC36:
	.string	"}"
	.section	.text.emittype.part.0,"ax",@progbits
	.align	2
	.type	emittype.part.0, @function
emittype.part.0:
	addi	sp,sp,-36
	sw	s0,28(sp)
	mv	s0,a0
	li	a0,16
	sw	s1,24(sp)
	sw	ra,32(sp)
	call	xmalloc
	lla	a3,.LANCHOR1
	lw	a5,0(a3)
	lw	a2,48(s0)
	lw	a4,52(s0)
	sw	a0,24(s0)
	addi	a5,a5,1
	li	a1,6
	sw	a1,0(a0)
	sw	a2,8(a0)
	sw	a5,0(a3)
	sw	a5,4(a0)
	li	s1,10
	beq	a4,zero,.L223
.L217:
	lw	a0,4(a4)
	lw	a5,0(a0)
	bne	a5,s1,.L220
.L221:
	lw	a0,28(a0)
	lw	a5,0(a0)
	beq	a5,s1,.L221
.L220:
	lw	a3,24(a0)
	beq	a3,zero,.L271
.L222:
	lw	a4,28(a4)
	bne	a4,zero,.L217
.L223:
	lla	a5,stdout
	lw	a1,0(a5)
	lla	a0,.LC28
	call	my_fputs
	lw	a0,24(s0)
	call	emitname
	la a5, targ; lw a5, 0(a5);
	lw	a5,4(a5)
	beq	s0,a5,.L272
	lla	a5,stdout
	lw	a1,0(a5)
	lla	a0,.LC30
	call	my_fputs
	lw	s1,52(s0)
	beq	s1,zero,.L224
	sw	zero,8(sp)
	sw	zero,4(sp)
.L243:
	lw	a5,0(s0)
	li	a4,12
	beq	a5,a4,.L273
	lla	a5,stdout
	lw	a1,0(a5)
	lla	a0,.LC31
	call	my_fputs
	lw	a1,4(s1)
.L231:
	lw	a3,0(a1)
	li	a5,10
	bne	a3,a5,.L232
	li	a3,10
.L233:
	lw	a1,28(a1)
	lw	a5,0(a1)
	beq	a5,a3,.L233
.L232:
	addi	a0,sp,12
	sw	a1,0(sp)
	call	qbetype
	lw	a1,0(sp)
	lbu	a0,13(sp)
	lw	a5,24(a1)
	beq	a5,zero,.L234
	lw	a2,0(a5)
	li	a3,6
	beq	a2,a3,.L274
.L234:
	sw	a1,0(sp)
	beq	a0,zero,.L236
	call	my_putchar
	lw	a1,0(sp)
.L235:
	lw	a5,4(s1)
	lw	a3,20(a1)
	lw	a2,16(a1)
	lw	a1,20(a5)
	lw	a0,16(a5)
	bgtu	a1,a3,.L246
.L277:
	beq	a1,a3,.L275
.L237:
	lw	a5,0(s0)
	lla	a4,stdout
	lw	a1,0(a4)
	li	a4,12
	beq	a5,a4,.L276
.L239:
	lla	a0,.LC35
	call	my_fputs
	lw	s1,28(s1)
	bne	s1,zero,.L243
.L224:
	lw	s0,28(sp)
	lw	ra,32(sp)
	lw	s1,24(sp)
	lla	a0,.LC36
	addi	sp,sp,36
	tail	my_puts
.L236:
	lla	a0,.LC32
	call	fatal
	lw	a1,0(sp)
	lw	a5,4(s1)
	lw	a3,20(a1)
	lw	a2,16(a1)
	lw	a1,20(a5)
	lw	a0,16(a5)
	bleu	a1,a3,.L277
.L246:
	call	__udivdi3
	mv	a2,a1
	mv	a1,a0
	lla	a0,.LC33
	call	my_printf
.L281:
	lw	a5,0(s0)
	lla	a4,stdout
	lw	a1,0(a4)
	li	a4,12
	bne	a5,a4,.L239
.L276:
	lla	a0,.LC34
	call	my_fputs
	j	.L262
.L279:
	lw	a5,20(s1)
	lw	a4,4(sp)
	bgeu	a5,a4,.L278
.L262:
	lw	s1,28(s1)
	bne	s1,zero,.L279
	j	.L224
.L273:
	lw	a5,28(s1)
	lw	t1,16(s1)
	lw	a0,20(s1)
	beq	a5,zero,.L226
.L230:
	addi	a3,t1,8
	lw	a1,20(a5)
	sltu	a2,a3,t1
	add	a2,a2,a0
	lw	t0,16(a5)
	andi	a3,a3,-8
	bleu	a2,a1,.L280
.L245:
	bgtu	a1,a0,.L228
	bne	a1,a0,.L244
	bgtu	t0,t1,.L228
.L244:
	mv	s1,a5
	mv	t1,t0
	mv	a0,a1
.L228:
	lw	a5,28(a5)
	bne	a5,zero,.L230
.L226:
	lw	a1,4(s1)
	lw	a5,16(a1)
	lw	a3,20(a1)
	add	a5,t1,a5
	sltu	t1,a5,t1
	add	a0,a0,a3
	sw	a5,8(sp)
	add	a5,t1,a0
	sw	a5,4(sp)
	j	.L231
.L280:
	bne	a2,a1,.L226
	bgtu	a3,t0,.L245
	j	.L226
.L271:
	addi	a5,a5,-12
	li	a3,1
	bgtu	a5,a3,.L222
	sw	a4,0(sp)
	call	emittype.part.0
	lw	a4,0(sp)
	j	.L222
.L275:
	bleu	a0,a2,.L237
	call	__udivdi3
	mv	a2,a1
	mv	a1,a0
	lla	a0,.LC33
	call	my_printf
	j	.L281
.L274:
	mv	a0,a5
	call	emitname
	lw	a1,0(sp)
	j	.L235
.L278:
	bne	a5,a4,.L243
	lw	a5,16(s1)
	lw	a4,8(sp)
	bltu	a5,a4,.L262
	j	.L243
.L272:
	lw	a2,16(s0)
	lw	a3,20(s0)
	lw	a1,8(s0)
	lw	s0,28(sp)
	lw	ra,32(sp)
	lw	s1,24(sp)
	lla	a0,.LC29
	addi	sp,sp,36
	tail	my_printf
	.size	emittype.part.0, .-emittype.part.0
	.section	.rodata.funcinst.str1.4,"aMS",@progbits,1
	.align	2
.LC37:
	.string	"dead"
	.section	.text.funcinst,"ax",@progbits
	.align	2
	.type	funcinst, @function
funcinst:
	addi	sp,sp,-24
	sw	s1,12(sp)
	mv	s1,a0
	lw	a0,24(a0)
	sw	s0,16(sp)
	sw	ra,20(sp)
	lw	a0,72(a0)
	sw	a3,0(sp)
	sw	a4,4(sp)
	mv	s0,a1
	bne	a0,zero,.L293
.L283:
	li	a0,32
	sw	a2,8(sp)
	call	xmalloc
	lw	a5,0(sp)
	lw	a2,8(sp)
	sw	s0,0(a0)
	sw	a5,24(a0)
	lw	a5,4(sp)
	sw	a2,4(a0)
	mv	a1,a0
	sw	a5,28(a0)
	beq	a2,zero,.L284
	li	a4,91
	beq	s0,a4,.L284
	lw	a4,44(s1)
	li	a3,5
	sw	a3,8(a0)
	addi	a4,a4,1
	sw	zero,16(a0)
	sw	a4,44(s1)
	sw	a4,12(a0)
	j	.L285
.L284:
	sw	zero,8(a1)
.L285:
	lw	a0,24(s1)
	sw	a1,0(sp)
	addi	a0,a0,16
	call	arrayaddptr
	lw	a1,0(sp)
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	a0,a1,8
	addi	sp,sp,24
	jr	ra
.L293:
	li	a0,96
	sw	a2,8(sp)
	call	xmalloc
	lla	a3,.LANCHOR2
	lw	a4,0(a3)
	lw	a1,24(s1)
	li	t1,7
	sw	t1,0(a0)
	addi	a4,a4,1
	lla	t1,.LC37
	sw	t1,8(a0)
	sw	a4,4(a0)
	sw	zero,16(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,72(a0)
	sw	zero,56(a0)
	sw	zero,88(a0)
	sw	a0,88(a1)
	lw	a2,8(sp)
	sw	a4,0(a3)
	sw	a0,24(s1)
	j	.L283
	.size	funcinst, .-funcinst
	.section	.text.funcbits,"ax",@progbits
	.align	2
	.type	funcbits, @function
funcbits:
	lw	a4,20(a1)
	addi	sp,sp,-28
	sw	s1,16(sp)
	sw	a3,12(sp)
	sw	ra,24(sp)
	sw	s0,20(sp)
	mv	a5,a1
	mv	s1,a0
	lw	a1,16(a1)
	mv	a3,a2
	bne	a4,zero,.L301
	li	a4,4
	li	a2,119
	bgtu	a1,a4,.L301
	lh	a4,14(sp)
	li	s0,0
	bne	a4,zero,.L305
.L297:
	lh	a4,12(sp)
	sw	a2,0(sp)
	add	s0,a4,s0
	beq	s0,zero,.L298
.L306:
	lbu	a5,48(a5)
	li	a1,13
	li	a0,16
	sub	a1,a1,a5
	sw	a3,8(sp)
	sw	a1,4(sp)
	call	xmalloc
	mv	a4,a0
	srai	a5,s0,31
	li	a0,2
	sw	s0,8(a4)
	lw	s0,20(sp)
	lw	a3,8(sp)
	lw	a2,0(sp)
	lw	a1,4(sp)
	lw	ra,24(sp)
	sw	a0,0(a4)
	mv	a0,s1
	lw	s1,16(sp)
	sw	a5,12(a4)
	addi	sp,sp,28
	tail	funcinst
.L301:
	lh	a4,14(sp)
	li	a2,108
	li	s0,0
	beq	a4,zero,.L297
.L305:
	addi	s0,a1,3
	andi	s0,s0,-4
	sub	s0,s0,a1
	slli	s0,s0,3
	li	a0,16
	add	s0,s0,a4
	sw	a5,4(sp)
	sw	a3,8(sp)
	sw	a2,0(sp)
	call	xmalloc
	lw	a3,8(sp)
	lw	a2,0(sp)
	mv	a4,a0
	srai	a1,s0,31
	li	a0,2
	sw	a0,0(a4)
	sw	s0,8(a4)
	sw	a1,12(a4)
	mv	a0,s1
	li	a1,14
	call	funcinst
	lw	a2,0(sp)
	lh	a4,12(sp)
	lw	a5,4(sp)
	sw	a2,0(sp)
	add	s0,a4,s0
	mv	a3,a0
	bne	s0,zero,.L306
.L298:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	mv	a0,a3
	addi	sp,sp,28
	jr	ra
	.size	funcbits, .-funcbits
	.section	.rodata.funcstore.str1.4,"aMS",@progbits,1
	.align	2
.LC38:
	.string	"Assertion `!lval.bits.before && !lval.bits.after || tp & PROPINT' failed"
	.align	2
.LC39:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/qbe.c:716  \n"
	.align	2
.LC40:
	.string	"Assertion `(align & align - 1) == 0' failed"
	.align	2
.LC41:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/qbe.c:651  \n"
	.align	2
.LC42:
	.string	"Assertion `tp & PROPSCALAR' failed"
	.align	2
.LC43:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/qbe.c:726  \n"
	.align	2
.LC44:
	.string	"mv %s, a0"
	.align	2
.LC45:
	.string	"volatile store is treated as normal store"
	.align	2
.LC46:
	.string	"restrict store is treated as normal store"
	.align	2
.LC47:
	.string	"cannot store to 'const' object"
	.section	.text.funcstore,"ax",@progbits
	.align	2
	.type	funcstore, @function
funcstore:
	mv	t0,a3
	lh	a5,4(t0)
	lw	a3,8(a3)
	addi	sp,sp,-72
	sw	s0,64(sp)
	sw	s1,60(sp)
	sw	a5,0(sp)
	sw	ra,68(sp)
	sw	a4,16(sp)
	lw	s1,0(t0)
	mv	s0,a0
	mv	t1,a1
	mv	a5,a2
	beq	a3,zero,.L308
	mv	a0,a3
	sw	t0,28(sp)
	sw	a2,24(sp)
	sw	a1,8(sp)
	call	strip_quotes
	mv	t2,a0
	li	a0,64
	sw	t2,4(sp)
	call	xmalloc
	lw	t2,4(sp)
	lla	a2,.LC44
	li	a1,64
	mv	a3,t2
	sw	t2,20(sp)
	sw	a0,4(sp)
	call	snprintf
	lw	t1,8(sp)
	addi	a0,sp,48
	mv	a1,t1
	sw	t1,12(sp)
	call	qbetype
	lbu	a5,48(sp)
	li	a0,16
	sw	a5,8(sp)
	call	xmalloc
	mv	a3,a0
	li	a0,8
	sw	a0,0(a3)
	lw	a0,4(sp)
	li	a4,0
	li	a2,0
	sw	a0,8(a3)
	li	a1,87
	mv	a0,s0
	call	funcinst
	lw	a3,16(sp)
	lw	a2,8(sp)
	li	a4,0
	li	a1,91
	mv	a0,s0
	call	funcinst
	lw	t2,20(sp)
	mv	a0,t2
	call	free
	lw	t0,28(sp)
	lw	a5,24(sp)
	lw	t1,12(sp)
.L308:
	andi	a4,a5,8
	bne	a4,zero,.L368
.L309:
	andi	a4,a5,4
	bne	a4,zero,.L369
.L310:
	andi	a5,a5,2
	bne	a5,zero,.L370
.L311:
	lw	a5,4(t0)
	lw	a4,4(t1)
	beq	a5,zero,.L312
	andi	a5,a4,2
	beq	a5,zero,.L371
.L312:
	lw	a5,0(t1)
	li	a3,10
	beq	a5,a3,.L316
	bgtu	a5,a3,.L317
	li	a3,9
	bne	a5,a3,.L319
	lla	t1,typeulong
.L319:
	andi	a4,a4,16
	beq	a4,zero,.L372
	mv	a1,t1
	addi	a0,sp,48
	sw	t0,8(sp)
	sw	t1,4(sp)
	call	qbetype
	lw	t0,8(sp)
	lw	a4,0(sp)
	lw	t2,16(sp)
	lh	a5,6(t0)
	lw	t1,4(sp)
	add	a5,a5,a4
	bne	a5,zero,.L373
.L333:
	lw	a1,56(sp)
	lw	a3,16(sp)
	mv	a4,s1
	mv	a0,s0
	li	a2,0
	sw	t2,0(sp)
	call	funcinst
	lw	t2,0(sp)
	lw	ra,68(sp)
	lw	s0,64(sp)
	lw	s1,60(sp)
	mv	a0,t2
	addi	sp,sp,72
	jr	ra
.L317:
	addi	a5,a5,-12
	li	a3,1
	bgtu	a5,a3,.L319
.L316:
	lw	a5,16(t1)
	lw	a4,8(t1)
	sw	a5,44(sp)
	lw	a5,20(t1)
	sw	a5,28(sp)
	addi	a5,a4,-1
	and	a4,a5,a4
	bne	a4,zero,.L374
	li	a4,3
	bgtu	a5,a4,.L338
	slli	a5,a5,2
	lla	a4,.LANCHOR4
	add	a4,a4,a5
	lla	a2,.LANCHOR3
	lw	a1,0(a4)
	add	a2,a2,a5
	lla	a4,.LANCHOR6
	lla	a3,.LANCHOR5
	add	a3,a3,a5
	add	a5,a4,a5
	lw	a4,0(a2)
	lw	a5,0(a5)
	sw	a1,20(sp)
	sw	a4,36(sp)
	lw	a4,0(a3)
	sw	a5,40(sp)
	srai	a5,a1,31
	sw	a4,32(sp)
	sw	a5,24(sp)
.L325:
	li	a0,16
	call	xmalloc
	li	a5,2
	sw	a5,0(a0)
	lw	a5,20(sp)
	sw	a0,12(sp)
	sw	zero,4(sp)
	sw	a5,8(a0)
	lw	a5,24(sp)
	sw	zero,0(sp)
	sw	a5,12(a0)
	lw	a5,16(sp)
	j	.L328
.L341:
	lw	a4,12(sp)
	mv	a3,a5
	li	a2,119
	li	a1,1
	mv	a0,s0
	call	funcinst
	lw	a4,12(sp)
	mv	a5,a0
	mv	a3,s1
	li	a2,119
	li	a1,1
	mv	a0,s0
	sw	a5,8(sp)
	call	funcinst
	lw	a5,8(sp)
	mv	s1,a0
.L328:
	lw	a2,36(sp)
	lw	a1,32(sp)
	mv	a3,a5
	li	a4,0
	mv	a0,s0
	sw	a5,8(sp)
	call	funcinst
	lw	a1,40(sp)
	mv	a3,a0
	mv	a4,s1
	li	a2,0
	mv	a0,s0
	call	funcinst
	lw	a5,4(sp)
	lw	a4,20(sp)
	lw	a3,24(sp)
	add	a4,a5,a4
	sltu	a2,a4,a5
	lw	a5,0(sp)
	sw	a4,4(sp)
	add	a3,a5,a3
	add	a5,a2,a3
	lw	a3,28(sp)
	sw	a5,0(sp)
	mv	a4,a5
	lw	a5,8(sp)
	bgtu	a3,a4,.L341
	mv	a4,a3
	lw	a3,0(sp)
	bne	a4,a3,.L339
	lw	a4,44(sp)
	lw	a3,4(sp)
	bgtu	a4,a3,.L341
.L339:
	lw	t2,16(sp)
	lw	ra,68(sp)
	lw	s0,64(sp)
	lw	s1,60(sp)
	mv	a0,t2
	addi	sp,sp,72
	jr	ra
.L373:
	lw	a3,16(t1)
	li	a4,8
	sub	a4,a4,a3
	slli	a4,a4,3
	add	a5,a4,a5
	addi	a3,a5,-32
	blt	a3,zero,.L334
	li	a4,-1
	srl	a4,a4,a3
	li	a5,0
.L335:
	lw	a3,0(sp)
	addi	a3,a3,-32
	blt	a3,zero,.L336
	sll	a5,a4,a3
	sw	a5,12(sp)
	sw	zero,8(sp)
.L337:
	lbu	a5,48(sp)
	li	a0,16
	sw	t0,24(sp)
	sw	t1,20(sp)
	sw	a5,4(sp)
	call	xmalloc
	lw	t1,0(sp)
	lw	a3,16(sp)
	lw	a2,4(sp)
	mv	a4,a0
	li	a5,2
	srai	a0,t1,31
	sw	a5,0(a4)
	sw	t1,8(a4)
	sw	a0,12(a4)
	li	a1,14
	mv	a0,s0
	call	funcinst
	lw	t0,24(sp)
	lw	t1,20(sp)
	mv	a2,a0
	lw	a3,4(t0)
	mv	a1,t1
	sw	a0,0(sp)
	mv	a0,s0
	call	funcbits
	mv	t2,a0
	li	a0,16
	sw	t2,20(sp)
	call	xmalloc
	lw	a2,0(sp)
	li	a5,2
	sw	a5,0(a0)
	mv	a4,a0
	lw	t1,12(sp)
	lw	a0,8(sp)
	mv	a3,a2
	lw	a2,4(sp)
	sw	a0,8(a4)
	sw	t1,12(a4)
	li	a1,11
	mv	a0,s0
	call	funcinst
	lw	a1,52(sp)
	lw	a2,4(sp)
	mv	t1,a0
	li	a4,0
	mv	a3,s1
	mv	a0,s0
	sw	t1,16(sp)
	call	funcinst
	mv	a3,a0
	li	a0,16
	sw	a3,0(sp)
	call	xmalloc
	lw	t1,12(sp)
	mv	a4,a0
	lw	a0,8(sp)
	not	a2,t1
	sw	a2,12(a4)
	lw	a3,0(sp)
	lw	a2,4(sp)
	li	a5,2
	not	a0,a0
	sw	a5,0(a4)
	sw	a0,8(a4)
	li	a1,11
	mv	a0,s0
	call	funcinst
	lw	t1,16(sp)
	lw	a2,4(sp)
	mv	a4,a0
	mv	a3,t1
	li	a1,9
	mv	a0,s0
	call	funcinst
	lw	t2,20(sp)
	sw	a0,16(sp)
	j	.L333
.L370:
	lla	a1,.LC47
	lla	a0,tok+8
	sw	t0,8(sp)
	sw	t1,4(sp)
	call	error
	lw	t0,8(sp)
	lw	t1,4(sp)
	j	.L311
.L369:
	lla	a0,.LC46
	sw	t0,12(sp)
	sw	a5,8(sp)
	sw	t1,4(sp)
	call	warn
	lw	a5,8(sp)
	lw	t0,12(sp)
	lw	t1,4(sp)
	andi	a5,a5,-5
	j	.L310
.L368:
	lla	a0,.LC45
	sw	t0,12(sp)
	sw	a5,8(sp)
	sw	t1,4(sp)
	call	warn
	lw	a5,8(sp)
	lw	t0,12(sp)
	lw	t1,4(sp)
	andi	a5,a5,-9
	j	.L309
.L338:
	li	a5,17
	sw	a5,40(sp)
	li	a5,23
	sw	a5,32(sp)
	li	a5,8
	sw	a5,20(sp)
	li	a5,108
	sw	zero,24(sp)
	sw	a5,36(sp)
	j	.L325
.L334:
	li	a4,31
	sub	a4,a4,a5
	li	a3,-1
	li	a2,-2
	sll	a2,a2,a4
	srl	a4,a3,a5
	or	a4,a2,a4
	srl	a5,a3,a5
	j	.L335
.L336:
	lw	a1,0(sp)
	li	a2,31
	srli	a3,a4,1
	sub	a2,a2,a1
	srl	a3,a3,a2
	sll	a5,a5,a1
	or	a5,a3,a5
	sw	a5,12(sp)
	sll	a5,a4,a1
	sw	a5,8(sp)
	j	.L337
.L371:
	lla	s0,.LC18
	li	a0,65
.L313:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L313
	lla	s0,.LC38
	li	a0,65
.L314:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L314
	lla	s0,.LC39
	li	a0,32
.L315:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L315
.L324:
	li	a0,1
	call	halt
.L372:
	lla	s0,.LC18
	li	a0,65
.L330:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L330
	lla	s0,.LC42
	li	a0,65
.L331:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L331
	lla	s0,.LC43
	li	a0,32
.L332:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L332
	j	.L324
.L374:
	lla	s0,.LC18
	li	a0,65
.L321:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L321
	lla	s0,.LC40
	li	a0,65
.L322:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L322
	lla	s0,.LC41
	li	a0,32
.L323:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L323
	j	.L324
	.size	funcstore, .-funcstore
	.section	.rodata.convert.str1.4,"aMS",@progbits,1
	.align	2
.LC48:
	.string	"internal error; unsupported conversion"
	.align	2
.LC49:
	.string	"internal error; unknown integer conversion"
	.align	2
.LC50:
	.string	"internal error; unknown non-integer conversion"
	.align	2
.LC51:
	.string	"internal error; unknown float conversion"
	.section	.text.convert,"ax",@progbits
	.align	2
	.type	convert, @function
convert:
	mv	a5,a2
	lw	a2,0(a2)
	addi	sp,sp,-24
	sw	s0,16(sp)
	sw	s1,12(sp)
	sw	ra,20(sp)
	li	a4,9
	mv	s1,a0
	mv	s0,a1
	bne	a2,a4,.L376
	lla	a5,typeulong
.L376:
	lw	a2,0(s0)
	li	a4,9
	bne	a2,a4,.L377
	lla	s0,typeulong
	lw	a2,0(s0)
.L377:
	li	a4,1
	beq	a2,a4,.L404
	lw	a4,4(a5)
	andi	a4,a4,4
	beq	a4,zero,.L379
	lw	a4,4(s0)
	andi	a4,a4,4
	beq	a4,zero,.L379
	li	a4,2
	beq	a2,a4,.L431
.L381:
	lw	a4,4(s0)
	andi	a4,a4,2
	beq	a4,zero,.L393
	lw	a0,16(s0)
	li	a4,8
	lw	a1,20(s0)
	beq	a0,a4,.L432
.L412:
	li	a2,119
.L394:
	lw	a4,4(a5)
	andi	a4,a4,2
	beq	a4,zero,.L396
	lw	t1,20(a5)
	lw	a4,16(a5)
	bleu	a1,t1,.L433
.L413:
	li	a1,2
	beq	a4,a1,.L434
.L414:
	li	a1,4
	beq	a4,a1,.L435
.L415:
	li	a1,1
	beq	a4,a1,.L436
.L391:
	lla	a0,.LC49
	call	fatal
	li	a0,0
.L375:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L379:
	lla	a0,.LC48
	sw	a3,4(sp)
	sw	a5,0(sp)
	call	fatal
	lw	a2,0(s0)
	li	a4,2
	lw	a3,4(sp)
	lw	a5,0(sp)
	bne	a2,a4,.L381
.L431:
	lw	a4,4(a5)
	sw	a3,8(sp)
	sw	a2,4(sp)
	sw	a5,0(sp)
	andi	a4,a4,2
	beq	a4,zero,.L382
	li	a0,16
	call	xmalloc
	lw	a5,0(sp)
	lw	a2,4(sp)
	li	a3,0
	lw	a4,16(a5)
	sw	a2,0(a0)
	li	a2,0
	sw	a2,8(a0)
	sw	a3,12(a0)
	li	a2,4
	lw	a5,20(a5)
	lw	a3,8(sp)
	mv	s0,a0
	beq	a4,a2,.L437
	bne	a5,zero,.L385
	li	a2,4
	bgtu	a4,a2,.L385
	li	a5,1
	beq	a4,a5,.L420
	li	a5,2
	bne	a4,a5,.L391
	li	a4,0
	li	a2,119
	li	a1,71
.L428:
	mv	a0,s1
	call	funcinst
	mv	a3,a0
.L429:
	mv	a4,s0
	lw	s0,16(sp)
	lw	ra,20(sp)
	mv	a0,s1
	lw	s1,12(sp)
	li	a1,33
	li	a2,119
	addi	sp,sp,24
	tail	funcinst
.L437:
	beq	a5,zero,.L429
.L385:
	li	a2,8
	bne	a4,a2,.L391
	li	a1,43
	li	a2,119
	bne	a5,zero,.L391
	mv	a4,s0
	lw	s0,16(sp)
	lw	ra,20(sp)
	mv	a0,s1
	lw	s1,12(sp)
	addi	sp,sp,24
	tail	funcinst
.L393:
	lla	a0,.LC51
	sw	a3,0(sp)
	call	fatal
	lw	a3,0(sp)
	li	a2,119
	li	a1,0
	li	s0,0
.L383:
	mv	a4,s0
	lw	s0,16(sp)
	lw	ra,20(sp)
	mv	a0,s1
	lw	s1,12(sp)
	addi	sp,sp,24
	tail	funcinst
.L432:
	li	a2,108
	bne	a1,zero,.L412
	j	.L394
.L433:
	bne	a1,t1,.L408
	bgtu	a0,a4,.L413
.L408:
	mv	a0,a3
	j	.L375
.L396:
	lla	a0,.LC51
	sw	a3,4(sp)
	sw	a2,0(sp)
	li	s0,0
	call	fatal
	mv	a4,s0
	lw	s0,16(sp)
	lw	a2,0(sp)
	lw	a3,4(sp)
	lw	ra,20(sp)
	mv	a0,s1
	lw	s1,12(sp)
	li	a1,0
	addi	sp,sp,24
	tail	funcinst
.L404:
	li	a0,0
	j	.L375
.L436:
	bne	t1,zero,.L391
	lbu	a5,48(a5)
	li	a1,73
	li	s0,0
	sub	a1,a1,a5
	j	.L383
.L435:
	bne	t1,zero,.L415
	lbu	a5,48(a5)
	li	a1,69
	li	s0,0
	sub	a1,a1,a5
	j	.L383
.L382:
	lla	a0,.LC50
	call	fatal
	li	a0,0
	j	.L375
.L420:
	li	a4,0
	li	a2,119
	li	a1,73
	j	.L428
.L434:
	bne	t1,zero,.L414
	lbu	a5,48(a5)
	li	a1,71
	li	s0,0
	sub	a1,a1,a5
	j	.L383
	.size	convert, .-convert
	.section	.rodata.funcload.str1.4,"aMS",@progbits,1
	.align	2
.LC52:
	.string	"mv a0, %s"
	.section	.text.funcload,"ax",@progbits
	.align	2
	.type	funcload, @function
funcload:
	lw	a4,8(a2)
	addi	sp,sp,-40
	sw	s0,32(sp)
	sw	ra,36(sp)
	sw	s1,28(sp)
	sw	a0,0(sp)
	lw	a3,0(a2)
	mv	a5,a2
	mv	s0,a1
	beq	a4,zero,.L439
	mv	a0,a4
	sw	a2,4(sp)
	sw	a3,8(sp)
	call	strip_quotes
	mv	s1,a0
	call	get_ret_reg
	mv	a1,a0
	mv	a0,s1
	call	strcmp
	lw	a5,4(sp)
	beq	a0,zero,.L447
	li	a0,64
	sw	a5,12(sp)
	call	xmalloc
	mv	a3,s1
	lla	a2,.LC52
	li	a1,64
	sw	a0,8(sp)
	call	snprintf
	mv	a1,s0
	addi	a0,sp,16
	call	qbetype
	lbu	a2,16(sp)
	li	a0,16
	sw	a2,4(sp)
	call	xmalloc
	mv	a3,a0
	lw	t0,8(sp)
	li	a0,8
	sw	a0,0(a3)
	lw	a2,4(sp)
	lw	a0,0(sp)
	li	a1,87
	sw	t0,8(a3)
	li	a4,0
	call	funcinst
	mv	a2,a0
	mv	a0,s1
	mv	s1,a2
	call	free
	lw	a5,12(sp)
	mv	a1,s0
	lw	s0,32(sp)
	lw	a0,0(sp)
	lw	ra,36(sp)
	lw	a3,4(a5)
	mv	a2,s1
	lw	s1,28(sp)
	addi	sp,sp,40
	tail	funcbits
.L447:
	mv	a0,s1
	call	free
	lw	a5,4(sp)
	lw	a3,8(sp)
.L439:
	lw	a4,0(s0)
	li	a2,10
	beq	a4,a2,.L438
	addi	a4,a4,-12
	li	a2,1
	bgtu	a4,a2,.L448
.L438:
	lw	ra,36(sp)
	lw	s0,32(sp)
	lw	s1,28(sp)
	mv	a0,a3
	addi	sp,sp,40
	jr	ra
.L448:
	mv	a1,s0
	addi	a0,sp,16
	sw	a5,8(sp)
	sw	a3,4(sp)
	call	qbetype
	lw	s1,0(sp)
	lbu	a2,16(sp)
	lw	a1,20(sp)
	lw	a3,4(sp)
	mv	a0,s1
	li	a4,0
	call	funcinst
	lw	a5,8(sp)
	mv	a1,s0
	lw	s0,32(sp)
	lw	ra,36(sp)
	lw	a3,4(a5)
	mv	a2,a0
	mv	a0,s1
	lw	s1,28(sp)
	addi	sp,sp,40
	tail	funcbits
	.size	funcload, .-funcload
	.section	.text.zero,"ax",@progbits
	.align	2
	.type	zero, @function
zero:
	addi	sp,sp,-64
	lw	t2,64(sp)
	sw	s0,52(sp)
	sw	ra,56(sp)
	sw	s1,48(sp)
	sw	t2,4(sp)
	sw	a5,60(sp)
	sw	a0,0(sp)
	sw	a1,40(sp)
	sw	a5,44(sp)
	mv	t1,a4
	mv	s0,a2
	mv	t0,a3
	bleu	t2,a4,.L471
.L450:
	addi	a5,s0,-1
	sw	a5,12(sp)
	srai	a4,s0,31
	srai	a5,a5,31
	sw	a4,20(sp)
	sw	a5,16(sp)
	li	s1,1
.L466:
	lw	a5,12(sp)
	and	a3,t0,a5
	lw	a5,16(sp)
	sub	a3,s0,a3
	sgtu	a2,a3,s0
	and	a4,t1,a5
	lw	a5,20(sp)
	and	a3,a3,s1
	sub	a4,a5,a4
	sub	a4,a4,a2
	srai	a5,s1,31
	and	a4,a4,a5
	or	a3,a3,a4
	beq	a3,zero,.L452
	lw	a3,40(sp)
	or	a4,t0,t1
	sw	a3,8(sp)
	bne	a4,zero,.L472
.L454:
	lw	a4,0(sp)
	lla	a2,.LANCHOR7
	lw	a3,24(a4)
	slli	a4,s1,2
	add	a4,a2,a4
	lw	a4,0(a4)
	lw	a3,72(a3)
	sw	a4,24(sp)
	bne	a3,zero,.L473
.L456:
	li	a0,32
	sw	t1,36(sp)
	sw	t0,32(sp)
	sw	a5,28(sp)
	call	xmalloc
	lw	a5,0(sp)
	lla	a3,.LANCHOR8
	mv	a1,a0
	lw	a4,24(a5)
	lw	a5,24(sp)
	sw	a3,24(a0)
	sw	zero,4(a0)
	sw	a5,0(a0)
	lw	a5,8(sp)
	sw	zero,8(a0)
	sw	a5,28(a0)
	addi	a0,a4,16
	call	arrayaddptr
	lw	t0,32(sp)
	lw	t1,36(sp)
	lw	a5,28(sp)
	add	a4,t0,s1
	sltu	a3,a4,t0
	add	a5,t1,a5
	mv	t0,a4
	add	t1,a3,a5
.L452:
	ble	s0,s1,.L457
	slli	s1,s1,1
.L457:
	lw	a5,4(sp)
	bgtu	a5,t1,.L466
	bne	a5,t1,.L449
	lw	a5,44(sp)
	bgtu	a5,t0,.L466
.L449:
	lw	ra,56(sp)
	lw	s0,52(sp)
	lw	s1,48(sp)
	addi	sp,sp,64
	jr	ra
.L473:
	li	a0,96
	sw	t1,36(sp)
	sw	t0,32(sp)
	sw	a5,28(sp)
	call	xmalloc
	lw	a5,0(sp)
	lla	a3,.LANCHOR2
	lw	a4,0(a3)
	lw	a2,24(a5)
	li	a1,7
	sw	a1,0(a0)
	addi	a4,a4,1
	lla	a1,.LC37
	sw	a1,8(a0)
	sw	a4,4(a0)
	sw	zero,16(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,72(a0)
	sw	zero,56(a0)
	sw	zero,88(a0)
	sw	a0,88(a2)
	sw	a0,24(a5)
	lw	t1,36(sp)
	lw	t0,32(sp)
	lw	a5,28(sp)
	sw	a4,0(a3)
	j	.L456
.L472:
	li	a0,16
	sw	a5,32(sp)
	sw	t1,24(sp)
	sw	t0,8(sp)
	call	xmalloc
	lw	t0,8(sp)
	lw	t1,24(sp)
	li	a3,2
	sw	a3,0(a0)
	sw	t0,8(a0)
	sw	t1,12(a0)
	mv	a4,a0
	lw	a3,40(sp)
	lw	a0,0(sp)
	li	a2,119
	li	a1,1
	sw	t0,28(sp)
	call	funcinst
	lw	a5,32(sp)
	lw	t0,28(sp)
	lw	t1,24(sp)
	sw	a0,8(sp)
	j	.L454
.L471:
	bne	t2,a4,.L449
	lw	a5,44(sp)
	bgtu	a5,a3,.L450
	j	.L449
	.size	zero, .-zero
	.section	.rodata.casesearch.str1.4,"aMS",@progbits,1
	.align	2
.LC53:
	.string	"switch_ne"
	.align	2
.LC54:
	.string	"switch_lt"
	.align	2
.LC55:
	.string	"switch_gt"
	.section	.text.casesearch,"ax",@progbits
	.align	2
	.type	casesearch, @function
casesearch:
	addi	sp,sp,-44
	sw	s1,32(sp)
	sw	ra,40(sp)
	sw	s0,36(sp)
	sw	a3,0(sp)
	sw	a1,8(sp)
	sw	a2,4(sp)
	sw	a4,28(sp)
	mv	s1,a0
	beq	a3,zero,.L497
.L475:
	li	a0,96
	call	xmalloc
	lla	a3,.LANCHOR2
	lw	a5,0(a3)
	li	a1,7
	lla	a4,.LC53
	addi	a5,a5,1
	sw	a5,4(a0)
	sw	a1,0(a0)
	sw	a4,8(a0)
	sw	zero,16(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,72(a0)
	sw	zero,56(a0)
	sw	zero,88(a0)
	sw	a0,24(sp)
	li	a0,96
	mv	s0,a3
	sw	a5,0(a3)
	call	xmalloc
	lw	a4,0(s0)
	li	a1,7
	lla	a2,.LC54
	addi	a4,a4,1
	sw	a1,0(a0)
	sw	a2,8(a0)
	sw	a4,4(a0)
	sw	zero,16(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,72(a0)
	sw	zero,56(a0)
	sw	zero,88(a0)
	sw	a0,20(sp)
	li	a0,96
	sw	a4,0(s0)
	call	xmalloc
	lw	a3,0(sp)
	lw	a4,0(s0)
	li	a1,7
	lw	a2,0(a3)
	lw	a3,4(a3)
	addi	a4,a4,1
	mv	a5,s0
	sw	a3,16(sp)
	lla	a3,.LC55
	sw	a3,8(a0)
	sw	a4,4(a0)
	sw	a1,0(a0)
	sw	zero,16(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,72(a0)
	sw	zero,56(a0)
	sw	zero,88(a0)
	mv	s0,a0
	li	a0,16
	sw	a4,0(a5)
	sw	a2,12(sp)
	call	xmalloc
	lw	a3,16(sp)
	lw	a2,12(sp)
	li	t2,2
	sw	a3,12(a0)
	lw	a3,8(sp)
	sw	a2,8(a0)
	sw	t2,0(a0)
	li	a2,119
	lw	a5,20(sp)
	lw	t1,24(sp)
	mv	a4,a0
	beq	a3,a2,.L498
	lw	a3,4(sp)
	sw	a0,12(sp)
	li	a2,119
	li	a1,42
	mv	a0,s1
	sw	t1,24(sp)
	sw	a5,20(sp)
	call	funcinst
	lw	a3,24(s1)
	lw	a5,0(sp)
	lw	a4,12(sp)
	lw	a2,72(a3)
	lw	a1,24(a5)
	lw	t1,24(sp)
	lw	a5,20(sp)
	li	t2,2
	bne	a2,zero,.L496
	sw	t2,72(a3)
	sw	a0,76(a3)
	sw	a1,80(a3)
	sw	t1,84(a3)
.L496:
	sw	t1,88(a3)
	li	a1,49
.L481:
	lw	a3,4(sp)
	sw	t1,24(s1)
	li	a2,119
	mv	a0,s1
	sw	a5,12(sp)
	call	funcinst
	lw	a4,24(s1)
	lw	a5,12(sp)
	lw	a3,72(a4)
	bne	a3,zero,.L479
	li	a3,2
	sw	a3,72(a4)
	sw	a0,76(a4)
	sw	a5,80(a4)
	sw	s0,84(a4)
.L479:
	lw	a3,0(sp)
	lw	a2,4(sp)
	lw	a1,8(sp)
	lw	a3,8(a3)
	sw	a5,88(a4)
	lw	a4,28(sp)
	sw	a5,24(s1)
	mv	a0,s1
	call	casesearch
	lw	a3,0(sp)
	lw	a5,24(s1)
	lw	a4,12(a3)
	sw	s0,88(a5)
	sw	s0,24(s1)
	sw	a4,0(sp)
	bne	a4,zero,.L475
.L480:
	lw	a5,72(s0)
	bne	a5,zero,.L474
	li	a5,1
	sw	a5,72(s0)
	lw	a5,28(sp)
	sw	a5,80(s0)
.L474:
	lw	ra,40(sp)
	lw	s0,36(sp)
	lw	s1,32(sp)
	addi	sp,sp,44
	jr	ra
.L498:
	lw	a3,4(sp)
	sw	a0,12(sp)
	li	a2,119
	li	a1,32
	mv	a0,s1
	sw	t1,24(sp)
	sw	a5,20(sp)
	call	funcinst
	lw	a3,24(s1)
	lw	a5,0(sp)
	lw	a4,12(sp)
	lw	a2,72(a3)
	lw	a1,24(a5)
	lw	t1,24(sp)
	lw	a5,20(sp)
	li	t2,2
	bne	a2,zero,.L495
	sw	t2,72(a3)
	sw	a0,76(a3)
	sw	a1,80(a3)
	sw	t1,84(a3)
.L495:
	sw	t1,88(a3)
	li	a1,39
	j	.L481
.L497:
	lw	s0,24(a0)
	j	.L480
	.size	casesearch, .-casesearch
	.section	.rodata.switchcase.str1.4,"aMS",@progbits,1
	.align	2
.LC56:
	.string	"multiple 'case' labels with same value"
	.section	.text.switchcase,"ax",@progbits
	.align	2
	.globl	switchcase
	.hidden	switchcase
	.type	switchcase, @function
switchcase:
	addi	sp,sp,-12
	sw	s1,0(sp)
	mv	s1,a3
	li	a3,32
	sw	s0,4(sp)
	sw	ra,8(sp)
	call	treeinsert
	lbu	a5,20(a0)
	mv	s0,a0
	beq	a5,zero,.L502
	sw	s1,24(s0)
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L502:
	lla	a1,.LC56
	lla	a0,tok+8
	call	error
	lw	ra,8(sp)
	sw	s1,24(s0)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	switchcase, .-switchcase
	.section	.text.mkblock,"ax",@progbits
	.align	2
	.globl	mkblock
	.hidden	mkblock
	.type	mkblock, @function
mkblock:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a0
	li	a0,96
	sw	ra,8(sp)
	call	xmalloc
	lla	a3,.LANCHOR2
	lw	a4,0(a3)
	lw	ra,8(sp)
	sw	s0,8(a0)
	lw	s0,4(sp)
	addi	a4,a4,1
	li	a2,7
	sw	a2,0(a0)
	sw	a4,0(a3)
	sw	a4,4(a0)
	sw	zero,16(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,72(a0)
	sw	zero,56(a0)
	sw	zero,88(a0)
	addi	sp,sp,12
	jr	ra
	.size	mkblock, .-mkblock
	.section	.text.mkglobal,"ax",@progbits
	.align	2
	.globl	mkglobal
	.hidden	mkglobal
	.type	mkglobal, @function
mkglobal:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a0
	li	a0,16
	sw	ra,8(sp)
	call	xmalloc
	lw	a4,4(s0)
	li	a5,1
	sw	a5,0(a0)
	beq	a4,a5,.L512
.L506:
	lw	a5,24(s0)
	beq	a5,zero,.L507
.L513:
	sw	a5,8(a0)
	li	a5,0
.L508:
	lw	ra,8(sp)
	lw	s0,4(sp)
	sw	a5,4(a0)
	addi	sp,sp,12
	jr	ra
.L512:
	lw	a5,44(s0)
	bne	a5,a4,.L506
	li	a5,17
	sw	a5,0(a0)
	lw	a5,24(s0)
	bne	a5,zero,.L513
.L507:
	lw	a3,0(s0)
	lw	a4,8(s0)
	li	a5,0
	sw	a3,8(a0)
	bne	a4,zero,.L508
	lla	a4,.LANCHOR9
	lw	a5,0(a4)
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	a5,a5,1
	sw	a5,0(a4)
	sw	a5,4(a0)
	addi	sp,sp,12
	jr	ra
	.size	mkglobal, .-mkglobal
	.section	.text.mkintconst,"ax",@progbits
	.align	2
	.globl	mkintconst
	.hidden	mkintconst
	.type	mkintconst, @function
mkintconst:
	addi	sp,sp,-12
	sw	s1,0(sp)
	mv	s1,a0
	li	a0,16
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a1
	call	xmalloc
	lw	ra,8(sp)
	sw	s0,12(a0)
	lw	s0,4(sp)
	li	a4,2
	sw	s1,8(a0)
	sw	a4,0(a0)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	mkintconst, .-mkintconst
	.section	.text.delfunc,"ax",@progbits
	.align	2
	.globl	delfunc
	.hidden	delfunc
	.type	delfunc, @function
delfunc:
	addi	sp,sp,-16
	sw	s1,4(sp)
	lw	s1,20(a0)
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	a0,0(sp)
	beq	s1,zero,.L517
.L520:
	lw	a3,88(s1)
	lw	a4,0(sp)
	lw	a5,20(s1)
	lw	s0,16(s1)
	sw	a3,20(a4)
	beq	a5,zero,.L521
.L519:
	lw	a0,0(s0)
	addi	s0,s0,4
	call	free
	lw	a0,16(s1)
	lw	a5,20(s1)
	add	a5,a0,a5
	bne	s0,a5,.L519
	call	free
	mv	a0,s1
	call	free
	lw	a5,0(sp)
	lw	s1,20(a5)
	bne	s1,zero,.L520
.L517:
	lw	s0,0(sp)
	lla	a1,free
	addi	a0,s0,28
	call	mapfree
	mv	a0,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	free
.L521:
	mv	a0,s0
	call	free
	mv	a0,s1
	call	free
	lw	a5,0(sp)
	lw	s1,20(a5)
	bne	s1,zero,.L520
	j	.L517
	.size	delfunc, .-delfunc
	.section	.text.functype,"ax",@progbits
	.align	2
	.globl	functype
	.hidden	functype
	.type	functype, @function
functype:
	lw	a0,16(a0)
	ret
	.size	functype, .-functype
	.section	.text.funclabel,"ax",@progbits
	.align	2
	.globl	funclabel
	.hidden	funclabel
	.type	funclabel, @function
funclabel:
	lw	a5,24(a0)
	sw	a1,88(a5)
	sw	a1,24(a0)
	ret
	.size	funclabel, .-funclabel
	.section	.text.funcjmp,"ax",@progbits
	.align	2
	.globl	funcjmp
	.hidden	funcjmp
	.type	funcjmp, @function
funcjmp:
	lw	a5,24(a0)
	lw	a4,72(a5)
	bne	a4,zero,.L530
	li	a4,1
	sw	a4,72(a5)
	sw	a1,80(a5)
.L530:
	ret
	.size	funcjmp, .-funcjmp
	.section	.rodata.funcjnz.str1.4,"aMS",@progbits,1
	.align	2
.LC57:
	.string	"Assertion `t->prop & PROPSCALAR' failed"
	.align	2
.LC58:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/qbe.c:854  \n"
	.section	.text.funcjnz,"ax",@progbits
	.align	2
	.globl	funcjnz
	.hidden	funcjnz
	.type	funcjnz, @function
funcjnz:
	addi	sp,sp,-16
	sw	s0,8(sp)
	lw	s0,24(a0)
	sw	ra,12(sp)
	sw	s1,4(sp)
	lw	t2,72(s0)
	bne	t2,zero,.L532
	mv	a5,a2
	mv	t0,a3
	mv	s1,a4
	beq	a2,zero,.L534
	lw	a4,4(a2)
	andi	a3,a4,16
	beq	a3,zero,.L555
	andi	a4,a4,2
	lw	t2,16(a2)
	lw	a3,20(a2)
	mv	t1,a0
	beq	a4,zero,.L539
	beq	a3,zero,.L556
.L543:
	mv	a3,a1
	mv	a2,a5
	lla	a1,typebool
	mv	a0,t1
	sw	t0,0(sp)
	call	convert
	lw	t0,0(sp)
	mv	a1,a0
.L534:
	li	a5,2
	sw	a5,72(s0)
	sw	a1,76(s0)
	sw	t0,80(s0)
	sw	s1,84(s0)
.L532:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L539:
	bne	a3,zero,.L543
.L546:
	li	a4,4
	bleu	t2,a4,.L534
	j	.L543
.L556:
	li	a4,3
	bgtu	t2,a4,.L546
	mv	a3,a1
	lla	a1,typeint
	sw	t0,0(sp)
	call	convert
	lw	t0,0(sp)
	mv	a1,a0
	j	.L534
.L555:
	lla	s0,.LC18
	li	a0,65
.L536:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L536
	lla	s0,.LC57
	li	a0,65
.L537:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L537
	lla	s0,.LC58
	li	a0,32
.L538:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L538
	li	a0,1
	call	halt
	.size	funcjnz, .-funcjnz
	.section	.text.funcret,"ax",@progbits
	.align	2
	.globl	funcret
	.hidden	funcret
	.type	funcret, @function
funcret:
	lw	a5,24(a0)
	lw	a4,72(a5)
	bne	a4,zero,.L557
	li	a4,3
	sw	a4,72(a5)
	sw	a1,76(a5)
.L557:
	ret
	.size	funcret, .-funcret
	.section	.text.funchlt,"ax",@progbits
	.align	2
	.globl	funchlt
	.hidden	funchlt
	.type	funchlt, @function
funchlt:
	lw	a5,24(a0)
	lw	a4,72(a5)
	bne	a4,zero,.L559
	li	a4,4
	sw	a4,72(a5)
.L559:
	ret
	.size	funchlt, .-funchlt
	.section	.text.funcgoto,"ax",@progbits
	.align	2
	.globl	funcgoto
	.hidden	funcgoto
	.type	funcgoto, @function
funcgoto:
	addi	sp,sp,-28
	sw	s1,16(sp)
	mv	s1,a0
	mv	a0,a1
	sw	ra,24(sp)
	sw	s0,20(sp)
	mv	s0,a1
	call	strlen
	mv	a2,a0
	mv	a1,s0
	addi	a0,sp,4
	call	mapkey
	addi	a1,sp,4
	addi	a0,s1,28
	call	mapput
	lw	a5,0(a0)
	beq	a5,zero,.L564
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	mv	a0,a5
	addi	sp,sp,28
	jr	ra
.L564:
	mv	s1,a0
	li	a0,8
	call	xmalloc
	mv	a5,a0
	li	a0,96
	sw	a5,0(sp)
	call	xmalloc
	lla	a3,.LANCHOR2
	lw	a4,0(a3)
	lw	a5,0(sp)
	li	a2,7
	addi	a4,a4,1
	sw	s0,8(a0)
	sw	a2,0(a0)
	sw	a4,4(a0)
	sw	zero,16(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,72(a0)
	sw	zero,56(a0)
	sw	zero,88(a0)
	lw	ra,24(sp)
	lw	s0,20(sp)
	sw	a0,0(a5)
	sw	a5,0(s1)
	sw	a4,0(a3)
	lw	s1,16(sp)
	mv	a0,a5
	addi	sp,sp,28
	jr	ra
	.size	funcgoto, .-funcgoto
	.globl	__mulsi3
	.section	.text.funcinit,"ax",@progbits
	.align	2
	.globl	funcinit
	.hidden	funcinit
	.type	funcinit, @function
funcinit:
	lw	a5,24(a1)
	addi	sp,sp,-88
	sw	s0,80(sp)
	sw	s1,76(sp)
	sw	ra,84(sp)
	sw	a1,12(sp)
	sw	a3,4(sp)
	mv	s1,a0
	mv	s0,a2
	sw	a5,72(sp)
	call	funcalloc
	lw	a4,4(sp)
	beq	a4,zero,.L565
	sw	zero,32(sp)
	sw	zero,28(sp)
	beq	s0,zero,.L567
	li	a3,0
	li	a4,0
	j	.L583
.L607:
	beq	a4,a5,.L603
.L581:
	lw	s0,24(s0)
	beq	s0,zero,.L567
.L583:
	lw	a1,12(sp)
	lw	t0,4(s0)
	lw	a5,0(s0)
	lw	a2,12(a1)
	lw	a1,20(a1)
	mv	a0,s1
	lw	a2,8(a2)
	sw	t0,0(sp)
	sw	a3,8(sp)
	sw	a4,4(sp)
	sw	a5,56(sp)
	sw	t0,60(sp)
	call	zero
	lw	a5,16(s0)
	lw	a0,20(s0)
	li	a2,2
	lw	a1,0(a5)
	sw	a0,68(sp)
	lw	a4,4(sp)
	lw	a3,8(sp)
	beq	a1,a2,.L604
	lw	t0,12(s0)
	lw	a5,8(s0)
	bgtu	t0,a4,.L586
	bne	t0,a4,.L577
	bleu	a5,a3,.L577
.L586:
	lw	a2,68(sp)
	bne	a2,zero,.L605
.L577:
	lw	a4,12(sp)
	lw	a2,0(s0)
	lw	a5,4(s0)
	lw	t1,20(a4)
	or	a4,a2,a5
	bne	a4,zero,.L606
.L579:
	lw	a1,16(s0)
	mv	a0,s1
	sw	t1,4(sp)
	call	funcexpr
	lw	a5,16(s0)
	lw	t1,4(sp)
	mv	a4,a0
	lw	a1,8(a5)
	lw	a5,68(sp)
	addi	a3,sp,40
	li	a2,0
	sw	a5,44(sp)
	lw	a5,72(sp)
	mv	a0,s1
	sw	t1,64(sp)
	sw	t1,40(sp)
	sw	a5,48(sp)
	call	funcstore
	lw	a3,8(s0)
	lw	a4,12(s0)
.L576:
	lw	a5,28(sp)
	bleu	a4,a5,.L607
	sw	a3,32(sp)
	sw	a4,28(sp)
.L608:
	lw	s0,24(s0)
	bne	s0,zero,.L583
.L567:
	lw	a5,12(sp)
	lw	a3,32(sp)
	mv	a0,s1
	lw	a4,12(a5)
	lw	a1,20(a5)
	lw	t1,20(a4)
	lw	a5,16(a4)
	lw	a2,8(a4)
	lw	a4,28(sp)
	sw	t1,0(sp)
	sw	a5,56(sp)
	sw	t1,60(sp)
	call	zero
.L565:
	lw	ra,84(sp)
	lw	s0,80(sp)
	lw	s1,76(sp)
	addi	sp,sp,88
	jr	ra
.L606:
	li	a0,16
	sw	a5,16(sp)
	sw	a2,8(sp)
	sw	t1,4(sp)
	call	xmalloc
	lw	t1,4(sp)
	lw	a2,8(sp)
	lw	a5,16(sp)
	li	a1,2
	sw	a1,0(a0)
	sw	a2,8(a0)
	mv	a4,a0
	mv	a3,t1
	sw	a5,12(a0)
	li	a2,119
	li	a1,1
	mv	a0,s1
	call	funcinst
	mv	t1,a0
	j	.L579
.L603:
	lw	a5,32(sp)
	bleu	a3,a5,.L581
	sw	a3,32(sp)
	sw	a4,28(sp)
	j	.L608
.L604:
	lw	a2,8(a5)
	lw	a3,0(s0)
	lw	a5,32(a5)
	lw	a2,28(a2)
	sw	zero,4(sp)
	sw	zero,8(sp)
	lw	a2,16(a2)
	lw	a4,4(s0)
	mv	t0,a3
	sw	a2,36(sp)
	beq	a5,zero,.L576
	sw	s1,16(sp)
	mv	a3,a4
	mv	s1,s0
	lw	s0,36(sp)
	j	.L569
.L611:
	lw	a4,20(sp)
	beq	s0,a3,.L609
.L573:
	lw	a3,16(s1)
	sw	t1,64(sp)
	lw	a0,16(sp)
	lw	a2,8(a3)
	addi	a3,sp,40
	lw	a1,28(a2)
	sw	t1,40(sp)
	lw	t1,68(sp)
	li	a2,0
	sw	t1,44(sp)
	lw	t1,72(sp)
	sw	t1,48(sp)
	call	funcstore
	lw	a4,16(s1)
	lw	a5,8(sp)
	lw	a3,4(sp)
	lw	a4,32(a4)
	addi	a5,a5,1
	add	a3,a3,s0
	sw	a5,8(sp)
	sw	a3,4(sp)
	bleu	a4,a5,.L599
	lw	t0,0(s1)
	lw	a3,4(s1)
.L569:
	lw	a4,8(s1)
	lw	a5,4(sp)
	lw	a1,12(s1)
	li	a0,16
	add	a2,a5,t0
	sub	t0,a4,t0
	sltu	t1,a2,a5
	sub	a1,a1,a3
	sgtu	a4,t0,a4
	add	t1,t1,a3
	mv	a3,a2
	beq	a1,a4,.L610
.L574:
	sw	a2,24(sp)
	sw	t1,20(sp)
	call	xmalloc
	lw	a5,12(sp)
	lw	t1,20(sp)
	lw	a2,24(sp)
	lw	a3,20(a5)
	li	a5,2
	sw	a5,0(a0)
	sw	a2,8(a0)
	sw	t1,12(a0)
	mv	a4,a0
	sw	a0,20(sp)
	lw	a0,16(sp)
	li	a2,119
	li	a1,1
	call	funcinst
	li	a5,2
	li	a2,4
	li	a3,1
	mv	t1,a0
	beq	s0,a5,.L571
	bne	s0,a2,.L611
	lw	a4,16(s1)
	lw	a5,8(sp)
	sw	a0,24(sp)
	lw	a4,36(a4)
	slli	a3,a5,2
	li	a0,16
	add	a4,a4,a3
	lw	a3,0(a4)
.L602:
	sw	a3,20(sp)
	call	xmalloc
	lw	a3,20(sp)
	li	a5,2
	lw	t1,24(sp)
	mv	a4,a0
	sw	a5,0(a0)
	sw	a3,8(a0)
	sw	zero,12(a0)
	j	.L573
.L571:
	lw	a4,16(s1)
	lw	a5,8(sp)
	sw	a0,24(sp)
	lw	a4,36(a4)
	slli	a3,a5,1
	li	a0,16
	add	a4,a4,a3
	lhu	a5,0(a4)
	sw	a5,20(sp)
	call	xmalloc
	lw	a5,20(sp)
	lw	t1,24(sp)
	mv	a4,a0
	sw	s0,0(a0)
	sw	a5,8(a0)
	sw	zero,12(a0)
	j	.L573
.L609:
	lw	a4,16(s1)
	lw	a5,8(sp)
	sw	a0,24(sp)
	lw	a4,36(a4)
	li	a0,16
	add	a4,a4,a5
	lbu	a3,0(a4)
	j	.L602
.L605:
	lw	a1,12(sp)
	mv	a0,s1
	lw	a2,12(a1)
	lw	a1,20(a1)
	lw	a2,8(a2)
	sw	t0,0(sp)
	sw	a5,56(sp)
	sw	t0,60(sp)
	call	zero
	j	.L577
.L610:
	bgtu	t0,a5,.L574
	mv	s0,s1
	mv	a4,t1
	lw	s1,16(sp)
	j	.L576
.L599:
	lw	a1,8(sp)
	lw	a0,36(sp)
	mv	s0,s1
	lw	s1,16(sp)
	call	__mulsi3
	lw	a3,0(s0)
	lw	a5,4(s0)
	add	a3,a0,a3
	sltu	a4,a3,a0
	add	a4,a4,a5
	j	.L576
	.size	funcinit, .-funcinit
	.section	.rodata.funclval.str1.4,"aMS",@progbits,1
	.align	2
.LC59:
	.string	"identifier '%s' is not an object or function"
	.align	2
.LC60:
	.string	"data "
	.align	2
.LC61:
	.string	" = { b \"%s\", b 0 }\n"
	.align	2
.LC62:
	.string	"expression is not an object"
	.section	.text.funclval,"ax",@progbits
	.align	2
	.type	funclval, @function
funclval:
	lw	a4,0(a2)
	addi	sp,sp,-28
	sw	s0,20(sp)
	sw	s1,16(sp)
	sw	ra,24(sp)
	li	a3,4
	sw	zero,0(sp)
	mv	s0,a0
	mv	t1,a1
	li	s1,0
	bne	a4,a3,.L613
	lh	a5,34(a2)
	lh	s1,32(a2)
	lw	a2,20(a2)
	sw	a5,0(sp)
	lw	a4,0(a2)
.L613:
	li	a3,6
	beq	a4,a3,.L614
	bgtu	a4,a3,.L615
	beq	a4,zero,.L616
	li	a3,2
	bne	a4,a3,.L618
	mv	a0,a2
	call	stringdecl
	lw	a0,20(a0)
	li	a4,0
.L622:
	lw	a5,0(sp)
	sw	a0,0(s0)
	sh	s1,4(s0)
	lw	ra,24(sp)
	sh	a5,6(s0)
	sw	a4,8(s0)
	mv	a0,s0
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L615:
	li	a3,7
	bne	a4,a3,.L618
	lw	a3,16(a2)
	li	a4,73
	bne	a3,a4,.L632
.L624:
	lw	a1,20(a2)
	mv	a0,t1
	call	funcexpr
	li	a4,0
	j	.L622
.L618:
	lw	a4,8(a2)
	li	a3,1
	lw	a4,0(a4)
	addi	a4,a4,-12
	bgtu	a4,a3,.L633
.L625:
	mv	a1,a2
	mv	a0,t1
	call	funcexpr
	li	a4,0
	j	.L622
.L616:
	lw	a4,32(a2)
	li	a2,1
	lw	a3,4(a4)
	addi	a3,a3,-1
	bgtu	a3,a2,.L634
.L620:
	lw	a3,4(t1)
	beq	a3,a4,.L635
.L621:
	lw	a0,20(a4)
	lw	a4,24(a4)
	j	.L622
.L614:
	lw	a1,28(a2)
	beq	a1,zero,.L623
	mv	a0,t1
	sw	a2,8(sp)
	sw	t1,4(sp)
	call	funcexpr
	lw	a2,8(sp)
	lw	t1,4(sp)
.L623:
	lw	a1,32(a2)
	lw	a2,36(a2)
	mv	a0,t1
	li	a3,1
	sw	a1,4(sp)
	call	funcinit
	lw	a1,4(sp)
	li	a4,0
	lw	a0,20(a1)
	j	.L622
.L632:
	lla	a1,.LC62
	lla	a0,tok+8
	sw	a2,8(sp)
	sw	t1,4(sp)
	call	error
	lw	a2,8(sp)
	lw	t1,4(sp)
	j	.L624
.L633:
	lla	a1,.LC62
	lla	a0,tok+8
	sw	a2,8(sp)
	sw	t1,4(sp)
	call	error
	lw	a2,8(sp)
	lw	t1,4(sp)
	j	.L625
.L634:
	lw	a2,0(a4)
	lla	a1,.LC59
	lla	a0,tok+8
	sw	t1,8(sp)
	sw	a4,4(sp)
	call	error
	lw	t1,8(sp)
	lw	a4,4(sp)
	j	.L620
.L635:
	la a1, stdout; lw a1, 0(a1);
	lla	a0,.LC60
	sw	t1,12(sp)
	sw	a4,4(sp)
	call	my_fputs
	lw	a4,4(sp)
	lw	a0,20(a4)
	sw	a4,8(sp)
	call	emitname
	lw	t1,12(sp)
	lla	a0,.LC61
	lw	a1,8(t1)
	sw	t1,4(sp)
	call	my_printf
	lw	t1,4(sp)
	lw	a4,8(sp)
	sw	zero,4(t1)
	j	.L621
	.size	funclval, .-funclval
	.section	.rodata.funcexpr.str1.4,"aMS",@progbits,1
	.align	2
.LC63:
	.string	"Assertion `e->u.temp' failed"
	.align	2
.LC64:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/qbe.c:1157  \n"
	.align	2
.LC65:
	.string	"Assertion `t->kind == TYPEARRAY' failed"
	.align	2
.LC66:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/qbe.c:1161  \n"
	.align	2
.LC67:
	.string	"unimplemented declaration kind %d"
	.align	2
.LC68:
	.string	"floating point constants not supported"
	.align	2
.LC69:
	.string	"not a scalar"
	.align	2
.LC70:
	.string	"internal error; unknown unary expression"
	.align	2
.LC71:
	.string	"logic_right"
	.align	2
.LC72:
	.string	"logic_join"
	.align	2
.LC73:
	.string	"internal error; unimplemented binary expression"
	.align	2
.LC74:
	.string	"cond_true"
	.align	2
.LC75:
	.string	"cond_false"
	.align	2
.LC76:
	.string	"cond_join"
	.align	2
.LC77:
	.string	"va_arg with non-scalar type is not yet supported"
	.align	2
.LC78:
	.string	"internal error: unimplemented builtin"
	.align	2
.LC79:
	.string	"unimplemented expression %d"
	.section	.text.funcexpr,"ax",@progbits
	.align	2
	.globl	funcexpr
	.hidden	funcexpr
	.type	funcexpr, @function
funcexpr:
	addi	sp,sp,-140
	sw	s0,132(sp)
	sw	s1,128(sp)
	sw	ra,136(sp)
	lla	s1,.L640
	mv	a5,a0
	mv	s0,a1
.L716:
	lw	a1,8(s0)
	lw	a4,4(a1)
	andi	a4,a4,64
	beq	a4,zero,.L637
	mv	a0,a5
	sw	a5,0(sp)
	call	calcvla.part.0
	lw	a5,0(sp)
.L637:
	lw	a1,0(s0)
	li	a4,15
	bgtu	a1,a4,.L638
	slli	a4,a1,2
	add	a4,a4,s1
	lw	a4,0(a4)
	add	a4,a4,s1
	jr	a4
	.section	.rodata.funcexpr,"a",@progbits
	.align	2
	.align	2
.L640:
	.word	.L653-.L640
	.word	.L652-.L640
	.word	.L638-.L640
	.word	.L651-.L640
	.word	.L797-.L640
	.word	.L650-.L640
	.word	.L797-.L640
	.word	.L648-.L640
	.word	.L647-.L640
	.word	.L646-.L640
	.word	.L645-.L640
	.word	.L644-.L640
	.word	.L643-.L640
	.word	.L642-.L640
	.word	.L641-.L640
	.word	.L639-.L640
	.section	.text.funcexpr
.L797:
	mv	a4,s0
	mv	s0,a5
	mv	a5,a4
.L649:
	mv	a2,a5
	mv	a1,s0
	addi	a0,sp,116
	sw	a5,0(sp)
	call	funclval
	lw	a5,0(sp)
	addi	a2,sp,28
	mv	a0,s0
	lw	a1,8(a5)
	lw	a5,116(sp)
	sw	a5,28(sp)
	lw	a5,120(sp)
	sw	a5,32(sp)
	lw	a5,124(sp)
	sw	a5,36(sp)
	call	funcload
	mv	t1,a0
.L636:
	lw	ra,136(sp)
	lw	s0,132(sp)
	lw	s1,128(sp)
	mv	a0,t1
	addi	sp,sp,140
	jr	ra
.L650:
	mv	a4,s0
	lw	a2,20(a4)
	mv	a1,a5
	addi	a0,sp,116
	mv	s0,a5
	sw	a4,0(sp)
	call	funclval
	lw	a5,0(sp)
	addi	a2,sp,28
	mv	a0,s0
	lw	a4,20(a5)
	lw	a1,8(a4)
	lw	a4,116(sp)
	sw	a4,28(sp)
	lw	a4,120(sp)
	sw	a4,32(sp)
	lw	a4,124(sp)
	sw	a4,36(sp)
	call	funcload
	lw	a5,0(sp)
	li	a4,9
	lw	s1,8(a5)
	lw	a3,0(s1)
	beq	a3,a4,.L803
	lw	a4,4(s1)
	sw	a5,8(sp)
	sw	a0,0(sp)
	andi	a4,a4,2
	beq	a4,zero,.L663
	li	a0,16
	call	xmalloc
	li	a3,2
	lw	t1,0(sp)
	lw	a5,8(sp)
	sw	a3,0(a0)
	li	a2,1
	li	a3,0
	mv	a4,a0
	sw	a2,8(a0)
	sw	a3,12(a0)
.L662:
	lw	a3,16(a5)
	mv	a1,s1
	addi	a0,sp,44
	sw	a5,0(sp)
	addi	s1,a3,-70
	sw	t1,12(sp)
	sw	a4,8(sp)
	call	qbetype
	lw	t1,12(sp)
	lw	a4,8(sp)
	lbu	a2,44(sp)
	snez	s1,s1
	addi	s1,s1,1
	mv	a3,t1
	mv	a1,s1
	mv	a0,s0
	sw	t1,8(sp)
	call	funcinst
	lw	a5,0(sp)
	lw	t0,116(sp)
	mv	a4,a0
	lw	a2,12(a5)
	lw	a1,8(a5)
	sw	t0,28(sp)
	lw	t0,120(sp)
	addi	a3,sp,28
	mv	a0,s0
	sw	t0,32(sp)
	lw	t0,124(sp)
	sw	t0,36(sp)
	call	funcstore
	lw	a5,0(sp)
	lw	t1,8(sp)
	lbu	a5,32(a5)
	bne	a5,zero,.L636
	mv	t1,a0
	j	.L636
.L648:
	mv	a4,s0
	mv	s0,a5
	mv	a5,a4
	lw	a4,16(a4)
	li	a3,73
	beq	a4,a3,.L674
	li	a3,75
	beq	a4,a3,.L675
	li	a3,72
	beq	a4,a3,.L804
	lla	a0,.LC70
	sw	a5,0(sp)
	call	fatal
	lw	a5,0(sp)
	lw	a1,0(a5)
.L638:
	lla	a0,.LC79
	call	fatal
.L801:
	lw	ra,136(sp)
	lw	s0,132(sp)
	li	t1,0
	lw	s1,128(sp)
	mv	a0,t1
	addi	sp,sp,140
	jr	ra
.L647:
	mv	a4,s0
	lw	a1,28(a4)
	mv	s0,a5
	mv	a5,a4
	beq	a1,zero,.L678
	mv	a0,s0
	sw	a4,0(sp)
	call	funcexpr
	lw	a5,0(sp)
.L678:
	lw	a1,20(a5)
	mv	a0,s0
	sw	a5,0(sp)
	call	funcexpr
	lw	a5,0(sp)
	mv	a3,a0
	mv	a0,s0
	lw	a4,20(a5)
	lw	s0,132(sp)
	lw	ra,136(sp)
	lw	s1,128(sp)
	lw	a1,8(a5)
	lw	a2,8(a4)
	addi	sp,sp,140
	tail	convert
.L646:
	mv	a4,s0
	lw	a1,32(a4)
	mv	a0,a5
	mv	s0,a5
	sw	a4,0(sp)
	call	funcexpr
	lw	a5,0(sp)
	li	a3,1
	mv	s1,a0
	lw	a4,16(a5)
	addi	a4,a4,-90
	bleu	a4,a3,.L805
	lw	a1,36(a5)
	mv	a0,s0
	sw	a5,0(sp)
	call	funcexpr
	lw	a5,0(sp)
	li	a3,9
	mv	a4,a0
	lw	a2,32(a5)
	lw	a2,8(a2)
	lw	a1,0(a2)
	beq	a1,a3,.L806
.L682:
	lw	a3,16(a5)
	li	a1,17
	addi	a3,a3,-72
	bgtu	a3,a1,.L683
	lla	a1,.L685
	slli	a3,a3,2
	add	a3,a3,a1
	lw	a3,0(a3)
	add	a3,a3,a1
	jr	a3
	.section	.rodata.funcexpr
	.align	2
	.align	2
.L685:
	.word	.L700-.L685
	.word	.L735-.L685
	.word	.L698-.L685
	.word	.L697-.L685
	.word	.L683-.L685
	.word	.L683-.L685
	.word	.L696-.L685
	.word	.L695-.L685
	.word	.L694-.L685
	.word	.L693-.L685
	.word	.L692-.L685
	.word	.L691-.L685
	.word	.L690-.L685
	.word	.L689-.L685
	.word	.L688-.L685
	.word	.L687-.L685
	.word	.L686-.L685
	.word	.L684-.L685
	.section	.text.funcexpr
.L645:
	mv	a4,s0
	li	a0,96
	mv	s0,a5
	sw	a4,0(sp)
	call	xmalloc
	lla	a2,.LANCHOR2
	lw	a4,0(a2)
	li	t0,7
	lla	a1,.LC74
	addi	a4,a4,1
	sw	t0,0(a0)
	sw	a1,8(a0)
	sw	a4,4(a0)
	sw	zero,16(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,72(a0)
	sw	zero,56(a0)
	sw	zero,88(a0)
	sw	a0,16(sp)
	li	a0,96
	sw	a4,0(a2)
	call	xmalloc
	lla	a2,.LANCHOR2
	lw	a1,0(a2)
	li	t0,7
	mv	a4,a0
	sw	t0,0(a0)
	addi	a1,a1,1
	lla	a0,.LC75
	sw	a0,8(a4)
	sw	a1,4(a4)
	sw	zero,16(a4)
	sw	zero,20(a4)
	sw	zero,24(a4)
	sw	zero,72(a4)
	sw	zero,56(a4)
	sw	zero,88(a4)
	li	a0,96
	sw	a4,8(sp)
	sw	a1,0(a2)
	call	xmalloc
	lla	a2,.LANCHOR2
	lw	a5,0(sp)
	lw	t1,0(a2)
	li	t0,7
	lw	a1,20(a5)
	mv	s1,a0
	sw	t0,0(a0)
	addi	t1,t1,1
	lla	a0,.LC76
	sw	t1,4(s1)
	sw	a0,8(s1)
	sw	zero,16(s1)
	sw	zero,20(s1)
	sw	zero,24(s1)
	sw	zero,72(s1)
	sw	zero,56(s1)
	sw	zero,88(s1)
	mv	a0,s0
	sw	t1,0(a2)
	call	funcexpr
	lw	a5,0(sp)
	lw	a4,8(sp)
	lw	a3,16(sp)
	lw	a2,20(a5)
	mv	a1,a0
	mv	a0,s0
	lw	a2,8(a2)
	sw	a4,12(sp)
	sw	a3,8(sp)
	call	funcjnz
	lw	a5,0(sp)
	lw	a2,24(s0)
	lw	a3,8(sp)
	lw	a1,32(a5)
	mv	a0,s0
	sw	a3,88(a2)
	sw	a3,24(s0)
	call	funcexpr
	lw	a3,24(s0)
	sw	a0,44(s1)
	lw	a5,0(sp)
	lw	a2,72(a3)
	sw	a3,36(s1)
	lw	a4,12(sp)
	beq	a2,zero,.L807
.L711:
	lw	a1,36(a5)
	sw	a4,88(a3)
	sw	a4,24(s0)
	mv	a0,s0
	sw	a5,0(sp)
	call	funcexpr
	lw	a4,24(s0)
	lw	a5,0(sp)
	sw	a0,48(s1)
	lw	a1,8(a5)
	sw	a4,40(s1)
	sw	s1,88(a4)
	sw	s1,24(s0)
	lla	a5,typevoid
	beq	a1,a5,.L801
	lw	a5,44(s0)
	li	a4,5
	sw	a4,56(s1)
	addi	a5,a5,1
	sw	zero,64(s1)
	sw	a5,44(s0)
	sw	a5,60(s1)
	addi	a0,sp,104
	call	qbetype
	lbu	a5,104(sp)
	addi	t1,s1,56
	sw	a5,32(s1)
	j	.L636
.L644:
	mv	a4,s0
	lw	a1,36(a4)
	mv	a0,a5
	mv	s0,a5
	sw	a4,0(sp)
	call	funcexpr
	lw	a5,0(sp)
	li	a4,14
	mv	t1,a0
	lw	a2,32(a5)
	lw	a3,0(a2)
	bne	a3,a4,.L713
	sw	a0,32(a2)
	j	.L636
.L639:
	mv	a4,s0
	lw	s1,32(a4)
	mv	s0,a5
	mv	a5,a4
	lw	a3,0(s1)
	li	a4,10
	bne	a3,a4,.L808
	lw	a4,4(s1)
	andi	a4,a4,64
	beq	a4,zero,.L732
	mv	a1,s1
	mv	a0,s0
	sw	a5,0(sp)
	call	calcvla.part.0
	lw	a5,0(sp)
.L732:
	lw	a1,20(a5)
	beq	a1,zero,.L733
	mv	a0,s0
	call	funcexpr
.L733:
	lw	t1,56(s1)
	j	.L636
.L653:
	mv	a4,s0
	mv	s0,a5
	mv	a5,a4
	lw	a4,32(a4)
	li	a3,1
	lw	a1,4(a4)
	beq	a1,a3,.L654
	li	a3,3
	beq	a1,a3,.L655
	lla	a0,.LC67
	sw	a5,0(sp)
	call	fatal
	lw	a5,0(sp)
	lw	a1,0(a5)
	j	.L638
.L652:
	mv	a4,s0
	lw	a3,8(a4)
	mv	s0,a5
	mv	a5,a4
	lw	a4,4(a3)
	andi	a4,a4,2
	bne	a4,zero,.L659
	lw	a3,0(a3)
	li	a4,9
	beq	a3,a4,.L659
	lla	a0,.LC68
	sw	a5,0(sp)
	call	fatal
	lw	a5,0(sp)
	j	.L649
.L651:
	mv	a4,s0
	lw	a1,36(a4)
	li	a2,4
	li	a0,0
	mv	s0,a5
	sw	a4,0(sp)
	call	xreallocarray
	lw	a5,0(sp)
	sw	a0,20(sp)
	lw	s1,32(a5)
	beq	s1,zero,.L670
	mv	a1,s1
	sw	a5,8(sp)
	mv	s1,a0
.L669:
	lw	a0,8(a1)
	lw	a5,24(a0)
	beq	a5,zero,.L809
.L668:
	mv	a0,s0
	sw	a1,0(sp)
	call	funcexpr
	lw	a1,0(sp)
	addi	s1,s1,4
	lw	a1,24(a1)
	sw	a0,-4(s1)
	bne	a1,zero,.L669
	lw	a5,8(sp)
.L670:
	lw	a4,8(a5)
	lw	a3,24(a4)
	beq	a3,zero,.L810
.L666:
	mv	a1,a4
	addi	a0,sp,56
	sw	a4,12(sp)
	sw	a5,0(sp)
	call	qbetype
	lw	a5,0(sp)
	lbu	a2,56(sp)
	mv	a0,s0
	lw	a1,20(a5)
	sw	a5,8(sp)
	sw	a2,0(sp)
	call	funcexpr
	lw	a4,12(sp)
	lw	a2,0(sp)
	mv	a3,a0
	lw	a4,24(a4)
	li	a1,88
	mv	a0,s0
	call	funcinst
	lw	a5,8(sp)
	mv	t1,a0
	lw	a4,20(a5)
	lw	t0,32(a5)
	lw	a3,8(a4)
	lw	a3,28(a3)
	sw	a3,16(sp)
	beq	t0,zero,.L671
	lw	s1,20(sp)
	sw	s0,12(sp)
	li	t2,0
	sw	a0,20(sp)
	mv	s0,t0
	sw	a5,24(sp)
.L673:
	lw	a4,16(sp)
	lbu	a5,48(a4)
	beq	a5,zero,.L672
	lw	a5,56(a4)
	beq	a5,t2,.L811
.L672:
	lw	a1,8(s0)
	addi	t2,t2,1
	addi	a0,sp,68
	sw	t2,8(sp)
	sw	a1,0(sp)
	call	qbetype
	lw	a1,0(sp)
	lw	a3,0(s1)
	lbu	a2,68(sp)
	lw	a4,24(a1)
	lw	a0,12(sp)
	li	a1,91
	addi	s1,s1,4
	call	funcinst
	lw	s0,24(s0)
	lw	t2,8(sp)
	bne	s0,zero,.L673
	lw	a5,24(sp)
	lw	t1,20(sp)
	lw	s0,12(sp)
	lw	a4,20(a5)
.L671:
	lw	a3,0(a4)
	li	a5,7
	bne	a3,a5,.L636
	lw	a3,16(a4)
	li	a5,72
	bne	a3,a5,.L636
	lw	a5,20(a4)
	lw	a4,0(a5)
	bne	a4,zero,.L636
	lw	a5,32(a5)
	lbu	a5,41(a5)
	beq	a5,zero,.L636
	lw	a5,24(s0)
	lw	a4,72(a5)
	bne	a4,zero,.L636
	li	a4,4
	sw	a4,72(a5)
	j	.L636
.L642:
	mv	a4,s0
	mv	s0,a5
	mv	a5,a4
	lw	a4,32(a4)
	li	a3,6
	beq	a4,a3,.L717
	bgtu	a4,a3,.L718
	beq	a4,zero,.L719
	li	a5,5
	li	t1,0
	beq	a4,a5,.L636
.L720:
	lla	a0,.LC78
	call	fatal
	li	t1,0
	j	.L636
.L643:
	lw	s0,20(s0)
	lw	a4,24(s0)
	beq	a4,zero,.L716
.L715:
	mv	a1,s0
	mv	a0,a5
	sw	a5,0(sp)
	call	funcexpr
	lw	s0,24(s0)
	lw	a5,0(sp)
	lw	a4,24(s0)
	bne	a4,zero,.L715
	j	.L716
.L641:
	lw	a3,8(s0)
	lla	a4,typevoid
	beq	a3,a4,.L801
	lw	t1,32(s0)
	bne	t1,zero,.L636
	lla	s0,.LC18
	li	a0,65
.L724:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L724
	lla	s0,.LC63
	li	a0,65
.L725:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L725
	lla	s0,.LC64
	li	a0,32
.L726:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L726
.L731:
	li	a0,1
	call	halt
.L718:
	li	a3,10
	bne	a4,a3,.L720
	lw	a1,20(a5)
	li	t1,0
	mv	a0,s0
	sw	t1,0(sp)
	call	funcexpr
	mv	a3,a0
	li	a4,0
	li	a2,0
	li	a1,89
	mv	a0,s0
	call	funcinst
	lw	t1,0(sp)
	j	.L636
.L809:
	lw	a5,0(a0)
	li	a4,1
	addi	a5,a5,-12
	bgtu	a5,a4,.L668
	sw	a1,0(sp)
	call	emittype.part.0
	lw	a1,0(sp)
	j	.L668
.L811:
	lw	a0,12(sp)
	li	a4,0
	li	a3,0
	li	a2,0
	li	a1,92
	sw	t2,0(sp)
	call	funcinst
	lw	t2,0(sp)
	j	.L672
.L807:
	li	a2,1
	sw	a2,72(a3)
	sw	s1,80(a3)
	j	.L711
.L655:
	lw	t1,20(a4)
	j	.L636
.L713:
	sw	a0,0(sp)
	mv	a1,s0
	addi	a0,sp,116
	sw	a5,8(sp)
	call	funclval
	lw	a5,8(sp)
	lw	t1,0(sp)
	addi	a3,sp,28
	lw	a5,32(a5)
	mv	a4,t1
	mv	a0,s0
	lw	a2,12(a5)
	lw	a1,8(a5)
	lw	a5,116(sp)
	sw	a5,28(sp)
	lw	a5,120(sp)
	sw	a5,32(sp)
	lw	a5,124(sp)
	sw	a5,36(sp)
	call	funcstore
	mv	t1,a0
	j	.L636
.L810:
	lw	a3,0(a4)
	li	a2,1
	addi	a3,a3,-12
	bgtu	a3,a2,.L666
	mv	a0,a4
	sw	a5,8(sp)
	sw	a4,0(sp)
	call	emittype.part.0
	lw	a5,8(sp)
	lw	a4,0(sp)
	j	.L666
.L719:
	lw	a1,20(a5)
	mv	a0,s0
	call	funcexpr
	mv	a3,a0
	li	a4,0
	li	a2,119
	li	a1,31
.L802:
	mv	a0,s0
	lw	s0,132(sp)
	lw	ra,136(sp)
	lw	s1,128(sp)
	addi	sp,sp,140
	tail	funcinst
.L654:
	lw	a1,8(a5)
	lw	a3,20(a4)
	lw	a5,24(a4)
	addi	a2,sp,28
	mv	a0,s0
	sw	zero,120(sp)
	sw	a3,116(sp)
	sw	a5,124(sp)
	sw	a3,28(sp)
	sw	zero,32(sp)
	sw	a5,36(sp)
	call	funcload
	mv	t1,a0
	j	.L636
.L804:
	lw	a2,20(a5)
	mv	a1,s0
	addi	a0,sp,116
	call	funclval
	lw	t1,116(sp)
	j	.L636
.L675:
	lw	a1,20(a5)
	mv	a0,s0
	sw	a5,8(sp)
	call	funcexpr
	mv	a4,a0
	li	a0,16
	sw	a4,0(sp)
	call	xmalloc
	lw	a5,8(sp)
	mv	s1,a0
	li	a4,0
	lw	a1,8(a5)
	li	a5,2
	sw	a5,0(s1)
	li	a5,0
	sw	a4,8(s1)
	addi	a0,sp,80
	sw	a5,12(s1)
	call	qbetype
	lw	a4,0(sp)
	lbu	a2,80(sp)
	mv	a3,s1
	li	a1,2
	j	.L802
.L659:
	lw	s0,32(a5)
	lw	s1,36(a5)
	li	a0,16
	call	xmalloc
	li	a5,2
	mv	t1,a0
	sw	a5,0(a0)
	sw	s0,8(a0)
	sw	s1,12(a0)
	j	.L636
.L806:
	lla	a2,typeulong
	j	.L682
.L663:
	lla	a0,.LC69
	call	fatal
	li	t1,0
	j	.L636
.L683:
	lla	a0,.LC73
	sw	a5,8(sp)
	sw	a4,0(sp)
	call	fatal
	lw	a4,0(sp)
	lw	a5,8(sp)
	li	t1,0
.L699:
	lw	a1,8(a5)
	addi	a0,sp,92
	sw	a4,8(sp)
	sw	t1,0(sp)
	call	qbetype
	lw	t1,0(sp)
	lw	a4,8(sp)
	lbu	a2,92(sp)
	mv	a3,s1
	mv	a1,t1
	j	.L802
.L684:
	li	t1,9
	j	.L699
.L686:
	li	t1,10
	j	.L699
.L687:
	lw	a3,20(a2)
	bne	a3,zero,.L747
	lw	a2,16(a2)
	li	a3,4
	li	t1,33
	bleu	a2,a3,.L699
.L747:
	li	t1,43
	j	.L699
.L688:
	lw	a3,20(a2)
	bne	a3,zero,.L746
	lw	a2,16(a2)
	li	a3,4
	li	t1,32
	bleu	a2,a3,.L699
.L746:
	li	t1,42
	j	.L699
.L689:
	lbu	a3,48(a2)
	lw	a1,20(a2)
	seqz	a3,a3
	slli	t1,a3,2
	bne	a1,zero,.L707
	lw	a1,16(a2)
	li	a2,4
	bgtu	a1,a2,.L707
	addi	t1,t1,36
	j	.L699
.L693:
	lbu	a3,48(a2)
	li	t1,13
	sub	t1,t1,a3
	j	.L699
.L691:
	lbu	a3,48(a2)
	lw	a1,20(a2)
	seqz	a3,a3
	slli	t1,a3,2
	bne	a1,zero,.L703
	lw	a1,16(a2)
	li	a2,4
	bgtu	a1,a2,.L703
	addi	t1,t1,37
	j	.L699
.L692:
	lbu	a3,48(a2)
	lw	a1,20(a2)
	seqz	a3,a3
	slli	t1,a3,2
	bne	a1,zero,.L701
	lw	a1,16(a2)
	li	a2,4
	bgtu	a1,a2,.L701
	addi	t1,t1,35
	j	.L699
.L697:
	li	t1,2
	j	.L699
.L690:
	lbu	a3,48(a2)
	lw	a1,20(a2)
	seqz	a3,a3
	slli	t1,a3,2
	bne	a1,zero,.L705
	lw	a1,16(a2)
	li	a2,4
	bgtu	a1,a2,.L705
	addi	t1,t1,34
	j	.L699
.L695:
	lbu	a3,48(a2)
	li	t1,8
	sub	t1,t1,a3
	j	.L699
.L735:
	li	t1,5
	j	.L699
.L700:
	li	t1,11
	j	.L699
.L694:
	li	t1,14
	j	.L699
.L696:
	lw	a3,4(a2)
	li	t1,4
	andi	a3,a3,2
	beq	a3,zero,.L699
	lbu	t1,48(a2)
	seqz	t1,t1
	slli	t1,t1,1
	addi	t1,t1,4
	j	.L699
.L698:
	li	t1,1
	j	.L699
.L805:
	li	a0,96
	sw	a5,8(sp)
	call	xmalloc
	lla	a3,.LANCHOR2
	lw	a4,0(a3)
	li	a2,7
	lla	a1,.LC71
	addi	a4,a4,1
	sw	a2,0(a0)
	sw	a1,8(a0)
	sw	a4,4(a0)
	sw	zero,16(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,72(a0)
	sw	zero,56(a0)
	sw	zero,88(a0)
	sw	a0,0(sp)
	li	a0,96
	sw	a4,0(a3)
	call	xmalloc
	lw	a5,8(sp)
	lla	a3,.LANCHOR2
	lw	a4,0(a3)
	lw	t2,32(a5)
	lw	a1,16(a5)
	li	a2,7
	addi	a4,a4,1
	sw	a2,0(a0)
	lla	a2,.LC72
	sw	a2,8(a0)
	sw	a4,0(a3)
	sw	a4,4(a0)
	sw	zero,16(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,72(a0)
	sw	zero,56(a0)
	sw	zero,88(a0)
	li	a4,91
	sw	a5,12(sp)
	lw	a2,8(t2)
	lw	t1,0(sp)
	beq	a1,a4,.L812
	mv	a4,a0
	mv	a3,t1
	sw	a0,8(sp)
	mv	a1,s1
	mv	a0,s0
	sw	t1,0(sp)
	call	funcjnz
	li	a0,16
	call	xmalloc
	li	a5,0
	li	a4,2
	sw	a5,12(a0)
	lw	t0,8(sp)
	lw	a5,12(sp)
	lw	t1,0(sp)
	sw	a4,0(a0)
	li	a4,0
	sw	a4,8(a0)
.L681:
	lw	a4,24(s0)
	lw	a1,36(a5)
	sw	a0,44(t0)
	sw	a4,36(t0)
	sw	t1,88(a4)
	sw	t1,24(s0)
	mv	a0,s0
	sw	a5,8(sp)
	sw	t0,0(sp)
	call	funcexpr
	lw	a5,8(sp)
	lw	t0,0(sp)
	mv	a3,a0
	lw	a5,36(a5)
	addi	t1,t0,56
	lla	a1,typebool
	lw	a2,8(a5)
	mv	a0,s0
	sw	t0,8(sp)
	sw	t1,0(sp)
	call	convert
	lw	a4,24(s0)
	lw	t0,8(sp)
	lw	a5,44(s0)
	lw	t1,0(sp)
	sw	a4,40(t0)
	sw	a0,48(t0)
	sw	t0,88(a4)
	sw	t0,24(s0)
	li	a4,5
	addi	a5,a5,1
	sw	a4,56(t0)
	sw	zero,64(t0)
	sw	a5,44(s0)
	sw	a5,60(t0)
	li	a5,119
	sw	a5,32(t0)
	j	.L636
.L674:
	lw	a1,20(a5)
	mv	a0,s0
	sw	a5,0(sp)
	call	funcexpr
	lw	a5,0(sp)
	addi	a2,sp,28
	sw	zero,120(sp)
	lw	a1,8(a5)
	mv	a5,a0
	mv	a0,s0
	sw	zero,124(sp)
	sw	a5,116(sp)
	sw	a5,28(sp)
	sw	zero,32(sp)
	sw	zero,36(sp)
	call	funcload
	mv	t1,a0
	j	.L636
.L803:
	lw	a4,28(s1)
	sw	a0,8(sp)
	li	a0,16
	lw	a2,16(a4)
	lw	a3,20(a4)
	sw	a5,12(sp)
	sw	a2,0(sp)
	sw	a3,4(sp)
	call	xmalloc
	lw	a2,0(sp)
	lw	a3,4(sp)
	li	a1,2
	lw	t1,8(sp)
	lw	a5,12(sp)
	mv	a4,a0
	sw	a1,0(a0)
	sw	a2,8(a0)
	sw	a3,12(a0)
	j	.L662
.L717:
	lw	a1,28(a5)
	beq	a1,zero,.L721
	mv	a0,s0
	sw	a5,0(sp)
	call	funcexpr
	lw	a5,0(sp)
.L721:
	lw	a4,8(a5)
	lw	a4,4(a4)
	andi	a4,a4,16
	beq	a4,zero,.L813
.L722:
	lw	a1,20(a5)
	mv	a0,s0
	sw	a5,0(sp)
	call	funcexpr
	lw	a5,0(sp)
	mv	s1,a0
	addi	a0,sp,116
	lw	a1,8(a5)
	call	qbetype
	lbu	a2,116(sp)
	li	a4,0
	mv	a3,s1
	li	a1,90
	j	.L802
.L812:
	mv	a4,t1
	mv	a3,a0
	sw	a0,0(sp)
	mv	a1,s1
	mv	a0,s0
	sw	t1,8(sp)
	call	funcjnz
	li	a0,16
	call	xmalloc
	li	a4,2
	li	a2,1
	li	a3,0
	lw	t0,0(sp)
	lw	t1,8(sp)
	lw	a5,12(sp)
	sw	a4,0(a0)
	sw	a2,8(a0)
	sw	a3,12(a0)
	j	.L681
.L813:
	lla	a1,.LC77
	lla	a0,tok+8
	sw	a5,0(sp)
	call	error
	lw	a5,0(sp)
	j	.L722
.L707:
	addi	t1,t1,46
	j	.L699
.L703:
	addi	t1,t1,47
	j	.L699
.L705:
	addi	t1,t1,44
	j	.L699
.L701:
	addi	t1,t1,45
	j	.L699
.L808:
	lla	s0,.LC18
	li	a0,65
.L728:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L728
	lla	s0,.LC65
	li	a0,65
.L729:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L729
	lla	s0,.LC66
	li	a0,32
.L730:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L730
	j	.L731
	.size	funcexpr, .-funcexpr
	.section	.rodata.calcvla.part.0.str1.4,"aMS",@progbits,1
	.align	2
.LC80:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/qbe.c:584  \n"
	.align	2
.LC81:
	.string	"Assertion `t->base->size || t->base->kind == TYPEARRAY' failed"
	.align	2
.LC82:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/qbe.c:586  \n"
	.align	2
.LC83:
	.string	"Assertion `t->u.array.length' failed"
	.align	2
.LC84:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/qbe.c:587  \n"
	.section	.text.calcvla.part.0,"ax",@progbits
	.align	2
	.type	calcvla.part.0, @function
calcvla.part.0:
	addi	sp,sp,-24
	sw	s0,16(sp)
	mv	s0,a1
	lw	a1,28(a1)
	sw	s1,12(sp)
	sw	ra,20(sp)
	mv	s1,a0
	beq	a1,zero,.L815
	lw	a5,4(a1)
	andi	a5,a5,64
	beq	a5,zero,.L815
	call	calcvla.part.0
.L815:
	lw	a4,0(s0)
	li	a5,11
	beq	a4,a5,.L814
	lw	a5,16(s0)
	lw	a3,20(s0)
	or	a5,a5,a3
	bne	a5,zero,.L814
	li	a5,10
	bne	a4,a5,.L849
	lw	a5,56(s0)
	beq	a5,zero,.L850
.L814:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L850:
	lw	a3,28(s0)
	lw	a5,16(a3)
	lw	a2,20(a3)
	or	a5,a5,a2
	bne	a5,zero,.L821
	lw	a5,0(a3)
	bne	a5,a4,.L851
.L821:
	lw	a1,48(s0)
	beq	a1,zero,.L852
	lw	a2,8(a1)
	mv	a0,s1
	sw	a2,0(sp)
	call	funcexpr
	lw	a2,0(sp)
	mv	a3,a0
	lla	a1,typeulong
	mv	a0,s1
	call	convert
	lw	a5,28(s0)
	mv	a3,a0
	lw	a1,16(a5)
	lw	a2,20(a5)
	or	a4,a1,a2
	bne	a4,zero,.L853
	lw	a4,56(a5)
.L832:
	mv	a0,s1
	li	a2,108
	li	a1,5
	call	funcinst
	lw	ra,20(sp)
	sw	a0,56(s0)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L853:
	sw	a0,0(sp)
	li	a0,16
	sw	a2,8(sp)
	sw	a1,4(sp)
	call	xmalloc
	lw	a1,4(sp)
	lw	a2,8(sp)
	li	a5,2
	lw	a3,0(sp)
	mv	a4,a0
	sw	a5,0(a0)
	sw	a1,8(a0)
	sw	a2,12(a0)
	j	.L832
.L849:
	lla	s0,.LC18
	li	a0,65
.L818:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L818
	lla	s0,.LC65
	li	a0,65
.L819:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L819
	lla	s0,.LC80
	li	a0,32
.L820:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L820
.L825:
	li	a0,1
	call	halt
.L852:
	lla	s0,.LC18
	li	a0,65
.L827:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L827
	lla	s0,.LC83
	li	a0,65
.L828:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L828
	lla	s0,.LC84
	li	a0,32
.L829:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L829
	j	.L825
.L851:
	lla	s0,.LC18
	li	a0,65
.L822:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L822
	lla	s0,.LC81
	li	a0,65
.L823:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L823
	lla	s0,.LC82
	li	a0,32
.L824:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L824
	j	.L825
	.size	calcvla.part.0, .-calcvla.part.0
	.section	.rodata.funcalloc.str1.4,"aMS",@progbits,1
	.align	2
.LC85:
	.string	"Assertion `!d->type->incomplete' failed"
	.align	2
.LC86:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/qbe.c:600  \n"
	.align	2
.LC87:
	.string	"Assertion `d->type->kind == TYPEARRAY' failed"
	.align	2
.LC88:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/qbe.c:607  \n"
	.align	2
.LC89:
	.string	"Assertion `d->type->u.array.size' failed"
	.align	2
.LC90:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/qbe.c:608  \n"
	.section	.text.funcalloc,"ax",@progbits
	.align	2
	.type	funcalloc, @function
funcalloc:
	addi	sp,sp,-32
	sw	s1,20(sp)
	mv	s1,a1
	lw	a1,12(a1)
	sw	ra,28(sp)
	sw	s0,24(sp)
	lbu	a5,44(a1)
	bne	a5,zero,.L894
	lw	a5,4(a1)
	mv	s0,a0
	andi	a5,a5,64
	beq	a5,zero,.L859
	call	calcvla.part.0
	lw	a1,12(s1)
.L859:
	lw	a3,24(s0)
	lw	a4,16(a1)
	lw	a5,20(a1)
	sw	a3,0(sp)
	or	a3,a4,a5
	bne	a3,zero,.L895
	lw	a4,0(a1)
	li	a5,10
	bne	a4,a5,.L896
	lw	a3,56(a1)
	beq	a3,zero,.L897
	lw	a5,40(s1)
	li	a4,8
	beq	a5,a4,.L876
.L901:
	ble	a5,a4,.L898
	li	t0,16
	li	a1,31
	bne	a5,t0,.L899
.L871:
	li	a4,0
	li	a2,119
	mv	a0,s0
	call	funcinst
	mv	a3,a0
.L875:
	lw	a5,0(sp)
	sw	a3,20(s1)
	lw	ra,28(sp)
	sw	a5,24(s0)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L898:
	li	a4,2
	bgt	a5,a4,.L873
	bgt	a5,zero,.L900
.L874:
	li	a0,16
	sw	a5,8(sp)
	sw	a3,4(sp)
	call	xmalloc
	lw	a5,8(sp)
	lw	a3,4(sp)
	mv	a4,a0
	addi	a5,a5,-16
	srai	a0,a5,31
	li	t0,2
	sw	t0,0(a4)
	sw	a5,8(a4)
	sw	a0,12(a4)
	li	a2,119
	li	a1,1
	mv	a0,s0
	call	funcinst
	mv	a3,a0
	li	a4,0
	li	a2,119
	li	a1,31
	mv	a0,s0
	call	funcinst
	mv	a3,a0
	j	.L875
.L873:
	li	a4,4
	li	a1,29
	beq	a5,a4,.L871
	j	.L874
.L900:
	li	a1,29
	j	.L871
.L895:
	lw	a3,20(s0)
	li	a0,16
	sw	a5,8(sp)
	sw	a3,24(s0)
	sw	a4,4(sp)
	call	xmalloc
	lw	a5,8(sp)
	lw	a4,4(sp)
	li	a2,2
	sw	a5,12(a0)
	lw	a5,40(s1)
	sw	a4,8(a0)
	sw	a2,0(a0)
	li	a4,8
	mv	a3,a0
	bne	a5,a4,.L901
.L876:
	li	a1,30
	j	.L871
.L899:
	li	a0,16
	sw	a5,8(sp)
	sw	a3,4(sp)
	call	xmalloc
	lw	a5,8(sp)
	lw	a3,4(sp)
	mv	a4,a0
	addi	t2,a5,-16
	srai	a0,t2,31
	li	a5,2
	sw	a5,0(a4)
	sw	t2,8(a4)
	sw	a0,12(a4)
	li	a2,119
	li	a1,1
	sw	a0,4(sp)
	mv	a0,s0
	sw	t2,16(sp)
	call	funcinst
	mv	a3,a0
	li	a4,0
	li	a2,119
	li	a1,31
	mv	a0,s0
	call	funcinst
	lw	a5,8(sp)
	li	t0,16
	mv	a3,a0
	sw	a5,12(sp)
	ble	a5,t0,.L875
	sw	a0,8(sp)
	li	a0,16
	call	xmalloc
	lw	t2,16(sp)
	li	a5,2
	mv	a4,a0
	sw	a5,0(a0)
	sw	t2,8(a0)
	lw	a0,4(sp)
	lw	a3,8(sp)
	li	a2,119
	sw	a0,12(a4)
	li	a1,1
	mv	a0,s0
	call	funcinst
	mv	a3,a0
	li	a0,16
	sw	a3,4(sp)
	call	xmalloc
	lw	a5,12(sp)
	li	a3,2
	sw	a3,0(a0)
	neg	a5,a5
	lw	a3,4(sp)
	srai	a2,a5,31
	sw	a5,8(a0)
	sw	a2,12(a0)
	mv	a4,a0
	li	a2,119
	mv	a0,s0
	li	a1,11
	call	funcinst
	lw	a5,0(sp)
	mv	a3,a0
	sw	a3,20(s1)
	lw	ra,28(sp)
	sw	a5,24(s0)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L894:
	lla	s0,.LC18
	li	a0,65
.L856:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L856
	lla	s0,.LC85
	li	a0,65
.L857:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L857
	lla	s0,.LC86
	li	a0,32
.L858:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L858
.L867:
	li	a0,1
	call	halt
.L897:
	lla	s0,.LC18
	li	a0,65
.L868:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L868
	lla	s0,.LC89
	li	a0,65
.L869:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L869
	lla	s0,.LC90
	li	a0,32
.L870:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L870
	j	.L867
.L896:
	lla	s0,.LC18
	li	a0,65
.L864:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L864
	lla	s0,.LC87
	li	a0,65
.L865:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L865
	lla	s0,.LC88
	li	a0,32
.L866:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L866
	j	.L867
	.size	funcalloc, .-funcalloc
	.section	.rodata.mkfunc.str1.4,"aMS",@progbits,1
	.align	2
.LC91:
	.string	"start"
	.align	2
.LC92:
	.string	"__func__"
	.align	2
.LC93:
	.string	"body"
	.section	.text.mkfunc,"ax",@progbits
	.align	2
	.globl	mkfunc
	.hidden	mkfunc
	.type	mkfunc, @function
mkfunc:
	addi	sp,sp,-52
	mv	a5,a0
	li	a0,48
	sw	ra,48(sp)
	sw	a1,0(sp)
	sw	a3,8(sp)
	sw	s0,44(sp)
	sw	s1,40(sp)
	mv	s0,a2
	sw	a5,4(sp)
	call	xmalloc
	lw	a5,4(sp)
	mv	s1,a0
	sw	s0,16(a0)
	sw	a5,0(a0)
	lw	a5,0(sp)
	sw	a5,8(a0)
	li	a0,96
	call	xmalloc
	lla	a3,.LANCHOR2
	lw	a5,0(a3)
	li	a4,7
	sw	a4,0(a0)
	addi	a5,a5,1
	lla	a4,.LC91
	sw	a5,4(a0)
	sw	a4,8(a0)
	sw	zero,16(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,72(a0)
	sw	zero,56(a0)
	sw	zero,88(a0)
	sw	a0,24(s1)
	sw	a0,20(s1)
	sw	zero,44(s1)
	addi	a0,s1,28
	li	a1,8
	sw	a5,0(a3)
	call	mapinit
	lw	a0,28(s0)
	lw	a5,24(a0)
	beq	a5,zero,.L917
.L903:
	lw	a1,56(s0)
	li	a2,16
	li	a0,0
	call	xreallocarray
	lw	s0,52(s0)
	sw	a0,12(s1)
	mv	a4,a0
	bne	s0,zero,.L908
	j	.L904
.L905:
	li	a5,5
	sw	a5,0(a4)
	lw	a5,44(s1)
	lw	a3,0(s0)
	sw	zero,8(a4)
	addi	a5,a5,1
	sw	a5,44(s1)
	sw	a5,4(a4)
	beq	a3,zero,.L906
	lw	a5,12(s0)
	lw	a5,24(a5)
	beq	a5,zero,.L907
	sw	a4,20(s0)
.L906:
	lw	s0,32(s0)
	addi	a4,a4,16
	beq	s0,zero,.L904
.L908:
	lw	a0,12(s0)
	li	a3,1
	lw	a5,24(a0)
	bne	a5,zero,.L905
	lw	a5,0(a0)
	addi	a5,a5,-12
	bgtu	a5,a3,.L905
	sw	a4,4(sp)
	call	emittype.part.0
	lw	a4,4(sp)
	j	.L905
.L907:
	mv	a1,s0
	mv	a0,s1
	sw	a4,4(sp)
	call	funcalloc
	lw	a5,20(s0)
	lw	a1,12(s0)
	lw	a4,4(sp)
	addi	a3,sp,12
	li	a2,0
	mv	a0,s1
	sw	zero,32(sp)
	sw	zero,36(sp)
	sw	a5,28(sp)
	sw	a5,12(sp)
	sw	zero,16(sp)
	sw	zero,20(sp)
	call	funcstore
	lw	a4,4(sp)
	lw	s0,32(s0)
	addi	a4,a4,16
	bne	s0,zero,.L908
.L904:
	lw	a0,0(sp)
	call	strlen
	addi	a2,a0,1
	li	a3,0
	li	a1,2
	lla	a0,typechar
	call	mkarraytype
	mv	a2,a0
	li	a4,0
	li	a3,0
	li	a1,1
	lla	a0,.LC92
	call	mkdecl
	sw	zero,44(a0)
	mv	s0,a0
	call	mkglobal
	mv	a5,a0
	lw	a0,8(sp)
	sw	a5,20(s0)
	mv	a1,s0
	call	scopeputdecl
	li	a0,96
	sw	s0,4(s1)
	call	xmalloc
	lla	a2,.LANCHOR2
	lw	a5,0(a2)
	lw	a4,24(s1)
	li	a3,7
	sw	a3,0(a0)
	addi	a5,a5,1
	lla	a3,.LC93
	sw	a3,8(a0)
	sw	a5,4(a0)
	sw	zero,16(a0)
	sw	zero,20(a0)
	sw	zero,24(a0)
	sw	zero,72(a0)
	sw	zero,56(a0)
	sw	zero,88(a0)
	lw	ra,48(sp)
	lw	s0,44(sp)
	sw	a0,88(a4)
	sw	a0,24(s1)
	sw	a5,0(a2)
	mv	a0,s1
	lw	s1,40(sp)
	addi	sp,sp,52
	jr	ra
.L917:
	lw	a5,0(a0)
	li	a4,1
	addi	a5,a5,-12
	bgtu	a5,a4,.L903
	call	emittype.part.0
	j	.L903
	.size	mkfunc, .-mkfunc
	.section	.rodata.funcasm.str1.4,"aMS",@progbits,1
	.align	2
.LC94:
	.string	"UNKNOWN"
	.align	2
.LC95:
	.string	"multiple outputs in asm not supported"
	.align	2
.LC96:
	.string	"a%d"
	.align	2
.LC97:
	.string	"mv %s, %s; "
	.align	2
.LC98:
	.string	""
	.section	.text.funcasm,"ax",@progbits
	.align	2
	.globl	funcasm
	.hidden	funcasm
	.type	funcasm, @function
funcasm:
	addi	sp,sp,-180
	sw	s0,172(sp)
	sw	ra,176(sp)
	sw	s1,168(sp)
	sw	a2,28(sp)
	sw	a0,4(sp)
	sw	a3,16(sp)
	sw	a4,8(sp)
	mv	s0,a1
	beq	a2,zero,.L1036
	lw	a5,28(sp)
	lw	a5,8(a5)
	beq	a5,zero,.L930
	lla	a1,.LC95
	li	a0,0
	call	error
.L930:
	lw	a5,16(sp)
	sw	zero,56(sp)
	sw	zero,60(sp)
	sw	zero,64(sp)
	beq	a5,zero,.L971
	li	a5,1
	sw	a5,32(sp)
	sw	a5,24(sp)
.L970:
	lw	s1,16(sp)
	sw	zero,0(sp)
	sw	s0,20(sp)
.L937:
	lw	a5,4(s1)
	li	a3,8
	lw	a4,0(a5)
	bne	a4,a3,.L932
.L933:
	lw	a5,20(a5)
	lw	a4,0(a5)
	beq	a4,a3,.L933
.L932:
	bne	a4,zero,.L934
	lw	a5,32(a5)
	beq	a5,zero,.L934
	lw	s0,24(a5)
	beq	s0,zero,.L934
	mv	a0,s0
	call	strlen
	li	a3,1
	mv	a4,a0
	bleu	a0,a3,.L935
	lbu	a3,0(s0)
	li	a2,34
	beq	a3,a2,.L1037
.L935:
	lw	a5,0(sp)
	li	a3,7
	lla	a4,.LC94
	ble	a5,a3,.L1038
.L936:
	addi	t0,sp,104
	mv	a3,s0
	lla	a2,.LC97
	li	a1,64
	mv	a0,t0
	sw	t0,12(sp)
	call	snprintf
	lw	t0,12(sp)
	mv	a0,t0
	call	strlen
	lw	t0,12(sp)
	mv	a2,a0
	addi	a0,sp,56
	mv	a1,t0
	call	arrayaddbuf
	li	a0,12
	call	xmalloc
	lw	a5,8(sp)
	sw	s0,0(a0)
	sw	a0,8(sp)
	sw	a5,8(a0)
.L934:
	lw	a5,0(sp)
	lw	s1,8(s1)
	addi	a5,a5,1
	sw	a5,0(sp)
	bne	s1,zero,.L937
	lw	s0,20(sp)
.L931:
	mv	a0,s0
	call	strlen
	addi	a0,a0,16
	slli	a0,a0,1
	call	xmalloc
	lbu	s1,0(s0)
	sw	a0,20(sp)
	beq	s1,zero,.L973
	mv	a4,s0
	mv	a5,a4
	mv	s0,a0
	j	.L956
.L939:
	sb	s1,0(s0)
	mv	a5,a4
	addi	s0,s0,1
.L941:
	lbu	s1,0(a5)
	beq	s1,zero,.L1039
.L956:
	li	a3,37
	addi	a4,a5,1
	bne	s1,a3,.L939
	lbu	a0,1(a5)
	bne	a0,s1,.L940
	sb	s1,0(s0)
	lbu	s1,2(a5)
	addi	a5,a5,2
	addi	s0,s0,1
	bne	s1,zero,.L956
.L1039:
	mv	a5,s0
.L938:
	sb	zero,0(a5)
	lw	a2,60(sp)
	sw	zero,68(sp)
	sw	zero,72(sp)
	sw	zero,76(sp)
	bne	a2,zero,.L1040
.L957:
	lw	s0,20(sp)
	mv	a0,s0
	call	strlen
	mv	a2,a0
	mv	a1,s0
	addi	a0,sp,68
	call	arrayaddbuf
	li	a2,1
	lla	a1,.LC98
	addi	a0,sp,68
	call	arrayaddbuf
	lw	a5,24(sp)
	sw	zero,32(sp)
	beq	a5,zero,.L958
	lw	a5,28(sp)
	addi	a0,sp,92
	lw	a5,4(a5)
	lw	a1,8(a5)
	call	qbetype
	lbu	a5,92(sp)
	sw	a5,32(sp)
.L958:
	lw	a5,16(sp)
	beq	a5,zero,.L959
	li	a4,0
.L960:
	lw	a5,8(a5)
	mv	s0,a4
	addi	a4,a4,1
	bne	a5,zero,.L960
	slli	s1,a4,2
	mv	a0,s1
	call	xmalloc
	mv	a5,a0
	mv	a0,s1
	li	s1,0
	sw	a5,12(sp)
	call	xmalloc
	sw	s0,36(sp)
	mv	s0,s1
	lw	s1,16(sp)
	addi	a5,sp,104
	sw	a0,8(sp)
	sw	a5,0(sp)
.L962:
	lw	a1,4(s1)
	lw	a0,4(sp)
	call	funcexpr
	lw	a5,12(sp)
	lw	a3,4(s1)
	add	a2,a5,s0
	sw	a0,0(a2)
	lw	a1,8(a3)
	lw	a0,0(sp)
	call	qbetype
	lw	a5,8(sp)
	lbu	a2,104(sp)
	lw	s1,8(s1)
	add	a3,a5,s0
	sw	a2,0(a3)
	addi	s0,s0,4
	bne	s1,zero,.L962
	lw	s1,68(sp)
	li	a0,16
	lw	s0,36(sp)
	call	xmalloc
	li	a5,8
	sw	s1,8(a0)
	mv	a3,a0
	sw	a5,0(a0)
	lw	a2,32(sp)
	lw	a0,4(sp)
	li	a4,0
	li	a1,87
	call	funcinst
	lw	t1,12(sp)
	lw	t0,8(sp)
	li	s1,0
	sw	s0,16(sp)
	sw	a0,32(sp)
	mv	s0,s1
	mv	s1,t1
.L966:
	lw	a3,0(s1)
	lw	a2,0(t0)
	lw	a0,4(sp)
	li	a4,0
	li	a1,91
	sw	t0,0(sp)
	call	funcinst
	lw	t0,0(sp)
	lw	a5,16(sp)
	mv	a4,s0
	addi	t0,t0,4
	addi	s0,s0,1
	addi	s1,s1,4
	bne	a4,a5,.L966
.L967:
	lw	a0,12(sp)
	call	free
	lw	a0,8(sp)
	call	free
	lw	a0,20(sp)
	call	free
	lw	a0,56(sp)
	beq	a0,zero,.L965
	call	free
.L965:
	lw	a5,24(sp)
	beq	a5,zero,.L918
	lw	a5,28(sp)
	lw	s0,4(a5)
	li	a5,14
	lw	a4,0(s0)
	bne	a4,a5,.L969
	lw	a5,32(sp)
	sw	a5,32(s0)
.L918:
	lw	ra,176(sp)
	lw	s0,172(sp)
	lw	s1,168(sp)
	addi	sp,sp,180
	jr	ra
.L940:
	sw	a4,0(sp)
	call	isdigit
	lw	a4,0(sp)
	beq	a0,zero,.L939
	sw	s0,0(sp)
	li	s1,0
	mv	s0,a4
	j	.L942
.L944:
	lbu	s1,0(s0)
	addi	s0,s0,1
	addi	s1,s1,-48
	add	s1,s1,a5
.L942:
	lbu	a0,0(s0)
	call	isdigit
	slli	a5,s1,2
	add	a5,a5,s1
	slli	a5,a5,1
	bne	a0,zero,.L944
	lw	a5,32(sp)
	mv	a4,s0
	lw	s0,0(sp)
	bge	s1,a5,.L945
	sw	a4,0(sp)
	call	get_ret_reg
	lbu	a5,0(a0)
	lw	a4,0(sp)
	beq	a5,zero,.L975
.L946:
	sb	a5,0(s0)
	lbu	a5,1(a0)
	addi	a0,a0,1
	addi	s0,s0,1
	bne	a5,zero,.L946
.L975:
	mv	a5,a4
	j	.L941
.L1038:
	mv	a3,a5
	lla	a2,.LC96
	li	a1,4
	lla	a0,.LANCHOR10
	call	snprintf
	lla	a4,.LANCHOR10
	j	.L936
.L1037:
	addi	a0,a0,-1
	add	a2,s0,a0
	lbu	a2,0(a2)
	bne	a2,a3,.L935
	sw	a4,12(sp)
	call	xmalloc
	lw	a4,12(sp)
	addi	a1,s0,1
	sw	a0,36(sp)
	addi	a2,a4,-2
	sw	a2,12(sp)
	call	memcpy
	lw	a3,36(sp)
	lw	a2,12(sp)
	mv	s0,a3
	add	a4,a3,a2
	sb	zero,0(a4)
	j	.L935
.L969:
	lw	s1,4(sp)
	mv	a2,s0
	addi	a0,sp,80
	mv	a1,s1
	call	funclval
	lw	a5,80(sp)
	lw	a2,12(s0)
	lw	a1,8(s0)
	sw	a5,40(sp)
	lw	a5,84(sp)
	lw	a4,32(sp)
	addi	a3,sp,40
	sw	a5,44(sp)
	lw	a5,88(sp)
	mv	a0,s1
	sw	a5,48(sp)
	call	funcstore
	lw	ra,176(sp)
	lw	s0,172(sp)
	lw	s1,168(sp)
	addi	sp,sp,180
	jr	ra
.L1040:
	lw	a1,56(sp)
	addi	a0,sp,68
	call	arrayaddbuf
	j	.L957
.L1036:
	beq	a3,zero,.L1041
	sw	zero,56(sp)
	sw	zero,60(sp)
	sw	zero,64(sp)
	sw	zero,32(sp)
	sw	zero,24(sp)
	j	.L970
.L945:
	lw	a5,32(sp)
	sub	a3,s1,a5
	lw	a5,16(sp)
	ble	a3,zero,.L947
.L1035:
	beq	a5,zero,.L948
	addi	a0,a0,1
	lw	a5,8(a5)
	bne	a3,a0,.L1035
.L947:
	beq	a5,zero,.L948
	lw	a5,4(a5)
	li	a1,8
	lw	a2,0(a5)
	bne	a2,a1,.L950
.L951:
	lw	a5,20(a5)
	lw	a2,0(a5)
	beq	a2,a1,.L951
.L950:
	bne	a2,zero,.L948
	lw	a5,32(a5)
	beq	a5,zero,.L948
	lw	a0,24(a5)
	beq	a0,zero,.L948
	sw	a4,0(sp)
	call	strip_quotes
	lbu	a5,0(a0)
	lw	a4,0(sp)
	beq	a5,zero,.L952
	mv	a3,a0
.L953:
	sb	a5,0(s0)
	lbu	a5,1(a3)
	addi	a3,a3,1
	addi	s0,s0,1
	bne	a5,zero,.L953
.L952:
	sw	a4,0(sp)
	call	free
	lw	a4,0(sp)
	mv	a5,a4
	j	.L941
.L948:
	li	a1,7
	lla	a5,.LC94
	li	a2,85
	bleu	a3,a1,.L1042
.L955:
	sb	a2,0(s0)
	lbu	a2,1(a5)
	addi	a5,a5,1
	addi	s0,s0,1
	bne	a2,zero,.L955
	mv	a5,a4
	j	.L941
.L973:
	lw	a5,20(sp)
	j	.L938
.L959:
	li	a0,0
	call	xmalloc
	mv	a5,a0
	li	a0,0
	sw	a5,12(sp)
	call	xmalloc
	mv	a5,a0
	lw	s0,68(sp)
	li	a0,16
	sw	a5,8(sp)
	call	xmalloc
	li	a5,8
	mv	a3,a0
	sw	a5,0(a0)
	sw	s0,8(a0)
	lw	a2,32(sp)
	lw	a0,4(sp)
	li	a4,0
	li	a1,87
	call	funcinst
	sw	a0,32(sp)
	j	.L967
.L1041:
	beq	a4,zero,.L1043
	sw	zero,56(sp)
	sw	zero,60(sp)
	sw	zero,64(sp)
	sw	zero,32(sp)
	sw	zero,24(sp)
	j	.L931
.L971:
	li	a5,1
	sw	a5,32(sp)
	sw	a5,24(sp)
	j	.L931
.L1042:
	lla	a2,.LC96
	li	a1,4
	lla	a0,.LANCHOR10
	sw	a4,0(sp)
	call	snprintf
	lla	a5,.LANCHOR10
	lbu	a2,0(a5)
	lw	a4,0(sp)
	mv	a5,a4
	beq	a2,zero,.L941
	lla	a5,.LANCHOR10
	j	.L955
.L1043:
	beq	a1,zero,.L918
	lbu	a5,0(a1)
	beq	a5,zero,.L918
	mv	a0,s0
	addi	a1,sp,104
	call	process_asm_string.part.0
	lw	a4,104(sp)
	mv	s1,a0
	mv	t1,a0
	li	a5,0
	li	s0,8
	beq	a4,zero,.L928
	sw	a0,0(sp)
	mv	s1,a5
.L927:
	lw	a4,0(t1)
	li	a0,16
	sw	t1,12(sp)
	sw	a4,8(sp)
	call	xmalloc
	lw	a4,8(sp)
	mv	a3,a0
	sw	s0,0(a0)
	sw	a4,8(a0)
	lw	a0,4(sp)
	li	a4,0
	li	a2,0
	li	a1,86
	call	funcinst
	lw	t1,12(sp)
	lw	a4,104(sp)
	addi	s1,s1,1
	addi	t1,t1,4
	bgtu	a4,s1,.L927
	lw	s1,0(sp)
.L928:
	beq	s1,zero,.L918
	mv	a0,s1
	call	free
	j	.L918
	.size	funcasm, .-funcasm
	.section	.text.funcswitch,"ax",@progbits
	.align	2
	.globl	funcswitch
	.hidden	funcswitch
	.type	funcswitch, @function
funcswitch:
	addi	sp,sp,-32
	sw	s0,24(sp)
	mv	s0,a2
	mv	a2,a1
	lw	a1,4(s0)
	sw	s1,20(sp)
	mv	s1,a0
	addi	a0,sp,8
	sw	ra,28(sp)
	sw	a3,4(sp)
	sw	a2,0(sp)
	call	qbetype
	lw	a3,0(s0)
	lw	s0,24(sp)
	lw	a4,4(sp)
	lbu	a1,8(sp)
	lw	a2,0(sp)
	lw	ra,28(sp)
	mv	a0,s1
	lw	s1,20(sp)
	addi	sp,sp,32
	tail	casesearch
	.size	funcswitch, .-funcswitch
	.section	.rodata.emitfunc.str1.4,"aMS",@progbits,1
	.align	2
.LC99:
	.string	"Assertion `inst->kind < (sizeof(instname) / sizeof((instname)[0]))' failed"
	.align	2
.LC100:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/qbe.c:1394  \n"
	.align	2
.LC101:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/qbe.c:1464  \n"
	.align	2
.LC102:
	.string	"main"
	.align	2
.LC103:
	.string	"export"
	.align	2
.LC104:
	.string	"function "
	.align	2
.LC105:
	.string	"..."
	.align	2
.LC106:
	.string	") {"
	.align	2
.LC107:
	.string	" =%c phi "
	.align	2
.LC108:
	.string	" ="
	.align	2
.LC109:
	.string	", ..."
	.align	2
.LC110:
	.string	"\tret"
	.align	2
.LC111:
	.string	"\tjmp "
	.align	2
.LC112:
	.string	"\tjnz "
	.align	2
.LC113:
	.string	"\thlt\n"
	.section	.text.emitfunc,"ax",@progbits
	.align	2
	.globl	emitfunc
	.hidden	emitfunc
	.type	emitfunc, @function
emitfunc:
	addi	sp,sp,-48
	sw	s1,36(sp)
	lw	s1,24(a0)
	sw	s0,40(sp)
	sw	ra,44(sp)
	lw	a5,72(s1)
	sw	a0,0(sp)
	mv	s0,a1
	bne	a5,zero,.L1048
	lw	a0,8(a0)
	lla	a1,.LC102
	call	strcmp
	beq	a0,zero,.L1150
	li	a5,0
.L1049:
	li	a3,3
	sw	a3,72(s1)
	sw	a5,76(s1)
.L1048:
	bne	s0,zero,.L1151
.L1051:
	lla	a5,stdout
	lw	a1,0(a5)
	lla	a0,.LC104
	call	my_fputs
	lw	s0,0(sp)
	lla	a5,typevoid
	lw	a4,16(s0)
	lw	a1,28(a4)
	beq	a1,a5,.L1052
	addi	a0,sp,12
	call	qbetype
	lw	a5,16(s0)
	lbu	a0,12(sp)
	lw	a5,28(a5)
	lw	a5,24(a5)
	beq	a5,zero,.L1053
	lw	a3,0(a5)
	li	a4,6
	beq	a3,a4,.L1152
.L1053:
	beq	a0,zero,.L1055
	call	my_putchar
.L1054:
	li	a0,32
	call	my_putchar
.L1052:
	lw	s0,0(sp)
	lw	a5,0(s0)
	lw	a0,20(a5)
	call	emitname
	li	a0,40
	call	my_putchar
	lw	a4,16(s0)
	lw	s0,12(s0)
	lw	s1,52(a4)
	beq	s1,zero,.L1153
.L1056:
	lw	a1,12(s1)
	addi	a0,sp,24
	call	qbetype
	lw	a4,12(s1)
	lbu	a0,24(sp)
	lw	a4,24(a4)
	beq	a4,zero,.L1059
	lw	a2,0(a4)
	li	a3,6
	beq	a2,a3,.L1154
.L1059:
	beq	a0,zero,.L1061
	call	my_putchar
.L1060:
	li	a0,32
	call	my_putchar
	mv	a0,s0
	call	emitname
	lw	s1,32(s1)
	lw	a5,0(sp)
	addi	s0,s0,16
	beq	s1,zero,.L1155
	lw	a4,16(a5)
	lw	a4,52(a4)
	beq	a4,s1,.L1056
	lla	a5,stdout
	lw	a1,0(a5)
	lla	a0,.LC34
	call	my_fputs
	j	.L1056
.L1154:
	mv	a0,a4
	call	emitname
	j	.L1060
.L1061:
	lla	a0,.LC32
	call	fatal
	j	.L1060
.L1155:
	lw	a5,16(a5)
	lbu	a4,48(a5)
	bne	a4,zero,.L1156
.L1064:
	lla	a0,.LC106
	call	my_puts
	lw	a5,0(sp)
	lw	a5,20(a5)
	sw	a5,8(sp)
	beq	a5,zero,.L1100
.L1067:
	lw	s0,8(sp)
	mv	a0,s0
	call	emitname
	li	a0,10
	call	my_putchar
	lw	a5,56(s0)
	bne	a5,zero,.L1157
.L1068:
	lw	a5,8(sp)
	lw	s0,16(a5)
	lw	a5,20(a5)
	add	a5,s0,a5
	sw	a5,4(sp)
	bne	s0,a5,.L1069
	j	.L1095
.L1081:
	lla	a4,.LANCHOR11
	slli	a5,a5,2
	add	a5,a4,a5
	lla	a4,stdout
	lw	a1,0(a4)
	lw	a0,0(a5)
	addi	s0,s0,4
	call	my_fputs
	li	a0,32
	call	my_putchar
	lw	a0,24(s1)
	call	emitvalue
	lw	a5,0(s1)
	li	a4,1
	addi	a5,a5,-87
	bleu	a5,a4,.L1158
	lw	a5,28(s1)
	beq	a5,zero,.L1094
	lla	a5,stdout
	lw	a1,0(a5)
	lla	a0,.LC34
	call	my_fputs
	lw	a0,28(s1)
	call	emitvalue
.L1094:
	li	a0,10
	call	my_putchar
	lw	a5,4(sp)
	beq	a5,s0,.L1095
.L1069:
	lw	s1,0(s0)
	li	a0,9
	call	my_putchar
	lw	a5,0(s1)
	li	a4,90
	bgtu	a5,a4,.L1159
	lw	a4,8(s1)
	beq	a4,zero,.L1081
	addi	a0,s1,8
	call	emitvalue
	lla	a5,stdout
	lw	a1,0(a5)
	lla	a0,.LC108
	call	my_fputs
	lw	a5,28(s1)
	lw	a0,4(s1)
	beq	a5,zero,.L1082
	lw	a3,0(a5)
	li	a4,6
	beq	a3,a4,.L1160
.L1082:
	beq	a0,zero,.L1084
	call	my_putchar
.L1083:
	li	a0,32
	call	my_putchar
	lw	a5,0(s1)
	j	.L1081
.L1160:
	mv	a0,a5
	call	emitname
	j	.L1083
.L1158:
	li	a0,40
	call	my_putchar
	lw	a5,4(sp)
	beq	a5,s0,.L1086
	li	a5,1
	sw	a5,0(sp)
.L1093:
	lw	s1,0(s0)
	li	a5,92
	lw	a4,0(s1)
	beq	a4,a5,.L1161
	li	a3,91
	bne	a4,a3,.L1086
	lw	a5,0(sp)
	beq	a5,zero,.L1162
.L1089:
	lw	a4,28(s1)
	lw	a0,4(s1)
	beq	a4,zero,.L1090
	lw	a2,0(a4)
	li	a3,6
	beq	a2,a3,.L1163
.L1090:
	beq	a0,zero,.L1092
	call	my_putchar
.L1091:
	li	a0,32
	call	my_putchar
	lw	a0,24(s1)
	sw	zero,0(sp)
	call	emitvalue
.L1088:
	lw	a5,4(sp)
	addi	s0,s0,4
	bne	a5,s0,.L1093
.L1086:
	li	a0,41
	call	my_putchar
	li	a0,10
	call	my_putchar
	lw	a5,4(sp)
	bne	a5,s0,.L1069
.L1095:
	lw	a5,8(sp)
	li	a4,4
	lw	a5,72(a5)
	bgtu	a5,a4,.L1105
	lla	a4,.L1072
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.emitfunc,"a",@progbits
	.align	2
	.align	2
.L1072:
	.word	.L1076-.L1072
	.word	.L1075-.L1072
	.word	.L1074-.L1072
	.word	.L1073-.L1072
	.word	.L1071-.L1072
	.section	.text.emitfunc
.L1163:
	mv	a0,a4
	call	emitname
	j	.L1091
.L1092:
	lla	a0,.LC32
	call	fatal
	j	.L1091
.L1162:
	lla	a5,stdout
	lw	a1,0(a5)
	lla	a0,.LC34
	call	my_fputs
	j	.L1089
.L1161:
	lla	a5,stdout
	lw	a1,0(a5)
	lla	a0,.LC109
	call	my_fputs
	j	.L1088
.L1084:
	lla	a0,.LC32
	call	fatal
	j	.L1083
.L1073:
	lla	s0,stdout
	lw	a1,0(s0)
	lla	a0,.LC110
	call	my_fputs
	lw	s1,8(sp)
	lw	a5,76(s1)
	beq	a5,zero,.L1148
	lw	a1,0(s0)
	li	a0,32
	call	my_fputc
	lw	a0,76(s1)
	call	emitvalue
.L1148:
	li	a0,10
	call	my_putchar
.L1076:
	lw	a5,8(sp)
	lw	a5,88(a5)
	sw	a5,8(sp)
	bne	a5,zero,.L1067
.L1100:
	lw	s0,40(sp)
	lw	ra,44(sp)
	lw	s1,36(sp)
	lla	a0,.LC36
	addi	sp,sp,48
	tail	my_puts
.L1071:
	lla	a5,stdout
	lw	a1,0(a5)
	lla	a0,.LC113
	call	my_fputs
	lw	a5,8(sp)
	lw	a5,88(a5)
	sw	a5,8(sp)
	bne	a5,zero,.L1067
	j	.L1100
.L1074:
	lla	s0,stdout
	lw	a1,0(s0)
	lla	a0,.LC112
	call	my_fputs
	lw	s1,8(sp)
	lw	a0,76(s1)
	call	emitvalue
	lw	a1,0(s0)
	lla	a0,.LC34
	call	my_fputs
	lw	a0,80(s1)
	call	emitname
	lw	a1,0(s0)
	lla	a0,.LC34
	call	my_fputs
	lw	a0,84(s1)
	call	emitname
	j	.L1148
.L1075:
	lla	a5,stdout
	lw	a1,0(a5)
	lla	a0,.LC111
	call	my_fputs
	lw	a5,8(sp)
	lw	a0,80(a5)
	call	emitname
	li	a0,10
	call	my_putchar
	lw	a5,8(sp)
	lw	a5,88(a5)
	sw	a5,8(sp)
	bne	a5,zero,.L1067
	j	.L1100
.L1157:
	li	a0,9
	call	my_putchar
	lw	s0,8(sp)
	addi	a0,s0,56
	call	emitvalue
	lw	a1,32(s0)
	lla	a0,.LC107
	call	my_printf
	lw	a0,36(s0)
	call	emitname
	li	a0,32
	call	my_putchar
	lw	a0,44(s0)
	call	emitvalue
	lla	a5,stdout
	lw	a1,0(a5)
	lla	a0,.LC34
	call	my_fputs
	lw	a0,40(s0)
	call	emitname
	li	a0,32
	call	my_putchar
	lw	a0,48(s0)
	call	emitvalue
	li	a0,10
	call	my_putchar
	j	.L1068
.L1156:
	lw	a5,52(a5)
	lla	a4,stdout
	lw	a1,0(a4)
	beq	a5,zero,.L1066
	lla	a0,.LC34
	call	my_fputs
.L1066:
	lla	a5,stdout
	lw	a1,0(a5)
	lla	a0,.LC105
	call	my_fputs
	j	.L1064
.L1150:
	lw	a4,0(sp)
	lla	a3,typeint
	li	a5,0
	lw	a2,16(a4)
	lw	a2,28(a2)
	bne	a2,a3,.L1049
	li	a0,16
	call	xmalloc
	lw	a5,0(sp)
	li	a2,2
	li	a1,0
	lw	s1,24(a5)
	mv	a5,a0
	lw	a3,72(s1)
	sw	a2,0(a0)
	li	a2,0
	sw	a1,8(a0)
	sw	a2,12(a0)
	beq	a3,zero,.L1049
	beq	s0,zero,.L1051
.L1151:
	lla	a0,.LC103
	call	my_puts
	j	.L1051
.L1055:
	lla	a0,.LC32
	call	fatal
	j	.L1054
.L1152:
	mv	a0,a5
	call	emitname
	j	.L1054
.L1153:
	lbu	a5,48(a4)
	bne	a5,zero,.L1066
	j	.L1064
.L1159:
	lla	s0,.LC18
	li	a0,65
.L1078:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L1078
	lla	s0,.LC99
	li	a0,65
.L1079:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L1079
	lla	s0,.LC100
	li	a0,32
.L1080:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L1080
.L1099:
	li	a0,1
	call	halt
.L1105:
	lla	s0,.LC18
	li	a0,65
.L1070:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L1070
	lla	s0,.LC19
	li	a0,65
.L1097:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L1097
	lla	s0,.LC101
	li	a0,32
.L1098:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L1098
	j	.L1099
	.size	emitfunc, .-emitfunc
	.section	.rodata.emitdata.str1.4,"aMS",@progbits,1
	.align	2
.LC114:
	.string	"Assertion `cur->expr->kind == EXPRSTRING' failed"
	.align	2
.LC115:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/qbe.c:1606  \n"
	.align	2
.LC116:
	.string	"Assertion `init->expr->kind == EXPRCONST' failed"
	.align	2
.LC117:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/qbe.c:1607  \n"
	.align	2
.LC118:
	.string	"Assertion `cur->expr->type->prop & PROPINT' failed"
	.align	2
.LC119:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/qbe.c:1626  \n"
	.align	2
.LC120:
	.string	"Assertion `cur->expr->kind == EXPRCONST' failed"
	.align	2
.LC121:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/qbe.c:1627  \n"
	.align	2
.LC122:
	.string	"Assertion `offset <= d->type->size' failed"
	.align	2
.LC123:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/qbe.c:1651  \n"
	.align	2
.LC124:
	.string	"export "
	.align	2
.LC125:
	.string	" = align %d { "
	.align	2
.LC126:
	.string	"b %u, "
	.align	2
.LC127:
	.string	"z %llu, "
	.align	2
.LC128:
	.string	"%c "
	.align	2
.LC129:
	.string	"z %llu "
	.section	.text.emitdata,"ax",@progbits
	.align	2
	.globl	emitdata
	.hidden	emitdata
	.type	emitdata, @function
emitdata:
	addi	sp,sp,-80
	sw	s0,72(sp)
	sw	ra,76(sp)
	sw	s1,68(sp)
	sw	a0,52(sp)
	lw	s0,40(a0)
	mv	t0,a1
	beq	a1,zero,.L1168
	sw	s0,0(sp)
	mv	s1,a1
	mv	s0,a1
.L1165:
	lw	a0,16(s0)
	call	eval
	sw	a0,16(s0)
	lw	s0,24(s0)
	bne	s0,zero,.L1165
	lw	s0,0(sp)
	mv	t0,s1
.L1168:
	lw	a5,52(sp)
	lw	a4,44(a5)
	li	a5,1
	beq	a4,a5,.L1166
	lla	a5,stdout
	sw	a5,44(sp)
.L1167:
	lw	a5,52(sp)
	lw	a4,8(a5)
	li	a5,2
	beq	a4,a5,.L1266
.L1169:
	lw	a5,44(sp)
	lla	a0,.LC60
	sw	t0,0(sp)
	lw	a1,0(a5)
	call	my_fputs
	lw	a5,52(sp)
	lw	a0,20(a5)
	call	emitname
	mv	a1,s0
	lla	a0,.LC125
	call	my_printf
	lw	t0,0(sp)
	beq	t0,zero,.L1267
	sw	zero,36(sp)
	sw	zero,40(sp)
	sw	zero,32(sp)
	sw	zero,28(sp)
	mv	t2,t0
.L1170:
	lw	a5,8(t2)
	lw	s0,24(t2)
	mv	s1,t2
	sw	a5,20(sp)
	lw	a5,12(t2)
	sw	a5,24(sp)
	lh	a5,22(t2)
	sw	a5,16(sp)
	bne	s0,zero,.L1211
	j	.L1186
.L1225:
	li	a1,1
	beq	a2,a1,.L1268
.L1185:
	lw	s0,24(s0)
	beq	s0,zero,.L1262
.L1211:
	lw	a5,4(s0)
	lw	a2,24(sp)
	lw	a1,0(s0)
	sw	a5,0(sp)
	lw	a5,20(sp)
	slli	t1,a2,3
	lw	a2,0(sp)
	slli	a3,a5,3
	srli	a5,a5,29
	lh	a0,20(s0)
	or	t1,a5,t1
	lw	a5,16(sp)
	slli	a4,a1,3
	srli	t2,a1,29
	slli	a2,a2,3
	srai	t0,a5,31
	or	a2,t2,a2
	sub	a5,a3,a5
	srai	t2,a0,31
	add	a0,a4,a0
	sgtu	a3,a5,a3
	sw	a5,4(sp)
	sltu	a4,a0,a4
	sub	a5,t1,t0
	add	a2,a2,t2
	sub	a5,a5,a3
	add	a4,a4,a2
	bleu	a5,a4,.L1269
	lw	a5,16(s1)
	li	a3,2
	lw	a4,0(a5)
	bne	a4,a3,.L1270
.L1172:
	lw	a4,16(s0)
	li	a2,1
	lw	a3,0(a4)
	bne	a3,a2,.L1271
	lw	a3,8(a5)
	lw	a0,0(s1)
	sw	a5,8(sp)
	lw	a3,28(a3)
	lw	a5,0(sp)
	lw	t1,4(s1)
	lw	a2,16(a3)
	sub	a0,a1,a0
	lw	a3,20(a3)
	sub	t1,a5,t1
	sgtu	a1,a0,a1
	sub	a1,t1,a1
	sw	a4,12(sp)
	sw	a2,4(sp)
	sw	a3,0(sp)
	call	__udivdi3
	lw	a2,4(sp)
	li	a1,2
	lw	a3,0(sp)
	lw	a5,8(sp)
	lw	a4,12(sp)
	beq	a2,a1,.L1272
.L1224:
	li	a1,4
	bne	a2,a1,.L1225
	bne	a3,zero,.L1225
	lw	a5,36(a5)
	lw	a4,32(a4)
	slli	a0,a0,2
	lw	s0,24(s0)
	add	a5,a5,a0
	sw	a4,0(a5)
	bne	s0,zero,.L1211
.L1262:
	mv	t2,s1
.L1186:
	lh	a2,20(t2)
	lw	a5,16(sp)
	lw	a1,0(t2)
	srai	a4,a2,31
	andi	a4,a4,7
	addi	a3,a5,7
	add	a4,a4,a2
	srai	s1,a4,3
	srai	a5,a3,31
	add	t1,s1,a1
	andi	a5,a5,7
	lw	a1,20(sp)
	add	a5,a5,a3
	lw	a3,4(t2)
	srai	a2,a5,3
	sub	a2,a1,a2
	srai	a4,a4,31
	add	a4,a4,a3
	sgtu	a3,a2,a1
	lw	a1,24(sp)
	srai	a5,a5,31
	sltu	s1,t1,s1
	sub	a5,a1,a5
	sub	a5,a5,a3
	sw	a5,16(sp)
	sw	a5,24(sp)
	lw	a5,28(sp)
	add	s1,s1,a4
	sw	a2,12(sp)
	sw	a2,20(sp)
	mv	a4,t1
	mv	a3,s1
	bgtu	s1,a5,.L1226
	bne	s1,a5,.L1189
	lw	a5,32(sp)
	bleu	t1,a5,.L1189
.L1226:
	lw	a5,36(sp)
	lw	a2,40(sp)
	or	a5,a5,a2
	bne	a5,zero,.L1273
.L1191:
	lw	a5,32(sp)
	sw	a4,4(sp)
	lw	a4,28(sp)
	sub	a1,t1,a5
	sgtu	a5,a1,t1
	sub	a2,s1,a4
	sub	a2,a2,a5
	lla	a0,.LC127
	sw	t2,48(sp)
	sw	a3,8(sp)
	sw	t1,0(sp)
	call	my_printf
	lw	t1,0(sp)
	lw	a4,4(sp)
	lw	a3,8(sp)
	lw	t2,48(sp)
	sw	zero,36(sp)
	sw	zero,40(sp)
.L1189:
	lw	a2,16(t2)
	lw	a5,20(t2)
	lw	a1,8(a2)
	bne	a5,zero,.L1274
	lw	a4,0(a1)
	li	a5,10
	bne	a4,a5,.L1209
	lw	a1,28(a1)
.L1209:
	addi	a0,sp,56
	sw	t2,0(sp)
	call	qbetype
	lbu	a1,57(sp)
	lla	a0,.LC128
	call	my_printf
	lw	t2,0(sp)
	lw	a5,8(t2)
	lw	a1,0(t2)
	lw	a2,12(t2)
	lw	a4,4(t2)
	sub	a1,a5,a1
	lw	a0,16(t2)
	sgtu	a5,a1,a5
	sub	a2,a2,a4
	sub	a2,a2,a5
	call	dataitem
	lw	a5,44(sp)
	lla	a0,.LC34
	lw	a1,0(a5)
	call	my_fputs
	beq	s0,zero,.L1210
.L1278:
	lw	a5,12(sp)
	mv	t2,s0
	sw	a5,32(sp)
	lw	a5,16(sp)
	sw	a5,28(sp)
	j	.L1170
.L1268:
	bne	a3,zero,.L1185
	lw	a5,36(a5)
	lw	a4,32(a4)
	add	a5,a5,a0
	sb	a4,0(a5)
	lw	a5,8(s1)
	sw	a5,20(sp)
	lw	a5,12(s1)
	sw	a5,24(sp)
	lh	a5,22(s1)
	sw	a5,16(sp)
	j	.L1185
.L1272:
	bne	a3,zero,.L1224
	lw	a5,36(a5)
	lw	a4,32(a4)
	slli	a0,a0,1
	add	a0,a5,a0
	sh	a4,0(a0)
	lh	a5,22(s1)
	sw	a5,16(sp)
	j	.L1185
.L1269:
	bne	a5,a4,.L1262
	lw	a5,4(sp)
	bleu	a5,a0,.L1262
	lw	a5,16(s1)
	li	a3,2
	lw	a4,0(a5)
	beq	a4,a3,.L1172
.L1270:
	lla	s0,.LC18
	li	a0,65
.L1173:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L1173
	lla	s0,.LC114
	li	a0,65
.L1174:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L1174
	lla	s0,.LC115
	li	a0,32
.L1175:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L1175
.L1180:
	li	a0,1
	call	halt
.L1274:
	lw	a5,4(a1)
	andi	a5,a5,2
	beq	a5,zero,.L1275
	lw	a1,0(a2)
	li	a5,1
	bne	a1,a5,.L1276
	lh	a5,20(t2)
	srai	a1,a5,31
	srli	a1,a1,29
	add	a5,a5,a1
	andi	a5,a5,7
	sub	a5,a5,a1
	addi	a0,a5,-32
	blt	a0,zero,.L1203
	lw	a1,36(sp)
	lw	a2,32(a2)
	li	a5,0
	or	a5,a5,a1
	lw	a1,40(sp)
	sll	a2,a2,a0
	or	a2,a2,a1
	lw	a1,16(sp)
	bleu	a1,s1,.L1277
.L1206:
	sw	s0,28(sp)
	lla	s1,.LC126
	sw	t2,32(sp)
	mv	s0,a4
.L1253:
	andi	a1,a5,0xff
	mv	a0,s1
	sw	a2,8(sp)
	sw	a3,4(sp)
	sw	a5,0(sp)
	call	my_printf
	lw	a2,8(sp)
	lw	a5,0(sp)
	lw	a3,4(sp)
	lw	a4,12(sp)
	addi	a1,s0,1
	sltu	t1,a1,s0
	slli	a0,a2,24
	srli	a5,a5,8
	mv	s0,a1
	add	a3,t1,a3
	or	a5,a0,a5
	srli	a2,a2,8
	bne	a4,a1,.L1253
	lw	a4,16(sp)
	bne	a4,a3,.L1253
	lw	s0,28(sp)
	lw	t2,32(sp)
.L1205:
	lh	a4,22(t2)
	li	a3,127
	addi	a4,a4,7
	andi	a4,a4,7
	sra	a4,a3,a4
	and	a5,a4,a5
	srai	a3,a4,31
	sw	a5,36(sp)
	and	a5,a3,a2
	sw	a5,40(sp)
	bne	s0,zero,.L1278
.L1210:
	lw	a5,36(sp)
	lw	a4,40(sp)
	or	a5,a5,a4
	bne	a5,zero,.L1279
.L1213:
	lw	a5,52(sp)
	lw	a3,24(sp)
	lw	a4,12(a5)
	lw	a5,20(a4)
	lw	a4,16(a4)
	bgtu	a3,a5,.L1227
	beq	a3,a5,.L1280
.L1212:
	lw	a3,24(sp)
	bgtu	a5,a3,.L1228
	beq	a5,a3,.L1281
.L1219:
	lw	s0,72(sp)
	lw	ra,76(sp)
	lw	s1,68(sp)
	lla	a0,.LC36
	addi	sp,sp,80
	tail	my_puts
.L1273:
	lw	a1,36(sp)
	lla	a0,.LC126
	sw	t2,40(sp)
	sw	t1,8(sp)
	sw	a3,4(sp)
	sw	a4,0(sp)
	call	my_printf
	lw	a4,32(sp)
	lw	a3,4(sp)
	lw	t1,8(sp)
	addi	a5,a4,1
	sltu	a2,a5,a4
	lw	a4,28(sp)
	sw	a5,32(sp)
	lw	t2,40(sp)
	add	a4,a2,a4
	sw	a4,28(sp)
	mv	a5,a4
	lw	a4,0(sp)
	bgtu	s1,a5,.L1191
	beq	s1,a5,.L1282
.L1223:
	sw	zero,36(sp)
	sw	zero,40(sp)
	j	.L1189
.L1203:
	lw	a1,32(a2)
	lw	t0,36(a2)
	li	a0,31
	srli	a2,a1,1
	sub	a0,a0,a5
	srl	a0,a2,a0
	sll	a2,t0,a5
	sll	a5,a1,a5
	lw	a1,36(sp)
	or	a2,a0,a2
	or	a5,a5,a1
	lw	a1,40(sp)
	or	a2,a2,a1
	lw	a1,16(sp)
	bgtu	a1,s1,.L1206
.L1277:
	bne	a1,s1,.L1205
	lw	a1,12(sp)
	bgtu	a1,t1,.L1206
	j	.L1205
.L1281:
	lw	a3,20(sp)
	bleu	a4,a3,.L1219
.L1228:
	lw	a3,20(sp)
	lla	a0,.LC129
	sub	a1,a4,a3
	lw	a3,24(sp)
	sgtu	a4,a1,a4
	sub	a5,a5,a3
	sub	a2,a5,a4
	call	my_printf
	lw	s0,72(sp)
	lw	ra,76(sp)
	lw	s1,68(sp)
	lla	a0,.LC36
	addi	sp,sp,80
	tail	my_puts
.L1279:
	lw	a1,36(sp)
	lla	a0,.LC126
	call	my_printf
	lw	a5,12(sp)
	addi	a4,a5,1
	sltu	a5,a4,a5
	sw	a4,20(sp)
	lw	a4,16(sp)
	add	a5,a5,a4
	sw	a5,24(sp)
	j	.L1213
.L1266:
	lw	a5,44(sp)
	lla	a0,.LC124
	sw	t0,0(sp)
	lw	a1,0(a5)
	call	my_fputs
	lw	t0,0(sp)
	j	.L1169
.L1166:
	lla	a5,stdout
	lw	a1,0(a5)
	lla	a0,.LC17
	sw	t0,0(sp)
	sw	a5,44(sp)
	call	my_fputs
	lw	t0,0(sp)
	j	.L1167
.L1271:
	lla	s0,.LC18
	li	a0,65
.L1177:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L1177
	lla	s0,.LC116
	li	a0,65
.L1178:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L1178
	lla	s0,.LC117
	li	a0,32
.L1179:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L1179
	li	a0,1
	call	halt
.L1280:
	lw	a3,20(sp)
	bleu	a3,a4,.L1212
.L1227:
	lla	s0,.LC18
	li	a0,65
.L1216:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L1216
	lla	s0,.LC122
	li	a0,65
.L1217:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L1217
	lla	s0,.LC123
	li	a0,32
.L1218:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L1218
	j	.L1180
.L1282:
	lw	a5,32(sp)
	bleu	t1,a5,.L1223
	j	.L1191
.L1275:
	lla	s0,.LC18
	li	a0,65
.L1196:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L1196
	lla	s0,.LC118
	li	a0,65
.L1197:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L1197
	lla	s0,.LC119
	li	a0,32
.L1198:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L1198
	j	.L1180
.L1267:
	lw	a5,52(sp)
	sw	zero,20(sp)
	sw	zero,24(sp)
	lw	a5,12(a5)
	lw	a4,16(a5)
	lw	a5,20(a5)
	j	.L1212
.L1276:
	lla	s0,.LC18
	li	a0,65
.L1200:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L1200
	lla	s0,.LC120
	li	a0,65
.L1201:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L1201
	lla	s0,.LC121
	li	a0,32
.L1202:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L1202
	j	.L1180
	.size	emitdata, .-emitdata
	.section	.rodata.emitasm.str1.4,"aMS",@progbits,1
	.align	2
.LC130:
	.string	"#APP"
	.align	2
.LC131:
	.string	"#NO_APP"
	.align	2
.LC132:
	.string	"\t"
	.section	.text.emitasm,"ax",@progbits
	.align	2
	.globl	emitasm
	.hidden	emitasm
	.type	emitasm, @function
emitasm:
	addi	sp,sp,-20
	sw	ra,16(sp)
	sw	s0,12(sp)
	sw	s1,8(sp)
	beq	a0,zero,.L1284
	lbu	a5,0(a0)
	beq	a5,zero,.L1284
	addi	a1,sp,4
	call	process_asm_string.part.0
	mv	a5,a0
	lla	a0,.LC130
	sw	a5,0(sp)
	call	my_puts
	lw	a5,4(sp)
	beq	a5,zero,.L1288
.L1286:
	lw	s0,0(sp)
	li	s1,0
.L1289:
	lla	a5,stdout
	lw	a1,0(a5)
	lla	a0,.LC132
	addi	s0,s0,4
	call	my_fputs
	lw	a0,-4(s0)
	addi	s1,s1,1
	call	my_puts
	lw	a0,-4(s0)
	call	free
	lw	a4,4(sp)
	bgtu	a4,s1,.L1289
.L1288:
	lla	a0,.LC131
	call	my_puts
	lw	a5,0(sp)
	beq	a5,zero,.L1283
	mv	a0,a5
	call	free
.L1283:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L1284:
	lla	a0,.LC130
	sw	zero,4(sp)
	call	my_puts
	lw	a5,4(sp)
	sw	zero,0(sp)
	bne	a5,zero,.L1286
	lla	a0,.LC131
	call	my_puts
	j	.L1283
	.size	emitasm, .-emitasm
	.section	.text.qbe_init,"ax",@progbits
	.align	2
	.globl	qbe_init
	.hidden	qbe_init
	.type	qbe_init, @function
qbe_init:
	la a5, .LANCHOR2; sw zero, 0(a5);
	la a5, .LANCHOR9; sw zero, 0(a5);
	la a5, .LANCHOR1; sw zero, 0(a5);
	ret
	.size	qbe_init, .-qbe_init
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC133:
	.string	"add"
	.align	2
.LC134:
	.string	"sub"
	.align	2
.LC135:
	.string	"neg"
	.align	2
.LC136:
	.string	"div"
	.align	2
.LC137:
	.string	"mul"
	.align	2
.LC138:
	.string	"udiv"
	.align	2
.LC139:
	.string	"rem"
	.align	2
.LC140:
	.string	"urem"
	.align	2
.LC141:
	.string	"or"
	.align	2
.LC142:
	.string	"xor"
	.align	2
.LC143:
	.string	"and"
	.align	2
.LC144:
	.string	"sar"
	.align	2
.LC145:
	.string	"shr"
	.align	2
.LC146:
	.string	"shl"
	.align	2
.LC147:
	.string	"stored"
	.align	2
.LC148:
	.string	"stores"
	.align	2
.LC149:
	.string	"storel"
	.align	2
.LC150:
	.string	"storew"
	.align	2
.LC151:
	.string	"storeh"
	.align	2
.LC152:
	.string	"storeb"
	.align	2
.LC153:
	.string	"loadd"
	.align	2
.LC154:
	.string	"loads"
	.align	2
.LC155:
	.string	"loadl"
	.align	2
.LC156:
	.string	"loadw"
	.align	2
.LC157:
	.string	"loadsh"
	.align	2
.LC158:
	.string	"loaduh"
	.align	2
.LC159:
	.string	"loadsb"
	.align	2
.LC160:
	.string	"loadub"
	.align	2
.LC161:
	.string	"alloc4"
	.align	2
.LC162:
	.string	"alloc8"
	.align	2
.LC163:
	.string	"alloc16"
	.align	2
.LC164:
	.string	"ceqw"
	.align	2
.LC165:
	.string	"cnew"
	.align	2
.LC166:
	.string	"cslew"
	.align	2
.LC167:
	.string	"csltw"
	.align	2
.LC168:
	.string	"csgew"
	.align	2
.LC169:
	.string	"csgtw"
	.align	2
.LC170:
	.string	"culew"
	.align	2
.LC171:
	.string	"cultw"
	.align	2
.LC172:
	.string	"cugew"
	.align	2
.LC173:
	.string	"cugtw"
	.align	2
.LC174:
	.string	"ceql"
	.align	2
.LC175:
	.string	"cnel"
	.align	2
.LC176:
	.string	"cslel"
	.align	2
.LC177:
	.string	"csltl"
	.align	2
.LC178:
	.string	"csgel"
	.align	2
.LC179:
	.string	"csgtl"
	.align	2
.LC180:
	.string	"culel"
	.align	2
.LC181:
	.string	"cultl"
	.align	2
.LC182:
	.string	"cugel"
	.align	2
.LC183:
	.string	"cugtl"
	.align	2
.LC184:
	.string	"ceqs"
	.align	2
.LC185:
	.string	"cnes"
	.align	2
.LC186:
	.string	"cles"
	.align	2
.LC187:
	.string	"clts"
	.align	2
.LC188:
	.string	"cges"
	.align	2
.LC189:
	.string	"cgts"
	.align	2
.LC190:
	.string	"cos"
	.align	2
.LC191:
	.string	"cuos"
	.align	2
.LC192:
	.string	"ceqd"
	.align	2
.LC193:
	.string	"cned"
	.align	2
.LC194:
	.string	"cled"
	.align	2
.LC195:
	.string	"cltd"
	.align	2
.LC196:
	.string	"cged"
	.align	2
.LC197:
	.string	"cgtd"
	.align	2
.LC198:
	.string	"cod"
	.align	2
.LC199:
	.string	"cuod"
	.align	2
.LC200:
	.string	"extsw"
	.align	2
.LC201:
	.string	"extuw"
	.align	2
.LC202:
	.string	"extsh"
	.align	2
.LC203:
	.string	"extuh"
	.align	2
.LC204:
	.string	"extsb"
	.align	2
.LC205:
	.string	"extub"
	.align	2
.LC206:
	.string	"exts"
	.align	2
.LC207:
	.string	"truncd"
	.align	2
.LC208:
	.string	"stosi"
	.align	2
.LC209:
	.string	"stoui"
	.align	2
.LC210:
	.string	"dtosi"
	.align	2
.LC211:
	.string	"dtoui"
	.align	2
.LC212:
	.string	"swtof"
	.align	2
.LC213:
	.string	"uwtof"
	.align	2
.LC214:
	.string	"sltof"
	.align	2
.LC215:
	.string	"ultof"
	.align	2
.LC216:
	.string	"cast"
	.align	2
.LC217:
	.string	"copy"
	.align	2
.LC218:
	.string	"asm"
	.align	2
.LC219:
	.string	"call asm"
	.align	2
.LC220:
	.string	"call"
	.align	2
.LC221:
	.string	"vastart"
	.align	2
.LC222:
	.string	"vaarg"
	.section	.data.z.0,"aw"
	.align	3
	.set	.LANCHOR8,. + 0
	.type	z.0, @object
	.size	z.0, 16
z.0:
	.word	2
	.zero	12
	.section	.rodata.CSWTCH.138,"a"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	CSWTCH.138, @object
	.size	CSWTCH.138, 16
CSWTCH.138:
	.word	1
	.word	2
	.word	8
	.word	4
	.section	.rodata.CSWTCH.139,"a"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	CSWTCH.139, @object
	.size	CSWTCH.139, 16
CSWTCH.139:
	.word	28
	.word	26
	.word	23
	.word	24
	.section	.rodata.CSWTCH.140,"a"
	.align	2
	.set	.LANCHOR6,. + 0
	.type	CSWTCH.140, @object
	.size	CSWTCH.140, 16
CSWTCH.140:
	.word	20
	.word	19
	.word	17
	.word	18
	.section	.rodata.CSWTCH.141,"a"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	CSWTCH.141, @object
	.size	CSWTCH.141, 16
CSWTCH.141:
	.word	119
	.word	119
	.word	108
	.word	119
	.section	.rodata.instname,"a"
	.align	2
	.set	.LANCHOR11,. + 0
	.type	instname, @object
	.size	instname, 364
instname:
	.zero	4
	.word	.LC133
	.word	.LC134
	.word	.LC135
	.word	.LC136
	.word	.LC137
	.word	.LC138
	.word	.LC139
	.word	.LC140
	.word	.LC141
	.word	.LC142
	.word	.LC143
	.word	.LC144
	.word	.LC145
	.word	.LC146
	.word	.LC147
	.word	.LC148
	.word	.LC149
	.word	.LC150
	.word	.LC151
	.word	.LC152
	.word	.LC153
	.word	.LC154
	.word	.LC155
	.word	.LC156
	.word	.LC157
	.word	.LC158
	.word	.LC159
	.word	.LC160
	.word	.LC161
	.word	.LC162
	.word	.LC163
	.word	.LC164
	.word	.LC165
	.word	.LC166
	.word	.LC167
	.word	.LC168
	.word	.LC169
	.word	.LC170
	.word	.LC171
	.word	.LC172
	.word	.LC173
	.word	.LC174
	.word	.LC175
	.word	.LC176
	.word	.LC177
	.word	.LC178
	.word	.LC179
	.word	.LC180
	.word	.LC181
	.word	.LC182
	.word	.LC183
	.word	.LC184
	.word	.LC185
	.word	.LC186
	.word	.LC187
	.word	.LC188
	.word	.LC189
	.word	.LC190
	.word	.LC191
	.word	.LC192
	.word	.LC193
	.word	.LC194
	.word	.LC195
	.word	.LC196
	.word	.LC197
	.word	.LC198
	.word	.LC199
	.word	.LC200
	.word	.LC201
	.word	.LC202
	.word	.LC203
	.word	.LC204
	.word	.LC205
	.word	.LC206
	.word	.LC207
	.word	.LC208
	.word	.LC209
	.word	.LC210
	.word	.LC211
	.word	.LC212
	.word	.LC213
	.word	.LC214
	.word	.LC215
	.word	.LC216
	.word	.LC217
	.word	.LC218
	.word	.LC219
	.word	.LC220
	.word	.LC221
	.word	.LC222
	.section	.rodata.store.1,"a"
	.align	2
	.set	.LANCHOR7,. + 0
	.type	store.1, @object
	.size	store.1, 36
store.1:
	.zero	4
	.word	20
	.word	19
	.zero	4
	.word	18
	.zero	12
	.word	17
	.section	.sbss.buf.3,"aw",@nobits
	.align	2
	.set	.LANCHOR10,. + 0
	.type	buf.3, @object
	.size	buf.3, 4
buf.3:
	.zero	4
	.section	.sbss.emittype_id,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	emittype_id, @object
	.size	emittype_id, 4
emittype_id:
	.zero	4
	.section	.sbss.mkblock_id,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	mkblock_id, @object
	.size	mkblock_id, 4
mkblock_id:
	.zero	4
	.section	.sbss.mkglobal_id,"aw",@nobits
	.align	2
	.set	.LANCHOR9,. + 0
	.type	mkglobal_id, @object
	.size	mkglobal_id, 4
mkglobal_id:
	.zero	4
	.section	.srodata.sigil.2,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	sigil.2, @object
	.size	sigil.2, 8
sigil.2:
	.string	""
	.string	"$"
	.string	""
	.string	""
	.ascii	"%:@"
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
