#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"cproc.ramdisk.c"
	.option nopic
	.text
#APP
	.section .rodata.disk, "a"
.global __am_input_train_Block_i
__am_input_train_Block_i:
.incbin "input/train-Block.i"
.byte 0

#NO_APP
	.hidden	__am_filelist
	.globl	__am_filelist
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"input/train-Block.i"
	.section	.data.filelist,"aw"
	.align	2
	.type	filelist, @object
	.size	filelist, 24
filelist:
	.word	.LC0
	.word	__am_input_train_Block_i
	.word	10930
	.word	0
	.word	0
	.word	0
	.section	.sdata.__am_filelist,"aw"
	.align	2
	.type	__am_filelist, @object
	.size	__am_filelist, 4
__am_filelist:
	.word	filelist
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
