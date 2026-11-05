#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"string.c"
	.option nopic
	.text
	.section	.rodata.strlen.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Not implemented"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/abstract-machine/klib/src/string.c:6  \n"
	.section	.text.strlen,"ax",@progbits
	.align	2
	.globl	strlen
	.hidden	strlen
	.type	strlen, @function
strlen:
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
	.size	strlen, .-strlen
	.section	.rodata.strcpy.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	" @ /home/ysyx/ysyx-workbench/abstract-machine/klib/src/string.c:10  \n"
	.section	.text.strcpy,"ax",@progbits
	.align	2
	.globl	strcpy
	.hidden	strcpy
	.type	strcpy, @function
strcpy:
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
	.size	strcpy, .-strcpy
	.section	.rodata.strncpy.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	" @ /home/ysyx/ysyx-workbench/abstract-machine/klib/src/string.c:14  \n"
	.section	.text.strncpy,"ax",@progbits
	.align	2
	.globl	strncpy
	.hidden	strncpy
	.type	strncpy, @function
strncpy:
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
	.size	strncpy, .-strncpy
	.section	.rodata.strcat.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	" @ /home/ysyx/ysyx-workbench/abstract-machine/klib/src/string.c:18  \n"
	.section	.text.strcat,"ax",@progbits
	.align	2
	.globl	strcat
	.hidden	strcat
	.type	strcat, @function
strcat:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
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
	.size	strcat, .-strcat
	.section	.rodata.strcmp.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	" @ /home/ysyx/ysyx-workbench/abstract-machine/klib/src/string.c:22  \n"
	.section	.text.strcmp,"ax",@progbits
	.align	2
	.globl	strcmp
	.hidden	strcmp
	.type	strcmp, @function
strcmp:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
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
	.size	strcmp, .-strcmp
	.section	.rodata.strncmp.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	" @ /home/ysyx/ysyx-workbench/abstract-machine/klib/src/string.c:26  \n"
	.section	.text.strncmp,"ax",@progbits
	.align	2
	.globl	strncmp
	.hidden	strncmp
	.type	strncmp, @function
strncmp:
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
	.size	strncmp, .-strncmp
	.section	.rodata.memset.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	" @ /home/ysyx/ysyx-workbench/abstract-machine/klib/src/string.c:30  \n"
	.section	.text.memset,"ax",@progbits
	.align	2
	.globl	memset
	.hidden	memset
	.type	memset, @function
memset:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L51:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L51
	lla	s0,.LC1
	li	a0,78
.L52:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L52
	lla	s0,.LC8
	li	a0,32
.L53:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L53
	li	a0,1
	call	halt
	.size	memset, .-memset
	.section	.rodata.memmove.str1.4,"aMS",@progbits,1
	.align	2
.LC9:
	.string	" @ /home/ysyx/ysyx-workbench/abstract-machine/klib/src/string.c:34  \n"
	.section	.text.memmove,"ax",@progbits
	.align	2
	.globl	memmove
	.hidden	memmove
	.type	memmove, @function
memmove:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L59:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L59
	lla	s0,.LC1
	li	a0,78
.L60:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L60
	lla	s0,.LC9
	li	a0,32
.L61:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L61
	li	a0,1
	call	halt
	.size	memmove, .-memmove
	.section	.rodata.memcpy.str1.4,"aMS",@progbits,1
	.align	2
.LC10:
	.string	" @ /home/ysyx/ysyx-workbench/abstract-machine/klib/src/string.c:38  \n"
	.section	.text.memcpy,"ax",@progbits
	.align	2
	.globl	memcpy
	.hidden	memcpy
	.type	memcpy, @function
memcpy:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L67:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L67
	lla	s0,.LC1
	li	a0,78
.L68:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L68
	lla	s0,.LC10
	li	a0,32
.L69:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L69
	li	a0,1
	call	halt
	.size	memcpy, .-memcpy
	.section	.rodata.memcmp.str1.4,"aMS",@progbits,1
	.align	2
.LC11:
	.string	" @ /home/ysyx/ysyx-workbench/abstract-machine/klib/src/string.c:42  \n"
	.section	.text.memcmp,"ax",@progbits
	.align	2
	.globl	memcmp
	.hidden	memcmp
	.type	memcmp, @function
memcmp:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L75:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L75
	lla	s0,.LC1
	li	a0,78
.L76:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L76
	lla	s0,.LC11
	li	a0,32
.L77:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L77
	li	a0,1
	call	halt
	.size	memcmp, .-memcmp
	.section	.text.strchr,"ax",@progbits
	.align	2
	.globl	strchr
	.hidden	strchr
	.type	strchr, @function
strchr:
	lbu	a5,0(a0)
	bne	a1,a5,.L84
	j	.L82
.L89:
	lbu	a5,0(a0)
	beq	a5,a1,.L88
.L84:
	addi	a0,a0,1
	bne	a5,zero,.L89
	li	a0,0
.L82:
	ret
.L88:
	ret
	.size	strchr, .-strchr
	.section	.text.strrchr,"ax",@progbits
	.align	2
	.globl	strrchr
	.hidden	strrchr
	.type	strrchr, @function
strrchr:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	strlen
	.size	strrchr, .-strrchr
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
