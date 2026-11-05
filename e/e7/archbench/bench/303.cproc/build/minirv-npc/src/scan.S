#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"scan.c"
	.option nopic
	.text
	.section	.text.nextchar,"ax",@progbits
	.align	2
	.type	nextchar, @function
nextchar:
	lbu	a5,4(a0)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	mv	s0,a0
	bne	a5,zero,.L16
.L2:
	li	s1,10
	j	.L8
.L5:
	lw	a5,20(s0)
	addi	a5,a5,1
	sw	a5,20(s0)
	bne	a0,a4,.L1
	lw	a0,8(s0)
	call	my_getc
	bne	a0,s1,.L17
	lw	a5,16(s0)
	sw	zero,20(s0)
	addi	a5,a5,1
	sw	a5,16(s0)
.L8:
	lw	a0,8(s0)
	call	my_getc
	sw	a0,0(s0)
	li	a4,92
	bne	a0,s1,.L5
	lw	a5,16(s0)
	sw	zero,20(s0)
	addi	a5,a5,1
	sw	a5,16(s0)
.L1:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L16:
	lw	a5,28(a0)
	lw	a4,32(a0)
	lw	s1,0(a0)
	lw	a0,24(a0)
	bltu	a5,a4,.L3
	li	a1,256
	beq	a4,zero,.L4
	slli	a1,a4,1
.L4:
	sw	a1,32(s0)
	li	a2,1
	call	xreallocarray
	lw	a5,28(s0)
	sw	a0,24(s0)
.L3:
	addi	a4,a5,1
	sw	a4,28(s0)
	add	a0,a0,a5
	sb	s1,0(a0)
	j	.L2
.L17:
	lw	a1,8(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	my_ungetc
	.size	nextchar, .-nextchar
	.section	.rodata.escape.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"invalid hexadecimal escape sequence"
	.align	2
.LC1:
	.string	"'\"?\\abfnrtv"
	.align	2
.LC2:
	.string	"invalid escape sequence"
	.section	.text.escape,"ax",@progbits
	.align	2
	.type	escape, @function
escape:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	sw	s1,0(sp)
	call	nextchar
	lw	a1,0(s0)
	li	a5,120
	beq	a1,a5,.L29
	addi	a5,a1,-48
	li	s1,7
	bleu	a5,s1,.L30
	lla	a0,.LC1
	call	strchr
	beq	a0,zero,.L31
.L25:
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	nextchar
.L30:
	mv	a0,s0
	call	nextchar
	lw	a5,0(s0)
	addi	a5,a5,-48
	bleu	a5,s1,.L32
.L18:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L29:
	mv	a0,s0
	call	nextchar
	lw	a0,0(s0)
	call	isxdigit
	beq	a0,zero,.L33
.L21:
	mv	a0,s0
	call	nextchar
	lw	a0,0(s0)
	call	isxdigit
	beq	a0,zero,.L18
	mv	a0,s0
	call	nextchar
	lw	a0,0(s0)
	call	isxdigit
	bne	a0,zero,.L21
	j	.L18
.L31:
	addi	a0,s0,12
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a1,.LC2
	addi	sp,sp,12
	tail	error
.L32:
	mv	a0,s0
	call	nextchar
	lw	a5,0(s0)
	addi	a5,a5,-48
	bgtu	a5,s1,.L18
	j	.L25
.L33:
	lla	a1,.LC0
	addi	a0,s0,12
	call	error
	j	.L21
	.size	escape, .-escape
	.section	.rodata.charconst.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"newline in character constant"
	.align	2
.LC4:
	.string	"EOF in character constant"
	.section	.text.charconst,"ax",@progbits
	.align	2
	.type	charconst, @function
charconst:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	li	a5,1
	mv	s1,a0
	sb	a5,4(a0)
	call	nextchar
	addi	s0,s1,12
.L35:
	lw	a5,0(s1)
	li	a4,39
	li	a3,-1
	beq	a5,a4,.L36
.L46:
	bgt	a5,a4,.L37
	li	a4,10
	mv	a0,s0
	lla	a1,.LC3
	beq	a5,a3,.L42
	bne	a5,a4,.L40
	call	error
.L42:
	lla	a1,.LC4
	mv	a0,s0
	call	error
.L40:
	mv	a0,s1
	call	nextchar
	lw	a5,0(s1)
	li	a4,39
	li	a3,-1
	bne	a5,a4,.L46
.L36:
	mv	a0,s1
	call	nextchar
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,6
	addi	sp,sp,12
	jr	ra
.L37:
	li	a4,92
	mv	a0,s1
	bne	a5,a4,.L40
	call	escape
	j	.L35
	.size	charconst, .-charconst
	.section	.rodata.stringlit.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"newline in string literal"
	.align	2
.LC6:
	.string	"EOF in string literal"
	.section	.text.stringlit,"ax",@progbits
	.align	2
	.type	stringlit, @function
stringlit:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	li	a5,1
	mv	s1,a0
	sb	a5,4(a0)
	call	nextchar
	addi	s0,s1,12
.L48:
	lw	a5,0(s1)
	li	a4,34
	li	a3,-1
	beq	a5,a4,.L49
.L59:
	bgt	a5,a4,.L50
	li	a4,10
	mv	a0,s0
	lla	a1,.LC5
	beq	a5,a3,.L55
	bne	a5,a4,.L53
	call	error
.L55:
	lla	a1,.LC6
	mv	a0,s0
	call	error
.L53:
	mv	a0,s1
	call	nextchar
	lw	a5,0(s1)
	li	a4,34
	li	a3,-1
	bne	a5,a4,.L59
.L49:
	mv	a0,s1
	call	nextchar
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,7
	addi	sp,sp,12
	jr	ra
.L50:
	li	a4,92
	mv	a0,s1
	bne	a5,a4,.L53
	call	escape
	j	.L48
	.size	stringlit, .-stringlit
	.section	.text.number,"ax",@progbits
	.align	2
	.type	number, @function
number:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	li	a5,1
	mv	s1,a0
	sb	a5,4(a0)
	li	s0,0
.L61:
	mv	a0,s1
	call	nextchar
	lw	a0,0(s1)
	li	a5,80
	bgt	a0,a5,.L64
	li	a5,42
	ble	a0,a5,.L65
	addi	a5,a0,-43
	li	a3,37
	bgtu	a5,a3,.L65
	lla	a4,.L66
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.number,"a",@progbits
	.align	2
	.align	2
.L66:
	.word	.L67-.L66
	.word	.L65-.L66
	.word	.L67-.L66
	.word	.L78-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L71-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L65-.L66
	.word	.L71-.L66
	.section	.text.number
.L64:
	li	a5,101
	beq	a0,a5,.L71
	li	a5,112
	beq	a0,a5,.L71
	li	a5,95
	li	s0,0
	beq	a0,a5,.L61
.L65:
	call	isalnum
	beq	a0,zero,.L74
.L78:
	li	s0,0
	j	.L61
.L71:
	li	s0,1
	j	.L61
.L67:
	bne	s0,zero,.L61
.L74:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,5
	addi	sp,sp,12
	jr	ra
	.size	number, .-number
	.section	.text.scanfrom,"ax",@progbits
	.align	2
	.globl	scanfrom
	.hidden	scanfrom
	.type	scanfrom, @function
scanfrom:
	addi	sp,sp,-20
	mv	a5,a0
	li	a0,40
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	a5,4(sp)
	sw	ra,16(sp)
	sw	a1,0(sp)
	call	xmalloc
	lw	a5,4(sp)
	lla	s1,.LANCHOR0
	lw	a3,0(s1)
	lw	a4,0(sp)
	sw	a5,12(a0)
	li	a5,1
	sw	a4,8(a0)
	sw	zero,24(a0)
	sw	zero,28(a0)
	sw	zero,32(a0)
	sb	zero,4(a0)
	sw	a5,16(a0)
	sw	zero,20(a0)
	sw	a3,36(a0)
	mv	s0,a0
	beq	a4,zero,.L80
	call	nextchar
.L80:
	sw	s0,0(s1)
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
	.size	scanfrom, .-scanfrom
	.section	.rodata.scanopen.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"r"
	.align	2
.LC8:
	.string	"open %s:"
	.section	.text.scanopen,"ax",@progbits
	.align	2
	.globl	scanopen
	.hidden	scanopen
	.type	scanopen, @function
scanopen:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR0
	sw	s0,4(sp)
	lw	s0,0(s1)
	sw	ra,8(sp)
	lw	a5,8(s0)
	beq	a5,zero,.L89
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L89:
	lw	a0,12(s0)
	lla	a1,.LC7
	call	fopen
	lw	a5,0(s1)
	sw	a0,8(s0)
	lw	a4,8(a5)
	beq	a4,zero,.L90
.L87:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	mv	a0,a5
	addi	sp,sp,12
	tail	nextchar
.L90:
	lw	a1,12(a5)
	lla	a0,.LC8
	call	fatal
	lw	a5,0(s1)
	j	.L87
	.size	scanopen, .-scanopen
	.section	.text.scansetloc,"ax",@progbits
	.align	2
	.globl	scansetloc
	.hidden	scansetloc
	.type	scansetloc, @function
scansetloc:
	lw	a2,0(a0)
	lw	a3,4(a0)
	lw	a4,8(a0)
	la a5, .LANCHOR0; lw a5, 0(a5);
	sw	a2,12(a5)
	sw	a3,16(a5)
	sw	a4,20(a5)
	ret
	.size	scansetloc, .-scansetloc
	.section	.text.scanclose,"ax",@progbits
	.align	2
	.globl	scanclose
	.hidden	scanclose
	.type	scanclose, @function
scanclose:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lw	a5,0(s0)
	sw	ra,8(sp)
	lw	a0,8(a5)
	call	fclose
	lw	s0,0(s0)
	lw	a0,24(s0)
	call	free
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	free
	.size	scanclose, .-scanclose
	.section	.rodata.scan.str1.4,"aMS",@progbits,1
	.align	2
.LC9:
	.string	"EOF in comment"
	.section	.text.scan,"ax",@progbits
	.align	2
	.globl	scan
	.hidden	scan
	.type	scan, @function
scan:
	addi	sp,sp,-36
	sw	s1,24(sp)
	lla	s1,.LANCHOR0
	lw	a5,0(s1)
	sw	s0,28(sp)
	sw	ra,32(sp)
	mv	s0,a0
	sb	zero,5(a5)
.L162:
	lw	a0,0(a5)
.L95:
	lw	a2,12(a5)
	addi	a4,a0,1
	li	a3,127
	sw	a2,8(s0)
	lw	a2,16(a5)
	sw	a2,12(s0)
	lw	a2,20(a5)
	sw	a2,16(s0)
	bgtu	a4,a3,.L96
	lla	a3,.L98
	slli	a4,a4,2
	add	a4,a4,a3
	lw	a4,0(a4)
	add	a4,a4,a3
	jr	a4
	.section	.rodata.scan,"a",@progbits
	.align	2
	.align	2
.L98:
	.word	.L167-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L126-.L98
	.word	.L127-.L98
	.word	.L126-.L98
	.word	.L126-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L126-.L98
	.word	.L125-.L98
	.word	.L150-.L98
	.word	.L123-.L98
	.word	.L96-.L98
	.word	.L122-.L98
	.word	.L121-.L98
	.word	.L198-.L98
	.word	.L119-.L98
	.word	.L118-.L98
	.word	.L117-.L98
	.word	.L116-.L98
	.word	.L115-.L98
	.word	.L114-.L98
	.word	.L113-.L98
	.word	.L112-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L111-.L98
	.word	.L110-.L98
	.word	.L109-.L98
	.word	.L108-.L98
	.word	.L107-.L98
	.word	.L106-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L102-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L102-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L105-.L98
	.word	.L96-.L98
	.word	.L104-.L98
	.word	.L103-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L102-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L96-.L98
	.word	.L101-.L98
	.word	.L100-.L98
	.word	.L99-.L98
	.word	.L97-.L98
	.section	.text.scan
.L96:
	sw	a5,0(sp)
	call	isdigit
	lw	a5,0(sp)
	bne	a0,zero,.L199
	lw	a0,0(a5)
	sw	a5,0(sp)
	call	isalpha
	lw	a5,0(sp)
	bne	a0,zero,.L200
	lw	a0,0(a5)
	li	a4,95
	beq	a0,a4,.L156
	li	a4,1
	sb	a4,4(a5)
	mv	a0,a5
	call	nextchar
	li	a4,3
	j	.L130
.L126:
	li	a4,1
	mv	a0,a5
	sb	a4,5(a5)
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	lw	a0,0(a5)
	j	.L95
.L102:
	li	a4,1
	sb	a4,4(a5)
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	li	a4,117
	lw	a3,24(a5)
	lw	a0,0(a5)
	lbu	a3,0(a3)
	beq	a3,a4,.L148
.L149:
	li	a4,34
	beq	a0,a4,.L150
	li	a4,39
	beq	a0,a4,.L198
	li	a4,1
	sb	a4,4(a5)
	j	.L152
.L153:
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	lw	a0,0(a5)
.L152:
	sw	a5,0(sp)
	call	isalnum
	lw	a5,0(sp)
	bne	a0,zero,.L153
	lw	a4,0(a5)
	li	a3,95
	beq	a4,a3,.L153
	li	a4,4
	j	.L130
.L198:
	mv	a0,a5
	call	charconst
.L128:
	sw	a0,0(s0)
	li	a4,1
	lw	a5,0(s1)
	bne	a0,a4,.L161
	lw	a4,36(a5)
	beq	a4,zero,.L161
	lw	a0,8(a5)
	call	fclose
	lw	a5,0(s1)
	lw	a0,24(a5)
	sw	a5,0(sp)
	call	free
	lw	a5,0(sp)
	mv	a0,a5
	call	free
	lw	a5,0(sp)
	lw	a5,36(a5)
	sw	a5,0(s1)
	call	scanopen
	lw	a5,0(s1)
	j	.L162
.L150:
	mv	a0,a5
	call	stringlit
	j	.L128
.L101:
	mv	a0,a5
	call	nextchar
	li	a4,66
.L130:
	lw	a5,0(s1)
	sw	a4,0(s0)
.L161:
	lbu	a4,4(a5)
	bne	a4,zero,.L201
	lbu	a5,5(a5)
	lw	ra,32(sp)
	sw	zero,20(s0)
	sb	zero,4(s0)
	sb	a5,5(s0)
	lw	s0,28(sp)
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
.L103:
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	li	a3,61
	li	a4,88
	lw	a2,0(a5)
	bne	a2,a3,.L130
	mv	a0,a5
	call	nextchar
	li	a4,106
	j	.L130
.L104:
	mv	a0,a5
	call	nextchar
	li	a4,63
	j	.L130
.L105:
	mv	a0,a5
	call	nextchar
	li	a4,62
	j	.L130
.L97:
	mv	a0,a5
	call	nextchar
	li	a4,76
	j	.L130
.L125:
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	li	a3,61
	li	a4,77
	lw	a2,0(a5)
	bne	a2,a3,.L130
	mv	a0,a5
	call	nextchar
	li	a4,87
	j	.L130
.L127:
	mv	a0,a5
	call	nextchar
	li	a4,2
	j	.L130
.L121:
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	li	a4,61
	lw	a3,0(a5)
	beq	a3,a4,.L202
	li	a2,38
	li	a4,72
	bne	a3,a2,.L130
	mv	a0,a5
	call	nextchar
	li	a4,90
	j	.L130
.L123:
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	li	a3,35
	li	a4,109
	lw	a2,0(a5)
	bne	a2,a3,.L130
	mv	a0,a5
	call	nextchar
	li	a4,110
	j	.L130
.L122:
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	li	a3,61
	li	a4,79
	lw	a2,0(a5)
	bne	a2,a3,.L130
	mv	a0,a5
	call	nextchar
	li	a4,100
	j	.L130
.L99:
	mv	a0,a5
	call	nextchar
	li	a4,67
	j	.L130
.L100:
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	li	a4,61
	lw	a3,0(a5)
	beq	a3,a4,.L203
	li	a2,124
	li	a4,89
	bne	a3,a2,.L130
	mv	a0,a5
	call	nextchar
	li	a4,91
	j	.L130
.L107:
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	li	a2,61
	lw	a3,0(a5)
	beq	a3,a2,.L204
	li	a1,62
	li	a4,83
	bne	a3,a1,.L130
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	li	a2,61
	li	a4,81
	lw	a3,0(a5)
	bne	a3,a2,.L130
	mv	a0,a5
	call	nextchar
	li	a4,104
	j	.L130
.L108:
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	li	a3,61
	li	a4,97
	lw	a2,0(a5)
	bne	a2,a3,.L130
	mv	a0,a5
	call	nextchar
	li	a4,86
	j	.L130
.L109:
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	li	a2,61
	lw	a3,0(a5)
	beq	a3,a2,.L205
	li	a1,60
	li	a4,82
	bne	a3,a1,.L130
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	li	a2,61
	li	a4,80
	lw	a3,0(a5)
	bne	a3,a2,.L130
	mv	a0,a5
	call	nextchar
	li	a4,103
	j	.L130
.L110:
	mv	a0,a5
	call	nextchar
	li	a4,95
	j	.L130
.L111:
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	li	a3,58
	li	a4,93
	lw	a2,0(a5)
	bne	a2,a3,.L130
	mv	a0,a5
	call	nextchar
	li	a4,94
	j	.L130
.L112:
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	li	a3,61
	lw	a4,0(a5)
	beq	a4,a3,.L206
	li	a3,42
	beq	a4,a3,.L136
	li	a3,47
	beq	a4,a3,.L138
	li	a4,78
	j	.L130
.L207:
	li	a4,-1
	beq	a0,a4,.L137
.L138:
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	li	a4,10
	lw	a0,0(a5)
	bne	a0,a4,.L207
.L137:
	li	a4,1
	sb	a4,5(a5)
	j	.L95
.L106:
	mv	a0,a5
	call	nextchar
	li	a4,92
	j	.L130
.L113:
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	lw	a0,0(a5)
	call	isdigit
	lw	a5,0(sp)
	bne	a0,zero,.L208
	lw	a3,0(a5)
	li	a2,46
	li	a4,68
	sw	a3,0(sp)
	bne	a3,a2,.L130
	lw	a3,16(a5)
	lw	a2,20(a5)
	sw	a4,20(sp)
	lw	a4,12(a5)
	mv	a0,a5
	sw	a3,12(sp)
	sw	a5,4(sp)
	sw	a4,8(sp)
	sw	a2,16(sp)
	call	nextchar
	lw	a5,4(sp)
	lw	a3,0(sp)
	lw	a0,0(a5)
	beq	a0,a3,.L147
	lw	a1,8(a5)
	call	my_ungetc
	lw	a5,4(sp)
	lw	a3,12(sp)
	lw	a4,8(sp)
	lw	a2,16(sp)
	sw	a3,16(a5)
	lw	a3,0(sp)
	sw	a4,12(a5)
	sw	a2,20(a5)
	lw	a4,20(sp)
	sw	a3,0(a5)
	j	.L130
.L114:
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	li	a4,61
	lw	a3,0(a5)
	beq	a3,a4,.L209
	li	a4,45
	beq	a3,a4,.L210
	li	a2,62
	li	a4,75
	bne	a3,a2,.L130
	mv	a0,a5
	call	nextchar
	li	a4,69
	j	.L130
.L115:
	mv	a0,a5
	call	nextchar
	li	a4,108
	j	.L130
.L116:
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	li	a4,61
	lw	a3,0(a5)
	beq	a3,a4,.L211
	li	a2,43
	li	a4,74
	bne	a3,a2,.L130
	mv	a0,a5
	call	nextchar
	li	a4,70
	j	.L130
.L117:
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	li	a3,61
	li	a4,73
	lw	a2,0(a5)
	bne	a2,a3,.L130
	mv	a0,a5
	call	nextchar
	li	a4,98
	j	.L130
.L118:
	mv	a0,a5
	call	nextchar
	li	a4,65
	j	.L130
.L119:
	mv	a0,a5
	call	nextchar
	li	a4,64
	j	.L130
.L201:
	lw	a4,28(a5)
	lw	a3,32(a5)
	lw	a0,24(a5)
	bltu	a4,a3,.L164
	li	a1,256
	beq	a3,zero,.L165
	slli	a1,a3,1
.L165:
	sw	a1,32(a5)
	li	a2,1
	sw	a5,0(sp)
	call	xreallocarray
	lw	a5,0(sp)
	lw	a4,28(a5)
	sw	a0,24(a5)
.L164:
	addi	a3,a4,1
	sw	a3,28(a5)
	add	a0,a0,a4
	sb	zero,0(a0)
	lw	a0,28(a5)
	sw	a5,0(sp)
	call	xmalloc
	lw	a5,0(sp)
	sw	a0,0(sp)
	lw	a2,28(a5)
	lw	a1,24(a5)
	sw	a5,4(sp)
	call	memcpy
	lw	a5,4(sp)
	lw	a4,0(sp)
	lw	ra,32(sp)
	sw	zero,28(a5)
	lw	a5,0(s1)
	sw	a4,20(s0)
	lw	s1,24(sp)
	sb	zero,4(a5)
	lbu	a5,5(a5)
	sb	zero,4(s0)
	sb	a5,5(s0)
	lw	s0,28(sp)
	addi	sp,sp,36
	jr	ra
.L210:
	mv	a0,a5
	call	nextchar
	li	a4,71
	j	.L130
.L167:
	li	a0,1
	j	.L128
.L200:
	lw	a0,0(a5)
.L156:
	li	a4,1
	sb	a4,4(a5)
	j	.L158
.L159:
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	lw	a0,0(a5)
.L158:
	sw	a5,0(sp)
	call	isalnum
	lw	a5,0(sp)
	bne	a0,zero,.L159
	lw	a4,0(a5)
	li	a3,95
	beq	a4,a3,.L159
	li	a4,4
	j	.L130
.L148:
	li	a4,56
	bne	a0,a4,.L149
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	lw	a0,0(a5)
	j	.L149
.L199:
	mv	a0,a5
	call	number
	j	.L128
.L206:
	mv	a0,a5
	call	nextchar
	li	a4,99
	j	.L130
.L136:
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	addi	a4,a5,12
	sw	a4,8(sp)
	lw	a4,0(a5)
	mv	a0,a5
	sw	a5,0(sp)
	sw	a4,4(sp)
	call	nextchar
	lw	a5,0(sp)
	li	a3,-1
	lw	a4,0(a5)
	beq	a4,a3,.L212
.L139:
	lw	a2,4(sp)
	li	a3,42
	beq	a2,a3,.L213
.L177:
	mv	a0,a5
	sw	a4,4(sp)
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	li	a3,-1
	lw	a4,0(a5)
	bne	a4,a3,.L139
.L212:
	lw	a0,8(sp)
	lla	a1,.LC9
	call	error
	lw	a5,0(sp)
	lw	a2,4(sp)
	li	a3,42
	lw	a4,0(a5)
	bne	a2,a3,.L177
.L213:
	li	a3,47
	bne	a4,a3,.L177
	mv	a0,a5
	sw	a5,0(sp)
	call	nextchar
	lw	a5,0(sp)
	li	a4,1
	lw	a0,0(a5)
	sb	a4,5(a5)
	j	.L95
.L208:
	lw	a4,28(a5)
	lw	a3,32(a5)
	lw	a0,24(a5)
	bltu	a4,a3,.L145
	li	a1,256
	beq	a3,zero,.L146
	slli	a1,a3,1
.L146:
	sw	a1,32(a5)
	li	a2,1
	sw	a5,0(sp)
	call	xreallocarray
	lw	a5,0(sp)
	lw	a4,28(a5)
	sw	a0,24(a5)
.L145:
	addi	a3,a4,1
	add	a0,a0,a4
	sw	a3,28(a5)
	li	a4,46
	sb	a4,0(a0)
	mv	a0,a5
	call	number
	j	.L128
.L147:
	mv	a0,a5
	call	nextchar
	li	a4,96
	j	.L130
.L203:
	mv	a0,a5
	call	nextchar
	li	a4,107
	j	.L130
.L204:
	mv	a0,a5
	call	nextchar
	li	a4,85
	j	.L130
.L209:
	mv	a0,a5
	call	nextchar
	li	a4,102
	j	.L130
.L205:
	mv	a0,a5
	call	nextchar
	li	a4,84
	j	.L130
.L211:
	mv	a0,a5
	call	nextchar
	li	a4,101
	j	.L130
.L202:
	mv	a0,a5
	call	nextchar
	li	a4,105
	j	.L130
	.size	scan, .-scan
	.section	.text.scan_init,"ax",@progbits
	.align	2
	.globl	scan_init
	.hidden	scan_init
	.type	scan_init, @function
scan_init:
	la a5, .LANCHOR0; sw zero, 0(a5);
	ret
	.size	scan_init, .-scan_init
	.section	.sbss.scanner,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	scanner, @object
	.size	scanner, 4
scanner:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
