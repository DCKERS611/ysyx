#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"h264bsd_storage.c"
	.option nopic
	.text
	.globl	__mulsi3
	.globl	__umodsi3
	.section	.text.CheckPps.isra.0,"ax",@progbits
	.align	2
	.type	CheckPps.isra.0, @function
CheckPps.isra.0:
	lw	t1,12(a0)
	addi	sp,sp,-36
	sw	ra,32(sp)
	sw	s0,28(sp)
	sw	s1,24(sp)
	li	a4,1
	sw	t1,0(sp)
	bleu	t1,a4,.L13
	mv	a5,a1
	mv	s0,a0
	mv	a1,a2
	mv	a0,a5
	sw	a5,4(sp)
	call	__mulsi3
	mv	s1,a0
	lw	a0,16(s0)
	lw	a5,4(sp)
	lw	t1,0(sp)
	bne	a0,zero,.L3
	lw	a5,20(s0)
	li	a4,0
.L4:
	lw	a3,0(a5)
	addi	a4,a4,1
	addi	a5,a5,4
	bltu	s1,a3,.L12
	bne	t1,a4,.L4
.L1:
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
.L3:
	li	a4,2
	beq	a0,a4,.L18
	addi	a5,a0,-3
	bgtu	a5,a4,.L7
	lw	a0,36(s0)
	sltu	a0,s1,a0
	j	.L1
.L7:
	li	a5,6
	beq	a0,a5,.L19
.L13:
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	li	a0,0
	addi	sp,sp,36
	jr	ra
.L18:
	addi	a4,t1,-1
	lw	a2,24(s0)
	lw	t0,28(s0)
	sw	a4,20(sp)
	li	s0,0
	j	.L6
.L20:
	sw	a4,12(sp)
	bleu	s1,a4,.L12
	call	__umodsi3
	lw	a5,0(sp)
	lw	a4,12(sp)
	mv	a3,a0
	mv	a1,a5
	mv	a0,a4
	sw	a3,0(sp)
	sw	a5,16(sp)
	call	__umodsi3
	lw	a3,0(sp)
	bgtu	a3,a0,.L12
	lw	t0,8(sp)
	lw	a4,20(sp)
	lw	a5,16(sp)
	lw	a2,4(sp)
	addi	t0,t0,4
	beq	s0,a4,.L13
.L6:
	lw	a0,0(a2)
	lw	a4,0(t0)
	addi	a2,a2,4
	sw	a5,0(sp)
	sw	t0,8(sp)
	sw	a2,4(sp)
	sw	a2,12(sp)
	mv	a1,a5
	addi	s0,s0,1
	bleu	a0,a4,.L20
.L12:
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	li	a0,1
	addi	sp,sp,36
	jr	ra
.L19:
	lw	a0,40(s0)
	sgtu	a0,s1,a0
	j	.L1
	.size	CheckPps.isra.0, .-CheckPps.isra.0
	.section	.text.h264bsdInitStorage,"ax",@progbits
	.align	2
	.globl	h264bsdInitStorage
	.hidden	h264bsdInitStorage
	.type	h264bsdInitStorage, @function
h264bsdInitStorage:
	li	a2,4096
	addi	sp,sp,-12
	addi	a2,a2,-700
	li	a1,0
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	memset
	li	a5,32
	sw	a5,8(s0)
	li	a5,256
	sw	a5,4(s0)
	li	a5,1
	lw	ra,8(sp)
	sw	a5,1332(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	h264bsdInitStorage, .-h264bsdInitStorage
	.section	.text.h264bsdStoreSeqParamSet,"ax",@progbits
	.align	2
	.globl	h264bsdStoreSeqParamSet
	.hidden	h264bsdStoreSeqParamSet
	.type	h264bsdStoreSeqParamSet, @function
h264bsdStoreSeqParamSet:
	lw	a5,8(a1)
	addi	sp,sp,-20
	sw	s0,12(sp)
	slli	a4,a5,2
	add	s0,a0,a4
	lw	a3,20(s0)
	sw	ra,16(sp)
	sw	s1,8(sp)
	mv	t1,a1
	beq	a3,zero,.L33
	lw	a2,8(a0)
	mv	s1,a0
	beq	a2,a5,.L34
	lw	a0,40(a3)
	sw	a1,0(sp)
	call	free
	lw	a5,20(s0)
	lw	a0,84(a5)
	sw	zero,40(a5)
	call	free
	lw	a5,20(s0)
	lw	t1,0(sp)
	sw	zero,84(a5)
.L26:
	mv	a1,t1
	addi	t1,t1,80
.L29:
	lw	a0,0(a1)
	lw	a2,4(a1)
	lw	a3,8(a1)
	lw	a4,12(a1)
	sw	a0,0(a5)
	sw	a2,4(a5)
	sw	a3,8(a5)
	sw	a4,12(a5)
	addi	a1,a1,16
	addi	a5,a5,16
	bne	a1,t1,.L29
	lw	a0,0(a1)
	lw	a2,4(a1)
	lw	a4,8(a1)
	li	a3,0
	sw	a0,0(a5)
	sw	a2,4(a5)
	sw	a4,8(a5)
.L23:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	mv	a0,a3
	addi	sp,sp,20
	jr	ra
.L34:
	lw	a1,16(a0)
	mv	a0,t1
	sw	t1,0(sp)
	call	h264bsdCompareSeqParamSets
	lw	t1,0(sp)
	beq	a0,zero,.L28
	lw	a5,20(s0)
	lw	a0,40(a5)
	call	free
	lw	a5,20(s0)
	lw	a0,84(a5)
	sw	zero,40(a5)
	call	free
	lw	a5,20(s0)
	li	a4,33
	lw	t1,0(sp)
	sw	zero,84(a5)
	sw	a4,8(s1)
	li	a4,257
	sw	a4,4(s1)
	sw	zero,16(s1)
	sw	zero,12(s1)
	j	.L26
.L28:
	sw	a0,4(sp)
	lw	a0,40(t1)
	sw	t1,0(sp)
	call	free
	lw	t1,0(sp)
	lw	a0,84(t1)
	sw	zero,40(t1)
	call	free
	lw	t1,0(sp)
	lw	a3,4(sp)
	sw	zero,84(t1)
	j	.L23
.L33:
	li	a0,92
	sw	a1,0(sp)
	call	malloc
	sw	a0,20(s0)
	lw	t1,0(sp)
	mv	a5,a0
	bne	a0,zero,.L26
	li	a3,65536
	addi	a3,a3,-1
	j	.L23
	.size	h264bsdStoreSeqParamSet, .-h264bsdStoreSeqParamSet
	.section	.text.h264bsdStorePicParamSet,"ax",@progbits
	.align	2
	.globl	h264bsdStorePicParamSet
	.hidden	h264bsdStorePicParamSet
	.type	h264bsdStorePicParamSet, @function
h264bsdStorePicParamSet:
	lw	a4,0(a1)
	addi	sp,sp,-12
	sw	s1,0(sp)
	slli	s1,a4,2
	add	s1,a0,s1
	lw	a3,148(s1)
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a1
	beq	a3,zero,.L45
	lw	a2,4(a0)
	mv	a5,a0
	lw	a0,20(a3)
	bne	a2,a4,.L39
	lw	a3,4(a1)
	lw	a4,8(a5)
	beq	a3,a4,.L39
	li	a4,257
	sw	a4,4(a5)
.L39:
	call	free
	lw	a5,148(s1)
	lw	a0,24(a5)
	sw	zero,20(a5)
	call	free
	lw	a5,148(s1)
	lw	a0,28(a5)
	sw	zero,24(a5)
	call	free
	lw	a5,148(s1)
	lw	a0,44(a5)
	sw	zero,28(a5)
	call	free
	lw	a0,148(s1)
	sw	zero,44(a0)
.L38:
	mv	a1,s0
	addi	t2,s0,72
.L41:
	lw	t0,0(a1)
	lw	t1,4(a1)
	lw	a2,8(a1)
	lw	a3,12(a1)
	lw	a4,16(a1)
	lw	a5,20(a1)
	sw	t0,0(a0)
	sw	t1,4(a0)
	sw	a2,8(a0)
	sw	a3,12(a0)
	sw	a4,16(a0)
	sw	a5,20(a0)
	addi	a1,a1,24
	addi	a0,a0,24
	bne	a1,t2,.L41
	li	a0,0
.L35:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L45:
	li	a0,72
	call	malloc
	sw	a0,148(s1)
	bne	a0,zero,.L38
	li	a0,65536
	addi	a0,a0,-1
	j	.L35
	.size	h264bsdStorePicParamSet, .-h264bsdStorePicParamSet
	.section	.text.h264bsdActivateParamSets,"ax",@progbits
	.align	2
	.globl	h264bsdActivateParamSets
	.hidden	h264bsdActivateParamSets
	.type	h264bsdActivateParamSets, @function
h264bsdActivateParamSets:
	addi	a5,a1,36
	slli	a5,a5,2
	addi	sp,sp,-36
	add	a5,a0,a5
	sw	s1,24(sp)
	lw	s1,4(a5)
	sw	ra,32(sp)
	sw	s0,28(sp)
	sw	a1,0(sp)
	sw	a2,20(sp)
	beq	s1,zero,.L58
	lw	t0,4(s1)
	mv	s0,a0
	addi	a5,t0,4
	slli	a5,a5,2
	add	a5,a0,a5
	lw	t1,4(a5)
	sw	t0,4(sp)
	beq	t1,zero,.L58
	lw	t2,52(t1)
	lw	a2,56(t1)
	mv	a0,s1
	mv	a1,t2
	sw	t1,16(sp)
	sw	t2,12(sp)
	sw	a2,8(sp)
	call	CheckPps.isra.0
	mv	a5,a0
	bne	a0,zero,.L46
	lw	a1,4(s0)
	li	a0,256
	lw	a2,8(sp)
	lw	t2,12(sp)
	lw	t1,16(sp)
	lw	t0,4(sp)
	lw	a4,0(sp)
	beq	a1,a0,.L66
	li	a5,4096
	add	a3,s0,a5
	lw	a5,-716(a3)
	bne	a5,zero,.L67
	sw	a3,0(sp)
	beq	a1,a4,.L46
	lw	a1,8(s0)
	beq	t0,a1,.L52
	sw	a5,4(sp)
	lw	a5,20(sp)
	beq	a5,zero,.L58
	sw	a4,4(s0)
	mv	a1,a2
	mv	a0,t2
	sw	s1,12(s0)
	sw	t0,8(s0)
	sw	t1,16(s0)
	sw	a2,12(sp)
	sw	t2,8(sp)
	call	__mulsi3
	lw	t2,8(sp)
	lw	a2,12(sp)
	lw	a3,0(sp)
	lw	a5,4(sp)
	sw	a0,1176(s0)
	sw	t2,1340(s0)
	sw	a2,1344(s0)
	li	a4,1
	sw	a4,-716(a3)
.L46:
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	mv	a0,a5
	addi	sp,sp,36
	jr	ra
.L58:
	lw	ra,32(sp)
	lw	s0,28(sp)
	li	a5,1
	lw	s1,24(sp)
	mv	a0,a5
	addi	sp,sp,36
	jr	ra
.L67:
	lw	a0,1212(s0)
	sw	zero,-716(a3)
	call	free
	lw	a0,1172(s0)
	sw	zero,1212(s0)
	call	free
	lw	a5,1176(s0)
	sw	zero,1172(s0)
	slli	a0,a5,3
	sub	a0,a0,a5
	slli	a0,a0,2
	sub	a0,a0,a5
	slli	a0,a0,3
	call	malloc
	lw	a5,1176(s0)
	sw	a0,1212(s0)
	slli	a0,a5,2
	call	malloc
	mv	a5,a0
	lw	a0,1212(s0)
	sw	a5,1172(s0)
	beq	a0,zero,.L56
	beq	a5,zero,.L56
	lw	a5,1176(s0)
	li	a1,0
	li	s1,1
	slli	a2,a5,3
	sub	a2,a2,a5
	slli	a2,a2,2
	sub	a2,a2,a5
	slli	a2,a2,3
	call	memset
	lw	a5,16(s0)
	lw	a0,1212(s0)
	lw	a2,1176(s0)
	lw	a1,52(a5)
	call	h264bsdInitMbNeighbours
	lw	a5,1216(s0)
	lw	a0,16(s0)
	bne	a5,zero,.L51
	lw	a4,16(a0)
	li	a5,2
	li	s1,1
	beq	a4,a5,.L51
	lw	s1,80(a0)
	beq	s1,zero,.L51
	lw	a5,84(a0)
	lw	s1,920(a5)
	beq	s1,zero,.L51
	lw	s1,944(a5)
	seqz	s1,s1
.L51:
	lw	a4,12(a0)
	lw	a3,44(a0)
	lw	a2,88(a0)
	lw	a1,56(a0)
	lw	a0,52(a0)
	sw	a4,8(sp)
	sw	a3,4(sp)
	sw	a2,0(sp)
	call	__mulsi3
	mv	a1,a0
	addi	a0,s0,1220
	lw	s0,28(sp)
	lw	a4,8(sp)
	lw	a3,4(sp)
	lw	a2,0(sp)
	lw	ra,32(sp)
	mv	a5,s1
	lw	s1,24(sp)
	addi	sp,sp,36
	tail	h264bsdResetDpb
.L66:
	sw	a4,4(s0)
	sw	s1,12(s0)
	sw	t0,8(s0)
	sw	t1,16(s0)
	mv	a1,a2
	mv	a0,t2
	sw	a5,8(sp)
	sw	a2,4(sp)
	sw	t2,0(sp)
	call	__mulsi3
	lw	t2,0(sp)
	lw	a2,4(sp)
	li	a4,4096
	sw	a0,1176(s0)
	lw	a5,8(sp)
	sw	t2,1340(s0)
	sw	a2,1344(s0)
	lw	ra,32(sp)
	add	a4,s0,a4
	lw	s0,28(sp)
	li	a3,1
	sw	a3,-716(a4)
	lw	s1,24(sp)
	mv	a0,a5
	addi	sp,sp,36
	jr	ra
.L52:
	sw	a4,4(s0)
	sw	s1,12(s0)
	j	.L46
.L56:
	li	a5,65536
	addi	a5,a5,-1
	j	.L46
	.size	h264bsdActivateParamSets, .-h264bsdActivateParamSets
	.section	.text.h264bsdResetStorage,"ax",@progbits
	.align	2
	.globl	h264bsdResetStorage
	.hidden	h264bsdResetStorage
	.type	h264bsdResetStorage, @function
h264bsdResetStorage:
	lw	a3,1176(a0)
	sw	zero,1196(a0)
	sw	zero,1192(a0)
	beq	a3,zero,.L68
	slli	a4,a3,3
	sub	a4,a4,a3
	lw	a5,1212(a0)
	slli	a4,a4,2
	sub	a4,a4,a3
	slli	a4,a4,3
	add	a4,a5,a4
	addi	a4,a4,4
	addi	a5,a5,4
.L70:
	sw	zero,0(a5)
	sw	zero,192(a5)
	addi	a5,a5,216
	bne	a5,a4,.L70
.L68:
	ret
	.size	h264bsdResetStorage, .-h264bsdResetStorage
	.section	.text.h264bsdIsStartOfPicture,"ax",@progbits
	.align	2
	.globl	h264bsdIsStartOfPicture
	.hidden	h264bsdIsStartOfPicture
	.type	h264bsdIsStartOfPicture, @function
h264bsdIsStartOfPicture:
	lw	a0,1188(a0)
	seqz	a0,a0
	ret
	.size	h264bsdIsStartOfPicture, .-h264bsdIsStartOfPicture
	.section	.text.h264bsdIsEndOfPicture,"ax",@progbits
	.align	2
	.globl	h264bsdIsEndOfPicture
	.hidden	h264bsdIsEndOfPicture
	.type	h264bsdIsEndOfPicture, @function
h264bsdIsEndOfPicture:
	lw	a5,1404(a0)
	lw	a2,1176(a0)
	beq	a5,zero,.L77
	beq	a2,zero,.L83
	slli	a3,a2,3
	sub	a3,a3,a2
	lw	a5,1212(a0)
	slli	a3,a3,2
	sub	a3,a3,a2
	slli	a3,a3,3
	add	a3,a5,a3
	addi	a3,a3,196
	addi	a5,a5,196
	li	a0,0
.L81:
	lw	a4,0(a5)
	addi	a5,a5,216
	snez	a4,a4
	add	a0,a0,a4
	bne	a3,a5,.L81
	sub	a0,a0,a2
	seqz	a0,a0
	ret
.L77:
	lw	a0,1196(a0)
	sub	a0,a0,a2
	seqz	a0,a0
	ret
.L83:
	li	a0,1
	ret
	.size	h264bsdIsEndOfPicture, .-h264bsdIsEndOfPicture
	.section	.text.h264bsdComputeSliceGroupMap,"ax",@progbits
	.align	2
	.globl	h264bsdComputeSliceGroupMap
	.hidden	h264bsdComputeSliceGroupMap
	.type	h264bsdComputeSliceGroupMap, @function
h264bsdComputeSliceGroupMap:
	lw	a3,16(a0)
	mv	a5,a0
	mv	a2,a1
	lw	a4,56(a3)
	lw	a0,1172(a0)
	lw	a3,52(a3)
	lw	a1,12(a5)
	tail	h264bsdDecodeSliceGroupMap
	.size	h264bsdComputeSliceGroupMap, .-h264bsdComputeSliceGroupMap
	.section	.text.h264bsdCheckAccessUnitBoundary,"ax",@progbits
	.align	2
	.globl	h264bsdCheckAccessUnitBoundary
	.hidden	h264bsdCheckAccessUnitBoundary
	.type	h264bsdCheckAccessUnitBoundary, @function
h264bsdCheckAccessUnitBoundary:
	addi	sp,sp,-68
	sw	s0,60(sp)
	sw	s1,56(sp)
	sw	ra,64(sp)
	sw	zero,0(a3)
	lw	a4,0(a1)
	mv	s0,a3
	mv	s1,a1
	li	a3,5
	addi	a1,a4,-6
	bleu	a1,a3,.L86
	mv	a5,a2
	addi	a2,a4,-13
	bleu	a2,a3,.L86
	andi	a4,a4,-5
	li	a3,1
	li	t1,0
	bne	a4,a3,.L85
	lw	a3,1332(a5)
	mv	t0,a0
	beq	a3,zero,.L89
	sw	a4,0(s0)
	sw	zero,1332(a5)
.L89:
	addi	a1,sp,28
	mv	a0,t0
	sw	a5,0(sp)
	sw	a4,8(sp)
	sw	t0,4(sp)
	call	h264bsdCheckPpsId
	mv	t1,a0
	bne	a0,zero,.L85
	lw	a3,28(sp)
	lw	a5,0(sp)
	addi	a3,a3,36
	slli	a3,a3,2
	add	a3,a5,a3
	lw	a4,4(a3)
	sw	a4,16(sp)
	beq	a4,zero,.L110
	lw	a2,4(a4)
	addi	a3,a2,4
	slli	a3,a3,2
	add	a3,a5,a3
	lw	a4,4(a3)
	sw	a4,0(sp)
	beq	a4,zero,.L110
	lw	a3,8(a5)
	li	a1,32
	lw	t0,4(sp)
	lw	a4,8(sp)
	beq	a3,a1,.L90
	beq	a2,a3,.L90
	lw	a2,0(s1)
	li	a3,5
	bne	a2,a3,.L110
.L90:
	lw	a3,1304(a5)
	lw	a2,4(s1)
	beq	a3,a2,.L91
	bne	a3,zero,.L123
.L92:
	li	a3,1
	sw	a3,0(s0)
.L91:
	lw	a2,1300(a5)
	li	a3,5
	lw	a1,0(s1)
	beq	a2,a3,.L124
	beq	a1,a3,.L94
.L95:
	sw	a5,12(sp)
	lw	a5,0(sp)
	mv	a0,t0
	addi	a2,sp,32
	lw	a1,12(a5)
	sw	a4,8(sp)
	sw	t0,4(sp)
	call	h264bsdCheckFrameNum
	lw	t0,4(sp)
	lw	a4,8(sp)
	lw	a5,12(sp)
	mv	t1,a0
	bne	a0,zero,.L99
	lw	a3,32(sp)
	lw	a2,1308(a5)
	beq	a2,a3,.L97
	sw	a3,1308(a5)
	li	a3,1
	sw	a3,0(s0)
.L97:
	lw	t2,0(s1)
	li	a3,5
	beq	t2,a3,.L125
.L98:
	lw	a3,0(sp)
	lw	t2,16(a3)
	beq	t2,zero,.L126
	li	a4,1
	beq	t2,a4,.L127
.L104:
	lw	a4,0(s1)
	sw	a4,1300(a5)
	lw	a4,4(s1)
	sw	a4,1304(a5)
	j	.L85
.L86:
	li	a5,1
	sw	a5,0(s0)
	li	t1,0
.L85:
	lw	ra,64(sp)
	lw	s0,60(sp)
	lw	s1,56(sp)
	mv	a0,t1
	addi	sp,sp,68
	jr	ra
.L110:
	li	t1,65536
	addi	t1,t1,-16
	j	.L85
.L124:
	beq	a1,a2,.L95
.L94:
	li	a3,1
	sw	a3,0(s0)
	j	.L95
.L99:
	mv	t1,a4
	j	.L85
.L123:
	bne	a2,zero,.L91
	j	.L92
.L127:
	lw	a4,0(sp)
	lw	a4,24(a4)
	bne	a4,zero,.L104
	sw	a5,8(sp)
	lw	a5,16(sp)
	lw	a2,0(s1)
	lw	a1,0(sp)
	lw	a3,8(a5)
	addi	a4,sp,48
	mv	a0,t0
	sw	t1,4(sp)
	sw	t2,12(sp)
	call	h264bsdCheckDeltaPicOrderCnt
	bne	a0,zero,.L112
	lw	a5,8(sp)
	lw	a4,48(sp)
	lw	t1,4(sp)
	lw	a3,1324(a5)
	beq	a3,a4,.L106
	lw	t2,12(sp)
	sw	a4,1324(a5)
	sw	t2,0(s0)
.L106:
	lw	a4,16(sp)
	lw	a4,8(a4)
	beq	a4,zero,.L104
	lw	a4,52(sp)
	lw	a3,1328(a5)
	beq	a3,a4,.L104
	sw	a4,1328(a5)
	li	a4,1
	sw	a4,0(s0)
	j	.L104
.L126:
	lw	a2,0(s1)
	lw	a1,0(sp)
	addi	a3,sp,40
	mv	a0,t0
	sw	a4,4(sp)
	sw	a5,20(sp)
	sw	t1,12(sp)
	sw	t0,8(sp)
	call	h264bsdCheckPicOrderCntLsb
	lw	a4,4(sp)
	bne	a0,zero,.L99
	lw	a5,20(sp)
	lw	a4,40(sp)
	lw	t0,8(sp)
	lw	a3,1316(a5)
	lw	t1,12(sp)
	beq	a3,a4,.L102
	sw	a4,1316(a5)
	li	a4,1
	sw	a4,0(s0)
.L102:
	lw	a4,16(sp)
	lw	a4,8(a4)
	beq	a4,zero,.L104
	lw	a2,0(s1)
	lw	a1,0(sp)
	addi	a3,sp,44
	mv	a0,t0
	sw	a5,8(sp)
	sw	t1,4(sp)
	call	h264bsdCheckDeltaPicOrderCntBottom
	bne	a0,zero,.L112
	lw	a5,8(sp)
	lw	a4,44(sp)
	lw	t1,4(sp)
	lw	a3,1320(a5)
	beq	a3,a4,.L104
	sw	a4,1320(a5)
	li	a4,1
	sw	a4,0(s0)
	j	.L104
.L125:
	sw	a5,20(sp)
	lw	a5,0(sp)
	addi	a3,sp,36
	li	a2,5
	lw	a1,12(a5)
	mv	a0,t0
	sw	a4,4(sp)
	sw	t2,24(sp)
	sw	t1,12(sp)
	sw	t0,8(sp)
	call	h264bsdCheckIdrPicId
	lw	a4,4(sp)
	bne	a0,zero,.L99
	lw	a5,20(sp)
	lw	t2,24(sp)
	lw	a3,36(sp)
	lw	a2,1300(a5)
	lw	t0,8(sp)
	lw	t1,12(sp)
	beq	a2,t2,.L128
.L100:
	sw	a3,1312(a5)
	j	.L98
.L128:
	lw	a2,1312(a5)
	beq	a2,a3,.L100
	li	a2,1
	sw	a2,0(s0)
	sw	a3,1312(a5)
	j	.L98
.L112:
	mv	t1,a0
	j	.L85
	.size	h264bsdCheckAccessUnitBoundary, .-h264bsdCheckAccessUnitBoundary
	.section	.text.h264bsdValidParamSets,"ax",@progbits
	.align	2
	.globl	h264bsdValidParamSets
	.hidden	h264bsdValidParamSets
	.type	h264bsdValidParamSets, @function
h264bsdValidParamSets:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	sw	a0,0(sp)
	addi	s1,a0,148
	addi	s0,a0,1172
.L132:
	lw	a5,0(s1)
	addi	s1,s1,4
	mv	a0,a5
	beq	a5,zero,.L130
	lw	a5,4(a5)
	lw	a4,0(sp)
	addi	a5,a5,4
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,4(a5)
	beq	a5,zero,.L130
	lw	a2,56(a5)
	lw	a1,52(a5)
	call	CheckPps.isra.0
	beq	a0,zero,.L129
.L130:
	bne	s0,s1,.L132
	li	a0,1
.L129:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	h264bsdValidParamSets, .-h264bsdValidParamSets
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
