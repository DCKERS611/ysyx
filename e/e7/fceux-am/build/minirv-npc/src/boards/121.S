#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"121.cpp"
	.option nopic
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
	lla	a4,EXPREGS
	lbu	a5,5(a4)
	li	a3,31
	andi	a5,a5,63
	addi	a5,a5,-32
	andi	a5,a5,0xff
	bgtu	a5,a3,.L2
	lla	a3,.L4
	slli	a5,a5,2
	add	a5,a5,a3
	lw	a5,0(a5)
	add	a5,a5,a3
	jr	a5
	.section	.rodata._ZL4Syncv,"a",@progbits
	.align	2
	.align	2
.L4:
	.word	.L3-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L9-.L4
	.word	.L2-.L4
	.word	.L8-.L4
	.word	.L3-.L4
	.word	.L7-.L4
	.word	.L3-.L4
	.word	.L6-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L1-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L3-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L3-.L4
	.section	.text._ZL4Syncv
.L2:
	la a5, EXPREGS+5; sb zero, 0(a5);
.L1:
	ret
.L3:
	lbu	a5,6(a4)
	li	a3,1
	sb	a3,7(a4)
	sb	a5,0(a4)
	ret
.L8:
	lbu	a5,6(a4)
	la a3, EXPREGS+7; sb zero, 0(a3);
	sb	a5,1(a4)
	ret
.L7:
	lbu	a5,6(a4)
	la a3, EXPREGS+7; sb zero, 0(a3);
	sb	a5,2(a4)
	ret
.L9:
	lbu	a5,6(a4)
	la a3, EXPREGS+7; sb zero, 0(a3);
	sb	a5,0(a4)
	ret
.L6:
	lbu	a5,6(a4)
	li	a3,1
	sb	a3,7(a4)
	beq	a5,zero,.L1
	sb	a5,0(a4)
	ret
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL8M121Readj,"ax",@progbits
	.align	2
	.type	_ZL8M121Readj, @function
_ZL8M121Readj:
	la a0, EXPREGS+4; lbu a0, 0(a0);
	ret
	.size	_ZL8M121Readj, .-_ZL8M121Readj
	.section	.text._ZL9M121Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M121Powerv, @function
_ZL9M121Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	lla	a5,EXPREGS
	li	a4,-128
	sb	a4,3(a5)
	sb	zero,5(a5)
	call	_Z12GenMMC3Powerv
	li	s0,24576
	addi	a1,s0,-1
	lla	a2,_ZL8M121Readj
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL11M121LoWritejh
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a1,40960
	lla	a2,_ZL9M121Writejh
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL9M121Powerv, .-_ZL9M121Powerv
	.section	.text._ZL9M121Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M121Writejh, @function
_ZL9M121Writejh:
	li	a5,57344
	addi	sp,sp,-12
	li	a4,32768
	addi	a5,a5,3
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	and	a5,a0,a5
	addi	a3,a4,1
	mv	s0,a1
	beq	a5,a3,.L18
	addi	a3,a4,3
	beq	a5,a3,.L19
	beq	a5,a4,.L23
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L19:
	la a5, EXPREGS+5; sb a1, 0(a5);
	call	_ZL4Syncv
	mv	a1,s0
	li	a0,32768
.L23:
	call	_Z13MMC3_CMDWritejh
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	la a0, MMC3_cmd; lbu a0, 0(a0);
	addi	sp,sp,12
	tail	_Z10FixMMC3PRGi
.L18:
	srli	a5,a1,1
	srli	a4,a1,3
	andi	a4,a4,2
	andi	a5,a5,4
	srli	a3,a1,5
	or	a5,a5,a4
	andi	a3,a3,1
	slli	a4,a1,5
	or	a5,a5,a3
	andi	a4,a4,32
	slli	a3,a1,3
	lla	a2,EXPREGS
	or	a5,a5,a4
	andi	a3,a3,16
	slli	a4,a1,1
	or	a5,a5,a3
	andi	a4,a4,8
	lbu	a3,7(a2)
	or	a5,a5,a4
	sb	a5,6(a2)
	mv	s1,a0
	beq	a3,zero,.L24
.L21:
	mv	a0,s1
	mv	a1,s0
	j	.L23
.L24:
	call	_ZL4Syncv
	j	.L21
	.size	_ZL9M121Writejh, .-_ZL9M121Writejh
	.section	.text._ZL11M121LoWritejh,"ax",@progbits
	.align	2
	.type	_ZL11M121LoWritejh, @function
_ZL11M121LoWritejh:
	andi	a4,a1,3
	lla	a5,.LANCHOR0
	add	a5,a5,a4
	lbu	a3,0(a5)
	li	a5,20480
	lla	a4,EXPREGS
	addi	a5,a5,384
	sb	a3,4(a4)
	and	a0,a0,a5
	beq	a0,a5,.L30
	ret
.L30:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	sw	ra,8(sp)
	sb	a1,3(a4)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
	.size	_ZL11M121LoWritejh, .-_ZL11M121LoWritejh
	.section	.text._ZL6M121CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M121CWjh, @function
_ZL6M121CWjh:
	la a3, PRGsize; lw a3, 0(a3);
	la a5, CHRsize; lw a5, 0(a5);
	mv	a2,a1
	beq	a3,a5,.L34
	la a5, MMC3_cmd; lbu a5, 0(a5);
	slli	a5,a5,5
	xor	a5,a5,a0
	li	a4,4096
	and	a5,a5,a4
	bne	a5,zero,.L33
	ori	a1,a1,256
	tail	_Z7setchr1jj
.L33:
	tail	_Z7setchr1jj
.L34:
	la a1, EXPREGS+3; lbu a1, 0(a1);
	slli	a1,a1,1
	andi	a1,a1,256
	or	a1,a1,a2
	tail	_Z7setchr1jj
	.size	_ZL6M121CWjh, .-_ZL6M121CWjh
	.section	.text._ZL6M121PWjh,"ax",@progbits
	.align	2
	.type	_ZL6M121PWjh, @function
_ZL6M121PWjh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,EXPREGS
	lbu	a5,3(s0)
	lbu	a4,5(s0)
	andi	a1,a1,31
	srli	a5,a5,2
	andi	a5,a5,32
	sw	ra,8(sp)
	andi	a4,a4,63
	or	a1,a5,a1
	beq	a4,zero,.L36
	call	_Z7setprg8jj
	lbu	a5,3(s0)
	lbu	a1,0(s0)
	li	a0,57344
	srli	a5,a5,2
	andi	a5,a5,32
	or	a1,a5,a1
	call	_Z7setprg8jj
	lbu	a5,3(s0)
	lbu	a1,1(s0)
	li	a0,49152
	srli	a5,a5,2
	andi	a5,a5,32
	or	a1,a5,a1
	call	_Z7setprg8jj
	lbu	a5,3(s0)
	lbu	a1,2(s0)
	li	a0,40960
	srli	a5,a5,2
	andi	a5,a5,32
	or	a1,a5,a1
.L36:
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z7setprg8jj
	.size	_ZL6M121PWjh, .-_ZL6M121PWjh
	.section	.rodata._Z14Mapper121_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.section	.text._Z14Mapper121_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper121_InitP8CartInfo
	.hidden	_Z14Mapper121_InitP8CartInfo
	.type	_Z14Mapper121_InitP8CartInfo, @function
_Z14Mapper121_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,8
	li	a2,256
	li	a1,128
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M121PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL6M121CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL9M121Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC0
	li	a2,0
	li	a1,8
	lla	a0,EXPREGS
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper121_InitP8CartInfo, .-_Z14Mapper121_InitP8CartInfo
	.section	.rodata._ZL10prot_array,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL10prot_array, @object
	.size	_ZL10prot_array, 16
_ZL10prot_array:
	.string	"\203\203B"
	.string	""
	.zero	11
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
