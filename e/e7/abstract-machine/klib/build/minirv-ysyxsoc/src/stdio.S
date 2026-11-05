#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"stdio.c"
	.option nopic
	.text
	.section	.rodata.printf.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Not implemented"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/abstract-machine/klib/src/stdio.c:6  \n"
	.section	.text.printf,"ax",@progbits
	.align	2
	.globl	printf
	.hidden	printf
	.type	printf, @function
printf:
	addi	sp,sp,-32
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	a1,12(sp)
	sw	a2,16(sp)
	sw	a3,20(sp)
	sw	a4,24(sp)
	sw	a5,28(sp)
	lla	s0,.LC0
	li	a0,65
.L2:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L2
	lla	s0,.LC1
	li	a0,78
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
	.size	printf, .-printf
	.section	.rodata.vprintf.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	" @ /home/ysyx/ysyx-workbench/abstract-machine/klib/src/stdio.c:10  \n"
	.section	.text.vprintf,"ax",@progbits
	.align	2
	.globl	vprintf
	.hidden	vprintf
	.type	vprintf, @function
vprintf:
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
	lla	s0,.LC1
	li	a0,78
.L12:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L12
	lla	s0,.LC3
	li	a0,32
.L13:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L13
	li	a0,1
	call	halt
	.size	vprintf, .-vprintf
	.section	.rodata.vsprintf.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	" @ /home/ysyx/ysyx-workbench/abstract-machine/klib/src/stdio.c:14  \n"
	.section	.text.vsprintf,"ax",@progbits
	.align	2
	.globl	vsprintf
	.hidden	vsprintf
	.type	vsprintf, @function
vsprintf:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L19:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L19
	lla	s0,.LC1
	li	a0,78
.L20:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L20
	lla	s0,.LC4
	li	a0,32
.L21:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L21
	li	a0,1
	call	halt
	.size	vsprintf, .-vsprintf
	.section	.rodata.sprintf.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	" @ /home/ysyx/ysyx-workbench/abstract-machine/klib/src/stdio.c:18  \n"
	.section	.text.sprintf,"ax",@progbits
	.align	2
	.globl	sprintf
	.hidden	sprintf
	.type	sprintf, @function
sprintf:
	addi	sp,sp,-28
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	a2,12(sp)
	sw	a3,16(sp)
	sw	a4,20(sp)
	sw	a5,24(sp)
	lla	s0,.LC0
	li	a0,65
.L27:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L27
	lla	s0,.LC1
	li	a0,78
.L28:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L28
	lla	s0,.LC5
	li	a0,32
.L29:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L29
	li	a0,1
	call	halt
	.size	sprintf, .-sprintf
	.section	.rodata.snprintf.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	" @ /home/ysyx/ysyx-workbench/abstract-machine/klib/src/stdio.c:22  \n"
	.section	.text.snprintf,"ax",@progbits
	.align	2
	.globl	snprintf
	.hidden	snprintf
	.type	snprintf, @function
snprintf:
	addi	sp,sp,-24
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	a3,12(sp)
	sw	a4,16(sp)
	sw	a5,20(sp)
	lla	s0,.LC0
	li	a0,65
.L35:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L35
	lla	s0,.LC1
	li	a0,78
.L36:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L36
	lla	s0,.LC6
	li	a0,32
.L37:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L37
	li	a0,1
	call	halt
	.size	snprintf, .-snprintf
	.section	.rodata.vsnprintf.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	" @ /home/ysyx/ysyx-workbench/abstract-machine/klib/src/stdio.c:26  \n"
	.section	.text.vsnprintf,"ax",@progbits
	.align	2
	.globl	vsnprintf
	.hidden	vsnprintf
	.type	vsnprintf, @function
vsnprintf:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L43:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L43
	lla	s0,.LC1
	li	a0,78
.L44:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L44
	lla	s0,.LC7
	li	a0,32
.L45:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L45
	li	a0,1
	call	halt
	.size	vsnprintf, .-vsnprintf
	.section	.rodata.__am_vsscanf_internal.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	"Unsupported conversion specifier '%c'\n"
	.section	.text.__am_vsscanf_internal,"ax",@progbits
	.align	2
	.globl	__am_vsscanf_internal
	.hidden	__am_vsscanf_internal
	.type	__am_vsscanf_internal, @function
__am_vsscanf_internal:
	addi	sp,sp,-36
	sw	s1,24(sp)
	sw	ra,32(sp)
	sw	s0,28(sp)
	lbu	a5,0(a2)
	sw	a1,12(sp)
	sw	a3,8(sp)
	mv	s1,a0
	beq	a5,zero,.L66
	mv	s0,a2
	sw	zero,0(sp)
.L64:
	mv	a0,a5
	sw	a5,4(sp)
	call	isspace
	lw	a5,0(sp)
	addi	a2,s0,1
	addi	a4,a5,-1
	lw	a5,4(sp)
	bne	a0,zero,.L72
	li	a3,37
	beq	a5,a3,.L58
	lbu	a3,0(s1)
	beq	a3,a5,.L73
.L51:
	lw	a5,12(sp)
	beq	a5,zero,.L50
	sw	s1,0(a5)
.L50:
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	mv	a0,a4
	addi	sp,sp,36
	jr	ra
.L58:
	lbu	a1,1(s0)
	sw	a4,4(sp)
	li	a5,99
	addi	s0,s0,2
	beq	a1,a5,.L60
	li	a5,100
	bne	a1,a5,.L61
	lw	a5,8(sp)
	li	a2,10
	addi	a1,sp,20
	lw	a3,0(a5)
	mv	a0,s1
	sw	a3,16(sp)
	call	strtol
	lw	a3,16(sp)
	lw	a4,8(sp)
	lw	a5,20(sp)
	sw	a0,0(a3)
	addi	a3,a4,4
	lw	a4,4(sp)
	beq	a5,s1,.L51
	lw	a4,0(sp)
	sw	a3,8(sp)
	mv	s1,a5
	j	.L63
.L60:
	lw	a2,8(sp)
	lbu	a3,0(s1)
	lw	a4,0(sp)
	lw	a5,0(a2)
	addi	a2,a2,4
	sw	a2,8(sp)
	sb	a3,0(a5)
	addi	s1,s1,1
.L63:
	lw	a3,0(sp)
	lbu	a5,0(s0)
	addi	a3,a3,1
	sw	a3,0(sp)
	bne	a5,zero,.L64
	j	.L51
.L73:
	lw	a4,0(sp)
	addi	s1,s1,1
	mv	s0,a2
	j	.L63
.L72:
	lbu	a0,1(s0)
	mv	s0,a2
	j	.L53
.L54:
	lbu	a0,1(s0)
	addi	s0,s0,1
.L53:
	call	isspace
	bne	a0,zero,.L54
	lbu	a0,0(s1)
	j	.L55
.L56:
	lbu	a0,1(s1)
	addi	s1,s1,1
.L55:
	call	isspace
	bne	a0,zero,.L56
	lw	a4,0(sp)
	j	.L63
.L66:
	li	a4,-1
	j	.L51
.L61:
	lla	a0,.LC8
	call	printf
	.size	__am_vsscanf_internal, .-__am_vsscanf_internal
	.section	.text.vsscanf,"ax",@progbits
	.align	2
	.globl	vsscanf
	.hidden	vsscanf
	.type	vsscanf, @function
vsscanf:
	mv	a3,a2
	mv	a2,a1
	li	a1,0
	tail	__am_vsscanf_internal
	.size	vsscanf, .-vsscanf
	.section	.text.sscanf,"ax",@progbits
	.align	2
	.globl	sscanf
	.hidden	sscanf
	.type	sscanf, @function
sscanf:
	addi	sp,sp,-32
	addi	t1,sp,16
	sw	a2,16(sp)
	sw	a3,20(sp)
	mv	a2,a1
	mv	a3,t1
	li	a1,0
	sw	ra,12(sp)
	sw	a4,24(sp)
	sw	a5,28(sp)
	sw	t1,0(sp)
	call	__am_vsscanf_internal
	lw	ra,12(sp)
	addi	sp,sp,32
	jr	ra
	.size	sscanf, .-sscanf
	.section	.text.__isoc99_sscanf,"ax",@progbits
	.align	2
	.globl	__isoc99_sscanf
	.hidden	__isoc99_sscanf
	.type	__isoc99_sscanf, @function
__isoc99_sscanf:
	addi	sp,sp,-32
	addi	t1,sp,16
	sw	a2,16(sp)
	sw	a3,20(sp)
	mv	a2,a1
	mv	a3,t1
	li	a1,0
	sw	ra,12(sp)
	sw	a4,24(sp)
	sw	a5,28(sp)
	sw	t1,0(sp)
	call	__am_vsscanf_internal
	lw	ra,12(sp)
	addi	sp,sp,32
	jr	ra
	.size	__isoc99_sscanf, .-__isoc99_sscanf
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
