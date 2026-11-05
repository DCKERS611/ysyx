#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"audio.c"
	.option nopic
	.text
	.section	.rodata.audio_test.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"minirv-ysyxsoc"
	.align	2
.LC1:
	.string	"WARNING: %s does not support audio\n"
	.align	2
.LC2:
	.string	"Already play %d/%d bytes of data\n"
	.section	.text.audio_test,"ax",@progbits
	.align	2
	.globl	audio_test
	.hidden	audio_test
	.type	audio_test, @function
audio_test:
	addi	sp,sp,-28
	addi	a1,sp,4
	li	a0,14
	sw	ra,24(sp)
	sw	s0,20(sp)
	sw	s1,16(sp)
	call	ioe_read
	lbu	a5,4(sp)
	beq	a5,zero,.L14
	li	a5,8192
	addi	a5,a5,-192
	sw	a5,4(sp)
	li	a5,1
	sw	a5,8(sp)
	addi	a1,sp,4
	li	a5,1024
	li	a0,15
	sw	a5,12(sp)
	call	ioe_write
	lla	a5,audio_payload_end
	lla	a3,audio_payload
	sub	s1,a5,a3
	beq	a5,a3,.L6
	li	s0,0
	li	a5,0
.L5:
	sub	a5,s1,a5
	li	a4,4096
	mv	a2,a3
	addi	a1,sp,4
	li	a0,17
	bleu	a5,a4,.L4
	li	a5,4096
.L4:
	add	a3,a3,a5
	add	s0,s0,a5
	sw	a3,8(sp)
	sw	a3,0(sp)
	sw	a2,4(sp)
	call	ioe_write
	mv	a2,s1
	mv	a1,s0
	lla	a0,.LC2
	call	printf
	lw	a3,0(sp)
	mv	a5,s0
	bltu	s0,s1,.L5
.L6:
	addi	a1,sp,4
	li	a0,16
	call	ioe_read
	lw	a5,4(sp)
	bgt	a5,zero,.L6
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L14:
	lw	s0,20(sp)
	lw	ra,24(sp)
	lw	s1,16(sp)
	lla	a1,.LC0
	lla	a0,.LC1
	addi	sp,sp,28
	tail	printf
	.size	audio_test, .-audio_test
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
