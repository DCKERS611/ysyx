#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"main.c"
	.option nopic
	.text
	.section	.rodata.loadContent.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `input != ((void *)0)' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/305.h264/src/main.c:30  \n"
	.align	2
.LC3:
	.string	"Assertion `contentBuffer != ((void *)0)' failed"
	.align	2
.LC4:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/305.h264/src/main.c:37  \n"
	.align	2
.LC5:
	.string	"r"
	.section	.text.loadContent,"ax",@progbits
	.align	2
	.globl	loadContent
	.hidden	loadContent
	.type	loadContent, @function
loadContent:
	addi	sp,sp,-24
	mv	a5,a1
	lla	a1,.LC5
	sw	ra,20(sp)
	sw	s0,16(sp)
	sw	s1,12(sp)
	sw	a5,8(sp)
	call	fopen
	beq	a0,zero,.L24
	li	a2,2
	li	a1,0
	mv	s1,a0
	call	fseek
	mv	a0,s1
	call	ftell
	li	a2,0
	li	a1,0
	mv	s0,a0
	mv	a0,s1
	call	fseek
	mv	a0,s0
	call	malloc
	sw	a0,4(sp)
	beq	a0,zero,.L12
	li	a5,0
	beq	s0,zero,.L8
.L7:
	lw	a4,4(sp)
	sub	a2,s0,a5
	mv	a3,s1
	add	a0,a4,a5
	li	a1,1
	sw	a5,0(sp)
	call	fread
	lw	a5,0(sp)
	add	a5,a5,a0
	bltu	a5,s0,.L7
.L8:
	mv	a0,s1
	call	fclose
	lw	a5,8(sp)
	lw	ra,20(sp)
	lw	a0,4(sp)
	sw	s0,0(a5)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L24:
	lla	s0,.LC0
	li	a0,65
.L3:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L3
	lla	s0,.LC1
	li	a0,65
.L4:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L4
	lla	s0,.LC2
	li	a0,32
.L5:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L5
.L11:
	li	a0,1
	call	halt
.L12:
	lla	s0,.LC0
	li	a0,65
.L6:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L6
	lla	s0,.LC3
	li	a0,65
.L9:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L9
	lla	s0,.LC4
	li	a0,32
.L10:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L10
	j	.L11
	.size	loadContent, .-loadContent
	.globl	__mulsi3
	.section	.text.savePic,"ax",@progbits
	.align	2
	.globl	savePic
	.hidden	savePic
	.type	savePic, @function
savePic:
	addi	sp,sp,-16
	mv	a5,a1
	sw	s0,8(sp)
	mv	a1,a2
	mv	s0,a0
	mv	a0,a5
	sw	ra,12(sp)
	sw	s1,4(sp)
	sw	s0,0(sp)
	call	__mulsi3
	slli	a5,a0,1
	add	a0,a5,a0
	srli	a4,a0,31
	add	a4,a4,a0
	mv	s1,s0
	srai	s0,a4,1
	mv	a2,s0
	mv	a1,s1
	lla	a0,.LANCHOR0
	call	bench_obuf_append
	lla	a5,.LANCHOR1
	lw	a3,0(a5)
	beq	a3,zero,.L25
	beq	s0,zero,.L25
	li	s1,0
	j	.L27
.L35:
	lla	a5,.LANCHOR1
	lw	a3,0(a5)
.L27:
	lw	a5,0(sp)
	sub	a2,s0,s1
	li	a1,1
	add	a0,a5,s1
	call	fwrite
	add	s1,s1,a0
	bltu	s1,s0,.L35
.L25:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	savePic, .-savePic
	.section	.rodata.bench_init.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	"w"
	.align	2
.LC7:
	.string	"build/output.yuv"
	.align	2
.LC8:
	.string	"h264bsdInit failed\n"
	.section	.text.bench_init,"ax",@progbits
	.align	2
	.globl	bench_init
	.hidden	bench_init
	.type	bench_init, @function
bench_init:
	slli	a5,a0,1
	add	a5,a5,a0
	lla	a4,.LANCHOR3
	slli	a5,a5,3
	add	a5,a4,a5
	lw	a0,0(a5)
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	a1,.LANCHOR4
	lla	s0,.LANCHOR2
	sw	ra,8(sp)
	sw	a5,0(s0)
	call	loadContent
	mv	a5,a0
	lla	a1,.LC6
	lla	a0,.LC7
	la a4, .LANCHOR5; sw a5, 0(a4);
	call	fopen
	lw	a5,0(s0)
	mv	a4,a0
	lla	a0,.LANCHOR0
	lw	a1,4(a5)
	la a3, .LANCHOR1; sw a4, 0(a3);
	la a5, .LANCHOR6; sw zero, 0(a5);
	call	bench_obuf_init
	li	a1,0
	lla	a0,dec
	call	h264bsdInit
	bne	a0,zero,.L39
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L39:
	lla	a1,.LC8
	la a0, stderr; lw a0, 0(a0);
	call	fprintf
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,1
	addi	sp,sp,12
	tail	bench_exit
	.size	bench_init, .-bench_init
	.section	.rodata.bench_run.str1.4,"aMS",@progbits,1
	.align	2
.LC9:
	.string	"(cropped) "
	.align	2
.LC10:
	.string	""
	.align	2
.LC11:
	.string	"Decoded headers. Image size %s%dx%d.\n"
	.align	2
.LC12:
	.string	"Error\n"
	.align	2
.LC13:
	.string	"Param set error\n"
	.section	.text.bench_run,"ax",@progbits
	.align	2
	.globl	bench_run
	.hidden	bench_run
	.type	bench_run, @function
bench_run:
	addi	sp,sp,-48
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	ra,44(sp)
	la s1, .LANCHOR4; lw s1, 0(s1);
	la s0, .LANCHOR5; lw s0, 0(s0);
.L57:
	beq	s1,zero,.L50
.L58:
	mv	a2,s1
	mv	a1,s0
	mv	a4,sp
	li	a3,0
	lla	a0,dec
	call	h264bsdDecode
	lw	a4,0(sp)
	li	a5,3
	sub	s1,s1,a4
	add	s0,s0,a4
	beq	a0,a5,.L42
	bgtu	a0,a5,.L43
	li	a5,1
	beq	a0,a5,.L44
	li	a5,2
	bne	a0,a5,.L57
	addi	a5,sp,28
	addi	a4,sp,16
	addi	a3,sp,24
	addi	a2,sp,20
	addi	a1,sp,32
	lla	a0,dec
	call	h264bsdCroppingParams
	lw	a5,32(sp)
	beq	a5,zero,.L48
	lw	a3,28(sp)
	lla	a1,.LC9
.L49:
	lw	a2,24(sp)
	lla	a0,.LC11
	call	printf
	bne	s1,zero,.L58
.L50:
	lw	ra,44(sp)
	lw	s0,40(sp)
	la a5, .LANCHOR2; lw a5, 0(a5);
	lw	a0,16(a5)
	lw	a1,20(a5)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
.L43:
	li	a5,4
	bne	a0,a5,.L57
.L47:
	lla	a0,.LC13
	call	printf
	li	a0,1
	call	bench_exit
	j	.L57
.L42:
	lla	a0,.LC12
	call	printf
	li	a0,1
	call	bench_exit
	j	.L47
.L44:
	addi	a3,sp,12
	addi	a2,sp,8
	addi	a1,sp,4
	lla	a0,dec
	call	h264bsdNextOutputPicture
	lla	a5,.LANCHOR6
	lw	a3,0(a5)
	lw	a2,28(sp)
	lw	a1,24(sp)
	addi	a3,a3,1
	sw	a3,0(a5)
	call	savePic
	j	.L57
.L48:
	lla	a0,dec
	call	h264bsdPicWidth
	slli	a5,a0,4
	lla	a0,dec
	sw	a5,24(sp)
	call	h264bsdPicHeight
	lw	a5,32(sp)
	slli	a3,a0,4
	sw	a3,28(sp)
	bne	a5,zero,.L51
	lla	a1,.LC10
	j	.L49
.L51:
	lla	a1,.LC9
	j	.L49
	.size	bench_run, .-bench_run
	.section	.rodata.bench_validate.str1.4,"aMS",@progbits,1
	.align	2
.LC14:
	.string	"%d pictures decoded.\n"
	.align	2
.LC15:
	.string	"Encode h264 size = %ld bytes\n"
	.align	2
.LC16:
	.string	"Decode data size = %ld bytes\n"
	.globl	__udivdi3
	.align	2
.LC17:
	.string	"h264 compression rate = %d*10^{-4}\n"
	.section	.text.bench_validate,"ax",@progbits
	.align	2
	.globl	bench_validate
	.hidden	bench_validate
	.type	bench_validate, @function
bench_validate:
	addi	sp,sp,-12
	lla	a0,dec
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	call	h264bsdShutdown
	la a1, .LANCHOR6; lw a1, 0(a1);
	lla	a0,.LC14
	call	printf
	lla	s1,.LANCHOR4
	lw	a1,0(s1)
	lla	a0,.LC15
	lla	s0,.LANCHOR0
	call	printf
	lw	a1,4(s0)
	lla	a0,.LC16
	call	printf
	lw	a0,0(s1)
	srai	a4,a0,31
	slli	a2,a4,2
	slli	a5,a0,2
	srli	a1,a0,30
	add	a3,a5,a0
	or	a2,a1,a2
	add	a2,a2,a4
	sltu	a5,a3,a5
	add	a5,a5,a2
	slli	a1,a3,3
	srli	a2,a3,29
	slli	a5,a5,3
	sub	a3,a1,a0
	or	a5,a2,a5
	sub	a5,a5,a4
	sgtu	a1,a3,a1
	sub	a5,a5,a1
	slli	a5,a5,4
	slli	a1,a3,4
	srli	a3,a3,28
	add	a0,a1,a0
	or	a5,a3,a5
	add	a5,a5,a4
	lw	a2,4(s0)
	sltu	a1,a0,a1
	add	a1,a1,a5
	slli	a1,a1,4
	srli	a5,a0,28
	srai	a3,a2,31
	or	a1,a5,a1
	slli	a0,a0,4
	call	__udivdi3
	mv	a1,a0
	lla	a0,.LC17
	call	printf
	lw	a0,0(s0)
	lw	a1,4(s0)
	add	a1,a0,a1
	call	bench_checksum
	la a4, .LANCHOR2; lw a4, 0(a4);
	lw	s1,8(a4)
	mv	a5,a0
	la a0, .LANCHOR5; lw a0, 0(a0);
	sub	s1,s1,a5
	call	free
	la a0, .LANCHOR1; lw a0, 0(a0);
	snez	s1,s1
	beq	a0,zero,.L60
	call	fclose
.L60:
	lw	a0,0(s0)
	call	free
	lw	ra,8(sp)
	lw	s0,4(sp)
	mv	a0,s1
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	bench_validate, .-bench_validate
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC18:
	.string	"input/test-orbit-8x6.h264"
	.align	2
.LC19:
	.string	"input/train-orbit-160x120.h264"
	.align	2
.LC20:
	.string	"input/ref-light.h264"
	.align	2
.LC21:
	.string	"input/huge-bad-apple.h264"
	.section	.bss.dec,"aw",@nobits
	.align	2
	.type	dec, @object
	.size	dec, 3396
dec:
	.zero	3396
	.section	.bss.obuf,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	obuf, @object
	.size	obuf, 12
obuf:
	.zero	12
	.section	.rodata.settings,"a"
	.align	3
	.set	.LANCHOR3,. + 0
	.type	settings, @object
	.size	settings, 96
settings:
	.word	.LC18
	.word	72
	.word	1481389113
	.zero	4
	.word	0
	.word	0
	.word	.LC19
	.word	86400
	.word	187225749
	.zero	4
	.word	189
	.word	0
	.word	.LC20
	.word	83980800
	.word	48343813
	.zero	4
	.word	205260
	.word	0
	.word	.LC21
	.word	1938751488
	.word	1581884347
	.zero	4
	.word	2521343
	.word	0
	.section	.sbss.contentBuffer,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	contentBuffer, @object
	.size	contentBuffer, 4
contentBuffer:
	.zero	4
	.section	.sbss.contentSize,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	contentSize, @object
	.size	contentSize, 4
contentSize:
	.zero	4
	.section	.sbss.numPics,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	numPics, @object
	.size	numPics, 4
numPics:
	.zero	4
	.section	.sbss.outputFile,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	outputFile, @object
	.size	outputFile, 4
outputFile:
	.zero	4
	.section	.sbss.ps,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	ps, @object
	.size	ps, 4
ps:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
