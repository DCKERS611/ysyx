#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"cheapocabra.cpp"
	.option nopic
	.text
	.section	.text._ZL11M111FlashIDj,"ax",@progbits
	.align	2
	.type	_ZL11M111FlashIDj, @function
_ZL11M111FlashIDj:
	andi	a5,a0,511
	beq	a5,zero,.L3
	li	a4,1
	li	a0,255
	bne	a5,a4,.L2
	li	a0,183
	ret
.L3:
	li	a0,191
.L2:
	ret
	.size	_ZL11M111FlashIDj, .-_ZL11M111FlashIDj
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	addi	sp,sp,-24
	la a5, .LANCHOR0; lbu a5, 0(a5);
	slli	a4,a5,8
	li	a3,8192
	sw	s1,12(sp)
	srai	s1,a5,4
	andi	a5,a5,15
	and	a4,a4,a3
	sw	a5,8(sp)
	andi	a3,s1,1
	li	a5,16384
	sw	s0,16(sp)
	sw	ra,20(sp)
	sw	a3,4(sp)
	add	a4,a4,a5
	li	s0,0
	lla	s1,.LANCHOR1
.L7:
	lw	a0,0(s1)
	mv	a2,s0
	li	a1,1
	add	a0,a0,a4
	sw	a4,0(sp)
	call	_Z9setntamemPhij
	lw	a4,0(sp)
	addi	s0,s0,1
	li	a5,4
	addi	a4,a4,1024
	bne	s0,a5,.L7
	lw	a1,4(sp)
	li	a0,16
	call	_Z8setchr8rij
	lw	s0,16(sp)
	lw	a2,8(sp)
	lw	ra,20(sp)
	lw	s1,12(sp)
	la a0, .LANCHOR2; lbu a0, 0(a0);
	li	a1,32768
	slli	a0,a0,4
	addi	sp,sp,24
	tail	_Z9setprg32rijj
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	tail	_ZL4Syncv
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M111Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M111Writejh, @function
_ZL9M111Writejh:
	li	a5,-12288
	and	a0,a0,a5
	li	a5,20480
	beq	a0,a5,.L13
	ret
.L13:
	la a5, .LANCHOR0; sb a1, 0(a5);
	tail	_ZL4Syncv
	.size	_ZL9M111Writejh, .-_ZL9M111Writejh
	.section	.text._ZL9M111Closev,"ax",@progbits
	.align	2
	.type	_ZL9M111Closev, @function
_ZL9M111Closev:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a0, .LANCHOR1; lw a0, 0(a0);
	beq	a0,zero,.L15
	call	_Z10FCEU_gfreePv
.L15:
	la a5, .LANCHOR1; sw zero, 0(a5);
	la a0, .LANCHOR3; lw a0, 0(a0);
	beq	a0,zero,.L16
	call	_Z10FCEU_gfreePv
.L16:
	lw	ra,8(sp)
	la a5, .LANCHOR3; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
	.size	_ZL9M111Closev, .-_ZL9M111Closev
	.section	.text._ZL9M111Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M111Powerv, @function
_ZL9M111Powerv:
	addi	sp,sp,-12
	li	a5,-1
	la a4, .LANCHOR0; sb a5, 0(a4);
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_ZL4Syncv
	li	s0,65536
	lla	a2,_Z6CartBRj
	addi	a1,s0,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,24576
	lla	a2,_ZL9M111Writejh
	addi	a1,a1,-1
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,32768
	lla	a2,_ZL9M111Writejh
	addi	a1,a1,-1
	li	a0,28672
	call	_Z15SetWriteHandleriiPFvjhE
	la a5, .LANCHOR2; lbu a5, 0(a5);
	bne	a5,zero,.L27
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L27:
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a5, .LANCHOR4; sb zero, 0(a5);
	la a5, .LANCHOR5; sb zero, 0(a5);
	la a5, .LANCHOR6; sb zero, 0(a5);
	lla	a2,_ZL9M111Flashjh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL9M111Powerv, .-_ZL9M111Powerv
	.section	.text._ZL9M111Flashjh,"ax",@progbits
	.align	2
	.type	_ZL9M111Flashjh, @function
_ZL9M111Flashjh:
	li	a5,-32768
	add	a5,a0,a5
	li	a3,32768
	bgeu	a5,a3,.L54
	la a4, .LANCHOR0; lbu a4, 0(a4);
	lla	t1,.LANCHOR4
	addi	a3,a3,-1
	li	a5,491520
	slli	a4,a4,15
	lbu	a2,0(t1)
	and	a4,a4,a5
	and	a5,a0,a3
	or	a0,a4,a5
	li	a5,2
	and	a3,a0,a3
	beq	a2,a5,.L30
	addi	sp,sp,-12
	sw	ra,8(sp)
	li	a4,3
	beq	a2,a4,.L31
	li	a4,1
	beq	a2,a4,.L32
	li	a5,20480
	addi	a5,a5,1365
	beq	a3,a5,.L58
.L33:
	li	a5,240
	beq	a1,a5,.L59
.L28:
	lw	ra,8(sp)
	addi	sp,sp,12
	jr	ra
.L54:
	ret
.L32:
	lla	a4,.LANCHOR5
	lbu	a0,0(a4)
	bne	a0,zero,.L34
	li	a5,12288
	addi	a5,a5,-1366
	beq	a3,a5,.L60
.L41:
	lw	ra,8(sp)
	la a5, .LANCHOR4; sb zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L31:
	lla	a4,.LANCHOR5
	lbu	a2,0(a4)
	bne	a2,zero,.L43
	li	a5,20480
	addi	a5,a5,1365
	bne	a3,a5,.L41
	li	a5,170
	bne	a1,a5,.L41
.L44:
	li	a5,1
	sb	a5,0(a4)
	j	.L28
.L30:
	la a5, .LANCHOR3; lw a5, 0(a5);
	add	a5,a5,a0
	lbu	a4,0(a5)
	and	a4,a1,a4
	sb	a4,0(a5)
	la a5, .LANCHOR4; sb zero, 0(a5);
	ret
.L43:
	li	t1,1
	beq	a2,t1,.L61
	bne	a2,a5,.L41
	li	a5,20480
	addi	a5,a5,1365
	beq	a3,a5,.L62
.L46:
	li	a5,48
	bne	a1,a5,.L41
	li	a5,520192
	and	a0,a0,a5
	la a5, .LANCHOR3; lw a5, 0(a5);
	li	a2,4096
	li	a1,255
	add	a0,a5,a0
	call	memset
	j	.L41
.L34:
	bne	a0,a2,.L41
	li	a4,20480
	addi	a4,a4,1365
	bne	a3,a4,.L41
	la a4, .LANCHOR5; sb zero, 0(a4);
	li	a4,160
	beq	a1,a4,.L57
	bgtu	a1,a4,.L38
	li	a5,128
	beq	a1,a5,.L39
	li	a5,144
	bne	a1,a5,.L41
	lla	a5,.LANCHOR6
	lbu	a4,0(a5)
	bne	a4,zero,.L41
	li	a1,65536
	li	a4,1
	lla	a2,_ZL11M111FlashIDj
	addi	a1,a1,-1
	li	a0,32768
	sb	a4,0(a5)
	call	_Z14SetReadHandleriiPFhjE
	j	.L41
.L58:
	li	a5,170
	bne	a1,a5,.L33
	sb	a4,0(t1)
	la a5, .LANCHOR5; sb zero, 0(a5);
	j	.L28
.L59:
	la a5, .LANCHOR6; lbu a5, 0(a5);
	beq	a5,zero,.L28
	lw	ra,8(sp)
	li	a1,65536
	la a5, .LANCHOR6; sb zero, 0(a5);
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
.L61:
	li	a2,12288
	addi	a2,a2,-1366
	bne	a3,a2,.L41
	li	a3,85
	bne	a1,a3,.L41
	sb	a5,0(a4)
	j	.L28
.L60:
	li	a5,85
	bne	a1,a5,.L41
	j	.L44
.L38:
	li	a5,240
	bne	a1,a5,.L41
	la a5, .LANCHOR6; lbu a5, 0(a5);
	beq	a5,zero,.L41
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	la a5, .LANCHOR6; sb zero, 0(a5);
	call	_Z14SetReadHandleriiPFhjE
	j	.L41
.L62:
	li	a5,16
	bne	a1,a5,.L46
	li	a2,524288
	li	a1,255
	la a0, .LANCHOR3; lw a0, 0(a0);
	call	memset
	j	.L41
.L39:
	li	a5,3
.L57:
	sb	a5,0(t1)
	j	.L28
	.size	_ZL9M111Flashjh, .-_ZL9M111Flashjh
	.section	.text._Z16M111FlashIDEnterv,"ax",@progbits
	.align	2
	.globl	_Z16M111FlashIDEnterv
	.hidden	_Z16M111FlashIDEnterv
	.type	_Z16M111FlashIDEnterv, @function
_Z16M111FlashIDEnterv:
	lla	a5,.LANCHOR6
	lbu	a4,0(a5)
	beq	a4,zero,.L65
	ret
.L65:
	li	a1,65536
	li	a4,1
	lla	a2,_ZL11M111FlashIDj
	addi	a1,a1,-1
	li	a0,32768
	sb	a4,0(a5)
	tail	_Z14SetReadHandleriiPFhjE
	.size	_Z16M111FlashIDEnterv, .-_Z16M111FlashIDEnterv
	.section	.text._Z15M111FlashIDExitv,"ax",@progbits
	.align	2
	.globl	_Z15M111FlashIDExitv
	.hidden	_Z15M111FlashIDExitv
	.type	_Z15M111FlashIDExitv, @function
_Z15M111FlashIDExitv:
	la a5, .LANCHOR6; lbu a5, 0(a5);
	bne	a5,zero,.L68
	ret
.L68:
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	la a5, .LANCHOR6; sb zero, 0(a5);
	tail	_Z14SetReadHandleriiPFhjE
	.size	_Z15M111FlashIDExitv, .-_Z15M111FlashIDExitv
	.section	.rodata._Z14Mapper111_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CRAM"
	.align	2
.LC1:
	.string	"FROM"
	.section	.text._Z14Mapper111_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper111_InitP8CartInfo
	.hidden	_Z14Mapper111_InitP8CartInfo
	.type	_Z14Mapper111_InitP8CartInfo, @function
_Z14Mapper111_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL9M111Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M111Closev
	sw	a5,8(a0)
	mv	s1,a0
	li	a0,32768
	call	_Z12FCEU_gmallocj
	mv	a1,a0
	lla	s0,.LANCHOR1
	li	a3,1
	li	a2,32768
	li	a0,16
	sw	a1,0(s0)
	call	_Z19SetupCartCHRMappingiPhji
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR7
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lw	a0,0(s0)
	lla	a3,.LC0
	li	a2,0
	li	a1,32768
	call	_Z10AddExStatePvjiPKc
	lw	a5,48(s1)
	snez	a4,a5
	la a3, .LANCHOR2; sb a4, 0(a3);
	bne	a5,zero,.L75
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L75:
	li	a0,524288
	call	_Z12FCEU_gmallocj
	li	s0,524288
	lla	a4,.LANCHOR3
	lla	a3,.LC1
	li	a2,0
	li	a1,524288
	sw	a0,12(s1)
	sw	s0,28(s1)
	sw	a0,0(a4)
	call	_Z10AddExStatePvjiPKc
	li	a1,-1
	lla	a0,.LANCHOR8
	li	a3,0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lla	a4,.LANCHOR3
	lw	a1,0(a4)
	la t1, ROM_size; lw t1, 0(t1);
	slli	t1,t1,14
	mv	a4,a1
	add	a0,a1,s0
	li	a5,0
	lla	t0,ROM
.L72:
	lw	a3,0(t0)
	addi	a4,a4,1
	add	a3,a3,a5
	lbu	a2,0(a3)
	addi	a5,a5,1
	sgtu	a3,t1,a5
	neg	a3,a3
	sb	a2,-1(a4)
	and	a5,a5,a3
	bne	a4,a0,.L72
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a3,0
	li	a2,524288
	li	a0,16
	addi	sp,sp,12
	tail	_Z19SetupCartPRGMappingiPhji
	.size	_Z14Mapper111_InitP8CartInfo, .-_Z14Mapper111_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"FMOD"
	.align	2
.LC3:
	.string	"FSEQ"
	.align	2
.LC4:
	.string	"FMID"
	.align	2
.LC5:
	.string	"REG"
	.section	.data._ZL9FlashRegs,"aw"
	.align	2
	.set	.LANCHOR8,. + 0
	.type	_ZL9FlashRegs, @object
	.size	_ZL9FlashRegs, 48
_ZL9FlashRegs:
	.word	_ZL10flash_mode
	.word	1
	.word	.LC2
	.word	_ZL14flash_sequence
	.word	1
	.word	.LC3
	.word	_ZL8flash_id
	.word	1
	.word	.LC4
	.word	0
	.zero	8
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.set	.LANCHOR7,. + 0
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL3reg
	.word	1
	.word	.LC5
	.word	0
	.zero	8
	.section	.sbss._ZL10flash_mode,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL10flash_mode, @object
	.size	_ZL10flash_mode, 1
_ZL10flash_mode:
	.zero	1
	.section	.sbss._ZL14flash_sequence,"aw",@nobits
	.set	.LANCHOR5,. + 0
	.type	_ZL14flash_sequence, @object
	.size	_ZL14flash_sequence, 1
_ZL14flash_sequence:
	.zero	1
	.section	.sbss._ZL3reg,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.section	.sbss._ZL5flash,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL5flash, @object
	.size	_ZL5flash, 1
_ZL5flash:
	.zero	1
	.section	.sbss._ZL6CHRRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL6CHRRAM, @object
	.size	_ZL6CHRRAM, 4
_ZL6CHRRAM:
	.zero	4
	.section	.sbss._ZL8FLASHROM,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL8FLASHROM, @object
	.size	_ZL8FLASHROM, 4
_ZL8FLASHROM:
	.zero	4
	.section	.sbss._ZL8flash_id,"aw",@nobits
	.set	.LANCHOR6,. + 0
	.type	_ZL8flash_id, @object
	.size	_ZL8flash_id, 1
_ZL8flash_id:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
