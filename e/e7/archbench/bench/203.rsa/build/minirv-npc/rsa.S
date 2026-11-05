#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"rsa.c"
	.option nopic
	.text
	.section	.text.bignum_init,"ax",@progbits
	.align	2
	.globl	bignum_init
	.hidden	bignum_init
	.type	bignum_init, @function
bignum_init:
	addi	sp,sp,-12
	li	a0,12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	malloc
	mv	s0,a0
	li	a5,20
	li	a1,4
	li	a0,20
	sw	zero,0(s0)
	sw	a5,4(s0)
	call	calloc
	sw	a0,8(s0)
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	bignum_init, .-bignum_init
	.section	.text.bignum_deinit,"ax",@progbits
	.align	2
	.globl	bignum_deinit
	.hidden	bignum_deinit
	.type	bignum_deinit, @function
bignum_deinit:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a0
	lw	a0,8(a0)
	sw	ra,8(sp)
	call	free
	mv	a0,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	free
	.size	bignum_deinit, .-bignum_deinit
	.section	.text.bignum_iszero,"ax",@progbits
	.align	2
	.globl	bignum_iszero
	.hidden	bignum_iszero
	.type	bignum_iszero, @function
bignum_iszero:
	lw	a4,0(a0)
	mv	a5,a0
	beq	a4,zero,.L8
	li	a3,1
	li	a0,0
	beq	a4,a3,.L10
	ret
.L8:
	li	a0,1
	ret
.L10:
	lw	a5,8(a5)
	lw	a0,0(a5)
	seqz	a0,a0
	ret
	.size	bignum_iszero, .-bignum_iszero
	.section	.text.bignum_isnonzero,"ax",@progbits
	.align	2
	.globl	bignum_isnonzero
	.hidden	bignum_isnonzero
	.type	bignum_isnonzero, @function
bignum_isnonzero:
	mv	a5,a0
	lw	a0,0(a0)
	beq	a0,zero,.L11
	li	a4,1
	beq	a0,a4,.L17
	li	a0,1
.L11:
	ret
.L17:
	lw	a5,8(a5)
	lw	a0,0(a5)
	snez	a0,a0
	ret
	.size	bignum_isnonzero, .-bignum_isnonzero
	.section	.text.bignum_copy,"ax",@progbits
	.align	2
	.globl	bignum_copy
	.hidden	bignum_copy
	.type	bignum_copy, @function
bignum_copy:
	addi	sp,sp,-12
	lw	a2,0(a0)
	sw	s0,4(sp)
	mv	s0,a1
	lw	a5,4(s0)
	lw	a1,4(a0)
	sw	s1,0(sp)
	sw	ra,8(sp)
	sw	a2,0(s0)
	mv	s1,a0
	lw	a0,8(s0)
	bgt	a1,a5,.L21
	lw	s0,4(sp)
	lw	a1,8(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	slli	a2,a2,2
	addi	sp,sp,12
	tail	memcpy
.L21:
	sw	a1,4(s0)
	slli	a1,a1,2
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	lw	s0,4(sp)
	lw	a1,8(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	slli	a2,a2,2
	addi	sp,sp,12
	tail	memcpy
	.size	bignum_copy, .-bignum_copy
	.section	.text.bignum_fromint,"ax",@progbits
	.align	2
	.globl	bignum_fromint
	.hidden	bignum_fromint
	.type	bignum_fromint, @function
bignum_fromint:
	addi	sp,sp,-12
	lw	a4,4(a0)
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	li	a5,1
	sw	a5,0(a0)
	mv	s0,a0
	mv	s1,a1
	lw	a0,8(a0)
	ble	a4,zero,.L25
	lw	ra,8(sp)
	lw	s0,4(sp)
	sw	s1,0(a0)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L25:
	sw	a5,4(s0)
	li	a1,4
	call	realloc
	sw	a0,8(s0)
	lw	ra,8(sp)
	lw	s0,4(sp)
	sw	s1,0(a0)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	bignum_fromint, .-bignum_fromint
	.section	.text.bignum_equal,"ax",@progbits
	.align	2
	.globl	bignum_equal
	.hidden	bignum_equal
	.type	bignum_equal, @function
bignum_equal:
	mv	a5,a0
	lw	a0,0(a0)
	beq	a0,zero,.L27
	li	a4,1
	beq	a0,a4,.L57
.L28:
	lw	a2,0(a1)
	beq	a2,zero,.L46
.L35:
	li	a4,1
	beq	a2,a4,.L58
	bne	a0,a2,.L46
	addi	a0,a2,-1
	blt	a0,zero,.L43
	lw	a3,8(a1)
.L37:
	lw	a4,8(a5)
	slli	a2,a2,2
	add	a5,a3,a2
	add	a4,a4,a2
	li	a1,-1
	j	.L34
.L59:
	addi	a5,a5,-4
	beq	a0,a1,.L43
.L34:
	lw	a2,-4(a4)
	lw	a3,-4(a5)
	addi	a0,a0,-1
	addi	a4,a4,-4
	beq	a2,a3,.L59
.L46:
	li	a0,0
	ret
.L57:
	lw	a4,8(a5)
	lw	a4,0(a4)
	bne	a4,zero,.L28
.L27:
	lw	a4,0(a1)
	mv	a2,a4
	bne	a4,zero,.L60
.L43:
	li	a0,1
	ret
.L60:
	li	a3,1
	beq	a4,a3,.L61
.L30:
	bne	a0,zero,.L62
	ret
.L61:
	lw	a3,8(a1)
	lw	a3,0(a3)
	beq	a3,zero,.L43
	j	.L30
.L58:
	lw	a3,8(a1)
	lw	a4,0(a3)
	beq	a4,zero,.L46
	bne	a0,a2,.L46
	li	a0,0
	j	.L37
.L62:
	li	a3,1
	bne	a0,a3,.L35
	lw	a3,8(a5)
	lw	a3,0(a3)
	beq	a3,zero,.L46
	mv	a2,a4
	j	.L35
	.size	bignum_equal, .-bignum_equal
	.section	.text.bignum_greater,"ax",@progbits
	.align	2
	.globl	bignum_greater
	.hidden	bignum_greater
	.type	bignum_greater, @function
bignum_greater:
	mv	a2,a0
	lw	a0,0(a0)
	beq	a0,zero,.L64
	li	a5,1
	beq	a0,a5,.L94
.L65:
	lw	a3,0(a1)
	beq	a3,zero,.L81
.L74:
	li	a5,1
	beq	a3,a5,.L95
	bne	a0,a3,.L76
	addi	t1,a3,-1
	blt	t1,zero,.L83
	lw	a4,8(a1)
.L77:
	lw	a2,8(a2)
	slli	a3,a3,2
	add	a5,a4,a3
	add	a4,a2,a3
	li	a2,-1
	j	.L73
.L72:
	addi	a5,a5,-4
	beq	t1,a2,.L83
.L73:
	lw	a0,-4(a4)
	lw	a3,-4(a5)
	addi	t1,t1,-1
	addi	a4,a4,-4
	beq	a0,a3,.L72
	sgtu	a0,a0,a3
	ret
.L94:
	lw	a5,8(a2)
	lw	a5,0(a5)
	bne	a5,zero,.L65
.L64:
	lw	a5,0(a1)
	mv	a3,a5
	bne	a5,zero,.L96
.L83:
	li	a0,0
	ret
.L96:
	li	a4,1
	beq	a5,a4,.L97
.L67:
	bne	a0,zero,.L98
	ret
.L81:
	li	a0,1
	ret
.L97:
	lw	a4,8(a1)
	lw	a4,0(a4)
	beq	a4,zero,.L83
	j	.L67
.L95:
	lw	a4,8(a1)
	lw	a5,0(a4)
	beq	a5,zero,.L81
	li	t1,0
	beq	a0,a3,.L77
.L76:
	sgt	a0,a0,a3
	ret
.L98:
	li	a4,1
	bne	a0,a4,.L74
	lw	a4,8(a2)
	lw	a4,0(a4)
	beq	a4,zero,.L83
	mv	a3,a5
	j	.L74
	.size	bignum_greater, .-bignum_greater
	.section	.text.bignum_less,"ax",@progbits
	.align	2
	.globl	bignum_less
	.hidden	bignum_less
	.type	bignum_less, @function
bignum_less:
	lw	a3,0(a0)
	mv	a4,a0
	beq	a3,zero,.L100
	li	a5,1
	beq	a3,a5,.L133
.L101:
	lw	a0,0(a1)
	beq	a0,zero,.L99
.L110:
	li	a5,1
	beq	a0,a5,.L134
	bne	a3,a0,.L112
	addi	a2,a0,-1
	blt	a2,zero,.L117
	lw	a5,8(a1)
.L113:
	lw	a4,8(a4)
	slli	a0,a0,2
	add	a5,a5,a0
	add	a4,a4,a0
	li	a1,-1
	j	.L109
.L108:
	addi	a5,a5,-4
	beq	a2,a1,.L117
.L109:
	lw	a0,-4(a4)
	lw	a3,-4(a5)
	addi	a2,a2,-1
	addi	a4,a4,-4
	beq	a0,a3,.L108
	sltu	a0,a0,a3
	ret
.L133:
	lw	a5,8(a0)
	lw	a5,0(a5)
	bne	a5,zero,.L101
.L100:
	lw	a0,0(a1)
	mv	a2,a0
	bne	a0,zero,.L135
.L99:
	ret
.L135:
	li	a5,1
	beq	a0,a5,.L136
.L103:
	bne	a3,zero,.L137
	li	a0,1
	ret
.L136:
	lw	a5,8(a1)
	lw	a5,0(a5)
	bne	a5,zero,.L103
.L117:
	li	a0,0
	ret
.L134:
	lw	a5,8(a1)
	lw	a2,0(a5)
	beq	a2,zero,.L117
	li	a2,0
	beq	a3,a0,.L113
.L112:
	slt	a0,a3,a0
	ret
.L137:
	li	a5,1
	bne	a3,a5,.L110
	lw	a5,8(a4)
	li	a0,1
	lw	a5,0(a5)
	beq	a5,zero,.L99
	mv	a0,a2
	j	.L110
	.size	bignum_less, .-bignum_less
	.section	.text.bignum_geq,"ax",@progbits
	.align	2
	.globl	bignum_geq
	.hidden	bignum_geq
	.type	bignum_geq, @function
bignum_geq:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	bignum_less
	lw	ra,8(sp)
	seqz	a0,a0
	addi	sp,sp,12
	jr	ra
	.size	bignum_geq, .-bignum_geq
	.section	.text.bignum_leq,"ax",@progbits
	.align	2
	.globl	bignum_leq
	.hidden	bignum_leq
	.type	bignum_leq, @function
bignum_leq:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	bignum_greater
	lw	ra,8(sp)
	seqz	a0,a0
	addi	sp,sp,12
	jr	ra
	.size	bignum_leq, .-bignum_leq
	.section	.text.bignum_add,"ax",@progbits
	.align	2
	.globl	bignum_add
	.hidden	bignum_add
	.type	bignum_add, @function
bignum_add:
	addi	sp,sp,-20
	sw	s0,12(sp)
	mv	s0,a1
	lw	a3,0(s0)
	lw	a1,0(a2)
	sw	s1,8(sp)
	sw	ra,16(sp)
	mv	s1,a2
	mv	t2,a0
	mv	a2,a3
	blt	a1,a3,.L143
	mv	a2,a1
.L143:
	lw	a5,4(t2)
	ble	a5,a2,.L156
	ble	a2,zero,.L145
	lw	a0,8(t2)
.L152:
	mv	t1,a0
	li	a5,0
	li	a4,0
.L151:
	slli	t0,a5,2
	bge	a5,a3,.L146
	lw	a3,8(s0)
	add	a3,a3,t0
	lw	a3,0(a3)
	add	a4,a4,a3
.L146:
	ble	a1,a5,.L147
	lw	a3,8(s1)
	add	a3,a3,t0
	lw	a3,0(a3)
	add	a4,a4,a3
.L147:
	sw	a4,0(t1)
	lw	a3,0(s0)
	ble	a3,a5,.L148
	lw	a1,8(s0)
	addi	a5,a5,1
	addi	t1,t1,4
	add	a1,a1,t0
	lw	a1,0(a1)
	sgtu	a4,a1,a4
	ble	a2,a5,.L150
.L157:
	lw	a1,0(s1)
	j	.L151
.L148:
	lw	a1,8(s1)
	addi	a5,a5,1
	addi	t1,t1,4
	add	a1,a1,t0
	lw	a1,0(a1)
	sgtu	a4,a1,a4
	bgt	a2,a5,.L157
.L150:
	li	a5,1
	beq	a4,a5,.L158
.L145:
	lw	ra,16(sp)
	lw	s0,12(sp)
	sw	a2,0(t2)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L158:
	lw	ra,16(sp)
	lw	s0,12(sp)
	addi	a5,a2,1
	slli	a2,a2,2
	sw	a5,0(t2)
	add	a0,a0,a2
	sw	a4,0(a0)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L156:
	lw	a0,8(t2)
	addi	a1,a2,1
	sw	a1,4(t2)
	slli	a1,a1,2
	sw	a2,4(sp)
	sw	t2,0(sp)
	call	realloc
	lw	t2,0(sp)
	lw	a2,4(sp)
	sw	a0,8(t2)
	ble	a2,zero,.L145
	lw	a3,0(s0)
	lw	a1,0(s1)
	j	.L152
	.size	bignum_add, .-bignum_add
	.section	.text.bignum_iadd,"ax",@progbits
	.align	2
	.globl	bignum_iadd
	.hidden	bignum_iadd
	.type	bignum_iadd, @function
bignum_iadd:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR0
	mv	a2,a1
	sw	s0,4(sp)
	mv	a1,a0
	mv	s0,a0
	mv	a0,s1
	sw	ra,8(sp)
	call	bignum_add
	lw	a2,0(s1)
	lw	a1,4(s1)
	lw	a5,4(s0)
	sw	a2,0(s0)
	lw	a0,8(s0)
	bgt	a1,a5,.L160
	lw	s0,4(sp)
	lw	a1,8(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	slli	a2,a2,2
	addi	sp,sp,12
	tail	memcpy
.L160:
	sw	a1,4(s0)
	slli	a1,a1,2
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	lw	s0,4(sp)
	lw	a1,8(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	slli	a2,a2,2
	addi	sp,sp,12
	tail	memcpy
	.size	bignum_iadd, .-bignum_iadd
	.section	.text.bignum_subtract,"ax",@progbits
	.align	2
	.globl	bignum_subtract
	.hidden	bignum_subtract
	.type	bignum_subtract, @function
bignum_subtract:
	addi	sp,sp,-16
	sw	s1,4(sp)
	lw	a5,4(a0)
	mv	s1,a1
	lw	a1,0(a1)
	sw	s0,8(sp)
	sw	ra,12(sp)
	mv	t2,a0
	mv	s0,a2
	bgt	a1,a5,.L181
.L164:
	ble	a1,zero,.L170
	lw	a1,8(s1)
	lw	a2,8(t2)
	li	a4,0
	li	a5,0
	li	a3,0
	li	a0,0
	j	.L169
.L182:
	bne	a5,zero,.L172
	lw	t0,8(s0)
	beq	t0,zero,.L167
	add	t0,t0,a4
	lw	a5,0(t0)
	addi	a5,a5,1
	seqz	a5,a5
.L167:
	add	t0,a2,a4
	sw	t1,0(t0)
	addi	a3,a3,1
	beq	t1,zero,.L168
	mv	a0,a3
.L168:
	lw	t1,0(s1)
	addi	a4,a4,4
	ble	t1,a3,.L165
.L169:
	lw	t1,0(s0)
	ble	t1,a3,.L166
	lw	t1,8(s0)
	add	t1,t1,a4
	lw	t1,0(t1)
	add	a5,a5,t1
.L166:
	add	t1,a1,a4
	lw	t0,0(t1)
	sub	t1,t0,a5
	bgeu	t0,a5,.L182
	li	a5,1
	j	.L167
.L172:
	li	a5,0
	j	.L167
.L170:
	li	a0,0
.L165:
	lw	ra,12(sp)
	lw	s0,8(sp)
	sw	a0,0(t2)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L181:
	lw	a0,8(a0)
	sw	a1,4(t2)
	slli	a1,a1,2
	sw	t2,0(sp)
	call	realloc
	lw	t2,0(sp)
	lw	a1,0(s1)
	sw	a0,8(t2)
	j	.L164
	.size	bignum_subtract, .-bignum_subtract
	.section	.text.bignum_isubtract,"ax",@progbits
	.align	2
	.globl	bignum_isubtract
	.hidden	bignum_isubtract
	.type	bignum_isubtract, @function
bignum_isubtract:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR1
	mv	a2,a1
	sw	s0,4(sp)
	mv	a1,a0
	mv	s0,a0
	mv	a0,s1
	sw	ra,8(sp)
	call	bignum_subtract
	lw	a2,0(s1)
	lw	a1,4(s1)
	lw	a5,4(s0)
	sw	a2,0(s0)
	lw	a0,8(s0)
	bgt	a1,a5,.L184
	lw	s0,4(sp)
	lw	a1,8(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	slli	a2,a2,2
	addi	sp,sp,12
	tail	memcpy
.L184:
	sw	a1,4(s0)
	slli	a1,a1,2
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	lw	s0,4(sp)
	lw	a1,8(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	slli	a2,a2,2
	addi	sp,sp,12
	tail	memcpy
	.size	bignum_isubtract, .-bignum_isubtract
	.globl	__muldi3
	.section	.text.bignum_multiply,"ax",@progbits
	.align	2
	.globl	bignum_multiply
	.hidden	bignum_multiply
	.type	bignum_multiply, @function
bignum_multiply:
	lw	a3,0(a1)
	lw	a4,0(a2)
	lw	a5,4(a0)
	addi	sp,sp,-44
	sw	a1,20(sp)
	sw	ra,40(sp)
	sw	s0,36(sp)
	sw	s1,32(sp)
	sw	a2,12(sp)
	sw	a0,28(sp)
	add	a1,a3,a4
	bgt	a1,a5,.L210
	ble	a1,zero,.L189
.L212:
	lw	a5,28(sp)
	lw	a0,20(sp)
	lw	t1,12(sp)
	lw	a2,8(a5)
	li	a5,0
.L190:
	sw	zero,0(a2)
	lw	a3,0(a0)
	lw	a4,0(t1)
	addi	a5,a5,1
	addi	a2,a2,4
	add	a1,a3,a4
	bgt	a1,a5,.L190
	ble	a3,zero,.L191
.L200:
	li	a5,0
	sw	zero,16(sp)
.L192:
	ble	a4,zero,.L211
	lw	a3,20(sp)
	lw	a4,28(sp)
	sw	zero,8(sp)
	lw	s1,8(a3)
	lw	a3,12(sp)
	lw	a4,8(a4)
	add	a2,s1,a5
	lw	s0,8(a3)
	addi	a3,a5,4
	add	s1,a4,a5
	add	a5,a4,a3
	sw	a3,24(sp)
	sw	a2,0(sp)
	sw	a5,4(sp)
.L196:
	lw	a5,0(sp)
	lw	a2,0(s0)
	li	a3,0
	lw	a0,0(a5)
	li	a1,0
	call	__muldi3
	lw	a4,0(s1)
	add	a4,a0,a4
	sltu	a0,a4,a0
	add	a1,a0,a1
	mv	a0,a4
	beq	a1,zero,.L193
	lw	a5,4(sp)
	lw	a3,0(a5)
	mv	a4,a5
	add	a1,a3,a1
	bleu	a3,a1,.L194
	addi	a3,s1,8
	mv	a0,a1
	sub	t1,a3,a5
.L195:
	sw	a0,0(a4)
	lw	a5,0(a3)
	add	a4,a4,t1
	addi	a3,a3,4
	addi	a1,a5,1
	li	a0,0
	bgtu	a5,a1,.L195
.L194:
	lw	a5,0(sp)
	sw	a1,0(a4)
	lw	a2,0(s0)
	lw	a0,0(a5)
	li	a3,0
	li	a1,0
	call	__muldi3
	lw	a4,0(s1)
	add	a0,a0,a4
.L193:
	lw	a5,12(sp)
	sw	a0,0(s1)
	lw	a3,4(sp)
	lw	a4,0(a5)
	lw	a5,8(sp)
	addi	a3,a3,4
	sw	a3,4(sp)
	addi	a5,a5,1
	sw	a5,8(sp)
	addi	s0,s0,4
	addi	s1,s1,4
	bgt	a4,a5,.L196
	lw	a5,20(sp)
	lw	a3,0(a5)
.L198:
	lw	a5,16(sp)
	addi	a2,a5,1
	sw	a2,16(sp)
	lw	a5,24(sp)
	bgt	a3,a2,.L192
	add	a1,a3,a4
.L191:
	ble	a1,zero,.L199
	lw	a5,28(sp)
	slli	a4,a1,2
	lw	a5,8(a5)
	add	a5,a5,a4
	lw	a5,-4(a5)
	seqz	a5,a5
	sub	a1,a1,a5
.L199:
	lw	a5,28(sp)
	lw	ra,40(sp)
	lw	s0,36(sp)
	sw	a1,0(a5)
	lw	s1,32(sp)
	addi	sp,sp,44
	jr	ra
.L211:
	addi	a5,a5,4
	sw	a5,24(sp)
	j	.L198
.L210:
	mv	s0,a0
	lw	a0,8(a0)
	sw	a1,4(s0)
	slli	a1,a1,2
	call	realloc
	lw	a5,12(sp)
	lw	a4,0(a5)
	lw	a5,20(sp)
	lw	a3,0(a5)
	sw	a0,8(s0)
	add	a1,a4,a3
	bgt	a1,zero,.L212
.L189:
	bgt	a3,zero,.L200
	j	.L199
	.size	bignum_multiply, .-bignum_multiply
	.section	.text.bignum_imultiply,"ax",@progbits
	.align	2
	.globl	bignum_imultiply
	.hidden	bignum_imultiply
	.type	bignum_imultiply, @function
bignum_imultiply:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR2
	mv	a2,a1
	sw	s0,4(sp)
	mv	a1,a0
	mv	s0,a0
	mv	a0,s1
	sw	ra,8(sp)
	call	bignum_multiply
	lw	a2,0(s1)
	lw	a1,4(s1)
	lw	a5,4(s0)
	sw	a2,0(s0)
	lw	a0,8(s0)
	bgt	a1,a5,.L214
	lw	s0,4(sp)
	lw	a1,8(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	slli	a2,a2,2
	addi	sp,sp,12
	tail	memcpy
.L214:
	sw	a1,4(s0)
	slli	a1,a1,2
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	lw	s0,4(sp)
	lw	a1,8(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	slli	a2,a2,2
	addi	sp,sp,12
	tail	memcpy
	.size	bignum_imultiply, .-bignum_imultiply
	.section	.text.bignum_fromstring,"ax",@progbits
	.align	2
	.globl	bignum_fromstring
	.hidden	bignum_fromstring
	.type	bignum_fromstring, @function
bignum_fromstring:
	lbu	a4,0(a1)
	beq	a4,zero,.L230
	addi	sp,sp,-16
	sw	s1,4(sp)
	sw	ra,12(sp)
	sw	s0,8(sp)
	mv	s1,a0
	li	a3,0
.L218:
	mv	a0,a3
	addi	a3,a3,1
	add	a2,a1,a3
	lbu	a2,0(a2)
	bne	a2,zero,.L218
	addi	s0,a1,1
	add	a5,s0,a0
	sw	a5,0(sp)
	j	.L219
.L223:
	lla	a5,.LANCHOR0
	lw	a1,8(a5)
	slli	a2,a2,2
	call	memcpy
	lw	a5,0(sp)
	lla	a2,.LANCHOR3+120
	mv	a1,s1
	lla	a0,.LANCHOR2
	beq	s0,a5,.L233
	call	bignum_multiply
	lla	a5,.LANCHOR2
	lw	a2,0(a5)
	lw	a4,4(a5)
	lw	a3,4(s1)
	sw	a2,0(s1)
	lw	a0,8(s1)
	bgt	a4,a3,.L220
.L221:
	lla	a5,.LANCHOR2
	lw	a1,8(a5)
	slli	a2,a2,2
	addi	s0,s0,1
	call	memcpy
	lbu	a4,-1(s0)
.L219:
	addi	a4,a4,-48
	slli	a2,a4,1
	add	a2,a2,a4
	lla	a5,.LANCHOR3
	slli	a2,a2,2
	add	a2,a5,a2
	lla	a0,.LANCHOR0
	mv	a1,s1
	call	bignum_add
	lla	a5,.LANCHOR0
	lw	a2,0(a5)
	lw	a4,4(a5)
	lw	a3,4(s1)
	sw	a2,0(s1)
	lw	a0,8(s1)
	ble	a4,a3,.L223
	slli	a1,a4,2
	sw	a4,4(s1)
	call	realloc
	lw	a2,0(s1)
	sw	a0,8(s1)
	j	.L223
.L220:
	slli	a1,a4,2
	sw	a4,4(s1)
	call	realloc
	lw	a2,0(s1)
	sw	a0,8(s1)
	j	.L221
.L233:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L230:
	ret
	.size	bignum_fromstring, .-bignum_fromstring
	.globl	__udivdi3
	.globl	__umoddi3
	.section	.text.bignum_divide.part.0,"ax",@progbits
	.align	2
	.type	bignum_divide.part.0, @function
bignum_divide.part.0:
	lw	a5,0(a2)
	addi	sp,sp,-88
	sw	ra,84(sp)
	sw	s0,80(sp)
	sw	s1,76(sp)
	sw	a2,68(sp)
	sw	a5,8(sp)
	sw	a0,24(sp)
	sw	a1,64(sp)
	sw	a3,60(sp)
	beq	a5,zero,.L235
	mv	a4,a5
	li	a5,1
	beq	a4,a5,.L326
.L236:
	lw	a5,60(sp)
	lw	a4,24(sp)
	lw	a3,0(a5)
	li	a5,1
	lw	a4,4(a4)
	sw	a3,16(sp)
	beq	a3,a5,.L327
	lw	a2,8(sp)
	lw	a3,16(sp)
	addi	a5,a2,1
	sw	a5,28(sp)
	sub	a5,a5,a3
	sw	a5,20(sp)
	bgt	a5,a4,.L328
.L246:
	lw	a5,68(sp)
	lla	a3,.LANCHOR4
	lw	a4,4(a3)
	lw	a5,4(a5)
	sw	a2,0(a3)
	lw	a0,8(a3)
	bgt	a5,a4,.L329
.L247:
	lw	a5,68(sp)
	slli	a2,a2,2
	lw	a1,8(a5)
	call	memcpy
	lw	a5,60(sp)
	lla	a3,.LANCHOR5
	lw	a4,4(a3)
	lw	a2,0(a5)
	lw	a5,4(a5)
	sw	a2,0(a3)
	bgt	a5,a4,.L248
	lw	a0,8(a3)
.L249:
	lw	a5,60(sp)
	slli	a2,a2,2
	lw	a1,8(a5)
	call	memcpy
	lla	a4,.LANCHOR5
	lw	a5,0(a4)
	li	a3,1073741824
	addi	a3,a3,-1
	lw	a4,8(a4)
	add	a5,a5,a3
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a3,0(sp)
	blt	a5,zero,.L296
	li	a5,1
	sw	a5,4(sp)
	sw	zero,12(sp)
	lla	s1,.LANCHOR2
	j	.L253
.L331:
	lw	a0,8(a3)
.L252:
	lw	a1,8(s1)
	slli	a2,a2,2
	call	memcpy
	lla	a4,.LANCHOR5
	lw	a5,0(a4)
	lw	a3,0(sp)
	lw	a4,8(a4)
	add	a5,a5,a3
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	blt	a5,zero,.L330
.L253:
	lw	a4,12(sp)
	lw	a5,4(sp)
	lla	a2,.LANCHOR3+24
	slli	s0,a4,1
	srli	a5,a5,31
	lla	a1,.LANCHOR5
	lla	a0,.LANCHOR2
	or	s0,a5,s0
	call	bignum_multiply
	lw	a1,4(sp)
	lla	a3,.LANCHOR5
	lw	a2,0(s1)
	lw	a5,4(s1)
	lw	a4,4(a3)
	slli	a1,a1,1
	sw	a2,0(a3)
	sw	a1,4(sp)
	sw	s0,12(sp)
	ble	a5,a4,.L331
	lla	a4,.LANCHOR5
	lw	a0,8(a4)
	slli	a1,a5,2
	sw	a5,4(a4)
	call	realloc
	lla	a5,.LANCHOR5
	lw	a2,0(a5)
	sw	a0,8(a5)
	j	.L252
.L326:
	lw	a5,8(a2)
	lw	a5,0(a5)
	bne	a5,zero,.L236
.L235:
	lw	a3,64(sp)
	lw	a5,24(sp)
	lw	a4,4(a3)
	sw	zero,0(a5)
	li	a5,1
	sw	a5,0(a3)
	lw	a0,8(a3)
	ble	a4,zero,.L332
.L239:
	lw	ra,84(sp)
	lw	s0,80(sp)
	sw	zero,0(a0)
	lw	s1,76(sp)
	addi	sp,sp,88
	jr	ra
.L332:
	sw	a5,4(a3)
	li	a1,4
	mv	s0,a3
	call	realloc
	sw	a0,8(s0)
	j	.L239
.L248:
	lla	s0,.LANCHOR5
	lw	a0,8(s0)
	slli	a1,a5,2
	sw	a5,4(s0)
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	j	.L249
.L329:
	slli	a1,a5,2
	mv	s0,a3
	sw	a5,4(a3)
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	j	.L247
.L328:
	lw	s0,24(sp)
	slli	a1,a5,2
	lw	a0,8(s0)
	sw	a5,4(s0)
	call	realloc
	lw	a5,68(sp)
	lw	a2,0(a5)
	sw	a0,8(s0)
	j	.L246
.L330:
	bne	s0,zero,.L299
	lw	a4,4(sp)
	li	a5,1
	bgtu	a4,a5,.L299
.L250:
	lla	a3,.LANCHOR4
	lw	a5,0(a3)
	lw	a4,28(sp)
	beq	a4,a5,.L258
	lw	a4,4(a3)
	addi	a5,a5,1
	sw	a5,0(a3)
	lw	a0,8(a3)
	bgt	a5,a4,.L333
.L259:
	lw	a5,8(sp)
	slli	a5,a5,2
	add	a0,a0,a5
	sw	zero,0(a0)
.L258:
	lw	a5,20(sp)
	addi	a4,a5,-1
	sw	a4,8(sp)
	blt	a4,zero,.L260
	lw	a3,16(sp)
	slli	a5,a3,2
	addi	a2,a5,-4
	add	a4,a3,a4
	sw	a2,52(sp)
	addi	a2,a5,-8
	addi	a5,a5,4
	addi	a3,a3,1
	sw	a5,72(sp)
	slli	a5,a4,2
	sw	a2,56(sp)
	sw	a3,48(sp)
	sw	a5,28(sp)
.L287:
	lla	a5,.LANCHOR4
	lw	t1,8(a5)
	lw	a4,28(sp)
	lla	a5,.LANCHOR5
	lw	s0,8(a5)
	lw	a3,52(sp)
	add	a5,t1,a4
	sw	a4,20(sp)
	addi	a4,a4,-4
	sw	a4,28(sp)
	add	a4,t1,a4
	lw	a5,0(a5)
	lw	a4,0(a4)
	add	a3,s0,a3
	lw	a2,0(a3)
	mv	a0,a4
	mv	a1,a5
	li	a3,0
	sw	t1,40(sp)
	sw	a4,36(sp)
	sw	a5,32(sp)
	sw	a2,0(sp)
	call	__udivdi3
	lw	a5,32(sp)
	lw	a4,36(sp)
	lw	t1,40(sp)
	mv	t0,a1
	mv	s1,a0
	beq	a1,zero,.L261
	li	s1,-1
	li	t0,0
.L261:
	lw	a2,0(sp)
	li	a3,0
	mv	a0,a4
	mv	a1,a5
	sw	t0,44(sp)
	sw	t1,40(sp)
	call	__umoddi3
	lw	a4,56(sp)
	mv	a5,a0
	li	a3,0
	add	a4,s0,a4
	lw	a2,0(a4)
	mv	s0,a1
	mv	a0,s1
	li	a1,0
	sw	a2,36(sp)
	sw	a5,32(sp)
	call	__muldi3
	lw	a5,20(sp)
	lw	t1,40(sp)
	lw	a2,36(sp)
	lw	t0,44(sp)
	add	t1,t1,a5
	lw	a5,-8(t1)
	mv	a4,a0
	mv	a3,a1
	sw	a5,40(sp)
	lw	a5,32(sp)
	lw	a0,0(sp)
	sw	a2,0(sp)
	mv	t1,a5
.L263:
	lw	a1,0(sp)
	add	a2,a5,a0
	sltu	a5,a2,a5
	sub	a1,a4,a1
	seqz	ra,s1
	sgtu	t2,a1,a4
	add	s0,a5,s0
	bleu	a3,t1,.L334
.L266:
	addi	s1,s1,-1
	sub	t0,t0,ra
	mv	a5,a2
	mv	a4,a1
	sub	a3,a3,t2
	add	t1,t1,a0
	beq	s0,zero,.L263
.L264:
	lla	a3,.LANCHOR7
	lw	a4,8(a3)
	snez	a5,t0
	addi	a5,a5,1
	sw	s1,0(a4)
	sw	t0,4(a4)
	mv	a2,a3
	lla	a1,.LANCHOR5
	lla	a0,.LANCHOR8
	sw	a5,0(a3)
	call	bignum_multiply
	lla	a5,.LANCHOR9
	lw	a5,4(a5)
	lw	a4,16(sp)
	sw	s1,0(sp)
	bge	a4,a5,.L335
	la a5, .LANCHOR9; sw zero, 0(a5);
	lw	a5,16(sp)
	blt	a5,zero,.L336
.L270:
	lla	a5,.LANCHOR4
	lw	a4,8(a5)
	lla	a5,.LANCHOR9
	lw	a3,8(a5)
	lw	a5,8(sp)
	lw	a1,48(sp)
	slli	s0,a5,2
	add	a4,a4,s0
	li	a5,0
.L274:
	lw	a2,0(a4)
	addi	a5,a5,1
	addi	a4,a4,4
	sw	a2,0(a3)
	beq	a2,zero,.L273
	lla	a2,.LANCHOR9
	sw	a5,0(a2)
.L273:
	addi	a3,a3,4
	bne	a1,a5,.L274
.L275:
	lla	a1,.LANCHOR8
	lla	a0,.LANCHOR9
	call	bignum_less
	bne	a0,zero,.L337
.L272:
	lla	a2,.LANCHOR8
	lla	a1,.LANCHOR9
	lla	a0,.LANCHOR1
	call	bignum_subtract
	lla	a5,.LANCHOR1
	lw	a2,0(a5)
	lla	a3,.LANCHOR9
	lw	a5,4(a5)
	lw	a4,4(a3)
	sw	a2,0(a3)
	bgt	a5,a4,.L278
	lw	a0,8(a3)
.L279:
	lla	a5,.LANCHOR1
	lw	a1,8(a5)
	slli	a2,a2,2
	call	memcpy
	lla	a4,.LANCHOR9
	lw	a2,0(a4)
	ble	a2,zero,.L280
	lla	a5,.LANCHOR4
	lw	a5,8(a5)
	lw	a3,8(a4)
	li	a4,0
	add	a5,a5,s0
.L281:
	lw	a2,0(a3)
	addi	a4,a4,1
	addi	a3,a3,4
	sw	a2,0(a5)
	lla	a2,.LANCHOR9
	lw	a2,0(a2)
	addi	a5,a5,4
	blt	a4,a2,.L281
.L280:
	lw	a5,16(sp)
	blt	a5,a2,.L286
	lw	a4,8(sp)
	lla	a5,.LANCHOR4
	lw	a5,8(a5)
	lw	a3,20(sp)
	add	a2,a2,a4
	slli	a2,a2,2
	addi	a4,a5,4
	add	a4,a4,a3
	add	a5,a5,a2
.L285:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a4,a5,.L285
.L286:
	lw	a5,24(sp)
	lw	a3,0(sp)
	lw	a5,8(a5)
	add	a4,a5,s0
	sw	a3,0(a4)
	beq	a3,zero,.L284
	lw	a4,24(sp)
	lw	a3,8(sp)
	sw	a3,0(a4)
.L284:
	lw	a4,8(sp)
	addi	a4,a4,-1
	mv	a3,a4
	sw	a4,8(sp)
	li	a4,-1
	bne	a3,a4,.L287
.L288:
	lw	a4,68(sp)
	lw	a3,60(sp)
	lw	a4,0(a4)
	lw	a3,0(a3)
	sub	a4,a4,a3
	slli	a3,a4,2
	add	a5,a5,a3
	lw	a5,0(a5)
	snez	a5,a5
	add	a4,a4,a5
	lw	a5,24(sp)
	sw	a4,0(a5)
	lla	a5,.LANCHOR4
	lw	s0,0(a5)
	ble	s0,zero,.L298
	lw	t1,8(a5)
	slli	a5,s0,2
	mv	a4,s0
	li	s1,0
	add	s0,t1,a5
	sw	zero,16(sp)
	mv	a5,s1
	mv	s1,s0
	mv	s0,a4
.L292:
	lw	t0,-4(s1)
	lw	a2,4(sp)
	lw	a3,12(sp)
	mv	a1,a5
	mv	a0,t0
	sw	a5,8(sp)
	sw	t0,0(sp)
	call	__udivdi3
	lw	a5,8(sp)
	lw	t0,0(sp)
	mv	a4,a0
	sw	a4,-4(s1)
	lw	a2,4(sp)
	lw	a3,12(sp)
	mv	a1,a5
	mv	a0,t0
	beq	a4,zero,.L291
	lw	a5,16(sp)
	bne	a5,zero,.L291
	sw	s0,16(sp)
.L291:
	call	__umoddi3
	addi	s0,s0,-1
	mv	a5,a0
	addi	s1,s1,-4
	bne	s0,zero,.L292
.L290:
	lw	a4,64(sp)
	lw	a2,16(sp)
	lla	a3,.LANCHOR4
	lw	a1,4(a3)
	lw	a5,4(a4)
	sw	a2,0(a3)
	sw	a2,0(a4)
	lw	a0,8(a4)
	bgt	a1,a5,.L338
.L293:
	lla	a5,.LANCHOR4
	lw	a1,8(a5)
	lw	s0,80(sp)
	lw	a5,16(sp)
	lw	ra,84(sp)
	lw	s1,76(sp)
	slli	a2,a5,2
	addi	sp,sp,88
	tail	memcpy
.L334:
	bne	a3,t1,.L264
	lw	a5,40(sp)
	bgtu	a4,a5,.L266
	j	.L264
.L278:
	lla	s1,.LANCHOR9
	lw	a0,8(s1)
	slli	a1,a5,2
	sw	a5,4(s1)
	call	realloc
	lw	a2,0(s1)
	sw	a0,8(s1)
	j	.L279
.L337:
	lla	a4,.LANCHOR0
	lla	a2,.LANCHOR5
	lla	a1,.LANCHOR9
	mv	a0,a4
	call	bignum_add
	lla	a4,.LANCHOR0
	lla	a1,.LANCHOR9
	lw	a2,0(a4)
	lw	a5,4(a4)
	lw	a3,4(a1)
	sw	a2,0(a1)
	bgt	a5,a3,.L276
	lw	a0,8(a1)
.L277:
	lw	a1,8(a4)
	slli	a2,a2,2
	call	memcpy
	addi	a5,s1,-1
	sw	a5,0(sp)
	j	.L272
.L335:
	lla	s0,.LANCHOR9
	lw	a5,48(sp)
	lw	a0,8(s0)
	lw	a1,72(sp)
	sw	a5,4(s0)
	call	realloc
	la a5, .LANCHOR9; sw zero, 0(a5);
	lw	a5,16(sp)
	sw	a0,8(s0)
	bge	a5,zero,.L270
.L336:
	lw	a5,8(sp)
	slli	s0,a5,2
	j	.L275
.L276:
	lla	a4,.LANCHOR9
	lw	a0,8(a4)
	slli	a1,a5,2
	sw	a5,4(a4)
	call	realloc
	lla	a5,.LANCHOR9
	lw	a2,0(a5)
	sw	a0,8(a5)
	lla	a4,.LANCHOR0
	j	.L277
.L327:
	lw	a5,8(sp)
	bgt	a5,a4,.L339
.L241:
	lw	s0,8(sp)
	ble	s0,zero,.L294
	lw	a4,68(sp)
	lw	a5,60(sp)
	sw	zero,16(sp)
	lw	s1,8(a4)
	lw	a4,24(sp)
	lw	a5,8(a5)
	lw	a4,8(a4)
	lw	a2,0(a5)
	sw	a5,12(sp)
	slli	a5,s0,2
	add	s1,s1,a5
	add	a5,a4,a5
	sw	a5,0(sp)
	li	a5,0
.L244:
	lw	t1,-4(s1)
	li	a3,0
	mv	a1,a5
	mv	a0,t1
	sw	a5,8(sp)
	sw	t1,4(sp)
	call	__udivdi3
	lw	a5,8(sp)
	lw	t1,4(sp)
	mv	a4,a0
	mv	a1,a5
	lw	a5,0(sp)
	li	a3,0
	mv	a0,t1
	sw	a4,-4(a5)
	beq	a4,zero,.L243
	lw	a5,16(sp)
	bne	a5,zero,.L243
	sw	s0,16(sp)
.L243:
	lw	a5,12(sp)
	addi	s0,s0,-1
	addi	s1,s1,-4
	lw	a2,0(a5)
	sw	a2,4(sp)
	call	__umoddi3
	lw	a4,0(sp)
	lw	a2,4(sp)
	mv	a5,a0
	addi	a4,a4,-4
	sw	a4,0(sp)
	bne	s0,zero,.L244
.L242:
	lw	a2,64(sp)
	li	a4,1
	lw	a3,4(a2)
	sw	a4,0(a2)
	lw	a0,8(a2)
	ble	a3,zero,.L340
.L245:
	lw	a4,16(sp)
	sw	a5,0(a0)
	lw	a5,24(sp)
	lw	ra,84(sp)
	lw	s0,80(sp)
	sw	a4,0(a5)
	lw	s1,76(sp)
	addi	sp,sp,88
	jr	ra
.L299:
	lla	s0,.LANCHOR6
	lw	a4,4(s0)
	li	a5,1
	sw	a5,0(s0)
	lw	a0,8(s0)
	ble	a4,zero,.L341
.L255:
	lw	a5,4(sp)
	lla	a2,.LANCHOR6
	lla	a1,.LANCHOR4
	sw	a5,0(a0)
	lla	a0,.LANCHOR2
	call	bignum_multiply
	lla	a3,.LANCHOR4
	lw	a2,0(s1)
	lw	a5,4(s1)
	lw	a4,4(a3)
	sw	a2,0(a3)
	bgt	a5,a4,.L256
	lw	a0,8(a3)
.L257:
	lw	a1,8(s1)
	slli	a2,a2,2
	call	memcpy
	j	.L250
.L338:
	sw	a1,4(a4)
	slli	a1,a1,2
	mv	s0,a4
	call	realloc
	lw	a4,0(s0)
	sw	a0,8(s0)
	sw	a4,16(sp)
	j	.L293
.L333:
	slli	a1,a5,2
	mv	s0,a3
	sw	a5,4(a3)
	call	realloc
	sw	a0,8(s0)
	j	.L259
.L339:
	lw	s0,24(sp)
	slli	a1,a5,2
	lw	a0,8(s0)
	sw	a5,4(s0)
	call	realloc
	lw	a5,68(sp)
	lw	a5,0(a5)
	sw	a0,8(s0)
	sw	a5,8(sp)
	j	.L241
.L256:
	lla	s0,.LANCHOR4
	lw	a0,8(s0)
	slli	a1,a5,2
	sw	a5,4(s0)
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	j	.L257
.L340:
	sw	a4,4(a2)
	li	a1,4
	sw	a5,0(sp)
	mv	s0,a2
	call	realloc
	lw	a5,0(sp)
	sw	a0,8(s0)
	j	.L245
.L260:
	lw	a5,24(sp)
	lw	a5,8(a5)
	j	.L288
.L296:
	li	a5,1
	sw	a5,4(sp)
	sw	zero,12(sp)
	j	.L250
.L298:
	sw	zero,16(sp)
	j	.L290
.L341:
	li	a1,4
	sw	a5,4(s0)
	call	realloc
	sw	a0,8(s0)
	j	.L255
.L294:
	sw	zero,16(sp)
	li	a5,0
	j	.L242
	.size	bignum_divide.part.0, .-bignum_divide.part.0
	.section	.text.bignum_remainder,"ax",@progbits
	.align	2
	.globl	bignum_remainder
	.hidden	bignum_remainder
	.type	bignum_remainder, @function
bignum_remainder:
	lla	a5,.LANCHOR7
	lw	a4,8(a5)
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s0,a0
	mv	a3,a1
	mv	s1,a2
	beq	a4,zero,.L348
.L343:
	mv	a1,a3
	mv	a0,s0
	sw	a3,0(sp)
	call	bignum_less
	lw	a3,0(sp)
	bne	a0,zero,.L349
	mv	a2,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	mv	a1,s1
	lw	s1,4(sp)
	lla	a0,.LANCHOR10
	addi	sp,sp,16
	tail	bignum_divide.part.0
.L349:
	la a5, .LANCHOR10; sw zero, 0(a5);
	lw	a2,0(s0)
	lw	a1,4(s0)
	lw	a5,4(s1)
	sw	a2,0(s1)
	lw	a0,8(s1)
	bgt	a1,a5,.L350
	lw	a1,8(s0)
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	slli	a2,a2,2
	addi	sp,sp,16
	tail	memcpy
.L348:
	lla	t1,.LANCHOR3
	lw	a2,0(t1)
	lw	t0,4(t1)
	lw	a1,4(a5)
	sw	a2,0(a5)
	bgt	t0,a1,.L351
.L344:
	lw	a1,8(t1)
	slli	a2,a2,2
	mv	a0,a4
	sw	a3,0(sp)
	call	memcpy
	lw	a3,0(sp)
	j	.L343
.L350:
	sw	a1,4(s1)
	slli	a1,a1,2
	call	realloc
	sw	a0,8(s1)
	lw	a2,0(s1)
	lw	a1,8(s0)
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	slli	a2,a2,2
	addi	sp,sp,16
	tail	memcpy
.L351:
	slli	a1,t0,2
	li	a0,0
	sw	a3,0(sp)
	sw	t0,4(a5)
	call	realloc
	lla	a5,.LANCHOR7
	lw	a2,0(a5)
	lw	a3,0(sp)
	mv	a4,a0
	sw	a0,8(a5)
	lla	t1,.LANCHOR3
	j	.L344
	.size	bignum_remainder, .-bignum_remainder
	.section	.text.bignum_divide,"ax",@progbits
	.align	2
	.globl	bignum_divide
	.hidden	bignum_divide
	.type	bignum_divide, @function
bignum_divide:
	lla	a4,.LANCHOR7
	lw	t1,8(a4)
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	sw	a0,0(sp)
	mv	s1,a1
	mv	s0,a2
	beq	t1,zero,.L358
.L353:
	mv	a1,a3
	mv	a0,s0
	sw	a3,4(sp)
	call	bignum_less
	lw	a3,4(sp)
	bne	a0,zero,.L359
	mv	a2,s0
	lw	s0,12(sp)
	lw	a0,0(sp)
	lw	ra,16(sp)
	mv	a1,s1
	lw	s1,8(sp)
	addi	sp,sp,20
	tail	bignum_divide.part.0
.L359:
	lw	a5,0(sp)
	lw	a1,4(s0)
	lw	a4,4(s1)
	sw	zero,0(a5)
	lw	a2,0(s0)
	lw	a0,8(s1)
	sw	a2,0(s1)
	bgt	a1,a4,.L360
	lw	a1,8(s0)
	lw	s0,12(sp)
	lw	ra,16(sp)
	lw	s1,8(sp)
	slli	a2,a2,2
	addi	sp,sp,20
	tail	memcpy
.L358:
	lla	t0,.LANCHOR3
	lw	a2,0(t0)
	lw	t2,4(t0)
	lw	a1,4(a4)
	sw	a2,0(a4)
	bgt	t2,a1,.L361
.L354:
	lw	a1,8(t0)
	slli	a2,a2,2
	mv	a0,t1
	sw	a3,4(sp)
	call	memcpy
	lw	a3,4(sp)
	j	.L353
.L360:
	sw	a1,4(s1)
	slli	a1,a1,2
	call	realloc
	sw	a0,8(s1)
	lw	a2,0(s1)
	lw	a1,8(s0)
	lw	s0,12(sp)
	lw	ra,16(sp)
	lw	s1,8(sp)
	slli	a2,a2,2
	addi	sp,sp,20
	tail	memcpy
.L361:
	slli	a1,t2,2
	li	a0,0
	sw	a3,4(sp)
	sw	t2,4(a4)
	call	realloc
	lla	a4,.LANCHOR7
	lw	a2,0(a4)
	lw	a3,4(sp)
	mv	t1,a0
	sw	a0,8(a4)
	lla	t0,.LANCHOR3
	j	.L354
	.size	bignum_divide, .-bignum_divide
	.section	.text.bignum_idivide,"ax",@progbits
	.align	2
	.globl	bignum_idivide
	.hidden	bignum_idivide
	.type	bignum_idivide, @function
bignum_idivide:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR12
	mv	a2,a0
	sw	s0,4(sp)
	mv	a3,a1
	mv	s0,a0
	lla	a1,.LANCHOR11
	mv	a0,s1
	sw	ra,8(sp)
	call	bignum_divide
	lw	a2,0(s1)
	lw	a1,4(s1)
	lw	a5,4(s0)
	sw	a2,0(s0)
	lw	a0,8(s0)
	bgt	a1,a5,.L363
	lw	s0,4(sp)
	lw	a1,8(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	slli	a2,a2,2
	addi	sp,sp,12
	tail	memcpy
.L363:
	sw	a1,4(s0)
	slli	a1,a1,2
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	lw	s0,4(sp)
	lw	a1,8(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	slli	a2,a2,2
	addi	sp,sp,12
	tail	memcpy
	.size	bignum_idivide, .-bignum_idivide
	.section	.text.bignum_idivider,"ax",@progbits
	.align	2
	.globl	bignum_idivider
	.hidden	bignum_idivider
	.type	bignum_idivider, @function
bignum_idivider:
	addi	sp,sp,-12
	lla	a5,.LANCHOR14
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	mv	a3,a1
	mv	s1,a2
	lla	a1,.LANCHOR13
	mv	a2,a0
	mv	a0,a5
	sw	ra,8(sp)
	call	bignum_divide
	lla	a5,.LANCHOR14
	lw	a2,0(a5)
	lw	a1,4(a5)
	lw	a4,4(s0)
	sw	a2,0(s0)
	lw	a0,8(s0)
	bgt	a1,a4,.L367
.L368:
	lw	a1,8(a5)
	slli	a2,a2,2
	lla	s0,.LANCHOR13
	call	memcpy
	lw	a2,0(s0)
	lw	a1,4(s0)
	lw	a5,4(s1)
	sw	a2,0(s1)
	lw	a0,8(s1)
	bgt	a1,a5,.L369
	lw	a1,8(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	slli	a2,a2,2
	addi	sp,sp,12
	tail	memcpy
.L367:
	sw	a1,4(s0)
	slli	a1,a1,2
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	lla	a5,.LANCHOR14
	j	.L368
.L369:
	sw	a1,4(s1)
	slli	a1,a1,2
	call	realloc
	sw	a0,8(s1)
	lw	a2,0(s1)
	lw	a1,8(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	slli	a2,a2,2
	addi	sp,sp,12
	tail	memcpy
	.size	bignum_idivider, .-bignum_idivider
	.section	.text.bignum_imodulate,"ax",@progbits
	.align	2
	.globl	bignum_imodulate
	.hidden	bignum_imodulate
	.type	bignum_imodulate, @function
bignum_imodulate:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR15
	mv	a2,a0
	sw	s0,4(sp)
	mv	a3,a1
	mv	s0,a0
	mv	a1,s1
	lla	a0,.LANCHOR16
	sw	ra,8(sp)
	call	bignum_divide
	lw	a2,0(s1)
	lw	a1,4(s1)
	lw	a5,4(s0)
	sw	a2,0(s0)
	lw	a0,8(s0)
	bgt	a1,a5,.L373
	lw	s0,4(sp)
	lw	a1,8(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	slli	a2,a2,2
	addi	sp,sp,12
	tail	memcpy
.L373:
	sw	a1,4(s0)
	slli	a1,a1,2
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	lw	s0,4(sp)
	lw	a1,8(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	slli	a2,a2,2
	addi	sp,sp,12
	tail	memcpy
	.size	bignum_imodulate, .-bignum_imodulate
	.section	.rodata.bignum_print.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"0"
	.align	2
.LC1:
	.string	"%d"
	.section	.text.bignum_print,"ax",@progbits
	.align	2
	.globl	bignum_print
	.hidden	bignum_print
	.type	bignum_print, @function
bignum_print:
	addi	sp,sp,-24
	sw	s1,12(sp)
	mv	s1,a0
	li	a0,100
	sw	ra,20(sp)
	sw	s0,16(sp)
	call	malloc
	lw	a2,0(s1)
	sw	a0,0(sp)
	beq	a2,zero,.L377
	li	a5,1
	beq	a2,a5,.L406
.L378:
	lla	a4,.LANCHOR17
	lw	a5,4(s1)
	lw	a3,4(a4)
	sw	a2,0(a4)
	lw	a0,8(a4)
	bgt	a5,a3,.L407
	lw	a1,8(s1)
	slli	a2,a2,2
	call	memcpy
	lla	a4,.LANCHOR17
	lw	a3,0(a4)
	beq	a3,zero,.L380
.L411:
	li	a5,100
	sw	a5,4(sp)
	li	a2,1
	li	s0,0
	lla	s1,.LANCHOR14
	beq	a3,a2,.L408
.L383:
	lla	a3,.LANCHOR3+120
	lla	a2,.LANCHOR17
	lla	a1,.LANCHOR13
	lla	a0,.LANCHOR14
	call	bignum_divide
	lla	a4,.LANCHOR17
	lw	a2,0(s1)
	lw	a3,4(s1)
	lw	a1,4(a4)
	sw	a2,0(a4)
	lw	a0,8(a4)
	bgt	a3,a1,.L385
.L386:
	lw	a1,8(s1)
	slli	a2,a2,2
	call	memcpy
	lla	t1,.LANCHOR13
	lla	a3,.LANCHOR18
	lw	a2,0(t1)
	lw	t0,4(t1)
	lw	a1,4(a3)
	sw	a2,0(a3)
	lw	a0,8(a3)
	bgt	t0,a1,.L387
.L388:
	lw	a1,8(t1)
	slli	a2,a2,2
	call	memcpy
	lla	a3,.LANCHOR18
	lw	a1,8(a3)
	lw	a5,0(sp)
	addi	a2,s0,1
	lw	a1,0(a1)
	add	a3,a5,s0
	lw	a5,4(sp)
	sb	a1,0(a3)
	lla	a4,.LANCHOR17
	bge	a2,a5,.L409
.L390:
	lw	a3,0(a4)
	bne	a3,zero,.L410
.L382:
	lla	s1,.LC1
.L391:
	lw	a5,0(sp)
	mv	a0,s1
	add	a4,a5,s0
	lbu	a1,0(a4)
	addi	s0,s0,-1
	call	printf
	li	a4,-1
	bne	s0,a4,.L391
.L380:
	lw	s0,16(sp)
	lw	a0,0(sp)
	lw	ra,20(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	tail	free
.L406:
	lw	a5,8(s1)
	lw	a5,0(a5)
	bne	a5,zero,.L378
.L377:
	lla	a0,.LC0
	call	printf
	lw	s0,16(sp)
	lw	a0,0(sp)
	lw	ra,20(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	tail	free
.L410:
	mv	s0,a2
	li	a2,1
	bne	a3,a2,.L383
.L408:
	lw	a3,8(a4)
	lw	a3,0(a3)
	bne	a3,zero,.L383
	addi	s0,s0,-1
	li	a4,-1
	bne	s0,a4,.L382
	j	.L380
.L407:
	slli	a1,a5,2
	sw	a5,4(a4)
	call	realloc
	lla	a4,.LANCHOR17
	lw	a2,0(a4)
	sw	a0,8(a4)
	lw	a1,8(s1)
	slli	a2,a2,2
	call	memcpy
	lla	a4,.LANCHOR17
	lw	a3,0(a4)
	beq	a3,zero,.L380
	j	.L411
.L409:
	lw	a5,4(sp)
	lw	a0,0(sp)
	sw	a2,8(sp)
	slli	a5,a5,1
	mv	a1,a5
	sw	a5,4(sp)
	call	realloc
	lw	a2,8(sp)
	sw	a0,0(sp)
	lla	a4,.LANCHOR17
	j	.L390
.L387:
	slli	a1,t0,2
	sw	t0,4(a3)
	call	realloc
	lla	a3,.LANCHOR18
	lw	a2,0(a3)
	sw	a0,8(a3)
	lla	t1,.LANCHOR13
	j	.L388
.L385:
	slli	a1,a3,2
	sw	a3,4(a4)
	call	realloc
	lla	a4,.LANCHOR17
	lw	a2,0(a4)
	sw	a0,8(a4)
	j	.L386
	.size	bignum_print, .-bignum_print
	.section	.text.bignum_modpow,"ax",@progbits
	.align	2
	.globl	bignum_modpow
	.hidden	bignum_modpow
	.type	bignum_modpow, @function
bignum_modpow:
	addi	sp,sp,-24
	lw	a4,0(a0)
	sw	s0,16(sp)
	lla	s0,.LANCHOR19
	lw	t1,4(a0)
	lw	t0,4(s0)
	sw	s1,12(sp)
	sw	ra,20(sp)
	sw	a4,0(s0)
	sw	a2,0(sp)
	sw	a3,4(sp)
	mv	s1,a0
	mv	a5,a1
	lw	a0,8(s0)
	bgt	t1,t0,.L439
.L413:
	lw	a1,8(s1)
	slli	a2,a4,2
	sw	a5,8(sp)
	call	memcpy
	lw	a5,8(sp)
	lla	s1,.LANCHOR20
	lw	a3,4(s1)
	lw	a2,0(a5)
	lw	a4,4(a5)
	sw	a2,0(s1)
	bgt	a4,a3,.L414
	lw	a0,8(s1)
.L415:
	lw	a1,8(a5)
	slli	a2,a2,2
	call	memcpy
	lw	a4,0(sp)
	lla	a5,.LANCHOR21
	lw	a3,4(a5)
	lw	a2,0(a4)
	lw	a4,4(a4)
	lw	a0,8(a5)
	sw	a2,0(a5)
	bgt	a4,a3,.L416
.L417:
	lw	a5,0(sp)
	slli	a2,a2,2
	lw	a1,8(a5)
	call	memcpy
	lw	a3,4(sp)
	li	a5,1
	lw	a4,4(a3)
	sw	a5,0(a3)
	ble	a4,zero,.L418
	lw	a0,8(a3)
.L419:
	li	a5,1
	sw	a5,0(a0)
	j	.L420
.L421:
	lla	a5,.LANCHOR12
	mv	a0,a5
	lla	a3,.LANCHOR3+24
	lla	a2,.LANCHOR20
	lla	a1,.LANCHOR11
	call	bignum_divide
	lla	a5,.LANCHOR12
	lw	a2,0(a5)
	lw	a4,4(a5)
	lw	a3,4(s1)
	sw	a2,0(s1)
	lw	a0,8(s1)
	bgt	a4,a3,.L426
.L427:
	lw	a1,8(a5)
	slli	a2,a2,2
	call	memcpy
	lla	a5,.LANCHOR22
	lw	a2,0(s0)
	lw	a4,4(s0)
	lw	a3,4(a5)
	sw	a2,0(a5)
	lw	a0,8(a5)
	bgt	a4,a3,.L428
.L429:
	lw	a1,8(s0)
	slli	a2,a2,2
	call	memcpy
	lla	a2,.LANCHOR22
	lla	a0,.LANCHOR2
	lla	a1,.LANCHOR19
	call	bignum_multiply
	lla	a5,.LANCHOR2
	lw	a2,0(a5)
	lw	a4,4(s0)
	lw	a5,4(a5)
	sw	a2,0(s0)
	lw	a0,8(s0)
	bgt	a5,a4,.L430
.L431:
	lla	a5,.LANCHOR2
	lw	a1,8(a5)
	slli	a2,a2,2
	call	memcpy
	lla	a2,.LANCHOR19
	lla	a0,.LANCHOR16
	lla	a3,.LANCHOR21
	lla	a1,.LANCHOR15
	call	bignum_divide
	lw	a5,0(sp)
	lw	a4,4(s0)
	lw	a0,8(s0)
	lw	a2,0(a5)
	lw	a5,4(a5)
	sw	a2,0(s0)
	bgt	a5,a4,.L432
.L433:
	lw	a5,0(sp)
	slli	a2,a2,2
	lw	a1,8(a5)
	call	memcpy
.L420:
	lla	a1,.LANCHOR3
	lla	a0,.LANCHOR20
	call	bignum_greater
	beq	a0,zero,.L440
	lw	a5,8(s1)
	lla	a4,.LANCHOR15
	sw	a4,0(sp)
	lw	a5,0(a5)
	andi	a5,a5,1
	beq	a5,zero,.L421
	lw	a1,4(sp)
	lla	a2,.LANCHOR19
	lla	a0,.LANCHOR2
	call	bignum_multiply
	lw	a4,4(sp)
	lla	a5,.LANCHOR2
	lw	a2,0(a5)
	lw	a1,4(a5)
	lw	a5,4(a4)
	sw	a2,0(a4)
	bgt	a1,a5,.L422
	lw	a0,8(a4)
.L423:
	lla	a5,.LANCHOR2
	lw	a1,8(a5)
	slli	a2,a2,2
	call	memcpy
	lw	a2,4(sp)
	lla	a5,.LANCHOR15
	mv	a1,a5
	lla	a3,.LANCHOR21
	lla	a0,.LANCHOR16
	sw	a5,0(sp)
	call	bignum_divide
	lw	a5,0(sp)
	lw	a4,4(sp)
	lw	a2,0(a5)
	lw	a1,4(a5)
	lw	a5,4(a4)
	sw	a2,0(a4)
	bgt	a1,a5,.L424
	lw	a0,8(a4)
.L425:
	lw	a5,0(sp)
	slli	a2,a2,2
	lw	a1,8(a5)
	call	memcpy
	j	.L421
.L432:
	slli	a1,a5,2
	sw	a5,4(s0)
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	j	.L433
.L430:
	slli	a1,a5,2
	sw	a5,4(s0)
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	j	.L431
.L428:
	slli	a1,a4,2
	sw	a4,4(a5)
	call	realloc
	lla	a5,.LANCHOR22
	lw	a2,0(a5)
	sw	a0,8(a5)
	j	.L429
.L426:
	slli	a1,a4,2
	sw	a4,4(s1)
	call	realloc
	lw	a2,0(s1)
	sw	a0,8(s1)
	lla	a5,.LANCHOR12
	j	.L427
.L440:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L424:
	lw	a5,4(sp)
	lw	a0,8(a5)
	sw	a1,4(a5)
	slli	a1,a1,2
	call	realloc
	lw	a5,4(sp)
	lw	a2,0(a5)
	sw	a0,8(a5)
	j	.L425
.L422:
	lw	a5,4(sp)
	lw	a0,8(a5)
	sw	a1,4(a5)
	slli	a1,a1,2
	call	realloc
	lw	a5,4(sp)
	lw	a2,0(a5)
	sw	a0,8(a5)
	j	.L423
.L439:
	sw	a1,8(sp)
	slli	a1,t1,2
	sw	t1,4(s0)
	call	realloc
	lw	a4,0(s0)
	lw	a5,8(sp)
	sw	a0,8(s0)
	j	.L413
.L416:
	slli	a1,a4,2
	sw	a4,4(a5)
	call	realloc
	lla	a5,.LANCHOR21
	lw	a2,0(a5)
	sw	a0,8(a5)
	j	.L417
.L414:
	lw	a0,8(s1)
	slli	a1,a4,2
	sw	a5,8(sp)
	sw	a4,4(s1)
	call	realloc
	lw	a2,0(s1)
	lw	a5,8(sp)
	sw	a0,8(s1)
	j	.L415
.L418:
	lw	a4,4(sp)
	li	a1,4
	lw	a0,8(a4)
	sw	a5,4(a4)
	call	realloc
	lw	a4,4(sp)
	sw	a0,8(a4)
	j	.L419
	.size	bignum_modpow, .-bignum_modpow
	.section	.text.bignum_gcd,"ax",@progbits
	.align	2
	.globl	bignum_gcd
	.hidden	bignum_gcd
	.type	bignum_gcd, @function
bignum_gcd:
	addi	sp,sp,-20
	lw	a4,0(a0)
	sw	s1,8(sp)
	lla	s1,.LANCHOR23
	lw	a3,4(a0)
	lw	t1,4(s1)
	sw	s0,12(sp)
	sw	ra,16(sp)
	sw	a4,0(s1)
	sw	a2,0(sp)
	mv	s0,a0
	mv	a5,a1
	lw	a0,8(s1)
	bgt	a3,t1,.L457
.L442:
	lw	a1,8(s0)
	slli	a2,a4,2
	sw	a5,4(sp)
	call	memcpy
	lw	a5,4(sp)
	lla	s0,.LANCHOR24
	lw	a3,4(s0)
	lw	a2,0(a5)
	lw	a4,4(a5)
	sw	a2,0(s0)
	bgt	a4,a3,.L443
	lw	a0,8(s0)
.L456:
	lw	a1,8(a5)
	slli	a2,a2,2
	call	memcpy
	lla	a1,.LANCHOR3
	lla	a0,.LANCHOR24
	call	bignum_equal
	bne	a0,zero,.L458
	lla	a5,.LANCHOR25
	lw	a2,0(s0)
	lw	a4,4(s0)
	lw	a3,4(a5)
	sw	a2,0(a5)
	lw	a0,8(a5)
	bgt	a4,a3,.L459
.L446:
	lw	a1,8(s0)
	slli	a2,a2,2
	call	memcpy
	lla	a4,.LANCHOR15
	mv	a1,a4
	lla	a3,.LANCHOR24
	lla	a2,.LANCHOR23
	lla	a0,.LANCHOR16
	call	bignum_divide
	lla	a4,.LANCHOR15
	lw	a2,0(a4)
	lw	a3,4(a4)
	lw	a1,4(s1)
	sw	a2,0(s1)
	lw	a0,8(s1)
	bgt	a3,a1,.L447
.L448:
	lw	a1,8(a4)
	slli	a2,a2,2
	call	memcpy
	lw	a2,0(s1)
	lw	a4,4(s1)
	lw	a3,4(s0)
	sw	a2,0(s0)
	lw	a0,8(s0)
	bgt	a4,a3,.L449
.L450:
	lw	a1,8(s1)
	slli	a2,a2,2
	call	memcpy
	lla	a5,.LANCHOR25
	lw	a2,0(a5)
	lw	a4,4(a5)
	lw	a3,4(s1)
	sw	a2,0(s1)
	lw	a0,8(s1)
	bgt	a4,a3,.L451
	lla	a5,.LANCHOR25
	j	.L456
.L451:
	slli	a1,a4,2
	sw	a4,4(s1)
	call	realloc
	lw	a2,0(s1)
	sw	a0,8(s1)
	lla	a5,.LANCHOR25
	j	.L456
.L449:
	slli	a1,a4,2
	sw	a4,4(s0)
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	j	.L450
.L447:
	slli	a1,a3,2
	sw	a3,4(s1)
	call	realloc
	lw	a2,0(s1)
	sw	a0,8(s1)
	lla	a4,.LANCHOR15
	j	.L448
.L459:
	slli	a1,a4,2
	sw	a4,4(a5)
	call	realloc
	lla	a5,.LANCHOR25
	lw	a2,0(a5)
	sw	a0,8(a5)
	j	.L446
.L458:
	lw	a5,0(sp)
	lw	a2,0(s1)
	lw	a1,4(s1)
	lw	a4,4(a5)
	sw	a2,0(a5)
	lw	a0,8(a5)
	bgt	a1,a4,.L460
	lw	s0,12(sp)
	lw	a1,8(s1)
	lw	ra,16(sp)
	lw	s1,8(sp)
	slli	a2,a2,2
	addi	sp,sp,20
	tail	memcpy
.L457:
	sw	a1,4(sp)
	slli	a1,a3,2
	sw	a3,4(s1)
	call	realloc
	lw	a4,0(s1)
	lw	a5,4(sp)
	sw	a0,8(s1)
	j	.L442
.L460:
	sw	a1,4(a5)
	slli	a1,a1,2
	mv	s0,a5
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	lw	s0,12(sp)
	lw	a1,8(s1)
	lw	ra,16(sp)
	lw	s1,8(sp)
	slli	a2,a2,2
	addi	sp,sp,20
	tail	memcpy
.L443:
	lw	a0,8(s0)
	slli	a1,a4,2
	sw	a5,4(sp)
	sw	a4,4(s0)
	call	realloc
	lw	a2,0(s0)
	lw	a5,4(sp)
	sw	a0,8(s0)
	j	.L456
	.size	bignum_gcd, .-bignum_gcd
	.section	.text.bignum_inverse,"ax",@progbits
	.align	2
	.globl	bignum_inverse
	.hidden	bignum_inverse
	.type	bignum_inverse, @function
bignum_inverse:
	addi	sp,sp,-20
	lw	a5,0(a1)
	lw	a4,4(a1)
	sw	a1,0(sp)
	lla	a1,.LANCHOR26
	lw	a3,4(a1)
	sw	s0,12(sp)
	sw	ra,16(sp)
	sw	s1,8(sp)
	sw	a5,0(a1)
	sw	a2,4(sp)
	mv	s0,a0
	lw	a0,8(a1)
	bgt	a4,a3,.L486
.L462:
	lw	a4,0(sp)
	slli	a2,a5,2
	lla	s1,.LANCHOR27
	lw	a1,8(a4)
	call	memcpy
	lw	a2,0(s0)
	lw	a5,4(s0)
	lw	a4,4(s1)
	sw	a2,0(s1)
	lw	a0,8(s1)
	bgt	a5,a4,.L463
.L464:
	lw	a1,8(s0)
	slli	a2,a2,2
	call	memcpy
	lla	a3,.LANCHOR28
	lw	a4,4(a3)
	li	a5,1
	sw	a5,0(a3)
	ble	a4,zero,.L465
	lw	a0,8(a3)
.L466:
	sw	zero,0(a0)
	lla	a3,.LANCHOR29
	lw	a4,4(a3)
	li	a5,1
	sw	a5,0(a3)
	lw	a0,8(a3)
	ble	a4,zero,.L487
.L467:
	li	a5,1
	sw	a5,0(a0)
	lla	s0,.LANCHOR32
	j	.L468
.L470:
	lla	a5,.LANCHOR2
	lw	a1,8(a5)
	slli	a2,a2,2
	call	memcpy
	lla	a5,.LANCHOR0
	mv	a0,a5
	lla	a2,.LANCHOR28
	lla	a1,.LANCHOR32
	call	bignum_add
	lla	a5,.LANCHOR0
	lw	a2,0(a5)
	lw	a4,4(a5)
	lw	a3,4(s0)
	sw	a2,0(s0)
	lw	a0,8(s0)
	bgt	a4,a3,.L471
.L472:
	lw	a1,8(a5)
	slli	a2,a2,2
	call	memcpy
	lw	a3,0(sp)
	lla	a5,.LANCHOR15
	lla	a2,.LANCHOR32
	mv	a1,a5
	lla	a0,.LANCHOR16
	call	bignum_divide
	lla	a5,.LANCHOR15
	lw	a2,0(a5)
	lw	a4,4(a5)
	lw	a3,4(s0)
	sw	a2,0(s0)
	lw	a0,8(s0)
	bgt	a4,a3,.L473
.L474:
	lw	a1,8(a5)
	slli	a2,a2,2
	call	memcpy
	lla	a3,.LANCHOR26
	lw	a2,0(s1)
	lw	a5,4(s1)
	lw	a4,4(a3)
	sw	a2,0(a3)
	bgt	a5,a4,.L475
	lw	a0,8(a3)
.L476:
	lw	a1,8(s1)
	slli	a2,a2,2
	call	memcpy
	lla	a5,.LANCHOR29
	lw	a2,0(a5)
	lla	a3,.LANCHOR28
	lw	a5,4(a5)
	lw	a4,4(a3)
	sw	a2,0(a3)
	bgt	a5,a4,.L477
	lw	a0,8(a3)
.L478:
	lla	a5,.LANCHOR29
	lw	a1,8(a5)
	slli	a2,a2,2
	call	memcpy
	lla	a5,.LANCHOR30
	lw	a2,0(a5)
	lw	a4,4(a5)
	lw	a3,4(s1)
	sw	a2,0(s1)
	lw	a0,8(s1)
	bgt	a4,a3,.L479
.L480:
	lw	a1,8(a5)
	slli	a2,a2,2
	call	memcpy
	lla	a3,.LANCHOR29
	lw	a2,0(s0)
	lw	a5,4(s0)
	lw	a4,4(a3)
	sw	a2,0(a3)
	bgt	a5,a4,.L481
	lw	a0,8(a3)
.L482:
	lw	a1,8(s0)
	slli	a2,a2,2
	call	memcpy
.L468:
	lla	a1,.LANCHOR3+12
	lla	a0,.LANCHOR27
	call	bignum_greater
	beq	a0,zero,.L488
	lla	a3,.LANCHOR27
	lla	a2,.LANCHOR26
	lla	a1,.LANCHOR30
	lla	a0,.LANCHOR31
	call	bignum_divide
	lw	a1,0(sp)
	lla	a2,.LANCHOR31
	lla	a0,.LANCHOR32
	call	bignum_subtract
	lla	a2,.LANCHOR29
	lla	a0,.LANCHOR2
	lla	a1,.LANCHOR32
	call	bignum_multiply
	lla	a5,.LANCHOR2
	lw	a2,0(a5)
	lw	a4,4(s0)
	lw	a5,4(a5)
	sw	a2,0(s0)
	lw	a0,8(s0)
	ble	a5,a4,.L470
	slli	a1,a5,2
	sw	a5,4(s0)
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	j	.L470
.L481:
	lla	a4,.LANCHOR29
	lw	a0,8(a4)
	slli	a1,a5,2
	sw	a5,4(a4)
	call	realloc
	lla	a5,.LANCHOR29
	lw	a2,0(a5)
	sw	a0,8(a5)
	j	.L482
.L479:
	slli	a1,a4,2
	sw	a4,4(s1)
	call	realloc
	lw	a2,0(s1)
	sw	a0,8(s1)
	lla	a5,.LANCHOR30
	j	.L480
.L477:
	lla	a4,.LANCHOR28
	lw	a0,8(a4)
	slli	a1,a5,2
	sw	a5,4(a4)
	call	realloc
	lla	a5,.LANCHOR28
	lw	a2,0(a5)
	sw	a0,8(a5)
	j	.L478
.L475:
	lla	a4,.LANCHOR26
	lw	a0,8(a4)
	slli	a1,a5,2
	sw	a5,4(a4)
	call	realloc
	lla	a5,.LANCHOR26
	lw	a2,0(a5)
	sw	a0,8(a5)
	j	.L476
.L473:
	slli	a1,a4,2
	sw	a4,4(s0)
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	lla	a5,.LANCHOR15
	j	.L474
.L471:
	slli	a1,a4,2
	sw	a4,4(s0)
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	lla	a5,.LANCHOR0
	j	.L472
.L488:
	lw	a4,4(sp)
	lw	a2,0(s0)
	lw	a1,4(s0)
	lw	a5,4(a4)
	sw	a2,0(a4)
	lw	a0,8(a4)
	bgt	a1,a5,.L489
	lw	a1,8(s0)
	lw	s0,12(sp)
	lw	ra,16(sp)
	lw	s1,8(sp)
	slli	a2,a2,2
	addi	sp,sp,20
	tail	memcpy
.L486:
	lla	s1,.LANCHOR26
	slli	a1,a4,2
	sw	a4,4(s1)
	call	realloc
	lw	a5,0(s1)
	sw	a0,8(s1)
	j	.L462
.L489:
	sw	a1,4(a4)
	slli	a1,a1,2
	mv	s1,a4
	call	realloc
	sw	a0,8(s1)
	lw	a2,0(s1)
	lw	a1,8(s0)
	lw	s0,12(sp)
	lw	ra,16(sp)
	lw	s1,8(sp)
	slli	a2,a2,2
	addi	sp,sp,20
	tail	memcpy
.L463:
	slli	a1,a5,2
	sw	a5,4(s1)
	call	realloc
	lw	a2,0(s1)
	sw	a0,8(s1)
	j	.L464
.L487:
	li	a1,4
	mv	s0,a3
	sw	a5,4(a3)
	call	realloc
	sw	a0,8(s0)
	j	.L467
.L465:
	lla	s0,.LANCHOR28
	lw	a0,8(s0)
	li	a1,4
	sw	a5,4(s0)
	call	realloc
	sw	a0,8(s0)
	j	.L466
	.size	bignum_inverse, .-bignum_inverse
	.section	.text.bignum_jacobi,"ax",@progbits
	.align	2
	.globl	bignum_jacobi
	.hidden	bignum_jacobi
	.type	bignum_jacobi, @function
bignum_jacobi:
	addi	sp,sp,-16
	lw	a2,0(a0)
	sw	s0,8(sp)
	lla	s0,.LANCHOR33
	lw	a4,4(a0)
	lw	a3,4(s0)
	sw	s1,4(sp)
	sw	ra,12(sp)
	sw	a2,0(s0)
	mv	a5,a0
	mv	s1,a1
	lw	a0,8(s0)
	bgt	a4,a3,.L534
.L491:
	lw	a1,8(a5)
	slli	a2,a2,2
	call	memcpy
	lla	a3,.LANCHOR34
	lw	a2,0(s1)
	lw	a5,4(s1)
	lw	a4,4(a3)
	sw	a2,0(a3)
	bgt	a5,a4,.L492
	lw	a0,8(a3)
.L493:
	lw	a1,8(s1)
	slli	a2,a2,2
	call	memcpy
	li	a5,1
	lla	a1,.LANCHOR3+12
	lla	a0,.LANCHOR33
	sw	a5,0(sp)
	call	bignum_greater
	beq	a0,zero,.L497
.L539:
	lla	a1,.LANCHOR34
	lla	a0,.LANCHOR33
	call	bignum_equal
	bne	a0,zero,.L497
	lla	a2,.LANCHOR33
	lla	a0,.LANCHOR16
	lla	a3,.LANCHOR34
	lla	a1,.LANCHOR15
	call	bignum_divide
	lla	a5,.LANCHOR15
	lw	a2,0(a5)
	lw	a4,4(s0)
	lw	a5,4(a5)
	sw	a2,0(s0)
	lw	a0,8(s0)
	bgt	a5,a4,.L495
.L496:
	lla	a5,.LANCHOR15
	lw	a1,8(a5)
	slli	a2,a2,2
	call	memcpy
	lla	a1,.LANCHOR3+12
	lla	a0,.LANCHOR33
	call	bignum_greater
	beq	a0,zero,.L497
	lla	a1,.LANCHOR34
	lla	a0,.LANCHOR33
	call	bignum_equal
	bne	a0,zero,.L497
	lla	s1,.LANCHOR35
	lw	a4,4(s1)
	li	a5,1
	sw	a5,0(s1)
	lw	a0,8(s1)
	ble	a4,zero,.L535
.L498:
	lw	a5,8(s0)
	sw	zero,0(a0)
	lw	a5,0(a5)
	andi	a5,a5,1
	beq	a5,zero,.L504
	j	.L499
.L503:
	lla	a5,.LANCHOR12
	lw	a1,8(a5)
	slli	a2,a2,2
	call	memcpy
	lw	a5,8(s0)
	lw	a5,0(a5)
	andi	a5,a5,1
	bne	a5,zero,.L536
.L504:
	lla	a2,.LANCHOR3+12
	lla	a0,.LANCHOR0
	lla	a1,.LANCHOR35
	call	bignum_add
	lla	a5,.LANCHOR0
	lw	a2,0(a5)
	lw	a4,4(s1)
	lw	a5,4(a5)
	sw	a2,0(s1)
	lw	a0,8(s1)
	bgt	a5,a4,.L500
.L501:
	lla	a5,.LANCHOR0
	lw	a1,8(a5)
	slli	a2,a2,2
	call	memcpy
	lla	a2,.LANCHOR33
	lla	a0,.LANCHOR12
	lla	a3,.LANCHOR3+24
	lla	a1,.LANCHOR11
	call	bignum_divide
	lla	a5,.LANCHOR12
	lw	a2,0(a5)
	lw	a4,4(s0)
	lw	a5,4(a5)
	sw	a2,0(s0)
	lw	a0,8(s0)
	ble	a5,a4,.L503
	slli	a1,a5,2
	sw	a5,4(s0)
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	j	.L503
.L500:
	slli	a1,a5,2
	sw	a5,4(s1)
	call	realloc
	lw	a2,0(s1)
	sw	a0,8(s1)
	j	.L501
.L536:
	lla	a1,.LANCHOR3
	lla	a0,.LANCHOR35
	call	bignum_greater
	beq	a0,zero,.L499
	lw	a5,8(s1)
	lw	a5,0(a5)
	andi	a5,a5,1
	bne	a5,zero,.L537
.L499:
	lla	a1,.LANCHOR3+12
	lla	a0,.LANCHOR33
	call	bignum_greater
	beq	a0,zero,.L497
	lla	a1,.LANCHOR34
	lla	a0,.LANCHOR33
	call	bignum_equal
	bne	a0,zero,.L497
	lla	a3,.LANCHOR3+48
	lla	a2,.LANCHOR34
	lla	a1,.LANCHOR36
	lla	a0,.LANCHOR10
	call	bignum_divide
	lla	s1,.LANCHOR37
	mv	a1,s1
	lla	a0,.LANCHOR10
	lla	a3,.LANCHOR3+48
	lla	a2,.LANCHOR33
	call	bignum_divide
	lla	a1,.LANCHOR3+12
	lla	a0,.LANCHOR36
	call	bignum_equal
	bne	a0,zero,.L505
	lla	a1,.LANCHOR3+12
	mv	a0,s1
	call	bignum_equal
	bne	a0,zero,.L505
	lw	a5,0(sp)
	neg	a5,a5
	sw	a5,0(sp)
.L505:
	lw	a2,0(s0)
	lw	a5,4(s0)
	lw	a4,4(s1)
	sw	a2,0(s1)
	lw	a0,8(s1)
	bgt	a5,a4,.L538
.L506:
	lw	a1,8(s0)
	slli	a2,a2,2
	call	memcpy
	lla	a5,.LANCHOR34
	lw	a2,0(a5)
	lw	a4,4(s0)
	lw	a5,4(a5)
	sw	a2,0(s0)
	lw	a0,8(s0)
	bgt	a5,a4,.L507
.L508:
	lla	a3,.LANCHOR34
	lw	a1,8(a3)
	slli	a2,a2,2
	call	memcpy
	lla	a3,.LANCHOR34
	lw	a2,0(s1)
	lw	a5,4(s1)
	lw	a4,4(a3)
	sw	a2,0(a3)
	bgt	a5,a4,.L509
	lw	a0,8(a3)
.L510:
	lw	a1,8(s1)
	slli	a2,a2,2
	call	memcpy
	lla	a1,.LANCHOR3+12
	lla	a0,.LANCHOR33
	call	bignum_greater
	bne	a0,zero,.L539
.L497:
	lla	a1,.LANCHOR3+12
	lla	a0,.LANCHOR33
	call	bignum_equal
	beq	a0,zero,.L490
	lw	a0,0(sp)
.L490:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L537:
	lla	a1,.LANCHOR36
	lla	a0,.LANCHOR10
	lla	a3,.LANCHOR3+96
	lla	a2,.LANCHOR34
	call	bignum_divide
	lla	a1,.LANCHOR3+12
	lla	a0,.LANCHOR36
	call	bignum_equal
	bne	a0,zero,.L499
	lla	a1,.LANCHOR3+84
	lla	a0,.LANCHOR36
	call	bignum_equal
	bne	a0,zero,.L499
	lw	a5,0(sp)
	neg	a5,a5
	sw	a5,0(sp)
	j	.L499
.L495:
	slli	a1,a5,2
	sw	a5,4(s0)
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	j	.L496
.L509:
	lla	a4,.LANCHOR34
	lw	a0,8(a4)
	slli	a1,a5,2
	sw	a5,4(a4)
	call	realloc
	lla	a5,.LANCHOR34
	lw	a2,0(a5)
	sw	a0,8(a5)
	j	.L510
.L507:
	slli	a1,a5,2
	sw	a5,4(s0)
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	j	.L508
.L538:
	slli	a1,a5,2
	sw	a5,4(s1)
	call	realloc
	lw	a2,0(s1)
	sw	a0,8(s1)
	j	.L506
.L535:
	li	a1,4
	sw	a5,4(s1)
	call	realloc
	sw	a0,8(s1)
	j	.L498
.L492:
	lla	a4,.LANCHOR34
	lw	a0,8(a4)
	slli	a1,a5,2
	sw	a5,4(a4)
	call	realloc
	lla	a5,.LANCHOR34
	lw	a2,0(a5)
	sw	a0,8(a5)
	j	.L493
.L534:
	slli	a1,a4,2
	sw	a5,0(sp)
	sw	a4,4(s0)
	call	realloc
	lw	a2,0(s0)
	lw	a5,0(sp)
	sw	a0,8(s0)
	j	.L491
	.size	bignum_jacobi, .-bignum_jacobi
	.section	.text.solovayPrime,"ax",@progbits
	.align	2
	.globl	solovayPrime
	.hidden	solovayPrime
	.type	solovayPrime, @function
solovayPrime:
	addi	sp,sp,-16
	sw	s0,8(sp)
	lla	s0,.LANCHOR38
	lw	a2,4(s0)
	sw	s1,4(sp)
	sw	ra,12(sp)
	li	a3,1
	sw	a3,0(s0)
	lw	a4,8(s0)
	mv	a5,a0
	mv	s1,a1
	ble	a2,zero,.L553
.L541:
	sw	a5,0(a4)
	mv	a1,s1
	lla	a0,.LANCHOR38
	call	bignum_jacobi
	li	a5,-1
	mv	s0,a0
	beq	a0,a5,.L554
	lla	a5,.LANCHOR39
	lw	a3,4(a5)
	li	a4,1
	sw	a4,0(a5)
	lw	a0,8(a5)
	ble	a3,zero,.L555
.L544:
	sw	s0,0(a0)
	lw	a2,0(s1)
	lla	s0,.LANCHOR40
	lw	a5,4(s1)
	lw	a4,4(s0)
	sw	a2,0(s0)
	lw	a0,8(s0)
	bgt	a5,a4,.L556
.L545:
	lw	a1,8(s1)
	slli	a2,a2,2
	call	memcpy
	lla	a5,.LANCHOR1
	mv	a0,a5
	lla	a2,.LANCHOR3+12
	lla	a1,.LANCHOR40
	call	bignum_subtract
	lla	a5,.LANCHOR1
	lw	a2,0(a5)
	lw	a4,4(a5)
	lw	a3,4(s0)
	sw	a2,0(s0)
	lw	a0,8(s0)
	bgt	a4,a3,.L546
.L547:
	lw	a1,8(a5)
	slli	a2,a2,2
	call	memcpy
	lla	a5,.LANCHOR12
	mv	a0,a5
	lla	a3,.LANCHOR3+24
	lla	a2,.LANCHOR40
	lla	a1,.LANCHOR11
	call	bignum_divide
	lla	a5,.LANCHOR12
	lw	a2,0(a5)
	lw	a4,4(a5)
	lw	a3,4(s0)
	sw	a2,0(s0)
	lw	a0,8(s0)
	bgt	a4,a3,.L548
.L549:
	lw	a1,8(a5)
	slli	a2,a2,2
	call	memcpy
	lla	a3,.LANCHOR41
	mv	a2,s1
	lla	a1,.LANCHOR40
	lla	a0,.LANCHOR38
	call	bignum_modpow
	lla	a1,.LANCHOR3
	lla	a0,.LANCHOR39
	call	bignum_equal
	mv	a5,a0
	li	a0,0
	bne	a5,zero,.L540
	lla	a1,.LANCHOR39
	lla	a0,.LANCHOR41
	call	bignum_equal
	snez	a0,a0
.L540:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L554:
	lla	a2,.LANCHOR3+12
	lla	a0,.LANCHOR39
	mv	a1,s1
	call	bignum_subtract
	lla	s0,.LANCHOR40
	lw	a2,0(s1)
	lw	a5,4(s1)
	lw	a4,4(s0)
	sw	a2,0(s0)
	lw	a0,8(s0)
	ble	a5,a4,.L545
.L556:
	slli	a1,a5,2
	sw	a5,4(s0)
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	j	.L545
.L548:
	slli	a1,a4,2
	sw	a4,4(s0)
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	lla	a5,.LANCHOR12
	j	.L549
.L546:
	slli	a1,a4,2
	sw	a4,4(s0)
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	lla	a5,.LANCHOR1
	j	.L547
.L553:
	sw	a0,0(sp)
	li	a1,4
	mv	a0,a4
	sw	a3,4(s0)
	call	realloc
	lw	a5,0(sp)
	mv	a4,a0
	sw	a0,8(s0)
	j	.L541
.L555:
	li	a1,4
	sw	a4,4(a5)
	call	realloc
	lla	a5,.LANCHOR39
	sw	a0,8(a5)
	j	.L544
	.size	solovayPrime, .-solovayPrime
	.globl	__umodsi3
	.section	.text.probablePrime,"ax",@progbits
	.align	2
	.globl	probablePrime
	.hidden	probablePrime
	.type	probablePrime, @function
probablePrime:
	addi	sp,sp,-16
	mv	a5,a1
	lla	a1,.LANCHOR3+24
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s0,a0
	mv	s1,a5
	call	bignum_equal
	sw	a0,0(sp)
	bne	a0,zero,.L558
	lw	a5,8(s0)
	lw	a5,0(a5)
	andi	a5,a5,1
	beq	a5,zero,.L557
	lla	a1,.LANCHOR3+12
	mv	a0,s0
	call	bignum_equal
	bne	a0,zero,.L557
	mv	a5,s1
	addi	s1,s1,-1
	bgt	a5,zero,.L563
	j	.L558
.L562:
	call	bench_rand
	li	a1,-2147483648
	xori	a1,a1,-3
	call	__umodsi3
	mv	a1,s0
	addi	a0,a0,2
	call	solovayPrime
	beq	a0,zero,.L557
.L574:
	li	a4,-1
	beq	s1,a4,.L558
.L563:
	lw	a4,0(s0)
	li	a5,1
	addi	s1,s1,-1
	bgt	a4,a5,.L562
	call	bench_rand
	lw	a4,8(s0)
	lw	a1,0(a4)
	addi	a1,a1,-2
	call	__umodsi3
	mv	a1,s0
	addi	a0,a0,2
	call	solovayPrime
	bne	a0,zero,.L574
.L557:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	a0,0(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L558:
	lw	ra,12(sp)
	lw	s0,8(sp)
	li	a5,1
	sw	a5,0(sp)
	lw	a0,0(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	probablePrime, .-probablePrime
	.section	.text.randPrime,"ax",@progbits
	.align	2
	.globl	randPrime
	.hidden	randPrime
	.type	randPrime, @function
randPrime:
	addi	sp,sp,-24
	sw	s1,12(sp)
	mv	s1,a0
	addi	a0,a0,1
	sw	ra,20(sp)
	sw	s0,16(sp)
	mv	s0,a1
	call	malloc
	sw	a0,4(sp)
	call	bench_rand
	li	a1,9
	call	__umodsi3
	lw	a5,4(sp)
	addi	a0,a0,49
	sb	a0,0(a5)
	call	bench_rand
	lw	a4,4(sp)
	sw	s1,8(sp)
	addi	s1,s1,-1
	add	a2,a4,s1
	li	a1,5
	mv	s1,a2
	sw	a2,0(sp)
	call	__umodsi3
	lw	a3,4(sp)
	slli	a0,a0,1
	lw	a5,8(sp)
	addi	a0,a0,49
	sb	a0,0(s1)
	li	a4,2
	addi	s1,a3,1
	ble	a5,a4,.L579
.L578:
	call	bench_rand
	li	a1,10
	call	__umodsi3
	lw	a5,0(sp)
	addi	a0,a0,48
	sb	a0,0(s1)
	addi	s1,s1,1
	bne	a5,s1,.L578
.L579:
	lw	a1,4(sp)
	lw	a5,8(sp)
	mv	a0,s0
	lla	s1,.LANCHOR0
	add	a5,a1,a5
	sb	zero,0(a5)
	call	bignum_fromstring
	j	.L577
.L582:
	lw	a1,8(s1)
	slli	a2,a2,2
	call	memcpy
.L577:
	li	a1,20
	mv	a0,s0
	call	probablePrime
	mv	a5,a0
	lla	a2,.LANCHOR3+24
	mv	a1,s0
	lla	a0,.LANCHOR0
	bne	a5,zero,.L587
	call	bignum_add
	lw	a2,0(s1)
	lw	a5,4(s1)
	lw	a4,4(s0)
	sw	a2,0(s0)
	lw	a0,8(s0)
	ble	a5,a4,.L582
	slli	a1,a5,2
	sw	a5,4(s0)
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	j	.L582
.L587:
	lw	s0,16(sp)
	lw	a0,4(sp)
	lw	ra,20(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	tail	free
	.size	randPrime, .-randPrime
	.globl	__modsi3
	.section	.text.randExponent,"ax",@progbits
	.align	2
	.globl	randExponent
	.hidden	randExponent
	.type	randExponent, @function
randExponent:
	addi	sp,sp,-20
	sw	ra,16(sp)
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	a1,4(sp)
	mv	s1,a1
	mv	s0,a2
	sw	a0,0(sp)
	call	bench_rand
	mv	a1,s1
	call	__umodsi3
	mv	s1,a0
.L592:
	lw	a2,4(s0)
	li	a3,1
	sw	a3,0(s0)
	lw	a0,8(s0)
	ble	a2,zero,.L595
.L589:
	lw	a1,0(sp)
	lla	a2,.LANCHOR42
	sw	s1,0(a0)
	mv	a0,s0
	call	bignum_gcd
	lla	a1,.LANCHOR3+12
	lla	a0,.LANCHOR42
	call	bignum_equal
	mv	a3,a0
	lw	a1,4(sp)
	addi	a0,s1,1
	bne	a3,zero,.L593
	call	__modsi3
	li	a3,3
	mv	s1,a0
	bge	a0,a3,.L592
	lw	a2,4(s0)
	li	a3,1
	sw	a3,0(s0)
	lw	a0,8(s0)
	li	s1,3
	bgt	a2,zero,.L589
.L595:
	sw	a3,4(s0)
	li	a1,4
	call	realloc
	sw	a0,8(s0)
	j	.L589
.L593:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
	.size	randExponent, .-randExponent
	.section	.text.readFile,"ax",@progbits
	.align	2
	.globl	readFile
	.hidden	readFile
	.type	readFile, @function
readFile:
	addi	sp,sp,-1056
	mv	a5,a0
	li	a0,1024
	sw	s0,1048(sp)
	sw	s1,1044(sp)
	mv	s0,a1
	sw	a5,12(sp)
	sw	ra,1052(sp)
	sw	a2,8(sp)
	call	malloc
	li	a5,1024
	sw	a0,0(s0)
	sw	a5,4(sp)
	li	s1,0
	j	.L597
.L598:
	add	a0,a0,s1
	addi	a1,sp,20
	sw	a4,0(sp)
	call	memcpy
	lw	a4,0(sp)
	mv	s1,a4
.L597:
	lw	a3,12(sp)
	li	a2,1024
	li	a1,1
	addi	a0,sp,20
	call	fread
	mv	a2,a0
	add	a4,s1,a0
	ble	a0,zero,.L604
	lw	a5,4(sp)
	lw	a0,0(s0)
	blt	a4,a5,.L598
	slli	a5,a5,1
	mv	a1,a5
	sw	a2,16(sp)
	sw	a4,0(sp)
	sw	a5,4(sp)
	call	realloc
	lw	a2,16(sp)
	lw	a4,0(sp)
	sw	a0,0(s0)
	j	.L598
.L604:
	lw	a1,8(sp)
	mv	a0,s1
	call	__modsi3
	lw	a5,8(sp)
	add	a1,s1,a5
	lw	a5,4(sp)
	sub	a1,a1,a0
	lw	a0,0(s0)
	ble	a1,a5,.L602
	j	.L605
.L606:
	lw	a0,0(s0)
.L602:
	lw	a1,8(sp)
	add	a0,a0,s1
	addi	s1,s1,1
	sb	zero,0(a0)
	mv	a0,s1
	call	__modsi3
	bne	a0,zero,.L606
	lw	ra,1052(sp)
	lw	s0,1048(sp)
	mv	a0,s1
	lw	s1,1044(sp)
	addi	sp,sp,1056
	jr	ra
.L605:
	call	realloc
	sw	a0,0(s0)
	j	.L602
	.size	readFile, .-readFile
	.section	.text.encode,"ax",@progbits
	.align	2
	.globl	encode
	.hidden	encode
	.type	encode, @function
encode:
	tail	bignum_modpow
	.size	encode, .-encode
	.section	.text.decode,"ax",@progbits
	.align	2
	.globl	decode
	.hidden	decode
	.type	decode, @function
decode:
	tail	bignum_modpow
	.size	decode, .-decode
	.globl	__divsi3
	.section	.rodata.encodeMessage.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"."
	.align	2
.LC3:
	.string	"\n"
	.section	.text.encodeMessage,"ax",@progbits
	.align	2
	.globl	encodeMessage
	.hidden	encodeMessage
	.type	encodeMessage, @function
encodeMessage:
	addi	sp,sp,-64
	sw	a2,40(sp)
	sw	a3,44(sp)
	sw	ra,60(sp)
	sw	a4,48(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	a1,24(sp)
	sw	a0,36(sp)
	call	__divsi3
	li	a1,12
	call	calloc
	mv	a5,a0
	li	a0,12
	sw	a5,32(sp)
	call	malloc
	mv	s1,a0
	li	s0,20
	li	a1,4
	sw	s0,4(s1)
	li	a0,20
	call	calloc
	mv	a4,a0
	sw	a4,8(s1)
	li	a0,12
	sw	a4,12(sp)
	sw	s1,16(sp)
	call	malloc
	mv	s1,a0
	li	a1,4
	sw	s0,4(s1)
	li	a0,20
	call	calloc
	mv	a5,a0
	sw	a5,8(s1)
	li	a0,12
	sw	a5,4(sp)
	sw	s1,0(sp)
	call	malloc
	mv	s1,a0
	li	a1,4
	sw	a0,8(sp)
	sw	zero,0(s1)
	sw	s0,4(s1)
	li	a0,20
	call	calloc
	mv	t1,a0
	sw	t1,8(s1)
	li	a0,12
	sw	t1,20(sp)
	call	malloc
	mv	s1,a0
	li	a1,4
	li	a0,20
	sw	zero,0(s1)
	sw	s0,4(s1)
	call	calloc
	lw	a5,16(sp)
	li	a3,1
	lw	a4,12(sp)
	sw	a3,0(a5)
	lw	a5,4(sp)
	li	a2,128
	sw	a2,0(a4)
	lw	a4,0(sp)
	sw	a3,0(a5)
	lw	a5,36(sp)
	sw	a0,8(s1)
	sw	a3,0(a4)
	ble	a5,zero,.L610
	lw	a4,8(sp)
	lw	t1,20(sp)
	li	a3,1
	li	a5,20
	sw	zero,28(sp)
	sw	a3,0(a4)
	lw	s0,40(sp)
	mv	a0,t1
	ble	a5,zero,.L627
.L611:
	lw	a4,0(sp)
	li	a3,1
	sw	zero,0(a0)
	lw	a5,4(a4)
	sw	a3,0(a4)
	lw	a0,8(a4)
	ble	a5,zero,.L628
.L612:
	li	a5,1
	sw	a5,0(a0)
	lw	a5,24(sp)
	ble	a5,zero,.L629
	lw	a4,24(sp)
	sw	s0,4(sp)
	add	a5,s0,a4
	sw	a5,12(sp)
	lla	s0,.LANCHOR2
	j	.L613
.L631:
	lw	a0,8(s1)
.L617:
	lw	a1,8(s0)
	slli	a2,a2,2
	call	memcpy
	lw	a1,8(sp)
	mv	a2,s1
	lla	a0,.LANCHOR0
	call	bignum_add
	lw	a5,8(sp)
	lla	a4,.LANCHOR0
	lw	a2,0(a4)
	lw	a3,4(a5)
	lw	a4,4(a4)
	sw	a2,0(a5)
	bgt	a4,a3,.L618
	lw	a0,8(a5)
.L619:
	lla	a5,.LANCHOR0
	lw	a1,8(a5)
	slli	a2,a2,2
	call	memcpy
	lw	a2,16(sp)
	lw	a1,0(sp)
	mv	a0,s0
	call	bignum_multiply
	lw	a5,0(sp)
	lw	a2,0(s0)
	lw	a4,4(s0)
	lw	a3,4(a5)
	sw	a2,0(a5)
	bgt	a4,a3,.L620
	lw	a0,8(a5)
.L621:
	lw	a5,4(sp)
	lw	a1,8(s0)
	slli	a2,a2,2
	addi	a5,a5,1
	sw	a5,4(sp)
	call	memcpy
	lw	a4,12(sp)
	lw	a5,4(sp)
	beq	a4,a5,.L622
.L613:
	li	a5,1
	sw	a5,0(s1)
	lw	a3,4(s1)
	lw	a5,4(sp)
	lw	a0,8(s1)
	lbu	a4,0(a5)
	ble	a3,zero,.L630
.L615:
	lw	a2,0(sp)
	sw	a4,0(a0)
	mv	a1,s1
	mv	a0,s0
	call	bignum_multiply
	lw	a2,0(s0)
	lw	a4,4(s0)
	lw	a3,4(s1)
	sw	a2,0(s1)
	ble	a4,a3,.L631
	lw	a0,8(s1)
	slli	a1,a4,2
	sw	a4,4(s1)
	sw	a2,20(sp)
	call	realloc
	lw	a2,20(sp)
	sw	a0,8(s1)
	j	.L617
.L620:
	lw	a5,0(sp)
	slli	a1,a4,2
	sw	a2,20(sp)
	lw	a0,8(a5)
	sw	a4,4(a5)
	call	realloc
	lw	a5,0(sp)
	lw	a2,20(sp)
	sw	a0,8(a5)
	j	.L621
.L618:
	lw	a5,8(sp)
	slli	a1,a4,2
	sw	a2,20(sp)
	lw	a0,8(a5)
	sw	a4,4(a5)
	call	realloc
	lw	a5,8(sp)
	lw	a2,20(sp)
	sw	a0,8(a5)
	j	.L619
.L630:
	li	a5,1
	li	a1,4
	sw	a5,4(s1)
	sw	a4,20(sp)
	call	realloc
	lw	a4,20(sp)
	sw	a0,8(s1)
	j	.L615
.L629:
	add	a5,s0,a5
	sw	a5,12(sp)
.L622:
	lw	a1,24(sp)
	lw	a0,28(sp)
	call	__divsi3
	lw	a5,32(sp)
	slli	a3,a0,1
	lw	a2,48(sp)
	lw	a1,44(sp)
	add	a3,a3,a0
	lw	a0,8(sp)
	slli	a3,a3,2
	add	a3,a5,a3
	call	bignum_modpow
	lw	a5,40(sp)
	lw	s0,12(sp)
	lla	a0,.LC2
	sub	a5,s0,a5
	sw	a5,28(sp)
	call	printf
	lw	a4,36(sp)
	lw	a5,28(sp)
	ble	a4,a5,.L610
	lw	a4,8(sp)
	li	a3,1
	lw	a5,4(a4)
	lw	a0,8(a4)
	lw	a4,8(sp)
	sw	a3,0(a4)
	bgt	a5,zero,.L611
.L627:
	mv	a5,a4
	li	a4,1
	sw	a4,4(a5)
	li	a1,4
	call	realloc
	lw	a4,0(sp)
	lw	a5,8(sp)
	li	a3,1
	sw	zero,0(a0)
	sw	a0,8(a5)
	lw	a5,4(a4)
	sw	a3,0(a4)
	lw	a0,8(a4)
	bgt	a5,zero,.L612
.L628:
	mv	a5,a4
	li	a4,1
	sw	a4,4(a5)
	li	a1,4
	call	realloc
	lw	a5,0(sp)
	sw	a0,8(a5)
	j	.L612
.L610:
	lla	a0,.LC3
	call	printf
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	a0,32(sp)
	lw	s1,52(sp)
	addi	sp,sp,64
	jr	ra
	.size	encodeMessage, .-encodeMessage
	.globl	__mulsi3
	.section	.rodata.decodeMessage.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"%c"
	.section	.text.decodeMessage,"ax",@progbits
	.align	2
	.globl	decodeMessage
	.hidden	decodeMessage
	.type	decodeMessage, @function
decodeMessage:
	addi	sp,sp,-64
	sw	a2,0(sp)
	sw	ra,60(sp)
	sw	a3,40(sp)
	sw	a4,44(sp)
	sw	a1,36(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	a0,32(sp)
	call	__mulsi3
	call	malloc
	mv	a5,a0
	li	a0,12
	sw	a5,48(sp)
	call	malloc
	mv	s0,a0
	li	s1,20
	li	a1,4
	li	a0,20
	sw	zero,0(s0)
	sw	s1,4(s0)
	call	calloc
	mv	a5,a0
	li	a0,12
	sw	a5,8(s0)
	call	malloc
	mv	a4,a0
	li	a1,4
	sw	zero,0(a4)
	sw	s1,4(a4)
	li	a0,20
	sw	a4,4(sp)
	call	calloc
	lw	a4,4(sp)
	mv	a5,a0
	li	a0,12
	sw	a5,8(a4)
	call	malloc
	mv	a3,a0
	li	a1,4
	li	a0,20
	sw	s1,4(a3)
	sw	a3,20(sp)
	call	calloc
	lw	a4,20(sp)
	li	a5,1
	lw	a2,0(sp)
	sw	a5,0(a4)
	sw	a0,8(a4)
	lw	a4,32(sp)
	li	a5,128
	sw	a5,0(a0)
	sw	a2,24(sp)
	sw	zero,28(sp)
	lw	a5,48(sp)
	ble	a4,zero,.L636
.L635:
	lw	a2,44(sp)
	lw	a1,40(sp)
	lw	a0,24(sp)
	mv	a3,s0
	mv	s1,a5
	sw	a5,8(sp)
	sw	a5,0(sp)
	call	bignum_modpow
	lw	a4,36(sp)
	add	a5,s1,a4
	sw	a5,16(sp)
	lla	s1,.LANCHOR13
	lw	a5,8(sp)
	bgt	a4,zero,.L634
	j	.L653
.L654:
	lw	a0,8(s0)
.L638:
	lla	a5,.LANCHOR14
	lw	a1,8(a5)
	slli	a2,a2,2
	call	memcpy
	lw	a2,4(sp)
	lw	a5,0(s1)
	lw	a4,4(s1)
	lw	a3,4(a2)
	sw	a5,0(a2)
	bgt	a4,a3,.L639
	lw	a4,8(a2)
.L640:
	lw	a1,8(s1)
	slli	a2,a5,2
	mv	a0,a4
	sw	a5,8(sp)
	sw	a4,12(sp)
	call	memcpy
	lw	a5,8(sp)
	lla	a0,.LC4
	li	a3,0
	beq	a5,zero,.L641
	lw	a4,12(sp)
	lw	a5,0(a4)
	andi	a3,a5,0xff
	andi	a5,a5,255
.L641:
	lw	a4,0(sp)
	mv	a1,a5
	sb	a3,0(a4)
	addi	a5,a4,1
	sw	a5,0(sp)
	call	printf
	lw	a5,0(sp)
	lw	a4,16(sp)
	beq	a5,a4,.L642
.L634:
	lw	a3,20(sp)
	mv	a2,s0
	mv	a1,s1
	lla	a0,.LANCHOR14
	call	bignum_divide
	lla	a5,.LANCHOR14
	lw	a2,0(a5)
	lw	a4,4(s0)
	lw	a5,4(a5)
	sw	a2,0(s0)
	ble	a5,a4,.L654
	lw	a0,8(s0)
	slli	a1,a5,2
	sw	a2,8(sp)
	sw	a5,4(s0)
	call	realloc
	lw	a2,8(sp)
	sw	a0,8(s0)
	j	.L638
.L639:
	sw	a5,8(sp)
	lw	a5,4(sp)
	slli	a1,a4,2
	lw	a0,8(a5)
	sw	a4,4(a5)
	call	realloc
	lw	a5,4(sp)
	mv	a4,a0
	sw	a0,8(a5)
	lw	a5,8(sp)
	j	.L640
.L653:
	add	a5,a5,a4
	sw	a5,16(sp)
.L642:
	lw	a5,28(sp)
	lw	a3,32(sp)
	addi	a4,a5,1
	lw	a5,24(sp)
	sw	a4,28(sp)
	addi	a5,a5,12
	sw	a5,24(sp)
	lw	a5,16(sp)
	bne	a3,a4,.L635
.L636:
	lla	a0,.LC3
	call	printf
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	a0,48(sp)
	lw	s1,52(sp)
	addi	sp,sp,64
	jr	ra
	.size	decodeMessage, .-decodeMessage
	.section	.text.bench_init,"ax",@progbits
	.align	2
	.globl	bench_init
	.hidden	bench_init
	.type	bench_init, @function
bench_init:
	slli	a0,a0,4
	lla	a5,.LANCHOR44
	addi	sp,sp,-12
	add	a5,a5,a0
	li	a0,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	la a4, .LANCHOR43; sw a5, 0(a4);
	call	bench_srand
	li	a0,12
	call	malloc
	li	s0,20
	mv	s1,a0
	li	a1,4
	sw	s0,4(s1)
	sw	zero,0(s1)
	li	a0,20
	call	calloc
	mv	a5,a0
	sw	a5,8(s1)
	li	a0,12
	la a5, .LANCHOR45; sw s1, 0(a5);
	call	malloc
	mv	s1,a0
	li	a1,4
	sw	s0,4(s1)
	sw	zero,0(s1)
	li	a0,20
	call	calloc
	mv	a5,a0
	sw	a5,8(s1)
	li	a0,12
	la a5, .LANCHOR46; sw s1, 0(a5);
	call	malloc
	mv	s1,a0
	li	a1,4
	sw	s0,4(s1)
	sw	zero,0(s1)
	li	a0,20
	call	calloc
	mv	a5,a0
	sw	a5,8(s1)
	li	a0,12
	la a5, .LANCHOR47; sw s1, 0(a5);
	call	malloc
	mv	s1,a0
	li	a1,4
	sw	s0,4(s1)
	sw	zero,0(s1)
	li	a0,20
	call	calloc
	mv	a5,a0
	sw	a5,8(s1)
	li	a0,12
	la a5, .LANCHOR48; sw s1, 0(a5);
	call	malloc
	mv	s1,a0
	li	a1,4
	sw	s0,4(s1)
	sw	zero,0(s1)
	li	a0,20
	call	calloc
	mv	a5,a0
	sw	a5,8(s1)
	li	a0,12
	la a5, .LANCHOR49; sw s1, 0(a5);
	call	malloc
	mv	s1,a0
	li	a1,4
	sw	s0,4(s1)
	sw	zero,0(s1)
	li	a0,20
	call	calloc
	mv	a5,a0
	sw	a5,8(s1)
	li	a0,12
	la a5, .LANCHOR50; sw s1, 0(a5);
	call	malloc
	mv	s1,a0
	li	a1,4
	sw	s0,4(s1)
	sw	zero,0(s1)
	li	a0,20
	call	calloc
	mv	a5,a0
	sw	a5,8(s1)
	li	a0,12
	la a5, .LANCHOR51; sw s1, 0(a5);
	call	malloc
	mv	s1,a0
	li	a1,4
	sw	s0,4(s1)
	sw	zero,0(s1)
	li	a0,20
	call	calloc
	mv	a5,a0
	sw	a5,8(s1)
	li	a0,12
	la a5, .LANCHOR52; sw s1, 0(a5);
	call	malloc
	mv	s1,a0
	li	a1,4
	sw	s0,4(s1)
	sw	zero,0(s1)
	li	a0,20
	call	calloc
	mv	a5,a0
	sw	a5,8(s1)
	li	a0,12
	la a5, .LANCHOR53; sw s1, 0(a5);
	call	malloc
	mv	s1,a0
	sw	s0,4(s1)
	sw	zero,0(s1)
	li	a1,4
	li	a0,20
	call	calloc
	lw	ra,8(sp)
	lw	s0,4(sp)
	sw	a0,8(s1)
	la a5, .LANCHOR54; sw s1, 0(a5);
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	bench_init, .-bench_init
	.section	.rodata.bench_run.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"Got first prime factor, p = "
	.align	2
.LC6:
	.string	"Got second prime factor, q = "
	.align	2
.LC7:
	.string	"Got modulus, n = pq = "
	.align	2
.LC8:
	.string	"Got totient, phi = "
	.align	2
.LC9:
	.string	"Chose public exponent, e = "
	.align	2
.LC10:
	.string	"\nPublic key is ("
	.align	2
.LC11:
	.string	", "
	.align	2
.LC12:
	.string	")\n"
	.align	2
.LC13:
	.string	"Calculated private exponent, d = "
	.align	2
.LC14:
	.string	"\nPrivate key is ("
	.align	2
.LC15:
	.string	"Opening file \"%s\" for reading\n"
	.align	2
.LC16:
	.string	"r"
	.align	2
.LC17:
	.string	"Failed to open file \"%s\". Does it exist?\n"
	.align	2
.LC18:
	.string	"File \"%s\" read successfully, %d bytes read. Encoding byte stream in chunks of %d bytes\n"
	.align	2
.LC19:
	.string	"\n\nEncoding finished successfully\n"
	.align	2
.LC20:
	.string	"Decoding encoded message\n"
	.align	2
.LC21:
	.string	"\n\nFinished RSA demonstration!\n"
	.section	.text.bench_run,"ax",@progbits
	.align	2
	.globl	bench_run
	.hidden	bench_run
	.type	bench_run, @function
bench_run:
	addi	sp,sp,-24
	sw	s1,12(sp)
	lla	s1,.LANCHOR43
	lw	a5,0(s1)
	sw	s0,16(sp)
	lla	s0,.LANCHOR45
	lw	a1,0(s0)
	lw	a0,4(a5)
	sw	ra,20(sp)
	call	randPrime
	lla	a0,.LC5
	call	printf
	lw	a0,0(s0)
	call	bignum_print
	lla	a0,.LC3
	call	printf
	lw	a5,0(s1)
	lla	a4,.LANCHOR46
	lw	a1,0(a4)
	lw	a0,4(a5)
	lla	s1,.LANCHOR55
	call	randPrime
	lla	a0,.LC6
	call	printf
	lla	a4,.LANCHOR46
	lw	a0,0(a4)
	call	bignum_print
	lla	a0,.LC3
	call	printf
	lla	a4,.LANCHOR46
	lla	a5,.LANCHOR47
	lw	a2,0(a4)
	lw	a1,0(s0)
	lw	a0,0(a5)
	call	bignum_multiply
	lla	a0,.LC7
	call	printf
	lla	a5,.LANCHOR47
	lw	a0,0(a5)
	call	bignum_print
	lla	a0,.LC3
	call	printf
	lw	a1,0(s0)
	la s0, .LANCHOR53; lw s0, 0(s0);
	mv	a0,s0
	lla	a2,.LANCHOR3+12
	call	bignum_subtract
	lla	a4,.LANCHOR46
	lw	a1,0(a4)
	la a5, .LANCHOR54; lw a5, 0(a5);
	mv	a0,a5
	lla	a2,.LANCHOR3+12
	sw	a5,0(sp)
	call	bignum_subtract
	lw	a5,0(sp)
	lla	a4,.LANCHOR48
	lw	a0,0(a4)
	mv	a2,a5
	mv	a1,s0
	call	bignum_multiply
	lla	a0,.LC8
	call	printf
	lla	a4,.LANCHOR48
	lw	a0,0(a4)
	mv	s0,a4
	call	bignum_print
	lla	a0,.LC3
	call	printf
	lla	a4,.LANCHOR49
	lw	a2,0(a4)
	lw	a0,0(s0)
	li	a1,-2147483648
	xori	a1,a1,-1
	call	randExponent
	lla	a0,.LC9
	call	printf
	lla	a3,.LANCHOR49
	lw	a0,0(a3)
	mv	s0,a3
	call	bignum_print
	lla	a0,.LC10
	call	printf
	lw	a0,0(s0)
	lla	s0,.LANCHOR47
	call	bignum_print
	lla	a0,.LC11
	call	printf
	lw	a0,0(s0)
	call	bignum_print
	lla	a0,.LC12
	call	printf
	lla	a4,.LANCHOR48
	lla	a3,.LANCHOR49
	lla	a5,.LANCHOR50
	lw	a0,0(a3)
	lw	a2,0(a5)
	lw	a1,0(a4)
	call	bignum_inverse
	lla	a0,.LC13
	call	printf
	lla	a5,.LANCHOR50
	lw	a0,0(a5)
	call	bignum_print
	lla	a0,.LC14
	call	printf
	lla	a5,.LANCHOR50
	lw	a0,0(a5)
	call	bignum_print
	lla	a0,.LC11
	call	printf
	lw	a0,0(s0)
	call	bignum_print
	lla	a0,.LC12
	call	printf
	lla	a5,.LANCHOR52
	lw	s0,0(a5)
	li	a3,-1
	li	a5,1
	lw	a4,4(s0)
	sw	a3,0(s1)
	sw	a5,0(s0)
	lw	a0,8(s0)
	ble	a4,zero,.L658
.L659:
	lla	a5,.LANCHOR51
	lw	s0,0(a5)
	li	a4,128
	sw	a4,0(a0)
	lw	a3,4(s0)
	li	a4,1
	sw	a4,0(s0)
	lw	a0,8(s0)
	ble	a3,zero,.L667
.L660:
	li	a4,1
	sw	a4,0(a0)
	j	.L661
.L663:
	lla	a5,.LANCHOR2
	lw	a1,8(a5)
	slli	a2,a2,2
	call	memcpy
	lw	a5,0(s1)
	lla	a4,.LANCHOR51
	lw	s0,0(a4)
	addi	a5,a5,1
	sw	a5,0(s1)
.L661:
	lla	a5,.LANCHOR47
	lw	a1,0(a5)
	mv	a0,s0
	call	bignum_less
	mv	a5,a0
	mv	a1,s0
	lla	a0,.LANCHOR2
	beq	a5,zero,.L668
	lla	a5,.LANCHOR52
	lw	a2,0(a5)
	call	bignum_multiply
	lla	a5,.LANCHOR2
	lw	a2,0(a5)
	lw	a1,4(a5)
	lw	a5,4(s0)
	sw	a2,0(s0)
	lw	a0,8(s0)
	ble	a1,a5,.L663
	sw	a1,4(s0)
	slli	a1,a1,2
	call	realloc
	lw	a2,0(s0)
	sw	a0,8(s0)
	j	.L663
.L668:
	lla	s0,.LANCHOR43
	lw	a5,0(s0)
	lla	a0,.LC15
	lw	a1,0(a5)
	call	printf
	lw	a5,0(s0)
	lla	a1,.LC16
	lw	a0,0(a5)
	call	fopen
	mv	a5,a0
	beq	a0,zero,.L669
.L665:
	lw	a2,0(s1)
	lla	t1,.LANCHOR56
	mv	a1,t1
	mv	a0,a5
	sw	a5,0(sp)
	call	readFile
	lw	a5,0(sp)
	mv	a4,a0
	lla	s0,.LANCHOR57
	mv	a0,a5
	sw	a4,0(s0)
	call	fclose
	lla	a5,.LANCHOR43
	lw	a5,0(a5)
	lw	a3,0(s1)
	lw	a2,0(s0)
	lw	a1,0(a5)
	lla	a0,.LC18
	call	printf
	lla	t1,.LANCHOR56
	lla	a4,.LANCHOR47
	lla	a3,.LANCHOR49
	lw	a2,0(t1)
	lw	a1,0(s1)
	lw	a4,0(a4)
	lw	a3,0(a3)
	lw	a0,0(s0)
	call	encodeMessage
	mv	a5,a0
	lla	a3,.LANCHOR58
	lla	a0,.LC19
	sw	a5,0(a3)
	call	printf
	lla	a0,.LC20
	call	printf
	lla	a4,.LANCHOR47
	lw	a4,0(a4)
	lw	s1,0(s1)
	lw	a0,0(s0)
	sw	a4,8(sp)
	lla	a4,.LANCHOR50
	lw	a3,0(a4)
	mv	a1,s1
	sw	a3,4(sp)
	lla	a3,.LANCHOR58
	lw	a2,0(a3)
	sw	a2,0(sp)
	call	__divsi3
	lw	a4,8(sp)
	lw	a3,4(sp)
	lw	a2,0(sp)
	mv	a1,s1
	call	decodeMessage
	mv	a5,a0
	lla	a0,.LC21
	la a4, .LANCHOR59; sw a5, 0(a4);
	call	printf
	lla	a5,.LANCHOR43
	lw	a5,0(a5)
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	a0,8(a5)
	lw	a1,12(a5)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L658:
	sw	a5,4(s0)
	li	a1,4
	call	realloc
	sw	a0,8(s0)
	j	.L659
.L667:
	sw	a4,4(s0)
	li	a1,4
	call	realloc
	sw	a0,8(s0)
	j	.L660
.L669:
	lw	a4,0(s0)
	sw	a0,0(sp)
	lla	a0,.LC17
	lw	a1,0(a4)
	call	printf
	li	a0,1
	call	bench_exit
	lw	a5,0(sp)
	j	.L665
	.size	bench_run, .-bench_run
	.section	.rodata.bench_validate.str1.4,"aMS",@progbits,1
	.align	2
.LC22:
	.string	"bytes %d different: expect %02x, get %02x\n"
	.section	.text.bench_validate,"ax",@progbits
	.align	2
	.globl	bench_validate
	.hidden	bench_validate
	.type	bench_validate, @function
bench_validate:
	addi	sp,sp,-28
	sw	s0,20(sp)
	sw	s1,16(sp)
	lla	a5,.LANCHOR56
	lla	s0,.LANCHOR57
	lla	s1,.LANCHOR59
	lw	a2,0(s0)
	lw	a1,0(s1)
	lw	a0,0(a5)
	sw	ra,24(sp)
	call	memcmp
	sw	a0,8(sp)
	beq	a0,zero,.L671
	lw	a4,0(s1)
	lw	a0,0(s0)
	sw	a4,4(sp)
	ble	a0,zero,.L672
	li	s1,0
	lla	t1,.LC22
.L674:
	lla	a5,.LANCHOR56
	lw	a5,0(a5)
	add	a3,a4,s1
	lbu	a3,0(a3)
	add	a5,a5,s1
	lbu	a2,0(a5)
	mv	a1,s1
	mv	a0,t1
	addi	s1,s1,1
	beq	a2,a3,.L673
	call	printf
	lla	a5,.LANCHOR59
	lw	a4,0(a5)
	lla	t1,.LC22
.L673:
	lw	a0,0(s0)
	bgt	a0,s1,.L674
	sw	a4,4(sp)
.L672:
	la a1, .LANCHOR55; lw a1, 0(a1);
	call	__divsi3
	la a5, .LANCHOR58; lw a5, 0(a5);
	sw	a5,12(sp)
	sw	a0,0(sp)
	addi	s0,a5,8
	li	s1,0
	ble	a0,zero,.L677
.L676:
	lw	a0,0(s0)
	addi	s1,s1,1
	addi	s0,s0,12
	call	free
	lw	a5,0(sp)
	bne	a5,s1,.L676
.L677:
	lw	a0,12(sp)
	call	free
	lw	a0,4(sp)
	call	free
	lla	a5,.LANCHOR56
	lw	a0,0(a5)
	call	free
	la s0, .LANCHOR45; lw s0, 0(s0);
	lw	a0,8(s0)
	call	free
	mv	a0,s0
	call	free
	la s0, .LANCHOR46; lw s0, 0(s0);
	lw	a0,8(s0)
	call	free
	mv	a0,s0
	call	free
	la s0, .LANCHOR47; lw s0, 0(s0);
	lw	a0,8(s0)
	call	free
	mv	a0,s0
	call	free
	la s0, .LANCHOR48; lw s0, 0(s0);
	lw	a0,8(s0)
	call	free
	mv	a0,s0
	call	free
	la s0, .LANCHOR49; lw s0, 0(s0);
	lw	a0,8(s0)
	call	free
	mv	a0,s0
	call	free
	la s0, .LANCHOR50; lw s0, 0(s0);
	lw	a0,8(s0)
	call	free
	mv	a0,s0
	call	free
	la s0, .LANCHOR51; lw s0, 0(s0);
	lw	a0,8(s0)
	call	free
	mv	a0,s0
	call	free
	la s0, .LANCHOR52; lw s0, 0(s0);
	lw	a0,8(s0)
	call	free
	mv	a0,s0
	call	free
	la s0, .LANCHOR53; lw s0, 0(s0);
	lw	a0,8(s0)
	call	free
	mv	a0,s0
	call	free
	la s0, .LANCHOR54; lw s0, 0(s0);
	lw	a0,8(s0)
	call	free
	mv	a0,s0
	call	free
	lw	a5,8(sp)
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	snez	a0,a5
	addi	sp,sp,28
	jr	ra
.L671:
	lla	a5,.LANCHOR59
	lw	a5,0(a5)
	lw	a0,0(s0)
	sw	a5,4(sp)
	j	.L672
	.size	bench_validate, .-bench_validate
	.hidden	NUMS
	.globl	NUMS
	.hidden	DATA10
	.globl	DATA10
	.hidden	DATA9
	.globl	DATA9
	.hidden	DATA8
	.globl	DATA8
	.hidden	DATA7
	.globl	DATA7
	.hidden	DATA6
	.globl	DATA6
	.hidden	DATA5
	.globl	DATA5
	.hidden	DATA4
	.globl	DATA4
	.hidden	DATA3
	.globl	DATA3
	.hidden	DATA2
	.globl	DATA2
	.hidden	DATA1
	.globl	DATA1
	.hidden	DATA0
	.globl	DATA0
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC23:
	.string	"input/test.txt"
	.align	2
.LC24:
	.string	"input/train.txt"
	.align	2
.LC25:
	.string	"input/ref.txt"
	.section	.bss.a_obj.19,"aw",@nobits
	.align	2
	.set	.LANCHOR23,. + 0
	.type	a_obj.19, @object
	.size	a_obj.19, 12
a_obj.19:
	.zero	12
	.section	.bss.a_obj.23,"aw",@nobits
	.align	2
	.set	.LANCHOR19,. + 0
	.type	a_obj.23, @object
	.size	a_obj.23, 12
a_obj.23:
	.zero	12
	.section	.bss.a_obj.6,"aw",@nobits
	.align	2
	.set	.LANCHOR33,. + 0
	.type	a_obj.6, @object
	.size	a_obj.6, 12
a_obj.6:
	.zero	12
	.section	.bss.ab_obj.4,"aw",@nobits
	.align	2
	.set	.LANCHOR38,. + 0
	.type	ab_obj.4, @object
	.size	ab_obj.4, 12
ab_obj.4:
	.zero	12
	.section	.bss.acur_obj.10,"aw",@nobits
	.align	2
	.set	.LANCHOR32,. + 0
	.type	acur_obj.10, @object
	.size	acur_obj.10, 12
acur_obj.10:
	.zero	12
	.section	.bss.aux_obj.13,"aw",@nobits
	.align	2
	.set	.LANCHOR29,. + 0
	.type	aux_obj.13, @object
	.size	aux_obj.13, 12
aux_obj.13:
	.zero	12
	.section	.bss.auxprev_obj.14,"aw",@nobits
	.align	2
	.set	.LANCHOR28,. + 0
	.type	auxprev_obj.14, @object
	.size	auxprev_obj.14, 12
auxprev_obj.14:
	.zero	12
	.section	.bss.b1copy_obj.28,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	b1copy_obj.28, @object
	.size	b1copy_obj.28, 12
b1copy_obj.28:
	.zero	12
	.section	.bss.b2copy_obj.29,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	b2copy_obj.29, @object
	.size	b2copy_obj.29, 12
b2copy_obj.29:
	.zero	12
	.section	.bss.b_obj.18,"aw",@nobits
	.align	2
	.set	.LANCHOR24,. + 0
	.type	b_obj.18, @object
	.size	b_obj.18, 12
b_obj.18:
	.zero	12
	.section	.bss.b_obj.22,"aw",@nobits
	.align	2
	.set	.LANCHOR20,. + 0
	.type	b_obj.22, @object
	.size	b_obj.22, 12
b_obj.22:
	.zero	12
	.section	.bss.c_obj.21,"aw",@nobits
	.align	2
	.set	.LANCHOR21,. + 0
	.type	c_obj.21, @object
	.size	c_obj.21, 12
c_obj.21:
	.zero	12
	.section	.bss.copy_obj.41,"aw",@nobits
	.align	2
	.set	.LANCHOR17,. + 0
	.type	copy_obj.41, @object
	.size	copy_obj.41, 12
copy_obj.41:
	.zero	12
	.section	.bss.discard_obj.20,"aw",@nobits
	.align	2
	.set	.LANCHOR22,. + 0
	.type	discard_obj.20, @object
	.size	discard_obj.20, 12
discard_obj.20:
	.zero	12
	.section	.bss.gcd_obj.0,"aw",@nobits
	.align	2
	.set	.LANCHOR42,. + 0
	.type	gcd_obj.0, @object
	.size	gcd_obj.0, 12
gcd_obj.0:
	.zero	12
	.section	.bss.modpow_obj.1,"aw",@nobits
	.align	2
	.set	.LANCHOR41,. + 0
	.type	modpow_obj.1, @object
	.size	modpow_obj.1, 12
modpow_obj.1:
	.zero	12
	.section	.bss.n_obj.5,"aw",@nobits
	.align	2
	.set	.LANCHOR34,. + 0
	.type	n_obj.5, @object
	.size	n_obj.5, 12
n_obj.5:
	.zero	12
	.section	.bss.pow_obj.2,"aw",@nobits
	.align	2
	.set	.LANCHOR40,. + 0
	.type	pow_obj.2, @object
	.size	pow_obj.2, 12
pow_obj.2:
	.zero	12
	.section	.bss.q_obj.31,"aw",@nobits
	.align	2
	.set	.LANCHOR16,. + 0
	.type	q_obj.31, @object
	.size	q_obj.31, 12
q_obj.31:
	.zero	12
	.section	.bss.q_obj.32,"aw",@nobits
	.align	2
	.set	.LANCHOR10,. + 0
	.type	q_obj.32, @object
	.size	q_obj.32, 12
q_obj.32:
	.zero	12
	.section	.bss.q_obj.34,"aw",@nobits
	.align	2
	.set	.LANCHOR14,. + 0
	.type	q_obj.34, @object
	.size	q_obj.34, 12
q_obj.34:
	.zero	12
	.section	.bss.q_obj.36,"aw",@nobits
	.align	2
	.set	.LANCHOR12,. + 0
	.type	q_obj.36, @object
	.size	q_obj.36, 12
q_obj.36:
	.zero	12
	.section	.bss.qcur_obj.11,"aw",@nobits
	.align	2
	.set	.LANCHOR31,. + 0
	.type	qcur_obj.11, @object
	.size	qcur_obj.11, 12
qcur_obj.11:
	.zero	12
	.section	.bss.quottemp_obj.24,"aw",@nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	quottemp_obj.24, @object
	.size	quottemp_obj.24, 12
quottemp_obj.24:
	.zero	12
	.section	.bss.r_obj.30,"aw",@nobits
	.align	2
	.set	.LANCHOR15,. + 0
	.type	r_obj.30, @object
	.size	r_obj.30, 12
r_obj.30:
	.zero	12
	.section	.bss.r_obj.33,"aw",@nobits
	.align	2
	.set	.LANCHOR13,. + 0
	.type	r_obj.33, @object
	.size	r_obj.33, 12
r_obj.33:
	.zero	12
	.section	.bss.r_obj.35,"aw",@nobits
	.align	2
	.set	.LANCHOR11,. + 0
	.type	r_obj.35, @object
	.size	r_obj.35, 12
r_obj.35:
	.zero	12
	.section	.bss.rcur_obj.12,"aw",@nobits
	.align	2
	.set	.LANCHOR30,. + 0
	.type	rcur_obj.12, @object
	.size	rcur_obj.12, 12
rcur_obj.12:
	.zero	12
	.section	.bss.rem_obj.15,"aw",@nobits
	.align	2
	.set	.LANCHOR27,. + 0
	.type	rem_obj.15, @object
	.size	rem_obj.15, 12
rem_obj.15:
	.zero	12
	.section	.bss.remainder_obj.40,"aw",@nobits
	.align	2
	.set	.LANCHOR18,. + 0
	.type	remainder_obj.40, @object
	.size	remainder_obj.40, 12
remainder_obj.40:
	.zero	12
	.section	.bss.remainder_obj.9,"aw",@nobits
	.align	2
	.set	.LANCHOR36,. + 0
	.type	remainder_obj.9, @object
	.size	remainder_obj.9, 12
remainder_obj.9:
	.zero	12
	.section	.bss.remprev_obj.16,"aw",@nobits
	.align	2
	.set	.LANCHOR26,. + 0
	.type	remprev_obj.16, @object
	.size	remprev_obj.16, 12
remprev_obj.16:
	.zero	12
	.section	.bss.res_obj.3,"aw",@nobits
	.align	2
	.set	.LANCHOR39,. + 0
	.type	res_obj.3, @object
	.size	res_obj.3, 12
res_obj.3:
	.zero	12
	.section	.bss.temp2_obj.26,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	temp2_obj.26, @object
	.size	temp2_obj.26, 12
temp2_obj.26:
	.zero	12
	.section	.bss.temp3_obj.25,"aw",@nobits
	.align	2
	.set	.LANCHOR9,. + 0
	.type	temp3_obj.25, @object
	.size	temp3_obj.25, 12
temp3_obj.25:
	.zero	12
	.section	.bss.temp_obj.17,"aw",@nobits
	.align	2
	.set	.LANCHOR25,. + 0
	.type	temp_obj.17, @object
	.size	temp_obj.17, 12
temp_obj.17:
	.zero	12
	.section	.bss.temp_obj.27,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	temp_obj.27, @object
	.size	temp_obj.27, 12
temp_obj.27:
	.zero	12
	.section	.bss.temp_obj.37,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	temp_obj.37, @object
	.size	temp_obj.37, 12
temp_obj.37:
	.zero	12
	.section	.bss.temp_obj.38,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	temp_obj.38, @object
	.size	temp_obj.38, 12
temp_obj.38:
	.zero	12
	.section	.bss.temp_obj.39,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	temp_obj.39, @object
	.size	temp_obj.39, 12
temp_obj.39:
	.zero	12
	.section	.bss.temp_obj.7,"aw",@nobits
	.align	2
	.set	.LANCHOR37,. + 0
	.type	temp_obj.7, @object
	.size	temp_obj.7, 12
temp_obj.7:
	.zero	12
	.section	.bss.twos_obj.8,"aw",@nobits
	.align	2
	.set	.LANCHOR35,. + 0
	.type	twos_obj.8, @object
	.size	twos_obj.8, 12
twos_obj.8:
	.zero	12
	.section	.data.NUMS,"aw"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	NUMS, @object
	.size	NUMS, 132
NUMS:
	.word	1
	.word	1
	.word	DATA0
	.word	1
	.word	1
	.word	DATA1
	.word	1
	.word	1
	.word	DATA2
	.word	1
	.word	1
	.word	DATA3
	.word	1
	.word	1
	.word	DATA4
	.word	1
	.word	1
	.word	DATA5
	.word	1
	.word	1
	.word	DATA6
	.word	1
	.word	1
	.word	DATA7
	.word	1
	.word	1
	.word	DATA8
	.word	1
	.word	1
	.word	DATA9
	.word	1
	.word	1
	.word	DATA10
	.section	.rodata.settings,"a"
	.align	3
	.set	.LANCHOR44,. + 0
	.type	settings, @object
	.size	settings, 64
settings:
	.word	.LC23
	.word	2
	.word	0
	.word	0
	.word	.LC24
	.word	6
	.word	217
	.word	0
	.word	.LC25
	.word	100
	.word	516106
	.word	0
	.word	.LC25
	.word	512
	.word	118110931
	.word	0
	.section	.sbss.DATA0,"aw",@nobits
	.align	2
	.type	DATA0, @object
	.size	DATA0, 4
DATA0:
	.zero	4
	.section	.sbss.bbytes,"aw",@nobits
	.align	2
	.set	.LANCHOR51,. + 0
	.type	bbytes, @object
	.size	bbytes, 4
bbytes:
	.zero	4
	.section	.sbss.buffer,"aw",@nobits
	.align	2
	.set	.LANCHOR56,. + 0
	.type	buffer, @object
	.size	buffer, 4
buffer:
	.zero	4
	.section	.sbss.bytes,"aw",@nobits
	.align	2
	.set	.LANCHOR55,. + 0
	.type	bytes, @object
	.size	bytes, 4
bytes:
	.zero	4
	.section	.sbss.d,"aw",@nobits
	.align	2
	.set	.LANCHOR50,. + 0
	.type	d, @object
	.size	d, 4
d:
	.zero	4
	.section	.sbss.decoded,"aw",@nobits
	.align	2
	.set	.LANCHOR59,. + 0
	.type	decoded, @object
	.size	decoded, 4
decoded:
	.zero	4
	.section	.sbss.e,"aw",@nobits
	.align	2
	.set	.LANCHOR49,. + 0
	.type	e, @object
	.size	e, 4
e:
	.zero	4
	.section	.sbss.encoded,"aw",@nobits
	.align	2
	.set	.LANCHOR58,. + 0
	.type	encoded, @object
	.size	encoded, 4
encoded:
	.zero	4
	.section	.sbss.len,"aw",@nobits
	.align	2
	.set	.LANCHOR57,. + 0
	.type	len, @object
	.size	len, 4
len:
	.zero	4
	.section	.sbss.n,"aw",@nobits
	.align	2
	.set	.LANCHOR47,. + 0
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.section	.sbss.p,"aw",@nobits
	.align	2
	.set	.LANCHOR45,. + 0
	.type	p, @object
	.size	p, 4
p:
	.zero	4
	.section	.sbss.phi,"aw",@nobits
	.align	2
	.set	.LANCHOR48,. + 0
	.type	phi, @object
	.size	phi, 4
phi:
	.zero	4
	.section	.sbss.ps,"aw",@nobits
	.align	2
	.set	.LANCHOR43,. + 0
	.type	ps, @object
	.size	ps, 4
ps:
	.zero	4
	.section	.sbss.q,"aw",@nobits
	.align	2
	.set	.LANCHOR46,. + 0
	.type	q, @object
	.size	q, 4
q:
	.zero	4
	.section	.sbss.shift,"aw",@nobits
	.align	2
	.set	.LANCHOR52,. + 0
	.type	shift, @object
	.size	shift, 4
shift:
	.zero	4
	.section	.sbss.temp1,"aw",@nobits
	.align	2
	.set	.LANCHOR53,. + 0
	.type	temp1, @object
	.size	temp1, 4
temp1:
	.zero	4
	.section	.sbss.temp2,"aw",@nobits
	.align	2
	.set	.LANCHOR54,. + 0
	.type	temp2, @object
	.size	temp2, 4
temp2:
	.zero	4
	.section	.sdata.DATA1,"aw"
	.align	2
	.type	DATA1, @object
	.size	DATA1, 4
DATA1:
	.word	1
	.section	.sdata.DATA10,"aw"
	.align	2
	.type	DATA10, @object
	.size	DATA10, 4
DATA10:
	.word	10
	.section	.sdata.DATA2,"aw"
	.align	2
	.type	DATA2, @object
	.size	DATA2, 4
DATA2:
	.word	2
	.section	.sdata.DATA3,"aw"
	.align	2
	.type	DATA3, @object
	.size	DATA3, 4
DATA3:
	.word	3
	.section	.sdata.DATA4,"aw"
	.align	2
	.type	DATA4, @object
	.size	DATA4, 4
DATA4:
	.word	4
	.section	.sdata.DATA5,"aw"
	.align	2
	.type	DATA5, @object
	.size	DATA5, 4
DATA5:
	.word	5
	.section	.sdata.DATA6,"aw"
	.align	2
	.type	DATA6, @object
	.size	DATA6, 4
DATA6:
	.word	6
	.section	.sdata.DATA7,"aw"
	.align	2
	.type	DATA7, @object
	.size	DATA7, 4
DATA7:
	.word	7
	.section	.sdata.DATA8,"aw"
	.align	2
	.type	DATA8, @object
	.size	DATA8, 4
DATA8:
	.word	8
	.section	.sdata.DATA9,"aw"
	.align	2
	.type	DATA9, @object
	.size	DATA9, 4
DATA9:
	.word	9
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
