#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"8237.cpp"
	.option nopic
	.text
	.section	.text._ZL12UNL8237Powerv,"ax",@progbits
	.align	2
	.type	_ZL12UNL8237Powerv, @function
_ZL12UNL8237Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	lla	a5,EXPREGS
	li	a4,3
	sb	zero,2(a5)
	sb	zero,0(a5)
	sb	a4,1(a5)
	call	_Z12GenMMC3Powerv
	li	a1,65536
	lla	a2,_ZL12UNL8237Writejh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	li	a1,32768
	lla	a2,_ZL14UNL8237ExWritejh
	addi	a1,a1,-1
	li	a0,20480
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL12UNL8237Powerv, .-_ZL12UNL8237Powerv
	.section	.text._ZL12UNL8237Writejh,"ax",@progbits
	.align	2
	.type	_ZL12UNL8237Writejh, @function
_ZL12UNL8237Writejh:
	srli	a3,a0,12
	la a4, EXPREGS+2; lbu a4, 0(a4);
	andi	a0,a0,1
	andi	a3,a3,6
	slli	a4,a4,3
	lla	a5,.LANCHOR0
	or	a3,a3,a0
	add	a5,a5,a4
	add	a5,a5,a3
	lbu	a2,0(a5)
	li	a5,24576
	li	a3,-32768
	slli	a0,a2,12
	and	a0,a0,a5
	andi	a5,a2,1
	or	a0,a0,a5
	or	a0,a0,a3
	slli	a0,a0,16
	li	a3,3
	mv	a5,a1
	srli	a0,a0,16
	bgtu	a2,a3,.L5
	bne	a2,zero,.L6
	lla	a3,.LANCHOR1
	andi	a2,a1,7
	add	a4,a3,a4
	add	a4,a4,a2
	lbu	a4,0(a4)
	andi	a5,a1,-64
	or	a5,a4,a5
.L6:
	mv	a1,a5
	tail	_Z13MMC3_CMDWritejh
.L5:
	tail	_Z13MMC3_IRQWritejh
	.size	_ZL12UNL8237Writejh, .-_ZL12UNL8237Writejh
	.section	.text._ZL9UNL8237PWjh,"ax",@progbits
	.align	2
	.type	_ZL9UNL8237PWjh, @function
_ZL9UNL8237PWjh:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	lla	a5,EXPREGS
	lbu	a4,0(a5)
	lbu	a5,1(a5)
	slli	a3,a4,24
	andi	a2,a4,64
	srai	a3,a3,24
	beq	a2,zero,.L8
	andi	a2,a5,16
	bge	a3,zero,.L9
	slli	s0,a5,4
	andi	s0,s0,48
	andi	a3,a3,7
	or	s0,s0,a3
	srli	a2,a2,1
	andi	a4,a4,32
	or	s0,s0,a2
	beq	a4,zero,.L12
.L14:
	srli	a1,s0,1
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,32768
	addi	sp,sp,12
	tail	_Z8setprg32jj
.L8:
	bge	a3,zero,.L11
	slli	s0,a5,4
	andi	s0,s0,48
	andi	a3,a3,15
	andi	a4,a4,32
	or	s0,s0,a3
	bne	a4,zero,.L14
.L12:
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,49152
	addi	sp,sp,12
	tail	_Z8setprg16jj
.L9:
	lw	s0,4(sp)
	slli	a5,a5,5
	lw	ra,8(sp)
	andi	a5,a5,96
	or	a5,a5,a2
	andi	a1,a1,15
	or	a1,a5,a1
	addi	sp,sp,12
	tail	_Z7setprg8jj
.L11:
	lw	s0,4(sp)
	lw	ra,8(sp)
	slli	a5,a5,5
	andi	a5,a5,96
	andi	a1,a1,31
	or	a1,a5,a1
	addi	sp,sp,12
	tail	_Z7setprg8jj
	.size	_ZL9UNL8237PWjh, .-_ZL9UNL8237PWjh
	.section	.text._ZL10UNL8237APWjh,"ax",@progbits
	.align	2
	.type	_ZL10UNL8237APWjh, @function
_ZL10UNL8237APWjh:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	lla	a5,EXPREGS
	lbu	a4,0(a5)
	lbu	a5,1(a5)
	slli	a2,a4,24
	andi	t1,a4,64
	srai	a2,a2,24
	slli	a3,a5,4
	beq	t1,zero,.L17
	andi	t1,a5,16
	bge	a2,zero,.L18
	slli	s0,a5,3
	andi	s0,s0,64
	andi	a3,a3,48
	or	s0,s0,a3
	andi	a2,a2,7
	or	s0,s0,a2
	srli	t1,t1,1
	andi	a4,a4,32
	or	s0,s0,t1
	beq	a4,zero,.L21
.L23:
	srli	a1,s0,1
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,32768
	addi	sp,sp,12
	tail	_Z8setprg32jj
.L17:
	bge	a2,zero,.L20
	slli	s0,a5,3
	andi	s0,s0,64
	andi	a3,a3,48
	or	s0,s0,a3
	andi	a2,a2,15
	andi	a4,a4,32
	or	s0,s0,a2
	bne	a4,zero,.L23
.L21:
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s0
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,49152
	addi	sp,sp,12
	tail	_Z8setprg16jj
.L18:
	slli	a5,a5,5
	lw	s0,4(sp)
	andi	a5,a5,96
	andi	a3,a3,128
	lw	ra,8(sp)
	or	a5,a5,a3
	or	a5,a5,t1
	andi	a1,a1,15
	or	a1,a5,a1
	addi	sp,sp,12
	tail	_Z7setprg8jj
.L20:
	lw	s0,4(sp)
	slli	a5,a5,5
	lw	ra,8(sp)
	andi	a5,a5,96
	andi	a3,a3,128
	or	a5,a5,a3
	andi	a1,a1,31
	or	a1,a5,a1
	addi	sp,sp,12
	tail	_Z7setprg8jj
	.size	_ZL10UNL8237APWjh, .-_ZL10UNL8237APWjh
	.section	.text._ZL14UNL8237ExWritejh,"ax",@progbits
	.align	2
	.type	_ZL14UNL8237ExWritejh, @function
_ZL14UNL8237ExWritejh:
	li	a5,20480
	addi	a4,a5,1
	beq	a0,a4,.L26
	addi	a4,a5,7
	beq	a0,a4,.L27
	beq	a0,a5,.L31
	ret
.L31:
	la a0, MMC3_cmd; lbu a0, 0(a0);
	la a5, EXPREGS; sb a1, 0(a5);
	tail	_Z10FixMMC3PRGi
.L27:
	la a5, EXPREGS+2; sb a1, 0(a5);
	ret
.L26:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	sw	ra,8(sp)
	la a5, EXPREGS+1; sb a1, 0(a5);
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
	.size	_ZL14UNL8237ExWritejh, .-_ZL14UNL8237ExWritejh
	.section	.text._ZL9UNL8237CWjh,"ax",@progbits
	.align	2
	.type	_ZL9UNL8237CWjh, @function
_ZL9UNL8237CWjh:
	lla	a4,EXPREGS
	lbu	a3,0(a4)
	lbu	a5,1(a4)
	andi	a3,a3,64
	slli	a4,a5,6
	andi	a4,a4,768
	beq	a3,zero,.L33
	slli	a5,a5,2
	andi	a5,a5,128
	or	a5,a5,a4
	andi	a1,a1,127
	or	a1,a5,a1
	tail	_Z7setchr1jj
.L33:
	or	a1,a1,a4
	tail	_Z7setchr1jj
	.size	_ZL9UNL8237CWjh, .-_ZL9UNL8237CWjh
	.section	.text._ZL10UNL8237ACWjh,"ax",@progbits
	.align	2
	.type	_ZL10UNL8237ACWjh, @function
_ZL10UNL8237ACWjh:
	lla	a4,EXPREGS
	lbu	a3,0(a4)
	lbu	a5,1(a4)
	andi	a3,a3,64
	slli	a4,a5,7
	andi	a4,a4,1792
	beq	a3,zero,.L35
	slli	a5,a5,2
	andi	a5,a5,128
	or	a5,a5,a4
	andi	a1,a1,127
	or	a1,a5,a1
	tail	_Z7setchr1jj
.L35:
	or	a1,a1,a4
	tail	_Z7setchr1jj
	.size	_ZL10UNL8237ACWjh, .-_ZL10UNL8237ACWjh
	.section	.rodata._Z12UNL8237_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.align	2
.LC1:
	.string	"CMDI"
	.section	.text._Z12UNL8237_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12UNL8237_InitP8CartInfo
	.hidden	_Z12UNL8237_InitP8CartInfo
	.type	_Z12UNL8237_InitP8CartInfo, @function
_Z12UNL8237_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,256
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL9UNL8237CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL9UNL8237PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL12UNL8237Powerv
	lla	a3,.LC0
	li	a2,0
	li	a1,3
	lla	a0,EXPREGS
	sw	a5,0(s0)
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR2
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z12UNL8237_InitP8CartInfo, .-_Z12UNL8237_InitP8CartInfo
	.section	.text._Z13UNL8237A_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13UNL8237A_InitP8CartInfo
	.hidden	_Z13UNL8237A_InitP8CartInfo
	.type	_Z13UNL8237A_InitP8CartInfo, @function
_Z13UNL8237A_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,256
	sw	ra,8(sp)
	sw	s0,4(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL10UNL8237ACWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL10UNL8237APWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL12UNL8237Powerv
	lla	a3,.LC0
	li	a2,0
	li	a1,3
	lla	a0,EXPREGS
	sw	a5,0(s0)
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR2
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13UNL8237A_InitP8CartInfo, .-_Z13UNL8237A_InitP8CartInfo
	.section	.rodata._ZL7adrperm,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL7adrperm, @object
	.size	_ZL7adrperm, 64
_ZL7adrperm:
	.string	""
	.ascii	"\001\002\003\004\005\006\007"
	.string	"\003\002"
	.ascii	"\004\001\005\006\007"
	.string	""
	.ascii	"\001\002\003\004\005\006\007"
	.string	"\005"
	.ascii	"\001\002\003\007\006\004"
	.string	"\003\001"
	.ascii	"\005\002\004\006\007"
	.string	""
	.ascii	"\001\002\003\004\005\006\007"
	.string	""
	.ascii	"\001\002\003\004\005\006\007"
	.string	""
	.ascii	"\001\002\003\004\005\006\007"
	.section	.rodata._ZL7regperm,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL7regperm, @object
	.size	_ZL7regperm, 64
_ZL7regperm:
	.string	""
	.ascii	"\001\002\003\004\005\006\007"
	.string	""
	.ascii	"\002\006\001\007\003\004\005"
	.string	""
	.ascii	"\005\004\001\007\002\006\003"
	.string	""
	.ascii	"\006\003\007\005\002\004\001"
	.string	""
	.ascii	"\002\005\003\006\001\007\004"
	.string	""
	.ascii	"\001\002\003\004\005\006\007"
	.string	""
	.ascii	"\001\002\003\004\005\006\007"
	.string	""
	.ascii	"\001\002\003\004\005\006\007"
	.section	.sbss._ZL5cmdin,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL5cmdin, @object
	.size	_ZL5cmdin, 1
_ZL5cmdin:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
