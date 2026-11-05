#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"emu2413.c"
	.option nopic
	.text
	.section	.text.setInstrument,"ax",@progbits
	.align	2
	.type	setInstrument, @function
setInstrument:
	addi	a5,a1,28
	slli	a5,a5,2
	add	a5,a0,a5
	sw	a2,12(a5)
	beq	a2,zero,.L2
	addi	a2,a2,-1
	slli	a2,a2,3
	lla	a5,.LANCHOR0
	add	a5,a5,a2
	lbu	a4,0(a5)
.L3:
	slli	a2,a1,1
	slli	a1,a1,6
	sub	a1,a1,a2
	slli	a1,a1,2
	add	a1,a0,a1
	srli	a4,a4,7
	sw	a4,212(a1)
	lbu	a4,0(a5)
	ori	a2,a2,1
	slli	a3,a2,5
	srli	a4,a4,6
	andi	a4,a4,1
	sw	a4,216(a1)
	lbu	a4,0(a5)
	sub	a3,a3,a2
	slli	a3,a3,2
	srli	a4,a4,5
	andi	a4,a4,1
	sw	a4,180(a1)
	lbu	a4,0(a5)
	add	a0,a0,a3
	srli	a4,a4,4
	andi	a4,a4,1
	sw	a4,204(a1)
	lbu	a4,0(a5)
	andi	a4,a4,15
	sw	a4,184(a1)
	lbu	a4,1(a5)
	srli	a4,a4,7
	sw	a4,212(a0)
	lbu	a4,1(a5)
	srli	a4,a4,6
	andi	a4,a4,1
	sw	a4,216(a0)
	lbu	a4,1(a5)
	srli	a4,a4,5
	andi	a4,a4,1
	sw	a4,180(a0)
	lbu	a4,1(a5)
	srli	a4,a4,4
	andi	a4,a4,1
	sw	a4,204(a0)
	lbu	a4,1(a5)
	andi	a4,a4,15
	sw	a4,184(a0)
	lbu	a4,2(a5)
	srli	a4,a4,6
	sw	a4,208(a1)
	lbu	a4,2(a5)
	andi	a4,a4,63
	sw	a4,172(a1)
	lbu	a4,3(a5)
	srli	a4,a4,6
	sw	a4,208(a0)
	lbu	a4,3(a5)
	srli	a4,a4,4
	andi	a4,a4,1
	sw	a4,220(a0)
	lbu	a4,3(a5)
	srli	a4,a4,3
	andi	a4,a4,1
	sw	a4,220(a1)
	lbu	a4,3(a5)
	andi	a4,a4,7
	sw	a4,176(a1)
	lbu	a4,4(a5)
	srli	a4,a4,4
	sw	a4,188(a1)
	lbu	a4,4(a5)
	andi	a4,a4,15
	sw	a4,192(a1)
	lbu	a4,5(a5)
	srli	a4,a4,4
	sw	a4,188(a0)
	lbu	a4,5(a5)
	andi	a4,a4,15
	sw	a4,192(a0)
	lbu	a4,6(a5)
	srli	a4,a4,4
	sw	a4,196(a1)
	lbu	a4,6(a5)
	andi	a4,a4,15
	sw	a4,200(a1)
	lbu	a4,7(a5)
	srli	a4,a4,4
	sw	a4,196(a0)
	lbu	a5,7(a5)
	andi	a5,a5,15
	sw	a5,200(a0)
	ret
.L2:
	lbu	a4,46(a0)
	addi	a5,a0,46
	j	.L3
	.size	setInstrument, .-setInstrument
	.section	.rodata.internal_refresh.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `0' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/fceux-am/src/boards/emu2413.c:534  \n"
	.section	.text.internal_refresh,"ax",@progbits
	.align	2
	.type	internal_refresh, @function
internal_refresh:
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
	.size	internal_refresh, .-internal_refresh
	.section	.text.OPLL_delete,"ax",@progbits
	.align	2
	.globl	OPLL_delete
	.hidden	OPLL_delete
	.type	OPLL_delete, @function
OPLL_delete:
	tail	free
	.size	OPLL_delete, .-OPLL_delete
	.section	.text.OPLL_forceRefresh,"ax",@progbits
	.align	2
	.globl	OPLL_forceRefresh
	.hidden	OPLL_forceRefresh
	.type	OPLL_forceRefresh, @function
OPLL_forceRefresh:
	beq	a0,zero,.L14
	addi	a5,a0,220
	lla	a3,.LANCHOR1
	addi	a0,a0,1708
.L16:
	lw	a4,0(a5)
	sw	zero,28(a5)
	sw	zero,56(a5)
	slli	a4,a4,2
	add	a4,a3,a4
	lw	a4,0(a4)
	sw	zero,52(a5)
	sw	zero,68(a5)
	sw	a4,20(a5)
	addi	a5,a5,124
	bne	a0,a5,.L16
.L14:
	ret
	.size	OPLL_forceRefresh, .-OPLL_forceRefresh
	.section	.text.OPLL_set_rate,"ax",@progbits
	.align	2
	.globl	OPLL_set_rate
	.hidden	OPLL_set_rate
	.type	OPLL_set_rate, @function
OPLL_set_rate:
	lw	a5,120(a0)
	addi	sp,sp,-12
	sw	ra,8(sp)
	beq	a5,zero,.L22
	li	a1,49152
	addi	a1,a1,564
.L22:
	la a5, .LANCHOR2; sw a1, 0(a5);
	call	internal_refresh
	.size	OPLL_set_rate, .-OPLL_set_rate
	.section	.text.OPLL_set_quality,"ax",@progbits
	.align	2
	.globl	OPLL_set_quality
	.hidden	OPLL_set_quality
	.type	OPLL_set_quality, @function
OPLL_set_quality:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	a1,120(a0)
	la a1, .LANCHOR2; lw a1, 0(a1);
	call	OPLL_set_rate
	.size	OPLL_set_quality, .-OPLL_set_quality
	.section	.text.OPLL_fillbuf,"ax",@progbits
	.align	2
	.globl	OPLL_fillbuf
	.hidden	OPLL_fillbuf
	.type	OPLL_fillbuf, @function
OPLL_fillbuf:
	addi	sp,sp,-32
	addi	a4,a0,180
	sw	a4,16(sp)
	addi	a4,a0,228
	sw	s0,28(sp)
	sw	s1,24(sp)
	sw	a2,4(sp)
	sw	a1,0(sp)
	sw	a3,8(sp)
	sw	a4,12(sp)
	ble	a2,zero,.L27
	li	a5,65536
	addi	a5,a5,-1
	li	t1,262144
	addi	t0,a0,1668
	sw	a5,20(sp)
	addi	t1,t1,-1
	li	a2,1
.L28:
	lw	a4,104(a0)
	lw	a5,112(a0)
	lw	a3,20(sp)
	sw	zero,116(a0)
	sw	zero,108(a0)
	and	a5,a5,a3
	and	a4,a4,a3
	sw	a5,112(a0)
	sw	a4,104(a0)
	lw	a5,16(sp)
	li	a1,3
	li	t2,127
	j	.L39
.L54:
	li	a3,2
	bne	a4,a3,.L51
	lw	s0,16(a5)
	lw	a4,104(a5)
	lw	a3,108(a5)
	slli	s0,s0,2
	lla	s1,.LANCHOR3
	add	s0,s1,s0
	lw	s0,0(s0)
	add	a3,a4,a3
	sw	a3,104(a5)
	srli	a4,a4,15
	bltu	a3,s0,.L34
	lw	a3,0(a5)
	sw	s0,104(a5)
	beq	a3,zero,.L52
	sw	a1,100(a5)
	sw	zero,108(a5)
.L34:
	lw	s0,92(a5)
	li	a3,255
	add	a4,a4,s0
	slli	a4,a4,1
	bleu	a4,a3,.L38
	li	a4,255
.L38:
	sw	a4,112(a5)
	addi	a5,a5,124
	beq	t0,a5,.L53
.L39:
	lw	a4,36(a5)
	lw	a3,64(a5)
	bne	a4,zero,.L29
	lw	a4,68(a5)
	add	a3,a3,a4
.L29:
	and	a3,a3,t1
	lw	a4,100(a5)
	srli	s0,a3,9
	sw	a3,64(a5)
	sw	s0,72(a5)
	beq	a4,a1,.L30
	bgt	a4,a1,.L31
	bne	a4,a2,.L54
	lw	a4,104(a5)
	lw	a3,108(a5)
	add	a4,a4,a3
	li	a3,4194304
	sw	a4,104(a5)
	and	a4,a4,a3
	bne	a4,zero,.L36
	lw	s0,8(a5)
	li	a3,15
	bne	s0,a3,.L34
.L36:
	li	a4,2
	sw	a4,100(a5)
	sw	zero,104(a5)
	sw	zero,108(a5)
	li	a4,0
	j	.L34
.L31:
	addi	a3,a4,-4
	li	a4,127
	bgtu	a3,a2,.L34
	lw	s0,104(a5)
	lw	a3,108(a5)
	srli	a4,s0,15
	add	a3,a3,s0
	sw	a3,104(a5)
	bleu	a4,t2,.L34
	li	a4,6
	sw	a4,100(a5)
.L51:
	li	a4,127
	j	.L34
.L30:
	lw	a4,104(a5)
	lw	a3,0(a5)
	srli	a4,a4,15
	bne	a3,zero,.L34
.L52:
	li	a3,4
	sw	a3,100(a5)
	sw	zero,108(a5)
	j	.L34
.L53:
	lw	t2,1660(a0)
	lw	a3,12(sp)
	li	a1,0
	li	a4,0
.L41:
	slli	s0,a4,1
	ori	s0,s0,1
	slli	a5,s0,5
	sub	a5,a5,s0
	sll	s0,a2,a4
	slli	a5,a5,2
	and	s0,s0,t2
	add	a5,a0,a5
	addi	a4,a4,1
	bne	s0,zero,.L40
	lw	s0,280(a5)
	li	s1,6
	beq	s0,s1,.L40
	lw	s0,4(a3)
	sw	zero,4(a3)
	srai	s1,s0,1
	sw	s1,0(a3)
	sw	s0,8(a3)
	lw	s0,232(a5)
	sw	zero,232(a5)
	srai	s1,s0,1
	sw	s0,236(a5)
	add	a1,a1,s1
.L40:
	li	a5,6
	addi	a3,a3,248
	bne	a4,a5,.L41
	slli	a1,a1,16
	lw	a3,0(sp)
	li	a5,32768
	srai	a1,a1,16
	add	a1,a1,a5
	lw	a5,8(sp)
	lw	a4,0(a3)
	sll	a1,a1,a5
	lw	a5,4(sp)
	add	a4,a4,a1
	sw	a4,0(a3)
	addi	a5,a5,-1
	addi	a4,a3,4
	sw	a5,4(sp)
	sw	a4,0(sp)
	bne	a5,zero,.L28
.L27:
	lw	s0,28(sp)
	lw	s1,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	OPLL_fillbuf, .-OPLL_fillbuf
	.section	.text.OPLL_setMask,"ax",@progbits
	.align	2
	.globl	OPLL_setMask
	.hidden	OPLL_setMask
	.type	OPLL_setMask, @function
OPLL_setMask:
	mv	a5,a0
	beq	a0,zero,.L57
	lw	a0,1660(a0)
	sw	a1,1660(a5)
	ret
.L57:
	li	a0,0
	ret
	.size	OPLL_setMask, .-OPLL_setMask
	.section	.text.OPLL_toggleMask,"ax",@progbits
	.align	2
	.globl	OPLL_toggleMask
	.hidden	OPLL_toggleMask
	.type	OPLL_toggleMask, @function
OPLL_toggleMask:
	mv	a5,a0
	beq	a0,zero,.L60
	lw	a0,1660(a0)
	xor	a1,a0,a1
	sw	a1,1660(a5)
	ret
.L60:
	li	a0,0
	ret
	.size	OPLL_toggleMask, .-OPLL_toggleMask
	.section	.text.OPLL_writeReg,"ax",@progbits
	.align	2
	.globl	OPLL_writeReg
	.hidden	OPLL_writeReg
	.type	OPLL_writeReg, @function
OPLL_writeReg:
	andi	a1,a1,63
	li	a5,53
	bgtu	a1,a5,.L117
	lla	a4,.L64
	slli	a5,a1,2
	add	a5,a5,a4
	lw	a5,0(a5)
	addi	sp,sp,-20
	sw	s0,12(sp)
	add	a5,a5,a4
	sw	s1,8(sp)
	sw	ra,16(sp)
	mv	s0,a0
	andi	s1,a2,255
	jr	a5
	.section	.rodata.OPLL_writeReg,"a",@progbits
	.align	2
	.align	2
.L64:
	.word	.L74-.L64
	.word	.L73-.L64
	.word	.L72-.L64
	.word	.L71-.L64
	.word	.L70-.L64
	.word	.L69-.L64
	.word	.L68-.L64
	.word	.L67-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L66-.L64
	.word	.L66-.L64
	.word	.L66-.L64
	.word	.L66-.L64
	.word	.L66-.L64
	.word	.L66-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L65-.L64
	.word	.L65-.L64
	.word	.L65-.L64
	.word	.L65-.L64
	.word	.L65-.L64
	.word	.L65-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L63-.L64
	.word	.L63-.L64
	.word	.L63-.L64
	.word	.L63-.L64
	.word	.L63-.L64
	.word	.L63-.L64
	.section	.text.OPLL_writeReg
.L65:
	addi	a1,a1,-32
	add	t2,a0,a1
	lbu	a5,28(t2)
	slli	t1,a1,1
	ori	t0,t1,1
	sw	a5,0(sp)
	sb	a2,34(t2)
	slli	a5,t0,5
	lw	t2,0(sp)
	slli	a0,s1,8
	sub	a3,a5,t0
	slli	a4,a1,6
	andi	a0,a0,256
	slli	a3,a3,2
	sub	a4,a4,t1
	add	a0,a0,t2
	add	a3,s0,a3
	slli	a4,a4,2
	add	a4,s0,a4
	sw	a0,256(a3)
	srli	t2,s1,1
	sw	a0,256(a4)
	andi	a0,t2,7
	sw	a0,260(a3)
	lw	t2,224(a4)
	srli	s1,s1,5
	sw	a0,260(a4)
	andi	s1,s1,1
	sw	s1,268(a3)
	bne	t2,zero,.L120
.L92:
	andi	a2,a2,16
	bne	a2,zero,.L121
	addi	a4,t1,13
	slli	a4,a4,2
	add	a4,s0,a4
	lw	a4,8(a4)
	beq	a4,zero,.L97
	sub	a4,a5,t0
	slli	a4,a4,2
	add	a4,s0,a4
	lw	a2,280(a4)
	li	a3,1
	bne	a2,a3,.L98
	sw	zero,284(a4)
.L98:
	sub	a4,a5,t0
	slli	a4,a4,2
	add	a4,s0,a4
	li	a3,5
	sw	a3,280(a4)
.L97:
	li	a4,0
	slli	a3,t1,5
.L96:
	sub	a3,a3,t1
	slli	a3,a3,2
	sub	a5,a5,t0
	add	a3,s0,a3
	slli	a5,a5,2
	lw	a2,220(a3)
	add	a5,s0,a5
	lw	t1,220(a5)
	lla	a0,.LANCHOR1
	slli	a2,a2,2
	add	a2,a0,a2
	addi	a1,a1,36
	slli	t1,t1,2
	lw	a2,0(a2)
	slli	a1,a1,2
	add	a0,a0,t1
	add	a1,s0,a1
	lw	a0,0(a0)
	sw	a4,4(a1)
	sw	zero,248(a3)
	sw	zero,272(a3)
	sw	zero,276(a3)
	sw	a2,240(a3)
	sw	zero,288(a3)
	sw	zero,248(a5)
	sw	zero,272(a5)
	sw	zero,276(a5)
	sw	a0,240(a5)
	sw	zero,288(a5)
	addi	a3,s0,34
	addi	a5,s0,56
	addi	s0,s0,104
.L99:
	lbu	a4,0(a3)
	addi	a5,a5,8
	addi	a3,a3,1
	andi	a4,a4,16
	sw	a4,-4(a5)
	sw	a4,-8(a5)
	bne	s0,a5,.L99
.L61:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L117:
	ret
.L63:
	addi	a1,a1,-48
	add	a5,a0,a1
	sb	a2,40(a5)
	srli	a2,s1,4
	sw	a1,0(sp)
	call	setInstrument
	lw	a1,0(sp)
	lla	a2,.LANCHOR1
	slli	s1,s1,2
	slli	a5,a1,1
	ori	a3,a5,1
	slli	a1,a1,6
	slli	a4,a3,5
	sub	a5,a1,a5
	sub	a4,a4,a3
	slli	a5,a5,2
	add	a5,s0,a5
	slli	a4,a4,2
	lw	a3,220(a5)
	add	a4,s0,a4
	lw	a1,220(a4)
	slli	a3,a3,2
	add	a3,a2,a3
	slli	a1,a1,2
	lw	a0,0(a3)
	add	a2,a2,a1
	lw	a3,0(a2)
	andi	s1,s1,60
	sw	s1,264(a4)
	sw	zero,248(a5)
	sw	zero,272(a5)
	sw	zero,276(a5)
	sw	a0,240(a5)
	sw	zero,288(a5)
	sw	zero,248(a4)
	sw	zero,272(a4)
	sw	zero,276(a4)
	sw	a3,240(a4)
	sw	zero,288(a4)
	j	.L61
.L66:
	addi	a1,a1,-16
	slli	a0,a1,1
	ori	a5,a0,1
	slli	a3,a1,6
	slli	a4,a5,5
	sub	a3,a3,a0
	add	a1,s0,a1
	sub	a4,a4,a5
	slli	a3,a3,2
	sb	a2,28(a1)
	add	a3,s0,a3
	slli	a4,a4,2
	lw	a2,220(a3)
	add	a4,s0,a4
	lbu	a5,34(a1)
	lw	a0,220(a4)
	lla	a1,.LANCHOR1
	slli	a2,a2,2
	add	a2,a1,a2
	slli	a5,a5,8
	slli	a0,a0,2
	lw	t1,0(a2)
	andi	a5,a5,256
	add	a1,a1,a0
	or	a5,a5,s1
	lw	a2,0(a1)
	sw	a5,256(a4)
	sw	a5,256(a3)
	sw	zero,248(a3)
	sw	zero,272(a3)
	sw	zero,276(a3)
	sw	t1,240(a3)
	sw	zero,288(a3)
	sw	zero,248(a4)
	sw	zero,272(a4)
	sw	zero,276(a4)
	sw	a2,240(a4)
	sw	zero,288(a4)
	j	.L61
.L74:
	addi	a5,a0,124
	sb	a2,46(a0)
	addi	a4,a0,248
	li	s1,0
	li	t1,6
	mv	s0,a5
	j	.L76
.L75:
	addi	s1,s1,1
	addi	s0,s0,4
	addi	a4,a4,248
	beq	s1,t1,.L61
.L76:
	lw	a5,0(s0)
	bne	a5,zero,.L75
	li	a2,0
	mv	a1,s1
	sw	a4,4(sp)
	sw	a0,0(sp)
	call	setInstrument
	lw	a4,4(sp)
	lw	a0,0(sp)
	li	t1,6
	sw	zero,0(a4)
	sw	zero,28(a4)
	sw	zero,40(a4)
	j	.L75
.L73:
	addi	a4,a0,124
	sb	a2,47(a0)
	li	s1,0
	li	a3,6
	mv	s0,a4
	j	.L78
.L77:
	addi	s1,s1,1
	addi	s0,s0,4
	beq	s1,a3,.L61
.L78:
	lw	a5,0(s0)
	bne	a5,zero,.L77
	li	a2,0
	mv	a1,s1
	sw	a0,0(sp)
	call	setInstrument
	slli	a4,s1,1
	ori	a4,a4,1
	lw	a0,0(sp)
	slli	a5,a4,5
	sub	a5,a5,a4
	slli	a5,a5,2
	add	a5,a0,a5
	sw	zero,248(a5)
	sw	zero,276(a5)
	sw	zero,288(a5)
	li	a3,6
	j	.L77
.L68:
	addi	a5,a0,124
	sb	a2,52(a0)
	addi	a4,a0,288
	li	s1,0
	li	t1,6
	mv	s0,a5
	j	.L89
.L88:
	addi	s1,s1,1
	addi	s0,s0,4
	addi	a4,a4,248
	beq	s1,t1,.L61
.L89:
	lw	a5,0(s0)
	bne	a5,zero,.L88
	li	a2,0
	mv	a1,s1
	sw	a4,4(sp)
	sw	a0,0(sp)
	call	setInstrument
	lw	a4,4(sp)
	lw	a0,0(sp)
	li	t1,6
	sw	zero,0(a4)
	j	.L88
.L67:
	addi	a5,a0,124
	sb	a2,53(a0)
	li	s1,0
	li	a3,6
	mv	s0,a5
	j	.L91
.L90:
	addi	s1,s1,1
	addi	s0,s0,4
	beq	s1,a3,.L61
.L91:
	lw	a5,0(s0)
	bne	a5,zero,.L90
	li	a2,0
	mv	a1,s1
	sw	a0,0(sp)
	call	setInstrument
	slli	a4,s1,1
	ori	a4,a4,1
	lw	a0,0(sp)
	slli	a5,a4,5
	sub	a5,a5,a4
	slli	a5,a5,2
	add	a5,a0,a5
	sw	zero,288(a5)
	li	a3,6
	j	.L90
.L72:
	addi	a5,a0,124
	sb	a2,48(a0)
	addi	a4,a0,272
	li	s1,0
	li	t1,6
	mv	s0,a5
	j	.L81
.L80:
	addi	s1,s1,1
	addi	s0,s0,4
	addi	a4,a4,248
	beq	s1,t1,.L61
.L81:
	lw	a5,0(s0)
	bne	a5,zero,.L80
	li	a2,0
	mv	a1,s1
	sw	a4,4(sp)
	sw	a0,0(sp)
	call	setInstrument
	lw	a4,4(sp)
	lw	a0,0(sp)
	li	t1,6
	sw	zero,0(a4)
	j	.L80
.L71:
	addi	a5,a0,124
	sb	a2,49(a0)
	addi	a3,a0,220
	li	s1,0
	mv	s0,a5
	j	.L83
.L82:
	addi	s1,s1,1
	li	a5,6
	addi	s0,s0,4
	addi	a3,a3,248
	beq	s1,a5,.L61
.L83:
	lw	a5,0(s0)
	bne	a5,zero,.L82
	li	a2,0
	mv	a1,s1
	sw	a3,4(sp)
	sw	a0,0(sp)
	call	setInstrument
	slli	a4,s1,1
	ori	a4,a4,1
	lw	a3,4(sp)
	slli	a5,a4,5
	lw	a0,0(sp)
	sub	a5,a5,a4
	slli	a5,a5,2
	lw	a2,0(a3)
	add	a5,a0,a5
	lw	a4,220(a5)
	lla	t1,.LANCHOR1
	slli	a2,a2,2
	add	a2,t1,a2
	slli	a4,a4,2
	lw	a2,0(a2)
	add	a4,t1,a4
	lw	a4,0(a4)
	sw	a2,20(a3)
	sw	a4,240(a5)
	j	.L82
.L70:
	addi	a5,a0,124
	sb	a2,50(a0)
	addi	a4,a0,288
	li	s1,0
	li	t1,6
	mv	s0,a5
	j	.L85
.L84:
	addi	s1,s1,1
	addi	s0,s0,4
	addi	a4,a4,248
	beq	s1,t1,.L61
.L85:
	lw	a5,0(s0)
	bne	a5,zero,.L84
	li	a2,0
	mv	a1,s1
	sw	a4,4(sp)
	sw	a0,0(sp)
	call	setInstrument
	lw	a4,4(sp)
	lw	a0,0(sp)
	li	t1,6
	sw	zero,0(a4)
	j	.L84
.L69:
	addi	a5,a0,124
	sb	a2,51(a0)
	li	s1,0
	li	a3,6
	mv	s0,a5
	j	.L87
.L86:
	addi	s1,s1,1
	addi	s0,s0,4
	beq	s1,a3,.L61
.L87:
	lw	a5,0(s0)
	bne	a5,zero,.L86
	li	a2,0
	mv	a1,s1
	sw	a0,0(sp)
	call	setInstrument
	slli	a4,s1,1
	ori	a4,a4,1
	lw	a0,0(sp)
	slli	a5,a4,5
	sub	a5,a5,a4
	slli	a5,a5,2
	add	a5,a0,a5
	sw	zero,288(a5)
	li	a3,6
	j	.L86
.L121:
	slli	a4,a1,3
	add	a4,s0,a4
	lw	a2,56(a4)
	slli	a3,t1,5
	bne	a2,zero,.L94
	sub	a2,a3,t1
	slli	a2,a2,2
	add	a2,s0,a2
	li	a0,1
	sw	a0,280(a2)
	sw	zero,284(a2)
	sw	zero,244(a2)
.L94:
	lw	a4,60(a4)
	bne	a4,zero,.L95
	sub	a4,a5,t0
	slli	a4,a4,2
	add	a4,s0,a4
	li	a2,1
	sw	a2,280(a4)
	sw	zero,284(a4)
	sw	zero,244(a4)
.L95:
	li	a4,1
	j	.L96
.L120:
	sw	s1,268(a4)
	j	.L92
	.size	OPLL_writeReg, .-OPLL_writeReg
	.globl	__udivsi3
	.section	.text.OPLL_reset,"ax",@progbits
	.align	2
	.globl	OPLL_reset
	.hidden	OPLL_reset
	.type	OPLL_reset, @function
OPLL_reset:
	beq	a0,zero,.L132
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	mv	s0,a0
	sw	zero,0(a0)
	sw	zero,4(a0)
	sw	zero,104(a0)
	sw	zero,112(a0)
	sw	zero,1660(a0)
	addi	a5,a0,224
	li	a4,0
	lla	a0,.LANCHOR4
	li	a1,4194304
	li	a2,12
.L124:
	andi	a3,a4,1
	sw	a3,0(a5)
	sw	a0,16(a5)
	sw	zero,20(a5)
	sw	zero,24(a5)
	sw	zero,8(a5)
	sw	zero,12(a5)
	sw	zero,4(a5)
	sw	zero,56(a5)
	sw	a1,60(a5)
	sw	zero,64(a5)
	sw	zero,52(a5)
	sw	zero,48(a5)
	sw	zero,44(a5)
	sw	zero,32(a5)
	sw	zero,36(a5)
	sw	zero,40(a5)
	sw	zero,28(a5)
	sw	zero,68(a5)
	addi	a4,a4,1
	addi	a5,a5,124
	bne	a4,a2,.L124
	sw	zero,148(s0)
	sw	zero,152(s0)
	sw	zero,156(s0)
	sw	zero,160(s0)
	sw	zero,164(s0)
	sw	zero,168(s0)
	li	s1,0
.L125:
	mv	a1,s1
	li	a2,0
	mv	a0,s0
	call	OPLL_writeReg
	addi	s1,s1,1
	li	a5,64
	bne	s1,a5,.L125
	la a1, .LANCHOR2; lw a1, 0(a1);
	li	a0,-2147483648
	call	__udivsi3
	sw	a0,8(s0)
	li	a1,72
	la a0, .LANCHOR5; lw a0, 0(a0);
	call	__udivsi3
	mv	a1,a0
	li	a0,-2147483648
	call	__udivsi3
	lw	ra,8(sp)
	sw	a0,16(s0)
	sw	zero,12(s0)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L132:
	ret
	.size	OPLL_reset, .-OPLL_reset
	.section	.rodata.OPLL_new.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	" @ /home/ysyx/ysyx-workbench/fceux-am/src/boards/emu2413.c:260  \n"
	.section	.text.OPLL_new,"ax",@progbits
	.align	2
	.globl	OPLL_new
	.hidden	OPLL_new
	.type	OPLL_new, @function
OPLL_new:
	lla	a5,.LANCHOR5
	lw	a4,0(a5)
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	bne	a0,a4,.L149
	lla	a5,.LANCHOR2
	lw	a4,0(a5)
	bne	a1,a4,.L150
	li	a0,1664
	call	malloc
	mv	s0,a0
	beq	a0,zero,.L135
	li	a2,1664
	li	a1,0
	call	memset
	mv	a0,s0
	sw	zero,1660(s0)
	call	OPLL_reset
.L135:
	lw	ra,8(sp)
	mv	a0,s0
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L149:
	sw	a0,0(a5)
	lla	s0,.LC0
	li	a0,65
.L137:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L137
	lla	s0,.LC1
	li	a0,65
.L138:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L138
	lla	s0,.LC3
	li	a0,32
.L139:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L139
	li	a0,1
	call	halt
.L150:
	sw	a1,0(a5)
	call	internal_refresh
	.size	OPLL_new, .-OPLL_new
	.section	.text.OPLL_writeIO,"ax",@progbits
	.align	2
	.globl	OPLL_writeIO
	.hidden	OPLL_writeIO
	.type	OPLL_writeIO, @function
OPLL_writeIO:
	andi	a1,a1,1
	mv	a5,a0
	bne	a1,zero,.L153
	sw	a2,0(a5)
	ret
.L153:
	lw	a1,0(a0)
	tail	OPLL_writeReg
	.size	OPLL_writeIO, .-OPLL_writeIO
	.section	.bss.fullsintable,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	fullsintable, @object
	.size	fullsintable, 1024
fullsintable:
	.zero	1024
	.section	.bss.halfsintable,"aw",@nobits
	.align	2
	.type	halfsintable, @object
	.size	halfsintable, 1024
halfsintable:
	.zero	1024
	.section	.rodata.SL.0,"a"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	SL.0, @object
	.size	SL.0, 64
SL.0:
	.word	0
	.word	262144
	.word	524288
	.word	786432
	.word	1048576
	.word	1310720
	.word	1572864
	.word	1835008
	.word	2097152
	.word	2359296
	.word	2621440
	.word	2883584
	.word	3145728
	.word	3407872
	.word	3670016
	.word	4194304
	.section	.rodata.default_inst,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	default_inst, @object
	.size	default_inst, 120
default_inst:
	.ascii	"\003!\005\006\350\201B'"
	.ascii	"\023A\024\r\330\366#\022"
	.ascii	"\021\021\b\b\372\262 \022"
	.ascii	"1a\f\007\250da'"
	.ascii	"2!\036\006\341v\001("
	.string	"\002\001\006"
	.ascii	"\243\342\364\364"
	.ascii	"!a\035\007\202\201\021\007"
	.ascii	"#!\"\027\242r\001\027"
	.string	"5\021%"
	.ascii	"@sr\001"
	.ascii	"\265\001\017\017\250\245Q\002"
	.ascii	"\027\301$\007\370\370\"\022"
	.ascii	"q#\021\006et\030\026"
	.ascii	"\001\002\323\005\311\225\003\002"
	.string	"ac\f"
	.ascii	"\224\3003\366"
	.string	"!r\r"
	.ascii	"\301\325V\006"
	.section	.sdata.clk,"aw"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	clk, @object
	.size	clk, 4
clk:
	.word	844451141
	.section	.sdata.rate,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	rate, @object
	.size	rate, 4
rate:
	.word	3354932
	.section	.srodata.waveform,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	waveform, @object
	.size	waveform, 8
waveform:
	.word	fullsintable
	.word	halfsintable
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
