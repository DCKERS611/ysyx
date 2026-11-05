#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"h264bsd_decoder.c"
	.option nopic
	.text
	.section	.text.h264bsdInit,"ax",@progbits
	.align	2
	.globl	h264bsdInit
	.hidden	h264bsdInit
	.type	h264bsdInit, @function
h264bsdInit:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	li	s0,4096
	mv	s1,a0
	sw	a1,0(sp)
	call	h264bsdInitStorage
	addi	a0,s0,-1984
	call	malloc
	add	s0,s1,s0
	sw	a0,-720(s0)
	beq	a0,zero,.L3
	lw	a5,0(sp)
	li	a0,0
	beq	a5,zero,.L1
	li	a4,1
	sw	a4,1216(s1)
.L1:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L3:
	li	a0,1
	j	.L1
	.size	h264bsdInit, .-h264bsdInit
	.section	.text.h264bsdDecode,"ax",@progbits
	.align	2
	.globl	h264bsdDecode
	.hidden	h264bsdDecode
	.type	h264bsdDecode, @function
h264bsdDecode:
	li	a5,4096
	addi	sp,sp,-168
	add	a5,a0,a5
	sw	s0,160(sp)
	mv	s0,a0
	lw	a0,-752(a5)
	sw	s1,156(sp)
	sw	ra,164(sp)
	sw	zero,32(sp)
	sw	a3,16(sp)
	sw	a4,8(sp)
	mv	s1,a1
	mv	a1,a2
	beq	a0,zero,.L9
	lw	a4,-748(a5)
	beq	a4,s1,.L76
.L9:
	lw	a3,8(sp)
	addi	t0,sp,44
	mv	a2,t0
	mv	a0,s1
	sw	t0,12(sp)
	call	h264bsdExtractNalUnit
	lw	t0,12(sp)
	bne	a0,zero,.L13
	lw	a4,44(sp)
	li	a5,4096
	add	a5,s0,a5
	sw	a4,-740(a5)
	lw	a4,48(sp)
	sw	a4,-736(a5)
	lw	a4,52(sp)
	sw	a4,-732(a5)
	lw	a4,56(sp)
	sw	a4,-728(a5)
	lw	a4,60(sp)
	sw	a4,-724(a5)
	lw	a4,8(sp)
	lw	a4,0(a4)
	sw	s1,-748(a5)
	sw	a4,-744(a5)
.L10:
	li	s1,4096
	add	s1,s0,s1
	sw	zero,-752(s1)
	addi	a1,sp,36
	mv	a0,t0
	sw	t0,12(sp)
	call	h264bsdDecodeNalUnit
	mv	a5,a0
	bne	a0,zero,.L13
	lw	a4,36(sp)
	li	a3,11
	addi	a4,a4,-1
	bleu	a4,a3,.L77
.L8:
	lw	ra,164(sp)
	lw	s0,160(sp)
	lw	s1,156(sp)
	mv	a0,a5
	addi	sp,sp,168
	jr	ra
.L77:
	lw	t0,12(sp)
	sw	a0,20(sp)
	addi	a3,sp,32
	mv	a0,t0
	mv	a2,s0
	addi	a1,sp,36
	call	h264bsdCheckAccessUnitBoundary
	lw	t0,12(sp)
	lw	a5,20(sp)
	bne	a0,zero,.L78
	lw	a4,32(sp)
	beq	a4,zero,.L16
	lw	a4,1184(s0)
	beq	a4,zero,.L17
	lw	a4,16(s0)
	beq	a4,zero,.L17
	lw	a5,-716(s1)
	bne	a5,zero,.L13
	lw	a4,1188(s0)
	addi	s1,s0,1336
	bne	a4,zero,.L18
	addi	a4,s0,1220
	mv	a0,a4
	sw	a5,16(sp)
	sw	a4,12(sp)
	call	h264bsdAllocateDpbImage
	lw	a4,12(sp)
	sw	a0,1336(s0)
	mv	a0,a4
	call	h264bsdInitRefPicList
	li	a2,0
	mv	a1,s1
	mv	a0,s0
	call	h264bsdConceal
	lw	a5,16(sp)
.L19:
	lw	a4,8(sp)
	li	a3,1
	sw	zero,0(a4)
	li	a4,4096
	add	a4,s0,a4
	sw	a3,-752(a4)
	addi	a4,s0,1368
	sw	a4,8(sp)
.L20:
	lw	a1,1212(s0)
	sw	a5,1180(s0)
	mv	a0,s1
	call	h264bsdFilterPicture
	mv	a0,s0
	call	h264bsdResetStorage
	lw	a1,16(s0)
	lw	a2,8(sp)
	addi	a3,s0,1360
	addi	a0,s0,1284
	call	h264bsdDecodePicOrderCnt
	lw	a5,1188(s0)
	mv	a4,a0
	beq	a5,zero,.L44
	lw	a5,1360(s0)
	lw	a1,1208(s0)
	lw	t0,1204(s0)
	lw	a2,1364(s0)
	lw	a3,1380(s0)
	addi	a5,a5,-5
	sw	t0,4(sp)
	sw	a1,0(sp)
	addi	a0,s0,1220
	seqz	a5,a5
	beq	a2,zero,.L45
	mv	a2,s1
	addi	a1,s0,1644
	call	h264bsdMarkDecRefPic
.L44:
	sw	zero,1184(s0)
	sw	zero,1188(s0)
	li	a5,1
	j	.L8
.L76:
	lw	a4,-740(a5)
	lw	a3,-728(a5)
	lw	a5,-744(a5)
	sw	a4,44(sp)
	sw	a4,48(sp)
	lw	a4,8(sp)
	sw	a3,56(sp)
	sw	zero,52(sp)
	sw	zero,60(sp)
	sw	a5,0(a4)
	addi	t0,sp,44
	j	.L10
.L78:
	li	a5,65536
	addi	a5,a5,-16
	beq	a0,a5,.L34
.L13:
	lw	ra,164(sp)
	lw	s0,160(sp)
	li	a5,3
	lw	s1,156(sp)
	mv	a0,a5
	addi	sp,sp,168
	jr	ra
.L81:
	sw	a5,20(sp)
	lw	a5,16(sp)
	mv	a0,t0
	addi	a1,sp,28
	sw	a5,1208(s0)
	sw	zero,1204(s0)
	sw	t0,12(sp)
	call	h264bsdCheckPpsId
	lw	a2,36(sp)
	lw	a5,8(s0)
	lw	a1,28(sp)
	addi	a2,a2,-5
	mv	a0,s0
	seqz	a2,a2
	sw	a5,16(sp)
	call	h264bsdActivateParamSets
	lw	t0,12(sp)
	lw	a5,20(sp)
	beq	a0,zero,.L33
	li	a5,256
	sw	a5,4(s0)
	li	a5,32
	sw	a5,8(s0)
	li	a5,4096
	add	a5,s0,a5
	sw	zero,12(s0)
	sw	zero,16(s0)
	li	a4,65536
	sw	zero,-716(a5)
	addi	a4,a4,-1
	li	a5,5
	beq	a0,a4,.L8
.L34:
	li	a5,4
	j	.L8
.L17:
	lw	a4,36(sp)
	sw	zero,1188(s0)
	sw	zero,1180(s0)
	li	a3,7
	beq	a4,a3,.L21
	bgtu	a4,a3,.L28
	andi	a4,a4,-5
	li	a3,1
	beq	a4,a3,.L23
.L24:
	li	a5,0
	j	.L8
.L16:
	lw	a4,36(sp)
	li	a3,7
	beq	a4,a3,.L21
	bleu	a4,a3,.L79
.L28:
	li	a5,8
	bne	a4,a5,.L24
	addi	a1,sp,64
	mv	a0,t0
	call	h264bsdDecodePicParamSet
	bne	a0,zero,.L80
	sw	a0,8(sp)
	addi	a1,sp,64
	mv	a0,s0
	call	h264bsdStorePicParamSet
	lw	a5,8(sp)
	j	.L8
.L79:
	andi	a4,a4,-5
	li	a3,1
	bne	a4,a3,.L24
	lw	a4,1180(s0)
	bne	a4,zero,.L8
.L23:
	li	s1,1
	sw	s1,1184(s0)
	mv	a0,s0
	sw	t0,20(sp)
	sw	a5,12(sp)
	call	h264bsdIsStartOfPicture
	lw	a5,12(sp)
	lw	t0,20(sp)
	bne	a0,zero,.L81
.L32:
	li	a4,4096
	add	s1,s0,a4
	lw	a3,-716(s1)
	sw	a5,8(sp)
	bne	a3,zero,.L13
	lw	a3,12(s0)
	lw	a2,16(s0)
	addi	a1,a4,-1740
	add	a1,s0,a1
	addi	a4,sp,36
	mv	a0,t0
	sw	t0,12(sp)
	call	h264bsdDecodeSliceHeader
	bne	a0,zero,.L13
	mv	a0,s0
	call	h264bsdIsStartOfPicture
	lw	t0,12(sp)
	lw	a5,8(sp)
	addi	t1,s0,1220
	beq	a0,zero,.L39
	lw	a3,36(sp)
	li	a4,5
	beq	a3,a4,.L41
	lw	a4,16(s0)
	lw	a2,40(sp)
	lw	a1,-1728(s1)
	lw	a3,48(a4)
	mv	a0,t1
	snez	a2,a2
	sw	t0,16(sp)
	sw	a5,12(sp)
	sw	t1,8(sp)
	call	h264bsdCheckGapsInFrameNum
	lw	t1,8(sp)
	lw	a5,12(sp)
	lw	t0,16(sp)
	bne	a0,zero,.L13
.L41:
	mv	a0,t1
	sw	t0,16(sp)
	sw	a5,12(sp)
	sw	t1,8(sp)
	call	h264bsdAllocateDpbImage
	lw	t1,8(sp)
	lw	a5,12(sp)
	lw	t0,16(sp)
	sw	a0,1336(s0)
.L39:
	li	a2,4096
	addi	a4,s0,1368
	add	a2,s0,a2
	mv	a3,a4
	sw	a4,8(sp)
	sw	a5,12(sp)
	addi	a4,a2,-1740
	addi	a2,a2,-756
.L42:
	lw	s1,4(a4)
	lw	ra,8(a4)
	lw	t2,12(a4)
	lw	a0,16(a4)
	lw	a1,20(a4)
	lw	a5,0(a4)
	sw	s1,4(a3)
	sw	ra,8(a3)
	sw	a5,0(a3)
	sw	t2,12(a3)
	sw	a0,16(a3)
	sw	a1,20(a3)
	addi	a4,a4,24
	addi	a3,a3,24
	bne	a4,a2,.L42
	lw	a5,12(sp)
	lw	a1,0(a4)
	sw	t1,16(sp)
	sw	a5,24(sp)
	sw	t0,20(sp)
	lw	a2,36(sp)
	lw	a4,40(sp)
	sw	a1,0(a3)
	lw	a1,1432(s0)
	li	a3,1
	sw	a3,1188(s0)
	sw	a2,1360(s0)
	sw	a4,1364(s0)
	mv	a0,s0
	call	h264bsdComputeSliceGroupMap
	lw	t1,16(sp)
	mv	a0,t1
	sw	t1,12(sp)
	call	h264bsdInitRefPicList
	lw	t1,12(sp)
	lw	a3,1412(s0)
	lw	a2,1380(s0)
	addi	a1,s0,1436
	mv	a0,t1
	call	h264bsdReorderRefPicList
	bne	a0,zero,.L13
	lw	t0,20(sp)
	lw	a3,8(sp)
	addi	s1,s0,1336
	mv	a2,s1
	mv	a1,s0
	mv	a0,t0
	call	h264bsdDecodeSliceData
	lw	a5,24(sp)
	bne	a0,zero,.L82
	mv	a0,s0
	sw	a5,12(sp)
	call	h264bsdIsEndOfPicture
	lw	a5,12(sp)
	beq	a0,zero,.L8
	li	a5,1
	j	.L20
.L21:
	addi	a1,sp,64
	mv	a0,t0
	call	h264bsdDecodeSeqParamSet
	bne	a0,zero,.L83
	sw	a0,8(sp)
	addi	a1,sp,64
	mv	a0,s0
	call	h264bsdStoreSeqParamSet
	lw	a5,8(sp)
	j	.L8
.L80:
	lw	a0,84(sp)
	li	a5,3
	sw	a5,8(sp)
	call	free
	lw	a0,88(sp)
	sw	zero,84(sp)
	call	free
	lw	a0,92(sp)
	sw	zero,88(sp)
	call	free
	lw	a0,108(sp)
	sw	zero,92(sp)
	call	free
	lw	a5,8(sp)
	j	.L8
.L45:
	mv	a2,s1
	li	a1,0
	call	h264bsdMarkDecRefPic
	j	.L44
.L18:
	lw	a2,1372(s0)
	mv	a1,s1
	mv	a0,s0
	sw	a5,12(sp)
	call	h264bsdConceal
	lw	a5,12(sp)
	j	.L19
.L83:
	lw	a0,104(sp)
	li	a5,3
	sw	a5,8(sp)
	call	free
	lw	a0,148(sp)
	sw	zero,104(sp)
	call	free
	lw	a5,8(sp)
	j	.L8
.L33:
	lw	a4,8(s0)
	lw	a3,16(sp)
	beq	a4,a3,.L32
	lw	a5,0(s0)
	sw	s1,64(sp)
	li	a4,31
	lw	s1,16(s0)
	li	t2,0
	bgtu	a5,a4,.L35
	addi	a5,a5,4
	slli	a5,a5,2
	add	a5,s0,a5
	lw	t2,4(a5)
.L35:
	lw	a5,8(sp)
	lw	a4,36(sp)
	li	a3,1
	sw	zero,0(a5)
	li	a5,4096
	add	a5,s0,a5
	sw	a3,-752(a5)
	li	a5,5
	beq	a4,a5,.L36
.L38:
	sw	zero,1280(s0)
.L37:
	lw	a4,8(s0)
	li	a5,2
	sw	a4,0(s0)
	j	.L8
.L36:
	lw	a3,12(s0)
	li	a4,5
	mv	a2,s1
	mv	a1,t0
	addi	a0,sp,64
	sw	t2,8(sp)
	call	h264bsdCheckPriorPicsFlag
	lw	a5,64(sp)
	or	a5,a0,a5
	bne	a5,zero,.L38
	lw	a5,1276(s0)
	bne	a5,zero,.L38
	lw	t2,8(sp)
	beq	t2,zero,.L38
	lw	a4,52(t2)
	lw	a5,52(s1)
	bne	a4,a5,.L38
	lw	a4,56(t2)
	lw	a5,56(s1)
	bne	a4,a5,.L38
	lw	a4,88(t2)
	lw	a5,88(s1)
	bne	a4,a5,.L38
	addi	a0,s0,1220
	call	h264bsdFlushDpb
	j	.L37
.L82:
	lw	a1,1368(s0)
	li	a5,3
	mv	a0,s0
	sw	a5,8(sp)
	call	h264bsdMarkSliceCorrupted
	lw	a5,8(sp)
	j	.L8
	.size	h264bsdDecode, .-h264bsdDecode
	.section	.text.h264bsdShutdown,"ax",@progbits
	.align	2
	.globl	h264bsdShutdown
	.hidden	h264bsdShutdown
	.type	h264bsdShutdown, @function
h264bsdShutdown:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	sw	a0,0(sp)
	addi	s1,a0,20
	addi	s0,a0,148
.L86:
	lw	a4,0(s1)
	beq	a4,zero,.L85
	lw	a0,40(a4)
	call	free
	lw	a4,0(s1)
	lw	a0,84(a4)
	sw	zero,40(a4)
	call	free
	lw	a0,0(s1)
	sw	zero,84(a0)
	call	free
	sw	zero,0(s1)
.L85:
	addi	s1,s1,4
	bne	s1,s0,.L86
	lw	a5,0(sp)
	addi	s0,a5,1172
.L88:
	lw	a4,0(s1)
	beq	a4,zero,.L87
	lw	a0,20(a4)
	call	free
	lw	a4,0(s1)
	lw	a0,24(a4)
	sw	zero,20(a4)
	call	free
	lw	a4,0(s1)
	lw	a0,28(a4)
	sw	zero,24(a4)
	call	free
	lw	a4,0(s1)
	lw	a0,44(a4)
	sw	zero,28(a4)
	call	free
	lw	a0,0(s1)
	sw	zero,44(a0)
	call	free
	sw	zero,0(s1)
.L87:
	addi	s1,s1,4
	bne	s1,s0,.L88
	lw	s1,0(sp)
	li	s0,4096
	add	s0,s1,s0
	lw	a0,-720(s0)
	call	free
	lw	a0,1212(s1)
	sw	zero,-720(s0)
	call	free
	lw	a0,1172(s1)
	sw	zero,1212(s1)
	call	free
	lw	a0,-708(s0)
	sw	zero,1172(s1)
	beq	a0,zero,.L89
	call	free
	sw	zero,-708(s0)
.L89:
	lw	a5,0(sp)
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	a0,a5,1220
	addi	sp,sp,16
	tail	h264bsdFreeDpb
	.size	h264bsdShutdown, .-h264bsdShutdown
	.section	.text.h264bsdNextOutputPicture,"ax",@progbits
	.align	2
	.globl	h264bsdNextOutputPicture
	.hidden	h264bsdNextOutputPicture
	.type	h264bsdNextOutputPicture, @function
h264bsdNextOutputPicture:
	addi	sp,sp,-16
	addi	a0,a0,1220
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s1,a1
	mv	s0,a2
	sw	a3,0(sp)
	call	h264bsdDpbOutputPicture
	beq	a0,zero,.L102
	lw	a5,4(a0)
	lw	a4,0(sp)
	sw	a5,0(s1)
	lw	a5,12(a0)
	sw	a5,0(s0)
	lw	a5,8(a0)
	lw	a0,0(a0)
	sw	a5,0(a4)
.L102:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	h264bsdNextOutputPicture, .-h264bsdNextOutputPicture
	.section	.text.h264bsdPicWidth,"ax",@progbits
	.align	2
	.globl	h264bsdPicWidth
	.hidden	h264bsdPicWidth
	.type	h264bsdPicWidth, @function
h264bsdPicWidth:
	lw	a5,16(a0)
	beq	a5,zero,.L110
	lw	a0,52(a5)
	ret
.L110:
	li	a0,0
	ret
	.size	h264bsdPicWidth, .-h264bsdPicWidth
	.section	.text.h264bsdPicHeight,"ax",@progbits
	.align	2
	.globl	h264bsdPicHeight
	.hidden	h264bsdPicHeight
	.type	h264bsdPicHeight, @function
h264bsdPicHeight:
	lw	a5,16(a0)
	beq	a5,zero,.L113
	lw	a0,56(a5)
	ret
.L113:
	li	a0,0
	ret
	.size	h264bsdPicHeight, .-h264bsdPicHeight
	.section	.text.h264bsdFlushBuffer,"ax",@progbits
	.align	2
	.globl	h264bsdFlushBuffer
	.hidden	h264bsdFlushBuffer
	.type	h264bsdFlushBuffer, @function
h264bsdFlushBuffer:
	addi	a0,a0,1220
	tail	h264bsdFlushDpb
	.size	h264bsdFlushBuffer, .-h264bsdFlushBuffer
	.section	.text.h264bsdCheckValidParamSets,"ax",@progbits
	.align	2
	.globl	h264bsdCheckValidParamSets
	.hidden	h264bsdCheckValidParamSets
	.type	h264bsdCheckValidParamSets, @function
h264bsdCheckValidParamSets:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	h264bsdValidParamSets
	lw	ra,8(sp)
	seqz	a0,a0
	addi	sp,sp,12
	jr	ra
	.size	h264bsdCheckValidParamSets, .-h264bsdCheckValidParamSets
	.section	.text.h264bsdVideoRange,"ax",@progbits
	.align	2
	.globl	h264bsdVideoRange
	.hidden	h264bsdVideoRange
	.type	h264bsdVideoRange, @function
h264bsdVideoRange:
	lw	a5,16(a0)
	beq	a5,zero,.L120
	lw	a0,80(a5)
	beq	a0,zero,.L117
	lw	a5,84(a5)
	beq	a5,zero,.L120
	lw	a0,24(a5)
	beq	a0,zero,.L117
	lw	a0,32(a5)
	snez	a0,a0
	ret
.L120:
	li	a0,0
.L117:
	ret
	.size	h264bsdVideoRange, .-h264bsdVideoRange
	.section	.text.h264bsdMatrixCoefficients,"ax",@progbits
	.align	2
	.globl	h264bsdMatrixCoefficients
	.hidden	h264bsdMatrixCoefficients
	.type	h264bsdMatrixCoefficients, @function
h264bsdMatrixCoefficients:
	lw	a5,16(a0)
	beq	a5,zero,.L129
	lw	a4,80(a5)
	li	a0,2
	beq	a4,zero,.L127
	lw	a5,84(a5)
	beq	a5,zero,.L127
	lw	a4,24(a5)
	beq	a4,zero,.L127
	lw	a4,36(a5)
	beq	a4,zero,.L127
	lw	a0,48(a5)
	ret
.L129:
	li	a0,2
.L127:
	ret
	.size	h264bsdMatrixCoefficients, .-h264bsdMatrixCoefficients
	.section	.text.h264bsdCroppingParams,"ax",@progbits
	.align	2
	.globl	h264bsdCroppingParams
	.hidden	h264bsdCroppingParams
	.type	h264bsdCroppingParams, @function
h264bsdCroppingParams:
	lw	a0,16(a0)
	beq	a0,zero,.L138
	lw	t1,60(a0)
	bne	t1,zero,.L146
.L138:
	sw	zero,0(a1)
	sw	zero,0(a2)
	sw	zero,0(a3)
	sw	zero,0(a4)
	li	a4,0
	sw	a4,0(a5)
	ret
.L146:
	li	t1,1
	sw	t1,0(a1)
	lw	a1,64(a0)
	slli	a1,a1,1
	sw	a1,0(a2)
	lw	a2,52(a0)
	lw	t1,64(a0)
	lw	a1,68(a0)
	slli	a2,a2,3
	sub	a2,a2,t1
	sub	a2,a2,a1
	slli	a2,a2,1
	sw	a2,0(a3)
	lw	a3,72(a0)
	slli	a3,a3,1
	sw	a3,0(a4)
	lw	a4,56(a0)
	lw	a2,72(a0)
	lw	a3,76(a0)
	slli	a4,a4,3
	sub	a4,a4,a2
	sub	a4,a4,a3
	slli	a4,a4,1
	sw	a4,0(a5)
	ret
	.size	h264bsdCroppingParams, .-h264bsdCroppingParams
	.section	.text.h264bsdSampleAspectRatio,"ax",@progbits
	.align	2
	.globl	h264bsdSampleAspectRatio
	.hidden	h264bsdSampleAspectRatio
	.type	h264bsdSampleAspectRatio, @function
h264bsdSampleAspectRatio:
	lw	a5,16(a0)
	beq	a5,zero,.L167
	lw	a4,80(a5)
	beq	a4,zero,.L167
	lw	a3,84(a5)
	beq	a3,zero,.L167
	lw	a5,0(a3)
	beq	a5,zero,.L167
	lw	a5,4(a3)
	li	a4,13
	bgtu	a5,a4,.L149
	beq	a5,zero,.L168
	bgtu	a5,a4,.L167
	lla	a3,.L152
	slli	a4,a5,2
	add	a4,a4,a3
	lw	a4,0(a4)
	add	a4,a4,a3
	jr	a4
	.section	.rodata.h264bsdSampleAspectRatio,"a",@progbits
	.align	2
	.align	2
.L152:
	.word	.L167-.L152
	.word	.L167-.L152
	.word	.L169-.L152
	.word	.L162-.L152
	.word	.L161-.L152
	.word	.L160-.L152
	.word	.L159-.L152
	.word	.L158-.L152
	.word	.L157-.L152
	.word	.L156-.L152
	.word	.L155-.L152
	.word	.L154-.L152
	.word	.L153-.L152
	.word	.L151-.L152
	.section	.text.h264bsdSampleAspectRatio
.L167:
	li	a5,1
	li	a4,1
.L148:
	sw	a4,0(a1)
	sw	a5,0(a2)
	ret
.L149:
	li	a4,255
	bne	a5,a4,.L172
	lw	a4,8(a3)
	li	a5,0
	beq	a4,zero,.L148
	lw	a5,12(a3)
	snez	a3,a5
	neg	a3,a3
	and	a4,a4,a3
	j	.L148
.L169:
	li	a5,11
	li	a4,12
	j	.L148
.L151:
	li	a5,99
	li	a4,160
	j	.L148
.L153:
	li	a5,33
	li	a4,64
	j	.L148
.L154:
	li	a4,15
	j	.L148
.L155:
	li	a5,11
	li	a4,18
	j	.L148
.L156:
	li	a5,33
	li	a4,80
	j	.L148
.L157:
	li	a5,11
	li	a4,32
	j	.L148
.L158:
	li	a5,11
	li	a4,20
	j	.L148
.L159:
	li	a5,11
	li	a4,24
	j	.L148
.L160:
	li	a5,33
	li	a4,40
	j	.L148
.L161:
	li	a5,11
	li	a4,16
	j	.L148
.L162:
	li	a5,11
	li	a4,10
	j	.L148
.L172:
	li	a5,0
	li	a4,0
	j	.L148
.L168:
	li	a4,0
	j	.L148
	.size	h264bsdSampleAspectRatio, .-h264bsdSampleAspectRatio
	.section	.text.h264bsdProfile,"ax",@progbits
	.align	2
	.globl	h264bsdProfile
	.hidden	h264bsdProfile
	.type	h264bsdProfile, @function
h264bsdProfile:
	lw	a5,16(a0)
	beq	a5,zero,.L175
	lw	a0,0(a5)
	ret
.L175:
	li	a0,0
	ret
	.size	h264bsdProfile, .-h264bsdProfile
	.section	.text.h264bsdAlloc,"ax",@progbits
	.align	2
	.globl	h264bsdAlloc
	.hidden	h264bsdAlloc
	.type	h264bsdAlloc, @function
h264bsdAlloc:
	li	a0,4096
	addi	a0,a0,-700
	tail	malloc
	.size	h264bsdAlloc, .-h264bsdAlloc
	.section	.text.h264bsdFree,"ax",@progbits
	.align	2
	.globl	h264bsdFree
	.hidden	h264bsdFree
	.type	h264bsdFree, @function
h264bsdFree:
	tail	free
	.size	h264bsdFree, .-h264bsdFree
	.globl	__mulsi3
	.section	.text.h264bsdConvertToRGBA,"ax",@progbits
	.align	2
	.globl	h264bsdConvertToRGBA
	.hidden	h264bsdConvertToRGBA
	.type	h264bsdConvertToRGBA, @function
h264bsdConvertToRGBA:
	addi	sp,sp,-36
	sw	ra,32(sp)
	sw	s0,28(sp)
	sw	s1,24(sp)
	mv	s0,a2
	sw	a1,8(sp)
	mv	s1,a3
	sw	a0,12(sp)
	call	__mulsi3
	lw	a4,12(sp)
	lw	a1,8(sp)
	mv	a3,a0
	srli	a5,a4,31
	add	a5,a5,a4
	srai	a5,a5,1
	mv	a0,a5
	sw	a5,20(sp)
	sw	a3,0(sp)
	call	__mulsi3
	lw	a3,0(sp)
	srli	a4,a0,31
	add	a4,a4,a0
	srai	a4,a4,1
	add	a4,a4,a3
	lw	a5,8(sp)
	add	a3,s0,a3
	add	a4,s0,a4
	sw	a3,0(sp)
	sw	a4,4(sp)
	ble	a5,zero,.L178
	li	a4,65536
	addi	a5,a4,-256
	sw	a5,16(sp)
	lw	a5,20(sp)
	li	a2,0
	li	a3,0
	neg	a5,a5
	sw	a5,20(sp)
	j	.L188
.L194:
	li	a1,255
.L181:
	slli	t2,a5,1
	add	t2,t2,a5
	slli	a4,t1,1
	slli	t2,t2,3
	add	t0,a4,t1
	add	a5,t2,a5
	slli	t0,t0,2
	slli	a5,a5,2
	add	t0,t0,t1
	slli	t0,t0,4
	sub	a5,a0,a5
	sub	a5,a5,t0
	lw	t0,16(sp)
	addi	a5,a5,128
	srai	a5,a5,8
	add	a1,a1,t0
	li	t0,255
	slli	a1,a1,8
	ble	a5,t0,.L182
	li	a5,255
.L183:
	add	a4,a4,t1
	slli	t0,a4,4
	add	a4,a4,t0
	slli	a4,a4,3
	add	a4,a4,t1
	add	a4,a4,a0
	addi	a4,a4,128
	add	a5,a5,a1
	srai	a4,a4,8
	li	a1,255
	slli	a5,a5,8
	ble	a4,a1,.L184
	li	a4,255
.L185:
	add	a4,a4,a5
	addi	a3,a3,1
	sw	a4,0(s1)
	andi	a5,a3,1
	addi	s1,s1,4
	addi	s0,s0,1
	bne	a5,zero,.L186
	lw	a5,0(sp)
	addi	a5,a5,1
	sw	a5,0(sp)
	lw	a5,4(sp)
	addi	a5,a5,1
	sw	a5,4(sp)
.L186:
	lw	a5,12(sp)
	bgt	a5,a3,.L187
	addi	a2,a2,1
	andi	a3,a2,1
	beq	a3,zero,.L187
	lw	a4,0(sp)
	lw	a5,20(sp)
	li	a3,0
	add	a4,a4,a5
	sw	a4,0(sp)
	lw	a4,4(sp)
	add	a5,a4,a5
	sw	a5,4(sp)
.L187:
	lw	a5,8(sp)
	bge	a2,a5,.L178
.L188:
	lw	a5,0(sp)
	lbu	a4,0(s0)
	lw	a1,4(sp)
	lbu	a5,0(a5)
	addi	a4,a4,-16
	slli	t0,a4,3
	add	t0,t0,a4
	addi	a5,a5,-128
	lbu	t1,0(a1)
	slli	a0,t0,5
	slli	a1,a5,7
	add	a0,t0,a0
	add	a1,a1,a5
	add	a0,a0,a4
	slli	a1,a1,2
	add	a1,a1,a0
	addi	a1,a1,128
	srai	a1,a1,8
	li	a4,255
	addi	t1,t1,-128
	bgt	a1,a4,.L194
	not	a4,a1
	srai	a4,a4,31
	and	a1,a1,a4
	j	.L181
.L184:
	not	a1,a4
	srai	a1,a1,31
	and	a4,a4,a1
	j	.L185
.L182:
	not	t0,a5
	srai	t0,t0,31
	and	a5,a5,t0
	j	.L183
.L178:
	lw	ra,32(sp)
	lw	s0,28(sp)
	lw	s1,24(sp)
	addi	sp,sp,36
	jr	ra
	.size	h264bsdConvertToRGBA, .-h264bsdConvertToRGBA
	.section	.text.h264bsdNextOutputPictureRGBA,"ax",@progbits
	.align	2
	.globl	h264bsdNextOutputPictureRGBA
	.hidden	h264bsdNextOutputPictureRGBA
	.type	h264bsdNextOutputPictureRGBA, @function
h264bsdNextOutputPictureRGBA:
	lw	a4,16(a0)
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	a1,4(sp)
	sw	a2,8(sp)
	sw	a3,12(sp)
	mv	a5,a0
	beq	a4,zero,.L202
	lw	s0,52(a4)
	lw	s1,56(a4)
	addi	a0,a5,1220
	sw	a5,0(sp)
	call	h264bsdDpbOutputPicture
	lw	a5,0(sp)
	slli	s0,s0,4
	slli	s1,s1,4
	mv	a4,a0
	beq	a0,zero,.L199
.L197:
	lw	a3,4(a0)
	sw	a5,0(sp)
	lw	a5,4(sp)
	lw	a2,0(a0)
	mv	a1,s0
	sw	a3,0(a5)
	lw	a3,12(a0)
	lw	a5,8(sp)
	mv	a0,s1
	sw	a2,16(sp)
	sw	a3,0(a5)
	lw	a4,8(a4)
	lw	a5,12(sp)
	sw	a4,0(a5)
	call	__mulsi3
	lw	a2,16(sp)
	slli	a1,a0,2
	beq	a2,zero,.L199
	lw	a5,0(sp)
	li	a4,4096
	add	a4,a5,a4
	lw	a0,-704(a4)
	lw	a3,-708(a4)
	bgeu	a0,a1,.L200
	beq	a3,zero,.L201
	mv	a0,a3
	sw	a5,8(sp)
	sw	a2,4(sp)
	sw	a1,0(sp)
	call	free
	lw	a5,8(sp)
	lw	a2,4(sp)
	lw	a1,0(sp)
.L201:
	li	a4,4096
	add	a5,a5,a4
	sw	a1,-704(a5)
	mv	a0,a1
	sw	a2,4(sp)
	sw	a5,0(sp)
	call	malloc
	lw	a5,0(sp)
	lw	a2,4(sp)
	mv	a3,a0
	sw	a0,-708(a5)
.L200:
	mv	a0,s0
	mv	a1,s1
	sw	a3,0(sp)
	call	h264bsdConvertToRGBA
	lw	a3,0(sp)
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	mv	a0,a3
	addi	sp,sp,32
	jr	ra
.L202:
	addi	a0,a5,1220
	sw	a5,0(sp)
	call	h264bsdDpbOutputPicture
	lw	a5,0(sp)
	li	s1,0
	li	s0,0
	mv	a4,a0
	bne	a0,zero,.L197
.L199:
	lw	ra,28(sp)
	lw	s0,24(sp)
	li	a3,0
	lw	s1,20(sp)
	mv	a0,a3
	addi	sp,sp,32
	jr	ra
	.size	h264bsdNextOutputPictureRGBA, .-h264bsdNextOutputPictureRGBA
	.section	.text.h264bsdConvertToBGRA,"ax",@progbits
	.align	2
	.globl	h264bsdConvertToBGRA
	.hidden	h264bsdConvertToBGRA
	.type	h264bsdConvertToBGRA, @function
h264bsdConvertToBGRA:
	addi	sp,sp,-40
	sw	ra,36(sp)
	sw	s0,32(sp)
	sw	s1,28(sp)
	mv	s0,a2
	sw	a1,12(sp)
	mv	s1,a3
	sw	a0,16(sp)
	call	__mulsi3
	lw	a4,16(sp)
	lw	a1,12(sp)
	mv	a3,a0
	srli	a5,a4,31
	add	a5,a5,a4
	srai	a5,a5,1
	mv	a0,a5
	sw	a5,8(sp)
	sw	a3,0(sp)
	call	__mulsi3
	lw	a3,0(sp)
	srli	a4,a0,31
	add	a4,a4,a0
	srai	a4,a4,1
	add	a4,a4,a3
	lw	a5,12(sp)
	add	a3,s0,a3
	add	a4,s0,a4
	sw	a3,0(sp)
	sw	a4,4(sp)
	ble	a5,zero,.L210
	li	a4,65536
	addi	a5,a4,-256
	sw	a5,20(sp)
	lw	a5,8(sp)
	li	a2,0
	li	t2,0
	neg	a5,a5
	sw	a5,24(sp)
	j	.L220
.L226:
	li	t1,255
.L213:
	slli	a5,a1,1
	add	a5,a5,a1
	slli	a5,a5,3
	add	a4,a4,a0
	add	a5,a5,a1
	slli	a4,a4,2
	slli	a5,a5,2
	add	a4,a4,a0
	slli	a4,a4,4
	sub	a5,a3,a5
	sub	a5,a5,a4
	lw	a4,20(sp)
	addi	a5,a5,128
	srai	a5,a5,8
	add	t1,t1,a4
	li	a4,255
	slli	t1,t1,8
	ble	a5,a4,.L214
	li	a5,255
.L215:
	slli	a4,a1,7
	add	a4,a4,a1
	slli	a4,a4,2
	add	a4,a4,a3
	addi	a4,a4,128
	add	a5,a5,t1
	srai	a4,a4,8
	li	a3,255
	slli	a5,a5,8
	ble	a4,a3,.L216
	li	a4,255
.L217:
	add	a4,a4,a5
	addi	t2,t2,1
	sw	a4,0(s1)
	andi	a5,t2,1
	addi	s1,s1,4
	addi	s0,s0,1
	bne	a5,zero,.L218
	lw	a5,0(sp)
	addi	a5,a5,1
	sw	a5,0(sp)
	lw	a5,4(sp)
	addi	a5,a5,1
	sw	a5,4(sp)
.L218:
	lw	a5,16(sp)
	bgt	a5,t2,.L219
	addi	a2,a2,1
	andi	t2,a2,1
	beq	t2,zero,.L219
	lw	a4,0(sp)
	lw	a5,24(sp)
	li	t2,0
	add	a4,a4,a5
	sw	a4,0(sp)
	lw	a4,4(sp)
	add	a5,a4,a5
	sw	a5,4(sp)
.L219:
	lw	a5,12(sp)
	bge	a2,a5,.L210
.L220:
	lw	a5,4(sp)
	lbu	t1,0(s0)
	lbu	a0,0(a5)
	lw	a5,0(sp)
	addi	t1,t1,-16
	addi	a0,a0,-128
	lbu	a5,0(a5)
	slli	a4,a0,1
	slli	t0,t1,3
	sw	a5,8(sp)
	add	a5,a4,a0
	add	t0,t0,t1
	slli	a3,a5,4
	slli	a1,t0,5
	add	a5,a5,a3
	slli	a5,a5,3
	add	a3,t0,a1
	add	a5,a5,a0
	add	a3,a3,t1
	add	t1,a5,a3
	lw	a5,8(sp)
	addi	t1,t1,128
	srai	t1,t1,8
	addi	a1,a5,-128
	li	a5,255
	bgt	t1,a5,.L226
	not	a5,t1
	srai	a5,a5,31
	and	t1,t1,a5
	j	.L213
.L216:
	not	a3,a4
	srai	a3,a3,31
	and	a4,a4,a3
	j	.L217
.L214:
	not	a4,a5
	srai	a4,a4,31
	and	a5,a5,a4
	j	.L215
.L210:
	lw	ra,36(sp)
	lw	s0,32(sp)
	lw	s1,28(sp)
	addi	sp,sp,40
	jr	ra
	.size	h264bsdConvertToBGRA, .-h264bsdConvertToBGRA
	.section	.text.h264bsdNextOutputPictureBGRA,"ax",@progbits
	.align	2
	.globl	h264bsdNextOutputPictureBGRA
	.hidden	h264bsdNextOutputPictureBGRA
	.type	h264bsdNextOutputPictureBGRA, @function
h264bsdNextOutputPictureBGRA:
	lw	a4,16(a0)
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	a1,4(sp)
	sw	a2,8(sp)
	sw	a3,12(sp)
	mv	a5,a0
	beq	a4,zero,.L234
	lw	s0,52(a4)
	lw	s1,56(a4)
	addi	a0,a5,1220
	sw	a5,0(sp)
	call	h264bsdDpbOutputPicture
	lw	a5,0(sp)
	slli	s0,s0,4
	slli	s1,s1,4
	mv	a4,a0
	beq	a0,zero,.L231
.L229:
	lw	a3,4(a0)
	sw	a5,0(sp)
	lw	a5,4(sp)
	lw	a2,0(a0)
	mv	a1,s0
	sw	a3,0(a5)
	lw	a3,12(a0)
	lw	a5,8(sp)
	mv	a0,s1
	sw	a2,16(sp)
	sw	a3,0(a5)
	lw	a4,8(a4)
	lw	a5,12(sp)
	sw	a4,0(a5)
	call	__mulsi3
	lw	a2,16(sp)
	slli	a1,a0,2
	beq	a2,zero,.L231
	lw	a5,0(sp)
	li	a4,4096
	add	a4,a5,a4
	lw	a0,-704(a4)
	lw	a3,-708(a4)
	bgeu	a0,a1,.L232
	beq	a3,zero,.L233
	mv	a0,a3
	sw	a5,8(sp)
	sw	a2,4(sp)
	sw	a1,0(sp)
	call	free
	lw	a5,8(sp)
	lw	a2,4(sp)
	lw	a1,0(sp)
.L233:
	li	a4,4096
	add	a5,a5,a4
	sw	a1,-704(a5)
	mv	a0,a1
	sw	a2,4(sp)
	sw	a5,0(sp)
	call	malloc
	lw	a5,0(sp)
	lw	a2,4(sp)
	mv	a3,a0
	sw	a0,-708(a5)
.L232:
	mv	a0,s0
	mv	a1,s1
	sw	a3,0(sp)
	call	h264bsdConvertToBGRA
	lw	a3,0(sp)
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	mv	a0,a3
	addi	sp,sp,32
	jr	ra
.L234:
	addi	a0,a5,1220
	sw	a5,0(sp)
	call	h264bsdDpbOutputPicture
	lw	a5,0(sp)
	li	s1,0
	li	s0,0
	mv	a4,a0
	bne	a0,zero,.L229
.L231:
	lw	ra,28(sp)
	lw	s0,24(sp)
	li	a3,0
	lw	s1,20(sp)
	mv	a0,a3
	addi	sp,sp,32
	jr	ra
	.size	h264bsdNextOutputPictureBGRA, .-h264bsdNextOutputPictureBGRA
	.section	.text.h264bsdConvertToYCbCrA,"ax",@progbits
	.align	2
	.globl	h264bsdConvertToYCbCrA
	.hidden	h264bsdConvertToYCbCrA
	.type	h264bsdConvertToYCbCrA, @function
h264bsdConvertToYCbCrA:
	addi	sp,sp,-28
	sw	a2,12(sp)
	sw	a3,8(sp)
	sw	ra,24(sp)
	sw	s0,20(sp)
	sw	s1,16(sp)
	mv	s0,a1
	mv	s1,a0
	sw	a0,0(sp)
	call	__mulsi3
	mv	a5,s1
	srli	s1,s1,31
	add	s1,s1,a5
	srai	s1,s1,1
	mv	a4,a0
	mv	a1,s0
	mv	a0,s1
	sw	a4,4(sp)
	call	__mulsi3
	lw	a4,4(sp)
	srli	a5,a0,31
	lw	a2,12(sp)
	add	t0,a5,a0
	srai	t0,t0,1
	add	t0,t0,a4
	lw	a3,8(sp)
	add	a0,a2,a4
	add	t0,a2,t0
	ble	s0,zero,.L242
	lbu	a1,0(t0)
	li	a4,65536
	addi	a4,a4,-256
	lbu	a5,0(a0)
	add	a1,a1,a4
	slli	a1,a1,8
	sw	a4,8(sp)
	lbu	a4,0(a2)
	add	a5,a5,a1
	slli	a5,a5,8
	add	a4,a4,a5
	sw	a4,0(a3)
	neg	a4,s1
	addi	a3,a3,4
	addi	a2,a2,1
	li	a1,0
	li	a5,1
	sw	a4,12(sp)
	sw	s0,4(sp)
.L248:
	lw	a4,0(sp)
	bgt	a4,a5,.L245
.L254:
	addi	a1,a1,1
	andi	a5,a1,1
	beq	a5,zero,.L245
	lw	a5,12(sp)
	add	a0,a0,a5
	add	t0,t0,a5
	li	a5,0
.L245:
	lw	a4,4(sp)
	addi	a5,a5,1
	andi	t2,a5,1
	ble	a4,a1,.L242
.L246:
	lbu	s1,0(t0)
	lw	s0,8(sp)
	lbu	a4,0(a0)
	lbu	t1,0(a2)
	add	s1,s1,s0
	slli	s1,s1,8
	add	a4,a4,s1
	slli	a4,a4,8
	add	t1,t1,a4
	sw	t1,0(a3)
	addi	a2,a2,1
	addi	a3,a3,4
	bne	t2,zero,.L248
	lw	a4,0(sp)
	addi	a0,a0,1
	addi	t0,t0,1
	ble	a4,a5,.L254
	lw	a4,4(sp)
	addi	a5,a5,1
	andi	t2,a5,1
	bgt	a4,a1,.L246
.L242:
	lw	ra,24(sp)
	lw	s0,20(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	jr	ra
	.size	h264bsdConvertToYCbCrA, .-h264bsdConvertToYCbCrA
	.section	.text.h264bsdNextOutputPictureYCbCrA,"ax",@progbits
	.align	2
	.globl	h264bsdNextOutputPictureYCbCrA
	.hidden	h264bsdNextOutputPictureYCbCrA
	.type	h264bsdNextOutputPictureYCbCrA, @function
h264bsdNextOutputPictureYCbCrA:
	lw	a4,16(a0)
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	a1,4(sp)
	sw	a2,8(sp)
	sw	a3,12(sp)
	mv	a5,a0
	beq	a4,zero,.L262
	lw	s0,52(a4)
	lw	s1,56(a4)
	addi	a0,a5,1220
	sw	a5,0(sp)
	call	h264bsdDpbOutputPicture
	lw	a5,0(sp)
	slli	s0,s0,4
	slli	s1,s1,4
	mv	a4,a0
	beq	a0,zero,.L259
.L257:
	lw	a3,4(a0)
	sw	a5,0(sp)
	lw	a5,4(sp)
	lw	a2,0(a0)
	mv	a1,s0
	sw	a3,0(a5)
	lw	a3,12(a0)
	lw	a5,8(sp)
	mv	a0,s1
	sw	a2,16(sp)
	sw	a3,0(a5)
	lw	a4,8(a4)
	lw	a5,12(sp)
	sw	a4,0(a5)
	call	__mulsi3
	lw	a2,16(sp)
	slli	a1,a0,2
	beq	a2,zero,.L259
	lw	a5,0(sp)
	li	a4,4096
	add	a4,a5,a4
	lw	a0,-704(a4)
	lw	a3,-708(a4)
	bgeu	a0,a1,.L260
	beq	a3,zero,.L261
	mv	a0,a3
	sw	a5,8(sp)
	sw	a2,4(sp)
	sw	a1,0(sp)
	call	free
	lw	a5,8(sp)
	lw	a2,4(sp)
	lw	a1,0(sp)
.L261:
	li	a4,4096
	add	a5,a5,a4
	sw	a1,-704(a5)
	mv	a0,a1
	sw	a2,4(sp)
	sw	a5,0(sp)
	call	malloc
	lw	a5,0(sp)
	lw	a2,4(sp)
	mv	a3,a0
	sw	a0,-708(a5)
.L260:
	mv	a0,s0
	mv	a1,s1
	sw	a3,0(sp)
	call	h264bsdConvertToYCbCrA
	lw	a3,0(sp)
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	mv	a0,a3
	addi	sp,sp,32
	jr	ra
.L262:
	addi	a0,a5,1220
	sw	a5,0(sp)
	call	h264bsdDpbOutputPicture
	lw	a5,0(sp)
	li	s1,0
	li	s0,0
	mv	a4,a0
	bne	a0,zero,.L257
.L259:
	lw	ra,28(sp)
	lw	s0,24(sp)
	li	a3,0
	lw	s1,20(sp)
	mv	a0,a3
	addi	sp,sp,32
	jr	ra
	.size	h264bsdNextOutputPictureYCbCrA, .-h264bsdNextOutputPictureYCbCrA
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
