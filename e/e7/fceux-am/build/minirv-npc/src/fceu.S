#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"fceu.cpp"
	.option nopic
	.text
	.section	.text._ZL5BNulljh,"ax",@progbits
	.align	2
	.type	_ZL5BNulljh, @function
_ZL5BNulljh:
	ret
	.size	_ZL5BNulljh, .-_ZL5BNulljh
	.section	.text._ZL5ANullj,"ax",@progbits
	.align	2
	.type	_ZL5ANullj, @function
_ZL5ANullj:
	la a0, X+24; lbu a0, 0(a0);
	ret
	.size	_ZL5ANullj, .-_ZL5ANullj
	.section	.text._ZL5BRAMLjh,"ax",@progbits
	.align	2
	.type	_ZL5BRAMLjh, @function
_ZL5BRAMLjh:
	lla	a5,RAM
	add	a5,a5,a0
	sb	a1,0(a5)
	ret
	.size	_ZL5BRAMLjh, .-_ZL5BRAMLjh
	.section	.text._ZL5BRAMHjh,"ax",@progbits
	.align	2
	.type	_ZL5BRAMHjh, @function
_ZL5BRAMHjh:
	andi	a0,a0,2047
	lla	a5,RAM
	add	a5,a5,a0
	sb	a1,0(a5)
	ret
	.size	_ZL5BRAMHjh, .-_ZL5BRAMHjh
	.section	.text._ZL5ARAMLj,"ax",@progbits
	.align	2
	.type	_ZL5ARAMLj, @function
_ZL5ARAMLj:
	lla	a5,RAM
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
	.size	_ZL5ARAMLj, .-_ZL5ARAMLj
	.section	.text._ZL5ARAMHj,"ax",@progbits
	.align	2
	.type	_ZL5ARAMHj, @function
_ZL5ARAMHj:
	andi	a0,a0,2047
	lla	a5,RAM
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
	.size	_ZL5ARAMHj, .-_ZL5ARAMHj
	.section	.text._ZL14FCEU_CloseGamev,"ax",@progbits
	.align	2
	.type	_ZL14FCEU_CloseGamev, @function
_ZL14FCEU_CloseGamev:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lw	a5,0(s0)
	sw	ra,8(sp)
	beq	a5,zero,.L8
	lw	a0,0(a5)
	beq	a0,zero,.L10
	call	free
	lw	a5,0(s0)
	sw	zero,0(a5)
.L10:
	li	a0,3
	la a5, .LANCHOR1; lw a5, 0(a5);
	jalr	a5
	la a0, XBuf; lw a0, 0(a0);
	beq	a0,zero,.L11
	li	a2,65536
	li	a1,0
	call	memset
.L11:
	call	_Z15FCEU_CloseGeniev
	lw	a0,0(s0)
	call	free
	la a5, .LANCHOR0; sw zero, 0(a5);
.L8:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL14FCEU_CloseGamev, .-_ZL14FCEU_CloseGamev
	.section	.rodata._ZL13RegisterAReadPFhjE.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Assertion `i < 16' failed"
	.align	2
.LC2:
	.string	" @ /home/ysyx/ysyx-workbench/fceux-am/src/fceu.cpp:165  \n"
	.section	.text._ZL13RegisterAReadPFhjE,"ax",@progbits
	.align	2
	.type	_ZL13RegisterAReadPFhjE, @function
_ZL13RegisterAReadPFhjE:
	lla	a2,.LANCHOR2
	mv	a3,a0
	mv	a5,a2
	li	a0,0
	li	a1,16
	j	.L26
.L23:
	beq	a4,a3,.L22
	addi	a0,a0,1
	addi	a5,a5,4
	beq	a0,a1,.L37
.L26:
	lw	a4,0(a5)
	bne	a4,zero,.L23
	slli	a5,a0,2
	add	a5,a2,a5
	sw	a3,0(a5)
	ret
.L37:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L27:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L27
	lla	s0,.LC1
	li	a0,65
.L28:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L28
	lla	s0,.LC2
	li	a0,32
.L29:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L29
	li	a0,1
	call	halt
.L22:
	ret
	.size	_ZL13RegisterAReadPFhjE, .-_ZL13RegisterAReadPFhjE
	.section	.rodata._ZL6SetIdxPhjh.part.0.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	" @ /home/ysyx/ysyx-workbench/fceux-am/src/fceu.cpp:192  \n"
	.section	.text._ZL6SetIdxPhjh.part.0,"ax",@progbits
	.align	2
	.type	_ZL6SetIdxPhjh.part.0, @function
_ZL6SetIdxPhjh.part.0:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L39:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L39
	lla	s0,.LC1
	li	a0,65
.L40:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L40
	lla	s0,.LC3
	li	a0,32
.L41:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L41
	li	a0,1
	call	halt
	.size	_ZL6SetIdxPhjh.part.0, .-_ZL6SetIdxPhjh.part.0
	.section	.rodata._ZL14RegisterBWritePFvjhE.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	" @ /home/ysyx/ysyx-workbench/fceux-am/src/fceu.cpp:175  \n"
	.section	.text._ZL14RegisterBWritePFvjhE,"ax",@progbits
	.align	2
	.type	_ZL14RegisterBWritePFvjhE, @function
_ZL14RegisterBWritePFvjhE:
	lla	a2,.LANCHOR3
	mv	a3,a0
	mv	a5,a2
	li	a0,0
	li	a1,16
	j	.L50
.L47:
	beq	a4,a3,.L46
	addi	a0,a0,1
	addi	a5,a5,4
	beq	a0,a1,.L61
.L50:
	lw	a4,0(a5)
	bne	a4,zero,.L47
	slli	a5,a0,2
	add	a5,a2,a5
	sw	a3,0(a5)
	ret
.L61:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LC0
	li	a0,65
.L51:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L51
	lla	s0,.LC1
	li	a0,65
.L52:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L52
	lla	s0,.LC4
	li	a0,32
.L53:
	addi	s0,s0,1
	call	putch
	lbu	a0,0(s0)
	bne	a0,zero,.L53
	li	a0,1
	call	halt
.L46:
	ret
	.size	_ZL14RegisterBWritePFvjhE, .-_ZL14RegisterBWritePFvjhE
	.section	.text._ZN6FCEUGIC2Ev,"ax",@progbits
	.align	2
	.globl	_ZN6FCEUGIC2Ev
	.hidden	_ZN6FCEUGIC2Ev
	.type	_ZN6FCEUGIC2Ev, @function
_ZN6FCEUGIC2Ev:
	ret
	.size	_ZN6FCEUGIC2Ev, .-_ZN6FCEUGIC2Ev
	.globl	_ZN6FCEUGIC1Ev
	.hidden	_ZN6FCEUGIC1Ev
	.set	_ZN6FCEUGIC1Ev,_ZN6FCEUGIC2Ev
	.section	.text._ZN6FCEUGID2Ev,"ax",@progbits
	.align	2
	.globl	_ZN6FCEUGID2Ev
	.hidden	_ZN6FCEUGID2Ev
	.type	_ZN6FCEUGID2Ev, @function
_ZN6FCEUGID2Ev:
	ret
	.size	_ZN6FCEUGID2Ev, .-_ZN6FCEUGID2Ev
	.globl	_ZN6FCEUGID1Ev
	.hidden	_ZN6FCEUGID1Ev
	.set	_ZN6FCEUGID1Ev,_ZN6FCEUGID2Ev
	.section	.rodata._Z14FCEU_TogglePPUv.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"New PPU loaded\n"
	.align	2
.LC6:
	.string	"Old PPU loaded\n"
	.section	.text._Z14FCEU_TogglePPUv,"ax",@progbits
	.align	2
	.globl	_Z14FCEU_TogglePPUv
	.hidden	_Z14FCEU_TogglePPUv
	.type	_Z14FCEU_TogglePPUv, @function
_Z14FCEU_TogglePPUv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,newppu
	lw	a5,0(s0)
	sw	ra,8(sp)
	li	a4,1
	xori	a3,a5,1
	sw	a3,0(s0)
	beq	a5,a4,.L65
	lla	a0,.LC5
	call	printf
	lla	a0,.LC5
	call	printf
	la a5, .LANCHOR4; sb zero, 0(a5);
.L66:
	la a5, dendy; lw a5, 0(a5);
	snez	a5,a5
	lw	a4,0(s0)
	neg	a5,a5
	andi	a5,a5,50
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	a5,a5,240
	add	a5,a4,a5
	la a4, .LANCHOR5; sw a5, 0(a4);
	addi	sp,sp,12
	jr	ra
.L65:
	lla	a0,.LC6
	call	printf
	lla	a0,.LC6
	call	printf
	j	.L66
	.size	_Z14FCEU_TogglePPUv, .-_Z14FCEU_TogglePPUv
	.section	.text._Z14GetReadHandleri,"ax",@progbits
	.align	2
	.globl	_Z14GetReadHandleri
	.hidden	_Z14GetReadHandleri
	.type	_Z14GetReadHandleri, @function
_Z14GetReadHandleri:
	srli	a5,a0,1
	lla	a4,_ZL8AReadIdx
	add	a5,a5,a4
	andi	a0,a0,1
	lbu	a5,0(a5)
	beq	a0,zero,.L71
	srli	a5,a5,4
	lla	a4,.LANCHOR2
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a0,0(a5)
	ret
.L71:
	andi	a5,a5,15
	lla	a4,.LANCHOR2
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a0,0(a5)
	ret
	.size	_Z14GetReadHandleri, .-_Z14GetReadHandleri
	.section	.text._Z17SetOneReadHandleriPFhjE,"ax",@progbits
	.align	2
	.globl	_Z17SetOneReadHandleriPFhjE
	.hidden	_Z17SetOneReadHandleriPFhjE
	.type	_Z17SetOneReadHandleriPFhjE, @function
_Z17SetOneReadHandleriPFhjE:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	lla	a0,_ZL5ANullj
	beq	a1,zero,.L74
	mv	a0,a1
.L74:
	call	_ZL13RegisterAReadPFhjE
	andi	a0,a0,0xff
	li	a5,15
	bgtu	a0,a5,.L81
	andi	a4,s0,1
	li	a5,240
	beq	a4,zero,.L76
	slli	a0,a0,4
	andi	a0,a0,0xff
	li	a5,15
.L76:
	lla	a4,_ZL8AReadIdx
	srli	s0,s0,1
	add	s0,s0,a4
	lbu	a4,0(s0)
	and	a5,a5,a4
	or	a0,a0,a5
	sb	a0,0(s0)
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L81:
	call	_ZL6SetIdxPhjh.part.0
	.size	_Z17SetOneReadHandleriPFhjE, .-_Z17SetOneReadHandleriPFhjE
	.section	.text._Z14SetReadHandleriiPFhjE,"ax",@progbits
	.align	2
	.globl	_Z14SetReadHandleriiPFhjE
	.hidden	_Z14SetReadHandleriiPFhjE
	.type	_Z14SetReadHandleriiPFhjE, @function
_Z14SetReadHandleriiPFhjE:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s1,a0
	mv	s0,a1
	beq	a2,zero,.L92
.L83:
	mv	a0,a2
	call	_ZL13RegisterAReadPFhjE
	blt	s0,s1,.L82
	andi	a1,a0,0xff
	li	a5,15
	bgtu	a1,a5,.L85
	slli	t1,a1,4
	andi	t1,t1,0xff
	addi	a2,s1,-1
	lla	a0,_ZL8AReadIdx
	j	.L86
.L93:
	srli	a5,s0,1
	add	a5,a0,a5
	lbu	t0,0(a5)
	li	a3,240
	mv	a4,a1
	and	a3,a3,t0
	or	a4,a4,a3
	addi	s0,s0,-1
	sb	a4,0(a5)
	beq	s0,a2,.L82
.L86:
	andi	a5,s0,1
	beq	a5,zero,.L93
	srli	a5,s0,1
	add	a5,a0,a5
	lbu	t0,0(a5)
	li	a3,15
	mv	a4,t1
	and	a3,a3,t0
	or	a4,a4,a3
	addi	s0,s0,-1
	sb	a4,0(a5)
	bne	s0,a2,.L86
.L82:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L92:
	lla	a2,_ZL5ANullj
	j	.L83
.L85:
	call	_ZL6SetIdxPhjh.part.0
	.size	_Z14SetReadHandleriiPFhjE, .-_Z14SetReadHandleriiPFhjE
	.section	.text._Z15GetWriteHandleri,"ax",@progbits
	.align	2
	.globl	_Z15GetWriteHandleri
	.hidden	_Z15GetWriteHandleri
	.type	_Z15GetWriteHandleri, @function
_Z15GetWriteHandleri:
	srli	a5,a0,1
	lla	a4,_ZL9BWriteIdx
	add	a5,a5,a4
	andi	a0,a0,1
	lbu	a5,0(a5)
	beq	a0,zero,.L95
	srli	a5,a5,4
	lla	a4,.LANCHOR3
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a0,0(a5)
	ret
.L95:
	andi	a5,a5,15
	lla	a4,.LANCHOR3
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a0,0(a5)
	ret
	.size	_Z15GetWriteHandleri, .-_Z15GetWriteHandleri
	.section	.text._Z18SetOneWriteHandleriPFvjhE,"ax",@progbits
	.align	2
	.globl	_Z18SetOneWriteHandleriPFvjhE
	.hidden	_Z18SetOneWriteHandleriPFvjhE
	.type	_Z18SetOneWriteHandleriPFvjhE, @function
_Z18SetOneWriteHandleriPFvjhE:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	lla	a0,_ZL5BNulljh
	beq	a1,zero,.L98
	mv	a0,a1
.L98:
	call	_ZL14RegisterBWritePFvjhE
	andi	a0,a0,0xff
	li	a5,15
	bgtu	a0,a5,.L105
	andi	a4,s0,1
	li	a5,240
	beq	a4,zero,.L100
	slli	a0,a0,4
	andi	a0,a0,0xff
	li	a5,15
.L100:
	lla	a4,_ZL9BWriteIdx
	srli	s0,s0,1
	add	s0,s0,a4
	lbu	a4,0(s0)
	and	a5,a5,a4
	or	a0,a0,a5
	sb	a0,0(s0)
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
.L105:
	call	_ZL6SetIdxPhjh.part.0
	.size	_Z18SetOneWriteHandleriPFvjhE, .-_Z18SetOneWriteHandleriPFvjhE
	.section	.text._Z15SetWriteHandleriiPFvjhE,"ax",@progbits
	.align	2
	.globl	_Z15SetWriteHandleriiPFvjhE
	.hidden	_Z15SetWriteHandleriiPFvjhE
	.type	_Z15SetWriteHandleriiPFvjhE, @function
_Z15SetWriteHandleriiPFvjhE:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	mv	s1,a0
	mv	s0,a1
	beq	a2,zero,.L116
.L107:
	mv	a0,a2
	call	_ZL14RegisterBWritePFvjhE
	blt	s0,s1,.L106
	andi	a1,a0,0xff
	li	a5,15
	bgtu	a1,a5,.L109
	slli	t1,a1,4
	andi	t1,t1,0xff
	addi	a2,s1,-1
	lla	a0,_ZL9BWriteIdx
	j	.L110
.L117:
	srli	a5,s0,1
	add	a5,a0,a5
	lbu	t0,0(a5)
	li	a3,240
	mv	a4,a1
	and	a3,a3,t0
	or	a4,a4,a3
	addi	s0,s0,-1
	sb	a4,0(a5)
	beq	s0,a2,.L106
.L110:
	andi	a5,s0,1
	beq	a5,zero,.L117
	srli	a5,s0,1
	add	a5,a0,a5
	lbu	t0,0(a5)
	li	a3,15
	mv	a4,t1
	and	a3,a3,t0
	or	a4,a4,a3
	addi	s0,s0,-1
	sb	a4,0(a5)
	bne	s0,a2,.L110
.L106:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L116:
	lla	a2,_ZL5BNulljh
	j	.L107
.L109:
	call	_ZL6SetIdxPhjh.part.0
	.size	_Z15SetWriteHandleriiPFvjhE, .-_Z15SetWriteHandleriiPFvjhE
	.section	.rodata._Z8PowerNESv.part.0.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"Power on\n"
	.section	.text._Z8PowerNESv.part.0,"ax",@progbits
	.align	2
	.type	_Z8PowerNESv.part.0, @function
_Z8PowerNESv.part.0:
	addi	sp,sp,-12
	sw	s0,4(sp)
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL5ANullj
	li	a0,0
	sw	ra,8(sp)
	sw	s1,0(sp)
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL5BNulljh
	li	a0,0
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a2,_ZL5ARAMLj
	li	a1,2047
	li	a0,0
	call	_Z14SetReadHandleriiPFhjE
	lla	a2,_ZL5BRAMLjh
	li	a1,2047
	li	a0,0
	call	_Z15SetWriteHandleriiPFvjhE
	li	s1,8192
	li	s0,4096
	addi	a1,s1,-1
	addi	a0,s0,-2048
	lla	a2,_ZL5ARAMHj
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s1,-1
	lla	a2,_ZL5BRAMHjh
	addi	a0,s0,-2048
	call	_Z15SetWriteHandleriiPFvjhE
	call	_Z15InitializeInputv
	call	_Z13FCEUSND_Powerv
	call	_Z13FCEUPPU_Powerv
	li	a0,2
	la a5, .LANCHOR1; lw a5, 0(a5);
	jalr	a5
	lla	a5,.LANCHOR6
	li	a3,0
	li	a4,0
	sw	a3,0(a5)
	sw	a4,4(a5)
	call	_Z11X6502_Powerv
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a0,.LC7
	addi	sp,sp,12
	tail	printf
	.size	_Z8PowerNESv.part.0, .-_Z8PowerNESv.part.0
	.section	.text._Z5readbi,"ax",@progbits
	.align	2
	.globl	_Z5readbi
	.hidden	_Z5readbi
	.type	_Z5readbi, @function
_Z5readbi:
	lla	a4,_ZL8AReadIdx
	srli	a5,a0,1
	add	a5,a5,a4
	andi	a4,a0,1
	lbu	a5,0(a5)
	beq	a4,zero,.L121
	srli	a5,a5,4
	slli	a5,a5,2
	lla	a4,.LANCHOR2
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
.L121:
	andi	a5,a5,15
	slli	a5,a5,2
	lla	a4,.LANCHOR2
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	.size	_Z5readbi, .-_Z5readbi
	.section	.text._Z6writebih,"ax",@progbits
	.align	2
	.globl	_Z6writebih
	.hidden	_Z6writebih
	.type	_Z6writebih, @function
_Z6writebih:
	lla	a4,_ZL9BWriteIdx
	srli	a5,a0,1
	add	a5,a5,a4
	lbu	a4,0(a5)
	andi	a3,a0,1
	andi	a5,a4,15
	beq	a3,zero,.L125
	srli	a5,a4,4
.L125:
	slli	a5,a5,2
	lla	a4,.LANCHOR3
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	.size	_Z6writebih, .-_Z6writebih
	.section	.text._Z15ResetGameLoadedv,"ax",@progbits
	.align	2
	.globl	_Z15ResetGameLoadedv
	.hidden	_Z15ResetGameLoadedv
	.type	_Z15ResetGameLoadedv, @function
_Z15ResetGameLoadedv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a5, .LANCHOR0; lw a5, 0(a5);
	beq	a5,zero,.L127
	call	_ZL14FCEU_CloseGamev
.L127:
	la a5, .LANCHOR7; sw zero, 0(a5);
	la a5, .LANCHOR8; sw zero, 0(a5);
	la a5, PPU_hook; sw zero, 0(a5);
	la a5, GameHBIRQHook; sw zero, 0(a5);
	la a5, FFCEUX_PPURead; sw zero, 0(a5);
	la a5, FFCEUX_PPUWrite; sw zero, 0(a5);
	la a5, GameExpSound+20; lw a5, 0(a5);
	beq	a5,zero,.L128
	jalr	a5
.L128:
	li	a2,24
	li	a1,0
	lla	a0,GameExpSound
	call	memset
	lla	a4,.LANCHOR9
	lbu	a5,0(a4)
	la a3, MapIRQHook; sw zero, 0(a3);
	la a3, MMC5Hack; sw zero, 0(a3);
	andi	a5,a5,1
	sb	a5,0(a4)
	lw	ra,8(sp)
	la a3, PEC586Hack; sw zero, 0(a3);
	la a3, QTAIHack; sw zero, 0(a3);
	la a5, default_palette_selection; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
	.size	_Z15ResetGameLoadedv, .-_Z15ResetGameLoadedv
	.section	.text._Z16FCEUI_Initializev,"ax",@progbits
	.align	2
	.globl	_Z16FCEUI_Initializev
	.hidden	_Z16FCEUI_Initializev
	.type	_Z16FCEUI_Initializev, @function
_Z16FCEUI_Initializev:
	addi	sp,sp,-12
	li	a0,0
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	srand
	call	_Z21FCEU_InitVirtualVideov
	li	a5,0
	beq	a0,zero,.L137
	lla	s0,.LANCHOR10
	li	a2,72
	li	a1,0
	mv	a0,s0
	call	memset
	li	a4,239
	li	a5,256
	sw	a4,52(s0)
	sw	a4,56(s0)
	li	a4,150
	sw	a5,12(s0)
	sw	a5,16(s0)
	sw	a5,20(s0)
	sw	a5,24(s0)
	sw	a5,28(s0)
	sw	a4,8(s0)
	la a3, .LANCHOR10+44; sw zero, 0(a3);
	la a3, .LANCHOR10+48; sw zero, 0(a3);
	call	_Z12FCEUPPU_Initv
	call	_Z10X6502_Initv
	li	a5,1
.L137:
	lw	ra,8(sp)
	lw	s0,4(sp)
	mv	a0,a5
	addi	sp,sp,12
	jr	ra
	.size	_Z16FCEUI_Initializev, .-_Z16FCEUI_Initializev
	.section	.text._Z10FCEUI_Killv,"ax",@progbits
	.align	2
	.globl	_Z10FCEUI_Killv
	.hidden	_Z10FCEUI_Killv
	.type	_Z10FCEUI_Killv, @function
_Z10FCEUI_Killv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z21FCEU_KillVirtualVideov
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z14FCEU_KillGeniev
	.size	_Z10FCEUI_Killv, .-_Z10FCEUI_Killv
	.section	.text._Z13FCEUI_EmulatePPhPPiS1_i,"ax",@progbits
	.align	2
	.globl	_Z13FCEUI_EmulatePPhPPiS1_i
	.hidden	_Z13FCEUI_EmulatePPhPPiS1_i
	.type	_Z13FCEUI_EmulatePPhPPiS1_i, @function
_Z13FCEUI_EmulatePPhPPiS1_i:
	addi	sp,sp,-24
	sw	s0,16(sp)
	sw	ra,20(sp)
	sw	s1,12(sp)
	la a5, .LANCHOR11; lbu a5, 0(a5);
	sw	a0,0(sp)
	sw	a1,4(sp)
	sw	a2,8(sp)
	mv	s0,a3
	bne	a5,zero,.L145
	lla	s1,.LANCHOR7
	lw	a5,0(s1)
	andi	a3,a5,2
.L146:
	bne	a3,zero,.L150
	andi	a5,a5,1
	bne	a5,zero,.L168
	call	_Z16FCEU_UpdateInputv
	mv	a0,s0
	call	_Z12FCEUPPU_Loopi
	li	a5,2
	bne	s0,a5,.L169
.L154:
	lla	a3,.LANCHOR6
	lw	a5,0(a3)
	lw	a1,4(a3)
	la a2, timestamp; lw a2, 0(a2);
	add	a2,a5,a2
	sltu	a5,a2,a5
	add	a5,a5,a1
	sw	a5,4(a3)
	la a5, timestamp; sw zero, 0(a5);
	la a5, soundtimestamp; sw zero, 0(a5);
	lw	a5,0(sp)
	sw	a2,0(a3)
	li	a0,0
	sw	zero,0(a5)
.L156:
	lw	a5,4(sp)
	sw	zero,0(a5)
	lw	a5,8(sp)
	sw	a0,0(a5)
	lw	a5,0(s1)
	andi	a5,a5,2
	beq	a5,zero,.L144
	li	a5,1
	sw	a5,0(s1)
.L144:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L145:
	lla	a2,.LANCHOR12
	lw	a3,0(a2)
	la a1, .LANCHOR13; lw a1, 0(a1);
	bne	a3,zero,.L170
	lla	s1,.LANCHOR7
	li	a5,2
	sw	a5,0(s1)
	ble	a1,zero,.L148
	li	a5,1
	sw	a5,0(a2)
	li	a5,2
.L150:
	andi	a5,a5,-2
.L148:
	sw	a5,0(s1)
.L172:
	call	_Z16FCEU_UpdateInputv
	mv	a0,s0
	call	_Z12FCEUPPU_Loopi
	li	a5,2
	beq	s0,a5,.L154
.L169:
	call	_Z17FlushEmulateSoundv
	lla	a3,.LANCHOR6
	lw	a5,0(a3)
	lw	a1,4(a3)
	la a2, timestamp; lw a2, 0(a2);
	add	a2,a5,a2
	sltu	a5,a2,a5
	add	a5,a5,a1
	sw	a5,4(a3)
	sw	a2,0(a3)
	la a5, timestamp; sw zero, 0(a5);
	la a5, soundtimestamp; sw zero, 0(a5);
	bne	s0,zero,.L159
	la a5, XBuf; lw a5, 0(a5);
.L155:
	lw	a4,0(sp)
	sw	a5,0(a4)
	j	.L156
.L170:
	blt	a3,a1,.L171
	li	a5,2
	lla	s1,.LANCHOR7
	sw	a5,0(s1)
	j	.L172
.L171:
	lla	s1,.LANCHOR7
	lw	a5,0(s1)
	addi	a3,a3,1
	sw	a3,0(a2)
	andi	a3,a5,2
	j	.L146
.L168:
	lla	s0,XBuf
	lw	a0,0(s0)
	li	a2,65536
	li	a1,0
	call	memset
	lw	a5,0(s0)
	lw	a4,0(sp)
	lw	ra,20(sp)
	lw	s0,16(sp)
	sw	a5,0(a4)
	lw	a5,4(sp)
	lw	s1,12(sp)
	sw	zero,0(a5)
	lw	a5,8(sp)
	sw	zero,0(a5)
	addi	sp,sp,24
	jr	ra
.L159:
	li	a5,0
	j	.L155
	.size	_Z13FCEUI_EmulatePPhPPiS1_i, .-_Z13FCEUI_EmulatePPhPPiS1_i
	.section	.text._Z15FCEUI_CloseGamev,"ax",@progbits
	.align	2
	.globl	_Z15FCEUI_CloseGamev
	.hidden	_Z15FCEUI_CloseGamev
	.type	_Z15FCEUI_CloseGamev, @function
_Z15FCEUI_CloseGamev:
	tail	_ZL14FCEU_CloseGamev
	.size	_Z15FCEUI_CloseGamev, .-_Z15FCEUI_CloseGamev
	.section	.text._Z21xoroshiro128plus_nextv,"ax",@progbits
	.align	2
	.globl	_Z21xoroshiro128plus_nextv
	.hidden	_Z21xoroshiro128plus_nextv
	.type	_Z21xoroshiro128plus_nextv, @function
_Z21xoroshiro128plus_nextv:
	li	a0,0
	li	a1,0
	ret
	.size	_Z21xoroshiro128plus_nextv, .-_Z21xoroshiro128plus_nextv
	.section	.text._Z15FCEU_MemoryRandPhjb,"ax",@progbits
	.align	2
	.globl	_Z15FCEU_MemoryRandPhjb
	.hidden	_Z15FCEU_MemoryRandPhjb
	.type	_Z15FCEU_MemoryRandPhjb, @function
_Z15FCEU_MemoryRandPhjb:
	ret
	.size	_Z15FCEU_MemoryRandPhjb, .-_Z15FCEU_MemoryRandPhjb
	.section	.text._Z8PowerNESv,"ax",@progbits
	.align	2
	.globl	_Z8PowerNESv
	.hidden	_Z8PowerNESv
	.type	_Z8PowerNESv, @function
_Z8PowerNESv:
	la a5, .LANCHOR0; lw a5, 0(a5);
	beq	a5,zero,.L176
	tail	_Z8PowerNESv.part.0
.L176:
	ret
	.size	_Z8PowerNESv, .-_Z8PowerNESv
	.section	.text._Z16FCEU_ResetVidSysv,"ax",@progbits
	.align	2
	.globl	_Z16FCEU_ResetVidSysv
	.hidden	_Z16FCEU_ResetVidSysv
	.type	_Z16FCEU_ResetVidSysv, @function
_Z16FCEU_ResetVidSysv:
	la a5, .LANCHOR0; lw a5, 0(a5);
	lw	a5,12(a5)
	addi	sp,sp,-12
	sw	ra,8(sp)
	beq	a5,zero,.L179
	li	a4,1
	beq	a5,a4,.L180
	la a5, .LANCHOR10; lw a5, 0(a5);
	beq	a5,zero,.L179
.L180:
	li	a5,1
	la a4, .LANCHOR9; sb a5, 0(a4);
	la a5, dendy; sw zero, 0(a5);
	la a5, newppu; lw a5, 0(a5);
	beq	a5,zero,.L198
	addi	a5,a5,240
	li	a0,1
	la a4, .LANCHOR4; sb zero, 0(a4);
	la a4, .LANCHOR5; sw a5, 0(a4);
	la a4, .LANCHOR15; sw a5, 0(a4);
	call	_Z22FCEUPPU_SetVideoSystemi
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z17SetSoundVariablesv
.L179:
	la a5, .LANCHOR9; sb zero, 0(a5);
	la a5, newppu; lw a5, 0(a5);
	la a0, dendy; lw a0, 0(a0);
	bne	a5,zero,.L181
	la a4, .LANCHOR4; lbu a4, 0(a4);
	beq	a0,zero,.L188
	li	a0,1
	li	a5,290
.L185:
	la a3, .LANCHOR5; sw a5, 0(a3);
	beq	a4,zero,.L186
	la a4, .LANCHOR14; lw a4, 0(a4);
	add	a5,a5,a4
.L186:
	la a4, .LANCHOR15; sw a5, 0(a4);
	call	_Z22FCEUPPU_SetVideoSystemi
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z17SetSoundVariablesv
.L181:
	la a4, .LANCHOR4; sb zero, 0(a4);
	beq	a0,zero,.L199
	addi	a5,a5,290
	li	a0,1
	la a4, .LANCHOR5; sw a5, 0(a4);
	la a4, .LANCHOR15; sw a5, 0(a4);
	call	_Z22FCEUPPU_SetVideoSystemi
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z17SetSoundVariablesv
.L198:
	la a4, .LANCHOR4; lbu a4, 0(a4);
	li	a0,1
	li	a5,240
	j	.L185
.L188:
	li	a5,240
	j	.L185
.L199:
	addi	a5,a5,240
	la a4, .LANCHOR5; sw a5, 0(a4);
	j	.L186
	.size	_Z16FCEU_ResetVidSysv, .-_Z16FCEU_ResetVidSysv
	.section	.rodata._Z21FCEUI_LoadGameVirtualPKcib.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	"nes"
	.align	2
.LC9:
	.string	"fds"
	.align	2
.LC10:
	.string	"rb"
	.align	2
.LC11:
	.string	"Error opening \"%s\"!"
	.align	2
.LC12:
	.string	"Loading ...\n\n"
	.align	2
.LC13:
	.string	"PAL mode set\n"
	.align	2
.LC14:
	.string	"Dendy mode set\n"
	.align	2
.LC15:
	.string	"NTSC mode set\n"
	.align	2
.LC16:
	.string	"An error occurred while loading the file."
	.section	.text._Z21FCEUI_LoadGameVirtualPKcib,"ax",@progbits
	.align	2
	.globl	_Z21FCEUI_LoadGameVirtualPKcib
	.hidden	_Z21FCEUI_LoadGameVirtualPKcib
	.type	_Z21FCEUI_LoadGameVirtualPKcib, @function
_Z21FCEUI_LoadGameVirtualPKcib:
	addi	sp,sp,-2044
	li	a3,-4096
	li	t0,4096
	sw	s0,2036(sp)
	sw	s1,2032(sp)
	sw	ra,2040(sp)
	addi	a4,a3,2032
	addi	sp,sp,-56
	addi	t1,t0,-2028
	add	t1,t1,a4
	addi	a4,sp,20
	add	a4,t1,a4
	sw	a4,0(sp)
	addi	t1,t0,-2028
	addi	a4,t0,-2028
	lla	t0,.LANCHOR9
	lbu	t0,0(t0)
	addi	a5,a3,2036
	add	t1,t1,a3
	sw	t0,16(sp)
	lla	t0,dendy
	lw	t0,0(t0)
	addi	a3,sp,20
	add	a3,t1,a3
	sw	a3,4(sp)
	sw	t0,20(sp)
	lw	t0,4(sp)
	mv	t1,a2
	sw	t1,12(sp)
	lla	t1,.LC8
	add	a4,a4,a5
	sw	t1,2036(t0)
	addi	a5,sp,20
	lla	t1,.LC9
	mv	s1,a1
	add	a5,a4,a5
	li	a3,0
	li	a4,-1
	lla	a2,.LC10
	li	a1,0
	sw	t1,2040(t0)
	sw	zero,2044(t0)
	sw	zero,2032(t0)
	sw	s1,8(sp)
	mv	s0,a0
	call	_Z10FCEU_fopenPKcS0_S0_PciPS0_Pi
	mv	s1,a0
	beq	a0,zero,.L230
	mv	a1,s0
	addi	a0,sp,40
	call	strcpy
	call	_Z15ResetGameLoadedv
	lla	a0,.LC12
	call	printf
	call	_ZL14FCEU_CloseGamev
	li	a0,60
	call	malloc
	lla	s0,.LANCHOR0
	li	a2,60
	li	a1,0
	sw	a0,0(s0)
	call	memset
	lw	a2,4(s1)
	lw	a5,0(s0)
	li	a3,-1
	mv	a1,s1
	sw	a2,56(a5)
	li	a2,2
	sw	a2,12(a5)
	lw	a2,8(sp)
	sw	zero,52(a5)
	sw	zero,48(a5)
	sw	zero,0(a5)
	sw	zero,8(a5)
	sw	a3,20(a5)
	sw	a3,16(a5)
	sw	a3,24(a5)
	sw	zero,28(a5)
	addi	a0,sp,40
	call	_Z8iNESLoadPKcP8FCEUFILEi
	beq	a0,zero,.L203
	lw	a5,8(sp)
	bne	a5,zero,.L231
.L204:
	lw	a5,0(s0)
	beq	a5,zero,.L205
	call	_Z8PowerNESv.part.0
	lw	a5,0(s0)
.L205:
	lw	a3,8(a5)
	li	a5,3
	beq	a3,a5,.L206
	call	_Z20FCEU_LoadGamePalettev
.L206:
	call	_Z17FCEU_ResetPalettev
	lw	a5,16(sp)
	bne	a5,zero,.L207
	lla	a5,.LANCHOR9
	lbu	a5,0(a5)
	bne	a5,zero,.L232
	lw	a5,20(sp)
	bne	a5,zero,.L215
	lla	a5,dendy
	lw	a5,0(a5)
	beq	a5,zero,.L209
	j	.L216
.L203:
	lw	a5,12(sp)
	beq	a5,zero,.L233
.L212:
	lw	a0,0(s0)
	call	free
	la a5, .LANCHOR0; sw zero, 0(a5);
.L209:
	mv	a0,s1
	call	_Z11FCEU_fcloseP8FCEUFILE
	lw	s1,0(s0)
.L200:
	addi	sp,sp,56
	lw	ra,2040(sp)
	mv	a0,s1
	lw	s0,2036(sp)
	lw	s1,2032(sp)
	addi	sp,sp,2044
	jr	ra
.L207:
	lw	a5,20(sp)
	beq	a5,zero,.L234
	lla	a5,.LANCHOR9
	lbu	a5,0(a5)
	bne	a5,zero,.L209
.L215:
	lla	a5,dendy
	lw	a5,0(a5)
	bne	a5,zero,.L209
.L213:
	lla	a0,.LC15
	call	printf
	lla	a0,.LC15
	call	printf
	j	.L209
.L234:
	lla	a5,dendy
	lw	a5,0(a5)
	beq	a5,zero,.L235
.L216:
	lla	a0,.LC14
	call	printf
	lla	a0,.LC14
	call	printf
	j	.L209
.L232:
	lla	a0,.LC13
	call	printf
	lla	a0,.LC13
	call	printf
	j	.L209
.L230:
	lw	a5,12(sp)
	bne	a5,zero,.L200
	lw	a5,4(sp)
	lw	a5,2032(a5)
	bne	a5,zero,.L200
	mv	a1,s0
	lla	a0,.LC11
	call	printf
	j	.L200
.L231:
	call	_Z16FCEU_ResetVidSysv
	j	.L204
.L233:
	lla	a0,.LC16
	call	printf
	j	.L212
.L235:
	lla	a5,.LANCHOR9
	lbu	a5,0(a5)
	beq	a5,zero,.L213
	j	.L209
	.size	_Z21FCEUI_LoadGameVirtualPKcib, .-_Z21FCEUI_LoadGameVirtualPKcib
	.section	.text._Z14FCEUI_LoadGamePKcib,"ax",@progbits
	.align	2
	.globl	_Z14FCEUI_LoadGamePKcib
	.hidden	_Z14FCEUI_LoadGamePKcib
	.type	_Z14FCEUI_LoadGamePKcib, @function
_Z14FCEUI_LoadGamePKcib:
	tail	_Z21FCEUI_LoadGameVirtualPKcib
	.size	_Z14FCEUI_LoadGamePKcib, .-_Z14FCEUI_LoadGamePKcib
	.section	.text._Z22FCEUI_SetRenderedLinesiiii,"ax",@progbits
	.align	2
	.globl	_Z22FCEUI_SetRenderedLinesiiii
	.hidden	_Z22FCEUI_SetRenderedLinesiiii
	.type	_Z22FCEUI_SetRenderedLinesiiii, @function
_Z22FCEUI_SetRenderedLinesiiii:
	lla	a5,.LANCHOR10
	sw	a0,44(a5)
	sw	a1,52(a5)
	sw	a2,48(a5)
	sw	a3,56(a5)
	la a4, .LANCHOR9; lbu a4, 0(a4);
	bne	a4,zero,.L238
	la a4, dendy; lw a4, 0(a4);
	beq	a4,zero,.L239
.L238:
	sw	a2,36(a5)
	sw	a3,40(a5)
	ret
.L239:
	mv	a2,a0
	mv	a3,a1
	sw	a2,36(a5)
	sw	a3,40(a5)
	ret
	.size	_Z22FCEUI_SetRenderedLinesiiii, .-_Z22FCEUI_SetRenderedLinesiiii
	.section	.text._Z18FCEUI_SetVidSystemi,"ax",@progbits
	.align	2
	.globl	_Z18FCEUI_SetVidSystemi
	.hidden	_Z18FCEUI_SetVidSystemi
	.type	_Z18FCEUI_SetVidSystemi, @function
_Z18FCEUI_SetVidSystemi:
	snez	a0,a0
	la a5, .LANCHOR10; sw a0, 0(a5);
	la a5, .LANCHOR0; lw a5, 0(a5);
	beq	a5,zero,.L240
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z16FCEU_ResetVidSysv
	call	_Z17FCEU_ResetPalettev
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z18FCEUD_VideoChangedv
.L240:
	ret
	.size	_Z18FCEUI_SetVidSystemi, .-_Z18FCEUI_SetVidSystemi
	.section	.text._Z25FCEUI_GetCurrentVidSystemPiS_,"ax",@progbits
	.align	2
	.globl	_Z25FCEUI_GetCurrentVidSystemPiS_
	.hidden	_Z25FCEUI_GetCurrentVidSystemPiS_
	.type	_Z25FCEUI_GetCurrentVidSystemPiS_, @function
_Z25FCEUI_GetCurrentVidSystemPiS_:
	beq	a0,zero,.L246
	la a5, .LANCHOR10+36; lw a5, 0(a5);
	sw	a5,0(a0)
.L246:
	beq	a1,zero,.L247
	la a5, .LANCHOR10+40; lw a5, 0(a5);
	sw	a5,0(a1)
.L247:
	la a0, .LANCHOR9; lbu a0, 0(a0);
	ret
	.size	_Z25FCEUI_GetCurrentVidSystemPiS_, .-_Z25FCEUI_GetCurrentVidSystemPiS_
	.section	.text._Z15FCEUI_SetRegionii,"ax",@progbits
	.align	2
	.globl	_Z15FCEUI_SetRegionii
	.hidden	_Z15FCEUI_SetRegionii
	.type	_Z15FCEUI_SetRegionii, @function
_Z15FCEUI_SetRegionii:
	li	a5,1
	beq	a0,a5,.L255
	li	a4,2
	beq	a0,a4,.L256
	beq	a0,zero,.L257
	lla	a4,.LANCHOR5
	lw	a5,0(a4)
	la a0, pal_emulation; lw a0, 0(a0);
	snez	a0,a0
.L258:
	la a3, newppu; lw a3, 0(a3);
	add	a5,a5,a3
	sw	a5,0(a4)
	la a4, .LANCHOR4; lbu a4, 0(a4);
	beq	a4,zero,.L259
	la a4, .LANCHOR14; lw a4, 0(a4);
	add	a5,a5,a4
.L259:
	la a4, .LANCHOR15; sw a5, 0(a4);
	la a5, .LANCHOR10; sw a0, 0(a5);
	la a5, .LANCHOR0; lw a5, 0(a5);
	beq	a5,zero,.L268
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z16FCEU_ResetVidSysv
	call	_Z17FCEU_ResetPalettev
	call	_Z18FCEUD_VideoChangedv
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z18RefreshThrottleFPSv
.L268:
	tail	_Z18RefreshThrottleFPSv
.L257:
	la a5, pal_emulation; sw zero, 0(a5);
	la a5, dendy; sw zero, 0(a5);
	li	a5,240
	lla	a4,.LANCHOR5
	j	.L258
.L256:
	la a4, dendy; sw a5, 0(a4);
	la a4, pal_emulation; sw zero, 0(a4);
	li	a0,0
	li	a5,290
	lla	a4,.LANCHOR5
	j	.L258
.L255:
	la a5, pal_emulation; sw a0, 0(a5);
	la a5, dendy; sw zero, 0(a5);
	li	a5,240
	lla	a4,.LANCHOR5
	j	.L258
	.size	_Z15FCEUI_SetRegionii, .-_Z15FCEUI_SetRegionii
	.section	.text._Z19FCEUI_GetDesiredFPSv,"ax",@progbits
	.align	2
	.globl	_Z19FCEUI_GetDesiredFPSv
	.hidden	_Z19FCEUI_GetDesiredFPSv
	.type	_Z19FCEUI_GetDesiredFPSv, @function
_Z19FCEUI_GetDesiredFPSv:
	la a5, .LANCHOR9; lbu a5, 0(a5);
	li	a0,50
	bne	a5,zero,.L271
	la a0, dendy; lw a0, 0(a0);
	snez	a0,a0
	neg	a0,a0
	andi	a0,a0,-10
	addi	a0,a0,60
.L271:
	ret
	.size	_Z19FCEUI_GetDesiredFPSv, .-_Z19FCEUI_GetDesiredFPSv
	.section	.text._Z21FCEUI_EmulationPausedv,"ax",@progbits
	.align	2
	.globl	_Z21FCEUI_EmulationPausedv
	.hidden	_Z21FCEUI_EmulationPausedv
	.type	_Z21FCEUI_EmulationPausedv, @function
_Z21FCEUI_EmulationPausedv:
	la a0, .LANCHOR7; lw a0, 0(a0);
	andi	a0,a0,1
	ret
	.size	_Z21FCEUI_EmulationPausedv, .-_Z21FCEUI_EmulationPausedv
	.section	.text._Z23FCEU_TextScanlineOffseti,"ax",@progbits
	.align	2
	.globl	_Z23FCEU_TextScanlineOffseti
	.hidden	_Z23FCEU_TextScanlineOffseti
	.type	_Z23FCEU_TextScanlineOffseti, @function
_Z23FCEU_TextScanlineOffseti:
	la a0, .LANCHOR10+36; lw a0, 0(a0);
	slli	a0,a0,8
	ret
	.size	_Z23FCEU_TextScanlineOffseti, .-_Z23FCEU_TextScanlineOffseti
	.section	.text._Z33FCEU_TextScanlineOffsetFromBottomi,"ax",@progbits
	.align	2
	.globl	_Z33FCEU_TextScanlineOffsetFromBottomi
	.hidden	_Z33FCEU_TextScanlineOffsetFromBottomi
	.type	_Z33FCEU_TextScanlineOffsetFromBottomi, @function
_Z33FCEU_TextScanlineOffsetFromBottomi:
	la a5, .LANCHOR10+40; lw a5, 0(a5);
	sub	a0,a5,a0
	slli	a0,a0,8
	ret
	.size	_Z33FCEU_TextScanlineOffsetFromBottomi, .-_Z33FCEU_TextScanlineOffsetFromBottomi
	.hidden	FSettings
	.globl	FSettings
	.hidden	PAL
	.globl	PAL
	.hidden	RAM
	.globl	RAM
	.hidden	EnableAutosave
	.globl	EnableAutosave
	.hidden	AutosaveFrequency
	.globl	AutosaveFrequency
	.hidden	AutosaveQty
	.globl	AutosaveQty
	.hidden	frameAdvance_Delay
	.globl	frameAdvance_Delay
	.hidden	frameAdvance_Delay_count
	.globl	frameAdvance_Delay_count
	.hidden	frameAdvanceRequested
	.globl	frameAdvanceRequested
	.hidden	EmulationPaused
	.globl	EmulationPaused
	.hidden	GameStateRestore
	.globl	GameStateRestore
	.hidden	GameInterface
	.globl	GameInterface
	.hidden	GameInfo
	.globl	GameInfo
	.hidden	timestampbase
	.globl	timestampbase
	.hidden	vblankscanlines
	.globl	vblankscanlines
	.hidden	postrenderscanlines
	.globl	postrenderscanlines
	.hidden	totalscanlines
	.globl	totalscanlines
	.hidden	normalscanlines
	.globl	normalscanlines
	.hidden	skip_7bit_overclocking
	.globl	skip_7bit_overclocking
	.hidden	overclocking
	.globl	overclocking
	.hidden	overclock_enabled
	.globl	overclock_enabled
	.section	.bss.FSettings,"aw",@nobits
	.align	2
	.set	.LANCHOR10,. + 0
	.type	FSettings, @object
	.size	FSettings, 72
FSettings:
	.zero	72
	.section	.bss.RAM,"aw",@nobits
	.align	2
	.type	RAM, @object
	.size	RAM, 2048
RAM:
	.zero	2048
	.section	.bss._ZL5ARead,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	_ZL5ARead, @object
	.size	_ZL5ARead, 64
_ZL5ARead:
	.zero	64
	.section	.bss._ZL6BWrite,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL6BWrite, @object
	.size	_ZL6BWrite, 64
_ZL6BWrite:
	.zero	64
	.section	.bss._ZL8AReadIdx,"aw",@nobits
	.align	2
	.type	_ZL8AReadIdx, @object
	.size	_ZL8AReadIdx, 32768
_ZL8AReadIdx:
	.zero	32768
	.section	.bss._ZL9BWriteIdx,"aw",@nobits
	.align	2
	.type	_ZL9BWriteIdx, @object
	.size	_ZL9BWriteIdx, 32768
_ZL9BWriteIdx:
	.zero	32768
	.section	.sbss.EmulationPaused,"aw",@nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	EmulationPaused, @object
	.size	EmulationPaused, 4
EmulationPaused:
	.zero	4
	.section	.sbss.EnableAutosave,"aw",@nobits
	.align	2
	.type	EnableAutosave, @object
	.size	EnableAutosave, 4
EnableAutosave:
	.zero	4
	.section	.sbss.GameInfo,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	GameInfo, @object
	.size	GameInfo, 4
GameInfo:
	.zero	4
	.section	.sbss.GameInterface,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	GameInterface, @object
	.size	GameInterface, 4
GameInterface:
	.zero	4
	.section	.sbss.GameStateRestore,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	GameStateRestore, @object
	.size	GameStateRestore, 4
GameStateRestore:
	.zero	4
	.section	.sbss.PAL,"aw",@nobits
	.set	.LANCHOR9,. + 0
	.type	PAL, @object
	.size	PAL, 1
PAL:
	.zero	1
	.section	.sbss.frameAdvanceRequested,"aw",@nobits
	.set	.LANCHOR11,. + 0
	.type	frameAdvanceRequested, @object
	.size	frameAdvanceRequested, 1
frameAdvanceRequested:
	.zero	1
	.section	.sbss.frameAdvance_Delay_count,"aw",@nobits
	.align	2
	.set	.LANCHOR12,. + 0
	.type	frameAdvance_Delay_count, @object
	.size	frameAdvance_Delay_count, 4
frameAdvance_Delay_count:
	.zero	4
	.section	.sbss.normalscanlines,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	normalscanlines, @object
	.size	normalscanlines, 4
normalscanlines:
	.zero	4
	.section	.sbss.overclock_enabled,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	overclock_enabled, @object
	.size	overclock_enabled, 1
overclock_enabled:
	.zero	1
	.section	.sbss.overclocking,"aw",@nobits
	.type	overclocking, @object
	.size	overclocking, 1
overclocking:
	.zero	1
	.section	.sbss.postrenderscanlines,"aw",@nobits
	.align	2
	.set	.LANCHOR14,. + 0
	.type	postrenderscanlines, @object
	.size	postrenderscanlines, 4
postrenderscanlines:
	.zero	4
	.section	.sbss.timestampbase,"aw",@nobits
	.align	3
	.set	.LANCHOR6,. + 0
	.type	timestampbase, @object
	.size	timestampbase, 8
timestampbase:
	.zero	8
	.section	.sbss.totalscanlines,"aw",@nobits
	.align	2
	.set	.LANCHOR15,. + 0
	.type	totalscanlines, @object
	.size	totalscanlines, 4
totalscanlines:
	.zero	4
	.section	.sbss.vblankscanlines,"aw",@nobits
	.align	2
	.type	vblankscanlines, @object
	.size	vblankscanlines, 4
vblankscanlines:
	.zero	4
	.section	.sdata.AutosaveFrequency,"aw"
	.align	2
	.type	AutosaveFrequency, @object
	.size	AutosaveFrequency, 4
AutosaveFrequency:
	.word	256
	.section	.sdata.AutosaveQty,"aw"
	.align	2
	.type	AutosaveQty, @object
	.size	AutosaveQty, 4
AutosaveQty:
	.word	4
	.section	.sdata.frameAdvance_Delay,"aw"
	.align	2
	.set	.LANCHOR13,. + 0
	.type	frameAdvance_Delay, @object
	.size	frameAdvance_Delay, 4
frameAdvance_Delay:
	.word	10
	.section	.sdata.skip_7bit_overclocking,"aw"
	.type	skip_7bit_overclocking, @object
	.size	skip_7bit_overclocking, 1
skip_7bit_overclocking:
	.byte	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
