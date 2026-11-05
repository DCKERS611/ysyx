#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"md5.c"
	.option nopic
	.text
	.section	.text.bench_md5_prepare,"ax",@progbits
	.align	2
	.globl	bench_md5_prepare
	.hidden	bench_md5_prepare
	.type	bench_md5_prepare, @function
bench_md5_prepare:
	la a5, setting; lw a5, 0(a5);
	lw	a5,0(a5)
	addi	sp,sp,-12
	sw	s1,0(sp)
	li	a0,1
	lla	s1,.LANCHOR0
	sw	a5,0(s1)
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	bench_srand
	lw	a0,0(s1)
	call	bench_alloc
	lw	a5,0(s1)
	lla	a3,.LANCHOR1
	sw	a0,0(a3)
	ble	a5,zero,.L2
	li	s0,0
.L3:
	call	bench_rand
	lla	a3,.LANCHOR1
	lw	a5,0(a3)
	lw	a4,0(s1)
	add	a5,a5,s0
	sb	a0,0(a5)
	addi	s0,s0,1
	bgt	a4,s0,.L3
.L2:
	li	a0,16
	call	bench_alloc
	lw	ra,8(sp)
	lw	s0,4(sp)
	la a5, .LANCHOR2; sw a0, 0(a5);
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	bench_md5_prepare, .-bench_md5_prepare
	.section	.text.bench_md5_run,"ax",@progbits
	.align	2
	.globl	bench_md5_run
	.hidden	bench_md5_run
	.type	bench_md5_run, @function
bench_md5_run:
	la a2, .LANCHOR0; lw a2, 0(a2);
	addi	sp,sp,-116
	la a1, .LANCHOR1; lw a1, 0(a1);
	addi	a5,a2,1
	la a0, .LANCHOR2; lw a0, 0(a0);
	sw	a1,28(sp)
	sw	s0,112(sp)
	sw	s1,108(sp)
	andi	a3,a5,63
	li	a4,56
	sw	a0,40(sp)
	add	a1,a1,a2
	beq	a3,a4,.L8
	mv	a4,a5
	li	a3,56
.L9:
	addi	a4,a4,1
	andi	a0,a4,63
	bne	a0,a3,.L9
	mv	a3,a4
	sw	a4,32(sp)
	li	a4,-128
	sb	a4,0(a1)
	bgeu	a5,a3,.L29
	lw	a4,28(sp)
	lw	a3,32(sp)
	add	a5,a4,a5
	add	a4,a4,a3
.L11:
	sb	zero,0(a5)
	addi	a5,a5,1
	bne	a4,a5,.L11
.L10:
	slli	a3,a2,3
	lw	a5,32(sp)
	srli	t1,a3,8
	srli	a0,a3,16
	srli	a1,a3,24
	sb	a3,0(a4)
	sb	t1,1(a4)
	sb	a0,2(a4)
	sb	a1,3(a4)
	lw	a4,28(sp)
	addi	a5,a5,4
	srli	a2,a2,29
	add	a5,a4,a5
	sb	a2,0(a5)
	sb	zero,1(a5)
	sb	zero,2(a5)
	sb	zero,3(a5)
	li	a5,271732736
	addi	a5,a5,1142
	sw	a5,20(sp)
	li	a5,-1732583424
	addi	a5,a5,-770
	sw	a5,16(sp)
	li	a5,-271732736
	addi	a5,a5,-1143
	sw	a5,12(sp)
	li	a5,1732583424
	addi	a5,a5,769
	sw	a5,8(sp)
	li	a5,-680878080
	addi	a5,a5,1144
	sw	zero,24(sp)
	sw	a5,36(sp)
.L12:
	lw	a4,24(sp)
	lw	a5,28(sp)
	add	a5,a5,a4
	addi	a4,sp,44
.L13:
	lbu	a1,1(a5)
	lbu	a0,0(a5)
	lbu	a2,2(a5)
	lbu	a3,3(a5)
	slli	a1,a1,8
	or	a1,a1,a0
	slli	a2,a2,16
	or	a2,a2,a1
	slli	a3,a3,24
	or	a3,a3,a2
	sw	a3,0(a4)
	addi	a4,a4,4
	addi	a3,sp,108
	addi	a5,a5,4
	bne	a3,a4,.L13
	lw	s1,8(sp)
	lw	s0,36(sp)
	li	a3,0
	lw	a2,12(sp)
	add	a4,s1,s0
	sw	a4,0(sp)
	li	a4,15
	lw	t0,20(sp)
	lw	a1,16(sp)
	lla	t1,.LANCHOR3+4
	lla	a0,.LANCHOR4+4
	li	t2,1
	li	a5,7
	bleu	a3,a4,.L30
.L14:
	xor	a4,a1,a2
	li	s1,31
	and	a4,a4,t0
	bgtu	a3,s1,.L16
	xor	a4,a4,a1
	andi	s1,t2,15
.L15:
	slli	s1,s1,2
	addi	s0,sp,44
	addi	s1,s1,64
	add	s1,s1,s0
	lw	s0,0(sp)
	lw	s1,-64(s1)
	add	a4,a4,s0
	add	a4,a4,s1
	neg	s0,a5
	sll	a5,a4,a5
	srl	a4,a4,s0
	or	a4,a5,a4
	add	a4,a4,a2
.L21:
	lw	s0,0(t1)
	mv	s1,t0
	mv	t0,a1
	mv	a1,a2
	mv	a2,a4
	add	a4,s1,s0
	sw	a4,0(sp)
	addi	a3,a3,1
	li	a4,15
	lw	a5,0(a0)
	addi	t1,t1,4
	addi	a0,a0,4
	addi	t2,t2,5
	bgtu	a3,a4,.L14
.L30:
	xor	a4,a1,t0
	and	a4,a4,a2
	xor	a4,a4,t0
	mv	s1,a3
	j	.L15
.L16:
	xor	a4,a1,t0
	slli	s1,a3,1
	add	s1,s1,a3
	sw	a4,4(sp)
	li	a4,47
	addi	s1,s1,5
	bgtu	a3,a4,.L17
	lw	a4,4(sp)
	andi	s1,s1,15
	xor	a4,a4,a2
	j	.L15
.L17:
	slli	s1,a3,3
	sub	s1,s1,a3
	andi	s1,s1,15
	slli	s1,s1,2
	addi	s0,sp,44
	addi	s1,s1,64
	add	s1,s1,s0
	not	a4,t0
	lw	s0,0(sp)
	lw	s1,-64(s1)
	or	a4,a4,a2
	xor	a4,a4,a1
	add	a4,a4,s0
	add	a4,a4,s1
	neg	s0,a5
	sll	a5,a4,a5
	srl	a4,a4,s0
	or	a4,a4,a5
	li	a5,63
	add	a4,a4,a2
	bne	a3,a5,.L21
	lw	a3,8(sp)
	lw	a5,24(sp)
	add	a3,a3,t0
	sw	a3,8(sp)
	lw	a3,12(sp)
	addi	a5,a5,64
	sw	a5,24(sp)
	add	a4,a3,a4
	sw	a4,12(sp)
	lw	a4,16(sp)
	add	a4,a4,a2
	sw	a4,16(sp)
	lw	a4,20(sp)
	add	a4,a4,a1
	sw	a4,20(sp)
	lw	a4,32(sp)
	bgtu	a4,a5,.L12
	lw	a5,8(sp)
	lw	a3,12(sp)
	lw	a4,20(sp)
	srli	s1,a5,8
	srli	s0,a5,16
	srli	t2,a5,24
	lw	a5,16(sp)
	srli	t0,a3,8
	srli	t1,a3,16
	srli	a0,a3,24
	srli	a1,a5,8
	srli	a3,a5,24
	srli	a2,a5,16
	srli	a5,a4,8
	sw	a5,4(sp)
	srli	a5,a4,16
	sw	a5,24(sp)
	srli	a5,a4,24
	sw	a5,28(sp)
	lw	a4,8(sp)
	lw	a5,40(sp)
	sb	a4,0(a5)
	lw	a4,12(sp)
	sb	a3,11(a5)
	lw	a3,4(sp)
	sb	a4,4(a5)
	lw	a4,16(sp)
	sb	s1,1(a5)
	sb	s0,2(a5)
	sb	a4,8(a5)
	lw	a4,20(sp)
	sb	t2,3(a5)
	sb	t0,5(a5)
	sb	a4,12(a5)
	lw	a4,24(sp)
	sb	t1,6(a5)
	sb	a0,7(a5)
	sb	a4,14(a5)
	lw	a4,28(sp)
	sb	a1,9(a5)
	sb	a2,10(a5)
	sb	a3,13(a5)
	sb	a4,15(a5)
	lw	s0,112(sp)
	lw	s1,108(sp)
	addi	sp,sp,116
	jr	ra
.L8:
	lw	a4,28(sp)
	mv	a3,a5
	sw	a5,32(sp)
	li	a5,-128
	sb	a5,0(a1)
	add	a4,a4,a3
	j	.L10
.L29:
	lw	a5,28(sp)
	add	a4,a5,a3
	j	.L10
	.size	bench_md5_run, .-bench_md5_run
	.section	.text.bench_md5_validate,"ax",@progbits
	.align	2
	.globl	bench_md5_validate
	.hidden	bench_md5_validate
	.type	bench_md5_validate, @function
bench_md5_validate:
	la a0, .LANCHOR2; lw a0, 0(a0);
	addi	sp,sp,-12
	addi	a1,a0,16
	sw	ra,8(sp)
	call	checksum
	la a5, setting; lw a5, 0(a5);
	lw	a5,12(a5)
	lw	ra,8(sp)
	sub	a0,a5,a0
	seqz	a0,a0
	addi	sp,sp,12
	jr	ra
	.size	bench_md5_validate, .-bench_md5_validate
	.hidden	k
	.globl	k
	.section	.rodata.k,"a"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	k, @object
	.size	k, 256
k:
	.word	-680876936
	.word	-389564586
	.word	606105819
	.word	-1044525330
	.word	-176418897
	.word	1200080426
	.word	-1473231341
	.word	-45705983
	.word	1770035416
	.word	-1958414417
	.word	-42063
	.word	-1990404162
	.word	1804603682
	.word	-40341101
	.word	-1502002290
	.word	1236535329
	.word	-165796510
	.word	-1069501632
	.word	643717713
	.word	-373897302
	.word	-701558691
	.word	38016083
	.word	-660478335
	.word	-405537848
	.word	568446438
	.word	-1019803690
	.word	-187363961
	.word	1163531501
	.word	-1444681467
	.word	-51403784
	.word	1735328473
	.word	-1926607734
	.word	-378558
	.word	-2022574463
	.word	1839030562
	.word	-35309556
	.word	-1530992060
	.word	1272893353
	.word	-155497632
	.word	-1094730640
	.word	681279174
	.word	-358537222
	.word	-722521979
	.word	76029189
	.word	-640364487
	.word	-421815835
	.word	530742520
	.word	-995338651
	.word	-198630844
	.word	1126891415
	.word	-1416354905
	.word	-57434055
	.word	1700485571
	.word	-1894986606
	.word	-1051523
	.word	-2054922799
	.word	1873313359
	.word	-30611744
	.word	-1560198380
	.word	1309151649
	.word	-145523070
	.word	-1120210379
	.word	718787259
	.word	-343485551
	.section	.rodata.r,"a"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	r, @object
	.size	r, 256
r:
	.word	7
	.word	12
	.word	17
	.word	22
	.word	7
	.word	12
	.word	17
	.word	22
	.word	7
	.word	12
	.word	17
	.word	22
	.word	7
	.word	12
	.word	17
	.word	22
	.word	5
	.word	9
	.word	14
	.word	20
	.word	5
	.word	9
	.word	14
	.word	20
	.word	5
	.word	9
	.word	14
	.word	20
	.word	5
	.word	9
	.word	14
	.word	20
	.word	4
	.word	11
	.word	16
	.word	23
	.word	4
	.word	11
	.word	16
	.word	23
	.word	4
	.word	11
	.word	16
	.word	23
	.word	4
	.word	11
	.word	16
	.word	23
	.word	6
	.word	10
	.word	15
	.word	21
	.word	6
	.word	10
	.word	15
	.word	21
	.word	6
	.word	10
	.word	15
	.word	21
	.word	6
	.word	10
	.word	15
	.word	21
	.section	.sbss.N,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	N, @object
	.size	N, 4
N:
	.zero	4
	.section	.sbss.digest,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	digest, @object
	.size	digest, 4
digest:
	.zero	4
	.section	.sbss.str,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	str, @object
	.size	str, 4
str:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
