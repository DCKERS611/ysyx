#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"dqchan.c"
	.option nopic
	.text
	.globl	__muldi3
	.section	.text.DequantBlock,"ax",@progbits
	.align	2
	.type	DequantBlock, @function
DequantBlock:
	andi	a4,a3,3
	slli	a5,a4,2
	lla	t1,.LANCHOR3
	add	t1,t1,a5
	lw	a5,0(t1)
	addi	sp,sp,-80
	slli	a4,a4,6
	sw	a5,16(sp)
	mv	a5,a1
	lla	a1,.LANCHOR2
	srai	t0,a3,2
	add	a4,a1,a4
	sw	s1,68(sp)
	sw	ra,76(sp)
	sw	s0,72(sp)
	sw	t0,20(sp)
	li	a3,31
	sw	a4,12(sp)
	sw	t0,4(sp)
	mv	s1,a0
	ble	t0,a3,.L2
	li	a4,31
	sw	a4,4(sp)
.L2:
	lw	a3,4(sp)
	li	a4,28
	ble	a3,a4,.L3
	li	a4,31
.L4:
	lw	a0,12(sp)
	slli	a2,a2,2
	add	t1,s1,a2
	lw	a3,8(a0)
	lw	a1,4(a0)
	lw	a0,12(a0)
	sra	a3,a3,a4
	sw	a3,60(sp)
	li	a3,-2147483648
	xori	t2,a3,-1
	xori	t0,a3,-4
	lw	a3,16(sp)
	sra	a1,a1,a4
	sra	a4,a0,a4
	srai	a3,a3,31
	sw	a3,24(sp)
	li	a3,1518501888
	sw	a4,64(sp)
	addi	a3,a3,-1639
	li	a4,0
	sw	t1,0(sp)
	sw	zero,52(sp)
	sw	a1,56(sp)
	sw	a3,48(sp)
	mv	t1,a4
	j	.L17
.L25:
	slli	a4,a4,2
	addi	a4,a4,16
	addi	a3,sp,52
	add	a4,a4,a3
	lw	a4,-16(a4)
.L6:
	or	t1,t1,a4
	bge	s0,zero,.L16
	neg	a4,a4
.L16:
	sw	a4,0(a5)
	lw	a4,0(sp)
	addi	a5,a5,4
	beq	s1,a4,.L24
.L17:
	lw	s0,0(s1)
	addi	s1,s1,4
	and	a3,s0,t0
	and	a4,s0,t2
	beq	a3,zero,.L25
	li	a3,-2147483648
	xori	a3,a3,-16
	and	a3,s0,a3
	bne	a3,zero,.L7
	lw	a3,12(sp)
	slli	a4,a4,2
	lw	a2,4(sp)
	add	a4,a3,a4
	lw	a3,0(a4)
	lw	a1,20(sp)
	sra	a4,a3,a2
	bge	a1,zero,.L6
	neg	a4,a2
	sll	a4,a3,a4
	j	.L6
.L7:
	li	a3,-2147483648
	xori	a3,a3,-64
	and	a3,s0,a3
	bne	a3,zero,.L9
	addi	a4,a4,-16
	slli	a3,a4,2
	lla	a4,.LANCHOR4
	add	a4,a4,a3
	lw	a0,0(a4)
	lw	a3,24(sp)
	lw	a2,16(sp)
	srai	a1,a0,31
	sw	a5,28(sp)
	sw	t1,8(sp)
	call	__muldi3
	lw	a5,4(sp)
	lw	t1,8(sp)
	addi	a3,a5,-3
	li	a5,-2147483648
	xori	t2,a5,-1
	xori	t0,a5,-4
	lw	a5,28(sp)
.L10:
	sra	a4,a1,a3
	bge	a3,zero,.L6
	neg	a3,a3
	sra	a2,t2,a3
	mv	a4,t2
	blt	a2,a1,.L6
	sll	a4,a1,a3
	j	.L6
.L9:
	slli	a2,a4,17
	li	a3,134217728
	sw	zero,8(sp)
	bge	a2,a3,.L11
	slli	a2,a4,21
	li	a4,4
	sw	a4,8(sp)
.L11:
	li	a4,536870912
	bge	a2,a4,.L12
	lw	a4,8(sp)
	slli	a2,a2,2
	addi	a4,a4,2
	sw	a4,8(sp)
.L12:
	li	a4,1073741824
	bge	a2,a4,.L13
	lw	a4,8(sp)
	slli	a2,a2,1
	addi	a4,a4,1
	sw	a4,8(sp)
.L13:
	lw	a3,48(sp)
	lla	a4,.LANCHOR0
	ble	a2,a3,.L14
	lla	a4,.LANCHOR1
.L14:
	lw	a0,0(a4)
	srai	a3,a2,31
	sw	t1,40(sp)
	srai	a1,a0,31
	sw	a5,44(sp)
	sw	a2,36(sp)
	sw	a3,32(sp)
	sw	a4,28(sp)
	call	__muldi3
	lw	a4,28(sp)
	lw	a2,36(sp)
	lw	a3,32(sp)
	lw	a0,4(a4)
	add	a0,a1,a0
	srai	a1,a0,31
	call	__muldi3
	lw	a4,28(sp)
	lw	a2,36(sp)
	lw	a3,32(sp)
	lw	a0,8(a4)
	add	a0,a1,a0
	srai	a1,a0,31
	call	__muldi3
	lw	a4,28(sp)
	lw	a2,36(sp)
	lw	a3,32(sp)
	lw	a0,12(a4)
	add	a0,a1,a0
	srai	a1,a0,31
	call	__muldi3
	lw	a5,8(sp)
	lw	a4,28(sp)
	lla	a3,.LANCHOR5
	slli	a5,a5,2
	add	a3,a3,a5
	lw	a4,16(a4)
	lw	a2,0(a3)
	sw	a5,8(sp)
	add	a0,a1,a4
	srai	a3,a2,31
	srai	a1,a0,31
	call	__muldi3
	lw	a3,24(sp)
	lw	a2,16(sp)
	slli	a0,a1,3
	srai	a1,a0,31
	call	__muldi3
	lw	a5,8(sp)
	lla	a4,.LANCHOR6
	lw	t1,40(sp)
	add	a4,a4,a5
	lw	a3,0(a4)
	lw	a5,4(sp)
	li	a4,-2147483648
	xori	t0,a4,-4
	sub	a3,a5,a3
	xori	t2,a4,-1
	lw	a5,44(sp)
	j	.L10
.L3:
	lw	a4,4(sp)
	addi	a4,a4,3
	not	a3,a4
	srai	a3,a3,31
	and	a4,a4,a3
	j	.L4
.L24:
	lw	ra,76(sp)
	lw	s0,72(sp)
	lw	s1,68(sp)
	mv	a0,t1
	addi	sp,sp,80
	jr	ra
	.size	DequantBlock, .-DequantBlock
	.globl	__mulsi3
	.section	.text.DequantChannel,"ax",@progbits
	.align	2
	.globl	DequantChannel
	.hidden	DequantChannel
	.type	DequantChannel, @function
DequantChannel:
	addi	sp,sp,-100
	lw	t1,20(a4)
	sw	a5,24(sp)
	li	a5,13
	sw	a5,40(sp)
	li	a5,22
	sw	a4,28(sp)
	sw	ra,96(sp)
	sw	s0,92(sp)
	sw	s1,88(sp)
	li	a4,2
	sw	a0,56(sp)
	sw	a1,68(sp)
	sw	a2,52(sp)
	sw	a5,36(sp)
	mv	t0,a3
	beq	t1,a4,.L76
.L27:
	lw	a3,28(sp)
	lw	a5,32(t0)
	sw	zero,76(sp)
	lw	a4,64(a3)
	lw	a3,8(a3)
	srai	a5,a5,1
	addi	a4,a4,1
	slli	a4,a4,1
	sw	a3,44(sp)
	sw	a4,32(sp)
	bne	a5,zero,.L28
	addi	a5,a3,2
	sw	a5,44(sp)
.L28:
	li	t2,0
	li	s0,0
	li	a4,0
	sw	t2,0(sp)
	j	.L29
.L33:
	lw	ra,28(sp)
	lw	a5,52(t0)
	lbu	a1,0(a1)
	lw	ra,60(ra)
	add	a3,a5,a3
	add	a5,a5,a2
	sw	ra,8(sp)
	lh	a2,0(a3)
	lh	ra,0(a5)
	lw	a3,44(sp)
	li	a5,210
	sub	s1,a2,ra
	lw	ra,8(sp)
	sub	a5,a5,a3
	beq	ra,zero,.L30
	lbu	a3,0(t2)
	add	a1,a1,a3
.L30:
	sw	t0,20(sp)
	sw	a4,16(sp)
	sw	t1,12(sp)
	sw	a5,8(sp)
	call	__mulsi3
	lw	a5,8(sp)
	lw	a1,4(sp)
	mv	a2,s1
	add	a3,a0,a5
	mv	a0,a1
	call	DequantBlock
	lw	a4,16(sp)
	lw	t1,12(sp)
	lw	t0,20(sp)
	add	a4,a4,s1
	bne	a0,zero,.L31
	lw	s0,76(sp)
.L31:
	lw	a5,52(sp)
	lw	a3,0(sp)
	sw	s0,76(sp)
	lw	a5,0(a5)
	or	a3,a3,a0
	sw	a3,0(sp)
	ble	a5,a4,.L74
	mv	s0,t1
.L29:
	lw	a5,56(sp)
	slli	s1,a4,2
	addi	t1,s0,1
	add	a5,a5,s1
	sw	a5,4(sp)
	lla	a5,.LANCHOR7
	add	t2,a5,s0
	lw	a5,24(sp)
	lw	a0,32(sp)
	slli	a2,s0,1
	add	a1,a5,s0
	lw	a5,36(sp)
	slli	a3,t1,1
	bne	a5,s0,.L33
	lw	t2,0(sp)
	lw	s0,76(sp)
	sw	a4,36(sp)
.L32:
	lw	a5,100(sp)
	lw	a4,40(sp)
	sw	zero,0(a5)
	sw	s0,20(a5)
	sw	zero,12(a5)
	sw	zero,8(a5)
	sw	zero,4(a5)
	sw	zero,16(a5)
	li	a5,11
	bgt	a4,a5,.L77
	lw	a2,40(sp)
	lw	a3,52(t0)
	lw	a1,44(sp)
	addi	a5,a2,16
	slli	a5,a5,1
	add	a5,a3,a5
	lh	a5,14(a5)
	slli	a4,a2,1
	sw	a2,76(sp)
	sw	a5,64(sp)
	mv	a5,a4
	add	a5,a3,a5
	sw	a5,48(sp)
	lw	a5,24(sp)
	add	a4,a4,a2
	sw	a2,80(sp)
	sw	a2,84(sp)
	li	a2,210
	sub	a2,a2,a1
	add	a5,a5,a4
	sw	a2,44(sp)
	sw	a5,24(sp)
.L45:
	lw	a4,48(sp)
	lw	a5,64(sp)
	lw	a2,56(sp)
	lh	a3,48(a4)
	lw	a4,36(sp)
	lw	s1,68(sp)
	sub	a5,a3,a5
	sw	a3,64(sp)
	lw	a3,40(sp)
	slli	a4,a4,2
	add	a4,a2,a4
	sw	a5,20(sp)
	slli	t1,a5,2
	addi	a5,a3,1
	sw	a5,40(sp)
	sw	a3,60(sp)
	mv	s0,a4
	li	a5,0
	sw	a4,72(sp)
.L39:
	lw	a4,28(sp)
	slli	t0,a5,2
	lw	a3,24(sp)
	add	a4,a4,t0
	lw	a4,40(a4)
	add	a3,a3,a5
	sw	a5,4(sp)
	lw	a5,44(sp)
	lbu	a0,23(a3)
	lw	a1,32(sp)
	slli	a4,a4,3
	add	a4,a4,a5
	sw	t1,16(sp)
	sw	t2,12(sp)
	sw	t0,8(sp)
	sw	a4,0(sp)
	call	__mulsi3
	lw	a4,0(sp)
	lw	a2,20(sp)
	mv	a3,a0
	add	a3,a4,a3
	mv	a1,s1
	mv	a0,s0
	call	DequantBlock
	lw	t0,8(sp)
	lw	a5,4(sp)
	lw	t2,12(sp)
	addi	a3,t0,76
	lw	t1,16(sp)
	addi	a5,a5,1
	li	a4,3
	add	t0,a3,sp
	beq	a0,zero,.L38
	lw	a3,60(sp)
	sw	a3,0(t0)
.L38:
	or	t2,t2,a0
	add	s0,s0,t1
	add	s1,s1,t1
	bne	a5,a4,.L39
	lw	a3,20(sp)
	lw	a2,36(sp)
	lw	a4,72(sp)
	slli	a5,a3,1
	add	a5,a5,a3
	add	a5,a2,a5
	sw	a5,36(sp)
	ble	a3,zero,.L44
	lw	a5,20(sp)
	lw	a3,68(sp)
	neg	a1,t1
	slli	a2,a5,3
	add	a0,a3,a2
	add	a5,a3,t1
.L43:
	add	a3,a5,a1
	lw	t0,0(a3)
	addi	a4,a4,12
	sub	a3,a5,t1
	sw	t0,-12(a4)
	lw	t0,0(a5)
	add	a3,a3,a2
	addi	a5,a5,4
	sw	t0,-8(a4)
	lw	a3,0(a3)
	sw	a3,-4(a4)
	bne	a0,a5,.L43
.L44:
	lw	a5,52(sp)
	lw	a4,36(sp)
	lw	a5,0(a5)
	ble	a5,a4,.L41
	lw	a4,48(sp)
	li	a5,13
	addi	a4,a4,2
	sw	a4,48(sp)
	lw	a4,24(sp)
	addi	a4,a4,3
	sw	a4,24(sp)
	lw	a4,40(sp)
	bne	a4,a5,.L45
.L41:
	lw	a5,52(sp)
	lw	a4,36(sp)
	lw	a1,100(sp)
	lw	a2,80(sp)
	sw	a4,0(a5)
	lw	a5,28(sp)
	lw	a3,84(sp)
	lw	a4,24(a5)
	lw	a5,76(sp)
	sw	a2,8(a1)
	snez	a4,a4
	addi	a4,a4,1
	sw	a4,0(a1)
	sw	a5,4(a1)
	sw	a3,12(a1)
	blt	a5,a2,.L78
	blt	a5,a3,.L79
.L48:
	lw	a4,100(sp)
	li	a0,31
	sw	a5,16(a4)
	beq	t2,zero,.L26
	blt	t2,zero,.L58
	li	a5,0
.L50:
	slli	t2,t2,1
	mv	a0,a5
	addi	a5,a5,1
	bge	t2,zero,.L50
.L26:
	lw	ra,96(sp)
	lw	s0,92(sp)
	lw	s1,88(sp)
	addi	sp,sp,100
	jr	ra
.L79:
	mv	a5,a3
	j	.L48
.L78:
	mv	a5,a2
	bge	a5,a3,.L48
	j	.L79
.L74:
	lw	t2,0(sp)
	sw	a4,36(sp)
	j	.L32
.L76:
	lw	a5,28(sp)
	sw	zero,40(sp)
	lw	a5,24(a5)
	sw	a5,36(sp)
	beq	a5,zero,.L27
	lw	a5,0(a3)
	beq	a5,zero,.L53
	li	a5,3
	sw	a5,40(sp)
	li	a5,6
	sw	a5,36(sp)
	j	.L27
.L77:
	li	a0,31
	beq	t2,zero,.L26
	blt	t2,zero,.L58
	li	a5,0
.L36:
	slli	t2,t2,1
	mv	a0,a5
	addi	a5,a5,1
	bge	t2,zero,.L36
	lw	ra,96(sp)
	lw	s0,92(sp)
	lw	s1,88(sp)
	addi	sp,sp,100
	jr	ra
.L58:
	li	a0,-1
	j	.L26
.L53:
	li	a5,3
	sw	a5,40(sp)
	li	a5,8
	sw	a5,36(sp)
	j	.L27
	.size	DequantChannel, .-DequantChannel
	.hidden	pow2frac
	.globl	pow2frac
	.hidden	pow2exp
	.globl	pow2exp
	.hidden	poly43hi
	.globl	poly43hi
	.hidden	poly43lo
	.globl	poly43lo
	.hidden	pow43
	.globl	pow43
	.hidden	pow43_14
	.globl	pow43_14
	.hidden	pow14
	.globl	pow14
	.section	.data.poly43hi,"aw"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	poly43hi, @object
	.size	poly43hi, 20
poly43hi:
	.word	277160291
	.word	-751569244
	.word	1189691531
	.word	667078384
	.word	-17467468
	.section	.data.poly43lo,"aw"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	poly43lo, @object
	.size	poly43lo, 20
poly43lo:
	.word	698400169
	.word	-1339144152
	.word	1498917403
	.word	594299277
	.word	-11003815
	.section	.data.pow14,"aw"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	pow14, @object
	.size	pow14, 16
pow14:
	.word	2147483647
	.word	1805811301
	.word	1518500250
	.word	1276901417
	.section	.data.pow2exp,"aw"
	.align	2
	.set	.LANCHOR6,. + 0
	.type	pow2exp, @object
	.size	pow2exp, 32
pow2exp:
	.word	14
	.word	13
	.word	11
	.word	10
	.word	9
	.word	7
	.word	6
	.word	5
	.section	.data.pow2frac,"aw"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	pow2frac, @object
	.size	pow2frac, 32
pow2frac:
	.word	1704458900
	.word	1352829926
	.word	2147483647
	.word	1704458900
	.word	1352829926
	.word	2147483647
	.word	1704458900
	.word	1352829926
	.section	.data.pow43,"aw"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	pow43, @object
	.size	pow43, 192
pow43:
	.word	338207482
	.word	366681046
	.word	395718700
	.word	425299333
	.word	455403707
	.word	486014202
	.word	517114610
	.word	548689962
	.word	580726382
	.word	613210965
	.word	646131674
	.word	679477248
	.word	713237127
	.word	747401384
	.word	781960664
	.word	816906137
	.word	852229450
	.word	887922689
	.word	923978338
	.word	960389256
	.word	997148640
	.word	1034250007
	.word	1071687164
	.word	1109454194
	.word	1147545432
	.word	1185955452
	.word	1224679047
	.word	1263711219
	.word	1303047165
	.word	1342682263
	.word	1382612066
	.word	1422832284
	.word	1463338785
	.word	1504127577
	.word	1545194805
	.word	1586536745
	.word	1628149793
	.word	1670030463
	.word	1712175375
	.word	1754581259
	.word	1797244940
	.word	1840163341
	.word	1883333472
	.word	1926752432
	.word	1970417401
	.word	2014325637
	.word	2058474476
	.word	2102861321
	.section	.data.pow43_14,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	pow43_14, @object
	.size	pow43_14, 256
pow43_14:
	.word	0
	.word	268435456
	.word	676414963
	.word	1161452763
	.word	213057363
	.word	286886358
	.word	365834696
	.word	449311235
	.word	536870912
	.word	628164281
	.word	722908323
	.word	820868276
	.word	921845669
	.word	1025670099
	.word	1132193366
	.word	1241285180
	.word	0
	.word	225726413
	.word	568794918
	.word	976661465
	.word	179159172
	.word	241241710
	.word	307629085
	.word	377824207
	.word	451452825
	.word	528221092
	.word	607891017
	.word	690265191
	.word	775176719
	.word	862482309
	.word	952057343
	.word	1043792258
	.word	0
	.word	189812531
	.word	478297607
	.word	821271125
	.word	150654306
	.word	202859289
	.word	258684194
	.word	317711021
	.word	379625062
	.word	444179223
	.word	511173377
	.word	580441524
	.word	651843324
	.word	725258282
	.word	800581607
	.word	877721168
	.word	0
	.word	159612677
	.word	402198743
	.word	690603945
	.word	126684666
	.word	170583649
	.word	217526612
	.word	267162059
	.word	319225354
	.word	373508716
	.word	429843861
	.word	488091197
	.word	548132714
	.word	609867089
	.word	673206203
	.word	738072584
	.section	.rodata.preTab,"a"
	.align	2
	.set	.LANCHOR7,. + 0
	.type	preTab, @object
	.size	preTab, 22
preTab:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\001\001\001\001\002\002\003\003\003\002"
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
