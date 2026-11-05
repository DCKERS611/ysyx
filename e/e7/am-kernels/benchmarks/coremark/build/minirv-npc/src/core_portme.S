#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"core_portme.c"
	.option nopic
	.text
	.globl	__udivdi3
	.section	.text.start_time,"ax",@progbits
	.align	2
	.globl	start_time
	.hidden	start_time
	.type	start_time, @function
start_time:
	addi	sp,sp,-24
	sw	s0,16(sp)
	addi	s0,sp,7
	andi	s0,s0,-8
	mv	a1,s0
	li	a0,6
	sw	ra,20(sp)
	call	ioe_read
	lw	a0,0(s0)
	lw	a1,4(s0)
	li	a2,1000
	li	a3,0
	call	__udivdi3
	lw	ra,20(sp)
	lw	s0,16(sp)
	la a5, .LANCHOR0; sw a0, 0(a5);
	addi	sp,sp,24
	jr	ra
	.size	start_time, .-start_time
	.section	.text.stop_time,"ax",@progbits
	.align	2
	.globl	stop_time
	.hidden	stop_time
	.type	stop_time, @function
stop_time:
	addi	sp,sp,-24
	sw	s0,16(sp)
	addi	s0,sp,7
	andi	s0,s0,-8
	mv	a1,s0
	li	a0,6
	sw	ra,20(sp)
	call	ioe_read
	lw	a0,0(s0)
	lw	a1,4(s0)
	li	a2,1000
	li	a3,0
	call	__udivdi3
	lw	ra,20(sp)
	lw	s0,16(sp)
	la a5, .LANCHOR1; sw a0, 0(a5);
	addi	sp,sp,24
	jr	ra
	.size	stop_time, .-stop_time
	.section	.text.get_time,"ax",@progbits
	.align	2
	.globl	get_time
	.hidden	get_time
	.type	get_time, @function
get_time:
	la a0, .LANCHOR1; lw a0, 0(a0);
	la a5, .LANCHOR0; lw a5, 0(a5);
	sub	a0,a0,a5
	ret
	.size	get_time, .-get_time
	.section	.text.time_in_secs,"ax",@progbits
	.align	2
	.globl	time_in_secs
	.hidden	time_in_secs
	.type	time_in_secs, @function
time_in_secs:
	ret
	.size	time_in_secs, .-time_in_secs
	.section	.text.portable_init,"ax",@progbits
	.align	2
	.globl	portable_init
	.hidden	portable_init
	.type	portable_init, @function
portable_init:
	li	a5,1
	sb	a5,0(a0)
	ret
	.size	portable_init, .-portable_init
	.section	.text.portable_fini,"ax",@progbits
	.align	2
	.globl	portable_fini
	.hidden	portable_fini
	.type	portable_fini, @function
portable_fini:
	sb	zero,0(a0)
	ret
	.size	portable_fini, .-portable_fini
	.hidden	default_num_contexts
	.globl	default_num_contexts
	.hidden	stop_time_val
	.globl	stop_time_val
	.hidden	start_time_val
	.globl	start_time_val
	.hidden	seed5_volatile
	.globl	seed5_volatile
	.hidden	seed4_volatile
	.globl	seed4_volatile
	.hidden	seed3_volatile
	.globl	seed3_volatile
	.hidden	seed2_volatile
	.globl	seed2_volatile
	.hidden	seed1_volatile
	.globl	seed1_volatile
	.section	.sbss.seed1_volatile,"aw",@nobits
	.align	2
	.type	seed1_volatile, @object
	.size	seed1_volatile, 4
seed1_volatile:
	.zero	4
	.section	.sbss.seed2_volatile,"aw",@nobits
	.align	2
	.type	seed2_volatile, @object
	.size	seed2_volatile, 4
seed2_volatile:
	.zero	4
	.section	.sbss.seed5_volatile,"aw",@nobits
	.align	2
	.type	seed5_volatile, @object
	.size	seed5_volatile, 4
seed5_volatile:
	.zero	4
	.section	.sbss.start_time_val,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	start_time_val, @object
	.size	start_time_val, 4
start_time_val:
	.zero	4
	.section	.sbss.stop_time_val,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	stop_time_val, @object
	.size	stop_time_val, 4
stop_time_val:
	.zero	4
	.section	.sdata.default_num_contexts,"aw"
	.align	2
	.type	default_num_contexts, @object
	.size	default_num_contexts, 4
default_num_contexts:
	.word	1
	.section	.sdata.seed3_volatile,"aw"
	.align	2
	.type	seed3_volatile, @object
	.size	seed3_volatile, 4
seed3_volatile:
	.word	102
	.section	.sdata.seed4_volatile,"aw"
	.align	2
	.type	seed4_volatile, @object
	.size	seed4_volatile, 4
seed4_volatile:
	.word	2
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
