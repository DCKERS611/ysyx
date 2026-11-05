#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"attr.c"
	.option nopic
	.text
	.section	.text.strip,"ax",@progbits
	.align	2
	.type	strip, @function
strip:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	strlen
	li	a5,3
	bleu	a0,a5,.L2
	lbu	a5,0(s0)
	li	a4,95
	beq	a5,a4,.L5
.L2:
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L5:
	lbu	a4,1(s0)
	bne	a4,a5,.L2
	addi	a5,a0,-2
	add	a5,s0,a5
	lbu	a3,0(a5)
	bne	a3,a4,.L2
	add	a0,s0,a0
	lbu	a4,-1(a0)
	bne	a4,a3,.L2
	sb	zero,0(a5)
	addi	s0,s0,2
	j	.L2
	.size	strip, .-strip
	.section	.rodata.parseattr.part.0.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"gnu"
	.align	2
.LC1:
	.string	"after attribute prefix"
	.align	2
.LC2:
	.string	"aligned"
	.align	2
.LC3:
	.string	"invalid alignment %llu"
	.align	2
.LC4:
	.string	"after alignment"
	.align	2
.LC5:
	.string	"constructor"
	.align	2
.LC6:
	.string	"destructor"
	.align	2
.LC7:
	.string	"packed"
	.align	2
.LC8:
	.string	"GNU "
	.align	2
.LC9:
	.string	"%sattribute '%s' is not supported here"
	.section	.text.parseattr.part.0,"ax",@progbits
	.align	2
	.type	parseattr.part.0, @function
parseattr.part.0:
	addi	sp,sp,-24
	sw	s1,12(sp)
	lla	s1,tok
	mv	a4,a0
	lw	a0,20(s1)
	sw	s0,16(sp)
	sw	ra,20(sp)
	mv	s0,a2
	sw	a4,4(sp)
	sw	a1,8(sp)
	call	strip
	sw	a0,0(sp)
	call	next
	beq	s0,zero,.L59
	li	a4,2
	beq	s0,a4,.L60
.L8:
	li	a0,64
	call	consume
	beq	a0,zero,.L40
	li	s0,1
.L27:
	lw	a5,0(s1)
	li	a3,64
	li	a4,65
	beq	a5,a3,.L23
.L62:
	bne	a5,a4,.L61
	addi	s0,s0,-1
	call	next
	bne	s0,zero,.L27
.L40:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	li	a0,1
	addi	sp,sp,24
	jr	ra
.L61:
	call	next
	lw	a5,0(s1)
	li	a3,64
	li	a4,65
	bne	a5,a3,.L62
.L23:
	addi	s0,s0,1
	call	next
	j	.L27
.L59:
	li	a0,94
	call	consume
	beq	a0,zero,.L8
	lw	a0,0(sp)
	lla	a1,.LC0
	call	strcmp
	seqz	a5,a0
	lla	a1,.LC1
	li	a0,4
	slli	s0,a5,1
	call	expect
	call	strip
	sw	a0,0(sp)
	li	a4,2
	bne	s0,a4,.L8
.L60:
	lw	a0,0(sp)
	lla	a1,.LC2
	call	strcmp
	beq	a0,zero,.L63
	lw	a0,0(sp)
	lla	a1,.LC5
	call	strcmp
	beq	a0,zero,.L16
	lw	s0,0(sp)
	lla	a1,.LC6
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L64
	li	s0,4
.L16:
	lw	a5,8(sp)
	and	a4,s0,a5
	beq	a4,zero,.L19
.L20:
	lw	a5,4(sp)
	beq	a5,zero,.L40
.L18:
	lw	a3,4(sp)
	lw	ra,20(sp)
	lw	s1,12(sp)
	lw	a4,0(a3)
	li	a0,1
	or	a5,a4,s0
	lw	s0,16(sp)
	sw	a5,0(a3)
	addi	sp,sp,24
	jr	ra
.L63:
	li	a0,64
	call	consume
	bne	a0,zero,.L65
	lw	a5,8(sp)
	andi	s0,a5,1
	lw	a5,4(sp)
	beq	a5,zero,.L17
	li	a4,16
	sw	a4,4(a5)
	bne	s0,zero,.L18
.L28:
	li	s0,1
.L19:
	lw	a3,0(sp)
	lla	a2,.LC8
	lla	a1,.LC9
	lla	a0,tok+8
	call	error
	j	.L20
.L64:
	mv	a0,s0
	lla	a1,.LC7
	call	strcmp
	li	s0,8
	beq	a0,zero,.L16
	j	.L8
.L17:
	bne	s0,zero,.L40
	j	.L28
.L65:
	li	a1,0
	lla	a0,filescope
	call	intconstexpr
	seqz	a4,a0
	mv	s1,a0
	mv	a3,a1
	addi	a5,a0,-1
	bne	a1,a4,.L11
	li	a4,-2147483648
	xori	a4,a4,-2
	bgtu	a5,a4,.L11
	and	a5,a0,a5
	beq	a5,zero,.L13
.L11:
	mv	a2,s1
	lla	a1,.LC3
	lla	a0,tok+8
	call	error
.L13:
	lw	a5,4(sp)
	beq	a5,zero,.L15
	sw	s1,4(a5)
.L15:
	lla	a1,.LC4
	li	a0,65
	call	expect
	li	s0,1
	j	.L16
	.size	parseattr.part.0, .-parseattr.part.0
	.section	.rodata.attrspec.part.0.str1.4,"aMS",@progbits,1
	.align	2
.LC10:
	.string	"to end attribute specifier"
	.section	.text.attrspec.part.0,"ax",@progbits
	.align	2
	.type	attrspec.part.0, @function
attrspec.part.0:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	sw	a0,0(sp)
	sw	a1,4(sp)
	lla	s1,tok
	li	s0,4
.L67:
	lw	a5,0(s1)
	beq	a5,s0,.L68
.L71:
	li	a0,108
	call	consume
	bne	a0,zero,.L67
	lla	a1,.LC10
	li	a0,63
	call	expect
	lla	a1,.LC10
	li	a0,63
	call	expect
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	li	a0,1
	addi	sp,sp,20
	jr	ra
.L68:
	lw	a1,4(sp)
	lw	a0,0(sp)
	li	a2,0
	call	parseattr.part.0
	bne	a0,zero,.L67
	j	.L71
	.size	attrspec.part.0, .-attrspec.part.0
	.section	.rodata.gnuattrspec.part.0.str1.4,"aMS",@progbits,1
	.align	2
.LC11:
	.string	"after '__attribute__' to begin attribute specifier"
	.section	.text.gnuattrspec.part.0,"ax",@progbits
	.align	2
	.type	gnuattrspec.part.0, @function
gnuattrspec.part.0:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	sw	a0,0(sp)
	mv	s1,a1
	lla	s0,tok
.L75:
	lw	a5,0(s0)
	li	a4,4
	beq	a5,a4,.L76
.L79:
	li	a0,108
	call	consume
	bne	a0,zero,.L75
	lla	a1,.LC11
	li	a0,64
	call	expect
	lla	a1,.LC11
	li	a0,64
	call	expect
.L80:
	lw	a5,0(s0)
	li	a4,4
	beq	a5,a4,.L81
.L84:
	li	a0,108
	call	consume
	bne	a0,zero,.L80
	lla	a1,.LC10
	li	a0,65
	call	expect
	lla	a1,.LC10
	li	a0,65
	call	expect
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,1
	addi	sp,sp,16
	jr	ra
.L81:
	lw	a0,0(sp)
	li	a2,2
	mv	a1,s1
	call	parseattr.part.0
	bne	a0,zero,.L80
	j	.L84
.L76:
	lw	a0,0(sp)
	li	a2,2
	mv	a1,s1
	call	parseattr.part.0
	bne	a0,zero,.L75
	j	.L79
	.size	gnuattrspec.part.0, .-gnuattrspec.part.0
	.section	.text.attr,"ax",@progbits
	.align	2
	.globl	attr
	.hidden	attr
	.type	attr, @function
attr:
	addi	sp,sp,-24
	sw	s1,12(sp)
	lla	s1,tok
	lw	a3,0(s1)
	sw	ra,20(sp)
	sw	s0,16(sp)
	li	a5,62
	sw	a0,0(sp)
	sw	a1,4(sp)
	beq	a3,a5,.L105
.L89:
	sw	zero,8(sp)
.L91:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	a0,8(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L105:
	li	a0,62
	call	peek
	beq	a0,zero,.L89
	lw	a1,4(sp)
	lw	a0,0(sp)
	call	attrspec.part.0
	sw	a0,8(sp)
	beq	a0,zero,.L89
	li	s0,62
.L93:
	lw	a5,0(s1)
	bne	a5,s0,.L91
	li	a0,62
	call	peek
	mv	a5,a0
	lw	a1,4(sp)
	lw	a0,0(sp)
	beq	a5,zero,.L91
	call	attrspec.part.0
	bne	a0,zero,.L93
	j	.L91
	.size	attr, .-attr
	.section	.text.gnuattr,"ax",@progbits
	.align	2
	.globl	gnuattr
	.hidden	gnuattr
	.type	gnuattr, @function
gnuattr:
	addi	sp,sp,-16
	sw	s0,8(sp)
	mv	s0,a0
	li	a0,61
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s1,a1
	call	consume
	beq	a0,zero,.L107
	mv	a1,s1
	mv	a0,s0
	call	gnuattrspec.part.0
	sw	a0,0(sp)
	beq	a0,zero,.L107
.L110:
	li	a0,61
	call	consume
	mv	a5,a0
	mv	a1,s1
	mv	a0,s0
	beq	a5,zero,.L109
	call	gnuattrspec.part.0
	bne	a0,zero,.L110
.L109:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	a0,0(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L107:
	lw	ra,12(sp)
	lw	s0,8(sp)
	sw	zero,0(sp)
	lw	a0,0(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	gnuattr, .-gnuattr
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
