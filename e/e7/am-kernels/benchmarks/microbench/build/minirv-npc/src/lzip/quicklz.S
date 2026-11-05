#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"quicklz.c"
	.option nopic
	.text
	.section	.rodata.bench_memcpy.part.0.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `dst&&src' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/am-kernels/benchmarks/microbench/src/lzip/quicklz.h:8  \n"
	.section	.text.bench_memcpy.part.0,"ax",@progbits
	.align	2
	.type	bench_memcpy.part.0, @function
bench_memcpy.part.0:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L2:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L2
	lla	s0,.LC1
	li	a0,65
.L3:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L3
	lla	s0,.LC2
	li	a0,32
.L4:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L4
	li	a0,1
	call	halt
	.size	bench_memcpy.part.0, .-bench_memcpy.part.0
	.section	.rodata.memcpy_up.constprop.0.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"Assertion `0' failed"
	.align	2
.LC4:
	.string	" @ /home/ysyx/ysyx-workbench/am-kernels/benchmarks/microbench/src/lzip/quicklz.c:149  \n"
	.section	.text.memcpy_up.constprop.0,"ax",@progbits
	.align	2
	.type	memcpy_up.constprop.0, @function
memcpy_up.constprop.0:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L11:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L11
	lla	s0,.LC3
	li	a0,65
.L12:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L12
	lla	s0,.LC4
	li	a0,32
.L13:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L13
	li	a0,1
	call	halt
	.size	memcpy_up.constprop.0, .-memcpy_up.constprop.0
	.section	.text.qlz_get_setting,"ax",@progbits
	.align	2
	.globl	qlz_get_setting
	.hidden	qlz_get_setting
	.type	qlz_get_setting, @function
qlz_get_setting:
	li	a5,9
	bgtu	a0,a5,.L20
	slli	a0,a0,2
	lla	a5,.LANCHOR0
	add	a5,a5,a0
	lw	a0,0(a5)
	ret
.L20:
	li	a0,-1
	ret
	.size	qlz_get_setting, .-qlz_get_setting
	.section	.text.qlz_size_decompressed,"ax",@progbits
	.align	2
	.globl	qlz_size_decompressed
	.hidden	qlz_size_decompressed
	.type	qlz_size_decompressed, @function
qlz_size_decompressed:
	lbu	a5,0(a0)
	andi	a5,a5,2
	beq	a5,zero,.L22
	li	a3,0
	li	a5,0
	li	a1,4
.L23:
	add	a4,a0,a5
	lbu	a4,5(a4)
	slli	a2,a5,3
	addi	a5,a5,1
	sll	a4,a4,a2
	or	a3,a3,a4
	bne	a5,a1,.L23
	li	a0,-1
	and	a0,a0,a3
	ret
.L22:
	lbu	a3,2(a0)
	li	a0,255
	and	a0,a0,a3
	ret
	.size	qlz_size_decompressed, .-qlz_size_decompressed
	.section	.text.qlz_size_compressed,"ax",@progbits
	.align	2
	.globl	qlz_size_compressed
	.hidden	qlz_size_compressed
	.type	qlz_size_compressed, @function
qlz_size_compressed:
	lbu	a5,0(a0)
	andi	a5,a5,2
	beq	a5,zero,.L28
	addi	a5,a0,1
	li	a4,0
	li	a0,0
	li	a2,32
.L29:
	lbu	a3,0(a5)
	addi	a5,a5,1
	sll	a3,a3,a4
	addi	a4,a4,8
	or	a0,a0,a3
	bne	a4,a2,.L29
	ret
.L28:
	lbu	a0,1(a0)
	ret
	.size	qlz_size_compressed, .-qlz_size_compressed
	.section	.text.qlz_size_header,"ax",@progbits
	.align	2
	.globl	qlz_size_header
	.hidden	qlz_size_header
	.type	qlz_size_header, @function
qlz_size_header:
	lbu	a0,0(a0)
	slli	a0,a0,30
	srai	a0,a0,31
	andi	a0,a0,6
	addi	a0,a0,3
	ret
	.size	qlz_size_header, .-qlz_size_header
	.section	.text.qlz_compress,"ax",@progbits
	.align	2
	.globl	qlz_compress
	.hidden	qlz_compress
	.type	qlz_compress, @function
qlz_compress:
	addi	sp,sp,-92
	mv	a4,a2
	sw	a2,64(sp)
	sw	ra,88(sp)
	sw	s0,84(sp)
	sw	s1,80(sp)
	addi	a2,a2,-1
	li	a5,-402
	sw	a0,48(sp)
	sw	a1,56(sp)
	sw	a3,4(sp)
	bgtu	a2,a5,.L80
	li	a3,3
	li	a5,215
	sw	a3,60(sp)
	bgtu	a4,a5,.L115
.L37:
	lw	a3,4(sp)
	li	a5,32768
	li	a4,36864
	addi	a5,a5,4
	addi	a4,a4,-2044
	add	a5,a3,a5
	add	a4,a3,a4
.L38:
	sb	zero,0(a5)
	addi	a5,a5,1
	bne	a4,a5,.L38
	lw	t2,48(sp)
	lw	a3,56(sp)
	add	a4,t2,a2
	lw	a2,60(sp)
	sw	a4,72(sp)
	add	a3,a3,a2
	addi	a1,a3,4
	addi	a2,a4,-10
	sw	a3,52(sp)
	sw	a2,36(sp)
	sw	a1,0(sp)
	bgtu	t2,a2,.L39
	lw	a5,64(sp)
	li	s0,-2147483648
	sw	a3,24(sp)
	srli	a5,a5,1
	add	a5,t2,a5
	sw	a5,44(sp)
	addi	a5,a4,-4
	sw	a5,40(sp)
	mv	s1,s0
.L40:
	lw	a5,40(sp)
	sub	t1,a5,t2
	li	a5,254
	ble	t1,a5,.L45
	li	t1,254
.L45:
	lbu	a5,1(t2)
	lbu	a4,2(t2)
	lbu	a3,0(t2)
	slli	a5,a5,8
	slli	a4,a4,16
	or	a5,a5,a4
	srli	a4,a5,9
	srli	a2,a5,13
	or	a3,a5,a3
	xor	a5,a4,a2
	lw	a1,4(sp)
	xor	a5,a5,a3
	andi	a5,a5,2047
	slli	a4,a5,4
	add	a2,a1,a4
	sw	a3,8(sp)
	lw	a3,4(a2)
	sw	a5,12(sp)
	addi	a0,t2,-2
	add	a5,a1,a5
	addi	t0,t1,1
	li	a1,32768
	sw	a5,16(sp)
	sw	a0,20(sp)
	add	a5,a1,a5
	sw	t0,32(sp)
	lbu	a1,4(a5)
	bgeu	a3,a0,.L82
	bne	a1,zero,.L47
	sw	t2,4(a2)
	li	a4,1
	sb	a4,4(a5)
	srli	s1,s1,1
.L48:
	lw	a4,0(sp)
	lbu	a5,0(t2)
	addi	t2,t2,1
	addi	a4,a4,1
	sw	a4,0(sp)
	sb	a5,-1(a4)
.L57:
	lw	a4,36(sp)
	andi	a3,s1,1
	mv	a5,a3
	bltu	a4,t2,.L116
.L58:
	beq	a5,zero,.L40
	lw	a5,44(sp)
	bgeu	a5,t2,.L42
	lw	a5,48(sp)
	lw	a4,0(sp)
	lw	a2,52(sp)
	sub	a5,t2,a5
	srai	a3,a5,5
	sub	a4,a4,a2
	sub	a5,a5,a3
	bgt	a4,a5,.L43
.L42:
	li	a4,-2147483648
	srli	a5,s1,1
	or	a5,a5,a4
	lw	a4,24(sp)
	sw	a5,76(sp)
	addi	a2,sp,80
	addi	a5,sp,76
.L44:
	lbu	a3,0(a5)
	addi	a5,a5,1
	addi	a4,a4,1
	sb	a3,-1(a4)
	bne	a2,a5,.L44
	lw	a5,0(sp)
	li	s1,-2147483648
	sw	a5,24(sp)
	addi	a5,a5,4
	sw	a5,0(sp)
	j	.L40
.L82:
	li	a5,0
.L46:
	lw	a3,4(sp)
	sw	zero,28(sp)
	mv	s0,t1
	add	a4,a3,a4
	li	a3,1
.L53:
	bgeu	a3,a1,.L54
	lw	a2,8(a4)
	add	a0,t2,a5
	lbu	t1,0(a0)
	add	a0,a2,a5
	lbu	a0,0(a0)
	beq	t1,a0,.L117
.L50:
	addi	a3,a3,1
	li	a2,4
	addi	a4,a4,4
	bne	a3,a2,.L53
.L54:
	lw	a2,12(sp)
	andi	a3,a1,3
	addi	a1,a1,1
	slli	a4,a2,2
	add	a4,a4,a3
	lw	a3,4(sp)
	slli	a4,a4,2
	srli	s1,s1,1
	add	a4,a3,a4
	lw	a3,16(sp)
	sw	t2,4(a4)
	li	a4,32768
	add	a4,a4,a3
	sb	a1,4(a4)
	li	a4,2
	bleu	a5,a4,.L48
	slli	a4,a2,5
	li	a2,-2147483648
	or	s1,s1,a2
	lw	a2,28(sp)
	li	a3,9
	add	t2,t2,a5
	or	a4,a4,a2
	bgtu	a5,a3,.L56
	addi	a5,a5,-2
	lw	a3,0(sp)
	slli	a5,a5,2
	or	a5,a5,a4
	srli	a4,a5,8
	sb	a4,1(a3)
	lw	a4,36(sp)
	sb	a5,0(a3)
	addi	a5,a3,2
	sw	a5,0(sp)
	andi	a3,s1,1
	mv	a5,a3
	bgeu	a4,t2,.L58
.L116:
	lw	a1,72(sp)
	srli	a2,s1,1
	mv	s0,s1
	mv	a4,a2
	bltu	a1,t2,.L118
.L78:
	lw	a3,72(sp)
	lw	a2,64(sp)
	lw	a0,0(sp)
	addi	t0,a3,-3
	lw	a3,48(sp)
	addi	a1,sp,80
	add	s1,a3,a2
	addi	a3,sp,76
	sw	a3,12(sp)
	mv	a2,s1
	bne	a5,zero,.L60
.L119:
	srli	a5,s0,2
	sw	a5,8(sp)
	andi	a3,a4,1
	mv	s0,a4
.L61:
	bgtu	t2,t0,.L63
	lbu	a4,1(t2)
	lbu	a5,2(t2)
	lbu	s1,0(t2)
	slli	a4,a4,8
	slli	a5,a5,16
	or	a4,a4,a5
	srli	t1,a4,13
	srli	a5,a4,9
	xor	a5,a5,t1
	or	a4,a4,s1
	xor	a5,a5,a4
	lw	a4,4(sp)
	andi	a5,a5,2047
	li	t1,32768
	add	a4,a4,a5
	add	a4,t1,a4
	lbu	t1,4(a4)
	slli	a5,a5,2
	andi	s1,t1,3
	add	a5,a5,s1
	lw	s1,4(sp)
	slli	a5,a5,2
	addi	t1,t1,1
	add	a5,s1,a5
	sw	t2,4(a5)
	sb	t1,4(a4)
.L63:
	lbu	a5,0(t2)
	addi	t2,t2,1
	addi	a0,a0,1
	sb	a5,-1(a0)
	beq	t2,a2,.L111
	andi	a5,s0,1
	srli	a4,s0,1
	beq	a5,zero,.L119
.L60:
	li	a5,-2147483648
	or	a4,a4,a5
	sw	a4,76(sp)
	lw	a5,12(sp)
	lw	a4,24(sp)
.L62:
	lbu	a3,0(a5)
	addi	a5,a5,1
	addi	a4,a4,1
	sb	a3,-1(a4)
	bne	a1,a5,.L62
	li	a5,536870912
	sw	a0,24(sp)
	sw	a5,8(sp)
	addi	a0,a0,4
	li	a3,0
	li	s0,1073741824
	j	.L61
.L117:
	lbu	a0,1(a2)
	lbu	t1,2(a2)
	lbu	t0,0(a2)
	slli	a0,a0,8
	slli	t1,t1,16
	or	a0,a0,t1
	lw	t1,8(sp)
	or	a0,a0,t0
	bne	a0,t1,.L50
	lw	a0,20(sp)
	bleu	a0,a2,.L50
	lbu	t1,3(a2)
	lbu	a0,3(t2)
	bne	t1,a0,.L88
	lw	a0,32(sp)
	li	t1,3
	bleu	a0,t1,.L88
	li	a0,3
	sw	a1,68(sp)
	j	.L52
.L121:
	beq	s0,t0,.L120
.L52:
	mv	t0,a0
	addi	a0,a0,1
	add	t1,a2,a0
	add	a1,t2,a0
	lbu	t1,0(t1)
	lbu	a1,0(a1)
	beq	t1,a1,.L121
	lw	a1,68(sp)
.L51:
	bgeu	a5,a0,.L50
	sw	a3,28(sp)
	mv	a5,a0
	j	.L50
.L47:
	lbu	a5,1(a3)
	lbu	a2,2(a3)
	lbu	a0,0(a3)
	slli	a5,a5,8
	slli	a2,a2,16
	or	a5,a5,a2
	or	a2,a5,a0
	lw	a0,8(sp)
	li	a5,0
	bne	a2,a0,.L46
	lbu	a0,3(a3)
	lbu	a2,3(t2)
	li	a5,3
	bne	a0,a2,.L46
	lbu	a2,4(t2)
	lbu	a5,4(a3)
	bne	a2,a5,.L86
	addi	a5,t1,1
	li	a2,4
	bleu	a5,a2,.L86
	li	a5,4
.L49:
	mv	t0,a5
	addi	a5,a5,1
	add	a0,a3,a5
	add	a2,t2,a5
	lbu	a0,0(a0)
	lbu	a2,0(a2)
	bne	a0,a2,.L46
	bne	t1,t0,.L49
	lw	a5,32(sp)
	j	.L46
.L56:
	lw	a2,0(sp)
	slli	a5,a5,16
	or	a5,a5,a4
	srli	a3,a5,8
	srli	a4,a5,16
	sb	a5,0(a2)
	addi	a5,a2,3
	sb	a3,1(a2)
	sb	a4,2(a2)
	sw	a5,0(sp)
	j	.L57
.L115:
	li	a5,9
	sw	a5,60(sp)
	j	.L37
.L111:
	lw	a2,8(sp)
	sw	a0,0(sp)
.L59:
	bne	a3,zero,.L65
.L66:
	mv	a2,s0
	srli	s0,s0,1
	andi	a5,s0,1
	beq	a5,zero,.L66
	srli	a2,a2,2
.L65:
	li	a5,-2147483648
	or	a2,a2,a5
	lw	a4,24(sp)
	lw	a5,12(sp)
	sw	a2,76(sp)
	addi	a2,sp,80
.L67:
	lbu	a3,0(a5)
	addi	a5,a5,1
	addi	a4,a4,1
	sb	a3,-1(a4)
	bne	a2,a5,.L67
	lw	a5,0(sp)
	lw	a4,52(sp)
	sub	a0,a5,a4
	li	a5,9
	bge	a0,a5,.L68
	li	a0,9
.L68:
	lw	a5,60(sp)
	add	a0,a0,a5
	li	a5,1
.L69:
	lw	a4,4(sp)
	lw	a3,60(sp)
	sw	zero,0(a4)
	li	a4,3
	beq	a3,a4,.L122
	lw	a4,56(sp)
	ori	a5,a5,2
	addi	a3,sp,76
	sb	a5,0(a4)
	sw	a3,12(sp)
	sw	a0,76(sp)
	mv	a5,a3
	addi	a4,a4,1
	addi	a2,sp,80
.L76:
	lbu	a3,0(a5)
	addi	a5,a5,1
	addi	a4,a4,1
	sb	a3,-1(a4)
	bne	a2,a5,.L76
	lw	a5,64(sp)
	lw	a4,56(sp)
	addi	a2,sp,80
	sw	a5,76(sp)
	lw	a5,12(sp)
	addi	a4,a4,5
.L77:
	lbu	a3,0(a5)
	addi	a5,a5,1
	addi	a4,a4,1
	sb	a3,-1(a4)
	bne	a5,a2,.L77
	lw	a5,56(sp)
	lbu	a5,0(a5)
.L75:
	lw	a4,56(sp)
	ori	a5,a5,72
	sb	a5,0(a4)
	lw	ra,88(sp)
	lw	s0,84(sp)
	lw	s1,80(sp)
	addi	sp,sp,92
	jr	ra
.L120:
	lw	a1,68(sp)
	lw	a0,32(sp)
	j	.L51
.L80:
	lw	ra,88(sp)
	lw	s0,84(sp)
	lw	s1,80(sp)
	li	a0,0
	addi	sp,sp,92
	jr	ra
.L122:
	lw	a4,56(sp)
	lw	a3,64(sp)
	sb	a0,1(a4)
	sb	a3,2(a4)
	j	.L75
.L43:
	lw	a2,48(sp)
	beq	a2,zero,.L70
	lw	a3,64(sp)
	lw	a4,52(sp)
	add	a5,a2,a3
	bgeu	a4,a5,.L113
	bleu	a4,a2,.L113
	add	a4,a4,a3
.L72:
	lbu	a3,-1(a5)
	addi	a5,a5,-1
	addi	a4,a4,-1
	sb	a3,0(a4)
	bne	a2,a5,.L72
.L73:
	lw	a5,60(sp)
	lw	a4,64(sp)
	add	a0,a5,a4
	li	a5,0
	j	.L69
.L113:
	lw	a3,52(sp)
	lw	a4,48(sp)
.L95:
	lbu	a2,0(a4)
	addi	a4,a4,1
	addi	a3,a3,1
	sb	a2,-1(a3)
	bne	a5,a4,.L95
	j	.L73
.L88:
	li	a0,3
	j	.L51
.L118:
	addi	a5,sp,76
	sw	a5,12(sp)
	j	.L59
.L39:
	lw	a5,48(sp)
	lw	a4,72(sp)
	bgtu	a5,a4,.L123
	lw	a5,52(sp)
	lw	t2,48(sp)
	li	s0,-2147483648
	sw	a5,24(sp)
	li	a4,1073741824
	li	a5,0
	j	.L78
.L86:
	li	a5,4
	j	.L46
.L123:
	lw	a5,52(sp)
	li	s0,-2147483648
	sw	a5,24(sp)
	addi	a5,sp,76
	sw	a5,12(sp)
	j	.L66
.L70:
	call	bench_memcpy.part.0
	.size	qlz_compress, .-qlz_compress
	.section	.text.qlz_decompress,"ax",@progbits
	.align	2
	.globl	qlz_decompress
	.hidden	qlz_decompress
	.type	qlz_decompress, @function
qlz_decompress:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	sw	a0,0(sp)
	mv	s0,a1
	mv	s1,a2
	call	qlz_size_decompressed
	lw	a5,0(sp)
	lbu	a4,0(a5)
	andi	a3,a4,1
	beq	a3,zero,.L125
	li	a3,36864
	li	a4,32768
	addi	a3,a3,-2048
	add	a4,s1,a4
	add	a3,s1,a3
.L126:
	sb	zero,0(a4)
	addi	a4,a4,1
	bne	a3,a4,.L126
	lbu	a4,0(a5)
	addi	a1,a0,-1
	add	a1,s0,a1
	slli	a4,a4,30
	srai	a4,a4,31
	andi	a4,a4,6
	addi	a4,a4,3
	add	a5,a5,a4
	addi	a4,a1,-10
	sw	a4,0(sp)
	li	a3,0
	addi	a4,s0,-1
	li	a2,0
	li	t2,4
.L128:
	add	t1,a5,a2
	lbu	t1,0(t1)
	slli	t0,a2,3
	addi	a2,a2,1
	sll	t1,t1,t0
	or	a3,a3,t1
	bne	a2,t2,.L128
	andi	a2,a3,1
	addi	a5,a5,4
	bne	a2,zero,.L130
	lw	a2,0(sp)
	bltu	s0,a2,.L130
	add	t0,s0,a0
	li	t1,1
	bgtu	s0,a1,.L137
.L136:
	beq	a3,t1,.L134
	srli	a3,a3,1
.L135:
	lbu	a2,0(a5)
	addi	s0,s0,1
	addi	a5,a5,1
	sb	a2,-1(s0)
	bne	s0,t0,.L136
.L137:
	addi	a1,a1,-3
	li	t1,32768
	bgeu	a4,a1,.L133
.L132:
	lbu	a3,2(a4)
	lbu	a5,3(a4)
	lbu	a2,1(a4)
	slli	a3,a3,8
	slli	a5,a5,16
	or	a3,a3,a5
	srli	t0,a3,13
	srli	a5,a3,9
	xor	a5,a5,t0
	or	a3,a3,a2
	xor	a5,a5,a3
	andi	a5,a5,2047
	add	a3,s1,a5
	add	a3,t1,a3
	lbu	a2,0(a3)
	slli	a5,a5,2
	addi	a4,a4,1
	andi	t0,a2,3
	add	a5,a5,t0
	slli	a5,a5,2
	add	a5,s1,a5
	sw	a4,0(a5)
	addi	a2,a2,1
	sb	a2,0(a3)
	bne	a1,a4,.L132
.L133:
	li	a5,36864
	add	a3,s1,a5
	addi	a4,a5,-2048
	li	a5,32768
	sw	zero,-2048(a3)
	add	a5,s1,a5
	add	a4,s1,a4
.L138:
	sb	zero,0(a5)
	addi	a5,a5,1
	bne	a4,a5,.L138
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L125:
	slli	a4,a4,30
	srai	a4,a4,31
	andi	a4,a4,6
	addi	a4,a4,3
	add	a5,a5,a4
	beq	s0,zero,.L167
	add	a4,a5,a0
	bgeu	s0,a4,.L140
	bleu	s0,a5,.L140
	add	a5,s0,a0
	beq	a0,zero,.L133
.L143:
	lbu	a3,-1(a4)
	addi	a5,a5,-1
	addi	a4,a4,-1
	sb	a3,0(a5)
	bne	s0,a5,.L143
	j	.L133
.L140:
	add	a3,s0,a0
	beq	a0,zero,.L133
.L144:
	lbu	a4,0(a5)
	addi	s0,s0,1
	addi	a5,a5,1
	sb	a4,-1(s0)
	bne	a3,s0,.L144
	j	.L133
.L134:
	addi	a5,a5,4
	li	a3,1073741824
	j	.L135
.L167:
	call	bench_memcpy.part.0
.L130:
	call	memcpy_up.constprop.0
	.size	qlz_decompress, .-qlz_decompress
	.section	.rodata.CSWTCH.22,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	CSWTCH.22, @object
	.size	CSWTCH.22, 40
CSWTCH.22:
	.word	2
	.word	34820
	.word	34820
	.word	0
	.word	-1
	.word	-1
	.word	0
	.word	1
	.word	5
	.word	0
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
