#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"cpp.c"
	.option nopic
	.text
	.section	.text.__dso_handle,"ax",@progbits
	.align	2
	.globl	__dso_handle
	.hidden	__dso_handle
	.type	__dso_handle, @function
__dso_handle:
	ret
	.size	__dso_handle, .-__dso_handle
	.section	.text.__cxa_guard_acquire,"ax",@progbits
	.align	2
	.globl	__cxa_guard_acquire
	.hidden	__cxa_guard_acquire
	.type	__cxa_guard_acquire, @function
__cxa_guard_acquire:
	ret
	.size	__cxa_guard_acquire, .-__cxa_guard_acquire
	.section	.text.__cxa_guard_release,"ax",@progbits
	.align	2
	.globl	__cxa_guard_release
	.hidden	__cxa_guard_release
	.type	__cxa_guard_release, @function
__cxa_guard_release:
	ret
	.size	__cxa_guard_release, .-__cxa_guard_release
	.section	.rodata.__cxa_atexit.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `0' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/abstract-machine/klib/src/cpp.c:15  \n"
	.section	.text.__cxa_atexit,"ax",@progbits
	.align	2
	.globl	__cxa_atexit
	.hidden	__cxa_atexit
	.type	__cxa_atexit, @function
__cxa_atexit:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L6:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L6
	lla	s0,.LC1
	li	a0,65
.L7:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L7
	lla	s0,.LC2
	li	a0,32
.L8:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L8
	li	a0,1
	call	halt
	.size	__cxa_atexit, .-__cxa_atexit
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
