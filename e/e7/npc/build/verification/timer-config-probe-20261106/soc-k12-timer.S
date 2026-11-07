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
	.section	.text.__am_timer_uptime,"ax",@progbits
	.align	2
	.globl	__am_timer_uptime
	.hidden	__am_timer_uptime
	.type	__am_timer_uptime, @function
__am_timer_uptime:
.L4:
#APP
# 15 "/home/ysyx/ysyx-workbench/abstract-machine/am/src/riscv/npc/timer.c" 1
	csrr a4, mcycleh
# 0 "" 2
# 16 "/home/ysyx/ysyx-workbench/abstract-machine/am/src/riscv/npc/timer.c" 1
	csrr a5, mcycle
# 0 "" 2
# 17 "/home/ysyx/ysyx-workbench/abstract-machine/am/src/riscv/npc/timer.c" 1
	csrr a3, mcycleh
# 0 "" 2
#NO_APP
	bne	a4,a3,.L4
	slli	a3,a5,3
	srli	t1,a5,29
	slli	a2,a4,3
	add	a1,a3,a5
	or	a2,t1,a2
	add	a2,a2,a4
	sltu	a3,a1,a3
	add	a3,a3,a2
	srli	t1,a1,29
	slli	a2,a1,3
	slli	a3,a3,3
	add	a1,a2,a5
	or	a3,t1,a3
	add	a3,a3,a4
	sltu	a2,a1,a2
	add	a2,a2,a3
	slli	a2,a2,4
	slli	a3,a1,4
	srli	a1,a1,28
	add	a5,a3,a5
	or	a2,a1,a2
	sltu	a3,a5,a3
	add	a2,a2,a4
	add	a4,a3,a2
	slli	a4,a4,3
	srli	a3,a5,29
	or	a4,a3,a4
	slli	a5,a5,3
	slli	a3,a4,16
	srli	a5,a5,16
	or	a5,a5,a3
	srli	a4,a4,16
	sw	a5,0(a0)
	sw	a4,4(a0)
	ret
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
