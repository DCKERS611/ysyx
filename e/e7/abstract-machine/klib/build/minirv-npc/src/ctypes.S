#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ctypes.c"
	.option nopic
	.text
	.section	.text.isspace,"ax",@progbits
	.align	2
	.globl	isspace
	.hidden	isspace
	.type	isspace, @function
isspace:
	li	a5,13
	bgt	a0,a5,.L2
	slti	a0,a0,9
	xori	a0,a0,1
	ret
.L2:
	addi	a0,a0,-32
	seqz	a0,a0
	ret
	.size	isspace, .-isspace
	.section	.text.isprint,"ax",@progbits
	.align	2
	.globl	isprint
	.hidden	isprint
	.type	isprint, @function
isprint:
	addi	a0,a0,-32
	sltiu	a0,a0,96
	ret
	.size	isprint, .-isprint
	.section	.text.isdigit,"ax",@progbits
	.align	2
	.globl	isdigit
	.hidden	isdigit
	.type	isdigit, @function
isdigit:
	addi	a0,a0,-48
	sltiu	a0,a0,10
	ret
	.size	isdigit, .-isdigit
	.section	.text.isxdigit,"ax",@progbits
	.align	2
	.globl	isxdigit
	.hidden	isxdigit
	.type	isxdigit, @function
isxdigit:
	addi	a4,a0,-48
	li	a5,9
	bleu	a4,a5,.L9
	andi	a0,a0,-33
	addi	a0,a0,-65
	sltiu	a0,a0,6
	ret
.L9:
	li	a0,1
	ret
	.size	isxdigit, .-isxdigit
	.section	.text.islower,"ax",@progbits
	.align	2
	.globl	islower
	.hidden	islower
	.type	islower, @function
islower:
	addi	a0,a0,-97
	sltiu	a0,a0,26
	ret
	.size	islower, .-islower
	.section	.text.isupper,"ax",@progbits
	.align	2
	.globl	isupper
	.hidden	isupper
	.type	isupper, @function
isupper:
	addi	a0,a0,-65
	sltiu	a0,a0,26
	ret
	.size	isupper, .-isupper
	.section	.text.isalpha,"ax",@progbits
	.align	2
	.globl	isalpha
	.hidden	isalpha
	.type	isalpha, @function
isalpha:
	andi	a0,a0,-33
	addi	a0,a0,-65
	sltiu	a0,a0,26
	ret
	.size	isalpha, .-isalpha
	.section	.text.isalnum,"ax",@progbits
	.align	2
	.globl	isalnum
	.hidden	isalnum
	.type	isalnum, @function
isalnum:
	andi	a5,a0,-33
	addi	a5,a5,-65
	li	a4,25
	bleu	a5,a4,.L15
	addi	a0,a0,-48
	sltiu	a0,a0,10
	ret
.L15:
	li	a0,1
	ret
	.size	isalnum, .-isalnum
	.section	.text.ispunct,"ax",@progbits
	.align	2
	.globl	ispunct
	.hidden	ispunct
	.type	ispunct, @function
ispunct:
	addi	a3,a0,-33
	li	a4,94
	mv	a5,a0
	bgtu	a3,a4,.L18
	andi	a4,a0,-33
	addi	a4,a4,-65
	li	a3,25
	li	a0,0
	bgtu	a4,a3,.L20
	ret
.L18:
	li	a0,0
	ret
.L20:
	addi	a5,a5,-48
	sltiu	a5,a5,10
	xori	a0,a5,1
	ret
	.size	ispunct, .-ispunct
	.section	.text.iscntrl,"ax",@progbits
	.align	2
	.globl	iscntrl
	.hidden	iscntrl
	.type	iscntrl, @function
iscntrl:
	sltiu	a0,a0,32
	ret
	.size	iscntrl, .-iscntrl
	.section	.text.isgraph,"ax",@progbits
	.align	2
	.globl	isgraph
	.hidden	isgraph
	.type	isgraph, @function
isgraph:
	addi	a0,a0,-33
	sltiu	a0,a0,95
	ret
	.size	isgraph, .-isgraph
	.section	.text.tolower,"ax",@progbits
	.align	2
	.globl	tolower
	.hidden	tolower
	.type	tolower, @function
tolower:
	addi	a4,a0,-65
	li	a5,25
	bgtu	a4,a5,.L24
	addi	a0,a0,32
.L24:
	ret
	.size	tolower, .-tolower
	.section	.text.toupper,"ax",@progbits
	.align	2
	.globl	toupper
	.hidden	toupper
	.type	toupper, @function
toupper:
	addi	a4,a0,-97
	li	a5,25
	bgtu	a4,a5,.L26
	addi	a0,a0,-32
.L26:
	ret
	.size	toupper, .-toupper
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
