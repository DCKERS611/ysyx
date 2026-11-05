#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"main.c"
	.option nopic
	.text
	.section	.text.yarg_asprintf,"ax",@progbits
	.align	2
	.type	yarg_asprintf, @function
yarg_asprintf:
	addi	sp,sp,-40
	sw	s1,12(sp)
	sw	ra,20(sp)
	sw	s0,16(sp)
	sw	a2,24(sp)
	sw	a3,28(sp)
	sw	a4,32(sp)
	sw	a5,36(sp)
	lla	s1,.LANCHOR0
	sw	a0,0(sp)
	beq	a1,s1,.L2
	mv	s0,a1
	addi	a3,sp,24
	mv	a2,a1
	li	a0,0
	li	a1,0
	sw	a3,8(sp)
	call	vsnprintf
	blt	a0,zero,.L2
	addi	a1,a0,1
	mv	a0,a1
	sw	a1,4(sp)
	call	malloc
	lw	a4,0(sp)
	sw	a0,0(a4)
	beq	a0,zero,.L2
	lw	a1,4(sp)
	addi	a3,sp,24
	mv	a2,s0
	sw	a3,8(sp)
	call	vsnprintf
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,40
	jr	ra
.L2:
	lw	a5,0(sp)
	lw	ra,20(sp)
	lw	s0,16(sp)
	sw	s1,0(a5)
	li	a0,14
	lw	s1,12(sp)
	addi	sp,sp,40
	jr	ra
	.size	yarg_asprintf, .-yarg_asprintf
	.section	.rodata.xread.part.0.str1.4,"aMS",@progbits,1
	.align	2
.LC14:
	.string	"Read error\n"
	.section	.text.xread.part.0,"ax",@progbits
	.align	2
	.type	xread.part.0, @function
xread.part.0:
	addi	sp,sp,-12
	lla	a1,.LC14
	la a0, stderr; lw a0, 0(a0);
	sw	ra,8(sp)
	call	fprintf
	li	a0,1
	call	exit
	.size	xread.part.0, .-xread.part.0
	.section	.rodata.xread_eofcheck.part.0.str1.4,"aMS",@progbits,1
	.align	2
.LC15:
	.string	"Error: Corrupt file\n"
	.section	.text.xread_eofcheck.part.0,"ax",@progbits
	.align	2
	.type	xread_eofcheck.part.0, @function
xread_eofcheck.part.0:
	addi	sp,sp,-12
	lla	a1,.LC15
	la a0, stderr; lw a0, 0(a0);
	sw	ra,8(sp)
	call	fprintf
	li	a0,1
	call	exit
	.size	xread_eofcheck.part.0, .-xread_eofcheck.part.0
	.set	xread_noeof.part.0,xread_eofcheck.part.0
	.section	.text.xread_noeof,"ax",@progbits
	.align	2
	.type	xread_noeof, @function
xread_noeof:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s0,a3
	call	fread
	mv	s1,a0
	mv	a0,s0
	call	ferror
	bne	a0,zero,.L18
	bne	s1,zero,.L19
	call	xread_noeof.part.0
.L19:
	mv	a0,s0
	call	feof
	bne	a0,zero,.L20
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L18:
	call	xread.part.0
.L20:
	call	xread_eofcheck.part.0
	.size	xread_noeof, .-xread_noeof
	.section	.rodata.yarg_parse_unix_short.str1.4,"aMS",@progbits,1
	.align	2
.LC16:
	.string	"%c%s -- missing argument\n"
	.align	2
.LC17:
	.string	"%c%.*s -- unknown option\n"
	.section	.text.yarg_parse_unix_short,"ax",@progbits
	.align	2
	.type	yarg_parse_unix_short, @function
yarg_parse_unix_short:
	addi	sp,sp,-64
	mv	t1,a0
	sw	a0,12(sp)
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	li	a0,1
	sw	a1,16(sp)
	sw	a2,36(sp)
	sw	a3,24(sp)
	sw	a4,32(sp)
	sw	a5,4(sp)
	ble	t1,a0,.L64
	li	t2,1
	sw	zero,8(sp)
	sw	zero,28(sp)
	mv	s1,t2
	j	.L39
.L23:
	lw	a5,8(sp)
	addi	s1,s1,1
	addi	a5,a5,1
	sw	a5,8(sp)
	lw	a5,12(sp)
	ble	a5,s1,.L105
.L39:
	lw	a5,16(sp)
	slli	s0,s1,2
	lw	a4,4(sp)
	add	a5,a5,s0
	lw	a3,0(a5)
	sw	a5,20(sp)
	lbu	a5,0(a3)
	bne	a5,a4,.L23
	lw	a4,32(sp)
	lbu	a5,1(a3)
	beq	a4,zero,.L24
	beq	a5,zero,.L106
	addi	a3,a3,1
	mv	a1,a3
.L26:
	li	t1,0
	li	a4,61
	j	.L28
.L29:
	lbu	a5,1(a3)
	addi	t1,t1,1
	addi	a3,a3,1
	mv	a2,t1
	beq	a5,zero,.L27
.L28:
	mv	a2,t1
	bne	a5,a4,.L29
.L27:
	lw	s0,36(sp)
	lw	a5,0(s0)
	beq	a5,zero,.L98
.L108:
	sw	s1,48(sp)
	sw	a3,44(sp)
	mv	s1,s0
	sw	t1,40(sp)
	mv	s0,a1
.L32:
	lw	a0,8(s1)
	beq	a0,zero,.L34
	mv	a1,s0
	sw	a2,0(sp)
	call	strncmp
	lw	a2,0(sp)
	beq	a0,zero,.L107
.L34:
	lw	a4,12(s1)
	addi	s1,s1,12
	bne	a4,zero,.L32
	lw	s1,40(sp)
	mv	a1,s0
.L30:
	lw	a5,24(sp)
	lw	a2,4(sp)
	mv	a4,a1
	addi	a0,a5,16
	mv	a3,s1
	lla	a1,.LC17
	call	yarg_asprintf
	li	a5,0
.L21:
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	mv	a0,a5
	addi	sp,sp,64
	jr	ra
.L24:
	addi	a3,a3,1
	mv	a1,a3
	li	t1,0
	li	a2,0
	bne	a5,zero,.L26
	lw	s0,36(sp)
	lw	a5,0(s0)
	bne	a5,zero,.L108
.L98:
	mv	s1,t1
	j	.L30
.L107:
	mv	s0,s1
	lw	a5,4(s0)
	li	a4,1
	lw	a3,44(sp)
	lw	s1,48(sp)
	beq	a5,a4,.L109
	li	a4,2
	beq	a5,a4,.L110
.L35:
	lw	a5,28(sp)
	addi	s1,s1,1
	addi	a5,a5,1
	sw	a5,28(sp)
	lw	a5,12(sp)
	bgt	a5,s1,.L39
.L105:
	lw	a5,28(sp)
	addi	a5,a5,1
	slli	a0,a5,1
	add	a0,a0,a5
	lw	a5,8(sp)
	slli	a0,a0,2
	addi	s0,a5,1
	slli	s0,s0,2
.L22:
	li	a1,1
	call	calloc
	lw	s1,24(sp)
	li	a1,1
	sw	a0,0(s1)
	mv	a0,s0
	call	calloc
	lw	a5,0(s1)
	sw	a0,8(s1)
	beq	a5,zero,.L101
	beq	a0,zero,.L101
	lw	a4,12(sp)
	li	a5,1
	sw	a5,8(sp)
	ble	a4,a5,.L45
.L41:
	lw	a5,8(sp)
	lw	a4,16(sp)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	s0,0(a5)
	sw	a5,20(sp)
	lw	a4,4(sp)
	lbu	a5,0(s0)
	bne	a5,a4,.L42
	lw	a5,32(sp)
	lbu	a4,1(s0)
	beq	a5,zero,.L43
	beq	a4,zero,.L111
	addi	s0,s0,1
	mv	a1,s0
.L48:
	li	a5,0
	j	.L50
.L51:
	lbu	a4,1(s0)
	addi	a5,a5,1
	addi	s0,s0,1
	mv	a2,a5
	beq	a4,zero,.L49
.L50:
	li	a3,61
	mv	a2,a5
	bne	a4,a3,.L51
.L49:
	lw	s1,36(sp)
	lw	a5,0(s1)
	beq	a5,zero,.L52
	sw	s0,28(sp)
	mv	s0,s1
	mv	s1,a2
	j	.L54
.L55:
	lw	a5,12(s0)
	addi	s0,s0,12
	beq	a5,zero,.L52
.L54:
	lw	a0,8(s0)
	beq	a0,zero,.L55
	mv	a2,s1
	sw	a1,0(sp)
	call	strncmp
	lw	a1,0(sp)
	bne	a0,zero,.L55
	lw	a5,24(sp)
	mv	a2,s1
	mv	s1,s0
	lw	t1,4(a5)
	lw	s0,28(sp)
	lw	a5,0(a5)
	sw	a0,28(sp)
	slli	a0,t1,1
	lw	a4,4(s1)
	lw	t2,0(s1)
	lw	t0,8(s1)
	add	a0,a0,t1
	slli	a0,a0,2
	add	a5,a5,a0
	sw	a5,0(sp)
	sw	t2,0(a5)
	sw	t0,4(a5)
	addi	a4,a4,-1
	li	a0,1
	bleu	a4,a0,.L112
.L56:
	lw	a5,24(sp)
	addi	t1,t1,1
	sw	t1,4(a5)
.L60:
	lw	a5,8(sp)
	lw	a4,12(sp)
	addi	a5,a5,1
	sw	a5,8(sp)
	bgt	a4,a5,.L41
.L45:
	li	a5,1
.L116:
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	mv	a0,a5
	addi	sp,sp,64
	jr	ra
.L109:
	lbu	a3,0(a3)
	li	a5,61
	beq	a3,a5,.L35
	lw	a5,20(sp)
	lw	a5,4(a5)
	beq	a5,zero,.L36
	lbu	a5,0(a5)
	lw	a4,4(sp)
	beq	a5,a4,.L36
	addi	s1,s1,1
	j	.L35
.L110:
	lbu	a4,0(a3)
	li	a5,61
	beq	a4,a5,.L35
	lw	a5,20(sp)
	lw	a5,4(a5)
	beq	a5,zero,.L35
	lbu	a5,0(a5)
	lw	a4,4(sp)
	sub	a5,a5,a4
	snez	a5,a5
	add	s1,s1,a5
	j	.L35
.L42:
	lw	a3,24(sp)
	mv	a0,s0
	lw	a5,12(a3)
	lw	s1,8(a3)
	addi	a4,a5,1
	sw	a4,12(a3)
	slli	a5,a5,2
	add	s1,s1,a5
	call	strlen
	li	a1,1
	addi	a0,a0,1
	call	calloc
	beq	a0,zero,.L113
	mv	a1,s0
	sw	a0,0(sp)
	call	strcpy
	lw	a5,0(sp)
	sw	a5,0(s1)
	j	.L60
.L43:
	addi	s0,s0,1
	mv	a1,s0
	li	a2,0
	bne	a4,zero,.L48
	j	.L49
.L112:
	lbu	a4,0(s0)
	li	a5,61
	beq	a4,a5,.L114
	lw	a5,20(sp)
	lw	s1,4(a5)
	beq	s1,zero,.L56
	lbu	a4,0(s1)
	lw	a5,4(sp)
	beq	a4,a5,.L56
	mv	a0,s1
	call	strlen
	li	a1,1
	addi	a0,a0,1
	call	calloc
	mv	s0,a0
	beq	a0,zero,.L103
	mv	a1,s1
	call	strcpy
	lw	a5,24(sp)
	lw	t1,4(a5)
	lw	a5,8(sp)
	addi	a5,a5,1
	sw	a5,8(sp)
	lw	a5,0(sp)
	sw	s0,8(a5)
	j	.L56
.L114:
	addi	a2,a2,1
	add	s1,a1,a2
	mv	a0,s1
	call	strlen
	li	a1,1
	addi	a0,a0,1
	call	calloc
	mv	s0,a0
	beq	a0,zero,.L103
	mv	a1,s1
	call	strcpy
	lw	a5,24(sp)
	lw	t1,4(a5)
	lw	a5,0(sp)
	sw	s0,8(a5)
	j	.L56
.L113:
	mv	a5,s1
	sw	zero,0(a5)
.L101:
	lw	a5,24(sp)
	lla	a1,.LANCHOR0
	addi	a0,a5,16
	call	yarg_asprintf
	lw	ra,60(sp)
	lw	s0,56(sp)
	li	a5,0
	lw	s1,52(sp)
	mv	a0,a5
	addi	sp,sp,64
	jr	ra
.L106:
	lw	a5,28(sp)
	addi	a4,a5,1
	slli	a0,a4,1
	lw	a5,12(sp)
	add	a0,a0,a4
	lw	a4,8(sp)
	sub	a5,a5,s1
	slli	a0,a0,2
	add	a5,a4,a5
	slli	s0,a5,2
	j	.L22
.L36:
	lw	a5,24(sp)
	lw	a3,8(s0)
	lw	a2,4(sp)
	sw	a0,0(sp)
	lla	a1,.LC16
	addi	a0,a5,16
	call	yarg_asprintf
	lw	a5,0(sp)
	j	.L21
.L111:
	lw	a5,8(sp)
	addi	s0,a5,1
	lw	a5,12(sp)
	ble	a5,s0,.L45
	sw	s0,4(sp)
	lw	s1,20(sp)
	lw	s0,24(sp)
.L47:
	lw	a5,12(s0)
	lw	a3,4(s1)
	lw	a2,8(s0)
	addi	a1,a5,1
	slli	a5,a5,2
	mv	a0,a3
	add	a5,a2,a5
	sw	a1,12(s0)
	sw	a3,8(sp)
	sw	a5,0(sp)
	call	strlen
	li	a1,1
	addi	a0,a0,1
	call	calloc
	lw	a3,8(sp)
	beq	a0,zero,.L115
	mv	a1,a3
	sw	a0,8(sp)
	call	strcpy
	lw	a5,4(sp)
	lw	a3,0(sp)
	addi	s1,s1,4
	addi	a4,a5,1
	lw	a5,8(sp)
	sw	a4,4(sp)
	sw	a5,0(a3)
	lw	a5,12(sp)
	bne	a5,a4,.L47
	li	a5,1
	j	.L116
.L115:
	lw	a5,0(sp)
	sw	zero,0(a5)
	j	.L101
.L103:
	lw	a5,28(sp)
	lla	a1,.LANCHOR0
	sw	a5,4(sp)
	lw	a5,0(sp)
	sw	zero,8(a5)
	lw	a5,24(sp)
	addi	a0,a5,16
	call	yarg_asprintf
	lw	a5,4(sp)
	j	.L21
.L64:
	li	s0,4
	li	a0,12
	j	.L22
.L52:
	lw	a5,0(zero)
	ebreak
	.size	yarg_parse_unix_short, .-yarg_parse_unix_short
	.section	.rodata.yarg_parse_unix.str1.4,"aMS",@progbits,1
	.align	2
.LC18:
	.string	"--%s -- missing argument\n"
	.align	2
.LC19:
	.string	"-%c -- missing argument\n"
	.align	2
.LC20:
	.string	"-%c -- unknown option\n"
	.align	2
.LC21:
	.string	"--%.*s -- unknown option\n"
	.section	.text.yarg_parse_unix,"ax",@progbits
	.align	2
	.type	yarg_parse_unix, @function
yarg_parse_unix:
	addi	sp,sp,-60
	sw	ra,56(sp)
	sw	s0,52(sp)
	sw	s1,48(sp)
	sw	a0,12(sp)
	li	a5,1
	sw	a1,8(sp)
	sw	a2,24(sp)
	sw	a3,28(sp)
	sw	a4,32(sp)
	ble	a0,a5,.L181
	li	t0,1
	sw	zero,4(sp)
	sw	zero,20(sp)
	mv	s1,t0
	j	.L144
.L119:
	lw	a5,4(sp)
	addi	a5,a5,1
	sw	a5,4(sp)
.L121:
	lw	a5,12(sp)
	addi	s1,s1,1
	ble	a5,s1,.L252
.L144:
	lw	a4,8(sp)
	slli	a5,s1,2
	li	a2,45
	add	a4,a4,a5
	lw	a3,0(a4)
	sw	a4,16(sp)
	lbu	a4,0(a3)
	bne	a4,a2,.L119
	lbu	a2,1(a3)
	li	a4,45
	bne	a2,a4,.L253
	lw	a4,32(sp)
	lbu	a5,2(a3)
	beq	a4,zero,.L123
	beq	a5,zero,.L254
	addi	a3,a3,2
	mv	a1,a3
.L125:
	li	t1,0
	li	a4,61
	j	.L127
.L128:
	lbu	a5,1(a3)
	addi	t1,t1,1
	addi	a3,a3,1
	mv	a2,t1
	beq	a5,zero,.L126
.L127:
	mv	a2,t1
	bne	a5,a4,.L128
.L126:
	lw	s0,24(sp)
	lw	a5,0(s0)
	beq	a5,zero,.L239
.L262:
	sw	s1,44(sp)
	sw	a3,40(sp)
	sw	t1,36(sp)
	mv	s1,a2
.L131:
	lw	a0,8(s0)
	beq	a0,zero,.L133
	mv	a2,s1
	sw	a1,0(sp)
	call	strncmp
	lw	a1,0(sp)
	beq	a0,zero,.L255
.L133:
	lw	a4,12(s0)
	addi	s0,s0,12
	bne	a4,zero,.L131
	lw	s1,36(sp)
.L129:
	lw	a5,28(sp)
	mv	a3,a1
	mv	a2,s1
	addi	a0,a5,16
	lla	a1,.LC21
	call	yarg_asprintf
	li	a5,0
.L117:
	lw	ra,56(sp)
	lw	s0,52(sp)
	lw	s1,48(sp)
	mv	a0,a5
	addi	sp,sp,60
	jr	ra
.L253:
	beq	a2,zero,.L121
	lw	a4,24(sp)
	lw	a1,8(sp)
	lw	a0,20(sp)
	addi	a5,a5,4
	lw	t1,0(a4)
	add	a5,a1,a5
	li	t0,1
	addi	a1,a3,2
	sw	a3,16(sp)
	sw	s1,0(sp)
	sw	a5,20(sp)
	sub	t2,t0,a0
	li	s0,2
	mv	s1,a5
	mv	a3,a4
.L122:
	add	ra,t2,a0
	beq	t1,zero,.L139
	mv	a4,t1
	mv	a5,a3
.L138:
	beq	a2,a4,.L137
	lw	a4,12(a5)
	addi	a5,a5,12
	bne	a4,zero,.L138
.L139:
	lw	a5,28(sp)
	lla	a1,.LC20
	addi	a0,a5,16
	call	yarg_asprintf
	lw	ra,56(sp)
	lw	s0,52(sp)
	li	a5,0
	lw	s1,48(sp)
	mv	a0,a5
	addi	sp,sp,60
	jr	ra
.L137:
	lw	a5,4(a5)
	beq	a5,t0,.L256
	beq	a5,s0,.L257
.L142:
	lbu	a2,0(a1)
	addi	a0,a0,1
	addi	a1,a1,1
	bne	a2,zero,.L122
	lw	s1,0(sp)
	lw	a5,12(sp)
	sw	a0,20(sp)
	addi	s1,s1,1
	bgt	a5,s1,.L144
.L252:
	lw	a5,20(sp)
	addi	s1,a5,1
	lw	a5,4(sp)
	slli	a0,s1,1
	add	a0,a0,s1
	addi	s0,a5,1
	slli	a0,a0,2
	slli	s0,s0,2
.L118:
	li	a1,1
	call	calloc
	lw	s1,28(sp)
	li	a1,1
	sw	a0,0(s1)
	mv	a0,s0
	call	calloc
	lw	a4,0(s1)
	sw	a0,8(s1)
	beq	a4,zero,.L246
	beq	a0,zero,.L246
	lw	a4,12(sp)
	li	a5,1
	sw	a5,4(sp)
	ble	a4,a5,.L153
	lw	s1,28(sp)
.L146:
	lw	a5,4(sp)
	lw	a1,8(sp)
	li	a3,45
	slli	a5,a5,2
	add	s0,a1,a5
	lw	a4,0(s0)
	sw	s0,16(sp)
	lbu	a2,0(a4)
	bne	a2,a3,.L147
	lbu	a2,1(a4)
	bne	a2,a3,.L258
	lw	a5,32(sp)
	lbu	a0,2(a4)
	beq	a5,zero,.L151
	beq	a0,zero,.L259
	addi	a4,a4,2
	mv	a1,a4
.L156:
	li	a5,0
	li	t0,61
	j	.L158
.L159:
	lbu	a0,1(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	mv	a2,a5
	beq	a0,zero,.L157
.L158:
	mv	a2,a5
	bne	a0,t0,.L159
.L157:
	lw	s0,24(sp)
	lw	a5,0(s0)
	beq	a5,zero,.L160
	sw	s1,36(sp)
	sw	a4,20(sp)
	mv	s1,a1
	j	.L162
.L163:
	lw	a5,12(s0)
	addi	s0,s0,12
	beq	a5,zero,.L160
.L162:
	lw	a0,8(s0)
	beq	a0,zero,.L163
	mv	a1,s1
	sw	a2,0(sp)
	call	strncmp
	lw	a2,0(sp)
	bne	a0,zero,.L163
	mv	a1,s1
	lw	s1,36(sp)
	sw	a0,0(sp)
	lw	t2,0(s0)
	lw	a0,4(s1)
	lw	t1,0(s1)
	lw	a3,4(s0)
	slli	t0,a0,1
	lw	a5,8(s0)
	add	t0,t0,a0
	slli	t0,t0,2
	add	s0,t1,t0
	sw	t2,0(s0)
	sw	a5,4(s0)
	addi	t0,a3,-1
	li	t2,1
	lw	a4,20(sp)
	bleu	t0,t2,.L260
.L164:
	addi	a0,a0,1
	sw	a0,4(s1)
.L149:
	lw	a5,4(sp)
	lw	a4,12(sp)
	addi	a5,a5,1
	sw	a5,4(sp)
	bgt	a4,a5,.L146
.L153:
	li	a5,1
	j	.L117
.L257:
	lbu	a5,0(a1)
	bne	a5,zero,.L261
	lw	a5,0(s1)
	beq	a5,zero,.L142
	lbu	a5,0(a5)
	li	a4,45
	beq	a5,a4,.L142
	lw	s1,0(sp)
.L248:
	addi	s1,s1,1
.L245:
	addi	a5,a0,1
	sw	a5,20(sp)
	j	.L121
.L123:
	addi	a3,a3,2
	mv	a1,a3
	li	t1,0
	li	a2,0
	bne	a5,zero,.L125
	lw	s0,24(sp)
	lw	a5,0(s0)
	bne	a5,zero,.L262
.L239:
	mv	s1,t1
	j	.L129
.L255:
	lw	a5,4(s0)
	li	a2,1
	lw	a3,40(sp)
	lw	s1,44(sp)
	beq	a5,a2,.L263
	li	a4,2
	beq	a5,a4,.L264
.L134:
	lw	a5,20(sp)
	addi	a5,a5,1
	sw	a5,20(sp)
	j	.L121
.L263:
	lbu	a3,0(a3)
	li	a5,61
	beq	a3,a5,.L134
	lw	a5,16(sp)
	lw	a5,4(a5)
	beq	a5,zero,.L135
	lbu	a5,0(a5)
	li	a4,45
	beq	a5,a4,.L135
	addi	s1,s1,1
	j	.L134
.L264:
	lbu	a4,0(a3)
	li	a5,61
	beq	a4,a5,.L134
	lw	a5,16(sp)
	lw	a5,4(a5)
	beq	a5,zero,.L134
	lbu	a5,0(a5)
	addi	a5,a5,-45
	snez	a5,a5
	add	s1,s1,a5
	j	.L134
.L256:
	lw	a3,16(sp)
	lw	s1,0(sp)
	add	ra,a3,ra
	lbu	a5,1(ra)
	bne	a5,zero,.L245
	lw	a5,20(sp)
	lw	a5,0(a5)
	beq	a5,zero,.L141
	lbu	a5,0(a5)
	li	a4,45
	bne	a5,a4,.L248
.L141:
	lw	a5,28(sp)
	lla	a1,.LC19
	addi	a0,a5,16
	call	yarg_asprintf
	li	a5,0
	j	.L117
.L260:
	lbu	t0,0(a4)
	li	a4,61
	beq	t0,a4,.L265
	lw	a5,16(sp)
	lw	a2,4(a5)
	beq	a2,zero,.L164
	lbu	a4,0(a2)
	li	a5,45
	beq	a4,a5,.L164
	mv	a0,a2
	sw	a2,16(sp)
	call	strlen
	li	a1,1
	addi	a0,a0,1
	call	calloc
	lw	a2,16(sp)
	beq	a0,zero,.L247
	mv	a1,a2
	sw	a0,0(sp)
	call	strcpy
	lw	a5,4(sp)
	lw	a4,0(sp)
	lw	a0,4(s1)
	addi	a5,a5,1
	sw	a5,4(sp)
	sw	a4,8(s0)
	j	.L164
.L147:
	lw	a5,12(s1)
	lw	s0,8(s1)
	mv	a0,a4
	addi	a2,a5,1
	sw	a2,12(s1)
	slli	a5,a5,2
	sw	a4,0(sp)
	add	s0,s0,a5
	call	strlen
	li	a1,1
	addi	a0,a0,1
	call	calloc
	lw	a4,0(sp)
	beq	a0,zero,.L266
	mv	a1,a4
	sw	a0,0(sp)
	call	strcpy
	lw	a5,0(sp)
	sw	a5,0(s0)
	j	.L149
.L258:
	beq	a2,zero,.L149
	lw	t2,24(sp)
	addi	a5,a5,4
	add	t1,a1,a5
	lw	a0,0(t2)
	li	a1,2
	sw	t1,0(sp)
.L150:
	beq	a0,zero,.L139
	mv	a5,a0
	mv	a4,t2
	beq	a2,a5,.L168
.L267:
	lw	a5,12(a4)
	addi	a4,a4,12
	beq	a5,zero,.L139
	bne	a2,a5,.L267
.L168:
	lw	a5,4(s1)
	lw	a3,0(s1)
	lw	t0,8(a4)
	slli	t1,a5,1
	lw	a4,4(a4)
	add	t1,t1,a5
	slli	t1,t1,2
	add	t1,a3,t1
	sw	a2,0(t1)
	sw	t0,4(t1)
	addi	a4,a4,-1
	li	a3,1
	bleu	a4,a3,.L176
	lw	a4,0(s0)
	add	a4,a4,a1
.L173:
	addi	a5,a5,1
	sw	a5,4(s1)
	lbu	a2,0(a4)
	addi	a1,a1,1
	bne	a2,zero,.L150
	j	.L149
.L176:
	lw	a4,0(s0)
	add	a4,a4,a1
	lbu	a2,0(a4)
	bne	a2,zero,.L268
	lw	a3,0(sp)
	lw	a2,0(a3)
	beq	a2,zero,.L173
	lbu	t0,0(a2)
	li	a3,45
	beq	t0,a3,.L173
	addi	a5,a5,1
	mv	a0,a2
	sw	a5,4(s1)
	sw	a2,0(sp)
	mv	s0,t1
	call	strlen
	li	a1,1
	addi	a0,a0,1
	call	calloc
	lw	a4,4(sp)
	lw	a2,0(sp)
	addi	a4,a4,1
	sw	a4,4(sp)
	beq	a0,zero,.L249
	mv	a1,a2
	sw	a0,0(sp)
	call	strcpy
	lw	a5,0(sp)
	sw	a5,8(s0)
	j	.L149
.L151:
	addi	a4,a4,2
	mv	a1,a4
	li	a2,0
	bne	a0,zero,.L156
	j	.L157
.L261:
	addi	a5,a0,1
	lw	s1,0(sp)
	sw	a5,20(sp)
	j	.L121
.L268:
	addi	a5,a5,1
	mv	a0,a4
	sw	a5,4(s1)
	sw	a4,0(sp)
	mv	s0,t1
	call	strlen
	li	a1,1
	addi	a0,a0,1
	call	calloc
	lw	a4,0(sp)
	beq	a0,zero,.L249
	mv	a1,a4
	sw	a0,0(sp)
	call	strcpy
	lw	a5,0(sp)
	sw	a5,8(s0)
	j	.L149
.L266:
	sw	zero,0(s0)
.L246:
	lw	a5,28(sp)
	lla	a1,.LANCHOR0
	addi	a0,a5,16
	call	yarg_asprintf
	li	a5,0
	j	.L117
.L265:
	addi	a4,a2,1
	add	a4,a1,a4
	mv	a0,a4
	sw	a4,16(sp)
	call	strlen
	li	a1,1
	addi	a0,a0,1
	call	calloc
	lw	a4,16(sp)
	beq	a0,zero,.L247
	mv	a1,a4
	sw	a0,0(sp)
	call	strcpy
	lw	a2,0(sp)
	lw	a0,4(s1)
	sw	a2,8(s0)
	j	.L164
.L181:
	li	s0,4
	li	a0,12
	j	.L118
.L135:
	lw	a5,28(sp)
	lw	a2,8(s0)
	sw	a0,0(sp)
	lla	a1,.LC18
	addi	a0,a5,16
	call	yarg_asprintf
	lw	a5,0(sp)
	j	.L117
.L254:
	lw	a5,20(sp)
	addi	a4,a5,1
	slli	a0,a4,1
	lw	a5,12(sp)
	add	a0,a0,a4
	lw	a4,4(sp)
	sub	a5,a5,s1
	slli	a0,a0,2
	add	a5,a4,a5
	slli	s0,a5,2
	j	.L118
.L249:
	sw	zero,8(s0)
	j	.L246
.L247:
	lw	a5,28(sp)
	sw	zero,8(s0)
	lla	a1,.LANCHOR0
	addi	a0,a5,16
	call	yarg_asprintf
	lw	a5,0(sp)
	j	.L117
.L259:
	lw	a5,4(sp)
	addi	s1,a5,1
	lw	a5,12(sp)
	ble	a5,s1,.L153
	lw	s0,16(sp)
.L155:
	lw	a4,28(sp)
	lw	a2,4(s0)
	lw	a5,12(a4)
	lw	a1,8(a4)
	sw	a2,4(sp)
	addi	a0,a5,1
	slli	a5,a5,2
	add	a5,a1,a5
	sw	a0,12(a4)
	mv	a0,a2
	sw	a5,0(sp)
	call	strlen
	li	a1,1
	addi	a0,a0,1
	call	calloc
	lw	a2,4(sp)
	beq	a0,zero,.L269
	mv	a1,a2
	sw	a0,4(sp)
	call	strcpy
	lw	a5,4(sp)
	lw	a4,0(sp)
	addi	s1,s1,1
	addi	s0,s0,4
	sw	a5,0(a4)
	lw	a5,12(sp)
	bne	a5,s1,.L155
	li	a5,1
	j	.L117
.L269:
	lw	a5,0(sp)
	sw	zero,0(a5)
	j	.L246
.L160:
	lw	a5,0(zero)
	ebreak
	.size	yarg_parse_unix, .-yarg_parse_unix
	.section	.text.yarg_destroy,"ax",@progbits
	.align	2
	.globl	yarg_destroy
	.hidden	yarg_destroy
	.type	yarg_destroy, @function
yarg_destroy:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	mv	s0,a0
	beq	a0,zero,.L272
	lw	a0,0(a0)
	beq	a0,zero,.L273
	lw	a5,4(s0)
	ble	a5,zero,.L273
	li	s1,0
.L275:
	slli	a5,s1,1
	add	a5,a5,s1
	slli	a5,a5,2
	add	a0,a0,a5
	lw	a0,8(a0)
	addi	s1,s1,1
	call	free
	lw	a5,4(s0)
	lw	a0,0(s0)
	bgt	a5,s1,.L275
.L273:
	call	free
	lw	a0,8(s0)
	beq	a0,zero,.L276
	lw	a5,12(s0)
	ble	a5,zero,.L276
	li	s1,0
.L278:
	slli	a5,s1,2
	add	a0,a0,a5
	lw	a0,0(a0)
	addi	s1,s1,1
	call	free
	lw	a5,12(s0)
	lw	a0,8(s0)
	bgt	a5,s1,.L278
.L276:
	call	free
	lw	a0,16(s0)
	lla	a5,.LANCHOR0
	beq	a0,a5,.L272
	call	free
.L272:
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	free
	.size	yarg_destroy, .-yarg_destroy
	.section	.text.yarg_parse,"ax",@progbits
	.align	2
	.globl	yarg_parse
	.hidden	yarg_parse
	.type	yarg_parse, @function
yarg_parse:
	addi	sp,sp,-32
	mv	t1,a0
	mv	t0,a1
	li	a0,20
	li	a1,1
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	ra,28(sp)
	sw	t1,8(sp)
	sw	t0,4(sp)
	sw	a2,0(sp)
	sw	a4,16(sp)
	andi	s1,a3,0xff
	call	calloc
	mv	s0,a0
	beq	a0,zero,.L287
	lw	a5,16(sp)
	li	a4,1
	lw	a2,0(sp)
	lw	t0,4(sp)
	lw	t1,8(sp)
	beq	a5,a4,.L289
	li	a4,2
	beq	a5,a4,.L290
	beq	a5,zero,.L295
.L287:
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L289:
	mv	a4,s1
	mv	a3,a0
	mv	a1,t0
	mv	a0,t1
	call	yarg_parse_unix
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L295:
	mv	a3,a0
	li	a5,47
	li	a4,0
	mv	a1,t0
	mv	a0,t1
	call	yarg_parse_unix_short
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L290:
	mv	a4,s1
	mv	a3,a0
	li	a5,45
	mv	a1,t0
	mv	a0,t1
	call	yarg_parse_unix_short
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
	.size	yarg_parse, .-yarg_parse
	.section	.rodata.bench_init.str1.4,"aMS",@progbits,1
	.align	2
.LC22:
	.string	"AM Panic: "
	.align	2
.LC23:
	.string	"Assertion `batch == 0' failed"
	.align	2
.LC24:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/300.bzip3/main.c:669  \n"
	.align	2
.LC25:
	.string	"./a.out"
	.align	2
.LC27:
	.string	"bzip3: out of memory.\n"
	.align	2
.LC28:
	.string	"Try 'bzip3 --help' for more information.\n"
	.align	2
.LC29:
	.ascii	"bzip3 - better and stronger spiritual successor to bzip2.\nU"
	.ascii	"sage: bzip3 [-e/-z/-d/-t/-c/-h/-V] [-b block_size] [-j jobs]"
	.ascii	" files...\nOperations:\n  -e/-z, --encode   compress data (d"
	.ascii	"efault)\n  -d, --decode      decompress data\n  -r, --recove"
	.ascii	"r     attempt at recovering corrupted data\n  -t, --test    "
	.ascii	"    verify validity of compressed data\n  -h, --help        "
	.ascii	"display an usage overview\n  -f, --force       force overwri"
	.ascii	"ting output if it already exists\n      --rm          remove"
	.ascii	" input files after successful (de)compression\n  -k, --keep "
	.ascii	"       keep (don't delete) input files (default)\n  -v, --ve"
	.ascii	"rbose     verbose mode (display more information)\n  -V, --v"
	.ascii	"ersi"
	.string	"on     display version information\nExtra flags:\n  -c, --stdout      force writing to standard output\n  -b N, --block=N   set block size in MiB {16}\n  -B, --batch       process all files specified as inputs\n\nReport bugs to: https://github.com/iczelia/bzip3\n"
	.align	2
.LC30:
	.string	"bzip3 1.5.3.r3-gfe3b43d\nCopyright (C) by Kamila Szewczyk, 2022-2025.\nLicense: GNU Lesser GPL version 3 <https://www.gnu.org/licenses/lgpl-3.0.en.html>\n"
	.align	2
.LC31:
	.string	"Block size must be between 65 KiB and 511 MiB.\n"
	.align	2
.LC32:
	.string	"Error: too many files specified.\n"
	.align	2
.LC33:
	.string	"Failed to allocate memory.\n"
	.align	2
.LC34:
	.string	".bz3"
	.align	2
.LC35:
	.string	"Warning: file %s has an unknown extension, skipping.\n"
	.align	2
.LC36:
	.string	"rb"
	.align	2
.LC37:
	.string	"Error: failed to open input file `%s'\n"
	.align	2
.LC38:
	.string	"bzip3: invalid block size: %s\n"
	.section	.text.bench_init,"ax",@progbits
	.align	2
	.globl	bench_init
	.hidden	bench_init
	.type	bench_init, @function
bench_init:
	slli	a5,a0,1
	add	a5,a5,a0
	lla	a4,.LANCHOR2
	slli	a5,a5,3
	add	a5,a4,a5
	addi	sp,sp,-224
	lw	a4,0(a5)
	sw	s0,216(sp)
	sw	ra,220(sp)
	sw	s1,212(sp)
	lla	s0,.LANCHOR1
	sw	a5,0(s0)
	li	a1,1024
	lla	a5,.LC25
	lla	a0,.LANCHOR3
	sw	a5,20(sp)
	sw	a4,24(sp)
	sw	zero,28(sp)
	call	bench_obuf_init
	lw	a5,0(s0)
	lla	a2,.LANCHOR4
	addi	a4,sp,32
	lw	a3,4(a5)
	lla	t0,.LANCHOR5+180
	lla	a5,.LANCHOR5
	sw	a3,0(a2)
.L297:
	lw	t1,0(a5)
	lw	a0,4(a5)
	lw	a1,8(a5)
	lw	a2,12(a5)
	lw	a3,16(a5)
	sw	t1,0(a4)
	sw	a0,4(a4)
	sw	a1,8(a4)
	sw	a2,12(a4)
	sw	a3,16(a4)
	addi	a5,a5,20
	addi	a4,a4,20
	bne	a5,t0,.L297
	li	a1,1
	li	a0,20
	call	calloc
	sw	a0,8(sp)
	beq	a0,zero,.L372
	lw	s0,8(sp)
	li	a4,1
	addi	a2,sp,32
	mv	a3,s0
	addi	a1,sp,20
	li	a0,2
	call	yarg_parse_unix
	lw	a0,16(s0)
	beq	a0,zero,.L299
	lla	s1,stderr
	lw	a1,0(s1)
	call	fputs
	lw	a1,0(s1)
	lla	a0,.LC28
	call	fputs
	li	a0,1
	call	bench_exit
.L299:
	lw	a4,8(sp)
	lw	a5,4(a4)
	sw	a5,4(sp)
	ble	a5,zero,.L300
	lw	a4,0(a4)
	li	s0,0
	sw	zero,12(sp)
	addi	s1,a4,8
	sw	zero,16(sp)
.L316:
	lw	a5,-8(s1)
	li	a2,56
	addi	a5,a5,-66
	bgtu	a5,a2,.L301
	lla	a4,.L303
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.bench_init,"a",@progbits
	.align	2
	.align	2
.L303:
	.word	.L312-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L354-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L310-.L303
	.word	.L309-.L303
	.word	.L308-.L303
	.word	.L302-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L307-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L306-.L303
	.word	.L301-.L303
	.word	.L305-.L303
	.word	.L301-.L303
	.word	.L304-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L301-.L303
	.word	.L302-.L303
	.section	.text.bench_init
.L307:
	lla	a5,stdout
	lw	a0,0(a5)
	lla	a1,.LC29
	sw	a5,0(sp)
	call	fprintf
	li	a0,0
	call	bench_exit
	lw	a5,0(sp)
.L311:
	lw	a0,0(a5)
	lla	a1,.LC30
	li	a5,1
	sw	a5,12(sp)
	call	fprintf
	li	a0,0
	call	bench_exit
.L301:
	lw	a5,4(sp)
	addi	s0,s0,1
	addi	s1,s1,12
	bne	s0,a5,.L316
.L378:
	lla	a5,.LANCHOR4
	lw	a4,0(a5)
	li	a5,-65536
	addi	a5,a5,-1024
	add	a4,a4,a5
	li	a5,535756800
	addi	a5,a5,-1024
	bgtu	a4,a5,.L340
.L317:
	lw	a5,12(sp)
	bne	a5,zero,.L342
.L341:
	lw	a5,8(sp)
	lw	t1,12(a5)
	ble	t1,zero,.L326
	lw	a5,8(sp)
	li	s1,0
	addi	s1,s1,1
	lw	a5,8(a5)
	li	a3,0
	lw	a2,0(a5)
	addi	s0,a5,4
	beq	s1,t1,.L373
.L324:
	lw	a4,0(s0)
	beq	a2,zero,.L343
	beq	a3,zero,.L344
	lla	a5,stderr
	lw	a0,0(a5)
	lla	a1,.LC32
	sw	t1,8(sp)
	sw	a2,4(sp)
	sw	a4,0(sp)
	call	fprintf
	li	a0,1
	call	bench_exit
	lw	a3,0(sp)
	lw	a2,4(sp)
	lw	t1,8(sp)
	addi	s0,s0,4
.L381:
	addi	s1,s1,1
	bne	s1,t1,.L324
.L373:
	beq	a2,zero,.L374
.L325:
	lla	s0,.LANCHOR6
	lw	a5,0(s0)
	li	a4,2
	beq	a5,a4,.L375
	li	a4,1
	beq	a5,a4,.L376
	beq	a5,zero,.L332
	li	a4,3
	beq	a5,a4,.L332
	la a2, .LANCHOR8; lw a2, 0(a2);
	li	s1,0
.L328:
	beq	a2,zero,.L320
.L383:
	mv	a0,a2
	lla	a1,.LC36
	sw	a3,4(sp)
	sw	a2,0(sp)
	call	fopen
	lw	a2,0(sp)
	lw	a3,4(sp)
	beq	a0,zero,.L377
.L336:
	lw	a2,0(s0)
	la a5, .LANCHOR9; sw a0, 0(a5);
	li	a4,2
	li	a5,0
	beq	a2,a4,.L337
	la a5, stdout; lw a5, 0(a5);
.L337:
	la a4, .LANCHOR10; sw a5, 0(a4);
	beq	s1,a3,.L296
	mv	a0,s1
	call	free
.L296:
	lw	ra,220(sp)
	lw	s0,216(sp)
	lw	s1,212(sp)
	addi	sp,sp,224
	jr	ra
.L302:
	li	a5,1
	la a2, .LANCHOR6; sw a5, 0(a2);
	lw	a5,4(sp)
	addi	s0,s0,1
	addi	s1,s1,12
	bne	s0,a5,.L316
	j	.L378
.L308:
	la a5, .LANCHOR6; sw zero, 0(a5);
	lw	a5,4(sp)
	addi	s0,s0,1
	addi	s1,s1,12
	bne	s0,a5,.L316
	j	.L378
.L309:
	li	a5,1
	sw	a5,16(sp)
	lw	a5,4(sp)
	addi	s0,s0,1
	addi	s1,s1,12
	bne	s0,a5,.L316
	j	.L378
.L310:
	lw	a5,0(s1)
	lbu	a0,0(a5)
	bne	a0,zero,.L315
	j	.L313
.L380:
	lw	a5,0(sp)
	lbu	a0,1(a5)
	addi	a5,a5,1
	beq	a0,zero,.L379
.L315:
	sw	a5,0(sp)
	call	isdigit
	bne	a0,zero,.L380
	lw	a2,0(s1)
	lla	a1,.LC38
	la a0, stderr; lw a0, 0(a0);
	call	fprintf
	li	a0,1
	call	bench_exit
	lw	a5,0(s1)
.L313:
	mv	a0,a5
	li	a2,10
	li	a1,0
	call	strtol
	slli	a0,a0,20
	lla	a5,.LANCHOR4
	sw	a0,0(a5)
.L384:
	lw	a5,4(sp)
	addi	s0,s0,1
	addi	s1,s1,12
	bne	s0,a5,.L316
	j	.L378
.L304:
	li	a5,1
	la a2, .LANCHOR7; sw a5, 0(a2);
	lw	a5,4(sp)
	addi	s0,s0,1
	addi	s1,s1,12
	bne	s0,a5,.L316
	j	.L378
.L306:
	li	a5,3
	la a2, .LANCHOR6; sw a5, 0(a2);
	lw	a5,4(sp)
	addi	s0,s0,1
	addi	s1,s1,12
	bne	s0,a5,.L316
	j	.L378
.L305:
	li	a5,2
	la a2, .LANCHOR6; sw a5, 0(a2);
	lw	a5,4(sp)
	addi	s0,s0,1
	addi	s1,s1,12
	bne	s0,a5,.L316
	j	.L378
.L344:
	mv	a3,a4
	addi	s0,s0,4
	j	.L381
.L343:
	mv	a2,a4
	addi	s0,s0,4
	j	.L381
.L376:
	beq	a3,zero,.L382
.L333:
	la a5, .LANCHOR8; sw a2, 0(a5);
	mv	s1,a3
	bne	a2,zero,.L383
.L320:
	la a0, stdin; lw a0, 0(a0);
	j	.L336
.L354:
	lla	a5,stdout
	j	.L311
.L312:
	li	a5,1
	sw	a5,12(sp)
	j	.L301
.L300:
	lla	a5,.LANCHOR4
	lw	a4,0(a5)
	li	a5,-65536
	addi	a5,a5,-1024
	add	a4,a4,a5
	li	a5,535756800
	addi	a5,a5,-1024
	bgtu	a4,a5,.L348
	sw	zero,16(sp)
	j	.L341
.L348:
	sw	zero,12(sp)
	sw	zero,16(sp)
.L340:
	lla	a1,.LC31
	la a0, stderr; lw a0, 0(a0);
	call	fprintf
	li	a0,1
	call	bench_exit
	j	.L317
.L379:
	lw	a5,0(s1)
	li	a2,10
	li	a1,0
	mv	a0,a5
	call	strtol
	slli	a0,a0,20
	lla	a5,.LANCHOR4
	sw	a0,0(a5)
	j	.L384
.L375:
	la a5, .LANCHOR8; sw a2, 0(a5);
	li	s1,0
	j	.L328
.L332:
	bne	a3,zero,.L333
	lw	a4,16(sp)
	lla	a5,.LANCHOR8
	sw	a2,0(a5)
	li	s1,0
	bne	a4,zero,.L328
	mv	a0,a2
	sw	a5,8(sp)
	sw	a3,4(sp)
	sw	a2,0(sp)
	call	strlen
	addi	a0,a0,1
	call	malloc
	lw	a2,0(sp)
	lw	a3,4(sp)
	lw	a5,8(sp)
	mv	s1,a0
	beq	a0,zero,.L385
.L334:
	mv	a1,a2
	mv	a0,s1
	sw	a5,8(sp)
	sw	a3,4(sp)
	sw	a2,0(sp)
	call	strcpy
	mv	a0,s1
	call	strlen
	li	a4,4
	lw	a2,0(sp)
	lw	a3,4(sp)
	lw	a5,8(sp)
	bleu	a0,a4,.L335
	mv	a0,s1
	call	strlen
	addi	a0,a0,-4
	lla	a1,.LC34
	add	a0,s1,a0
	call	strcmp
	lw	a2,0(sp)
	lw	a3,4(sp)
	lw	a5,8(sp)
	beq	a0,zero,.L386
.L335:
	lla	a1,.LC35
	la a0, stderr; lw a0, 0(a0);
	sw	a5,4(sp)
	sw	a3,0(sp)
	call	fprintf
	li	a0,1
	call	bench_exit
	lw	a5,4(sp)
	lw	a3,0(sp)
	lw	a2,0(a5)
	j	.L328
.L374:
	bne	a3,zero,.L325
.L326:
	la a5, .LANCHOR8; sw zero, 0(a5);
	li	a3,0
	li	s1,0
	lla	s0,.LANCHOR6
	j	.L320
.L382:
	lw	a4,16(sp)
	lla	a5,.LANCHOR8
	sw	a2,0(a5)
	li	s1,0
	bne	a4,zero,.L328
	mv	a0,a2
	sw	a5,8(sp)
	sw	a3,4(sp)
	sw	a2,0(sp)
	call	strlen
	addi	a0,a0,5
	call	malloc
	lw	a2,0(sp)
	lw	a3,4(sp)
	lw	a5,8(sp)
	mv	s1,a0
	beq	a0,zero,.L387
.L331:
	mv	a1,a2
	mv	a0,s1
	sw	a5,4(sp)
	sw	a3,0(sp)
	call	strcpy
	lla	a1,.LC34
	mv	a0,s1
	call	strcat
	lw	a5,4(sp)
	lw	a3,0(sp)
	lw	a2,0(a5)
	j	.L328
.L386:
	mv	a0,s1
	sw	a5,4(sp)
	sw	a3,0(sp)
	call	strlen
	lw	a5,4(sp)
	add	a4,s1,a0
	lw	a3,0(sp)
	lw	a2,0(a5)
	sb	zero,-4(a4)
	j	.L328
.L377:
	lla	a1,.LC37
	la a0, stderr; lw a0, 0(a0);
	call	fprintf
	li	a0,1
	call	exit
.L342:
	lla	s0,.LC22
	li	a0,65
.L318:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L318
	lla	s0,.LC23
	li	a0,65
.L321:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L321
	lla	s0,.LC24
	li	a0,32
.L322:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L322
	li	a0,1
	call	halt
.L385:
	lla	a1,.LC33
	la a0, stderr; lw a0, 0(a0);
	call	fprintf
	li	a0,1
	call	bench_exit
	lw	a5,8(sp)
	lw	a3,4(sp)
	lw	a2,0(sp)
	j	.L334
.L387:
	lla	a1,.LC33
	la a0, stderr; lw a0, 0(a0);
	call	fprintf
	li	a0,1
	call	bench_exit
	lw	a5,8(sp)
	lw	a3,4(sp)
	lw	a2,0(sp)
	j	.L331
.L372:
	lla	a1,.LC27
	la a0, stderr; lw a0, 0(a0);
	call	fprintf
	li	a0,1
	call	bench_exit
	lw	a5,16(zero)
	ebreak
	.size	bench_init, .-bench_init
	.section	.rodata.bench_run.str1.4,"aMS",@progbits,1
	.align	2
.LC39:
	.string	"BZ3v1"
	.align	2
.LC40:
	.string	"Invalid signature.\n"
	.align	2
.LC41:
	.string	"The input file is corrupted. Reason: Invalid block size in the header.\n"
	.align	2
.LC42:
	.string	"Recovery mode: Proceeding.\n"
	.align	2
.LC43:
	.string	"Failed to create a block encoder state.\n"
	.align	2
.LC44:
	.string	"Failed to encode a block: %s\n"
	.align	2
.LC45:
	.string	"Failed to decode a block: Inconsistent headers.\n"
	.align	2
.LC46:
	.string	"Failed to decode a block: %s\n"
	.align	2
.LC47:
	.string	"Writing invalid block: %s\n"
	.align	2
.LC48:
	.string	"Failed to read data: %s\n"
	.align	2
.LC49:
	.string	" %s:"
	.align	2
.LC50:
	.string	"\t%llu -> %llu bytes, %llu%%, %llu bpb\n"
	.globl	__udivdi3
	.align	2
.LC51:
	.string	"\tOK, %llu -> %llu bytes, %llu%%, %llu bpb\n"
	.section	.text.bench_run,"ax",@progbits
	.align	2
	.globl	bench_run
	.hidden	bench_run
	.type	bench_run, @function
bench_run:
	addi	sp,sp,-100
	la a3, .LANCHOR10; lw a3, 0(a3);
	sw	a3,60(sp)
	la a3, .LANCHOR4; lw a3, 0(a3);
	sw	a3,36(sp)
	la a3, .LANCHOR7; lw a3, 0(a3);
	la a4, .LANCHOR6; lw a4, 0(a4);
	sw	a3,52(sp)
	la a3, .LANCHOR8; lw a3, 0(a3);
	sw	s1,88(sp)
	sw	ra,96(sp)
	sw	s0,92(sp)
	sw	a4,44(sp)
	li	a5,1
	sw	a3,64(sp)
	la s1, .LANCHOR9; lw s1, 0(s1);
	beq	a4,a5,.L389
	ble	a4,a5,.L481
	lw	a4,44(sp)
	addi	a4,a4,-2
	bgtu	a4,a5,.L439
.L391:
	mv	a3,s1
	li	a2,1
	li	a1,5
	addi	a0,sp,80
	call	fread
	mv	s0,a0
	mv	a0,s1
	call	ferror
	bne	a0,zero,.L404
	li	a5,1
	bne	s0,a5,.L396
	li	a2,5
	lla	a1,.LC39
	addi	a0,sp,80
	call	strncmp
	bne	a0,zero,.L396
	mv	a3,s1
	li	a2,1
	li	a1,4
	addi	a0,sp,76
	call	xread_noeof
	lw	a3,76(sp)
	li	a5,-65536
	addi	a5,a5,-1024
	li	a4,535756800
	add	a5,a3,a5
	addi	a4,a4,-1024
	bgtu	a5,a4,.L397
	sw	a3,36(sp)
.L398:
	li	a5,9
	sw	zero,32(sp)
	sw	zero,28(sp)
	sw	a5,20(sp)
	sw	zero,24(sp)
	j	.L392
.L481:
	beq	a4,zero,.L391
.L439:
	sw	zero,32(sp)
	sw	zero,28(sp)
	sw	zero,20(sp)
	sw	zero,24(sp)
.L392:
	lw	a0,36(sp)
	call	bz3_new
	sw	a0,40(sp)
	beq	a0,zero,.L482
.L400:
	lw	a0,36(sp)
	call	bz3_bound
	sw	a0,56(sp)
	call	malloc
	sw	a0,16(sp)
	beq	a0,zero,.L483
	lw	a4,44(sp)
	li	a5,1
	beq	a4,a5,.L402
	lw	a5,44(sp)
	bne	a5,zero,.L473
.L413:
	mv	a0,s1
	call	feof
	bne	a0,zero,.L477
.L419:
	mv	a3,s1
	li	a2,4
	li	a1,1
	addi	a0,sp,76
	call	fread
	mv	s0,a0
	mv	a0,s1
	call	ferror
	bne	a0,zero,.L484
	beq	s0,zero,.L413
	mv	a0,s1
	call	feof
	bne	a0,zero,.L423
	lw	t1,76(sp)
	mv	a3,s1
	li	a2,4
	li	a1,1
	addi	a0,sp,76
	sw	t1,48(sp)
	call	xread_noeof
	lw	a0,36(sp)
	lw	s0,76(sp)
	call	bz3_bound
	lw	t1,48(sp)
	bgtu	s0,a0,.L433
	lw	a0,36(sp)
	sw	t1,48(sp)
	call	bz3_bound
	lw	t1,48(sp)
	bgtu	t1,a0,.L433
	lw	a0,16(sp)
	mv	a2,t1
	mv	a3,s1
	li	a1,1
	call	xread_noeof
	lw	t1,48(sp)
	lw	a4,20(sp)
	lw	a2,56(sp)
	addi	a5,t1,8
	add	t0,a4,a5
	sltu	t2,t0,a4
	lw	a4,24(sp)
	lw	a1,16(sp)
	lw	a0,40(sp)
	srai	a5,a5,31
	add	a5,a4,a5
	add	a5,t2,a5
	mv	a4,s0
	mv	a3,t1
	sw	a5,24(sp)
	sw	t0,20(sp)
	call	bz3_decode_block
	li	a5,-1
	beq	a0,a5,.L480
	beq	s0,zero,.L418
	lw	a1,16(sp)
	mv	a2,s0
	lla	a0,.LANCHOR3
	call	bench_obuf_append
.L418:
	lw	a4,32(sp)
	lw	a3,28(sp)
	mv	a0,s1
	add	a5,a4,s0
	srai	s0,s0,31
	sltu	a4,a5,a4
	add	s0,a3,s0
	sw	a5,32(sp)
	add	a5,a4,s0
	sw	a5,28(sp)
	call	feof
	beq	a0,zero,.L419
.L477:
	lw	a0,60(sp)
	call	fflush
.L409:
	lw	a0,40(sp)
	call	bz3_last_error
	bne	a0,zero,.L485
.L429:
	lw	a0,16(sp)
	call	free
	lw	a0,40(sp)
	call	bz3_free
	lw	a5,52(sp)
	beq	a5,zero,.L399
	lw	a5,64(sp)
	lla	s0,stderr
	beq	a5,zero,.L435
	lw	a0,0(s0)
	mv	a2,a5
	lla	a1,.LC49
	call	fprintf
.L435:
	lw	a4,44(sp)
	li	a5,1
	lw	s0,0(s0)
	beq	a4,a5,.L486
	lw	a1,20(sp)
	lw	a0,24(sp)
	slli	a5,a1,1
	srli	a2,a1,31
	slli	a4,a0,1
	add	a3,a5,a1
	or	a4,a2,a4
	add	a4,a4,a0
	sltu	a5,a3,a5
	add	a5,a5,a4
	slli	a5,a5,3
	slli	a4,a3,3
	srli	a3,a3,29
	mv	a2,a0
	or	a5,a3,a5
	add	a0,a4,a1
	sltu	a4,a0,a4
	add	a5,a5,a2
	add	a5,a4,a5
	lw	a2,32(sp)
	lw	a3,28(sp)
	slli	a5,a5,2
	srli	a1,a0,30
	or	a1,a1,a5
	slli	a0,a0,2
	call	__udivdi3
	lw	a4,24(sp)
	mv	s1,a0
	lw	a0,20(sp)
	lw	a2,32(sp)
	lw	a3,28(sp)
	mv	a5,a1
	srli	t1,a0,29
	slli	a1,a4,3
	or	a1,t1,a1
	slli	a0,a0,3
	sw	a5,16(sp)
	call	__udivdi3
	lw	t1,16(sp)
	lw	t0,44(sp)
	sw	a1,12(sp)
	sw	a0,8(sp)
	sw	s1,0(sp)
	sw	t1,4(sp)
	lw	a4,32(sp)
	lw	a5,28(sp)
	lw	a2,20(sp)
	lw	a3,24(sp)
	lla	a1,.LC50
	beq	t0,zero,.L478
	lla	a1,.LC51
.L478:
	mv	a0,s0
	sw	s1,68(sp)
	sw	t1,72(sp)
	sw	zero,52(sp)
	call	fprintf
	j	.L399
.L408:
	lw	a2,36(sp)
	lw	a0,16(sp)
	mv	a3,s1
	li	a1,1
	call	fread
	mv	s0,a0
	mv	a0,s1
	call	ferror
	bne	a0,zero,.L404
	lw	a4,20(sp)
	srai	a5,s0,31
	add	a3,a4,s0
	sltu	a2,a3,a4
	lw	a4,24(sp)
	sw	a3,20(sp)
	add	a5,a4,a5
	add	a5,a2,a5
	sw	a5,24(sp)
	beq	s0,zero,.L477
	lw	a1,16(sp)
	lw	a0,40(sp)
	mv	a2,s0
	call	bz3_encode_block
	li	a3,-1
	mv	a5,a0
	beq	a0,a3,.L487
	li	a2,4
	addi	a1,sp,76
	lla	a0,.LANCHOR3
	sw	a5,76(sp)
	sw	a5,48(sp)
	call	bench_obuf_append
	li	a2,4
	addi	a1,sp,76
	lla	a0,.LANCHOR3
	sw	s0,76(sp)
	call	bench_obuf_append
	lw	a5,48(sp)
	beq	a5,zero,.L407
	lw	a1,16(sp)
	mv	a2,a5
	lla	a0,.LANCHOR3
	call	bench_obuf_append
	lw	a5,48(sp)
.L407:
	lw	a3,32(sp)
	lw	a2,28(sp)
	addi	a5,a5,8
	add	a4,a3,a5
	srai	a5,a5,31
	sltu	a3,a4,a3
	add	a5,a2,a5
	add	a5,a3,a5
	sw	a4,32(sp)
	sw	a5,28(sp)
.L402:
	mv	a0,s1
	call	feof
	beq	a0,zero,.L408
	j	.L477
.L396:
	lla	a1,.LC40
	la a0, stderr; lw a0, 0(a0);
	call	fprintf
.L479:
	li	a5,1
	sw	a5,52(sp)
.L399:
	lw	a4,52(sp)
	lw	ra,96(sp)
	lw	s0,92(sp)
	la a5, .LANCHOR1; lw a5, 0(a5);
	lw	a0,16(a5)
	lw	a1,20(a5)
	la a5, .LANCHOR11; sw a4, 0(a5);
	lw	s1,88(sp)
	addi	sp,sp,100
	jr	ra
.L389:
	li	a2,5
	lla	a1,.LC39
	lla	a0,.LANCHOR3
	call	bench_obuf_append
	lw	a5,36(sp)
	li	a2,4
	addi	a1,sp,76
	lla	a0,.LANCHOR3
	sw	a5,76(sp)
	li	a5,9
	sw	a5,32(sp)
	call	bench_obuf_append
	lw	a0,36(sp)
	sw	zero,28(sp)
	sw	zero,20(sp)
	sw	zero,24(sp)
	call	bz3_new
	sw	a0,40(sp)
	bne	a0,zero,.L400
.L482:
	lla	a1,.LC43
	la a0, stderr; lw a0, 0(a0);
	call	fprintf
	j	.L479
.L473:
	lw	a4,44(sp)
	li	a5,3
	beq	a4,a5,.L422
	lw	a4,44(sp)
	li	a5,2
	bne	a4,a5,.L409
.L431:
	mv	a0,s1
	call	feof
	bne	a0,zero,.L409
	mv	a3,s1
	li	a2,4
	li	a1,1
	addi	a0,sp,76
	call	fread
	mv	s0,a0
	mv	a0,s1
	call	ferror
	bne	a0,zero,.L404
	beq	s0,zero,.L431
	mv	a0,s1
	call	feof
	bne	a0,zero,.L423
	mv	a3,s1
	li	a2,4
	li	a1,1
	addi	a0,sp,76
	lw	s0,76(sp)
	call	xread_noeof
	lw	a4,76(sp)
	lw	a0,36(sp)
	sw	a4,48(sp)
	call	bz3_bound
	lw	a4,48(sp)
	bgtu	a4,a0,.L433
	lw	a0,36(sp)
	sw	a4,48(sp)
	call	bz3_bound
	bgtu	s0,a0,.L433
	lw	a0,16(sp)
	mv	a3,s1
	mv	a2,s0
	li	a1,1
	call	xread_noeof
	lw	a2,20(sp)
	lw	t1,32(sp)
	lw	a4,48(sp)
	addi	a5,s0,8
	add	t2,a2,a5
	add	t0,t1,a4
	sltu	ra,t2,a2
	sltu	a2,t0,t1
	lw	t1,24(sp)
	srai	a5,a5,31
	sw	a2,48(sp)
	add	a5,t1,a5
	lw	t1,28(sp)
	sw	t2,20(sp)
	add	t2,ra,a5
	lw	a5,48(sp)
	srai	a3,a4,31
	lw	a2,56(sp)
	lw	a1,16(sp)
	lw	a0,40(sp)
	add	t1,t1,a3
	add	a5,a5,t1
	mv	a3,s0
	sw	a5,28(sp)
	sw	t2,24(sp)
	sw	t0,32(sp)
	call	bz3_decode_block
	li	a5,-1
	bne	a0,a5,.L431
.L480:
	lw	a0,40(sp)
	la s0, stderr; lw s0, 0(s0);
	call	bz3_strerror
	mv	a2,a0
	lla	a1,.LC46
	mv	a0,s0
	call	fprintf
	li	a5,1
	sw	a5,52(sp)
	j	.L399
.L489:
	lw	a0,40(sp)
	la a5, stderr; lw a5, 0(a5);
	sw	a5,48(sp)
	call	bz3_strerror
	lw	a5,48(sp)
	mv	a2,a0
	lla	a1,.LC47
	mv	a0,a5
	call	fprintf
.L426:
	beq	s0,zero,.L427
	lw	a1,16(sp)
	mv	a2,s0
	lla	a0,.LANCHOR3
	call	bench_obuf_append
.L427:
	lw	a4,32(sp)
	lw	a3,28(sp)
	add	a5,a4,s0
	srai	s0,s0,31
	sltu	a4,a5,a4
	add	s0,a3,s0
	sw	a5,32(sp)
	add	a5,a4,s0
	sw	a5,28(sp)
.L422:
	mv	a0,s1
	call	feof
	bne	a0,zero,.L488
	mv	a3,s1
	li	a2,4
	li	a1,1
	addi	a0,sp,76
	call	fread
	mv	s0,a0
	mv	a0,s1
	call	ferror
	bne	a0,zero,.L404
	beq	s0,zero,.L422
	mv	a0,s1
	call	feof
	bne	a0,zero,.L423
	lw	t1,76(sp)
	mv	a3,s1
	li	a2,4
	li	a1,1
	addi	a0,sp,76
	sw	t1,48(sp)
	call	xread_noeof
	lw	a0,36(sp)
	lw	s0,76(sp)
	call	bz3_bound
	lw	t1,48(sp)
	bgtu	s0,a0,.L433
	lw	a0,36(sp)
	sw	t1,48(sp)
	call	bz3_bound
	lw	t1,48(sp)
	bgtu	t1,a0,.L433
	lw	a0,16(sp)
	mv	a2,t1
	mv	a3,s1
	li	a1,1
	call	xread_noeof
	lw	t1,48(sp)
	lw	a4,20(sp)
	lw	a2,56(sp)
	addi	a5,t1,8
	add	t0,a4,a5
	sltu	t2,t0,a4
	lw	a4,24(sp)
	lw	a1,16(sp)
	lw	a0,40(sp)
	srai	a5,a5,31
	add	a5,a4,a5
	add	a5,t2,a5
	mv	a4,s0
	mv	a3,t1
	sw	a5,24(sp)
	sw	t0,20(sp)
	call	bz3_decode_block
	li	a5,-1
	bne	a0,a5,.L426
	j	.L489
.L433:
	lla	a1,.LC45
	la a0, stderr; lw a0, 0(a0);
	call	fprintf
	li	a5,1
	sw	a5,52(sp)
	j	.L399
.L485:
	lw	a0,40(sp)
	la s0, stderr; lw s0, 0(s0);
	call	bz3_strerror
	mv	a2,a0
	lla	a1,.LC48
	mv	a0,s0
	call	fprintf
	li	a5,1
	sw	a5,52(sp)
	j	.L399
.L487:
	lw	a0,40(sp)
	la s0, stderr; lw s0, 0(s0);
	call	bz3_strerror
	mv	a2,a0
	lla	a1,.LC44
	mv	a0,s0
	call	fprintf
	lw	a5,44(sp)
	sw	a5,52(sp)
	j	.L399
.L488:
	lw	a0,60(sp)
	call	fflush
	lw	a0,40(sp)
	call	bz3_last_error
	j	.L429
.L486:
	lw	s1,32(sp)
	lw	t0,28(sp)
	lw	a2,20(sp)
	lw	a3,24(sp)
	slli	a5,t0,3
	srli	a1,s1,29
	slli	a0,s1,3
	or	a1,a1,a5
	call	__udivdi3
	lw	t0,28(sp)
	slli	a5,s1,1
	srli	a2,s1,31
	slli	a4,t0,1
	add	a3,a5,s1
	or	a4,a2,a4
	add	a4,a4,t0
	sltu	a5,a3,a5
	add	a5,a5,a4
	slli	a5,a5,3
	slli	a4,a3,3
	srli	a3,a3,29
	add	t1,a4,s1
	or	a5,a3,a5
	sltu	a4,t1,a4
	add	a5,a5,t0
	lw	a2,20(sp)
	lw	a3,24(sp)
	add	a5,a4,a5
	slli	a5,a5,2
	srli	a4,t1,30
	mv	t0,a0
	mv	t2,a1
	slli	a0,t1,2
	or	a1,a4,a5
	sw	t0,8(sp)
	sw	t2,12(sp)
	call	__udivdi3
	lw	a5,28(sp)
	lw	a2,20(sp)
	lw	a3,24(sp)
	mv	t0,a0
	mv	t1,a1
	sw	a0,0(sp)
	sw	a1,4(sp)
	mv	a4,s1
	lla	a1,.LC50
	mv	a0,s0
	sw	t0,68(sp)
	sw	t1,72(sp)
	sw	zero,52(sp)
	call	fprintf
	j	.L399
.L397:
	lla	s0,stderr
	lw	a0,0(s0)
	lla	a1,.LC41
	call	fprintf
	lw	a4,44(sp)
	li	a5,3
	bne	a4,a5,.L479
	lw	a0,0(s0)
	li	a5,535822336
	lla	a1,.LC42
	sw	a5,36(sp)
	call	fprintf
	j	.L398
.L404:
	call	xread.part.0
.L484:
	lla	a1,.LC14
	la a0, stderr; lw a0, 0(a0);
	call	fprintf
	li	a0,1
	call	exit
.L423:
	call	xread_eofcheck.part.0
.L483:
	lla	a1,.LC33
	la a0, stderr; lw a0, 0(a0);
	call	fprintf
	li	a5,1
	sw	a5,52(sp)
	j	.L399
	.size	bench_run, .-bench_run
	.section	.rodata.bench_validate.str1.4,"aMS",@progbits,1
	.align	2
.LC52:
	.string	"Error: Failed on fflush\n"
	.align	2
.LC53:
	.string	"Error: Failed on fclose\n"
	.section	.text.bench_validate,"ax",@progbits
	.align	2
	.globl	bench_validate
	.hidden	bench_validate
	.type	bench_validate, @function
bench_validate:
	addi	sp,sp,-12
	la a0, .LANCHOR9; lw a0, 0(a0);
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	call	fclose
	la s0, .LANCHOR10; lw s0, 0(s0);
	beq	s0,zero,.L491
	mv	a0,s0
	call	fflush
	bne	a0,zero,.L502
	la a5, stdout; lw a5, 0(a5);
	beq	s0,a5,.L491
	mv	a0,s0
	call	fclose
	bne	a0,zero,.L503
.L491:
	lla	s0,.LANCHOR3
	lw	a0,0(s0)
	lw	a1,4(s0)
	add	a1,a0,a1
	call	bench_checksum
	la a5, .LANCHOR1; lw a5, 0(a5);
	lw	a3,4(s0)
	lw	a4,8(a5)
	beq	a3,a4,.L504
.L493:
	li	a5,1
	la a4, .LANCHOR11; sw a5, 0(a4);
	li	s1,1
.L494:
	lw	a0,0(s0)
	call	free
	lw	ra,8(sp)
	lw	s0,4(sp)
	mv	a0,s1
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L504:
	lw	a5,12(a5)
	bne	a5,a0,.L493
	la s1, .LANCHOR11; lw s1, 0(s1);
	j	.L494
.L503:
	lla	a1,.LC53
	la a0, stderr; lw a0, 0(a0);
	call	fprintf
	li	a0,1
	call	exit
.L502:
	lla	a1,.LC52
	la a0, stderr; lw a0, 0(a0);
	call	fprintf
	li	a0,1
	call	exit
	.size	bench_validate, .-bench_validate
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"encode"
	.align	2
.LC1:
	.string	"decode"
	.align	2
.LC2:
	.string	"test"
	.align	2
.LC3:
	.string	"stdout"
	.align	2
.LC4:
	.string	"force"
	.align	2
.LC5:
	.string	"recover"
	.align	2
.LC6:
	.string	"help"
	.align	2
.LC7:
	.string	"rm"
	.align	2
.LC8:
	.string	"keep"
	.align	2
.LC9:
	.string	"version"
	.align	2
.LC10:
	.string	"verbose"
	.align	2
.LC11:
	.string	"block"
	.align	2
.LC12:
	.string	"batch"
	.hidden	output_des
	.globl	output_des
	.hidden	input_des
	.globl	input_des
	.align	2
.LC54:
	.string	"input/test-hello.txt"
	.align	2
.LC55:
	.string	"input/train-queen.c"
	.align	2
.LC56:
	.string	"input/ref-universe.jpg"
	.align	2
.LC57:
	.string	"input/huge.model"
	.section	.rodata
	.align	2
	.set	.LANCHOR5,. + 0
.LC26:
	.word	101
	.word	0
	.word	.LC0
	.word	122
	.word	0
	.word	.LC0
	.word	100
	.word	0
	.word	.LC1
	.word	116
	.word	0
	.word	.LC2
	.word	99
	.word	0
	.word	.LC3
	.word	102
	.word	0
	.word	.LC4
	.word	114
	.word	0
	.word	.LC5
	.word	104
	.word	0
	.word	.LC6
	.word	256
	.word	0
	.word	.LC7
	.word	107
	.word	0
	.word	.LC8
	.word	86
	.word	0
	.word	.LC9
	.word	118
	.word	0
	.word	.LC10
	.word	98
	.word	1
	.word	.LC11
	.word	66
	.word	0
	.word	.LC12
	.word	0
	.word	0
	.word	0
	.section	.bss.obuf,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	obuf, @object
	.size	obuf, 12
obuf:
	.zero	12
	.section	.rodata.settings,"a"
	.align	3
	.set	.LANCHOR2,. + 0
	.type	settings, @object
	.size	settings, 96
settings:
	.word	.LC54
	.word	66560
	.word	39
	.word	-896121883
	.word	0
	.word	0
	.word	.LC55
	.word	393216
	.word	564
	.word	1207928878
	.word	560
	.word	0
	.word	.LC56
	.word	1048576
	.word	4984391
	.word	-1960327011
	.word	886563
	.word	0
	.word	.LC57
	.word	535822336
	.word	50431625
	.word	1450363890
	.word	6211844
	.word	0
	.section	.rodata.yarg_oom,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	yarg_oom, @object
	.size	yarg_oom, 14
yarg_oom:
	.string	"Out of memory"
	.section	.sbss.block_size,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	block_size, @object
	.size	block_size, 4
block_size:
	.zero	4
	.section	.sbss.input,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	input, @object
	.size	input, 4
input:
	.zero	4
	.section	.sbss.input_des,"aw",@nobits
	.align	2
	.set	.LANCHOR9,. + 0
	.type	input_des, @object
	.size	input_des, 4
input_des:
	.zero	4
	.section	.sbss.output_des,"aw",@nobits
	.align	2
	.set	.LANCHOR10,. + 0
	.type	output_des, @object
	.size	output_des, 4
output_des:
	.zero	4
	.section	.sbss.ps,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	ps, @object
	.size	ps, 4
ps:
	.zero	4
	.section	.sbss.r,"aw",@nobits
	.align	2
	.set	.LANCHOR11,. + 0
	.type	r, @object
	.size	r, 4
r:
	.zero	4
	.section	.sdata.mode,"aw"
	.align	2
	.set	.LANCHOR6,. + 0
	.type	mode, @object
	.size	mode, 4
mode:
	.word	1
	.section	.sdata.verbose,"aw"
	.align	2
	.set	.LANCHOR7,. + 0
	.type	verbose, @object
	.size	verbose, 4
verbose:
	.word	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
