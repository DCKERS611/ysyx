#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"unrom512.cpp"
	.option nopic
	.text
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	la a5, .LANCHOR0; lw a5, 0(a5);
	jr	a5
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL19UNROM512LLatchWritejh,"ax",@progbits
	.align	2
	.type	_ZL19UNROM512LLatchWritejh, @function
_ZL19UNROM512LLatchWritejh:
	la a5, .LANCHOR1; sb a1, 0(a5);
	la a5, .LANCHOR2; sh a0, 0(a5);
	la a5, .LANCHOR3; lw a5, 0(a5);
	jr	a5
	.size	_ZL19UNROM512LLatchWritejh, .-_ZL19UNROM512LLatchWritejh
	.section	.text._ZL18UNROM512LatchClosev,"ax",@progbits
	.align	2
	.type	_ZL18UNROM512LatchClosev, @function
_ZL18UNROM512LatchClosev:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a0, .LANCHOR4; lw a0, 0(a0);
	beq	a0,zero,.L5
	call	_Z10FCEU_gfreePv
.L5:
	la a0, .LANCHOR5; lw a0, 0(a0);
	beq	a0,zero,.L6
	call	_Z10FCEU_gfreePv
.L6:
	lw	ra,8(sp)
	la a5, .LANCHOR4; sw zero, 0(a5);
	la a5, .LANCHOR5; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
	.size	_ZL18UNROM512LatchClosev, .-_ZL18UNROM512LatchClosev
	.section	.text._ZL19UNROM512HLatchWritejh,"ax",@progbits
	.align	2
	.type	_ZL19UNROM512HLatchWritejh, @function
_ZL19UNROM512HLatchWritejh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	la a5, .LANCHOR6; lbu a5, 0(a5);
	mv	s1,a0
	mv	s0,a1
	bne	a5,zero,.L21
.L15:
	la a5, .LANCHOR1; sb s0, 0(a5);
	lw	s0,4(sp)
	la a5, .LANCHOR2; sh s1, 0(a5);
	lw	ra,8(sp)
	lw	s1,0(sp)
	la a5, .LANCHOR0; lw a5, 0(a5);
	addi	sp,sp,12
	jr	a5
.L21:
	call	_Z6CartBRj
	sub	a0,a0,s0
	seqz	a0,a0
	neg	a0,a0
	and	s0,s0,a0
	j	.L15
	.size	_ZL19UNROM512HLatchWritejh, .-_ZL19UNROM512HLatchWritejh
	.section	.text._ZL18UNROM512LatchPowerv,"ax",@progbits
	.align	2
	.type	_ZL18UNROM512LatchPowerv, @function
_ZL18UNROM512LatchPowerv:
	addi	sp,sp,-12
	la a5, .LANCHOR7; lbu a5, 0(a5);
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a4, .LANCHOR1; sb a5, 0(a4);
	la a5, .LANCHOR0; lw a5, 0(a5);
	jalr	a5
	li	s0,65536
	lla	a2,_ZL17UNROM512LatchReadj
	addi	a1,s0,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	la a5, .LANCHOR8; lbu a5, 0(a5);
	bne	a5,zero,.L23
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL19UNROM512HLatchWritejh
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
.L23:
	li	a1,49152
	lla	a2,_ZL19UNROM512LLatchWritejh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_ZL19UNROM512HLatchWritejh
	li	a0,49152
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL18UNROM512LatchPowerv, .-_ZL18UNROM512LatchPowerv
	.section	.text._ZL17UNROM512LatchReadj,"ax",@progbits
	.align	2
	.type	_ZL17UNROM512LatchReadj, @function
_ZL17UNROM512LatchReadj:
	li	a5,-20480
	addi	sp,sp,-4
	addi	a5,a5,1717
	sh	a5,0(sp)
	li	a5,-73
	sb	a5,2(sp)
	la a5, .LANCHOR9; lbu a5, 0(a5);
	beq	a5,zero,.L27
	andi	a5,a0,1
	li	a0,191
	beq	a5,zero,.L28
	la a5, ROM_size; lw a5, 0(a5);
	srli	a5,a5,4
	addi	a5,a5,4
	add	a5,a5,sp
	lbu	a0,-4(a5)
.L28:
	addi	sp,sp,4
	jr	ra
.L27:
	la a4, .LANCHOR8; lbu a4, 0(a4);
	srli	a5,a0,11
	beq	a4,zero,.L29
	srli	a3,a0,12
	li	a4,49152
	la a2, .LANCHOR4; lw a2, 0(a2);
	andi	a3,a3,3
	bgeu	a0,a4,.L30
	la a4, .LANCHOR10; lbu a4, 0(a4);
	slli	a4,a4,2
	add	a4,a4,a3
	slli	a4,a4,2
	add	a4,a2,a4
	lw	a4,0(a4)
	bne	a4,zero,.L43
.L29:
	slli	a5,a5,2
	lla	a4,Page
	add	a5,a4,a5
	lw	a5,0(a5)
	add	a5,a5,a0
	lbu	a0,0(a5)
	addi	sp,sp,4
	jr	ra
.L30:
	la a4, ROM_size; lw a4, 0(a4);
	addi	a4,a4,-1
	andi	a4,a4,0xff
	slli	a4,a4,2
	add	a4,a4,a3
	slli	a4,a4,2
	add	a2,a2,a4
	lw	a4,0(a2)
	beq	a4,zero,.L29
.L43:
	slli	a4,a5,2
	lla	a5,.LANCHOR11
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a0
	lbu	a0,0(a5)
	j	.L28
	.size	_ZL17UNROM512LatchReadj, .-_ZL17UNROM512LatchReadj
	.section	.text._ZL13UNROM512LSyncv,"ax",@progbits
	.align	2
	.type	_ZL13UNROM512LSyncv, @function
_ZL13UNROM512LSyncv:
	lla	a5,.LANCHOR12
	lw	a4,20(a5)
	lw	t1,16(a5)
	addi	sp,sp,-96
	lw	a3,24(a5)
	sw	a4,0(sp)
	lw	a4,40(a5)
	lw	a2,28(a5)
	lw	a1,32(a5)
	lw	a0,36(a5)
	lw	t2,8(a5)
	lw	t0,12(a5)
	sw	s0,88(sp)
	sw	s1,84(sp)
	lw	s0,4(a5)
	lw	s1,0(a5)
	sw	t1,40(sp)
	lw	t1,0(sp)
	sw	ra,92(sp)
	sw	a3,4(sp)
	sw	a4,20(sp)
	lla	a4,.LANCHOR13
	lw	a3,56(a5)
	sw	a2,8(sp)
	sw	a1,12(sp)
	lw	a2,52(a5)
	lw	a1,48(a5)
	sw	a0,16(sp)
	sw	s1,24(sp)
	lw	a0,44(a5)
	sw	s0,28(sp)
	lbu	a5,0(a4)
	sw	t2,32(sp)
	sw	t0,36(sp)
	sw	t1,44(sp)
	lw	t1,4(sp)
	sw	a0,68(sp)
	sw	a1,72(sp)
	sw	t1,48(sp)
	lw	t1,8(sp)
	sw	a2,76(sp)
	sw	a3,80(sp)
	sw	t1,52(sp)
	lw	t1,12(sp)
	sw	t1,56(sp)
	lw	t1,16(sp)
	sw	t1,60(sp)
	lw	t1,20(sp)
	sw	t1,64(sp)
	bne	a5,zero,.L45
	lla	a0,.LANCHOR14
	lbu	a3,0(a0)
	addi	t1,sp,24
	la a1, .LANCHOR2; lhu a1, 0(a1);
	slli	a5,a3,2
	addi	a5,a5,60
	add	a5,a5,t1
	lw	t1,-60(a5)
	la a2, .LANCHOR1; lbu a2, 0(a2);
	beq	a1,t1,.L68
.L46:
	li	a5,2
	beq	a3,a5,.L69
.L49:
	li	a5,240
	bne	a2,a5,.L51
	la a5, .LANCHOR9; sb zero, 0(a5);
.L51:
	la a5, .LANCHOR14; sb zero, 0(a5);
.L44:
	lw	ra,92(sp)
	lw	s0,88(sp)
	lw	s1,84(sp)
	addi	sp,sp,96
	jr	ra
.L45:
	li	a4,1
	beq	a5,a4,.L70
	li	a3,2
	bne	a5,a3,.L44
	lla	s1,.LANCHOR2
	lhu	a3,0(s1)
	la a5, .LANCHOR10; lbu a5, 0(a5);
	slli	a5,a5,2
	srli	a2,a3,12
	andi	a2,a2,3
	add	a5,a5,a2
	slli	a5,a5,2
	la a2, .LANCHOR4; lw a2, 0(a2);
	add	a5,a2,a5
	lw	a2,0(a5)
	lla	s0,.LANCHOR11
	beq	a2,zero,.L71
.L60:
	srli	a5,a3,11
	slli	a5,a5,2
	add	s0,s0,a5
	lw	a5,0(s0)
	la a2, .LANCHOR1; lbu a2, 0(a2);
	add	a5,a5,a3
	lbu	a4,0(a5)
	and	a4,a4,a2
	sb	a4,0(a5)
.L67:
	lw	ra,92(sp)
	lw	s0,88(sp)
	la a5, .LANCHOR14; sb zero, 0(a5);
	la a5, .LANCHOR13; sb zero, 0(a5);
	lw	s1,84(sp)
	addi	sp,sp,96
	jr	ra
.L68:
	lw	t1,-40(a5)
	bne	a2,t1,.L46
	lw	a5,-20(a5)
	la t1, .LANCHOR10; lbu t1, 0(t1);
	bne	t1,a5,.L46
	addi	a3,a3,1
	andi	a3,a3,0xff
	sb	a3,0(a0)
	li	a5,5
	bne	a3,a5,.L44
	li	a5,1
	sb	a5,0(a4)
	j	.L44
.L70:
	la a5, .LANCHOR1; lbu a5, 0(a5);
	li	a4,48
	beq	a5,a4,.L72
	li	a4,16
	bne	a5,a4,.L67
	lla	a1,ROM_size
	lw	a2,0(a1)
	slli	a5,a2,2
	beq	a5,zero,.L56
	la a0, .LANCHOR4; lw a0, 0(a0);
	li	a3,0
.L58:
	andi	a5,a3,1023
	slli	a5,a5,2
	add	a5,a0,a5
	lw	a4,0(a5)
	addi	a3,a3,1
	addi	a4,a4,1
	bne	a4,zero,.L57
	li	a4,1
.L57:
	sw	a4,0(a5)
	lw	a2,0(a1)
	slli	a5,a2,2
	bgtu	a5,a3,.L58
.L56:
	slli	a2,a2,14
	li	a1,255
	la a0, .LANCHOR5; lw a0, 0(a0);
	call	memset
	j	.L67
.L69:
	li	a5,36864
	addi	a5,a5,1365
	bne	a1,a5,.L49
	li	a5,160
	beq	a2,a5,.L73
	li	a5,144
	bne	a2,a5,.L49
	la a5, .LANCHOR10; lbu a5, 0(a5);
	li	a4,1
	bne	a5,a4,.L51
	la a4, .LANCHOR14; sb zero, 0(a4);
	la a4, .LANCHOR9; sb a5, 0(a4);
	j	.L44
.L73:
	la a2, .LANCHOR10; lbu a2, 0(a2);
	li	a5,1
	bne	a2,a5,.L51
	li	a5,3
	sb	a5,0(a0)
	sb	a3,0(a4)
	j	.L44
.L71:
	srli	a2,a3,9
	andi	a2,a2,120
	lla	a1,Page
	add	a1,a1,a2
	add	a2,s0,a2
	lw	a1,0(a1)
	lw	a0,0(a2)
	li	a2,-4096
	and	a3,a3,a2
	add	a1,a1,a3
	add	a0,a0,a3
	sw	a4,0(a5)
	li	a2,4096
	call	memcpy
	lhu	a3,0(s1)
	j	.L60
.L72:
	la a4, .LANCHOR2; lhu a4, 0(a4);
	la a5, .LANCHOR10; lbu a5, 0(a5);
	srli	a3,a4,12
	andi	a3,a3,3
	slli	a5,a5,2
	add	a5,a5,a3
	slli	a5,a5,2
	la a3, .LANCHOR4; lw a3, 0(a3);
	add	a3,a3,a5
	lw	a5,0(a3)
	addi	a5,a5,1
	bne	a5,zero,.L54
	li	a5,1
.L54:
	srli	a1,a4,9
	andi	a1,a1,120
	lla	a2,.LANCHOR11
	add	a2,a2,a1
	lw	a0,0(a2)
	li	a2,-4096
	and	a4,a4,a2
	sw	a5,0(a3)
	li	a2,4096
	li	a1,255
	add	a0,a0,a4
	call	memset
	j	.L67
	.size	_ZL13UNROM512LSyncv, .-_ZL13UNROM512LSyncv
	.section	.text._Z9setfprg16jj,"ax",@progbits
	.align	2
	.globl	_Z9setfprg16jj
	.hidden	_Z9setfprg16jj
	.type	_Z9setfprg16jj, @function
_Z9setfprg16jj:
	la a5, PRGsize; lw a5, 0(a5);
	li	a2,16384
	la a3, .LANCHOR5; lw a3, 0(a3);
	bltu	a5,a2,.L75
	srli	a2,a0,11
	la a5, PRGmask16; lw a5, 0(a5);
	beq	a3,zero,.L76
	and	a4,a5,a1
	slli	a4,a4,14
	sub	a4,a4,a0
	slli	a2,a2,2
	add	a4,a3,a4
	lla	a5,.LANCHOR11
	lla	a3,.LANCHOR11-32
	add	a5,a5,a2
	add	a3,a3,a2
.L77:
	sw	a4,28(a5)
	addi	a5,a5,-4
	bne	a3,a5,.L77
	ret
.L75:
	addi	sp,sp,-4
	slli	a4,a1,3
	li	a1,4096
	sw	s0,0(sp)
	la t0, PRGmask2; lw t0, 0(t0);
	add	a2,a0,a2
	lla	t1,.LANCHOR11
	addi	a1,a1,-2048
.L81:
	and	a5,t0,a4
	slli	a5,a5,11
	sub	t2,a5,a0
	srli	a5,a0,11
	slli	a5,a5,2
	add	a5,t1,a5
	add	a0,a0,a1
	li	s0,0
	beq	a3,zero,.L80
	add	s0,a3,t2
.L80:
	sw	s0,0(a5)
	addi	a4,a4,1
	bne	a0,a2,.L81
	lw	s0,0(sp)
	addi	sp,sp,4
	jr	ra
.L76:
	slli	a2,a2,2
	lla	a5,.LANCHOR11
	lla	a4,.LANCHOR11-32
	add	a5,a5,a2
	add	a4,a4,a2
.L78:
	sw	zero,28(a5)
	addi	a5,a5,-4
	bne	a5,a4,.L78
	ret
	.size	_Z9setfprg16jj, .-_Z9setfprg16jj
	.section	.text._ZL13UNROM512HSyncv,"ax",@progbits
	.align	2
	.type	_ZL13UNROM512HSyncv, @function
_ZL13UNROM512HSyncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR1
	lbu	a5,0(s0)
	la a1, ROM_size; lw a1, 0(a1);
	addi	a1,a1,-1
	sw	s1,0(sp)
	and	a1,a1,a5
	lla	s1,.LANCHOR10
	li	a0,32768
	sw	ra,8(sp)
	sb	a1,0(s1)
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	lbu	a1,0(s1)
	li	a0,32768
	call	_Z9setfprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z9setfprg16jj
	lbu	a1,0(s0)
	la a5, .LANCHOR15; lbu a5, 0(a5);
	li	a0,0
	and	a1,a1,a5
	srli	a1,a1,5
	call	_Z8setchr8rij
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	srli	a0,a0,7
	addi	a0,a0,2
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL13UNROM512HSyncv, .-_ZL13UNROM512HSyncv
	.section	.text._Z21inc_flash_write_counthj,"ax",@progbits
	.align	2
	.globl	_Z21inc_flash_write_counthj
	.hidden	_Z21inc_flash_write_counthj
	.type	_Z21inc_flash_write_counthj, @function
_Z21inc_flash_write_counthj:
	srli	a1,a1,12
	andi	a1,a1,3
	slli	a0,a0,2
	add	a1,a1,a0
	slli	a1,a1,2
	la a4, .LANCHOR4; lw a4, 0(a4);
	add	a4,a4,a1
	lw	a5,0(a4)
	addi	a5,a5,1
	bne	a5,zero,.L93
	li	a5,1
.L93:
	sw	a5,0(a4)
	ret
	.size	_Z21inc_flash_write_counthj, .-_Z21inc_flash_write_counthj
	.section	.text._Z18GetFlashWriteCounthj,"ax",@progbits
	.align	2
	.globl	_Z18GetFlashWriteCounthj
	.hidden	_Z18GetFlashWriteCounthj
	.type	_Z18GetFlashWriteCounthj, @function
_Z18GetFlashWriteCounthj:
	srli	a1,a1,12
	andi	a1,a1,3
	slli	a0,a0,2
	add	a0,a0,a1
	slli	a0,a0,2
	la a5, .LANCHOR4; lw a5, 0(a5);
	add	a5,a5,a0
	lw	a0,0(a5)
	ret
	.size	_Z18GetFlashWriteCounthj, .-_Z18GetFlashWriteCounthj
	.section	.rodata._Z13UNROM512_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"FLASH_WRITE_COUNT"
	.align	2
.LC4:
	.string	"FLASH_DATA"
	.align	2
.LC5:
	.string	"FLASH_STATE"
	.align	2
.LC6:
	.string	"FLASH_MODE"
	.align	2
.LC7:
	.string	"FLASH_BANK"
	.align	2
.LC8:
	.string	"LATA"
	.align	2
.LC9:
	.string	"LATC"
	.align	2
.LC10:
	.string	"BUSC"
	.section	.text._Z13UNROM512_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13UNROM512_InitP8CartInfo
	.hidden	_Z13UNROM512_InitP8CartInfo
	.type	_Z13UNROM512_InitP8CartInfo, @function
_Z13UNROM512_InitP8CartInfo:
	lw	a5,48(a0)
	addi	sp,sp,-12
	lw	a2,68(a0)
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	lla	s1,.LANCHOR8
	sb	a5,0(s1)
	la a4, .LANCHOR14; sb zero, 0(a4);
	la a4, .LANCHOR10; sb zero, 0(a4);
	li	a5,8192
	mv	s0,a0
	li	a3,0
	beq	a2,a5,.L96
	li	a5,16384
	li	a3,32
	beq	a2,a5,.L96
	li	a3,96
.L96:
	la a4, head+6; lbu a4, 0(a4);
	srli	a5,a4,2
	andi	a5,a5,2
	andi	a4,a4,1
	or	a5,a5,a4
	la a1, .LANCHOR15; sb a3, 0(a1);
	li	a4,2
	beq	a5,a4,.L97
	li	a4,3
	beq	a5,a4,.L98
	li	a4,1
	li	a2,0
	li	a1,1
	beq	a5,a4,.L99
	li	a0,0
	call	_Z18SetupCartMirroringiiPh
.L100:
	lw	a5,48(s0)
	lbu	a4,0(s1)
	seqz	a5,a5
	la a3, .LANCHOR6; sb a5, 0(a3);
	lla	a5,_ZL18UNROM512LatchPowerv
	sw	a5,0(s0)
	la a5, .LANCHOR7; sb zero, 0(a5);
	lla	a5,_ZL13UNROM512LSyncv
	la a3, .LANCHOR3; sw a5, 0(a3);
	lla	a5,_ZL13UNROM512HSyncv
	la a3, .LANCHOR0; sw a5, 0(a3);
	lla	a5,_ZL18UNROM512LatchClosev
	sw	a5,8(s0)
	lla	a5,_ZL12StateRestorei
	la a3, GameStateRestore; sw a5, 0(a3);
	bne	a4,zero,.L108
.L101:
	lla	a3,.LC9
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR1
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a3,.LC10
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR6
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
.L108:
	lla	s1,ROM_size
	lw	a0,0(s1)
	slli	a0,a0,14
	call	_Z12FCEU_gmallocj
	lw	a4,0(s1)
	lla	a5,.LANCHOR5
	sw	a0,0(a5)
	slli	a0,a4,4
	call	_Z12FCEU_gmallocj
	lw	a3,0(s1)
	lla	a5,.LANCHOR5
	lw	t0,0(a5)
	slli	t1,a3,14
	slli	a1,a3,4
	sw	t1,32(s0)
	sw	t0,16(s0)
	sw	a0,12(s0)
	sw	a1,28(s0)
	lla	a3,.LC3
	li	a2,0
	la t1, .LANCHOR4; sw a0, 0(t1);
	call	_Z10AddExStatePvjiPKc
	lla	a5,.LANCHOR5
	lw	a1,0(s1)
	lw	a0,0(a5)
	lla	a3,.LC4
	li	a2,0
	slli	a1,a1,14
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC5
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR14
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC6
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR13
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC7
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR10
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC8
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR2
	call	_Z10AddExStatePvjiPKc
	j	.L101
.L99:
	li	a0,1
	call	_Z18SetupCartMirroringiiPh
	j	.L100
.L98:
	li	a5,-8192
	add	a2,a2,a5
	la a5, VROM; lw a5, 0(a5);
	add	a2,a5,a2
	li	a1,1
	li	a0,4
	call	_Z18SetupCartMirroringiiPh
	j	.L100
.L97:
	li	a2,0
	li	a1,0
	li	a0,2
	call	_Z18SetupCartMirroringiiPh
	j	.L100
	.size	_Z13UNROM512_InitP8CartInfo, .-_Z13UNROM512_InitP8CartInfo
	.section	.rodata
	.align	2
	.set	.LANCHOR12,. + 0
.LC0:
	.word	38229
	.word	43690
	.word	38229
	.word	38229
	.word	43690
.LC1:
	.word	170
	.word	85
	.word	128
	.word	170
	.word	85
.LC2:
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.section	.bss._ZL9FlashPage,"aw",@nobits
	.align	2
	.set	.LANCHOR11,. + 0
	.type	_ZL9FlashPage, @object
	.size	_ZL9FlashPage, 128
_ZL9FlashPage:
	.zero	128
	.section	.sbss._ZL10flash_bank,"aw",@nobits
	.set	.LANCHOR10,. + 0
	.type	_ZL10flash_bank, @object
	.size	_ZL10flash_bank, 1
_ZL10flash_bank:
	.zero	1
	.section	.sbss._ZL10flash_mode,"aw",@nobits
	.set	.LANCHOR13,. + 0
	.type	_ZL10flash_mode, @object
	.size	_ZL10flash_mode, 1
_ZL10flash_mode:
	.zero	1
	.section	.sbss._ZL10flash_save,"aw",@nobits
	.set	.LANCHOR8,. + 0
	.type	_ZL10flash_save, @object
	.size	_ZL10flash_save, 1
_ZL10flash_save:
	.zero	1
	.section	.sbss._ZL10latcheinit,"aw",@nobits
	.set	.LANCHOR7,. + 0
	.type	_ZL10latcheinit, @object
	.size	_ZL10latcheinit, 1
_ZL10latcheinit:
	.zero	1
	.section	.sbss._ZL11chrram_mask,"aw",@nobits
	.set	.LANCHOR15,. + 0
	.type	_ZL11chrram_mask, @object
	.size	_ZL11chrram_mask, 1
_ZL11chrram_mask:
	.zero	1
	.section	.sbss._ZL11flash_state,"aw",@nobits
	.set	.LANCHOR14,. + 0
	.type	_ZL11flash_state, @object
	.size	_ZL11flash_state, 1
_ZL11flash_state:
	.zero	1
	.section	.sbss._ZL11software_id,"aw",@nobits
	.set	.LANCHOR9,. + 0
	.type	_ZL11software_id, @object
	.size	_ZL11software_id, 1
_ZL11software_id:
	.zero	1
	.section	.sbss._ZL12bus_conflict,"aw",@nobits
	.set	.LANCHOR6,. + 0
	.type	_ZL12bus_conflict, @object
	.size	_ZL12bus_conflict, 1
_ZL12bus_conflict:
	.zero	1
	.section	.sbss._ZL17flash_write_count,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL17flash_write_count, @object
	.size	_ZL17flash_write_count, 4
_ZL17flash_write_count:
	.zero	4
	.section	.sbss._ZL6WHSync,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL6WHSync, @object
	.size	_ZL6WHSync, 4
_ZL6WHSync:
	.zero	4
	.section	.sbss._ZL6WLSync,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZL6WLSync, @object
	.size	_ZL6WLSync, 4
_ZL6WLSync:
	.zero	4
	.section	.sbss._ZL6latcha,"aw",@nobits
	.align	1
	.set	.LANCHOR2,. + 0
	.type	_ZL6latcha, @object
	.size	_ZL6latcha, 2
_ZL6latcha:
	.zero	2
	.section	.sbss._ZL6latche,"aw",@nobits
	.set	.LANCHOR1,. + 0
	.type	_ZL6latche, @object
	.size	_ZL6latche, 1
_ZL6latche:
	.zero	1
	.section	.sbss._ZL9flashdata,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL9flashdata, @object
	.size	_ZL9flashdata, 4
_ZL9flashdata:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
