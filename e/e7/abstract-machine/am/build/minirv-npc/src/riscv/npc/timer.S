#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"timer.c"
	.option nopic
	.text
	.section	.text.__am_timer_init,"ax",@progbits
	.align	2
	.globl	__am_timer_init
	.hidden	__am_timer_init
	.type	__am_timer_init, @function
__am_timer_init:
	ret
	.size	__am_timer_init, .-__am_timer_init
	.globl	__udivdi3
	.section	.text.__am_timer_uptime,"ax",@progbits
	.align	2
	.globl	__am_timer_uptime
	.hidden	__am_timer_uptime
	.type	__am_timer_uptime, @function
__am_timer_uptime:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
.L4:
#APP
# 15 "/home/ysyx/ysyx-workbench/abstract-machine/am/src/riscv/npc/timer.c" 1
	csrr a1, mcycleh
# 0 "" 2
# 16 "/home/ysyx/ysyx-workbench/abstract-machine/am/src/riscv/npc/timer.c" 1
	csrr a0, mcycle
# 0 "" 2
# 17 "/home/ysyx/ysyx-workbench/abstract-machine/am/src/riscv/npc/timer.c" 1
	csrr a5, mcycleh
# 0 "" 2
#NO_APP
	bne	a1,a5,.L4
	li	a2,25
	li	a3,0
	call	__udivdi3
	lw	ra,8(sp)
	sw	a0,0(s0)
	sw	a1,4(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	__am_timer_uptime, .-__am_timer_uptime
	.section	.text.__am_timer_rtc,"ax",@progbits
	.align	2
	.globl	__am_timer_rtc
	.hidden	__am_timer_rtc
	.type	__am_timer_rtc, @function
__am_timer_rtc:
	li	a5,1900
	sw	zero,20(a0)
	sw	zero,16(a0)
	sw	zero,12(a0)
	sw	zero,8(a0)
	sw	zero,4(a0)
	sw	a5,0(a0)
	ret
	.size	__am_timer_rtc, .-__am_timer_rtc
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
