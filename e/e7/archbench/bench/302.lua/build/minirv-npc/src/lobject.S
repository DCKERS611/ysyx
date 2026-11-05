#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lobject.c"
	.option nopic
	.text
	.globl	__mulsi3
	.section	.text.intarith,"ax",@progbits
	.align	2
	.type	intarith, @function
intarith:
	mv	a5,a1
	li	a1,13
	bgtu	a5,a1,.L16
	mv	a4,a2
	slli	a5,a5,2
	lla	a2,.L4
	add	a5,a5,a2
	lw	a5,0(a5)
	add	a5,a5,a2
	jr	a5
	.section	.rodata.intarith,"a",@progbits
	.align	2
	.align	2
.L4:
	.word	.L15-.L4
	.word	.L14-.L4
	.word	.L13-.L4
	.word	.L12-.L4
	.word	.L16-.L4
	.word	.L16-.L4
	.word	.L11-.L4
	.word	.L10-.L4
	.word	.L9-.L4
	.word	.L8-.L4
	.word	.L7-.L4
	.word	.L6-.L4
	.word	.L5-.L4
	.word	.L3-.L4
	.section	.text.intarith
.L3:
	not	a0,a4
	ret
.L16:
	li	a0,0
	ret
.L15:
	add	a0,a4,a3
	ret
.L14:
	sub	a0,a4,a3
	ret
.L13:
	addi	sp,sp,-12
	mv	a1,a3
	mv	a0,a4
	sw	ra,8(sp)
	call	__mulsi3
	lw	ra,8(sp)
	addi	sp,sp,12
	jr	ra
.L12:
	mv	a2,a3
	mv	a1,a4
	tail	luaV_mod
.L11:
	mv	a2,a3
	mv	a1,a4
	tail	luaV_div
.L10:
	and	a0,a4,a3
	ret
.L9:
	or	a0,a4,a3
	ret
.L8:
	xor	a0,a4,a3
	ret
.L7:
	mv	a1,a3
	mv	a0,a4
	tail	luaV_shiftl
.L6:
	neg	a1,a3
	mv	a0,a4
	tail	luaV_shiftl
.L5:
	neg	a0,a4
	ret
	.size	intarith, .-intarith
	.section	.text.l_str2dloc,"ax",@progbits
	.align	2
	.type	l_str2dloc, @function
l_str2dloc:
	addi	sp,sp,-16
	sw	s1,4(sp)
	li	a2,10
	mv	s1,a1
	mv	a1,sp
	sw	s0,8(sp)
	sw	ra,12(sp)
	mv	s0,a0
	call	strtol
	lw	a2,0(sp)
	sw	a0,0(s1)
	beq	a2,s0,.L26
	lbu	a3,0(a2)
	lla	a1,luai_ctype_
	add	a5,a1,a3
	lbu	a5,1(a5)
	andi	a5,a5,8
	beq	a5,zero,.L24
	addi	a5,a2,1
.L25:
	sw	a5,0(sp)
	lbu	a3,0(a5)
	mv	a2,a5
	addi	a5,a5,1
	add	a4,a1,a3
	lbu	a4,1(a4)
	andi	a4,a4,8
	bne	a4,zero,.L25
.L24:
	bne	a3,zero,.L26
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	mv	a0,a2
	addi	sp,sp,16
	jr	ra
.L26:
	lw	ra,12(sp)
	lw	s0,8(sp)
	li	a2,0
	lw	s1,4(sp)
	mv	a0,a2
	addi	sp,sp,16
	jr	ra
	.size	l_str2dloc, .-l_str2dloc
	.globl	__divsi3
	.section	.text.numarith.constprop.0,"ax",@progbits
	.align	2
	.type	numarith.constprop.0, @function
numarith.constprop.0:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	li	a4,12
	mv	a5,a0
	bgtu	a0,a4,.L43
	lla	a4,.L35
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	mv	a0,a1
	mv	s1,a2
	add	a5,a5,a4
	jr	a5
	.section	.rodata.numarith.constprop.0,"a",@progbits
	.align	2
	.align	2
.L35:
	.word	.L42-.L35
	.word	.L41-.L35
	.word	.L40-.L35
	.word	.L39-.L35
	.word	.L38-.L35
	.word	.L37-.L35
	.word	.L36-.L35
	.word	.L43-.L35
	.word	.L43-.L35
	.word	.L43-.L35
	.word	.L43-.L35
	.word	.L43-.L35
	.word	.L34-.L35
	.section	.text.numarith.constprop.0
.L43:
	li	s0,0
.L32:
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L34:
	neg	s0,a1
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L42:
	add	s0,a1,a2
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L41:
	sub	s0,a1,a2
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L40:
	mv	a1,a2
	call	__mulsi3
	mv	s0,a0
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L39:
	mv	a1,a2
	call	fmod
	mv	s0,a0
	mv	a1,a0
	mv	a0,s1
	call	__mulsi3
	bge	a0,zero,.L32
	add	s0,s0,s1
	j	.L32
.L38:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	mv	a1,a2
	addi	sp,sp,12
	tail	pow
.L37:
	mv	a1,a2
	call	__divsi3
	mv	s0,a0
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L36:
	mv	a1,a2
	call	__divsi3
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	floor
	.size	numarith.constprop.0, .-numarith.constprop.0
	.section	.text.luaO_int2fb,"ax",@progbits
	.align	2
	.globl	luaO_int2fb
	.hidden	luaO_int2fb
	.type	luaO_int2fb, @function
luaO_int2fb:
	li	a5,7
	bleu	a0,a5,.L45
	li	a4,127
	li	a5,0
	li	a3,127
	bleu	a0,a4,.L56
.L47:
	addi	a0,a0,15
	srli	a0,a0,4
	mv	a4,a5
	addi	a5,a5,4
	bgtu	a0,a3,.L47
	addi	a4,a4,5
.L48:
	li	a3,15
	bleu	a0,a3,.L50
.L51:
	addi	a0,a0,1
	srli	a0,a0,1
	mv	a4,a5
	addi	a5,a5,1
	bgtu	a0,a3,.L51
	addi	a4,a4,2
.L50:
	slli	a4,a4,3
	addi	a0,a0,-8
	or	a0,a4,a0
.L45:
	ret
.L56:
	li	a4,1
	j	.L48
	.size	luaO_int2fb, .-luaO_int2fb
	.section	.text.luaO_fb2int,"ax",@progbits
	.align	2
	.globl	luaO_fb2int
	.hidden	luaO_fb2int
	.type	luaO_fb2int, @function
luaO_fb2int:
	li	a5,7
	ble	a0,a5,.L58
	andi	a5,a0,7
	srai	a0,a0,3
	addi	a5,a5,8
	addi	a0,a0,-1
	sll	a0,a5,a0
.L58:
	ret
	.size	luaO_fb2int, .-luaO_fb2int
	.section	.text.luaO_ceillog2,"ax",@progbits
	.align	2
	.globl	luaO_ceillog2
	.hidden	luaO_ceillog2
	.type	luaO_ceillog2, @function
luaO_ceillog2:
	addi	a5,a0,-1
	li	a4,255
	bleu	a5,a4,.L62
	li	a4,0
	li	a3,255
.L61:
	srli	a5,a5,8
	addi	a4,a4,8
	bgtu	a5,a3,.L61
	lla	a3,.LANCHOR0
	add	a5,a3,a5
	lbu	a0,0(a5)
	add	a0,a0,a4
	ret
.L62:
	lla	a3,.LANCHOR0
	add	a5,a3,a5
	lbu	a0,0(a5)
	li	a4,0
	add	a0,a0,a4
	ret
	.size	luaO_ceillog2, .-luaO_ceillog2
	.section	.text.luaO_arith,"ax",@progbits
	.align	2
	.globl	luaO_arith
	.hidden	luaO_arith
	.type	luaO_arith, @function
luaO_arith:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	s1,20(sp)
	mv	s0,a1
	sw	ra,28(sp)
	li	a1,11
	mv	a5,a2
	mv	t0,a0
	lw	a2,4(a2)
	mv	t1,a3
	mv	s1,a4
	bgt	s0,a1,.L65
	li	a4,6
	bgt	s0,a4,.L66
	addi	a4,s0,-4
	li	a3,1
	bgtu	a4,a3,.L67
	li	a4,3
	bne	a2,a4,.L76
	lw	a4,0(a5)
	sw	a4,12(sp)
.L77:
	lw	a3,4(t1)
	li	a4,3
	beq	a3,a4,.L108
	mv	a0,t1
	addi	a1,sp,16
	sw	a5,8(sp)
	sw	t0,4(sp)
	sw	t1,0(sp)
	call	luaV_tonumber_
	lw	t1,0(sp)
	lw	t0,4(sp)
	lw	a5,8(sp)
	beq	a0,zero,.L75
	lw	a2,16(sp)
.L80:
	lw	a1,12(sp)
	mv	a0,s0
	call	numarith.constprop.0
	lw	ra,28(sp)
	lw	s0,24(sp)
	li	a5,3
	sw	a0,0(s1)
	sw	a5,4(s1)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L65:
	li	a4,13
	bne	s0,a4,.L67
.L66:
	li	a4,19
	bne	a2,a4,.L69
	lw	a4,0(a5)
	sw	a4,12(sp)
.L70:
	lw	a3,4(t1)
	li	a4,19
	beq	a3,a4,.L109
	mv	a0,t1
	li	a2,0
	addi	a1,sp,16
	sw	a5,8(sp)
	sw	t0,4(sp)
	sw	t1,0(sp)
	call	luaV_tointeger
	lw	t1,0(sp)
	lw	t0,4(sp)
	lw	a5,8(sp)
	bne	a0,zero,.L110
.L75:
	addi	a4,s0,6
	lw	s0,24(sp)
	lw	ra,28(sp)
	mv	a3,s1
	lw	s1,20(sp)
	mv	a2,t1
	mv	a1,a5
	mv	a0,t0
	addi	sp,sp,32
	tail	luaT_trybinTM
.L67:
	li	a4,19
	beq	a2,a4,.L111
	li	a4,3
	bne	a2,a4,.L82
	lw	a4,0(a5)
	sw	a4,12(sp)
.L84:
	lw	a3,4(t1)
	li	a4,3
	beq	a3,a4,.L112
	mv	a0,t1
	addi	a1,sp,16
	sw	a5,8(sp)
	sw	t0,4(sp)
	sw	t1,0(sp)
	call	luaV_tonumber_
	lw	t1,0(sp)
	lw	t0,4(sp)
	lw	a5,8(sp)
	beq	a0,zero,.L75
	lw	a2,16(sp)
.L87:
	lw	a1,12(sp)
	mv	a0,s0
	call	numarith.constprop.0
	li	a4,3
	sw	a0,0(s1)
	sw	a4,4(s1)
.L114:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L76:
	sw	a0,4(sp)
	addi	a1,sp,12
	mv	a0,a5
	sw	t1,8(sp)
	sw	a5,0(sp)
	call	luaV_tonumber_
	lw	a5,0(sp)
	lw	t0,4(sp)
	lw	t1,8(sp)
	beq	a0,zero,.L75
	j	.L77
.L69:
	mv	a0,a5
	li	a2,0
	addi	a1,sp,12
	sw	t1,8(sp)
	sw	t0,4(sp)
	sw	a5,0(sp)
	call	luaV_tointeger
	lw	a5,0(sp)
	lw	t0,4(sp)
	lw	t1,8(sp)
	beq	a0,zero,.L75
	j	.L70
.L111:
	lw	a4,4(t1)
	beq	a4,a2,.L113
.L82:
	mv	a0,a5
	addi	a1,sp,12
	sw	t1,8(sp)
	sw	t0,4(sp)
	sw	a5,0(sp)
	call	luaV_tonumber_
	lw	a5,0(sp)
	lw	t0,4(sp)
	lw	t1,8(sp)
	beq	a0,zero,.L75
	j	.L84
.L108:
	lw	a2,0(t1)
	sw	a2,16(sp)
	j	.L80
.L109:
	lw	a3,0(t1)
	sw	a3,16(sp)
.L73:
	lw	a2,12(sp)
	mv	a1,s0
	mv	a0,t0
	call	intarith
	lw	ra,28(sp)
	lw	s0,24(sp)
	li	a5,19
	sw	a0,0(s1)
	sw	a5,4(s1)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L112:
	lw	a2,0(t1)
	sw	a2,16(sp)
	j	.L87
.L110:
	lw	a3,16(sp)
	j	.L73
.L113:
	lw	a3,0(t1)
	lw	a2,0(a5)
	mv	a1,s0
	mv	a0,t0
	sw	a4,0(sp)
	call	intarith
	lw	a4,0(sp)
	sw	a0,0(s1)
	sw	a4,4(s1)
	j	.L114
	.size	luaO_arith, .-luaO_arith
	.section	.text.luaO_hexavalue,"ax",@progbits
	.align	2
	.globl	luaO_hexavalue
	.hidden	luaO_hexavalue
	.type	luaO_hexavalue, @function
luaO_hexavalue:
	lla	a5,luai_ctype_
	add	a5,a5,a0
	lbu	a5,1(a5)
	andi	a5,a5,2
	beq	a5,zero,.L116
	addi	a0,a0,-48
	ret
.L116:
	ori	a0,a0,32
	addi	a0,a0,-87
	ret
	.size	luaO_hexavalue, .-luaO_hexavalue
	.section	.rodata.luaO_str2num.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	".xXnN"
	.section	.text.luaO_str2num,"ax",@progbits
	.align	2
	.globl	luaO_str2num
	.hidden	luaO_str2num
	.type	luaO_str2num, @function
luaO_str2num:
	addi	sp,sp,-232
	sw	ra,228(sp)
	sw	s0,224(sp)
	sw	s1,220(sp)
	lbu	a3,0(a0)
	mv	a4,a0
	sw	a0,4(sp)
	lla	a0,luai_ctype_
	add	a5,a0,a3
	lbu	a5,1(a5)
	sw	a1,0(sp)
	andi	a5,a5,8
	beq	a5,zero,.L149
.L120:
	lbu	a3,1(a4)
	addi	a4,a4,1
	add	a5,a0,a3
	lbu	a5,1(a5)
	andi	a5,a5,8
	bne	a5,zero,.L120
.L119:
	li	a5,45
	beq	a3,a5,.L168
	addi	a3,a3,-43
	seqz	a3,a3
	li	t2,0
	add	a4,a4,a3
.L122:
	lbu	a1,0(a4)
	li	a5,48
	beq	a1,a5,.L169
.L123:
	add	a5,a0,a1
	lbu	a2,1(a5)
	li	s1,214749184
	addi	s0,s1,-821
	andi	a3,a2,2
	addi	a1,a1,-48
	li	a5,0
	addi	s1,s1,-820
	beq	a3,zero,.L126
.L146:
	lbu	a3,1(a4)
	slli	a2,a5,2
	add	a5,a2,a5
	add	a2,a0,a3
	lbu	a2,1(a2)
	slli	a5,a5,1
	addi	t0,t2,7
	andi	t1,a2,2
	add	a5,a1,a5
	addi	a4,a4,1
	beq	t1,zero,.L130
	addi	a1,a3,-48
	bleu	a5,s0,.L146
	bne	a5,s1,.L132
	ble	a1,t0,.L146
.L132:
	lw	a0,4(sp)
	lla	a1,.LC0
	call	strpbrk
	beq	a0,zero,.L152
	lbu	s1,0(a0)
	li	a5,110
	ori	s1,s1,32
	beq	s1,a5,.L153
.L139:
	lw	s0,4(sp)
	mv	a2,s1
	addi	a1,sp,12
	mv	a0,s0
	call	l_str2dloc
	sub	a4,a0,s0
	beq	a0,zero,.L170
.L144:
	lw	a3,12(sp)
	lw	a2,0(sp)
	li	a5,3
	sw	a3,0(a2)
	j	.L145
.L130:
	andi	a2,a2,8
	li	a1,0
	beq	a2,zero,.L148
.L136:
	lbu	a3,1(a4)
	addi	a4,a4,1
	add	a2,a0,a3
	lbu	a2,1(a2)
	andi	a2,a2,8
	bne	a2,zero,.L136
	bne	a1,zero,.L132
.L148:
	bne	a3,zero,.L132
	bne	t2,zero,.L171
.L138:
	lw	a3,0(sp)
	sw	a5,0(a3)
	lw	a5,4(sp)
	sub	a4,a4,a5
	li	a5,19
.L145:
	lw	a3,0(sp)
	addi	a0,a4,1
	sw	a5,4(a3)
.L118:
	lw	ra,228(sp)
	lw	s0,224(sp)
	lw	s1,220(sp)
	addi	sp,sp,232
	jr	ra
.L169:
	lbu	a5,1(a4)
	li	a3,88
	andi	a5,a5,223
	bne	a5,a3,.L123
	lbu	a3,2(a4)
	addi	a4,a4,2
	add	a5,a0,a3
	lbu	a2,1(a5)
	andi	a5,a2,16
	beq	a5,zero,.L126
	li	a5,0
	j	.L129
.L172:
	addi	a2,a3,-48
.L128:
	lbu	a3,1(a4)
	add	a5,a2,a5
	addi	a4,a4,1
	add	a2,a0,a3
	lbu	a2,1(a2)
	andi	a1,a2,16
	beq	a1,zero,.L130
.L129:
	andi	a2,a2,2
	ori	a1,a3,32
	slli	a5,a5,4
	bne	a2,zero,.L172
	addi	a2,a1,-87
	j	.L128
.L168:
	addi	a4,a4,1
	li	t2,1
	j	.L122
.L171:
	neg	a5,a5
	j	.L138
.L149:
	lw	a4,4(sp)
	j	.L119
.L126:
	andi	a2,a2,8
	li	a5,0
	li	a1,1
	bne	a2,zero,.L136
	j	.L132
.L170:
	lw	s0,4(sp)
	li	a1,46
	mv	a0,s0
	call	strchr
	mv	a5,a0
	mv	a0,s0
	sw	a5,8(sp)
	mv	s0,a5
	call	strlen
	li	a5,200
	bgtu	a0,a5,.L153
	beq	s0,zero,.L153
	lw	a1,4(sp)
	addi	s0,sp,16
	mv	a0,s0
	call	strcpy
	lw	a4,8(sp)
	lw	a5,4(sp)
	mv	a2,s1
	mv	a0,s0
	sub	a5,a4,a5
	addi	a5,a5,208
	addi	a4,sp,12
	add	a5,a5,a4
	mv	a1,a4
	li	a4,46
	sb	a4,-204(a5)
	call	l_str2dloc
	beq	a0,zero,.L153
	sub	a4,a0,s0
	j	.L144
.L153:
	li	a0,0
	j	.L118
.L152:
	li	s1,0
	j	.L139
	.size	luaO_str2num, .-luaO_str2num
	.section	.text.luaO_utf8esc,"ax",@progbits
	.align	2
	.globl	luaO_utf8esc
	.hidden	luaO_utf8esc
	.type	luaO_utf8esc, @function
luaO_utf8esc:
	li	a5,127
	mv	a2,a0
	bgtu	a1,a5,.L174
	sb	a1,7(a0)
	li	a0,1
	ret
.L174:
	addi	a5,a0,7
	li	a3,63
	addi	t1,a0,9
.L176:
	andi	a4,a1,63
	ori	a4,a4,-128
	sb	a4,0(a5)
	srli	a1,a1,6
	srli	a3,a3,1
	sub	a0,t1,a5
	addi	a5,a5,-1
	bgtu	a1,a3,.L176
	not	a3,a3
	slli	a3,a3,1
	sub	a2,a2,a0
	or	a3,a3,a1
	sb	a3,8(a2)
	ret
	.size	luaO_utf8esc, .-luaO_utf8esc
	.section	.rodata.luaO_tostring.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"%ld"
	.section	.text.luaO_tostring,"ax",@progbits
	.align	2
	.globl	luaO_tostring
	.hidden	luaO_tostring
	.type	luaO_tostring, @function
luaO_tostring:
	lw	a3,0(a1)
	addi	sp,sp,-64
	sw	s0,56(sp)
	sw	s1,52(sp)
	mv	s0,a1
	mv	s1,a0
	lla	a2,.LC1
	li	a1,50
	mv	a0,sp
	sw	ra,60(sp)
	call	snprintf
	mv	a2,a0
	mv	a1,sp
	mv	a0,s1
	call	luaS_newlstr
	sw	a0,0(s0)
	lbu	a5,4(a0)
	lw	ra,60(sp)
	lw	s1,52(sp)
	ori	a5,a5,64
	sw	a5,4(s0)
	lw	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	luaO_tostring, .-luaO_tostring
	.section	.text.luaO_pushfstring,"ax",@progbits
	.align	2
	.globl	luaO_pushfstring
	.hidden	luaO_pushfstring
	.type	luaO_pushfstring, @function
luaO_pushfstring:
	addi	sp,sp,-32
	addi	t1,sp,16
	sw	a2,16(sp)
	mv	a2,t1
	sw	ra,12(sp)
	sw	a3,20(sp)
	sw	a4,24(sp)
	sw	a5,28(sp)
	sw	t1,0(sp)
	call	luaO_pushvfstring
	lw	ra,12(sp)
	addi	sp,sp,32
	jr	ra
	.size	luaO_pushfstring, .-luaO_pushfstring
	.section	.rodata.luaO_pushvfstring.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"(null)"
	.align	2
.LC3:
	.string	"<\\%d>"
	.align	2
.LC4:
	.string	"%p"
	.align	2
.LC5:
	.string	"%"
	.align	2
.LC6:
	.string	"invalid option '%%%c' to 'lua_pushfstring'"
	.section	.text.luaO_pushvfstring,"ax",@progbits
	.align	2
	.globl	luaO_pushvfstring
	.hidden	luaO_pushvfstring
	.type	luaO_pushvfstring, @function
luaO_pushvfstring:
	addi	sp,sp,-52
	mv	a5,a1
	sw	s0,44(sp)
	li	a1,37
	mv	s0,a0
	mv	a0,a5
	sw	s1,40(sp)
	sw	a5,4(sp)
	sw	ra,48(sp)
	mv	s1,a2
	sw	zero,0(sp)
	call	strchr
	lw	a5,4(sp)
	beq	a0,zero,.L183
.L212:
	lw	a3,12(s0)
	sub	a2,a0,a5
	mv	a1,a5
	sw	a0,4(sp)
	mv	a0,s0
	sw	a3,8(sp)
	call	luaS_newlstr
	lw	a3,8(sp)
	sw	a0,0(a3)
	lbu	a5,4(a0)
	mv	a0,s0
	ori	a5,a5,64
	sw	a5,4(a3)
	call	luaD_inctop
	lw	a4,4(sp)
	li	a5,37
	lbu	a2,1(a4)
	beq	a2,a5,.L184
	addi	a5,a2,-73
	andi	a5,a5,0xff
	li	a3,42
	bgtu	a5,a3,.L185
	lla	a3,.L187
	slli	a5,a5,2
	add	a5,a5,a3
	lw	a5,0(a5)
	add	a5,a5,a3
	jr	a5
	.section	.rodata.luaO_pushvfstring,"a",@progbits
	.align	2
	.align	2
.L187:
	.word	.L193-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L192-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L191-.L187
	.word	.L193-.L187
	.word	.L185-.L187
	.word	.L189-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L188-.L187
	.word	.L185-.L187
	.word	.L185-.L187
	.word	.L186-.L187
	.section	.text.luaO_pushvfstring
.L193:
	lw	a3,0(s1)
	lw	a5,12(s0)
	addi	s1,s1,4
	sw	a3,0(a5)
	li	a3,19
	sw	a3,4(a5)
.L198:
	mv	a0,s0
	sw	a4,4(sp)
	call	luaD_inctop
	lw	a1,12(s0)
	mv	a0,s0
	addi	a1,a1,-8
	call	luaO_tostring
	lw	a4,4(sp)
.L195:
	lw	a5,0(sp)
	li	a1,37
	addi	a5,a5,2
	sw	a5,0(sp)
	addi	a5,a4,2
	mv	a0,a5
	sw	a5,4(sp)
	call	strchr
	lw	a5,4(sp)
	bne	a0,zero,.L212
.L183:
	lw	a4,28(s0)
	lw	s1,12(s0)
	li	a3,8
	sub	a4,a4,s1
	ble	a4,a3,.L213
.L203:
	mv	a0,a5
	sw	a5,4(sp)
	call	strlen
	lw	a5,4(sp)
	mv	a2,a0
	mv	a0,s0
	mv	a1,a5
	call	luaS_newlstr
	sw	a0,0(s1)
	lbu	a5,4(a0)
	mv	a0,s0
	ori	a5,a5,64
	sw	a5,4(s1)
	call	luaD_inctop
	lw	a5,0(sp)
	bne	a5,zero,.L214
	lw	a5,12(s0)
	lw	ra,48(sp)
	lw	s0,44(sp)
	lw	a0,-8(a5)
	lw	s1,40(sp)
	addi	a0,a0,16
	addi	sp,sp,52
	jr	ra
.L188:
	lw	a3,0(s1)
	lla	a2,.LC4
	li	a1,24
	addi	a0,sp,16
	sw	a4,8(sp)
	call	snprintf
	lw	a3,12(s0)
	mv	a2,a0
	addi	a1,sp,16
	mv	a0,s0
	sw	a3,4(sp)
	call	luaS_newlstr
	lw	a3,4(sp)
	addi	s1,s1,4
	sw	a0,0(a3)
	lbu	a5,4(a0)
.L210:
	ori	a5,a5,64
	mv	a0,s0
	sw	a5,4(a3)
	call	luaD_inctop
	lw	a4,8(sp)
	j	.L195
.L189:
	lw	a3,0(s1)
	lw	a5,12(s0)
	addi	s1,s1,4
	sw	a3,0(a5)
	li	a3,3
	sw	a3,4(a5)
	j	.L198
.L186:
	lw	a1,0(s1)
	addi	s1,s1,4
	beq	a1,zero,.L215
.L194:
	mv	a0,a1
	sw	a4,12(sp)
	sw	a1,8(sp)
	call	strlen
	lw	a3,12(s0)
	lw	a1,8(sp)
	mv	a2,a0
	mv	a0,s0
	sw	a3,4(sp)
	call	luaS_newlstr
	lw	a3,4(sp)
	sw	a0,0(a3)
	lbu	a5,4(a0)
	mv	a0,s0
	ori	a5,a5,64
	sw	a5,4(a3)
	call	luaD_inctop
	lw	a4,12(sp)
	j	.L195
.L191:
	lw	a3,0(s1)
	lla	a5,luai_ctype_
	addi	s1,s1,4
	andi	a2,a3,255
	add	a5,a5,a2
	lbu	a5,1(a5)
	sb	a3,16(sp)
	andi	a5,a5,4
	beq	a5,zero,.L196
	lw	a3,12(s0)
	sw	a4,8(sp)
	li	a2,1
	sw	a3,4(sp)
	addi	a1,sp,16
.L211:
	mv	a0,s0
	call	luaS_newlstr
	lw	a3,4(sp)
	sw	a0,0(a3)
	lbu	a5,4(a0)
	j	.L210
.L192:
	lw	a3,0(s1)
	li	a5,127
	addi	s1,s1,4
	bgtu	a3,a5,.L199
	sb	a3,23(sp)
	li	a1,7
	li	a2,1
.L200:
	lw	a5,12(s0)
	mv	a0,s0
	sw	a4,8(sp)
	sw	a5,4(sp)
	addi	a5,a1,16
	add	a1,a5,sp
	call	luaS_newlstr
	lw	a5,4(sp)
	sw	a0,0(a5)
	lbu	a3,4(a0)
	mv	a0,s0
	ori	a3,a3,64
	sw	a3,4(a5)
	call	luaD_inctop
	lw	a4,8(sp)
	j	.L195
.L184:
	lw	a3,12(s0)
	sw	a4,8(sp)
	li	a2,1
	sw	a3,4(sp)
	lla	a1,.LC5
	j	.L211
.L196:
	lla	a1,.LC3
	mv	a0,s0
	sw	a4,4(sp)
	call	luaO_pushfstring
	lw	a4,4(sp)
	j	.L195
.L199:
	addi	a5,sp,23
	li	a1,63
	addi	a0,sp,25
.L201:
	andi	a2,a3,63
	ori	a2,a2,-128
	sb	a2,0(a5)
	srli	a3,a3,6
	srli	a1,a1,1
	sub	a2,a0,a5
	mv	t1,a5
	addi	a5,a5,-1
	bgtu	a3,a1,.L201
	not	a5,a1
	slli	a5,a5,1
	or	a5,a5,a3
	addi	a3,sp,40
	sub	a1,t1,a0
	sub	a3,a3,a2
	sb	a5,-16(a3)
	addi	a1,a1,8
	j	.L200
.L215:
	lla	a1,.LC2
	j	.L194
.L214:
	mv	a0,s0
	addi	a1,a5,1
	call	luaV_concat
	lw	a5,12(s0)
	lw	ra,48(sp)
	lw	s0,44(sp)
	lw	a0,-8(a5)
	lw	s1,40(sp)
	addi	a0,a0,16
	addi	sp,sp,52
	jr	ra
.L213:
	li	a1,1
	mv	a0,s0
	sw	a5,4(sp)
	call	luaD_growstack
	lw	a5,4(sp)
	lw	s1,12(s0)
	j	.L203
.L185:
	lla	a1,.LC6
	mv	a0,s0
	call	luaG_runerror
	.size	luaO_pushvfstring, .-luaO_pushvfstring
	.section	.rodata.luaO_chunkid.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"..."
	.align	2
.LC8:
	.string	"[string \""
	.align	2
.LC9:
	.string	"\"]"
	.section	.text.luaO_chunkid,"ax",@progbits
	.align	2
	.globl	luaO_chunkid
	.hidden	luaO_chunkid
	.type	luaO_chunkid, @function
luaO_chunkid:
	addi	sp,sp,-24
	sw	s0,16(sp)
	mv	s0,a0
	mv	a0,a1
	sw	s1,12(sp)
	sw	a1,0(sp)
	sw	ra,20(sp)
	mv	s1,a2
	call	strlen
	lw	a5,0(sp)
	li	a1,61
	lbu	a3,0(a5)
	beq	a3,a1,.L233
	li	a2,64
	bne	a3,a2,.L220
	bgtu	a0,s1,.L221
	mv	a2,a0
	mv	a0,s0
	lw	s0,16(sp)
	lw	ra,20(sp)
	lw	s1,12(sp)
	addi	a1,a5,1
	addi	sp,sp,24
	tail	memcpy
.L220:
	sw	a0,8(sp)
	li	a1,10
	mv	a0,a5
	sw	a5,4(sp)
	call	strchr
	mv	t1,a0
	li	a2,9
	mv	a0,s0
	lla	a1,.LC8
	sw	t1,0(sp)
	call	memcpy
	lw	a4,8(sp)
	addi	a3,s1,-15
	lw	t1,0(sp)
	lw	a5,4(sp)
	addi	s0,s0,9
	bltu	a4,a3,.L234
	bne	t1,zero,.L223
.L225:
	mv	s1,a4
	bleu	a4,a3,.L226
	mv	s1,a3
.L226:
	mv	a1,a5
	mv	a2,s1
	mv	a0,s0
	call	memcpy
	add	s0,s0,s1
	li	a2,3
	lla	a1,.LC7
	mv	a0,s0
	call	memcpy
	addi	a0,s0,3
.L224:
	lw	s0,16(sp)
	lw	ra,20(sp)
	lw	s1,12(sp)
	li	a2,3
	lla	a1,.LC9
	addi	sp,sp,24
	tail	memcpy
.L233:
	addi	a1,a5,1
	bgtu	a0,s1,.L218
	mv	a2,a0
	mv	a0,s0
	lw	s0,16(sp)
	lw	ra,20(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	tail	memcpy
.L218:
	addi	s1,s1,-1
	mv	a2,s1
	mv	a0,s0
	add	s1,s0,s1
	call	memcpy
	sb	zero,0(s1)
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L221:
	sw	a0,0(sp)
	li	a2,3
	lla	a1,.LC7
	mv	a0,s0
	sw	a5,4(sp)
	call	memcpy
	lw	a4,0(sp)
	lw	a5,4(sp)
	addi	a2,s1,-3
	addi	a0,s0,3
	lw	s0,16(sp)
	lw	ra,20(sp)
	lw	s1,12(sp)
	sub	a4,a4,a2
	addi	a1,a4,1
	add	a1,a5,a1
	addi	sp,sp,24
	tail	memcpy
.L234:
	beq	t1,zero,.L235
.L223:
	sub	a4,t1,a5
	j	.L225
.L235:
	mv	a2,a4
	mv	a1,a5
	mv	a0,s0
	sw	a4,0(sp)
	call	memcpy
	lw	a4,0(sp)
	add	a0,s0,a4
	j	.L224
	.size	luaO_chunkid, .-luaO_chunkid
	.hidden	luaO_nilobject_
	.globl	luaO_nilobject_
	.section	.rodata.log_2.0,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	log_2.0, @object
	.size	log_2.0, 256
log_2.0:
	.string	""
	.ascii	"\001\002\002\003\003\003\003\004\004\004\004\004\004\004\004"
	.ascii	"\005\005\005\005\005\005\005\005\005\005\005\005\005\005\005"
	.ascii	"\005\006\006\006\006\006\006\006\006\006\006\006\006\006\006"
	.ascii	"\006\006\006\006\006\006\006\006\006\006\006\006\006\006\006"
	.ascii	"\006\006\006\007\007\007\007\007\007\007\007\007\007\007\007"
	.ascii	"\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007"
	.ascii	"\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007"
	.ascii	"\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007"
	.ascii	"\007\007\007\007\007\007\007\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
	.ascii	"\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
	.ascii	"\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
	.ascii	"\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
	.ascii	"\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
	.section	.srodata.luaO_nilobject_,"a"
	.align	2
	.type	luaO_nilobject_, @object
	.size	luaO_nilobject_, 8
luaO_nilobject_:
	.zero	8
	.hidden	luaG_runerror
	.hidden	luaD_growstack
	.hidden	luaV_concat
	.hidden	luaD_inctop
	.hidden	luaS_newlstr
	.hidden	luaT_trybinTM
	.hidden	luaV_tointeger
	.hidden	luaV_tonumber_
	.hidden	luai_ctype_
	.hidden	luaV_shiftl
	.hidden	luaV_div
	.hidden	luaV_mod
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
