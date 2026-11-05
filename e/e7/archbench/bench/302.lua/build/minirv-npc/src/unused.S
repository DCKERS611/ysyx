#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"unused.c"
	.option nopic
	.text
	.section	.text.floor,"ax",@progbits
	.align	2
	.globl	floor
	.hidden	floor
	.type	floor, @function
floor:
	ret
	.size	floor, .-floor
	.section	.rodata.pow.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `0' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:11  \n"
	.section	.text.pow,"ax",@progbits
	.align	2
	.globl	pow
	.hidden	pow
	.type	pow, @function
pow:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L4:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L4
	lla	s0,.LC1
	li	a0,65
.L5:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L5
	lla	s0,.LC2
	li	a0,32
.L6:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L6
	li	a0,1
	call	halt
	.size	pow, .-pow
	.section	.rodata.fmod.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:14  \n"
	.section	.text.fmod,"ax",@progbits
	.align	2
	.globl	fmod
	.hidden	fmod
	.type	fmod, @function
fmod:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L12:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L12
	lla	s0,.LC1
	li	a0,65
.L13:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L13
	lla	s0,.LC3
	li	a0,32
.L14:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L14
	li	a0,1
	call	halt
	.size	fmod, .-fmod
	.section	.rodata.frexp.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:17  \n"
	.section	.text.frexp,"ax",@progbits
	.align	2
	.globl	frexp
	.hidden	frexp
	.type	frexp, @function
frexp:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L20:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L20
	lla	s0,.LC1
	li	a0,65
.L21:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L21
	lla	s0,.LC4
	li	a0,32
.L22:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L22
	li	a0,1
	call	halt
	.size	frexp, .-frexp
	.section	.rodata.tan.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:20  \n"
	.section	.text.tan,"ax",@progbits
	.align	2
	.globl	tan
	.hidden	tan
	.type	tan, @function
tan:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L28:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L28
	lla	s0,.LC1
	li	a0,65
.L29:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L29
	lla	s0,.LC5
	li	a0,32
.L30:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L30
	li	a0,1
	call	halt
	.size	tan, .-tan
	.section	.rodata.sqrt.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:23  \n"
	.section	.text.sqrt,"ax",@progbits
	.align	2
	.globl	sqrt
	.hidden	sqrt
	.type	sqrt, @function
sqrt:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L36:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L36
	lla	s0,.LC1
	li	a0,65
.L37:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L37
	lla	s0,.LC6
	li	a0,32
.L38:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L38
	li	a0,1
	call	halt
	.size	sqrt, .-sqrt
	.section	.rodata.sin.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:26  \n"
	.section	.text.sin,"ax",@progbits
	.align	2
	.globl	sin
	.hidden	sin
	.type	sin, @function
sin:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L44:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L44
	lla	s0,.LC1
	li	a0,65
.L45:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L45
	lla	s0,.LC7
	li	a0,32
.L46:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L46
	li	a0,1
	call	halt
	.size	sin, .-sin
	.section	.rodata.log2.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:29  \n"
	.section	.text.log2,"ax",@progbits
	.align	2
	.globl	log2
	.hidden	log2
	.type	log2, @function
log2:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L52:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L52
	lla	s0,.LC1
	li	a0,65
.L53:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L53
	lla	s0,.LC8
	li	a0,32
.L54:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L54
	li	a0,1
	call	halt
	.size	log2, .-log2
	.section	.rodata.log10.str1.4,"aMS",@progbits,1
	.align	2
.LC9:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:32  \n"
	.section	.text.log10,"ax",@progbits
	.align	2
	.globl	log10
	.hidden	log10
	.type	log10, @function
log10:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L60:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L60
	lla	s0,.LC1
	li	a0,65
.L61:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L61
	lla	s0,.LC9
	li	a0,32
.L62:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L62
	li	a0,1
	call	halt
	.size	log10, .-log10
	.section	.rodata.log.str1.4,"aMS",@progbits,1
	.align	2
.LC10:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:35  \n"
	.section	.text.log,"ax",@progbits
	.align	2
	.globl	log
	.hidden	log
	.type	log, @function
log:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L68:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L68
	lla	s0,.LC1
	li	a0,65
.L69:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L69
	lla	s0,.LC10
	li	a0,32
.L70:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L70
	li	a0,1
	call	halt
	.size	log, .-log
	.section	.rodata.exp.str1.4,"aMS",@progbits,1
	.align	2
.LC11:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:38  \n"
	.section	.text.exp,"ax",@progbits
	.align	2
	.globl	exp
	.hidden	exp
	.type	exp, @function
exp:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L76:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L76
	lla	s0,.LC1
	li	a0,65
.L77:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L77
	lla	s0,.LC11
	li	a0,32
.L78:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L78
	li	a0,1
	call	halt
	.size	exp, .-exp
	.section	.rodata.cos.str1.4,"aMS",@progbits,1
	.align	2
.LC12:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:41  \n"
	.section	.text.cos,"ax",@progbits
	.align	2
	.globl	cos
	.hidden	cos
	.type	cos, @function
cos:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L84:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L84
	lla	s0,.LC1
	li	a0,65
.L85:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L85
	lla	s0,.LC12
	li	a0,32
.L86:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L86
	li	a0,1
	call	halt
	.size	cos, .-cos
	.section	.rodata.atan2.str1.4,"aMS",@progbits,1
	.align	2
.LC13:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:44  \n"
	.section	.text.atan2,"ax",@progbits
	.align	2
	.globl	atan2
	.hidden	atan2
	.type	atan2, @function
atan2:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L92:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L92
	lla	s0,.LC1
	li	a0,65
.L93:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L93
	lla	s0,.LC13
	li	a0,32
.L94:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L94
	li	a0,1
	call	halt
	.size	atan2, .-atan2
	.section	.rodata.asin.str1.4,"aMS",@progbits,1
	.align	2
.LC14:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:47  \n"
	.section	.text.asin,"ax",@progbits
	.align	2
	.globl	asin
	.hidden	asin
	.type	asin, @function
asin:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L100:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L100
	lla	s0,.LC1
	li	a0,65
.L101:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L101
	lla	s0,.LC14
	li	a0,32
.L102:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L102
	li	a0,1
	call	halt
	.size	asin, .-asin
	.section	.rodata.acos.str1.4,"aMS",@progbits,1
	.align	2
.LC15:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:50  \n"
	.section	.text.acos,"ax",@progbits
	.align	2
	.globl	acos
	.hidden	acos
	.type	acos, @function
acos:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L108:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L108
	lla	s0,.LC1
	li	a0,65
.L109:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L109
	lla	s0,.LC15
	li	a0,32
.L110:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L110
	li	a0,1
	call	halt
	.size	acos, .-acos
	.section	.text.ceil,"ax",@progbits
	.align	2
	.globl	ceil
	.hidden	ceil
	.type	ceil, @function
ceil:
	ret
	.size	ceil, .-ceil
	.section	.rodata.fabs.str1.4,"aMS",@progbits,1
	.align	2
.LC16:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:56  \n"
	.section	.text.fabs,"ax",@progbits
	.align	2
	.globl	fabs
	.hidden	fabs
	.type	fabs, @function
fabs:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L117:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L117
	lla	s0,.LC1
	li	a0,65
.L118:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L118
	lla	s0,.LC16
	li	a0,32
.L119:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L119
	li	a0,1
	call	halt
	.size	fabs, .-fabs
	.section	.rodata.ldexp.str1.4,"aMS",@progbits,1
	.align	2
.LC17:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:59  \n"
	.section	.text.ldexp,"ax",@progbits
	.align	2
	.globl	ldexp
	.hidden	ldexp
	.type	ldexp, @function
ldexp:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L125:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L125
	lla	s0,.LC1
	li	a0,65
.L126:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L126
	lla	s0,.LC17
	li	a0,32
.L127:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L127
	li	a0,1
	call	halt
	.size	ldexp, .-ldexp
	.section	.rodata.nan.str1.4,"aMS",@progbits,1
	.align	2
.LC18:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:62  \n"
	.section	.text.nan,"ax",@progbits
	.align	2
	.globl	nan
	.hidden	nan
	.type	nan, @function
nan:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L133:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L133
	lla	s0,.LC1
	li	a0,65
.L134:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L134
	lla	s0,.LC18
	li	a0,32
.L135:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L135
	li	a0,1
	call	halt
	.size	nan, .-nan
	.section	.text.strpbrk,"ax",@progbits
	.align	2
	.globl	strpbrk
	.hidden	strpbrk
	.type	strpbrk, @function
strpbrk:
	lbu	a3,0(a0)
	beq	a3,zero,.L146
	lbu	a2,0(a1)
.L142:
	mv	a5,a1
	mv	a4,a2
	bne	a2,zero,.L143
	j	.L144
.L150:
	lbu	a4,0(a5)
	beq	a4,zero,.L144
.L143:
	addi	a5,a5,1
	bne	a4,a3,.L150
	ret
.L144:
	lbu	a3,1(a0)
	addi	a0,a0,1
	bne	a3,zero,.L142
.L146:
	li	a0,0
	ret
	.size	strpbrk, .-strpbrk
	.section	.text.strcoll,"ax",@progbits
	.align	2
	.globl	strcoll
	.hidden	strcoll
	.type	strcoll, @function
strcoll:
	tail	strcmp
	.size	strcoll, .-strcoll
	.section	.rodata.tmpfile.str1.4,"aMS",@progbits,1
	.align	2
.LC19:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:82  \n"
	.section	.text.tmpfile,"ax",@progbits
	.align	2
	.globl	tmpfile
	.hidden	tmpfile
	.type	tmpfile, @function
tmpfile:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L153:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L153
	lla	s0,.LC1
	li	a0,65
.L154:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L154
	lla	s0,.LC19
	li	a0,32
.L155:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L155
	li	a0,1
	call	halt
	.size	tmpfile, .-tmpfile
	.section	.text.strspn,"ax",@progbits
	.align	2
	.globl	strspn
	.hidden	strspn
	.type	strspn, @function
strspn:
	li	a0,0
	ret
	.size	strspn, .-strspn
	.section	.rodata.ungetc.str1.4,"aMS",@progbits,1
	.align	2
.LC20:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:90  \n"
	.section	.text.ungetc,"ax",@progbits
	.align	2
	.globl	ungetc
	.hidden	ungetc
	.type	ungetc, @function
ungetc:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L162:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L162
	lla	s0,.LC1
	li	a0,65
.L163:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L163
	lla	s0,.LC20
	li	a0,32
.L164:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L164
	li	a0,1
	call	halt
	.size	ungetc, .-ungetc
	.section	.rodata.setvbuf.str1.4,"aMS",@progbits,1
	.align	2
.LC21:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:94  \n"
	.section	.text.setvbuf,"ax",@progbits
	.align	2
	.globl	setvbuf
	.hidden	setvbuf
	.type	setvbuf, @function
setvbuf:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L170:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L170
	lla	s0,.LC1
	li	a0,65
.L171:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L171
	lla	s0,.LC21
	li	a0,32
.L172:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L172
	li	a0,1
	call	halt
	.size	setvbuf, .-setvbuf
	.section	.text.signal,"ax",@progbits
	.align	2
	.globl	signal
	.hidden	signal
	.type	signal, @function
signal:
	li	a0,0
	ret
	.size	signal, .-signal
	.section	.text.fgets,"ax",@progbits
	.align	2
	.globl	fgets
	.hidden	fgets
	.type	fgets, @function
fgets:
	li	a0,0
	ret
	.size	fgets, .-fgets
	.section	.text.memchr,"ax",@progbits
	.align	2
	.globl	memchr
	.hidden	memchr
	.type	memchr, @function
memchr:
	beq	a2,zero,.L182
	mv	a5,a0
	andi	a1,a1,0xff
	add	a2,a0,a2
	j	.L181
.L184:
	beq	a5,a2,.L182
.L181:
	lbu	a4,0(a5)
	mv	a0,a5
	addi	a5,a5,1
	bne	a4,a1,.L184
	ret
.L182:
	li	a0,0
	ret
	.size	memchr, .-memchr
	.section	.rodata.longjmp.str1.4,"aMS",@progbits,1
	.align	2
.LC22:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:117  \n"
	.section	.text.longjmp,"ax",@progbits
	.align	2
	.globl	longjmp
	.hidden	longjmp
	.type	longjmp, @function
longjmp:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L186:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L186
	lla	s0,.LC1
	li	a0,65
.L187:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L187
	lla	s0,.LC22
	li	a0,32
.L188:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L188
	li	a0,1
	call	halt
	.size	longjmp, .-longjmp
	.section	.text._setjmp,"ax",@progbits
	.align	2
	.globl	_setjmp
	.hidden	_setjmp
	.type	_setjmp, @function
_setjmp:
	li	a0,0
	ret
	.size	_setjmp, .-_setjmp
	.section	.rodata.abort.str1.4,"aMS",@progbits,1
	.align	2
.LC23:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:125  \n"
	.section	.text.abort,"ax",@progbits
	.align	2
	.globl	abort
	.hidden	abort
	.type	abort, @function
abort:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L195:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L195
	lla	s0,.LC1
	li	a0,65
.L196:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L196
	lla	s0,.LC23
	li	a0,32
.L197:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L197
	li	a0,1
	call	halt
	.size	abort, .-abort
	.section	.text.fopen64,"ax",@progbits
	.align	2
	.globl	fopen64
	.hidden	fopen64
	.type	fopen64, @function
fopen64:
	tail	fopen
	.size	fopen64, .-fopen64
	.section	.rodata.freopen.str1.4,"aMS",@progbits,1
	.align	2
.LC24:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:133  \n"
	.section	.text.freopen,"ax",@progbits
	.align	2
	.globl	freopen
	.hidden	freopen
	.type	freopen, @function
freopen:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L204:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L204
	lla	s0,.LC1
	li	a0,65
.L205:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L205
	lla	s0,.LC24
	li	a0,32
.L206:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L206
	li	a0,1
	call	halt
	.size	freopen, .-freopen
	.section	.rodata.freopen64.str1.4,"aMS",@progbits,1
	.align	2
.LC25:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:137  \n"
	.section	.text.freopen64,"ax",@progbits
	.align	2
	.globl	freopen64
	.hidden	freopen64
	.type	freopen64, @function
freopen64:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L212:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L212
	lla	s0,.LC1
	li	a0,65
.L213:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L213
	lla	s0,.LC25
	li	a0,32
.L214:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L214
	li	a0,1
	call	halt
	.size	freopen64, .-freopen64
	.section	.text.strstr,"ax",@progbits
	.align	2
	.globl	strstr
	.hidden	strstr
	.type	strstr, @function
strstr:
	li	a0,0
	ret
	.size	strstr, .-strstr
	.section	.rodata.setlocale.str1.4,"aMS",@progbits,1
	.align	2
.LC26:
	.string	""
	.section	.text.setlocale,"ax",@progbits
	.align	2
	.globl	setlocale
	.hidden	setlocale
	.type	setlocale, @function
setlocale:
	lla	a0,.LC26
	ret
	.size	setlocale, .-setlocale
	.section	.rodata.rename.str1.4,"aMS",@progbits,1
	.align	2
.LC27:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:149  \n"
	.section	.text.rename,"ax",@progbits
	.align	2
	.globl	rename
	.hidden	rename
	.type	rename, @function
rename:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L222:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L222
	lla	s0,.LC1
	li	a0,65
.L223:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L223
	lla	s0,.LC27
	li	a0,32
.L224:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L224
	li	a0,1
	call	halt
	.size	rename, .-rename
	.section	.rodata.remove.str1.4,"aMS",@progbits,1
	.align	2
.LC28:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:153  \n"
	.section	.text.remove,"ax",@progbits
	.align	2
	.globl	remove
	.hidden	remove
	.type	remove, @function
remove:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L230:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L230
	lla	s0,.LC1
	li	a0,65
.L231:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L231
	lla	s0,.LC28
	li	a0,32
.L232:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L232
	li	a0,1
	call	halt
	.size	remove, .-remove
	.section	.rodata.system.str1.4,"aMS",@progbits,1
	.align	2
.LC29:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:157  \n"
	.section	.text.system,"ax",@progbits
	.align	2
	.globl	system
	.hidden	system
	.type	system, @function
system:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L238:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L238
	lla	s0,.LC1
	li	a0,65
.L239:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L239
	lla	s0,.LC29
	li	a0,32
.L240:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L240
	li	a0,1
	call	halt
	.size	system, .-system
	.section	.rodata.clock.str1.4,"aMS",@progbits,1
	.align	2
.LC30:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:161  \n"
	.section	.text.clock,"ax",@progbits
	.align	2
	.globl	clock
	.hidden	clock
	.type	clock, @function
clock:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L246:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L246
	lla	s0,.LC1
	li	a0,65
.L247:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L247
	lla	s0,.LC30
	li	a0,32
.L248:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L248
	li	a0,1
	call	halt
	.size	clock, .-clock
	.section	.rodata.tmpnam.str1.4,"aMS",@progbits,1
	.align	2
.LC31:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:165  \n"
	.section	.text.tmpnam,"ax",@progbits
	.align	2
	.globl	tmpnam
	.hidden	tmpnam
	.type	tmpnam, @function
tmpnam:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L254:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L254
	lla	s0,.LC1
	li	a0,65
.L255:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L255
	lla	s0,.LC31
	li	a0,32
.L256:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L256
	li	a0,1
	call	halt
	.size	tmpnam, .-tmpnam
	.section	.rodata.mktime.str1.4,"aMS",@progbits,1
	.align	2
.LC32:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:169  \n"
	.section	.text.mktime,"ax",@progbits
	.align	2
	.globl	mktime
	.hidden	mktime
	.type	mktime, @function
mktime:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L262:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L262
	lla	s0,.LC1
	li	a0,65
.L263:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L263
	lla	s0,.LC32
	li	a0,32
.L264:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L264
	li	a0,1
	call	halt
	.size	mktime, .-mktime
	.section	.text.time,"ax",@progbits
	.align	2
	.globl	time
	.hidden	time
	.type	time, @function
time:
	li	a0,0
	li	a1,0
	ret
	.size	time, .-time
	.section	.rodata.localtime.str1.4,"aMS",@progbits,1
	.align	2
.LC33:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:177  \n"
	.section	.text.localtime,"ax",@progbits
	.align	2
	.globl	localtime
	.hidden	localtime
	.type	localtime, @function
localtime:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L271:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L271
	lla	s0,.LC1
	li	a0,65
.L272:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L272
	lla	s0,.LC33
	li	a0,32
.L273:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L273
	li	a0,1
	call	halt
	.size	localtime, .-localtime
	.section	.rodata.strftime.str1.4,"aMS",@progbits,1
	.align	2
.LC34:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:181  \n"
	.section	.text.strftime,"ax",@progbits
	.align	2
	.globl	strftime
	.hidden	strftime
	.type	strftime, @function
strftime:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L279:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L279
	lla	s0,.LC1
	li	a0,65
.L280:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L280
	lla	s0,.LC34
	li	a0,32
.L281:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L281
	li	a0,1
	call	halt
	.size	strftime, .-strftime
	.section	.rodata.gmtime.str1.4,"aMS",@progbits,1
	.align	2
.LC35:
	.string	" @ /home/ysyx/ysyx-workbench/archbench/bench/302.lua/src/unused.c:185  \n"
	.section	.text.gmtime,"ax",@progbits
	.align	2
	.globl	gmtime
	.hidden	gmtime
	.type	gmtime, @function
gmtime:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L287:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L287
	lla	s0,.LC1
	li	a0,65
.L288:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L288
	lla	s0,.LC35
	li	a0,32
.L289:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L289
	li	a0,1
	call	halt
	.size	gmtime, .-gmtime
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
