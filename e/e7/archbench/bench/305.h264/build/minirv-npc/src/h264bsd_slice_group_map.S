#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"h264bsd_slice_group_map.c"
	.option nopic
	.text
	.globl	__mulsi3
	.globl	__udivsi3
	.globl	__umodsi3
	.section	.text.h264bsdDecodeSliceGroupMap,"ax",@progbits
	.align	2
	.globl	h264bsdDecodeSliceGroupMap
	.hidden	h264bsdDecodeSliceGroupMap
	.type	h264bsdDecodeSliceGroupMap, @function
h264bsdDecodeSliceGroupMap:
	addi	sp,sp,-64
	sw	s0,56(sp)
	sw	a1,4(sp)
	mv	s0,a0
	mv	a1,a4
	mv	a0,a3
	sw	s1,52(sp)
	sw	a4,16(sp)
	sw	a3,0(sp)
	sw	a2,8(sp)
	sw	ra,60(sp)
	call	__mulsi3
	lw	a5,4(sp)
	li	a4,1
	lw	a3,0(sp)
	lw	a2,12(a5)
	mv	s1,a0
	beq	a2,a4,.L102
	lw	t1,16(a5)
	li	a4,2
	addi	a1,t1,-3
	bgtu	a1,a4,.L57
	lw	a1,36(a5)
	lw	a0,8(sp)
	sw	a3,20(sp)
	sw	t1,12(sp)
	sw	a2,4(sp)
	sw	a5,0(sp)
	call	__mulsi3
	lw	a5,0(sp)
	lw	a2,4(sp)
	lw	t1,12(sp)
	lw	a3,20(sp)
	mv	t2,a0
	bleu	a0,s1,.L4
	mv	t2,s1
.L4:
	addi	a4,t1,-4
	li	a1,1
	li	t0,0
	bgtu	a4,a1,.L3
	lw	a4,32(a5)
	mv	t0,t2
	beq	a4,zero,.L3
	sub	t0,s1,t2
	j	.L3
.L57:
	li	t0,0
	li	t2,0
.L3:
	li	a4,5
	bgtu	t1,a4,.L5
	lla	a1,.L7
	slli	a4,t1,2
	add	a4,a4,a1
	lw	a4,0(a4)
	add	a4,a4,a1
	jr	a4
	.section	.rodata.h264bsdDecodeSliceGroupMap,"a",@progbits
	.align	2
	.align	2
.L7:
	.word	.L12-.L7
	.word	.L11-.L7
	.word	.L10-.L7
	.word	.L9-.L7
	.word	.L8-.L7
	.word	.L6-.L7
	.section	.text.h264bsdDecodeSliceGroupMap
.L8:
	lw	a2,32(a5)
	beq	s1,zero,.L1
	li	a1,1
	mv	a4,s0
	li	a5,0
	sub	a1,a1,a2
.L50:
	mv	a3,a2
	bgtu	t0,a5,.L49
	mv	a3,a1
.L49:
	sw	a3,0(a4)
	addi	a5,a5,1
	addi	a4,a4,4
	bne	s1,a5,.L50
.L1:
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	addi	sp,sp,64
	jr	ra
.L9:
	slli	a4,s1,2
	lw	a2,32(a5)
	add	a4,a4,s0
	mv	a5,s0
	li	a1,1
	beq	s1,zero,.L37
.L36:
	sw	a1,0(a5)
	addi	a5,a5,4
	bne	a4,a5,.L36
.L37:
	lw	a5,16(sp)
	sub	s1,a3,a2
	srli	s1,s1,1
	sub	a5,a5,a2
	srli	a5,a5,1
	addi	t1,a2,-1
	beq	t2,zero,.L1
	slli	a4,a2,1
	li	a1,1
	sub	a1,a1,a4
	addi	a4,a4,-1
	sw	a1,44(sp)
	sw	a4,48(sp)
	sw	s0,24(sp)
	sw	a5,40(sp)
	sw	a5,32(sp)
	sw	s1,36(sp)
	sw	s1,28(sp)
	li	a4,0
	sw	t2,20(sp)
	mv	s0,t1
	mv	a1,a3
	j	.L48
.L39:
	beq	s0,t0,.L103
.L40:
	li	a3,-1
	beq	a2,a3,.L104
	beq	a2,t0,.L105
.L45:
	add	s1,s1,s0
	add	a5,a5,a2
.L42:
	addi	a0,t2,-1
	lw	a3,20(sp)
	seqz	a0,a0
	add	a4,a4,a0
	bleu	a3,a4,.L1
.L48:
	mv	a0,a5
	sw	a2,12(sp)
	sw	a4,8(sp)
	sw	a1,4(sp)
	sw	a5,0(sp)
	call	__mulsi3
	lw	a5,24(sp)
	add	a0,a0,s1
	slli	a0,a0,2
	add	a0,a5,a0
	lw	t2,0(a0)
	li	t0,1
	lw	a5,0(sp)
	lw	a1,4(sp)
	lw	a4,8(sp)
	lw	a2,12(sp)
	bne	t2,t0,.L38
	sw	zero,0(a0)
.L38:
	li	a3,-1
	bne	s0,a3,.L39
	lw	a3,28(sp)
	bne	s1,a3,.L40
	mv	a3,s1
	bgt	s1,zero,.L41
	li	a3,1
.L41:
	addi	s1,a3,-1
	lw	a2,48(sp)
	sw	s1,28(sp)
	li	s0,0
	j	.L42
.L10:
	lw	t1,24(a5)
	lw	a0,28(a5)
	beq	s1,zero,.L28
	slli	a4,s1,2
	addi	a1,a2,-1
	mv	a5,s0
	add	a4,a4,s0
.L27:
	sw	a1,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L27
.L28:
	slli	a5,a2,2
	add	a4,t1,a5
	addi	s1,a2,-2
	add	a5,a0,a5
	sw	s0,24(sp)
	sw	a4,4(sp)
	sw	a5,0(sp)
	mv	s0,s1
.L26:
	lw	a5,4(sp)
	mv	a1,a3
	sw	a3,8(sp)
	lw	s1,-8(a5)
	mv	a0,s1
	call	__udivsi3
	lw	a3,8(sp)
	mv	t1,a0
	mv	a0,s1
	mv	a1,a3
	sw	t1,16(sp)
	call	__umodsi3
	lw	a5,0(sp)
	lw	a3,8(sp)
	sw	a0,20(sp)
	lw	s1,-8(a5)
	mv	a1,a3
	mv	a0,s1
	call	__udivsi3
	lw	a3,8(sp)
	mv	t2,a0
	mv	a0,s1
	mv	a1,a3
	sw	a3,12(sp)
	sw	t2,8(sp)
	call	__umodsi3
	lw	t2,8(sp)
	lw	t1,16(sp)
	lw	a3,12(sp)
	mv	s1,a0
	bgtu	t1,t2,.L29
	mv	a1,t1
	mv	a0,a3
	call	__mulsi3
	lw	t0,20(sp)
	lw	a5,24(sp)
	lw	t2,8(sp)
	lw	t1,16(sp)
	lw	a3,12(sp)
	slli	a1,t0,2
	add	a1,a5,a1
.L30:
	slli	a5,a0,2
	add	a5,a5,a1
	mv	a4,t0
	bgtu	t0,s1,.L33
.L31:
	sw	s0,0(a5)
	addi	a4,a4,1
	addi	a5,a5,4
	bgeu	s1,a4,.L31
.L33:
	addi	t1,t1,1
	add	a0,a0,a3
	bgeu	t2,t1,.L30
.L29:
	lw	a5,4(sp)
	addi	s0,s0,-1
	addi	a5,a5,-4
	sw	a5,4(sp)
	lw	a5,0(sp)
	addi	a5,a5,-4
	sw	a5,0(sp)
	li	a5,-1
	bne	s0,a5,.L26
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	addi	sp,sp,64
	jr	ra
.L11:
	mv	a4,s0
	li	s0,0
	beq	s1,zero,.L1
	sw	s1,12(sp)
	sw	a3,0(sp)
	mv	s1,a2
.L24:
	lw	a1,0(sp)
	mv	a0,s0
	sw	a4,8(sp)
	call	__udivsi3
	mv	a1,s1
	call	__mulsi3
	lw	a1,0(sp)
	mv	a3,a0
	srli	a3,a3,1
	mv	a0,s0
	sw	a3,4(sp)
	call	__umodsi3
	lw	a3,4(sp)
	mv	a1,s1
	addi	s0,s0,1
	add	a0,a3,a0
	call	__umodsi3
	lw	a4,8(sp)
	lw	a5,12(sp)
	sw	a0,0(a4)
	addi	a4,a4,4
	bne	a5,s0,.L24
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	addi	sp,sp,64
	jr	ra
.L12:
	lw	a5,20(a5)
	mv	a0,t1
	sw	a5,0(sp)
.L23:
	beq	a2,zero,.L17
	bleu	s1,a0,.L1
	lw	t2,0(sp)
	mv	t0,t1
.L18:
	lw	a4,0(t2)
	beq	a4,zero,.L21
	slli	a3,a0,2
	add	a3,s0,a3
	mv	a5,t1
	bgtu	s1,a0,.L20
	j	.L106
.L107:
	add	a4,a5,a0
	addi	a3,a3,4
	bleu	s1,a4,.L19
.L20:
	sw	t0,0(a3)
	lw	a1,0(t2)
	addi	a5,a5,1
	bltu	a5,a1,.L107
.L19:
	add	a0,a0,a1
.L21:
	addi	t0,t0,1
	beq	a2,t0,.L17
	addi	t2,t2,4
	bgtu	s1,a0,.L18
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	addi	sp,sp,64
	jr	ra
.L6:
	lw	a0,32(a5)
	beq	a3,zero,.L1
	lw	a1,16(sp)
	li	t2,1
	mv	s1,s0
	slli	t1,a3,2
	li	a5,0
	li	s0,0
	sub	t2,t2,a0
	sw	a3,0(sp)
.L51:
	add	a2,a1,a5
	mv	a4,s1
	beq	a1,zero,.L55
.L53:
	mv	a3,a0
	bgtu	t0,a5,.L52
	mv	a3,t2
.L52:
	sw	a3,0(a4)
	addi	a5,a5,1
	add	a4,a4,t1
	bne	a2,a5,.L53
.L55:
	lw	a4,0(sp)
	addi	s0,s0,1
	addi	s1,s1,4
	bne	a4,s0,.L51
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	addi	sp,sp,64
	jr	ra
.L17:
	bgtu	s1,a0,.L23
	j	.L1
.L106:
	add	a0,a0,a4
	j	.L21
.L103:
	lw	a3,36(sp)
	bne	s1,a3,.L40
	addi	a2,s1,1
	addi	s1,a1,-1
	ble	s1,a2,.L43
	mv	s1,a2
.L43:
	lw	a2,44(sp)
	sw	s1,36(sp)
	li	s0,0
	j	.L42
.L104:
	lw	a3,32(sp)
	bne	a5,a3,.L45
	bgt	a5,zero,.L46
	li	a5,1
.L46:
	addi	a5,a5,-1
	lw	s0,44(sp)
	sw	a5,32(sp)
	li	a2,0
	j	.L42
.L105:
	lw	a3,40(sp)
	bne	a5,a3,.L45
	addi	a2,a5,1
	lw	a5,16(sp)
	addi	a5,a5,-1
	bgt	a5,a2,.L108
.L47:
	lw	s0,48(sp)
	sw	a5,40(sp)
	li	a2,0
	j	.L42
.L5:
	beq	s1,zero,.L1
	lw	a3,44(a5)
	slli	a5,s1,2
	mv	a4,s0
	add	a5,a5,a3
.L56:
	lw	a2,0(a3)
	addi	a3,a3,4
	addi	a4,a4,4
	sw	a2,-4(a4)
	bne	a3,a5,.L56
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	addi	sp,sp,64
	jr	ra
.L102:
	slli	a2,a0,2
	mv	a0,s0
	lw	s0,56(sp)
	lw	ra,60(sp)
	lw	s1,52(sp)
	li	a1,0
	addi	sp,sp,64
	tail	memset
.L108:
	mv	a5,a2
	j	.L47
	.size	h264bsdDecodeSliceGroupMap, .-h264bsdDecodeSliceGroupMap
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
