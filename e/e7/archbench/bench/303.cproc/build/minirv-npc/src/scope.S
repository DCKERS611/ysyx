#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"scope.c"
	.option nopic
	.text
	.section	.text.mkscope,"ax",@progbits
	.align	2
	.globl	mkscope
	.hidden	mkscope
	.type	mkscope, @function
mkscope:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	s0,a0
	li	a0,52
	sw	ra,8(sp)
	call	xmalloc
	lw	a1,32(s0)
	lw	a2,36(s0)
	lw	a3,40(s0)
	lw	a4,48(s0)
	lw	ra,8(sp)
	sw	s0,44(a0)
	lw	s0,4(sp)
	sw	zero,16(a0)
	sw	zero,0(a0)
	sw	a1,32(a0)
	sw	a2,36(a0)
	sw	a3,40(a0)
	sw	a4,48(a0)
	addi	sp,sp,12
	jr	ra
	.size	mkscope, .-mkscope
	.section	.text.delscope,"ax",@progbits
	.align	2
	.globl	delscope
	.hidden	delscope
	.type	delscope, @function
delscope:
	lw	a5,16(a0)
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	lw	s1,44(a0)
	mv	s0,a0
	bne	a5,zero,.L14
	lw	a5,0(s0)
	bne	a5,zero,.L15
.L6:
	mv	a0,s0
	call	free
	lw	ra,8(sp)
	lw	s0,4(sp)
	mv	a0,s1
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L14:
	li	a1,0
	addi	a0,a0,16
	call	mapfree
	lw	a5,0(s0)
	beq	a5,zero,.L6
.L15:
	li	a1,0
	mv	a0,s0
	call	mapfree
	j	.L6
	.size	delscope, .-delscope
	.section	.text.scopegetdecl,"ax",@progbits
	.align	2
	.globl	scopegetdecl
	.hidden	scopegetdecl
	.type	scopegetdecl, @function
scopegetdecl:
	addi	sp,sp,-28
	sw	s0,20(sp)
	mv	s0,a0
	mv	a0,a1
	sw	s1,16(sp)
	sw	a1,0(sp)
	mv	s1,a2
	sw	ra,24(sp)
	call	strlen
	lw	a1,0(sp)
	mv	a2,a0
	addi	a0,sp,4
	call	mapkey
.L20:
	lw	a5,16(s0)
	bne	a5,zero,.L17
	lw	s0,44(s0)
.L18:
	beq	s0,zero,.L21
	bne	s1,zero,.L20
.L21:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	li	a0,0
	addi	sp,sp,28
	jr	ra
.L17:
	addi	a0,s0,16
	addi	a1,sp,4
	call	mapget
	lw	s0,44(s0)
	beq	a0,zero,.L18
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
	.size	scopegetdecl, .-scopegetdecl
	.section	.text.scopegettag,"ax",@progbits
	.align	2
	.globl	scopegettag
	.hidden	scopegettag
	.type	scopegettag, @function
scopegettag:
	addi	sp,sp,-28
	sw	s0,20(sp)
	mv	s0,a0
	mv	a0,a1
	sw	s1,16(sp)
	sw	a1,0(sp)
	mv	s1,a2
	sw	ra,24(sp)
	call	strlen
	lw	a1,0(sp)
	mv	a2,a0
	addi	a0,sp,4
	call	mapkey
.L29:
	lw	a5,0(s0)
	bne	a5,zero,.L26
	lw	s0,44(s0)
.L27:
	beq	s0,zero,.L30
	bne	s1,zero,.L29
.L30:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	li	a0,0
	addi	sp,sp,28
	jr	ra
.L26:
	mv	a0,s0
	addi	a1,sp,4
	call	mapget
	lw	s0,44(s0)
	beq	a0,zero,.L27
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
	.size	scopegettag, .-scopegettag
	.section	.text.scopeputdecl,"ax",@progbits
	.align	2
	.globl	scopeputdecl
	.hidden	scopeputdecl
	.type	scopeputdecl, @function
scopeputdecl:
	lw	a5,16(a0)
	addi	sp,sp,-28
	sw	s0,20(sp)
	sw	s1,16(sp)
	sw	ra,24(sp)
	mv	s1,a1
	addi	s0,a0,16
	beq	a5,zero,.L37
.L35:
	lw	a1,0(s1)
	mv	a0,a1
	sw	a1,0(sp)
	call	strlen
	lw	a1,0(sp)
	mv	a2,a0
	addi	a0,sp,4
	call	mapkey
	addi	a1,sp,4
	mv	a0,s0
	call	mapput
	lw	ra,24(sp)
	lw	s0,20(sp)
	sw	s1,0(a0)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L37:
	li	a1,32
	mv	a0,s0
	call	mapinit
	j	.L35
	.size	scopeputdecl, .-scopeputdecl
	.section	.rodata.scopeinit.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"__builtin_va_list"
	.section	.text.scopeinit,"ax",@progbits
	.align	2
	.globl	scopeinit
	.hidden	scopeinit
	.type	scopeinit, @function
scopeinit:
	addi	sp,sp,-12
	li	a2,52
	li	a1,0
	lla	a0,.LANCHOR1
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	lla	s0,.LANCHOR0
	call	memset
	lla	s1,.LANCHOR1
.L39:
	mv	a1,s0
	mv	a0,s1
	call	scopeputdecl
	addi	s0,s0,48
	lla	a5,.LANCHOR0+480
	bne	s0,a5,.L39
	la a5, targ; lw a5, 0(a5);
	lw	a5,4(a5)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a1,.LANCHOR2
	lla	a4,.LC0
	sw	a4,0(a1)
	sw	a5,12(a1)
	la a4, .LANCHOR2+4; sw zero, 0(a4);
	lla	a0,.LANCHOR1
	addi	sp,sp,12
	tail	scopeputdecl
	.size	scopeinit, .-scopeinit
	.section	.text.scopeputtag,"ax",@progbits
	.align	2
	.globl	scopeputtag
	.hidden	scopeputtag
	.type	scopeputtag, @function
scopeputtag:
	lw	a4,0(a0)
	addi	sp,sp,-28
	sw	s0,20(sp)
	sw	s1,16(sp)
	sw	ra,24(sp)
	sw	a2,0(sp)
	mv	s0,a0
	mv	s1,a1
	beq	a4,zero,.L45
.L43:
	mv	a0,s1
	call	strlen
	mv	a2,a0
	mv	a1,s1
	addi	a0,sp,4
	call	mapkey
	addi	a1,sp,4
	mv	a0,s0
	call	mapput
	lw	a5,0(sp)
	lw	ra,24(sp)
	lw	s0,20(sp)
	sw	a5,0(a0)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
.L45:
	li	a1,32
	call	mapinit
	j	.L43
	.size	scopeputtag, .-scopeputtag
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"__builtin_alloca"
	.align	2
.LC2:
	.string	"__builtin_constant_p"
	.align	2
.LC3:
	.string	"__builtin_expect"
	.align	2
.LC4:
	.string	"__builtin_offsetof"
	.align	2
.LC5:
	.string	"__builtin_types_compatible_p"
	.align	2
.LC6:
	.string	"__builtin_unreachable"
	.align	2
.LC7:
	.string	"__builtin_va_arg"
	.align	2
.LC8:
	.string	"__builtin_va_copy"
	.align	2
.LC9:
	.string	"__builtin_va_end"
	.align	2
.LC10:
	.string	"__builtin_va_start"
	.hidden	filescope
	.globl	filescope
	.section	.bss.filescope,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	filescope, @object
	.size	filescope, 52
filescope:
	.zero	52
	.section	.bss.valist.0,"aw",@nobits
	.align	3
	.set	.LANCHOR2,. + 0
	.type	valist.0, @object
	.size	valist.0, 48
valist.0:
	.zero	48
	.section	.data.builtins.1,"aw"
	.align	3
	.set	.LANCHOR0,. + 0
	.type	builtins.1, @object
	.size	builtins.1, 480
builtins.1:
	.word	.LC1
	.word	4
	.zero	32
	.word	0
	.zero	4
	.word	.LC2
	.word	4
	.zero	32
	.word	1
	.zero	4
	.word	.LC3
	.word	4
	.zero	32
	.word	2
	.zero	4
	.word	.LC4
	.word	4
	.zero	32
	.word	3
	.zero	4
	.word	.LC5
	.word	4
	.zero	32
	.word	4
	.zero	4
	.word	.LC6
	.word	4
	.zero	32
	.word	5
	.zero	4
	.word	.LC7
	.word	4
	.zero	32
	.word	6
	.zero	4
	.word	.LC8
	.word	4
	.zero	32
	.word	7
	.zero	4
	.word	.LC9
	.word	4
	.zero	32
	.word	8
	.zero	4
	.word	.LC10
	.word	4
	.zero	32
	.word	10
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
