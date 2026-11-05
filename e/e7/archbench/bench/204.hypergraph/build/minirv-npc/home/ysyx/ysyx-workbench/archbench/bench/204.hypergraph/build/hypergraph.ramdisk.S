#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"hypergraph.ramdisk.c"
	.option nopic
	.text
#APP
	.section .rodata.disk, "a"
.global __am_input_train_hp9
__am_input_train_hp9:
.incbin "input/train-hp9"
.byte 0

#NO_APP
	.hidden	__am_filelist
	.globl	__am_filelist
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"input/train-hp9"
	.section	.data.filelist,"aw"
	.align	2
	.type	filelist, @object
	.size	filelist, 24
filelist:
	.word	.LC0
	.word	__am_input_train_hp9
	.word	37374
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
