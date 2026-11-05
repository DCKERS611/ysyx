#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lcode.c"
	.option nopic
	.text
	.section	.rodata.addk.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"constants"
	.section	.text.addk,"ax",@progbits
	.align	2
	.type	addk, @function
addk:
	lw	a5,8(a0)
	addi	sp,sp,-28
	sw	s0,20(sp)
	lw	a3,32(a5)
	mv	s0,a0
	mv	a4,a1
	lw	t0,0(s0)
	lw	a1,44(a5)
	sw	s1,16(sp)
	mv	a0,a3
	mv	s1,a2
	mv	a2,a4
	sw	a3,4(sp)
	sw	t0,0(sp)
	sw	ra,24(sp)
	call	luaH_set
	lw	a3,4(a0)
	li	a4,19
	lw	t0,0(sp)
	mv	a5,a0
	beq	a3,a4,.L2
	lw	a1,44(t0)
	lw	t1,28(s0)
.L3:
	lw	t2,16(t0)
	li	a4,19
	sw	t1,0(a5)
	sw	a4,4(a5)
	mv	a5,t1
	ble	t2,t1,.L23
.L5:
	lw	a4,0(s1)
	slli	a3,t1,3
	add	a1,a1,a3
	sw	a4,0(a1)
	lw	a4,4(s1)
	addi	a5,a5,1
	sw	a4,4(a1)
	lw	a4,4(s1)
	sw	a5,28(s0)
	andi	a5,a4,64
	beq	a5,zero,.L1
	lbu	a5,5(t0)
	andi	a5,a5,4
	beq	a5,zero,.L1
	lw	a2,0(s1)
	lbu	a5,5(a2)
	andi	a5,a5,3
	bne	a5,zero,.L24
.L1:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	mv	a0,t1
	addi	sp,sp,28
	jr	ra
.L23:
	lw	a0,4(sp)
	li	a4,67108864
	addi	a4,a4,-1
	addi	a2,t0,16
	lla	a5,.LC0
	li	a3,8
	sw	t1,12(sp)
	sw	t2,8(sp)
	sw	t0,0(sp)
	call	luaM_growaux_
	lw	t0,0(sp)
	lw	t2,8(sp)
	lw	t1,12(sp)
	lw	a4,16(t0)
	sw	a0,44(t0)
	mv	a1,a0
	bge	t2,a4,.L21
	slli	a5,t2,3
	slli	a4,a4,3
	add	a5,a0,a5
	add	a4,a0,a4
.L7:
	sw	zero,4(a5)
	addi	a5,a5,8
	bne	a4,a5,.L7
.L21:
	lw	a5,28(s0)
	j	.L5
.L2:
	lw	a4,0(a0)
	lw	t1,28(s0)
	lw	a1,44(t0)
	ble	t1,a4,.L3
	slli	a0,a4,3
	add	a0,a1,a0
	lw	a3,4(a0)
	lw	a2,4(s1)
	xor	a3,a3,a2
	andi	a3,a3,63
	bne	a3,zero,.L3
	mv	a1,a0
	mv	a2,s1
	li	a0,0
	sw	a4,0(sp)
	sw	a5,12(sp)
	sw	t0,8(sp)
	call	luaV_equalobj
	lw	a4,0(sp)
	mv	t1,a4
	bne	a0,zero,.L1
	lw	t0,8(sp)
	lw	t1,28(s0)
	lw	a5,12(sp)
	lw	a1,44(t0)
	j	.L3
.L24:
	lw	a0,4(sp)
	mv	a1,t0
	sw	t1,0(sp)
	call	luaC_barrier_
	lw	t1,0(sp)
	j	.L1
	.size	addk, .-addk
	.section	.rodata.fixjump.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"control structure too long"
	.section	.text.fixjump,"ax",@progbits
	.align	2
	.type	fixjump, @function
fixjump:
	lw	a4,0(a0)
	addi	sp,sp,-16
	sw	s1,4(sp)
	lw	s1,48(a4)
	addi	a4,a1,1
	sw	s0,8(sp)
	sub	s0,a2,a4
	sw	a0,0(sp)
	slli	a1,a1,2
	mv	a0,s0
	sw	ra,12(sp)
	add	s1,s1,a1
	call	abs
	li	a4,131072
	lw	a5,0(sp)
	bge	a0,a4,.L28
	lw	a5,0(s1)
	addi	a4,a4,-1
	add	s0,s0,a4
	slli	a5,a5,18
	slli	s0,s0,14
	srli	a5,a5,18
	lw	ra,12(sp)
	or	a5,a5,s0
	lw	s0,8(sp)
	sw	a5,0(s1)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L28:
	lw	a0,8(a5)
	lla	a1,.LC1
	call	luaX_syntaxerror
	.size	fixjump, .-fixjump
	.section	.text.freeexps,"ax",@progbits
	.align	2
	.type	freeexps, @function
freeexps:
	lw	a3,0(a1)
	li	a5,7
	lw	a4,0(a2)
	beq	a3,a5,.L30
	beq	a4,a5,.L47
.L29:
	ret
.L47:
	lw	a4,4(a2)
	li	a5,-1
	blt	a4,a5,.L48
	andi	a5,a4,256
	bne	a5,zero,.L49
	lbu	a3,42(a0)
	li	a1,256
	li	a5,-1
	blt	a4,a3,.L29
.L42:
	lbu	a4,44(a0)
	addi	a4,a4,-1
	sb	a4,44(a0)
.L38:
	bne	a1,zero,.L29
	lbu	a4,42(a0)
	bgt	a4,a5,.L29
	lbu	a5,44(a0)
	addi	a5,a5,-1
	sb	a5,44(a0)
	ret
.L30:
	lw	a5,4(a1)
	andi	a1,a5,256
	beq	a4,a3,.L50
	blt	a5,zero,.L38
	beq	a1,zero,.L39
	ret
.L48:
	ret
.L50:
	lw	a4,4(a2)
	andi	a3,a4,256
	bgt	a5,a4,.L51
	bne	a3,zero,.L38
	lbu	a3,42(a0)
	blt	a4,a3,.L38
	j	.L42
.L51:
	bne	a1,zero,.L35
	lbu	a2,42(a0)
	blt	a5,a2,.L35
.L41:
	lbu	a5,44(a0)
	addi	a5,a5,-1
	sb	a5,44(a0)
.L35:
	bne	a3,zero,.L29
	lbu	a5,42(a0)
	bgt	a5,a4,.L29
	lbu	a5,44(a0)
	addi	a5,a5,-1
	sb	a5,44(a0)
	ret
.L39:
	lbu	a4,42(a0)
	blt	a5,a4,.L29
	li	a4,-1
	li	a3,256
	j	.L41
.L49:
	ret
	.size	freeexps, .-freeexps
	.section	.text.need_value,"ax",@progbits
	.align	2
	.type	need_value, @function
need_value:
	li	a5,-1
	beq	a1,a5,.L60
	lw	a5,0(a0)
	li	a2,-131072
	lla	t0,luaP_opmodes
	lw	t1,48(a5)
	li	a0,35
	addi	a2,a2,1
	li	a4,-1
	j	.L55
.L62:
	lw	a5,0(a5)
	srli	a5,a5,14
	add	a5,a5,a2
	add	a1,a3,a5
	beq	a5,a4,.L60
	beq	a1,a4,.L60
.L55:
	slli	a5,a1,2
	add	a5,t1,a5
	addi	a3,a1,1
	mv	t2,a5
	ble	a1,zero,.L54
	lw	a1,-4(a5)
	andi	a1,a1,63
	add	a1,t0,a1
	lb	a1,0(a1)
	bge	a1,zero,.L54
	addi	t2,a5,-4
.L54:
	lw	a1,0(t2)
	andi	a1,a1,63
	beq	a1,a0,.L62
	li	a0,1
	ret
.L60:
	li	a0,0
	ret
	.size	need_value, .-need_value
	.section	.text.removevalues,"ax",@progbits
	.align	2
	.type	removevalues, @function
removevalues:
	li	a5,-1
	beq	a1,a5,.L74
	lw	a5,0(a0)
	addi	sp,sp,-8
	sw	s1,0(sp)
	lw	s1,48(a5)
	li	t0,-131072
	sw	s0,4(sp)
	li	t2,8372224
	li	s0,35
	addi	t0,t0,1
	li	t1,-1
.L67:
	slli	a4,a1,2
	add	a4,s1,a4
	mv	a2,a4
	ble	a1,zero,.L65
	lw	a5,-4(a4)
	lla	a3,luaP_opmodes
	andi	a5,a5,63
	add	a5,a3,a5
	lb	a5,0(a5)
	bge	a5,zero,.L65
	addi	a2,a4,-4
.L65:
	lw	a3,0(a2)
	srli	a5,a3,23
	and	a0,a3,t2
	slli	a5,a5,6
	or	a5,a5,a0
	andi	a3,a3,63
	ori	a5,a5,34
	bne	a3,s0,.L66
	sw	a5,0(a2)
.L66:
	lw	a5,0(a4)
	addi	a1,a1,1
	srli	a5,a5,14
	add	a5,a5,t0
	add	a1,a1,a5
	beq	a5,t1,.L63
	bne	a1,t1,.L67
.L63:
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,8
	jr	ra
.L74:
	ret
	.size	removevalues, .-removevalues
	.section	.text.patchlistaux,"ax",@progbits
	.align	2
	.type	patchlistaux, @function
patchlistaux:
	addi	sp,sp,-36
	sw	ra,32(sp)
	sw	s0,28(sp)
	sw	s1,24(sp)
	li	a5,-1
	sw	a2,8(sp)
	sw	a3,12(sp)
	sw	a4,16(sp)
	beq	a1,a5,.L77
	lw	a5,0(a0)
	slli	a4,a3,6
	li	s0,-131072
	lw	a5,48(a5)
	mv	s1,a0
	sw	a5,0(sp)
	li	a5,16384
	addi	a5,a5,-64
	and	a5,a4,a5
	sw	a5,20(sp)
	addi	a5,s0,1
	sw	a5,4(sp)
.L85:
	lw	a5,0(sp)
	slli	a4,a1,2
	lw	a0,4(sp)
	add	a4,a5,a4
	lw	a3,0(a4)
	li	a2,-1
	srli	a5,a3,14
	add	s0,a5,a0
	beq	s0,a2,.L79
	addi	a2,a1,1
	add	s0,s0,a2
.L79:
	ble	a1,zero,.L80
	lw	t1,-4(a4)
	lla	a2,luaP_opmodes
	andi	t0,t1,63
	add	a2,a2,t0
	lb	a2,0(a2)
	bge	a2,zero,.L80
	addi	a4,a4,-4
	mv	a3,t1
.L80:
	andi	a2,a3,63
	li	t1,35
	beq	a2,t1,.L81
	lw	a2,16(sp)
	mv	a0,s1
	call	fixjump
	li	a4,-1
	beq	s0,a4,.L77
.L87:
	mv	a1,s0
	j	.L85
.L81:
	lw	a5,12(sp)
	li	t1,255
	srli	a2,a3,23
	beq	a5,t1,.L83
	beq	a5,a2,.L83
	lw	a5,20(sp)
	li	a2,-16384
	addi	a2,a2,63
	and	a2,a3,a2
	or	a2,a2,a5
.L84:
	sw	a2,0(a4)
	lw	a2,8(sp)
	mv	a0,s1
	call	fixjump
	li	a4,-1
	bne	s0,a4,.L87
.L77:
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
.L83:
	li	t1,8372224
	slli	a2,a2,6
	and	a3,a3,t1
	or	a2,a2,a3
	ori	a2,a2,34
	j	.L84
	.size	patchlistaux, .-patchlistaux
	.section	.rodata.luaK_code.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"opcodes"
	.section	.text.luaK_code,"ax",@progbits
	.align	2
	.type	luaK_code, @function
luaK_code:
	addi	sp,sp,-16
	lw	a4,16(a0)
	lw	t1,0(a0)
	sw	s1,4(sp)
	mv	s1,a1
	lw	a1,24(a0)
	li	a3,255
	mv	a2,a4
	sw	s0,8(sp)
	sw	t1,0(sp)
	mv	s0,a0
	sw	ra,12(sp)
	call	patchlistaux
	lw	t1,0(sp)
	lw	a5,16(s0)
	li	a3,-1
	lw	a4,20(t1)
	sw	a3,24(s0)
	bge	a5,a4,.L90
	lw	a0,48(t1)
	slli	a5,a5,2
	lw	a1,56(t1)
	add	a0,a0,a5
	sw	s1,0(a0)
	lw	a5,16(s0)
	lw	a4,24(t1)
	bge	a5,a4,.L94
.L92:
	lw	a4,8(s0)
	slli	a5,a5,2
	add	a1,a1,a5
	lw	a5,8(a4)
	lw	ra,12(sp)
	lw	s1,4(sp)
	sw	a5,0(a1)
	lw	a0,16(s0)
	addi	a5,a0,1
	sw	a5,16(s0)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L90:
	lw	a5,8(s0)
	lw	a1,48(t1)
	li	a4,-2147483648
	lw	a0,32(a5)
	xori	a4,a4,-1
	lla	a5,.LC2
	addi	a2,t1,20
	li	a3,4
	sw	t1,0(sp)
	call	luaM_growaux_
	lw	a5,16(s0)
	lw	t1,0(sp)
	slli	a5,a5,2
	sw	a0,48(t1)
	add	a0,a0,a5
	sw	s1,0(a0)
	lw	a5,16(s0)
	lw	a4,24(t1)
	lw	a1,56(t1)
	blt	a5,a4,.L92
.L94:
	lw	a5,8(s0)
	li	a4,-2147483648
	addi	a2,t1,24
	lw	a0,32(a5)
	xori	a4,a4,-1
	lla	a5,.LC2
	li	a3,4
	sw	t1,0(sp)
	call	luaM_growaux_
	lw	t1,0(sp)
	lw	a5,16(s0)
	mv	a1,a0
	sw	a0,56(t1)
	j	.L92
	.size	luaK_code, .-luaK_code
	.section	.text.constfolding,"ax",@progbits
	.align	2
	.type	constfolding, @function
constfolding:
	lw	a4,8(a2)
	lw	a5,12(a2)
	beq	a4,a5,.L96
	li	a0,0
	ret
.L96:
	lw	a5,0(a2)
	addi	sp,sp,-48
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	ra,44(sp)
	li	a4,5
	mv	s0,a2
	mv	t1,a0
	mv	s1,a1
	beq	a5,a4,.L98
	li	a4,6
	bne	a5,a4,.L113
	lw	a5,4(a2)
	li	a2,19
	sw	a5,12(sp)
.L100:
	lw	a4,8(a3)
	lw	a5,12(a3)
	sw	a2,16(sp)
	bne	a4,a5,.L113
	lw	a5,0(a3)
	li	a4,5
	beq	a5,a4,.L102
	li	a4,6
	bne	a5,a4,.L113
	lw	a4,4(a3)
	li	a3,19
	sw	a3,24(sp)
	sw	a4,20(sp)
	li	a3,11
	bgt	s1,a3,.L144
	bgt	s1,a5,.L105
	li	a5,3
	beq	s1,a5,.L111
	addi	a5,s1,-5
	li	a3,1
	bleu	a5,a3,.L111
.L141:
	addi	a4,sp,28
	addi	a3,sp,20
.L115:
	lw	a5,8(t1)
	addi	a2,sp,12
	mv	a1,s1
	lw	a0,32(a5)
	call	luaO_arith
	lw	a4,32(sp)
	li	a5,19
	beq	a4,a5,.L145
	lw	a5,28(sp)
	beq	a5,zero,.L113
	li	a4,5
	sw	a4,0(s0)
	sw	a5,4(s0)
	li	a0,1
	j	.L95
.L102:
	lw	a4,4(a3)
	li	a5,3
	sw	a5,24(sp)
	sw	a4,20(sp)
	li	a3,6
	bgt	s1,a3,.L110
	li	a3,4
	bgt	s1,a3,.L111
	bne	s1,a5,.L141
.L111:
	bne	a4,zero,.L141
.L113:
	li	a0,0
.L95:
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
.L98:
	lw	a5,4(a2)
	li	a2,3
	sw	a5,12(sp)
	j	.L100
.L110:
	li	a5,11
	ble	s1,a5,.L105
.L144:
	li	a5,13
	bne	s1,a5,.L141
.L105:
	li	a5,19
	bne	a2,a5,.L146
	lw	a5,12(sp)
	addi	a4,sp,28
	sw	a5,28(sp)
.L112:
	lw	a2,24(sp)
	li	a5,19
	addi	a3,sp,20
	beq	a2,a5,.L115
	mv	a1,a4
	mv	a0,a3
	li	a2,0
	sw	t1,8(sp)
	sw	a4,4(sp)
	sw	a3,0(sp)
	call	luaV_tointeger
	lw	a3,0(sp)
	lw	a4,4(sp)
	lw	t1,8(sp)
	bne	a0,zero,.L115
	j	.L113
.L146:
	addi	a4,sp,28
	mv	a1,a4
	li	a2,0
	addi	a0,sp,12
	sw	t1,4(sp)
	sw	a4,0(sp)
	call	luaV_tointeger
	lw	a4,0(sp)
	lw	t1,4(sp)
	beq	a0,zero,.L113
	j	.L112
.L145:
	li	a5,6
	sw	a5,0(s0)
	lw	a5,28(sp)
	li	a0,1
	sw	a5,4(s0)
	j	.L95
	.size	constfolding, .-constfolding
	.section	.text.luaK_nil,"ax",@progbits
	.align	2
	.globl	luaK_nil
	.hidden	luaK_nil
	.type	luaK_nil, @function
luaK_nil:
	lw	a5,16(a0)
	lw	a4,20(a0)
	ble	a5,a4,.L148
	lw	a4,0(a0)
	slli	a5,a5,2
	addi	a5,a5,-4
	lw	a4,48(a4)
	li	a3,4
	add	a5,a4,a5
	lw	a4,0(a5)
	andi	t1,a4,63
	beq	t1,a3,.L155
.L148:
	addi	a2,a2,-1
	slli	a2,a2,23
	slli	a1,a1,6
	or	a1,a2,a1
	ori	a1,a1,4
	tail	luaK_code
.L155:
	srli	a3,a4,6
	andi	a3,a3,255
	srli	t1,a4,23
	add	t0,a1,a2
	add	t1,t1,a3
	blt	a1,a3,.L149
	addi	t2,t1,1
	bge	t2,a1,.L150
	bne	a1,a3,.L148
.L149:
	blt	t0,a3,.L148
.L150:
	bgt	a1,a3,.L156
.L151:
	li	a2,16384
	addi	a2,a2,-64
	slli	a3,a1,6
	and	a3,a3,a2
	li	a2,-16384
	addi	a2,a2,63
	and	a4,a4,a2
	or	a4,a3,a4
	slli	a4,a4,9
	addi	t0,t0,-1
	srli	a4,a4,9
	blt	t0,t1,.L157
.L152:
	sub	t0,t0,a1
	slli	t0,t0,23
	or	a4,a4,t0
	sw	a4,0(a5)
	ret
.L157:
	mv	t0,t1
	j	.L152
.L156:
	mv	a1,a3
	j	.L151
	.size	luaK_nil, .-luaK_nil
	.section	.text.luaK_concat,"ax",@progbits
	.align	2
	.globl	luaK_concat
	.hidden	luaK_concat
	.type	luaK_concat, @function
luaK_concat:
	li	a4,-1
	mv	a5,a1
	beq	a2,a4,.L158
	lw	a1,0(a1)
	beq	a1,a4,.L164
	lw	a5,0(a0)
	li	t1,-131072
	addi	t1,t1,1
	lw	t0,48(a5)
	li	a3,-1
	j	.L162
.L163:
	mv	a1,a4
.L162:
	slli	a5,a1,2
	add	a5,t0,a5
	lw	a5,0(a5)
	addi	a4,a1,1
	srli	a5,a5,14
	add	a5,a5,t1
	add	a4,a4,a5
	beq	a5,a3,.L161
	bne	a4,a3,.L163
.L161:
	tail	fixjump
.L158:
	ret
.L164:
	sw	a2,0(a5)
	ret
	.size	luaK_concat, .-luaK_concat
	.section	.text.luaK_jump,"ax",@progbits
	.align	2
	.globl	luaK_jump
	.hidden	luaK_jump
	.type	luaK_jump, @function
luaK_jump:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	li	a5,-1
	lw	s1,24(a0)
	li	a1,2147450880
	addi	a1,a1,30
	sw	a5,24(a0)
	mv	s0,a0
	call	luaK_code
	mv	a5,a0
	mv	a2,s1
	mv	a0,s0
	mv	a1,sp
	sw	a5,0(sp)
	call	luaK_concat
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	a0,0(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	luaK_jump, .-luaK_jump
	.section	.text.luaK_ret,"ax",@progbits
	.align	2
	.globl	luaK_ret
	.hidden	luaK_ret
	.type	luaK_ret, @function
luaK_ret:
	addi	a2,a2,1
	slli	a2,a2,23
	slli	a1,a1,6
	or	a1,a2,a1
	ori	a1,a1,38
	tail	luaK_code
	.size	luaK_ret, .-luaK_ret
	.section	.text.luaK_getlabel,"ax",@progbits
	.align	2
	.globl	luaK_getlabel
	.hidden	luaK_getlabel
	.type	luaK_getlabel, @function
luaK_getlabel:
	mv	a5,a0
	lw	a0,16(a0)
	sw	a0,20(a5)
	ret
	.size	luaK_getlabel, .-luaK_getlabel
	.section	.text.luaK_patchtohere,"ax",@progbits
	.align	2
	.globl	luaK_patchtohere
	.hidden	luaK_patchtohere
	.type	luaK_patchtohere, @function
luaK_patchtohere:
	lw	a4,16(a0)
	mv	a2,a1
	addi	a1,a0,24
	sw	a4,20(a0)
	tail	luaK_concat
	.size	luaK_patchtohere, .-luaK_patchtohere
	.section	.text.luaK_patchlist,"ax",@progbits
	.align	2
	.globl	luaK_patchlist
	.hidden	luaK_patchlist
	.type	luaK_patchlist, @function
luaK_patchlist:
	lw	t1,16(a0)
	mv	a4,a2
	beq	t1,a2,.L172
	li	a3,255
	tail	patchlistaux
.L172:
	mv	a2,a1
	sw	t1,20(a0)
	addi	a1,a0,24
	tail	luaK_concat
	.size	luaK_patchlist, .-luaK_patchlist
	.section	.text.luaK_patchclose,"ax",@progbits
	.align	2
	.globl	luaK_patchclose
	.hidden	luaK_patchclose
	.type	luaK_patchclose, @function
luaK_patchclose:
	li	a5,-1
	addi	a2,a2,1
	beq	a1,a5,.L173
	lw	a5,0(a0)
	slli	a2,a2,6
	li	t1,-16384
	lw	t0,48(a5)
	li	a5,16384
	addi	a5,a5,-64
	li	a0,-131072
	and	a2,a2,a5
	addi	t1,t1,63
	addi	a0,a0,1
	li	a3,-1
.L175:
	slli	t2,a1,2
	add	t2,t0,t2
	lw	a5,0(t2)
	addi	a1,a1,1
	and	a5,a5,t1
	or	a5,a5,a2
	srli	a4,a5,14
	sw	a5,0(t2)
	add	a5,a4,a0
	add	a1,a1,a5
	beq	a5,a3,.L173
	bne	a1,a3,.L175
.L173:
	ret
	.size	luaK_patchclose, .-luaK_patchclose
	.section	.text.luaK_codeABC,"ax",@progbits
	.align	2
	.globl	luaK_codeABC
	.hidden	luaK_codeABC
	.type	luaK_codeABC, @function
luaK_codeABC:
	slli	a4,a4,14
	or	a4,a4,a1
	slli	a3,a3,23
	or	a4,a4,a3
	slli	a2,a2,6
	or	a1,a4,a2
	tail	luaK_code
	.size	luaK_codeABC, .-luaK_codeABC
	.section	.text.luaK_codeABx,"ax",@progbits
	.align	2
	.globl	luaK_codeABx
	.hidden	luaK_codeABx
	.type	luaK_codeABx, @function
luaK_codeABx:
	slli	a3,a3,14
	or	a1,a3,a1
	slli	a2,a2,6
	or	a1,a1,a2
	tail	luaK_code
	.size	luaK_codeABx, .-luaK_codeABx
	.section	.text.luaK_codek,"ax",@progbits
	.align	2
	.globl	luaK_codek
	.hidden	luaK_codek
	.type	luaK_codek, @function
luaK_codek:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	li	a5,262144
	mv	s0,a2
	slli	a1,a1,6
	bge	a2,a5,.L180
	slli	s0,a2,14
	or	a1,s0,a1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	ori	a1,a1,1
	addi	sp,sp,12
	tail	luaK_code
.L180:
	ori	a1,a1,2
	mv	s1,a0
	call	luaK_code
	slli	a1,s0,6
	ori	a1,a1,46
	mv	s0,a0
	mv	a0,s1
	call	luaK_code
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	luaK_codek, .-luaK_codek
	.section	.rodata.luaK_checkstack.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"function or expression needs too many registers"
	.section	.text.luaK_checkstack,"ax",@progbits
	.align	2
	.globl	luaK_checkstack
	.hidden	luaK_checkstack
	.type	luaK_checkstack, @function
luaK_checkstack:
	lw	a4,0(a0)
	lbu	a5,44(a0)
	lbu	a3,8(a4)
	add	a1,a5,a1
	bge	a3,a1,.L182
	li	a5,254
	bgt	a1,a5,.L188
	sb	a1,8(a4)
.L182:
	ret
.L188:
	lw	a0,8(a0)
	addi	sp,sp,-12
	lla	a1,.LC3
	sw	ra,8(sp)
	call	luaX_syntaxerror
	.size	luaK_checkstack, .-luaK_checkstack
	.section	.text.luaK_reserveregs,"ax",@progbits
	.align	2
	.globl	luaK_reserveregs
	.hidden	luaK_reserveregs
	.type	luaK_reserveregs, @function
luaK_reserveregs:
	lw	a4,0(a0)
	lbu	a5,44(a0)
	lbu	a3,8(a4)
	add	a1,a5,a1
	ble	a1,a3,.L190
	li	a5,254
	bgt	a1,a5,.L195
	sb	a1,8(a4)
.L190:
	sb	a1,44(a0)
	ret
.L195:
	lw	a0,8(a0)
	addi	sp,sp,-12
	lla	a1,.LC3
	sw	ra,8(sp)
	call	luaX_syntaxerror
	.size	luaK_reserveregs, .-luaK_reserveregs
	.section	.text.luaK_stringK,"ax",@progbits
	.align	2
	.globl	luaK_stringK
	.hidden	luaK_stringK
	.type	luaK_stringK, @function
luaK_stringK:
	addi	sp,sp,-20
	sw	ra,16(sp)
	lbu	a4,4(a1)
	mv	a2,sp
	mv	a5,a1
	ori	a4,a4,64
	mv	a1,a2
	sw	a5,0(sp)
	sw	a4,4(sp)
	call	addk
	lw	ra,16(sp)
	addi	sp,sp,20
	jr	ra
	.size	luaK_stringK, .-luaK_stringK
	.section	.text.luaK_intK,"ax",@progbits
	.align	2
	.globl	luaK_intK
	.hidden	luaK_intK
	.type	luaK_intK, @function
luaK_intK:
	addi	sp,sp,-28
	mv	a5,a1
	sw	a5,0(sp)
	sw	a5,8(sp)
	addi	a2,sp,8
	mv	a1,sp
	li	a4,2
	li	a5,19
	sw	ra,24(sp)
	sw	a4,4(sp)
	sw	a5,12(sp)
	call	addk
	lw	ra,24(sp)
	addi	sp,sp,28
	jr	ra
	.size	luaK_intK, .-luaK_intK
	.section	.text.luaK_setreturns,"ax",@progbits
	.align	2
	.globl	luaK_setreturns
	.hidden	luaK_setreturns
	.type	luaK_setreturns, @function
luaK_setreturns:
	lw	a5,0(a1)
	li	a4,13
	beq	a5,a4,.L209
	li	a4,14
	beq	a5,a4,.L210
	ret
.L209:
	lw	a5,0(a0)
	lw	a4,4(a1)
	addi	a2,a2,1
	lw	a5,48(a5)
	slli	a4,a4,2
	li	a3,8372224
	add	a5,a5,a4
	lw	a4,0(a5)
	slli	a2,a2,14
	and	a2,a2,a3
	li	a3,-8372224
	addi	a3,a3,-1
	and	a4,a4,a3
	or	a2,a2,a4
	sw	a2,0(a5)
	ret
.L210:
	lw	a4,0(a0)
	lw	a5,4(a1)
	addi	a2,a2,1
	lw	a1,48(a4)
	slli	a5,a5,2
	lbu	a3,44(a0)
	add	a1,a1,a5
	lw	a5,0(a1)
	slli	a2,a2,23
	slli	a5,a5,9
	srli	a5,a5,9
	or	a5,a5,a2
	li	a2,-16384
	addi	a2,a2,63
	and	a5,a5,a2
	slli	a2,a3,6
	or	a5,a5,a2
	sw	a5,0(a1)
	lbu	a5,8(a4)
	addi	a3,a3,1
	bgt	a3,a5,.L203
	andi	a3,a3,0xff
	sb	a3,44(a0)
.L212:
	ret
.L203:
	li	a5,254
	bgt	a3,a5,.L211
	andi	a3,a3,0xff
	sb	a3,8(a4)
	sb	a3,44(a0)
	j	.L212
.L211:
	lw	a0,8(a0)
	addi	sp,sp,-12
	lla	a1,.LC3
	sw	ra,8(sp)
	call	luaX_syntaxerror
	.size	luaK_setreturns, .-luaK_setreturns
	.section	.text.luaK_setoneret,"ax",@progbits
	.align	2
	.globl	luaK_setoneret
	.hidden	luaK_setoneret
	.type	luaK_setoneret, @function
luaK_setoneret:
	lw	a5,0(a1)
	li	a4,13
	beq	a5,a4,.L216
	li	a4,14
	beq	a5,a4,.L217
	ret
.L217:
	lw	a4,0(a0)
	lw	a5,4(a1)
	li	a3,16777216
	lw	a4,48(a4)
	slli	a5,a5,2
	add	a4,a4,a5
	lw	a5,0(a4)
	slli	a5,a5,9
	srli	a5,a5,9
	or	a5,a5,a3
	sw	a5,0(a4)
	li	a5,12
	sw	a5,0(a1)
	ret
.L216:
	lw	a5,0(a0)
	lw	a4,4(a1)
	li	a3,7
	lw	a5,48(a5)
	slli	a4,a4,2
	sw	a3,0(a1)
	add	a5,a5,a4
	lw	a5,0(a5)
	srli	a5,a5,6
	andi	a5,a5,255
	sw	a5,4(a1)
	ret
	.size	luaK_setoneret, .-luaK_setoneret
	.section	.text.luaK_dischargevars,"ax",@progbits
	.align	2
	.globl	luaK_dischargevars
	.hidden	luaK_dischargevars
	.type	luaK_dischargevars, @function
luaK_dischargevars:
	lw	a5,0(a1)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	li	a4,10
	mv	s0,a1
	beq	a5,a4,.L219
	bgtu	a5,a4,.L220
	li	a4,8
	beq	a5,a4,.L221
	li	a4,9
	bne	a5,a4,.L218
	lw	a1,4(a1)
	slli	a1,a1,23
	ori	a1,a1,5
	call	luaK_code
	li	a5,12
	sw	a0,4(s0)
	sw	a5,0(s0)
.L218:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L220:
	addi	a5,a5,-13
	li	a4,1
	bgtu	a5,a4,.L218
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	luaK_setoneret
.L219:
	lh	a4,4(a1)
	mv	a3,a0
	andi	a5,a4,256
	bne	a5,zero,.L225
	lbu	a5,42(a0)
	blt	a4,a5,.L225
	lbu	a5,44(a0)
	addi	a5,a5,-1
	sb	a5,44(a0)
.L225:
	lbu	a0,7(s0)
	li	a2,8
	lbu	a5,6(s0)
	li	a1,6
	beq	a0,a2,.L231
.L226:
	slli	a4,a4,14
	slli	a5,a5,23
	or	a5,a5,a4
	or	a1,a5,a1
	mv	a0,a3
	call	luaK_code
	li	a5,12
	lw	ra,8(sp)
	sw	a0,4(s0)
	sw	a5,0(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L221:
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a5,7
	sw	a5,0(a1)
	addi	sp,sp,12
	jr	ra
.L231:
	lbu	a2,42(a3)
	li	a1,7
	bgtu	a2,a5,.L226
	lbu	a2,44(a3)
	addi	a2,a2,-1
	sb	a2,44(a3)
	j	.L226
	.size	luaK_dischargevars, .-luaK_dischargevars
	.section	.text.discharge2reg,"ax",@progbits
	.align	2
	.type	discharge2reg, @function
discharge2reg:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	s1,20(sp)
	mv	s0,a1
	sw	ra,28(sp)
	sw	a0,0(sp)
	mv	s1,a2
	call	luaK_dischargevars
	lw	a4,0(s0)
	li	a3,12
	bgtu	a4,a3,.L232
	lla	a2,.L235
	slli	a3,a4,2
	add	a3,a3,a2
	lw	a3,0(a3)
	lw	a5,0(sp)
	add	a3,a3,a2
	jr	a3
	.section	.rodata.discharge2reg,"a",@progbits
	.align	2
	.align	2
.L235:
	.word	.L232-.L235
	.word	.L241-.L235
	.word	.L240-.L235
	.word	.L240-.L235
	.word	.L239-.L235
	.word	.L238-.L235
	.word	.L237-.L235
	.word	.L236-.L235
	.word	.L232-.L235
	.word	.L232-.L235
	.word	.L232-.L235
	.word	.L232-.L235
	.word	.L234-.L235
	.section	.text.discharge2reg
.L240:
	addi	a1,a4,-2
	seqz	a1,a1
	slli	a1,a1,23
	slli	a4,s1,6
	or	a1,a1,a4
	ori	a1,a1,3
	mv	a0,a5
	call	luaK_code
.L242:
	li	a5,7
	sw	s1,4(s0)
	sw	a5,0(s0)
.L232:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L239:
	lw	a2,4(s0)
	mv	a1,s1
	mv	a0,a5
	call	luaK_codek
	j	.L242
.L238:
	lw	a4,4(s0)
	addi	a2,sp,12
	mv	a1,a2
	sw	a4,12(sp)
	mv	a0,a5
	sw	a5,0(sp)
	li	a4,3
.L244:
	sw	a4,16(sp)
	call	addk
	lw	a5,0(sp)
	mv	a2,a0
	mv	a1,s1
	mv	a0,a5
	call	luaK_codek
	j	.L242
.L237:
	lw	a4,4(s0)
	li	a3,2
	addi	a2,sp,12
	sw	a4,4(sp)
	sw	a4,12(sp)
	addi	a1,sp,4
	mv	a0,a5
	sw	a5,0(sp)
	sw	a3,8(sp)
	li	a4,19
	j	.L244
.L236:
	lw	a4,4(s0)
	beq	a4,s1,.L242
	slli	a1,s1,6
	slli	a4,a4,23
	or	a1,a1,a4
	mv	a0,a5
	call	luaK_code
	j	.L242
.L234:
	lw	a4,0(a5)
	lw	a5,4(s0)
	li	a2,-16384
	lw	a3,48(a4)
	slli	a5,a5,2
	addi	a2,a2,63
	add	a3,a3,a5
	lw	a5,0(a3)
	slli	a4,s1,6
	and	a5,a5,a2
	li	a2,16384
	addi	a2,a2,-64
	and	a4,a4,a2
	or	a5,a5,a4
	sw	a5,0(a3)
	j	.L242
.L241:
	li	a2,1
	mv	a1,s1
	mv	a0,a5
	call	luaK_nil
	j	.L242
	.size	discharge2reg, .-discharge2reg
	.section	.text.exp2reg,"ax",@progbits
	.align	2
	.type	exp2reg, @function
exp2reg:
	addi	sp,sp,-32
	sw	s0,24(sp)
	sw	s1,20(sp)
	mv	s0,a1
	sw	ra,28(sp)
	mv	s1,a0
	sw	a2,0(sp)
	call	discharge2reg
	lw	a3,0(s0)
	li	a4,11
	beq	a3,a4,.L254
.L246:
	lw	a3,12(s0)
	lw	a1,8(s0)
	sw	a3,4(sp)
	bne	a1,a3,.L255
.L247:
	lw	a5,0(sp)
	li	a4,-1
	sw	a4,8(s0)
	sw	a4,12(s0)
	li	a4,7
	lw	ra,28(sp)
	sw	a5,4(s0)
	sw	a4,0(s0)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
.L255:
	mv	a0,s1
	call	need_value
	lw	a3,4(sp)
	beq	a0,zero,.L256
.L248:
	lw	a3,0(s0)
	li	a4,11
	li	a2,-1
	beq	a3,a4,.L250
	lw	a5,24(s1)
	li	a1,2147450880
	sw	a2,24(s1)
	addi	a1,a1,30
	mv	a0,s1
	sw	a5,4(sp)
	call	luaK_code
	lw	a5,4(sp)
	mv	a4,a0
	addi	a1,sp,16
	mv	a2,a5
	mv	a0,s1
	sw	a4,16(sp)
	call	luaK_concat
	lw	a2,16(sp)
.L250:
	lw	a5,0(sp)
	lw	a4,16(s1)
	li	a1,16384
	slli	a5,a5,6
	addi	a1,a1,3
	or	a1,a5,a1
	sw	a4,20(s1)
	mv	a0,s1
	sw	a2,12(sp)
	sw	a5,4(sp)
	call	luaK_code
	lw	a3,16(s1)
	lw	a5,4(sp)
	li	a1,8388608
	addi	a1,a1,3
	mv	a4,a0
	or	a1,a5,a1
	sw	a3,20(s1)
	mv	a0,s1
	sw	a4,8(sp)
	call	luaK_code
	lw	a3,16(s1)
	lw	a2,12(sp)
	mv	a5,a0
	sw	a3,20(s1)
	addi	a1,s1,24
	mv	a0,s1
	sw	a5,4(sp)
	call	luaK_concat
	lw	a3,12(s0)
	lw	a4,8(sp)
.L249:
	lw	a2,16(s1)
	mv	a1,a3
	lw	a3,0(sp)
	mv	a0,s1
	sw	a2,20(s1)
	sw	a2,8(sp)
	call	patchlistaux
	lw	a4,4(sp)
	lw	a3,0(sp)
	lw	a2,8(sp)
	lw	a1,8(s0)
	mv	a0,s1
	call	patchlistaux
	j	.L247
.L254:
	lw	a2,4(s0)
	addi	a1,s0,8
	mv	a0,s1
	call	luaK_concat
	j	.L246
.L256:
	mv	a1,a3
	mv	a0,s1
	call	need_value
	lw	a3,4(sp)
	bne	a0,zero,.L248
	li	a5,-1
	sw	a5,4(sp)
	li	a4,-1
	j	.L249
	.size	exp2reg, .-exp2reg
	.section	.text.jumponcond,"ax",@progbits
	.align	2
	.type	jumponcond, @function
jumponcond:
	lw	a4,0(a1)
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	li	a3,12
	mv	s1,a1
	mv	s0,a0
	mv	a5,a2
	beq	a4,a3,.L268
	li	a3,7
	bne	a4,a3,.L269
.L261:
	lw	a1,4(s1)
	andi	a4,a1,256
	bne	a4,zero,.L265
	lbu	a4,42(s0)
	bge	a1,a4,.L270
.L265:
	slli	a1,a1,23
	slli	a5,a5,14
	or	a5,a1,a5
	li	a1,16384
	addi	a1,a1,-29
	or	a1,a5,a1
	mv	a0,s0
.L267:
	call	luaK_code
	li	a5,-1
	lw	s1,24(s0)
	li	a1,2147450880
	sw	a5,24(s0)
	addi	a1,a1,30
	mv	a0,s0
	call	luaK_code
	mv	a5,a0
	mv	a2,s1
	mv	a0,s0
	addi	a1,sp,4
	sw	a5,4(sp)
	call	luaK_concat
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	a0,4(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L268:
	lw	a4,0(a0)
	lw	a2,4(a1)
	li	a1,27
	lw	a3,48(a4)
	slli	a2,a2,2
	add	a3,a3,a2
	lw	a3,0(a3)
	andi	a2,a3,63
	beq	a2,a1,.L271
.L259:
	lbu	a2,44(s0)
	lbu	a3,8(a4)
	addi	a2,a2,1
	bgt	a2,a3,.L262
	andi	a3,a2,0xff
.L263:
	andi	a2,a2,255
	sb	a3,44(s0)
	addi	a2,a2,-1
	mv	a1,s1
	mv	a0,s0
	sw	a5,0(sp)
	call	discharge2reg
	lw	a3,0(s1)
	li	a4,7
	lw	a5,0(sp)
	beq	a3,a4,.L261
	lw	a1,4(s1)
	j	.L265
.L262:
	li	a3,254
	bgt	a2,a3,.L272
	andi	a3,a2,0xff
	sb	a3,8(a4)
	j	.L263
.L269:
	lw	a4,0(a0)
	j	.L259
.L270:
	lbu	a4,44(s0)
	addi	a4,a4,-1
	sb	a4,44(s0)
	j	.L265
.L271:
	lw	a4,16(a0)
	srli	a1,a3,23
	slli	a5,a5,14
	li	a3,16384
	slli	a1,a1,6
	xor	a5,a5,a3
	addi	a4,a4,-1
	or	a1,a1,a5
	ori	a1,a1,34
	sw	a4,16(a0)
	j	.L267
.L272:
	lw	a0,8(s0)
	lla	a1,.LC3
	call	luaX_syntaxerror
	.size	jumponcond, .-jumponcond
	.section	.text.luaK_exp2nextreg,"ax",@progbits
	.align	2
	.globl	luaK_exp2nextreg
	.hidden	luaK_exp2nextreg
	.type	luaK_exp2nextreg, @function
luaK_exp2nextreg:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s1,a1
	mv	s0,a0
	call	luaK_dischargevars
	lw	a4,0(s1)
	li	a5,7
	beq	a4,a5,.L274
	lbu	a2,44(s0)
.L275:
	lw	a5,0(s0)
	addi	a2,a2,1
	lbu	a4,8(a5)
	bgt	a2,a4,.L276
	andi	a4,a2,0xff
.L277:
	sb	a4,44(s0)
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a1,s1
	lw	s1,0(sp)
	andi	a2,a2,255
	addi	a2,a2,-1
	addi	sp,sp,12
	tail	exp2reg
.L276:
	li	a4,254
	bgt	a2,a4,.L280
	andi	a4,a2,0xff
	sb	a4,8(a5)
	j	.L277
.L274:
	lw	a5,4(s1)
	lbu	a2,44(s0)
	andi	a4,a5,256
	bne	a4,zero,.L275
	lbu	a4,42(s0)
	blt	a5,a4,.L275
	addi	a2,a2,-1
	andi	a2,a2,0xff
	sb	a2,44(s0)
	j	.L275
.L280:
	lw	a0,8(s0)
	lla	a1,.LC3
	call	luaX_syntaxerror
	.size	luaK_exp2nextreg, .-luaK_exp2nextreg
	.section	.text.luaK_exp2anyreg,"ax",@progbits
	.align	2
	.globl	luaK_exp2anyreg
	.hidden	luaK_exp2anyreg
	.type	luaK_exp2anyreg, @function
luaK_exp2anyreg:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a1
	sw	ra,8(sp)
	mv	s1,a0
	call	luaK_dischargevars
	lw	a4,0(s0)
	li	a5,7
	bne	a4,a5,.L282
	lw	a4,8(s0)
	lw	a5,12(s0)
	lw	a0,4(s0)
	beq	a4,a5,.L281
	lbu	a5,42(s1)
	ble	a5,a0,.L285
.L282:
	mv	a0,s1
	mv	a1,s0
	call	luaK_exp2nextreg
	lw	a0,4(s0)
.L281:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L285:
	mv	a2,a0
	mv	a1,s0
	mv	a0,s1
	call	exp2reg
	lw	a0,4(s0)
	j	.L281
	.size	luaK_exp2anyreg, .-luaK_exp2anyreg
	.section	.text.luaK_exp2anyregup,"ax",@progbits
	.align	2
	.globl	luaK_exp2anyregup
	.hidden	luaK_exp2anyregup
	.type	luaK_exp2anyregup, @function
luaK_exp2anyregup:
	lw	a4,0(a1)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	li	a5,9
	mv	s0,a1
	mv	s1,a0
	bne	a4,a5,.L287
	lw	a4,8(a1)
	lw	a5,12(a1)
	beq	a4,a5,.L286
.L287:
	mv	a1,s0
	mv	a0,s1
	call	luaK_dischargevars
	lw	a4,0(s0)
	li	a5,7
	bne	a4,a5,.L289
	lw	a4,8(s0)
	lw	a5,12(s0)
	beq	a4,a5,.L286
	lw	a2,4(s0)
	lbu	a5,42(s1)
	bge	a2,a5,.L292
.L289:
	mv	a1,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a0,s1
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	luaK_exp2nextreg
.L286:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L292:
	mv	a1,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a0,s1
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	exp2reg
	.size	luaK_exp2anyregup, .-luaK_exp2anyregup
	.section	.text.luaK_exp2val,"ax",@progbits
	.align	2
	.globl	luaK_exp2val
	.hidden	luaK_exp2val
	.type	luaK_exp2val, @function
luaK_exp2val:
	lw	a4,8(a1)
	lw	a5,12(a1)
	beq	a4,a5,.L294
	tail	luaK_exp2anyreg
.L294:
	tail	luaK_dischargevars
	.size	luaK_exp2val, .-luaK_exp2val
	.section	.text.luaK_exp2RK,"ax",@progbits
	.align	2
	.globl	luaK_exp2RK
	.hidden	luaK_exp2RK
	.type	luaK_exp2RK, @function
luaK_exp2RK:
	lw	a4,8(a1)
	lw	a5,12(a1)
	addi	sp,sp,-28
	sw	s0,20(sp)
	sw	s1,16(sp)
	sw	ra,24(sp)
	mv	s0,a1
	mv	s1,a0
	beq	a4,a5,.L296
	call	luaK_exp2anyreg
.L297:
	lw	a5,0(s0)
	li	a4,6
	bgtu	a5,a4,.L298
	lla	a4,.L300
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.luaK_exp2RK,"a",@progbits
	.align	2
	.align	2
.L300:
	.word	.L298-.L300
	.word	.L305-.L300
	.word	.L304-.L300
	.word	.L303-.L300
	.word	.L302-.L300
	.word	.L301-.L300
	.word	.L299-.L300
	.section	.text.luaK_exp2RK
.L298:
	mv	a1,s0
	lw	s0,20(sp)
	lw	ra,24(sp)
	mv	a0,s1
	lw	s1,16(sp)
	addi	sp,sp,28
	tail	luaK_exp2anyreg
.L296:
	call	luaK_dischargevars
	j	.L297
.L299:
	lw	a5,4(s0)
	li	a4,2
	addi	a2,sp,8
	sw	a5,0(sp)
	sw	a5,8(sp)
	mv	a1,sp
	li	a5,19
	mv	a0,s1
	sw	a4,4(sp)
	sw	a5,12(sp)
	call	addk
	sw	a0,4(s0)
.L306:
	li	a5,4
	sw	a5,0(s0)
	li	a5,255
	bgt	a0,a5,.L298
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	ori	a0,a0,256
	addi	sp,sp,28
	jr	ra
.L305:
	lw	a5,8(s1)
	addi	a2,sp,8
	mv	a1,sp
	lw	a5,44(a5)
	mv	a0,s1
	sw	zero,12(sp)
	sw	a5,0(sp)
	li	a5,69
	sw	a5,4(sp)
	call	addk
	sw	a0,4(s0)
	j	.L306
.L304:
	addi	a2,sp,8
	li	a5,1
	mv	a1,a2
	mv	a0,s1
	sw	a5,8(sp)
	sw	a5,12(sp)
	call	addk
	sw	a0,4(s0)
	j	.L306
.L303:
	addi	a2,sp,8
	li	a5,1
	mv	a1,a2
	mv	a0,s1
	sw	zero,8(sp)
	sw	a5,12(sp)
	call	addk
	sw	a0,4(s0)
	j	.L306
.L302:
	lw	a0,4(s0)
	j	.L306
.L301:
	lw	a5,4(s0)
	addi	a2,sp,8
	mv	a1,a2
	sw	a5,8(sp)
	mv	a0,s1
	li	a5,3
	sw	a5,12(sp)
	call	addk
	sw	a0,4(s0)
	j	.L306
	.size	luaK_exp2RK, .-luaK_exp2RK
	.section	.text.codebinexpval,"ax",@progbits
	.align	2
	.type	codebinexpval, @function
codebinexpval:
	addi	sp,sp,-32
	mv	t0,a1
	mv	a1,a3
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	mv	s0,a0
	sw	a4,8(sp)
	sw	t0,12(sp)
	sw	a3,16(sp)
	sw	a2,0(sp)
	call	luaK_exp2RK
	lw	a5,0(sp)
	mv	t1,a0
	mv	a0,s0
	mv	a1,a5
	sw	t1,4(sp)
	call	luaK_exp2RK
	lw	a3,16(sp)
	lw	a5,0(sp)
	mv	s1,a0
	mv	a2,a3
	mv	a1,a5
	mv	a0,s0
	call	freeexps
	lw	t1,4(sp)
	lw	t0,12(sp)
	slli	s1,s1,23
	slli	t1,t1,14
	or	s1,s1,t1
	or	a1,s1,t0
	mv	a0,s0
	call	luaK_code
	lw	a3,0(s0)
	lw	a2,16(s0)
	lw	a5,0(sp)
	lw	a3,56(a3)
	lw	a4,8(sp)
	lw	ra,28(sp)
	lw	s0,24(sp)
	slli	a2,a2,2
	li	a1,12
	sw	a0,4(a5)
	sw	a1,0(a5)
	add	a3,a3,a2
	sw	a4,-4(a3)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
	.size	codebinexpval, .-codebinexpval
	.section	.text.luaK_storevar,"ax",@progbits
	.align	2
	.globl	luaK_storevar
	.hidden	luaK_storevar
	.type	luaK_storevar, @function
luaK_storevar:
	lw	a5,0(a1)
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	li	a3,9
	mv	s0,a1
	mv	a4,a0
	mv	s1,a2
	beq	a5,a3,.L314
	li	a3,10
	beq	a5,a3,.L315
	li	a3,8
	beq	a5,a3,.L321
.L316:
	lw	a3,0(s1)
	li	a5,7
	beq	a3,a5,.L322
.L313:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L322:
	lw	a5,4(s1)
	andi	a3,a5,256
	bne	a3,zero,.L313
	lbu	a3,42(a4)
	blt	a5,a3,.L313
	lbu	a5,44(a4)
	addi	a5,a5,-1
	sb	a5,44(a4)
	j	.L313
.L321:
	lw	a3,0(a2)
	li	a5,7
	beq	a3,a5,.L323
.L317:
	lw	a2,4(s0)
	lw	s0,12(sp)
	lw	ra,16(sp)
	mv	a1,s1
	lw	s1,8(sp)
	mv	a0,a4
	addi	sp,sp,20
	tail	exp2reg
.L315:
	lbu	a2,7(a1)
	li	a3,8
	beq	a2,a3,.L318
	li	a5,8
.L318:
	mv	a1,s1
	mv	a0,a4
	sw	a5,4(sp)
	sw	a4,0(sp)
	call	luaK_exp2RK
	lbu	a3,6(s0)
	lh	a2,4(s0)
	lw	a5,4(sp)
	lw	a4,0(sp)
	slli	a2,a2,23
	slli	a3,a3,6
	or	a3,a3,a2
	slli	a1,a0,14
	or	a3,a3,a5
	mv	a0,a4
	or	a1,a3,a1
	call	luaK_code
	lw	a4,0(sp)
	j	.L316
.L314:
	mv	a1,a2
	sw	a0,0(sp)
	call	luaK_exp2anyreg
	lw	a1,4(s0)
	lw	a4,0(sp)
	slli	a5,a0,6
	slli	a1,a1,23
	or	a1,a1,a5
	mv	a0,a4
	ori	a1,a1,9
	call	luaK_code
	lw	a4,0(sp)
	j	.L316
.L323:
	lw	a5,4(a2)
	andi	a3,a5,256
	bne	a3,zero,.L317
	lbu	a3,42(a0)
	blt	a5,a3,.L317
	lbu	a5,44(a0)
	addi	a5,a5,-1
	sb	a5,44(a0)
	j	.L317
	.size	luaK_storevar, .-luaK_storevar
	.section	.text.luaK_self,"ax",@progbits
	.align	2
	.globl	luaK_self
	.hidden	luaK_self
	.type	luaK_self, @function
luaK_self:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	mv	s1,a2
	sw	a1,0(sp)
	mv	s0,a0
	call	luaK_exp2anyreg
	lw	a5,0(sp)
	li	a4,7
	lw	a3,0(a5)
	lw	a2,4(a5)
	beq	a3,a4,.L325
	lbu	a4,44(s0)
.L326:
	lw	a3,0(s0)
	li	a1,7
	sw	a4,4(a5)
	sw	a1,0(a5)
	lbu	a1,8(a3)
	addi	a5,a4,2
	bgt	a5,a1,.L327
	andi	a5,a5,0xff
.L328:
	sb	a5,44(s0)
	mv	a1,s1
	mv	a0,s0
	sw	a4,4(sp)
	sw	a2,0(sp)
	call	luaK_exp2RK
	lw	a2,0(sp)
	lw	a4,4(sp)
	slli	a0,a0,14
	slli	a1,a2,23
	slli	a4,a4,6
	or	a1,a1,a0
	or	a1,a1,a4
	ori	a1,a1,12
	mv	a0,s0
	call	luaK_code
	lw	a4,0(s1)
	li	a5,7
	beq	a4,a5,.L332
.L324:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L327:
	li	a1,254
	bgt	a5,a1,.L333
	andi	a5,a5,0xff
	sb	a5,8(a3)
	j	.L328
.L325:
	andi	a3,a2,256
	lbu	a4,44(s0)
	bne	a3,zero,.L326
	lbu	a3,42(s0)
	blt	a2,a3,.L326
	addi	a4,a4,-1
	andi	a4,a4,0xff
	sb	a4,44(s0)
	j	.L326
.L332:
	lw	a5,4(s1)
	andi	a4,a5,256
	bne	a4,zero,.L324
	lbu	a4,42(s0)
	blt	a5,a4,.L324
	lbu	a5,44(s0)
	addi	a5,a5,-1
	sb	a5,44(s0)
	j	.L324
.L333:
	lw	a0,8(s0)
	lla	a1,.LC3
	call	luaX_syntaxerror
	.size	luaK_self, .-luaK_self
	.section	.text.luaK_goiftrue,"ax",@progbits
	.align	2
	.globl	luaK_goiftrue
	.hidden	luaK_goiftrue
	.type	luaK_goiftrue, @function
luaK_goiftrue:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s1,a1
	mv	s0,a0
	call	luaK_dischargevars
	lw	a5,0(s1)
	li	a4,6
	bleu	a5,a4,.L342
	li	a4,11
	bne	a5,a4,.L337
	lw	a4,0(s0)
	lw	a5,4(s1)
	lw	a4,48(a4)
	slli	a3,a5,2
	add	a4,a4,a3
	ble	a5,zero,.L338
	lw	a3,-4(a4)
	lla	a5,luaP_opmodes
	andi	a3,a3,63
	add	a5,a5,a3
	lb	a5,0(a5)
	blt	a5,zero,.L343
.L338:
	lw	a3,0(a4)
	li	a2,-16384
	addi	a2,a2,63
	srli	a5,a3,6
	andi	a5,a5,255
	seqz	a5,a5
	and	a3,a3,a2
	slli	a5,a5,6
	or	a5,a5,a3
	sw	a5,0(a4)
	lw	a2,4(s1)
.L336:
	addi	a1,s1,12
	mv	a0,s0
	call	luaK_concat
	lw	a5,16(s0)
	lw	a2,8(s1)
	addi	a1,s0,24
	sw	a5,20(s0)
	mv	a0,s0
	call	luaK_concat
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a5,-1
	sw	a5,8(s1)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L342:
	li	a4,3
	bgtu	a5,a4,.L339
	li	a4,2
	li	a2,-1
	beq	a5,a4,.L336
.L337:
	li	a2,0
	mv	a1,s1
	mv	a0,s0
	call	jumponcond
	mv	a2,a0
	j	.L336
.L339:
	li	a2,-1
	j	.L336
.L343:
	addi	a4,a4,-4
	j	.L338
	.size	luaK_goiftrue, .-luaK_goiftrue
	.section	.text.luaK_goiffalse,"ax",@progbits
	.align	2
	.globl	luaK_goiffalse
	.hidden	luaK_goiffalse
	.type	luaK_goiffalse, @function
luaK_goiffalse:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s1,a1
	mv	s0,a0
	call	luaK_dischargevars
	lw	a5,0(s1)
	li	a4,3
	beq	a5,a4,.L349
	li	a4,11
	beq	a5,a4,.L346
	li	a4,1
	beq	a5,a4,.L349
	li	a2,1
	mv	a1,s1
	mv	a0,s0
	call	jumponcond
	mv	a2,a0
.L345:
	addi	a1,s1,8
	mv	a0,s0
	call	luaK_concat
	lw	a5,16(s0)
	lw	a2,12(s1)
	addi	a1,s0,24
	sw	a5,20(s0)
	mv	a0,s0
	call	luaK_concat
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a5,-1
	sw	a5,12(s1)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L349:
	li	a2,-1
	j	.L345
.L346:
	lw	a2,4(s1)
	j	.L345
	.size	luaK_goiffalse, .-luaK_goiffalse
	.section	.text.luaK_indexed,"ax",@progbits
	.align	2
	.globl	luaK_indexed
	.hidden	luaK_indexed
	.type	luaK_indexed, @function
luaK_indexed:
	lw	a5,4(a1)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a1
	sb	a5,6(s0)
	mv	a1,a2
	call	luaK_exp2RK
	lw	a5,0(s0)
	lw	ra,8(sp)
	sh	a0,4(s0)
	addi	a5,a5,-9
	seqz	a5,a5
	addi	a5,a5,8
	sb	a5,7(s0)
	li	a5,10
	sw	a5,0(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	luaK_indexed, .-luaK_indexed
	.section	.text.luaK_prefix,"ax",@progbits
	.align	2
	.globl	luaK_prefix
	.hidden	luaK_prefix
	.type	luaK_prefix, @function
luaK_prefix:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	mv	s0,a1
	sw	ra,16(sp)
	li	a1,2
	sw	a3,0(sp)
	mv	a5,a2
	mv	s1,a0
	beq	s0,a1,.L357
	bgtu	s0,a1,.L375
	lla	a3,.LANCHOR0
	addi	a1,s0,12
	sw	a2,4(sp)
	call	constfolding
	lw	a5,4(sp)
	beq	a0,zero,.L359
.L356:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L375:
	li	a3,3
	bne	s0,a3,.L356
.L359:
	mv	a1,a5
	mv	a0,s1
	sw	a5,4(sp)
	call	luaK_exp2anyreg
	lw	a5,4(sp)
	li	a3,7
	addi	a1,s0,25
	lw	a2,0(a5)
	beq	a2,a3,.L376
.L361:
	slli	a0,a0,23
	or	a1,a0,a1
	mv	a0,s1
	sw	a5,4(sp)
	call	luaK_code
	lw	a2,0(s1)
	lw	a5,4(sp)
	lw	a3,16(s1)
	lw	a4,56(a2)
	li	a2,12
	sw	a0,4(a5)
	sw	a2,0(a5)
	lw	a5,0(sp)
	lw	ra,16(sp)
	lw	s0,12(sp)
	slli	a3,a3,2
	add	a4,a4,a3
	sw	a5,-4(a4)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L357:
	mv	a1,a2
	sw	a2,0(sp)
	call	luaK_dischargevars
	lw	a5,0(sp)
	li	a3,12
	lw	a2,0(a5)
	bgtu	a2,a3,.L362
	lla	a1,.L364
	slli	a3,a2,2
	add	a3,a3,a1
	lw	a3,0(a3)
	add	a3,a3,a1
	jr	a3
	.section	.rodata.luaK_prefix,"a",@progbits
	.align	2
	.align	2
.L364:
	.word	.L362-.L364
	.word	.L367-.L364
	.word	.L366-.L364
	.word	.L367-.L364
	.word	.L366-.L364
	.word	.L366-.L364
	.word	.L366-.L364
	.word	.L363-.L364
	.word	.L362-.L364
	.word	.L362-.L364
	.word	.L362-.L364
	.word	.L365-.L364
	.word	.L363-.L364
	.section	.text.luaK_prefix
.L367:
	li	a3,2
	sw	a3,0(a5)
.L362:
	lw	a1,8(a5)
	lw	a3,12(a5)
	mv	a0,s1
	sw	a1,12(a5)
	sw	a3,8(a5)
	sw	a5,0(sp)
	call	removevalues
	lw	a5,0(sp)
	lw	s0,12(sp)
	lw	ra,16(sp)
	lw	a1,8(a5)
	mv	a0,s1
	lw	s1,8(sp)
	addi	sp,sp,20
	tail	removevalues
.L376:
	lw	a3,4(a5)
	andi	a2,a3,256
	bne	a2,zero,.L361
	lbu	a2,42(s1)
	blt	a3,a2,.L361
	lbu	a3,44(s1)
	addi	a3,a3,-1
	sb	a3,44(s1)
	j	.L361
.L366:
	li	a3,3
	sw	a3,0(a5)
	j	.L362
.L363:
	li	a3,7
	bne	a2,a3,.L377
.L369:
	lw	a1,4(a5)
	andi	a3,a1,256
	bne	a3,zero,.L373
	lbu	a3,42(s1)
	blt	a1,a3,.L373
	lbu	a3,44(s1)
	addi	a3,a3,-1
	sb	a3,44(s1)
.L373:
	slli	a1,a1,23
	ori	a1,a1,27
	mv	a0,s1
	sw	a5,0(sp)
	call	luaK_code
	lw	a5,0(sp)
	li	a3,12
	sw	a0,4(a5)
	sw	a3,0(a5)
	j	.L362
.L365:
	lw	a2,0(s1)
	lw	a3,4(a5)
	lw	a2,48(a2)
	slli	a1,a3,2
	add	a2,a2,a1
	ble	a3,zero,.L368
	lw	a1,-4(a2)
	lla	a3,luaP_opmodes
	andi	a1,a1,63
	add	a3,a3,a1
	lb	a3,0(a3)
	bge	a3,zero,.L368
	addi	a2,a2,-4
.L368:
	lw	a1,0(a2)
	li	a0,-16384
	addi	a0,a0,63
	srli	a3,a1,6
	andi	a3,a3,255
	seqz	a3,a3
	slli	a3,a3,6
	and	a1,a1,a0
	or	a3,a3,a1
	sw	a3,0(a2)
	j	.L362
.L377:
	lw	a1,0(s1)
	lbu	a2,44(s1)
	lbu	a3,8(a1)
	addi	a2,a2,1
	bgt	a2,a3,.L370
	andi	a3,a2,0xff
.L371:
	andi	a2,a2,255
	sb	a3,44(s1)
	addi	a2,a2,-1
	mv	a1,a5
	mv	a0,s1
	sw	a5,0(sp)
	call	discharge2reg
	lw	a5,0(sp)
	li	a3,7
	lw	a2,0(a5)
	beq	a2,a3,.L369
	lw	a1,4(a5)
	j	.L373
.L370:
	li	a3,254
	bgt	a2,a3,.L378
	andi	a3,a2,0xff
	sb	a3,8(a1)
	j	.L371
.L378:
	lw	a0,8(s1)
	lla	a1,.LC3
	call	luaX_syntaxerror
	.size	luaK_prefix, .-luaK_prefix
	.section	.text.luaK_infix,"ax",@progbits
	.align	2
	.globl	luaK_infix
	.hidden	luaK_infix
	.type	luaK_infix, @function
luaK_infix:
	mv	a5,a1
	li	a4,19
	mv	a3,a0
	mv	a1,a2
	beq	a5,a4,.L380
	bgtu	a5,a4,.L381
	li	a4,11
	bleu	a5,a4,.L382
	li	a4,12
	bne	a5,a4,.L384
	tail	luaK_exp2nextreg
.L381:
	li	a4,20
	bne	a5,a4,.L384
	tail	luaK_goiffalse
.L382:
	lw	a4,8(a2)
	lw	a5,12(a2)
	beq	a4,a5,.L387
.L384:
	mv	a0,a3
	tail	luaK_exp2RK
.L380:
	tail	luaK_goiftrue
.L387:
	lw	a5,0(a2)
	li	a4,1
	addi	a5,a5,-5
	bgtu	a5,a4,.L384
	ret
	.size	luaK_infix, .-luaK_infix
	.section	.text.luaK_posfix,"ax",@progbits
	.align	2
	.globl	luaK_posfix
	.hidden	luaK_posfix
	.type	luaK_posfix, @function
luaK_posfix:
	addi	sp,sp,-28
	sw	s1,16(sp)
	sw	ra,24(sp)
	mv	s1,a1
	sw	s0,20(sp)
	li	a1,20
	bgtu	s1,a1,.L388
	mv	t1,a2
	mv	s0,a3
	lla	a2,.L391
	slli	a3,s1,2
	add	a3,a3,a2
	lw	a3,0(a3)
	mv	a5,a0
	add	a3,a3,a2
	jr	a3
	.section	.rodata.luaK_posfix,"a",@progbits
	.align	2
	.align	2
.L391:
	.word	.L395-.L391
	.word	.L395-.L391
	.word	.L395-.L391
	.word	.L395-.L391
	.word	.L395-.L391
	.word	.L395-.L391
	.word	.L395-.L391
	.word	.L395-.L391
	.word	.L395-.L391
	.word	.L395-.L391
	.word	.L395-.L391
	.word	.L395-.L391
	.word	.L394-.L391
	.word	.L393-.L391
	.word	.L393-.L391
	.word	.L393-.L391
	.word	.L393-.L391
	.word	.L393-.L391
	.word	.L393-.L391
	.word	.L392-.L391
	.word	.L390-.L391
	.section	.text.luaK_posfix
.L392:
	mv	a1,s0
	sw	t1,0(sp)
	sw	a0,4(sp)
	call	luaK_dischargevars
	lw	t1,0(sp)
	addi	a1,s0,12
	lw	a2,12(t1)
.L407:
	lw	a5,4(sp)
	mv	a0,a5
	call	luaK_concat
	lw	a2,0(s0)
	lw	a3,4(s0)
	lw	a4,8(s0)
	lw	a5,12(s0)
	lw	t1,0(sp)
	sw	a2,0(t1)
	sw	a3,4(t1)
	sw	a4,8(t1)
	sw	a5,12(t1)
.L388:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L395:
	mv	a2,t1
	mv	a3,s0
	mv	a1,s1
	sw	a4,8(sp)
	sw	t1,4(sp)
	sw	a0,0(sp)
	call	constfolding
	lw	a5,0(sp)
	lw	t1,4(sp)
	lw	a4,8(sp)
	bne	a0,zero,.L388
	mv	a3,s0
	lw	s0,20(sp)
	lw	ra,24(sp)
	addi	a1,s1,13
	lw	s1,16(sp)
	mv	a2,t1
	mv	a0,a5
	addi	sp,sp,28
	tail	codebinexpval
.L393:
	lw	a2,0(t1)
	li	a3,4
	lw	a4,4(t1)
	bne	a2,a3,.L400
	ori	a4,a4,256
.L400:
	mv	a1,s0
	mv	a0,a5
	sw	a4,8(sp)
	sw	t1,4(sp)
	sw	a5,0(sp)
	call	luaK_exp2RK
	lw	t1,4(sp)
	lw	a5,0(sp)
	mv	a3,a0
	mv	a2,s0
	mv	a1,t1
	mv	a0,a5
	mv	s0,a3
	call	freeexps
	li	a3,16
	lw	a5,0(sp)
	lw	t1,4(sp)
	lw	a4,8(sp)
	beq	s1,a3,.L401
	addi	a3,s1,-17
	li	a2,1
	bgtu	a3,a2,.L402
	slli	a1,s0,23
	slli	a4,a4,14
	or	a1,a1,a4
	addi	s1,s1,15
	or	a1,a1,s1
	ori	a1,a1,64
	mv	a0,a5
.L405:
	call	luaK_code
	lw	a5,0(sp)
	li	a4,-1
	li	a1,2147450880
	lw	s0,24(a5)
	addi	a1,a1,30
	sw	a4,24(a5)
	mv	a0,a5
	call	luaK_code
	lw	a5,0(sp)
	mv	a4,a0
	mv	a2,s0
	addi	a1,sp,12
	mv	a0,a5
	sw	a4,12(sp)
	call	luaK_concat
	lw	a5,12(sp)
	lw	t1,4(sp)
	lw	ra,24(sp)
	lw	s0,20(sp)
	sw	a5,4(t1)
	li	a5,11
	sw	a5,0(t1)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L394:
	lw	a2,8(s0)
	lw	a3,12(s0)
	sw	a4,8(sp)
	sw	t1,4(sp)
	sw	a0,0(sp)
	mv	a1,s0
	beq	a2,a3,.L396
	call	luaK_exp2anyreg
	lw	a5,0(sp)
	lw	t1,4(sp)
	lw	a4,8(sp)
.L397:
	lw	a2,0(s0)
	li	a3,12
	bne	a2,a3,.L398
	lw	a2,0(a5)
	lw	a3,4(s0)
	li	a0,29
	lw	a2,48(a2)
	slli	a3,a3,2
	add	a2,a2,a3
	lw	a3,0(a2)
	andi	a1,a3,63
	beq	a1,a0,.L409
.L398:
	mv	a1,s0
	mv	a0,a5
	sw	a4,8(sp)
	sw	t1,4(sp)
	sw	a5,0(sp)
	call	luaK_exp2nextreg
	lw	t1,4(sp)
	lw	a5,0(sp)
	mv	a3,s0
	lw	s0,20(sp)
	lw	a4,8(sp)
	lw	ra,24(sp)
	lw	s1,16(sp)
	mv	a2,t1
	li	a1,29
	mv	a0,a5
	addi	sp,sp,28
	tail	codebinexpval
.L390:
	mv	a1,s0
	sw	t1,0(sp)
	sw	a0,4(sp)
	call	luaK_dischargevars
	lw	t1,0(sp)
	addi	a1,s0,8
	lw	a2,8(t1)
	j	.L407
.L396:
	call	luaK_dischargevars
	lw	a4,8(sp)
	lw	t1,4(sp)
	lw	a5,0(sp)
	j	.L397
.L402:
	slli	a1,a4,23
	slli	s0,s0,14
	or	a1,a1,s0
	addi	s1,s1,18
	or	a1,a1,s1
	sw	t1,4(sp)
	ori	a1,a1,64
.L406:
	mv	a0,a5
	sw	a5,0(sp)
	j	.L405
.L401:
	slli	a4,a4,23
	slli	s0,s0,14
	or	a1,a4,s0
	sw	t1,4(sp)
	ori	a1,a1,31
	j	.L406
.L409:
	lw	a0,0(t1)
	li	a1,7
	lw	a4,4(t1)
	beq	a0,a1,.L410
.L399:
	slli	a5,a3,9
	slli	a4,a4,23
	srli	a5,a5,9
	or	a5,a5,a4
	sw	a5,0(a2)
	lw	a5,4(s0)
	li	a4,12
	sw	a4,0(t1)
	sw	a5,4(t1)
	j	.L388
.L410:
	andi	a1,a4,256
	bne	a1,zero,.L399
	lbu	a1,42(a5)
	bgt	a1,a4,.L399
	lbu	a1,44(a5)
	addi	a1,a1,-1
	sb	a1,44(a5)
	j	.L399
	.size	luaK_posfix, .-luaK_posfix
	.section	.text.luaK_fixline,"ax",@progbits
	.align	2
	.globl	luaK_fixline
	.hidden	luaK_fixline
	.type	luaK_fixline, @function
luaK_fixline:
	lw	a5,0(a0)
	lw	a4,16(a0)
	lw	a5,56(a5)
	slli	a4,a4,2
	add	a5,a5,a4
	sw	a1,-4(a5)
	ret
	.size	luaK_fixline, .-luaK_fixline
	.globl	__divsi3
	.section	.text.luaK_setlist,"ax",@progbits
	.align	2
	.globl	luaK_setlist
	.hidden	luaK_setlist
	.type	luaK_setlist, @function
luaK_setlist:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a1
	mv	s1,a0
	li	a1,50
	addi	a0,a2,-1
	sw	a3,0(sp)
	sw	ra,12(sp)
	call	__divsi3
	lw	a3,0(sp)
	li	a2,-1
	addi	a5,a0,1
	slli	a4,a3,23
	bne	a3,a2,.L413
	li	a4,0
.L413:
	slli	a1,s0,6
	li	a3,511
	or	a1,a1,a4
	bgt	a5,a3,.L414
	slli	a5,a5,14
	or	a1,a5,a1
	mv	a0,s1
	addi	s0,s0,1
	ori	a1,a1,43
	call	luaK_code
	sb	s0,44(s1)
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L414:
	ori	a1,a1,43
	mv	a0,s1
	sw	a5,0(sp)
	call	luaK_code
	lw	a5,0(sp)
	mv	a0,s1
	addi	s0,s0,1
	slli	a1,a5,6
	ori	a1,a1,46
	call	luaK_code
	sb	s0,44(s1)
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	luaK_setlist, .-luaK_setlist
	.section	.rodata.ef.0,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	ef.0, @object
	.size	ef.0, 16
ef.0:
	.word	6
	.word	0
	.word	-1
	.word	-1
	.hidden	luaV_tointeger
	.hidden	luaO_arith
	.hidden	luaP_opmodes
	.hidden	luaX_syntaxerror
	.hidden	luaC_barrier_
	.hidden	luaV_equalobj
	.hidden	luaM_growaux_
	.hidden	luaH_set
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
