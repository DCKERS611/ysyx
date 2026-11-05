#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"core_state.c"
	.option nopic
	.text
	.section	.text.core_init_state,"ax",@progbits
	.align	2
	.globl	core_init_state
	.hidden	core_init_state
	.type	core_init_state, @function
core_init_state:
	addi	sp,sp,-12
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	a0,0(sp)
	addi	s0,a0,-1
	li	a5,1
	bleu	s0,a5,.L12
	addi	a1,a1,1
	slli	a1,a1,16
	srli	a1,a1,16
	srli	a5,a1,3
	li	s1,7
	andi	a3,a1,7
	li	a4,0
	andi	a5,a5,3
	beq	a3,s1,.L5
.L19:
	li	a0,4
	bgtu	a3,a0,.L6
	addi	a3,a3,-3
	slli	a3,a3,16
	srli	a3,a3,16
	li	a0,1
	slli	a5,a5,2
	bgtu	a3,a0,.L17
	lla	a3,.LANCHOR1
	add	a5,a3,a5
	lw	a5,0(a5)
	li	a0,9
	li	t1,8
.L8:
	add	a0,a4,a0
	bgeu	a0,s0,.L18
.L9:
	add	a4,a2,a4
	mv	a3,a4
	add	t2,a5,t1
.L4:
	lbu	t0,0(a5)
	addi	a5,a5,1
	addi	a3,a3,1
	sb	t0,-1(a3)
	bne	t2,a5,.L4
	addi	a1,a1,1
	slli	a1,a1,16
	add	a4,a4,t1
	li	a5,44
	srli	a1,a1,16
	sb	a5,0(a4)
	andi	a3,a1,7
	srli	a5,a1,3
	mv	a4,a0
	andi	a5,a5,3
	bne	a3,s1,.L19
.L5:
	slli	a5,a5,2
	lla	a3,.LANCHOR3
	li	a0,9
	add	a5,a3,a5
	add	a0,a4,a0
	lw	a5,0(a5)
	li	t1,8
	bltu	a0,s0,.L9
.L18:
	lw	a5,0(sp)
	bgeu	a4,a5,.L1
.L2:
	lw	a5,0(sp)
	add	a4,a2,a4
	add	a2,a2,a5
.L10:
	sb	zero,0(a4)
	addi	a4,a4,1
	bne	a2,a4,.L10
.L1:
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,12
	jr	ra
.L17:
	lla	a3,.LANCHOR0
	add	a5,a3,a5
	lw	a5,0(a5)
	li	a0,5
	li	t1,4
	j	.L8
.L6:
	slli	a5,a5,2
	lla	a3,.LANCHOR2
	add	a5,a3,a5
	lw	a5,0(a5)
	li	a0,9
	li	t1,8
	j	.L8
.L12:
	li	a4,0
	j	.L2
	.size	core_init_state, .-core_init_state
	.section	.text.core_state_transition,"ax",@progbits
	.align	2
	.globl	core_state_transition
	.hidden	core_state_transition
	.type	core_state_transition, @function
core_state_transition:
	lw	a4,0(a0)
	mv	t1,a0
	lbu	t0,0(a4)
	beq	t0,zero,.L81
	addi	sp,sp,-4
	sw	s0,0(sp)
	addi	t2,a4,1
	li	s0,44
	mv	a3,t2
	beq	t0,s0,.L82
	lw	a0,0(a1)
	addi	a5,t0,-48
	andi	a5,a5,0xff
	li	a2,9
	addi	a0,a0,1
	bgtu	a5,a2,.L32
	sw	a0,0(a1)
	lbu	a2,1(a4)
	beq	a2,zero,.L80
	beq	a2,s0,.L83
.L33:
	addi	a5,a2,-48
	li	a0,46
	li	t0,9
	li	t2,44
	andi	a5,a5,0xff
	addi	a4,a3,1
	beq	a2,a0,.L84
.L43:
	bgtu	a5,t0,.L85
	lbu	a2,0(a4)
	beq	a2,zero,.L86
	beq	a2,t2,.L61
	mv	a3,a4
	addi	a5,a2,-48
	andi	a5,a5,0xff
	addi	a4,a3,1
	bne	a2,a0,.L43
.L84:
	lw	a5,16(a1)
	addi	a5,a5,1
	sw	a5,16(a1)
	lbu	a5,1(a3)
	beq	a5,zero,.L87
	li	a2,44
	beq	a5,a2,.L88
.L27:
	addi	a3,a5,-48
	li	a0,69
	andi	a5,a5,223
	andi	a2,a3,0xff
	li	t0,9
	li	t2,44
	addi	a3,a4,1
	beq	a5,a0,.L89
.L46:
	bgtu	a2,t0,.L48
	lbu	a5,0(a3)
	beq	a5,zero,.L67
	beq	a5,t2,.L68
	mv	a4,a3
	addi	a3,a5,-48
	andi	a5,a5,223
	andi	a2,a3,0xff
	addi	a3,a4,1
	bne	a5,a0,.L46
.L89:
	lw	a5,20(a1)
	li	a0,3
	addi	a5,a5,1
	sw	a5,20(a1)
	lbu	a5,1(a4)
	beq	a5,zero,.L22
	li	a2,44
	beq	a5,a2,.L56
	lw	a0,12(a1)
	addi	a5,a5,-43
	andi	a5,a5,253
	addi	a0,a0,1
	addi	a3,a4,2
	beq	a5,zero,.L90
	lw	s0,0(sp)
	sw	a0,12(a1)
	sw	a3,0(t1)
	li	a0,1
	addi	sp,sp,4
	jr	ra
.L32:
	li	a5,45
	beq	t0,a5,.L34
	li	a5,46
	beq	t0,a5,.L35
	li	a5,43
	beq	t0,a5,.L34
	lw	a5,4(a1)
	lw	s0,0(sp)
	sw	a0,0(a1)
	addi	a5,a5,1
	sw	a5,4(a1)
	sw	a3,0(t1)
	li	a0,1
	addi	sp,sp,4
	jr	ra
.L85:
	lw	a5,16(a1)
	mv	a3,a4
	li	a0,1
	addi	a5,a5,1
	sw	a5,16(a1)
.L22:
	lw	s0,0(sp)
	sw	a3,0(t1)
	addi	sp,sp,4
	jr	ra
.L90:
	sw	a0,12(a1)
	lbu	a5,2(a4)
	li	a0,6
	beq	a5,zero,.L22
	beq	a5,a2,.L62
	lw	a3,24(a1)
	addi	a5,a5,-48
	andi	a5,a5,0xff
	li	t0,9
	addi	a0,a3,1
	addi	a3,a4,3
	bgtu	a5,t0,.L91
	sw	a0,24(a1)
	lbu	a5,3(a4)
	beq	a5,zero,.L69
	beq	a5,a2,.L70
	li	a4,9
	li	a2,44
.L24:
	addi	a5,a5,-48
	andi	a5,a5,0xff
	addi	a3,a3,1
	bgtu	a5,a4,.L51
	lbu	a5,0(a3)
	beq	a5,zero,.L69
	bne	a5,a2,.L24
	addi	t2,a3,1
	li	a0,7
	mv	a3,t2
.L94:
	lw	s0,0(sp)
	sw	a3,0(t1)
	addi	sp,sp,4
	jr	ra
.L91:
	lw	s0,0(sp)
	sw	a0,24(a1)
	sw	a3,0(t1)
	li	a0,1
	addi	sp,sp,4
	jr	ra
.L51:
	lw	a5,4(a1)
	li	a0,1
	addi	a5,a5,1
	sw	a5,4(a1)
	j	.L22
.L48:
	lw	a5,20(a1)
	li	a0,1
	addi	a5,a5,1
	sw	a5,20(a1)
	j	.L22
.L35:
	sw	a0,0(a1)
	lbu	a5,1(a4)
	beq	a5,zero,.L67
	beq	a5,s0,.L68
	mv	a4,t2
	j	.L27
.L34:
	sw	a0,0(a1)
	lbu	t0,1(a4)
	beq	t0,zero,.L65
	li	a0,44
	beq	t0,a0,.L92
	lw	a3,8(a1)
	addi	a5,t0,-48
	andi	a5,a5,0xff
	li	t2,9
	addi	a2,a3,1
	addi	a3,a4,2
	bleu	a5,t2,.L38
	li	a5,46
	beq	t0,a5,.L93
	sw	a2,8(a1)
	li	a0,1
	j	.L22
.L38:
	sw	a2,8(a1)
	lbu	a2,2(a4)
	beq	a2,zero,.L80
	bne	a2,a0,.L33
	addi	t2,a4,3
	li	a0,4
	mv	a3,t2
	j	.L94
.L93:
	sw	a2,8(a1)
	lbu	a5,2(a4)
	beq	a5,zero,.L67
	beq	a5,a0,.L60
	mv	a4,a3
	j	.L27
.L82:
	li	a0,0
	mv	a3,t2
	j	.L94
.L86:
	mv	a3,a4
.L80:
	li	a0,4
	j	.L22
.L83:
	addi	t2,a4,2
	li	a0,4
	mv	a3,t2
	j	.L94
.L69:
	li	a0,7
	j	.L22
.L81:
	li	a0,0
	sw	a4,0(t1)
	ret
.L67:
	li	a0,5
	j	.L22
.L56:
	addi	t2,a4,2
	li	a0,3
	mv	a3,t2
	j	.L94
.L62:
	addi	t2,a4,3
	li	a0,6
	mv	a3,t2
	j	.L94
.L70:
	addi	t2,a4,4
	li	a0,7
	mv	a3,t2
	j	.L94
.L68:
	addi	t2,a4,2
	li	a0,5
	mv	a3,t2
	j	.L94
.L87:
	mv	a3,a4
	li	a0,5
	j	.L22
.L88:
	addi	t2,a3,2
	li	a0,5
	mv	a3,t2
	j	.L94
.L61:
	addi	t2,a3,2
	li	a0,4
	mv	a3,t2
	j	.L94
.L60:
	addi	t2,a4,3
	li	a0,5
	mv	a3,t2
	j	.L94
.L92:
	addi	t2,t2,1
	li	a0,2
	mv	a3,t2
	j	.L94
.L65:
	li	a0,2
	j	.L22
	.size	core_state_transition, .-core_state_transition
	.section	.text.core_bench_state,"ax",@progbits
	.align	2
	.globl	core_bench_state
	.hidden	core_bench_state
	.type	core_bench_state, @function
core_bench_state:
	addi	sp,sp,-104
	sw	s0,96(sp)
	sw	a3,16(sp)
	sw	a4,0(sp)
	sw	a5,4(sp)
	sw	ra,100(sp)
	sw	s1,92(sp)
	mv	s0,a1
	sw	a0,20(sp)
	sw	a2,12(sp)
	sw	a1,24(sp)
	addi	a5,sp,60
	addi	a4,sp,28
	addi	a3,sp,92
.L96:
	sw	zero,0(a5)
	sw	zero,0(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	bne	a5,a3,.L96
	lbu	s1,0(s0)
	addi	a4,sp,24
	beq	s1,zero,.L100
.L97:
	mv	a0,a4
	addi	a1,sp,60
	sw	a4,8(sp)
	call	core_state_transition
	slli	a0,a0,2
	addi	a4,sp,24
	addi	a5,a0,68
	add	a0,a5,a4
	lw	a2,24(sp)
	lw	a3,-64(a0)
	lw	a4,8(sp)
	lbu	a2,0(a2)
	addi	a3,a3,1
	sw	a3,-64(a0)
	bne	a2,zero,.L97
.L100:
	lw	a5,20(sp)
	sw	s0,24(sp)
	mv	a4,s0
	add	a3,s0,a5
	li	a1,44
	bgtu	a3,s0,.L103
	j	.L122
.L123:
	lbu	s1,0(a4)
.L103:
	lw	a5,12(sp)
	xor	a2,s1,a5
	beq	s1,a1,.L101
	sb	a2,0(a4)
.L101:
	lw	a5,0(sp)
	add	a4,a4,a5
	bltu	a4,a3,.L123
	lbu	s1,0(s0)
	sw	s0,24(sp)
	beq	s1,zero,.L105
.L104:
	addi	a4,sp,24
.L107:
	addi	a1,sp,60
	mv	a0,a4
	sw	a3,12(sp)
	sw	a4,8(sp)
	call	core_state_transition
	slli	a0,a0,2
	addi	a4,sp,24
	addi	a5,a0,68
	add	a0,a5,a4
	lw	a1,24(sp)
	lw	a2,-64(a0)
	lw	a4,8(sp)
	lbu	a1,0(a1)
	addi	a2,a2,1
	sw	a2,-64(a0)
	lw	a3,12(sp)
	bne	a1,zero,.L107
	sw	s0,24(sp)
	bleu	a3,s0,.L106
.L105:
	li	a2,44
	j	.L110
.L124:
	lbu	s1,0(s0)
.L110:
	lw	a5,16(sp)
	xor	a4,s1,a5
	beq	s1,a2,.L109
	sb	a4,0(s0)
.L109:
	lw	a5,0(sp)
	add	s0,s0,a5
	bltu	s0,a3,.L124
.L106:
	li	s1,0
	li	s0,32
.L111:
	addi	a5,sp,28
	add	a4,a5,s1
	lw	a0,0(a4)
	lw	a1,4(sp)
	call	crcu32
	addi	a5,sp,60
	add	a4,a5,s1
	mv	a1,a0
	lw	a0,0(a4)
	addi	s1,s1,4
	call	crcu32
	sw	a0,4(sp)
	bne	s1,s0,.L111
	lw	ra,100(sp)
	lw	s0,96(sp)
	lw	s1,92(sp)
	addi	sp,sp,104
	jr	ra
.L122:
	bne	s1,zero,.L104
	j	.L106
	.size	core_bench_state, .-core_bench_state
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"T0.3e-1F"
	.align	2
.LC1:
	.string	"-T.T++Tq"
	.align	2
.LC2:
	.string	"1T3.4e4z"
	.align	2
.LC3:
	.string	"34.0e-T^"
	.align	2
.LC4:
	.string	"5.500e+3"
	.align	2
.LC5:
	.string	"-.123e-2"
	.align	2
.LC6:
	.string	"-87e+832"
	.align	2
.LC7:
	.string	"+0.6e-12"
	.align	2
.LC8:
	.string	"35.54400"
	.align	2
.LC9:
	.string	".1234500"
	.align	2
.LC10:
	.string	"-110.700"
	.align	2
.LC11:
	.string	"+0.64400"
	.align	2
.LC12:
	.string	"5012"
	.align	2
.LC13:
	.string	"1234"
	.align	2
.LC14:
	.string	"-874"
	.align	2
.LC15:
	.string	"+122"
	.section	.rodata.errpat,"a"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	errpat, @object
	.size	errpat, 16
errpat:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.section	.rodata.floatpat,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	floatpat, @object
	.size	floatpat, 16
floatpat:
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.section	.rodata.intpat,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	intpat, @object
	.size	intpat, 16
intpat:
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.section	.rodata.scipat,"a"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	scipat, @object
	.size	scipat, 16
scipat:
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
