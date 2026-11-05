#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"drawing.cpp"
	.option nopic
	.text
	.section	.rodata._Z15DrawTextTransWHPhiS_hiii.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `width==256' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/fceux-am/src/drawing.cpp:121  \n"
	.section	.text._Z15DrawTextTransWHPhiS_hiii,"ax",@progbits
	.align	2
	.globl	_Z15DrawTextTransWHPhiS_hiii
	.hidden	_Z15DrawTextTransWHPhiS_hiii
	.type	_Z15DrawTextTransWHPhiS_hiii, @function
_Z15DrawTextTransWHPhiS_hiii:
	addi	sp,sp,-48
	mv	a5,a2
	mv	a4,a0
	sw	s0,40(sp)
	li	a2,16384
	mv	s0,a1
	lla	a0,target
	li	a1,0
	sw	s1,36(sp)
	sw	a5,12(sp)
	mv	s1,a5
	sw	ra,44(sp)
	sw	a4,28(sp)
	sw	a3,4(sp)
	call	memset
	li	a5,256
	bne	s0,a5,.L68
	lbu	a5,0(s1)
	lw	t2,48(sp)
	beq	a5,zero,.L99
	li	a2,2
	li	a4,2
	sw	a2,8(sp)
	lla	a2,target
	sw	t2,48(sp)
	sw	a4,32(sp)
	li	a3,0
	sw	a2,20(sp)
	li	s1,1
	li	s0,61
	mv	t2,a4
.L3:
	li	a4,10
	beq	a5,a4,.L100
	addi	a5,a5,-32
	li	a4,98
	bgtu	a5,a4,.L70
	slli	a5,a5,3
	lla	a3,.LANCHOR0
	addi	a4,a5,1
	add	a5,a3,a5
	lbu	a5,0(a5)
	sw	a4,24(sp)
	add	a4,a3,a4
	lbu	a1,0(a4)
	sw	a5,0(sp)
.L9:
	lw	a4,0(sp)
	lw	a5,8(sp)
	add	a5,a5,a4
	li	a4,255
	ble	a5,a4,.L10
	li	a5,2
	addi	t2,t2,8
	sw	a5,8(sp)
.L10:
	lw	a5,8(sp)
	slli	t0,t2,8
	li	a2,7
	add	t0,t0,a5
	lw	a5,20(sp)
	mv	a0,t2
	add	t0,a5,t0
	addi	a5,t2,7
	sw	a5,16(sp)
	lw	a5,0(sp)
	sub	a2,a2,a5
.L20:
	lw	a4,0(sp)
	mv	a3,t0
	li	a5,7
	li	t1,2
	bne	a4,zero,.L18
	j	.L19
.L102:
	bgt	a0,s0,.L101
	sb	t1,0(a3)
	addi	a5,a5,-1
	addi	a3,a3,1
	beq	a5,a2,.L19
.L18:
	sra	a4,a1,a5
	andi	a4,a4,1
	bne	a4,zero,.L102
	sb	s1,0(a3)
	addi	a5,a5,-1
	addi	a3,a3,1
	bne	a5,a2,.L18
.L19:
	lw	a5,16(sp)
	addi	a0,a0,1
	addi	t0,t0,256
	beq	a5,a0,.L103
	lw	a5,24(sp)
	lla	a4,.LANCHOR0
	sub	a5,a5,t2
	add	a5,a5,a0
	add	a5,a4,a5
	lbu	a1,0(a5)
	j	.L20
.L101:
	lw	a5,32(sp)
	lw	t2,48(sp)
	addi	a5,a5,2
	mv	a4,a5
	sw	a5,0(sp)
	li	a5,256
	bgt	a4,a5,.L104
.L16:
	li	a5,62
	sw	a5,24(sp)
.L4:
	lla	a5,target
	sw	a5,16(sp)
	li	a5,-1
	sw	a5,12(sp)
	li	s0,0
.L24:
	lw	a3,16(sp)
	lw	a5,12(sp)
	slli	a1,s0,8
	addi	a0,a3,256
	mv	a4,a3
	lw	a3,28(sp)
	slli	a5,a5,8
	sw	a0,16(sp)
	add	a1,a3,a1
	lw	a3,20(sp)
	li	a2,0
	add	a5,a3,a5
	sw	a5,8(sp)
.L56:
	lbu	t1,0(a4)
	mv	a3,a2
	addi	a2,a2,1
	slli	a5,t1,1
	add	a5,a5,t1
	slli	a5,a5,3
	add	a5,a5,t1
	slli	a5,a5,2
	ble	t2,zero,.L25
	beq	a3,zero,.L26
	lbu	t0,-1(a4)
	li	t1,255
	add	a5,a5,t0
	beq	a3,t1,.L27
.L26:
	lbu	t1,1(a4)
	add	a5,a5,t1
.L27:
	beq	s0,zero,.L29
	lbu	t1,-256(a4)
	add	a5,a5,t1
	li	t1,14
	bne	a5,zero,.L30
	bleu	s0,t1,.L29
.L35:
	li	t1,1
	li	a5,0
	beq	t2,t1,.L32
.L31:
	beq	a3,zero,.L36
	lbu	t0,-1(a4)
	li	s1,255
	slli	t1,t0,2
	add	t1,t1,t0
	slli	t1,t1,1
	add	a5,a5,t1
	beq	a3,s1,.L37
.L36:
	lbu	t0,1(a4)
	slli	t1,t0,2
	add	t1,t1,t0
	slli	t1,t1,1
	add	a5,a5,t1
.L37:
	beq	s0,zero,.L38
	lbu	t0,-256(a4)
	li	s1,14
	slli	t1,t0,2
	add	t1,t1,t0
	slli	t1,t1,1
	add	a5,a5,t1
	ble	s0,s1,.L105
	beq	a3,zero,.L65
.L62:
	lbu	t0,-257(a4)
	li	t1,255
	add	a5,a5,t0
	beq	a3,t1,.L106
	lw	t1,8(sp)
	add	t1,t1,a2
	lbu	t0,0(t1)
	li	t1,14
	add	a5,a5,t0
	bleu	s0,t1,.L66
	li	t1,1
	bleu	a3,t1,.L46
.L58:
	lbu	t1,-2(a4)
	add	a5,a5,t1
	li	t1,253
	bleu	a3,t1,.L46
	li	a3,1
	bleu	s0,a3,.L48
.L108:
	lbu	a3,-512(a4)
	add	a5,a5,a3
	li	a3,13
	bne	a5,zero,.L51
	ble	s0,a3,.L48
.L32:
	lw	a5,0(sp)
	addi	a4,a4,1
	addi	a1,a1,1
	addi	a0,a0,1
	bne	a2,a5,.L56
	lw	a5,12(sp)
	addi	s0,s0,1
	addi	a5,a5,1
	sw	a5,12(sp)
	lw	a5,24(sp)
	bne	s0,a5,.L24
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
.L51:
	bleu	s0,a3,.L48
.L25:
	li	a3,199
	ble	a5,a3,.L52
	lw	a5,4(sp)
	sb	a5,0(a1)
	j	.L32
.L52:
	li	a3,9
	ble	a5,a3,.L107
	lbu	a5,0(a1)
	li	a3,159
	bgtu	a5,a3,.L55
	li	a5,-63
	sb	a5,0(a1)
	j	.L32
.L29:
	lbu	t1,0(a0)
	add	a5,a5,t1
	beq	a5,zero,.L35
.L34:
	li	t1,1
	bne	t2,t1,.L31
	j	.L25
.L38:
	lbu	t0,0(a0)
	slli	t1,t0,2
	add	t1,t1,t0
	slli	t1,t1,1
	add	a5,a5,t1
	beq	a3,zero,.L60
.L66:
	lbu	t0,-1(a0)
	li	t1,255
	add	a5,a5,t0
	beq	a3,t1,.L58
.L60:
	lbu	t1,1(a0)
	add	a5,a5,t1
	li	t1,1
	bgtu	a3,t1,.L58
.L46:
	lbu	a3,2(a4)
	add	a5,a5,a3
.L109:
	li	a3,1
	bgtu	s0,a3,.L108
.L48:
	lbu	a3,512(a4)
	add	a5,a5,a3
	bne	a5,zero,.L25
	j	.L32
.L30:
	bgtu	s0,t1,.L34
	lbu	t1,0(a0)
	add	a5,a5,t1
	j	.L34
.L105:
	lbu	t0,0(a0)
	slli	t1,t0,2
	add	t1,t1,t0
	slli	t1,t1,1
	add	a5,a5,t1
	bne	a3,zero,.L62
	beq	s0,zero,.L60
.L65:
	lw	t1,8(sp)
	add	t1,t1,a2
	lbu	t1,0(t1)
	add	a5,a5,t1
	li	t1,14
	ble	s0,t1,.L60
	lbu	a3,2(a4)
	add	a5,a5,a3
	j	.L109
.L55:
	li	a5,-47
	sb	a5,0(a1)
	j	.L32
.L107:
	beq	a5,zero,.L32
	li	a5,-49
	sb	a5,0(a1)
	j	.L32
.L106:
	li	t1,14
	bgtu	s0,t1,.L58
	j	.L66
.L100:
	li	a5,2
	addi	t2,t2,8
	sw	a5,8(sp)
.L8:
	lw	a4,12(sp)
	lbu	a5,1(a4)
	addi	a4,a4,1
	sw	a4,12(sp)
	bne	a5,zero,.L3
	mv	a5,t2
	add	a5,a5,a3
	addi	a5,a5,2
	mv	a4,a5
	sw	a5,24(sp)
	li	a5,62
	lw	t2,48(sp)
	bgt	a4,a5,.L110
.L22:
	lw	a5,32(sp)
	addi	a5,a5,2
	mv	a4,a5
	sw	a5,0(sp)
	li	a5,256
	ble	a4,a5,.L4
	sw	a5,0(sp)
	j	.L4
.L70:
	li	a5,1
	sw	a5,24(sp)
	li	a5,6
	li	a1,0
	sw	a5,0(sp)
	j	.L9
.L104:
	sw	a5,0(sp)
	j	.L16
.L103:
	lw	a5,8(sp)
	lw	a4,0(sp)
	add	a5,a5,a4
	lw	a4,32(sp)
	sw	a5,8(sp)
	blt	a4,a5,.L111
	li	a3,7
	j	.L8
.L111:
	sw	a5,32(sp)
	li	a3,7
	j	.L8
.L99:
	li	a5,4
	sw	a5,0(sp)
	sw	a5,24(sp)
	lla	a5,target
	sw	a5,20(sp)
	j	.L4
.L110:
	sw	a5,24(sp)
	j	.L22
.L68:
	lla	s0,.LC0
	li	a0,65
.L2:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L2
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
	.size	_Z15DrawTextTransWHPhiS_hiii, .-_Z15DrawTextTransWHPhiS_hiii
	.section	.text._Z13DrawTextTransPhjS_h,"ax",@progbits
	.align	2
	.globl	_Z13DrawTextTransPhjS_h
	.hidden	_Z13DrawTextTransPhjS_h
	.type	_Z13DrawTextTransPhjS_h, @function
_Z13DrawTextTransPhjS_h:
	addi	sp,sp,-16
	li	a5,2
	sw	a5,0(sp)
	li	a4,256
	li	a5,16
	sw	ra,12(sp)
	call	_Z15DrawTextTransWHPhiS_hiii
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z13DrawTextTransPhjS_h, .-_Z13DrawTextTransPhjS_h
	.hidden	target
	.globl	target
	.section	.bss.target,"aw",@nobits
	.align	2
	.type	target, @object
	.size	target, 16384
target:
	.zero	16384
	.section	.rodata._ZL7Font6x7,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL7Font6x7, @object
	.size	_ZL7Font6x7, 792
_ZL7Font6x7:
	.string	"\006"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\003@@@@@"
	.string	"@\005PPP"
	.string	""
	.string	""
	.string	""
	.string	"\006PP\370P\370PP\006 x\240p(\360 \006@\250P P\250\020\006`\220\240@\250\220h\003@@"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\004 @@@@@ \004@     @\006"
	.string	"P \370 P"
	.string	"\006"
	.string	"  \370  "
	.string	"\003"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"@\200\005"
	.string	""
	.string	""
	.string	"\360"
	.string	""
	.string	""
	.string	"\003"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"@\005\020\020   @@\006p\210\210\210\210\210p\006 `     \006p\210\b0@\200\370\006p\210\b0\b\210p\006\0200P\220\370\020\020\006\370\200\200\360\b\b\360\0060@\200\360\210\210p\006\370\b\020\020   \006p\210\210p\210\210p\006p\210\210x\b\020`\003"
	.string	""
	.string	"@"
	.string	""
	.string	"@"
	.string	"\003"
	.string	""
	.string	"@"
	.string	""
	.string	"@\200\004"
	.string	" @\200@ "
	.string	"\005"
	.string	""
	.string	"\360"
	.string	"\360"
	.string	""
	.string	"\004"
	.string	"\200@ @\200"
	.string	"\006p\210\b\020 "
	.string	" \006p\210\210\270\260\200p\006p\210\210\370\210\210\210\006\360\210\210\360\210\210\360\006p\210\200\200\200\210p\006\340\220\210\210\210\220\340\006\370\200\200\360\200\200\370\006\370\200\200\360\200\200\200\006p\210\200\270\210\210x\006\210\210\210\370\210\210\210\004\340@@@@@\340\006\b\b\b\b\b\210p\006\210\220\240\300\240\220\210\006\200\200\200\200\200\200\370\006\210\330\250\250\210\210\210\006\210\210\310\250\230\210\210\0070H\204\204\204H0\006\360\210\210\360\200\200\200\006p\210\210\210\250\220h\006\360\210\210\360\220\210\210\006p\210\200p\b\210p\006\370      \006\210\210\210\210\210\210p\006\210\210\210PP  \006\210\210\210\210\250\250P\006\210\210P P\210\210\006\210\210P    \006\370\b\020 @\200\370\003\300\200\200\200\200\200\300\005@@   \020\020\003\300@@@@@\300\004@\240"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\006"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\370\003\200@"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\005"
	.string	""
	.string	"`\020p\220p\005\200\200\340\220\220\220\340\005"
	.string	""
	.string	"p\200\200\200p\005\020\020p\220\220\220p\005"
	.string	""
	.string	"`\220\360\200p\0050@\340@@@@\005"
	.string	"p\220\220p\020\340\005\200\200\340\220\220\220\220\002\200"
	.string	"\200\200\200\200\200\004 "
	.string	"    \300\005\200\200\220\240\300\240\220\002\200\200\200\200\200\200\200\006"
	.string	""
	.string	"\320\250\250\250\250\005"
	.string	""
	.string	"\340\220\220\220\220\005"
	.string	""
	.string	"`\220\220\220`\005"
	.string	""
	.string	"\340\220\220\340\200\005"
	.string	""
	.string	"p\220\220p\020\005"
	.string	""
	.string	"\260\300\200\200\200\005"
	.string	""
	.string	"p\200`\020\340\004@@\340@@@ \005"
	.string	""
	.string	"\220\220\220\220p\005"
	.string	""
	.string	"\220\220\220\240\300\006"
	.string	""
	.string	"\210\210\250\250P\005"
	.string	""
	.string	"\220\220`\220\220\005"
	.string	"\220\220\220p\020`\005"
	.string	""
	.string	"\360 @\200\360\004 @@\200@@ \003@@@@@@@\004\200@@ @@\200\006"
	.string	"h\260"
	.string	""
	.string	""
	.string	""
	.string	""
	.zero	31
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
