#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"stdlib.c"
	.option nopic
	.text
	.section	.text.rand,"ax",@progbits
	.align	2
	.globl	rand
	.hidden	rand
	.type	rand, @function
rand:
	lla	a3,.LANCHOR0
	lw	a2,0(a3)
	slli	a4,a2,8
	sub	a4,a4,a2
	slli	a4,a4,3
	add	a4,a4,a2
	slli	a4,a4,7
	add	a4,a4,a2
	slli	a4,a4,3
	sub	a4,a4,a2
	slli	a5,a4,5
	add	a5,a4,a5
	slli	a5,a5,2
	sub	a5,a5,a2
	slli	a5,a5,2
	li	a4,12288
	add	a5,a5,a2
	addi	a4,a4,57
	add	a5,a5,a4
	slli	a0,a5,1
	sw	a5,0(a3)
	srli	a0,a0,17
	ret
	.size	rand, .-rand
	.section	.text.srand,"ax",@progbits
	.align	2
	.globl	srand
	.hidden	srand
	.type	srand, @function
srand:
	la a5, .LANCHOR0; sw a0, 0(a5);
	ret
	.size	srand, .-srand
	.section	.text.abs,"ax",@progbits
	.align	2
	.globl	abs
	.hidden	abs
	.type	abs, @function
abs:
	srai	a5,a0,31
	xor	a0,a5,a0
	sub	a0,a0,a5
	ret
	.size	abs, .-abs
	.globl	__mulsi3
	.section	.text.strtol,"ax",@progbits
	.align	2
	.globl	strtol
	.hidden	strtol
	.type	strtol, @function
strtol:
	addi	sp,sp,-24
	sw	s0,16(sp)
	sw	s1,12(sp)
	sw	ra,20(sp)
	mv	s0,a0
	sw	a1,8(sp)
	mv	s1,a2
	j	.L6
.L7:
	addi	s0,s0,1
.L6:
	lbu	a0,0(s0)
	call	isspace
	sw	a0,0(sp)
	bne	a0,zero,.L7
	lbu	a5,0(s0)
	mv	a0,a5
	bne	s1,zero,.L8
	li	a4,48
	li	s1,10
	beq	a5,a4,.L35
.L22:
	call	isalnum
	beq	a0,zero,.L19
.L23:
	li	a5,8
	lbu	a0,0(s0)
	beq	s1,a5,.L36
	li	a5,10
	beq	s1,a5,.L37
	li	a5,16
	bne	s1,a5,.L15
	call	isxdigit
	beq	a0,zero,.L19
.L32:
	lbu	a0,0(s0)
.L15:
	call	isalpha
	bne	a0,zero,.L38
.L20:
	lbu	a5,0(s0)
	addi	a5,a5,-48
	sw	a5,4(sp)
.L21:
	lw	a0,0(sp)
	mv	a1,s1
	addi	s0,s0,1
	call	__mulsi3
	lw	a5,4(sp)
	add	a5,a0,a5
	lbu	a0,0(s0)
	sw	a5,0(sp)
	call	isalnum
	bne	a0,zero,.L23
.L19:
	lw	a5,8(sp)
	beq	a5,zero,.L5
	lw	a5,8(sp)
	sw	s0,0(a5)
.L5:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	a0,0(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L36:
	addi	a5,a0,-48
	andi	a5,a5,0xff
	li	a4,7
	bgtu	a5,a4,.L19
	call	isalpha
	beq	a0,zero,.L20
.L38:
	lbu	a0,0(s0)
	call	tolower
	addi	a5,a0,-87
	sw	a5,4(sp)
	j	.L21
.L37:
	call	isdigit
	bne	a0,zero,.L32
	j	.L19
.L8:
	li	a4,16
	bne	s1,a4,.L22
.L12:
	mv	a0,a5
	li	a5,48
	beq	a0,a5,.L11
	li	s1,16
	j	.L22
.L35:
	lbu	a0,1(s0)
	call	tolower
	li	a5,120
	beq	a0,a5,.L39
	lbu	a0,0(s0)
	li	s1,8
	j	.L22
.L11:
	lbu	a0,1(s0)
	call	tolower
	li	a5,120
	beq	a0,a5,.L13
	lbu	a0,0(s0)
	li	s1,16
	j	.L22
.L39:
	lbu	a5,0(s0)
	j	.L12
.L13:
	lbu	a0,2(s0)
	li	s1,16
	addi	s0,s0,2
	j	.L22
	.size	strtol, .-strtol
	.section	.text.strtoul,"ax",@progbits
	.align	2
	.globl	strtoul
	.hidden	strtoul
	.type	strtoul, @function
strtoul:
	addi	sp,sp,-24
	sw	s0,16(sp)
	sw	s1,12(sp)
	sw	ra,20(sp)
	mv	s0,a0
	sw	a1,8(sp)
	mv	s1,a2
	j	.L41
.L42:
	addi	s0,s0,1
.L41:
	lbu	a0,0(s0)
	call	isspace
	bne	a0,zero,.L42
	lbu	a5,0(s0)
	mv	a0,a5
	bne	s1,zero,.L43
	li	a4,48
	li	s1,10
	beq	a5,a4,.L70
.L44:
	sw	zero,0(sp)
	call	isalnum
	beq	a0,zero,.L54
.L58:
	li	a5,8
	lbu	a0,0(s0)
	beq	s1,a5,.L71
	li	a5,10
	beq	s1,a5,.L72
	li	a5,16
	bne	s1,a5,.L50
	call	isxdigit
	beq	a0,zero,.L54
.L67:
	lbu	a0,0(s0)
.L50:
	call	isalpha
	bne	a0,zero,.L73
.L55:
	lbu	a5,0(s0)
	addi	a5,a5,-48
	sw	a5,4(sp)
.L56:
	lw	a1,0(sp)
	mv	a0,s1
	addi	s0,s0,1
	call	__mulsi3
	lw	a5,4(sp)
	add	a5,a5,a0
	lbu	a0,0(s0)
	sw	a5,0(sp)
	call	isalnum
	bne	a0,zero,.L58
.L54:
	lw	a5,8(sp)
	beq	a5,zero,.L40
	lw	a5,8(sp)
	sw	s0,0(a5)
.L40:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	a0,0(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L71:
	addi	a5,a0,-48
	andi	a5,a5,0xff
	li	a4,7
	bgtu	a5,a4,.L54
	call	isalpha
	beq	a0,zero,.L55
.L73:
	lbu	a0,0(s0)
	call	tolower
	addi	a5,a0,-87
	sw	a5,4(sp)
	j	.L56
.L72:
	call	isdigit
	bne	a0,zero,.L67
	j	.L54
.L43:
	li	a4,16
	bne	s1,a4,.L44
.L47:
	mv	a0,a5
	li	a5,48
	beq	a0,a5,.L46
	li	s1,16
	j	.L44
.L70:
	lbu	a0,1(s0)
	call	tolower
	li	a5,120
	beq	a0,a5,.L74
	lbu	a0,0(s0)
	li	s1,8
	j	.L44
.L46:
	lbu	a0,1(s0)
	call	tolower
	li	a5,120
	beq	a0,a5,.L48
	lbu	a0,0(s0)
	li	s1,16
	j	.L44
.L74:
	lbu	a5,0(s0)
	j	.L47
.L48:
	lbu	a0,2(s0)
	li	s1,16
	addi	s0,s0,2
	j	.L44
	.size	strtoul, .-strtoul
	.globl	__muldi3
	.section	.text.strtoll,"ax",@progbits
	.align	2
	.globl	strtoll
	.hidden	strtoll
	.type	strtoll, @function
strtoll:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	ra,28(sp)
	mv	s0,a0
	sw	a1,16(sp)
	mv	s1,a2
	j	.L76
.L77:
	addi	s0,s0,1
.L76:
	lbu	a0,0(s0)
	call	isspace
	bne	a0,zero,.L77
	lbu	a5,0(s0)
	mv	a0,a5
	bne	s1,zero,.L78
	li	a4,48
	li	s1,10
	beq	a5,a4,.L105
.L79:
	srai	a5,s1,31
	sw	zero,0(sp)
	sw	zero,4(sp)
	sw	a5,12(sp)
	call	isalnum
	beq	a0,zero,.L89
.L93:
	li	a5,8
	lbu	a0,0(s0)
	beq	s1,a5,.L106
	li	a5,10
	beq	s1,a5,.L107
	li	a5,16
	bne	s1,a5,.L85
	call	isxdigit
	beq	a0,zero,.L89
.L102:
	lbu	a0,0(s0)
.L85:
	call	isalpha
	bne	a0,zero,.L108
.L90:
	lbu	a5,0(s0)
	addi	a5,a5,-48
.L91:
	lw	a2,0(sp)
	lw	a3,4(sp)
	lw	a1,12(sp)
	mv	a0,s1
	sw	a5,8(sp)
	call	__muldi3
	lw	a5,8(sp)
	addi	s0,s0,1
	add	a0,a5,a0
	srai	a4,a5,31
	sw	a0,0(sp)
	sltu	a5,a0,a5
	lbu	a0,0(s0)
	add	a1,a4,a1
	add	a5,a5,a1
	sw	a5,4(sp)
	call	isalnum
	bne	a0,zero,.L93
.L89:
	lw	a5,16(sp)
	beq	a5,zero,.L75
	lw	a5,16(sp)
	sw	s0,0(a5)
.L75:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	a0,0(sp)
	lw	a1,4(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L106:
	addi	a5,a0,-48
	andi	a5,a5,0xff
	li	a4,7
	bgtu	a5,a4,.L89
	call	isalpha
	beq	a0,zero,.L90
.L108:
	lbu	a0,0(s0)
	call	tolower
	addi	a5,a0,-87
	j	.L91
.L107:
	call	isdigit
	bne	a0,zero,.L102
	j	.L89
.L78:
	li	a4,16
	bne	s1,a4,.L79
.L82:
	mv	a0,a5
	li	a5,48
	beq	a0,a5,.L81
	li	s1,16
	j	.L79
.L105:
	lbu	a0,1(s0)
	call	tolower
	li	a5,120
	beq	a0,a5,.L109
	lbu	a0,0(s0)
	li	s1,8
	j	.L79
.L81:
	lbu	a0,1(s0)
	call	tolower
	li	a5,120
	beq	a0,a5,.L83
	lbu	a0,0(s0)
	li	s1,16
	j	.L79
.L109:
	lbu	a5,0(s0)
	j	.L82
.L83:
	lbu	a0,2(s0)
	li	s1,16
	addi	s0,s0,2
	j	.L79
	.size	strtoll, .-strtoll
	.section	.text.strtoull,"ax",@progbits
	.align	2
	.globl	strtoull
	.hidden	strtoull
	.type	strtoull, @function
strtoull:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	ra,28(sp)
	mv	s0,a0
	sw	a1,16(sp)
	mv	s1,a2
	j	.L111
.L112:
	addi	s0,s0,1
.L111:
	lbu	a0,0(s0)
	call	isspace
	bne	a0,zero,.L112
	lbu	a5,0(s0)
	mv	a0,a5
	bne	s1,zero,.L113
	li	a4,48
	li	s1,10
	beq	a5,a4,.L140
.L114:
	srai	a5,s1,31
	sw	zero,0(sp)
	sw	zero,4(sp)
	sw	a5,12(sp)
	call	isalnum
	beq	a0,zero,.L124
.L128:
	li	a5,8
	lbu	a0,0(s0)
	beq	s1,a5,.L141
	li	a5,10
	beq	s1,a5,.L142
	li	a5,16
	bne	s1,a5,.L120
	call	isxdigit
	beq	a0,zero,.L124
.L137:
	lbu	a0,0(s0)
.L120:
	call	isalpha
	bne	a0,zero,.L143
.L125:
	lbu	a5,0(s0)
	addi	a5,a5,-48
.L126:
	lw	a2,0(sp)
	lw	a3,4(sp)
	lw	a1,12(sp)
	mv	a0,s1
	sw	a5,8(sp)
	call	__muldi3
	lw	a5,8(sp)
	addi	s0,s0,1
	add	a0,a5,a0
	srai	a4,a5,31
	sw	a0,0(sp)
	sltu	a5,a0,a5
	lbu	a0,0(s0)
	add	a1,a4,a1
	add	a5,a5,a1
	sw	a5,4(sp)
	call	isalnum
	bne	a0,zero,.L128
.L124:
	lw	a5,16(sp)
	beq	a5,zero,.L110
	lw	a5,16(sp)
	sw	s0,0(a5)
.L110:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	a0,0(sp)
	lw	a1,4(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L141:
	addi	a5,a0,-48
	andi	a5,a5,0xff
	li	a4,7
	bgtu	a5,a4,.L124
	call	isalpha
	beq	a0,zero,.L125
.L143:
	lbu	a0,0(s0)
	call	tolower
	addi	a5,a0,-87
	j	.L126
.L142:
	call	isdigit
	bne	a0,zero,.L137
	j	.L124
.L113:
	li	a4,16
	bne	s1,a4,.L114
.L117:
	mv	a0,a5
	li	a5,48
	beq	a0,a5,.L116
	li	s1,16
	j	.L114
.L140:
	lbu	a0,1(s0)
	call	tolower
	li	a5,120
	beq	a0,a5,.L144
	lbu	a0,0(s0)
	li	s1,8
	j	.L114
.L116:
	lbu	a0,1(s0)
	call	tolower
	li	a5,120
	beq	a0,a5,.L118
	lbu	a0,0(s0)
	li	s1,16
	j	.L114
.L144:
	lbu	a5,0(s0)
	j	.L117
.L118:
	lbu	a0,2(s0)
	li	s1,16
	addi	s0,s0,2
	j	.L114
	.size	strtoull, .-strtoull
	.section	.text.atoi,"ax",@progbits
	.align	2
	.globl	atoi
	.hidden	atoi
	.type	atoi, @function
atoi:
	li	a2,10
	li	a1,0
	tail	strtol
	.size	atoi, .-atoi
	.section	.rodata.malloc.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Not implemented"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/abstract-machine/klib/src/stdlib.c:56  \n"
	.section	.text.malloc,"ax",@progbits
	.align	2
	.globl	malloc
	.hidden	malloc
	.type	malloc, @function
malloc:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L147:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L147
	lla	s0,.LC1
	li	a0,78
.L148:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L148
	lla	s0,.LC2
	li	a0,32
.L149:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L149
	li	a0,1
	call	halt
	.size	malloc, .-malloc
	.section	.text.calloc,"ax",@progbits
	.align	2
	.globl	calloc
	.hidden	calloc
	.type	calloc, @function
calloc:
	mv	a5,a0
	addi	sp,sp,-12
	mv	a0,a1
	mv	a1,a5
	sw	ra,8(sp)
	call	__mulsi3
	call	malloc
	.size	calloc, .-calloc
	.section	.text.realloc,"ax",@progbits
	.align	2
	.globl	realloc
	.hidden	realloc
	.type	realloc, @function
realloc:
	beq	a0,zero,.L158
	bne	a1,zero,.L158
	li	a0,0
	ret
.L158:
	addi	sp,sp,-12
	mv	a0,a1
	sw	ra,8(sp)
	call	malloc
	.size	realloc, .-realloc
	.section	.text.free,"ax",@progbits
	.align	2
	.globl	free
	.hidden	free
	.type	free, @function
free:
	ret
	.size	free, .-free
	.section	.text.exit,"ax",@progbits
	.align	2
	.globl	exit
	.hidden	exit
	.type	exit, @function
exit:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	halt
	.size	exit, .-exit
	.section	.sdata.next,"aw"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	next, @object
	.size	next, 4
next:
	.word	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
