#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"fk23c.cpp"
	.option nopic
	.text
	.section	.rodata._ZL13BMCFK23CResetv.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"BMCFK23C dipswitch set to %d\n"
	.section	.text._ZL13BMCFK23CResetv,"ax",@progbits
	.align	2
	.type	_ZL13BMCFK23CResetv, @function
_ZL13BMCFK23CResetv:
	lla	a5,.LANCHOR0
	lw	a1,0(a5)
	addi	sp,sp,-12
	sw	ra,8(sp)
	addi	a1,a1,1
	sw	s0,4(sp)
	andi	a1,a1,7
	lla	a0,.LC0
	sw	a1,0(a5)
	call	printf
	lla	a5,EXPREGS
	li	a4,-1
	sb	zero,3(a5)
	sb	zero,2(a5)
	sb	zero,1(a5)
	sb	zero,0(a5)
	sb	a4,7(a5)
	sb	a4,6(a5)
	sb	a4,5(a5)
	sb	a4,4(a5)
	call	_Z12MMC3RegResetv
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
	.size	_ZL13BMCFK23CResetv, .-_ZL13BMCFK23CResetv
	.section	.text._ZL13BMCFK23CPowerv,"ax",@progbits
	.align	2
	.type	_ZL13BMCFK23CPowerv, @function
_ZL13BMCFK23CPowerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z12GenMMC3Powerv
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	lla	a5,EXPREGS
	li	a4,-1
	sb	zero,3(a5)
	sb	zero,2(a5)
	sb	zero,1(a5)
	sb	zero,0(a5)
	sb	a4,7(a5)
	sb	a4,6(a5)
	sb	a4,5(a5)
	sb	a4,4(a5)
	la a3, .LANCHOR0; sw zero, 0(a3);
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	call	_Z10FixMMC3CHRi
	li	a1,24576
	lla	a2,_ZL13BMCFK23CWritejh
	addi	a1,a1,-1
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a1,65536
	lla	a2,_ZL15BMCFK23CHiWritejh
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL13BMCFK23CPowerv, .-_ZL13BMCFK23CPowerv
	.section	.text._ZL14BMCFK23CAPowerv,"ax",@progbits
	.align	2
	.type	_ZL14BMCFK23CAPowerv, @function
_ZL14BMCFK23CAPowerv:
	tail	_ZL13BMCFK23CPowerv
	.size	_ZL14BMCFK23CAPowerv, .-_ZL14BMCFK23CAPowerv
	.section	.text._ZL10BMCFK23CPWjh,"ax",@progbits
	.align	2
	.type	_ZL10BMCFK23CPWjh, @function
_ZL10BMCFK23CPWjh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,EXPREGS
	lbu	a5,0(s0)
	sw	ra,8(sp)
	li	a3,4
	andi	a4,a5,7
	beq	a4,a3,.L17
	li	a3,3
	beq	a4,a3,.L18
	andi	a5,a5,3
	bne	a5,zero,.L19
	li	a1,0
	call	_Z7setprg8jj
	lbu	a5,3(s0)
	andi	a5,a5,2
	bne	a5,zero,.L20
.L9:
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a2, A001B; lbu a2, 0(a2);
	andi	a2,a2,3
	li	a1,24576
	li	a0,16
	addi	sp,sp,12
	tail	_Z8setprg8rijj
.L19:
	li	a3,6
	sub	a3,a3,a5
	lbu	a4,1(s0)
	li	a5,1
	sll	a5,a5,a3
	addi	a5,a5,-1
	and	a1,a1,a5
	slli	a5,a4,1
	or	a1,a1,a5
	andi	a1,a1,0xff
	call	_Z7setprg8jj
	lbu	a5,3(s0)
	andi	a5,a5,2
	beq	a5,zero,.L9
.L20:
	lbu	a1,4(s0)
	li	a0,49152
	call	_Z7setprg8jj
	lbu	a1,5(s0)
	li	a0,57344
	call	_Z7setprg8jj
	j	.L9
.L17:
	lbu	a1,1(s0)
	li	a0,32768
	srli	a1,a1,1
	call	_Z8setprg32jj
	j	.L9
.L18:
	lbu	a1,1(s0)
	li	a0,32768
	call	_Z8setprg16jj
	lbu	a1,1(s0)
	li	a0,49152
	call	_Z8setprg16jj
	j	.L9
	.size	_ZL10BMCFK23CPWjh, .-_ZL10BMCFK23CPWjh
	.section	.text._ZL14BMCFK23CAClosev,"ax",@progbits
	.align	2
	.type	_ZL14BMCFK23CAClosev, @function
_ZL14BMCFK23CAClosev:
	la a0, .LANCHOR1; lw a0, 0(a0);
	beq	a0,zero,.L27
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR1; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L27:
	la a5, .LANCHOR1; sw zero, 0(a5);
	ret
	.size	_ZL14BMCFK23CAClosev, .-_ZL14BMCFK23CAClosev
	.section	.text._ZL13BMCFK23CWritejh,"ax",@progbits
	.align	2
	.type	_ZL13BMCFK23CWritejh, @function
_ZL13BMCFK23CWritejh:
	la a3, .LANCHOR0; lw a3, 0(a3);
	addi	a3,a3,4
	li	a5,1
	sll	a5,a5,a3
	and	a5,a5,a0
	bne	a5,zero,.L49
	la a5, .LANCHOR2; lbu a5, 0(a5);
	beq	a5,zero,.L45
	lla	a4,EXPREGS
	lbu	a5,3(a4)
	andi	a5,a5,2
	beq	a5,zero,.L45
	lbu	a5,0(a4)
	andi	a5,a5,-8
	sb	a5,0(a4)
	ret
.L45:
	ret
.L49:
	addi	sp,sp,-12
	sw	s0,4(sp)
	mv	a4,a0
	lla	s0,MMC3_cmd
	andi	a4,a4,3
	lbu	a0,0(s0)
	lla	a5,EXPREGS
	add	a5,a5,a4
	sw	ra,8(sp)
	sb	a1,0(a5)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	call	_Z10FixMMC3CHRi
	la a5, .LANCHOR2; lbu a5, 0(a5);
	beq	a5,zero,.L30
	lla	a4,EXPREGS
	lbu	a5,3(a4)
	andi	a5,a5,2
	beq	a5,zero,.L30
	lbu	a5,0(a4)
	andi	a5,a5,-8
	sb	a5,0(a4)
.L30:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL13BMCFK23CWritejh, .-_ZL13BMCFK23CWritejh
	.section	.text._ZL15BMCFK23CHiWritejh,"ax",@progbits
	.align	2
	.type	_ZL15BMCFK23CHiWritejh, @function
_ZL15BMCFK23CHiWritejh:
	lla	t0,EXPREGS
	lbu	a4,0(t0)
	li	a3,64
	mv	t1,a1
	andi	a2,a4,96
	beq	a2,a3,.L72
	addi	sp,sp,-12
	li	a4,32768
	sw	ra,8(sp)
	sw	s0,4(sp)
	addi	a3,a4,1
	mv	a5,a0
	beq	a0,a3,.L73
	li	a3,49152
	bgeu	a0,a3,.L56
	la a3, UNIFchrrama; lw a3, 0(a3);
	lla	s0,MMC3_cmd
	beq	a3,zero,.L55
	bne	a0,a4,.L55
	li	a4,70
	beq	a1,a4,.L57
	li	a4,71
	beq	a1,a4,.L74
.L55:
	mv	a0,a5
	mv	a1,t1
	call	_Z13MMC3_CMDWritejh
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3PRGi
.L73:
	lbu	a4,3(t0)
	lla	s0,MMC3_cmd
	andi	a4,a4,2
	beq	a4,zero,.L55
	lbu	a0,0(s0)
	andi	a4,a0,8
	beq	a4,zero,.L55
	andi	a5,a0,3
	ori	a5,a5,4
	add	a5,t0,a5
	sb	a1,0(a5)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
.L72:
	andi	a4,a4,48
	beq	a4,zero,.L52
	la a5, .LANCHOR3; sb zero, 0(a5);
	ret
.L56:
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z13MMC3_IRQWritejh
.L52:
	andi	a1,a1,3
	la a0, MMC3_cmd; lbu a0, 0(a0);
	la a5, .LANCHOR3; sb a1, 0(a5);
	tail	_Z10FixMMC3CHRi
.L74:
	li	t1,70
	j	.L55
.L57:
	li	t1,71
	j	.L55
	.size	_ZL15BMCFK23CHiWritejh, .-_ZL15BMCFK23CHiWritejh
	.section	.text._ZL10BMCFK23CCWjh,"ax",@progbits
	.align	2
	.type	_ZL10BMCFK23CCWjh, @function
_ZL10BMCFK23CCWjh:
	lla	a3,EXPREGS
	lbu	a5,0(a3)
	andi	t1,a5,64
	bne	t1,zero,.L81
	andi	a5,a5,32
	bne	a5,zero,.L82
	addi	sp,sp,-12
	sw	s1,0(sp)
	sw	ra,8(sp)
	sw	s0,4(sp)
	lbu	a5,2(a3)
	lbu	a4,3(a3)
	slli	a5,a5,3
	andi	s1,a5,1016
	andi	a4,a4,2
	or	a1,a1,s1
	beq	a4,zero,.L78
	la s0, MMC3_cmd; lbu s0, 0(s0);
	li	a4,4096
	slli	s0,s0,5
	and	s0,s0,a4
	call	_Z7setchr1jj
	lla	a5,DRegBuf
	lbu	a1,0(a5)
	mv	a0,s0
	or	a1,a1,s1
	call	_Z7setchr1jj
	lla	a3,EXPREGS
	lbu	a1,6(a3)
	ori	a0,s0,1024
	or	a1,a1,s1
	call	_Z7setchr1jj
	lla	a5,DRegBuf
	lbu	a1,1(a5)
	li	a4,4096
	addi	a0,a4,-2048
	xor	a0,s0,a0
	or	a1,a1,s1
	call	_Z7setchr1jj
	lla	a3,EXPREGS
	lbu	a1,7(a3)
	li	a4,4096
	addi	a0,a4,-1024
	xor	a0,s0,a0
	or	a1,a1,s1
.L78:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_Z7setchr1jj
.L82:
	mv	a2,a1
	mv	a1,a0
	li	a0,16
	tail	_Z8setchr1rijj
.L81:
	lbu	a0,2(a3)
	la a5, .LANCHOR3; lbu a5, 0(a5);
	or	a0,a0,a5
	tail	_Z7setchr8j
	.size	_ZL10BMCFK23CCWjh, .-_ZL10BMCFK23CCWjh
	.section	.rodata._Z13BMCFK23C_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"AM Panic: "
	.align	2
.LC2:
	.string	"Assertion `0' failed"
	.align	2
.LC3:
	.string	" @ /home/ysyx/ysyx-workbench/fceux-am/src/boards/fk23c.cpp:255  \n"
	.align	2
.LC4:
	.string	"EXPR"
	.align	2
.LC5:
	.string	"UCHR"
	.align	2
.LC6:
	.string	"DPSW"
	.section	.text._Z13BMCFK23C_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13BMCFK23C_InitP8CartInfo
	.hidden	_Z13BMCFK23C_InitP8CartInfo
	.type	_Z13BMCFK23C_InitP8CartInfo, @function
_Z13BMCFK23C_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,8
	li	a2,256
	li	a1,512
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR2; sb zero, 0(a5);
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL10BMCFK23CCWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL10BMCFK23CPWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL13BMCFK23CPowerv
	sw	a5,0(s0)
	lla	a5,_ZL13BMCFK23CResetv
	sw	a5,4(s0)
	lla	a3,.LC4
	li	a2,0
	li	a1,8
	lla	a0,EXPREGS
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC5
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR3
	call	_Z10AddExStatePvjiPKc
	lla	a0,.LANCHOR0
	lla	a3,.LC6
	li	a2,0
	li	a1,1
	call	_Z10AddExStatePvjiPKc
	lla	s0,.LC1
	li	a0,65
.L84:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L84
	lla	s0,.LC2
	li	a0,65
.L85:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L85
	lla	s0,.LC3
	li	a0,32
.L86:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L86
	li	a0,1
	call	halt
	.size	_Z13BMCFK23C_InitP8CartInfo, .-_Z13BMCFK23C_InitP8CartInfo
	.section	.rodata._Z14BMCFK23CA_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	" @ /home/ysyx/ysyx-workbench/fceux-am/src/boards/fk23c.cpp:283  \n"
	.align	2
.LC8:
	.string	"CRAM"
	.section	.text._Z14BMCFK23CA_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14BMCFK23CA_InitP8CartInfo
	.hidden	_Z14BMCFK23CA_InitP8CartInfo
	.type	_Z14BMCFK23CA_InitP8CartInfo, @function
_Z14BMCFK23CA_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,8
	li	a2,256
	li	a1,512
	li	a5,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	la t1, .LANCHOR2; sb a5, 0(t1);
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL10BMCFK23CCWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL10BMCFK23CPWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL14BMCFK23CAPowerv
	sw	a5,0(s0)
	lla	a5,_ZL13BMCFK23CResetv
	sw	a5,4(s0)
	lla	a5,_ZL14BMCFK23CAClosev
	lla	s1,.LANCHOR4
	sw	a5,8(s0)
	li	a0,8192
	li	a5,8192
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	s0,.LANCHOR1
	li	a3,1
	li	a0,16
	sw	a1,0(s0)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a0,0(s0)
	lw	a1,0(s1)
	lla	a3,.LC8
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC4
	li	a2,0
	li	a1,8
	lla	a0,EXPREGS
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC5
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR3
	call	_Z10AddExStatePvjiPKc
	lla	a0,.LANCHOR0
	lla	a3,.LC6
	li	a2,0
	li	a1,1
	call	_Z10AddExStatePvjiPKc
	lla	s0,.LC1
	li	a0,65
.L92:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L92
	lla	s0,.LC2
	li	a0,65
.L93:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L93
	lla	s0,.LC7
	li	a0,32
.L94:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L94
	li	a0,1
	call	halt
	.size	_Z14BMCFK23CA_InitP8CartInfo, .-_Z14BMCFK23CA_InitP8CartInfo
	.section	.sbss._ZL10CHRRAMSize,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL10CHRRAMSize, @object
	.size	_ZL10CHRRAMSize, 4
_ZL10CHRRAMSize:
	.zero	4
	.section	.sbss._ZL12is_BMCFK23CA,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL12is_BMCFK23CA, @object
	.size	_ZL12is_BMCFK23CA, 1
_ZL12is_BMCFK23CA:
	.zero	1
	.section	.sbss._ZL6CHRRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL6CHRRAM, @object
	.size	_ZL6CHRRAM, 4
_ZL6CHRRAM:
	.zero	4
	.section	.sbss._ZL8unromchr,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL8unromchr, @object
	.size	_ZL8unromchr, 1
_ZL8unromchr:
	.zero	1
	.section	.sbss._ZL9dipswitch,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL9dipswitch, @object
	.size	_ZL9dipswitch, 4
_ZL9dipswitch:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
