#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lbitlib.c"
	.option nopic
	.text
	.section	.rodata.luaopen_bit32.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"library 'bit32' has been deprecated"
	.section	.text.luaopen_bit32,"ax",@progbits
	.align	2
	.globl	luaopen_bit32
	.hidden	luaopen_bit32
	.type	luaopen_bit32, @function
luaopen_bit32:
	lla	a1,.LC0
	tail	luaL_error
	.size	luaopen_bit32, .-luaopen_bit32
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
