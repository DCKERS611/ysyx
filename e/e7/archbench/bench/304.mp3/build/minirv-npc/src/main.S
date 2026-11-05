#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"main.c"
	.option nopic
	.text
	.section	.rodata.bench_init.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"rb"
	.align	2
.LC1:
	.string	"file open error\n"
	.align	2
.LC2:
	.string	"wb"
	.align	2
.LC3:
	.string	"build/output.pcm"
	.section	.text.bench_init,"ax",@progbits
	.align	2
	.globl	bench_init
	.hidden	bench_init
	.type	bench_init, @function
bench_init:
	slli	a5,a0,1
	add	a5,a5,a0
	lla	a4,.LANCHOR1
	slli	a5,a5,3
	add	a5,a4,a5
	lw	a0,0(a5)
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	a1,.LC0
	lla	s0,.LANCHOR0
	sw	a5,0(s0)
	sw	ra,8(sp)
	call	fopen
	la a5, .LANCHOR2; sw a0, 0(a5);
	beq	a0,zero,.L6
.L2:
	lla	a1,.LC2
	lla	a0,.LC3
	call	fopen
	la a5, .LANCHOR3; sw a0, 0(a5);
	call	MP3InitDecoder
	la a5, .LANCHOR4; sw a0, 0(a5);
	beq	a0,zero,.L7
	lw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	a1,4(a5)
	lla	a0,.LANCHOR5
	addi	sp,sp,12
	tail	bench_obuf_init
.L7:
	li	a0,2
	call	bench_exit
	lw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	a1,4(a5)
	lla	a0,.LANCHOR5
	addi	sp,sp,12
	tail	bench_obuf_init
.L6:
	lla	a0,.LC1
	call	printf
	li	a0,1
	call	bench_exit
	j	.L2
	.size	bench_init, .-bench_init
	.section	.rodata.bench_run.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"err = %d\n"
	.globl	__mulsi3
	.globl	__udivdi3
	.section	.text.bench_run,"ax",@progbits
	.align	2
	.globl	bench_run
	.hidden	bench_run
	.type	bench_run, @function
bench_run:
	addi	sp,sp,-64
	lla	a5,readBuf
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	ra,60(sp)
	lla	s1,.LANCHOR7
	lla	a3,.LANCHOR6
	sw	a5,20(sp)
	li	a5,0
	sw	a5,4(a3)
	sw	a5,4(s1)
	la a5, .LANCHOR8; sw zero, 0(a5);
	li	a5,4096
	li	a4,0
	addi	a5,a5,-217
	sw	zero,16(sp)
	sw	a4,0(a3)
	sw	a4,0(s1)
	lla	a0,readBuf
	li	s0,0
	sw	zero,12(sp)
	sw	a5,8(sp)
	j	.L9
.L19:
	li	a5,-2
	bne	a1,a5,.L17
.L14:
	lw	s0,16(sp)
	lw	a0,20(sp)
.L9:
	lw	a5,8(sp)
	bgt	s0,a5,.L10
	lw	a5,12(sp)
	beq	a5,zero,.L18
.L10:
	mv	a1,s0
	call	MP3FindSyncWord
	blt	a0,zero,.L12
.L21:
	lw	a4,20(sp)
	lw	a5,16(sp)
	lla	s0,.LANCHOR8
	add	a4,a4,a0
	sub	a5,a5,a0
	sw	a4,20(sp)
	sw	a5,16(sp)
	call	bench_uptime
	lla	a4,.LANCHOR4
	mv	a5,a0
	lw	a0,0(a4)
	mv	t1,a1
	li	a4,0
	lla	a3,outBuf
	addi	a2,sp,16
	addi	a1,sp,20
	sw	a5,4(sp)
	sw	t1,0(sp)
	call	MP3Decode
	sw	a0,0(s0)
	call	bench_uptime
	lw	a4,0(s1)
	lw	a3,4(s1)
	lw	a5,4(sp)
	add	a4,a0,a4
	lw	t1,0(sp)
	sltu	a0,a4,a0
	add	a1,a1,a3
	sub	a5,a4,a5
	add	a0,a0,a1
	sgtu	a4,a5,a4
	sub	a0,a0,t1
	lw	a1,0(s0)
	sub	a0,a0,a4
	sw	a5,0(s1)
	sw	a0,4(s1)
	bne	a1,zero,.L19
	lla	a5,.LANCHOR4
	lw	a0,0(a5)
	addi	a1,sp,24
	call	MP3GetLastFrameInfo
	lw	a5,36(sp)
	lw	a1,40(sp)
	srai	a0,a5,31
	andi	a0,a0,7
	add	a0,a0,a5
	srai	a0,a0,3
	call	__mulsi3
	mv	a2,a0
	lla	a1,outBuf
	lla	a0,.LANCHOR5
	call	bench_obuf_append
	lw	a4,40(sp)
	lw	a1,28(sp)
	lw	a0,32(sp)
	srai	a3,a4,31
	slli	t1,a4,5
	srli	t0,a4,27
	slli	a5,a3,5
	sub	a2,t1,a4
	or	a5,t0,a5
	sub	a5,a5,a3
	sgtu	t1,a2,t1
	sub	t1,a5,t1
	srli	t2,a2,26
	slli	a5,t1,6
	slli	t0,a2,6
	sub	a2,t0,a2
	or	a5,t2,a5
	sgtu	t0,a2,t0
	sub	a5,a5,t1
	sub	a5,a5,t0
	slli	s0,a2,3
	slli	a5,a5,3
	srli	a2,a2,29
	add	a4,s0,a4
	or	a5,a2,a5
	add	a5,a5,a3
	sltu	s0,a4,s0
	add	s0,s0,a5
	slli	s0,s0,6
	srli	a5,a4,26
	slli	a4,a4,6
	or	s0,a5,s0
	sw	a4,0(sp)
	call	__mulsi3
	lw	a4,0(sp)
	srai	a3,a0,31
	mv	a2,a0
	mv	a1,s0
	mv	a0,a4
	call	__udivdi3
	lla	a3,.LANCHOR6
	lw	a5,0(a3)
	lw	a4,4(a3)
	add	a5,a0,a5
	sltu	a0,a5,a0
	add	a1,a1,a4
	add	a0,a0,a1
	sw	a5,0(a3)
	sw	a0,4(a3)
	j	.L14
.L18:
	mv	a1,a0
	la a3, .LANCHOR2; lw a3, 0(a3);
	mv	a2,s0
	lla	a0,readBuf
	sw	a3,0(sp)
	call	memmove
	lw	a3,0(sp)
	lla	a5,readBuf
	li	a2,16384
	sub	a2,a2,s0
	add	a0,a5,s0
	li	a1,1
	sw	a2,0(sp)
	call	fread
	lw	a2,0(sp)
	mv	a5,a0
	bgt	a2,a0,.L20
	lw	s0,16(sp)
	lla	a4,readBuf
	mv	a0,a4
	add	s0,a5,s0
	mv	a1,s0
	sw	a4,20(sp)
	sw	s0,16(sp)
	call	MP3FindSyncWord
	bge	a0,zero,.L21
.L12:
	lw	ra,60(sp)
	lw	s0,56(sp)
	la a5, .LANCHOR0; lw a5, 0(a5);
	lw	a0,16(a5)
	lw	a1,20(a5)
	lw	s1,52(sp)
	addi	sp,sp,64
	jr	ra
.L20:
	add	a0,s0,a0
	sub	a2,a2,a5
	sw	a5,0(sp)
	lla	a5,readBuf
	add	a0,a5,a0
	li	a1,0
	mv	s0,a5
	call	memset
	lw	a5,0(sp)
	sw	s0,20(sp)
	lw	s0,16(sp)
	seqz	a4,a5
	sw	a4,12(sp)
	add	s0,a5,s0
	sw	s0,16(sp)
	lla	a0,readBuf
	j	.L10
.L17:
	lla	a0,.LC4
	call	printf
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	li	a0,0
	li	a1,0
	addi	sp,sp,64
	jr	ra
	.size	bench_run, .-bench_run
	.section	.rodata.bench_validate.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"Encode MP3 size = %d bytes\n"
	.align	2
.LC6:
	.string	"Decode data size = %d bytes\n"
	.align	2
.LC7:
	.string	"MP3 compression rate = %d%%\n"
	.align	2
.LC8:
	.string	"Audio time = %lld us\n"
	.align	2
.LC9:
	.string	"Decode time = %lld us\n"
	.align	2
.LC10:
	.string	"Decode frequency = %d%%\n"
	.section	.text.bench_validate,"ax",@progbits
	.align	2
	.globl	bench_validate
	.hidden	bench_validate
	.type	bench_validate, @function
bench_validate:
	addi	sp,sp,-16
	la a0, .LANCHOR4; lw a0, 0(a0);
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	lla	s1,.LANCHOR8
	call	MP3FreeDecoder
	lw	a4,0(s1)
	lla	s0,.LANCHOR5
	beq	a4,zero,.L32
.L23:
	lw	a0,0(s0)
	lw	a1,4(s0)
	li	a5,1
	sw	a5,0(sp)
	add	a1,a0,a1
	call	bench_checksum
	la a4, .LANCHOR0; lw a4, 0(a4);
	lw	a4,8(a4)
	bne	a4,a0,.L24
	lw	a5,0(s1)
	snez	a5,a5
	sw	a5,0(sp)
.L24:
	lla	a5,.LANCHOR2
	lw	a0,0(a5)
	lla	s1,.LANCHOR3
	call	fclose
	lw	a3,0(s1)
	beq	a3,zero,.L25
	lw	a1,4(s0)
	lw	a0,0(s0)
	li	a2,1
	call	fwrite
	lw	a0,0(s1)
	call	fclose
.L25:
	lw	a0,0(s0)
	call	free
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	a0,0(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L32:
	lla	a5,.LANCHOR2
	lw	a0,0(a5)
	call	ftell
	mv	a1,a0
	sw	a0,0(sp)
	lla	a0,.LC5
	call	printf
	lw	a1,4(s0)
	lla	a0,.LC6
	call	printf
	lw	a2,0(sp)
	slli	a4,a2,1
	add	a1,a4,a2
	srli	a0,a2,31
	sltu	a4,a1,a4
	slli	a3,a1,3
	add	a4,a4,a0
	srli	a1,a1,29
	add	a0,a3,a2
	slli	a4,a4,3
	lw	a2,4(s0)
	sltu	a3,a0,a3
	or	a4,a1,a4
	add	a4,a3,a4
	slli	a4,a4,2
	srli	a1,a0,30
	srai	a3,a2,31
	or	a1,a1,a4
	slli	a0,a0,2
	call	__udivdi3
	mv	a1,a0
	lla	a0,.LC7
	call	printf
	lla	t1,.LANCHOR6
	lw	a1,0(t1)
	lw	a2,4(t1)
	lla	a0,.LC8
	call	printf
	lla	a5,.LANCHOR7
	lw	a1,0(a5)
	lw	a2,4(a5)
	lla	a0,.LC9
	call	printf
	lla	t1,.LANCHOR6
	lw	a0,0(t1)
	lw	t1,4(t1)
	lla	a5,.LANCHOR7
	srli	t2,a0,31
	slli	a4,a0,1
	slli	a1,t1,1
	add	t0,a4,a0
	or	a1,t2,a1
	add	a1,a1,t1
	sltu	a4,t0,a4
	add	a4,a4,a1
	slli	a4,a4,3
	slli	a1,t0,3
	srli	t0,t0,29
	add	a0,a1,a0
	or	a4,t0,a4
	add	a4,a4,t1
	sltu	a1,a0,a1
	lw	a2,0(a5)
	lw	a3,4(a5)
	add	a1,a1,a4
	slli	a1,a1,2
	srli	a4,a0,30
	or	a1,a4,a1
	slli	a0,a0,2
	call	__udivdi3
	mv	a1,a0
	lla	a0,.LC10
	call	printf
	j	.L23
	.size	bench_validate, .-bench_validate
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC11:
	.string	"input/test.mp3"
	.align	2
.LC12:
	.string	"input/train.mp3"
	.align	2
.LC13:
	.string	"input/ref-bad-apple.mp3"
	.align	2
.LC14:
	.string	"input/huge-shamanic-meditations-176746.mp3"
	.section	.bss.obuf,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	obuf, @object
	.size	obuf, 12
obuf:
	.zero	12
	.section	.bss.outBuf,"aw",@nobits
	.align	2
	.type	outBuf, @object
	.size	outBuf, 4608
outBuf:
	.zero	4608
	.section	.bss.readBuf,"aw",@nobits
	.align	2
	.type	readBuf, @object
	.size	readBuf, 16384
readBuf:
	.zero	16384
	.section	.rodata.settings,"a"
	.align	3
	.set	.LANCHOR1,. + 0
	.type	settings, @object
	.size	settings, 96
settings:
	.word	.LC11
	.word	1200
	.word	-659036206
	.zero	4
	.word	0
	.word	0
	.word	.LC12
	.word	5120
	.word	-392825728
	.zero	4
	.word	16
	.word	0
	.word	.LC13
	.word	41943040
	.word	933904230
	.zero	4
	.word	194262
	.word	0
	.word	.LC14
	.word	293601280
	.word	-704977865
	.zero	4
	.word	1623898
	.word	0
	.section	.sbss.audioTime,"aw",@nobits
	.align	3
	.set	.LANCHOR6,. + 0
	.type	audioTime, @object
	.size	audioTime, 8
audioTime:
	.zero	8
	.section	.sbss.err,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	err, @object
	.size	err, 4
err:
	.zero	4
	.section	.sbss.hMP3Decoder,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	hMP3Decoder, @object
	.size	hMP3Decoder, 4
hMP3Decoder:
	.zero	4
	.section	.sbss.infile,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	infile, @object
	.size	infile, 4
infile:
	.zero	4
	.section	.sbss.outfile,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	outfile, @object
	.size	outfile, 4
outfile:
	.zero	4
	.section	.sbss.ps,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	ps, @object
	.size	ps, 4
ps:
	.zero	4
	.section	.sbss.totalDecTime,"aw",@nobits
	.align	3
	.set	.LANCHOR7,. + 0
	.type	totalDecTime, @object
	.size	totalDecTime, 8
totalDecTime:
	.zero	8
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
