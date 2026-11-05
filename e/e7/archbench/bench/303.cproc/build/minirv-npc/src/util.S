#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"util.c"
	.option nopic
	.text
	.section	.rodata.vwarn.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"%s: "
	.section	.text.vwarn,"ax",@progbits
	.align	2
	.type	vwarn, @function
vwarn:
	addi	sp,sp,-16
	sw	s1,4(sp)
	lla	s1,stderr
	sw	s0,8(sp)
	mv	s0,a0
	lw	a0,0(s1)
	sw	a1,0(sp)
	la a2, .LANCHOR0; lw a2, 0(a2);
	lla	a1,.LC0
	sw	ra,12(sp)
	call	fprintf
	lw	a5,0(sp)
	lw	a0,0(s1)
	mv	a1,s0
	mv	a2,a5
	call	vfprintf
	lbu	a5,0(s0)
	beq	a5,zero,.L2
	mv	a0,s0
	call	strlen
	add	s0,s0,a0
	lbu	a4,-1(s0)
	li	a5,58
	beq	a4,a5,.L9
.L2:
	lw	s0,8(sp)
	lw	a1,0(s1)
	lw	ra,12(sp)
	lw	s1,4(sp)
	li	a0,10
	addi	sp,sp,16
	tail	fputc
.L9:
	lw	s0,8(sp)
	lw	a1,0(s1)
	lw	ra,12(sp)
	lw	s1,4(sp)
	li	a0,32
	addi	sp,sp,16
	tail	fputc
	.size	vwarn, .-vwarn
	.section	.text.warn,"ax",@progbits
	.align	2
	.globl	warn
	.hidden	warn
	.type	warn, @function
warn:
	addi	sp,sp,-36
	addi	t1,sp,16
	sw	a1,16(sp)
	mv	a1,t1
	sw	ra,12(sp)
	sw	a2,20(sp)
	sw	a3,24(sp)
	sw	a4,28(sp)
	sw	a5,32(sp)
	sw	t1,0(sp)
	call	vwarn
	lw	ra,12(sp)
	addi	sp,sp,36
	jr	ra
	.size	warn, .-warn
	.section	.text.fatal,"ax",@progbits
	.align	2
	.globl	fatal
	.hidden	fatal
	.type	fatal, @function
fatal:
	addi	sp,sp,-36
	addi	t1,sp,16
	sw	a1,16(sp)
	mv	a1,t1
	sw	ra,12(sp)
	sw	a2,20(sp)
	sw	a3,24(sp)
	sw	a4,28(sp)
	sw	a5,32(sp)
	sw	t1,0(sp)
	call	vwarn
	li	a0,1
	call	exit
	.size	fatal, .-fatal
	.globl	__mulsi3
	.section	.text.reallocarray,"ax",@progbits
	.align	2
	.globl	reallocarray
	.hidden	reallocarray
	.type	reallocarray, @function
reallocarray:
	addi	sp,sp,-24
	sw	s0,16(sp)
	sw	s1,12(sp)
	sw	ra,20(sp)
	mv	s0,a1
	mv	a4,a0
	mv	s1,a2
	beq	a1,zero,.L15
	srli	a5,a2,16
	srli	a3,s0,16
	bne	a5,zero,.L18
	bne	a3,zero,.L20
.L15:
	mv	a1,s1
	mv	a0,s0
	sw	a4,0(sp)
	call	__mulsi3
	lw	a4,0(sp)
	lw	s0,16(sp)
	lw	ra,20(sp)
	lw	s1,12(sp)
	mv	a1,a0
	mv	a0,a4
	addi	sp,sp,24
	tail	realloc
.L18:
	bne	a3,zero,.L27
	mv	a3,a5
	mv	a2,s0
.L20:
	slli	a1,s0,16
	slli	a0,s1,16
	srli	a1,a1,16
	srli	a0,a0,16
	sw	a4,4(sp)
	sh	a2,10(sp)
	sh	a3,8(sp)
	call	__mulsi3
	lhu	a3,8(sp)
	lhu	a2,10(sp)
	sw	a0,0(sp)
	slli	a1,a3,16
	slli	a0,a2,16
	srli	a1,a1,16
	srli	a0,a0,16
	call	__mulsi3
	lw	a5,0(sp)
	lw	a4,4(sp)
	srli	a5,a5,16
	add	a0,a0,a5
	srli	a0,a0,16
	beq	a0,zero,.L15
.L27:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	li	a0,0
	addi	sp,sp,24
	jr	ra
	.size	reallocarray, .-reallocarray
	.section	.rodata.xreallocarray.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"reallocarray:"
	.section	.text.xreallocarray,"ax",@progbits
	.align	2
	.globl	xreallocarray
	.hidden	xreallocarray
	.type	xreallocarray, @function
xreallocarray:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s0,a1
	mv	s1,a2
	call	reallocarray
	beq	a0,zero,.L38
.L29:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L38:
	beq	s0,zero,.L29
	beq	s1,zero,.L29
	lla	a0,.LC1
	call	fatal
	.size	xreallocarray, .-xreallocarray
	.section	.rodata.xmalloc.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"malloc:"
	.section	.text.xmalloc,"ax",@progbits
	.align	2
	.globl	xmalloc
	.hidden	xmalloc
	.type	xmalloc, @function
xmalloc:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	malloc
	beq	a0,zero,.L45
.L39:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L45:
	beq	s0,zero,.L39
	lla	a0,.LC2
	call	fatal
	.size	xmalloc, .-xmalloc
	.section	.text.progname,"ax",@progbits
	.align	2
	.globl	progname
	.hidden	progname
	.type	progname, @function
progname:
	beq	a0,zero,.L48
	addi	sp,sp,-12
	li	a1,47
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	strrchr
	mv	a5,a0
	mv	a0,s0
	beq	a5,zero,.L46
	addi	a0,a5,1
.L46:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L48:
	mv	a0,a1
	ret
	.size	progname, .-progname
	.section	.rodata.arrayadd.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"realloc"
	.section	.text.arrayadd,"ax",@progbits
	.align	2
	.globl	arrayadd
	.hidden	arrayadd
	.type	arrayadd, @function
arrayadd:
	lw	a5,8(a0)
	lw	a4,4(a0)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	sub	a3,a5,a4
	mv	s1,a0
	mv	s0,a1
	lw	a0,0(a0)
	bgeu	a3,a1,.L56
	li	a2,256
	sub	a2,a2,a4
.L59:
	bne	a5,zero,.L57
	li	a5,256
	bleu	s0,a2,.L58
.L57:
	slli	a5,a5,1
	sub	a3,a5,a4
	bltu	a3,s0,.L59
.L58:
	sw	a5,8(s1)
	mv	a1,a5
	call	realloc
	sw	a0,0(s1)
	beq	a0,zero,.L60
	lw	a4,4(s1)
.L56:
	add	s0,s0,a4
	sw	s0,4(s1)
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	add	a0,a0,a4
	addi	sp,sp,12
	jr	ra
.L60:
	lla	a0,.LC3
	call	fatal
	.size	arrayadd, .-arrayadd
	.section	.text.arrayaddptr,"ax",@progbits
	.align	2
	.globl	arrayaddptr
	.hidden	arrayaddptr
	.type	arrayaddptr, @function
arrayaddptr:
	lw	a5,8(a0)
	lw	a4,4(a0)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	li	a3,3
	sub	a2,a5,a4
	mv	s0,a0
	mv	s1,a1
	lw	a0,0(a0)
	bgtu	a2,a3,.L65
	li	a1,256
	sub	a1,a1,a4
.L68:
	bne	a5,zero,.L66
	li	a5,256
	bgtu	a1,a3,.L67
.L66:
	slli	a5,a5,1
	sub	a2,a5,a4
	bleu	a2,a3,.L68
.L67:
	sw	a5,8(s0)
	mv	a1,a5
	call	realloc
	sw	a0,0(s0)
	beq	a0,zero,.L69
	lw	a4,4(s0)
.L65:
	addi	a5,a4,4
	sw	a5,4(s0)
	lw	ra,8(sp)
	lw	s0,4(sp)
	add	a0,a0,a4
	sw	s1,0(a0)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L69:
	lla	a0,.LC3
	call	fatal
	.size	arrayaddptr, .-arrayaddptr
	.section	.text.arrayaddbuf,"ax",@progbits
	.align	2
	.globl	arrayaddbuf
	.hidden	arrayaddbuf
	.type	arrayaddbuf, @function
arrayaddbuf:
	addi	sp,sp,-12
	sw	s1,0(sp)
	mv	s1,a1
	mv	a1,a2
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a2
	call	arrayadd
	mv	a2,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	mv	a1,s1
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	memcpy
	.size	arrayaddbuf, .-arrayaddbuf
	.section	.rodata.arraylast.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"AM Panic: "
	.align	2
.LC5:
	.string	"Assertion `n <= a->len' failed"
	.align	2
.LC6:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/303.cproc/src/util.c:101  \n"
	.section	.text.arraylast,"ax",@progbits
	.align	2
	.globl	arraylast
	.hidden	arraylast
	.type	arraylast, @function
arraylast:
	lw	a5,4(a0)
	beq	a5,zero,.L81
	bltu	a5,a1,.L88
	lw	a0,0(a0)
	sub	a5,a5,a1
	add	a0,a0,a5
	ret
.L81:
	li	a0,0
	ret
.L88:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC4
	li	a0,65
.L78:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L78
	lla	s0,.LC5
	li	a0,65
.L79:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L79
	lla	s0,.LC6
	li	a0,32
.L80:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L80
	li	a0,1
	call	halt
	.size	arraylast, .-arraylast
	.section	.text.listinsert,"ax",@progbits
	.align	2
	.globl	listinsert
	.hidden	listinsert
	.type	listinsert, @function
listinsert:
	lw	a5,4(a0)
	sw	a0,0(a1)
	sw	a5,4(a1)
	sw	a1,0(a5)
	sw	a1,4(a0)
	ret
	.size	listinsert, .-listinsert
	.section	.text.listremove,"ax",@progbits
	.align	2
	.globl	listremove
	.hidden	listremove
	.type	listremove, @function
listremove:
	lw	a4,4(a0)
	lw	a5,0(a0)
	sw	a5,0(a4)
	sw	a4,4(a5)
	sw	zero,0(a0)
	sw	zero,4(a0)
	ret
	.size	listremove, .-listremove
	.hidden	argv0
	.globl	argv0
	.section	.sbss.argv0,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	argv0, @object
	.size	argv0, 4
argv0:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
