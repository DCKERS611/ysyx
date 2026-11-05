#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"datalatch.cpp"
	.option nopic
	.text
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	la a5, .LANCHOR0; lw a5, 0(a5);
	jr	a5
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL10LatchClosev,"ax",@progbits
	.align	2
	.type	_ZL10LatchClosev, @function
_ZL10LatchClosev:
	la a0, .LANCHOR1; lw a0, 0(a0);
	beq	a0,zero,.L9
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR1; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L9:
	la a5, .LANCHOR1; sw zero, 0(a5);
	ret
	.size	_ZL10LatchClosev, .-_ZL10LatchClosev
	.section	.text._ZL9UNROMSyncv,"ax",@progbits
	.align	2
	.type	_ZL9UNROMSyncv, @function
_ZL9UNROMSyncv:
	addi	sp,sp,-12
	la a1, .LANCHOR2; lbu a1, 0(a1);
	li	a0,32768
	sw	ra,8(sp)
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,-1
	call	_Z8setprg16jj
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL9UNROMSyncv, .-_ZL9UNROMSyncv
	.section	.text._ZL6M8Syncv,"ax",@progbits
	.align	2
	.type	_ZL6M8Syncv, @function
_ZL6M8Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR2
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	srli	a1,a1,3
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,1
	call	_Z8setprg16jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a0,a0,3
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL6M8Syncv, .-_ZL6M8Syncv
	.section	.text._ZL7M70Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M70Syncv, @function
_ZL7M70Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR2
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	srli	a1,a1,4
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,-1
	call	_Z8setprg16jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a0,a0,15
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL7M70Syncv, .-_ZL7M70Syncv
	.section	.text._ZL11SSUNROMSyncv,"ax",@progbits
	.align	2
	.type	_ZL11SSUNROMSyncv, @function
_ZL11SSUNROMSyncv:
	la a1, .LANCHOR2; lbu a1, 0(a1);
	addi	sp,sp,-12
	srli	a1,a1,4
	li	a0,32768
	sw	ra,8(sp)
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,-1
	call	_Z8setprg16jj
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL11SSUNROMSyncv, .-_ZL11SSUNROMSyncv
	.section	.text._ZL7M94Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M94Syncv, @function
_ZL7M94Syncv:
	la a1, .LANCHOR2; lbu a1, 0(a1);
	addi	sp,sp,-12
	srli	a1,a1,2
	li	a0,32768
	sw	ra,8(sp)
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,-1
	call	_Z8setprg16jj
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL7M94Syncv, .-_ZL7M94Syncv
	.section	.text._ZL8M180Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M180Syncv, @function
_ZL8M180Syncv:
	addi	sp,sp,-12
	li	a1,0
	li	a0,32768
	sw	ra,8(sp)
	call	_Z8setprg16jj
	li	a0,49152
	la a1, .LANCHOR2; lbu a1, 0(a1);
	call	_Z8setprg16jj
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL8M180Syncv, .-_ZL8M180Syncv
	.section	.text._ZL8M203Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M203Syncv, @function
_ZL8M203Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR2
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	srli	a1,a1,2
	andi	a1,a1,3
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	li	a0,49152
	srli	a1,a1,2
	andi	a1,a1,3
	call	_Z8setprg16jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a0,a0,3
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL8M203Syncv, .-_ZL8M203Syncv
	.section	.text._ZL10LatchWritejh,"ax",@progbits
	.align	2
	.type	_ZL10LatchWritejh, @function
_ZL10LatchWritejh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	la a5, .LANCHOR3; lbu a5, 0(a5);
	mv	s0,a1
	bne	a5,zero,.L32
.L27:
	la a5, .LANCHOR2; sb s0, 0(a5);
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a5, .LANCHOR0; lw a5, 0(a5);
	addi	sp,sp,12
	jr	a5
.L32:
	call	_Z6CartBRj
	and	s0,a0,s0
	j	.L27
	.size	_ZL10LatchWritejh, .-_ZL10LatchWritejh
	.section	.rodata._ZL10Latch_InitP8CartInfoPFvvEhtthh.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.align	2
.LC1:
	.string	"LATC"
	.section	.text._ZL10Latch_InitP8CartInfoPFvvEhtthh,"ax",@progbits
	.align	2
	.type	_ZL10Latch_InitP8CartInfoPFvvEhtthh, @function
_ZL10Latch_InitP8CartInfoPFvvEhtthh:
	addi	sp,sp,-12
	lbu	t1,12(sp)
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	sw	s1,0(sp)
	lla	t0,_ZL10LatchPowerv
	lw	a0,52(a0)
	sw	t0,0(s0)
	la t0, .LANCHOR3; sb t1, 0(t0);
	la t1, .LANCHOR4; sb a2, 0(t1);
	la a2, .LANCHOR5; sh a3, 0(a2);
	la a3, .LANCHOR6; sh a4, 0(a3);
	la a4, .LANCHOR0; sw a1, 0(a4);
	lla	a4,_ZL10LatchClosev
	sw	a4,8(s0)
	lla	a4,_ZL12StateRestorei
	la a3, GameStateRestore; sw a4, 0(a3);
	beq	a0,zero,.L34
	lw	a4,64(s0)
	lw	a3,60(s0)
	add	a4,a4,a3
	ble	a4,zero,.L35
.L42:
	li	a5,8192
	lla	s1,.LANCHOR7
	li	a0,8192
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	li	a3,1
	lla	a4,.LANCHOR1
	mv	a1,a0
	li	a0,16
	sw	a1,0(a4)
	li	s1,32768
	call	_Z19SetupCartPRGMappingiPhji
	lla	a2,_Z6CartBRj
	addi	a1,s1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	lla	a2,_Z6CartBWjh
	addi	a1,s1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	lw	a3,64(s0)
	beq	a3,zero,.L37
	lla	a4,.LANCHOR1
	lw	a4,0(a4)
	li	a5,8192
	sw	a5,28(s0)
	sw	a4,12(s0)
.L37:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR2
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
.L34:
	beq	a5,zero,.L37
	lla	s1,.LANCHOR7
	li	a5,8192
	li	a0,8192
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	a5,.LANCHOR1
	li	a0,16
	li	a3,1
	sw	a1,0(a5)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a4,48(s0)
	lla	a5,.LANCHOR1
	lw	a0,0(a5)
	lw	a1,0(s1)
	beq	a4,zero,.L39
	sw	a0,12(s0)
	sw	a1,28(s0)
.L39:
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	j	.L37
.L35:
	beq	a5,zero,.L37
	j	.L42
	.size	_ZL10Latch_InitP8CartInfoPFvvEhtthh, .-_ZL10Latch_InitP8CartInfoPFvvEhtthh
	.section	.text._ZL9NROMPowerv,"ax",@progbits
	.align	2
	.type	_ZL9NROMPowerv, @function
_ZL9NROMPowerv:
	addi	sp,sp,-12
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z8setprg8rijj
	li	a1,-2
	li	a0,32768
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	li	a0,0
	call	_Z7setchr8j
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR7; lw a0, 0(a0);
	la a2, .LANCHOR1; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	tail	_Z16FCEU_CheatAddRAMijPh
	.size	_ZL9NROMPowerv, .-_ZL9NROMPowerv
	.section	.text._ZL10LatchPowerv,"ax",@progbits
	.align	2
	.type	_ZL10LatchPowerv, @function
_ZL10LatchPowerv:
	addi	sp,sp,-12
	la a5, .LANCHOR4; lbu a5, 0(a5);
	sw	s0,4(sp)
	la a4, .LANCHOR2; sb a5, 0(a4);
	sw	ra,8(sp)
	la a5, .LANCHOR0; lw a5, 0(a5);
	lla	s0,.LANCHOR1
	jalr	a5
	lw	a5,0(s0)
	beq	a5,zero,.L47
	li	a1,65536
	addi	a1,a1,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	addi	a1,a1,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	lw	a2,0(s0)
	la a0, .LANCHOR7; lw a0, 0(a0);
	li	a1,24576
	srli	a0,a0,10
	call	_Z16FCEU_CheatAddRAMijPh
.L48:
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a1, .LANCHOR6; lhu a1, 0(a1);
	la a0, .LANCHOR5; lhu a0, 0(a0);
	lla	a2,_ZL10LatchWritejh
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
.L47:
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	j	.L48
	.size	_ZL10LatchPowerv, .-_ZL10LatchPowerv
	.section	.text._ZL9CNROMSyncv,"ax",@progbits
	.align	2
	.type	_ZL9CNROMSyncv, @function
_ZL9CNROMSyncv:
	addi	sp,sp,-12
	la a0, .LANCHOR2; lbu a0, 0(a0);
	sw	ra,8(sp)
	call	_Z7setchr8j
	li	a1,0
	li	a0,32768
	call	_Z8setprg32jj
	lw	ra,8(sp)
	li	a2,0
	li	a1,24576
	li	a0,16
	addi	sp,sp,12
	tail	_Z8setprg8rijj
	.size	_ZL9CNROMSyncv, .-_ZL9CNROMSyncv
	.section	.text._ZL7M11Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M11Syncv, @function
_ZL7M11Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR2
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	andi	a1,a1,15
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,4
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL7M11Syncv, .-_ZL7M11Syncv
	.section	.text._ZL7M38Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M38Syncv, @function
_ZL7M38Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR2
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	andi	a1,a1,3
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,2
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL7M38Syncv, .-_ZL7M38Syncv
	.section	.text._ZL9MHROMSyncv,"ax",@progbits
	.align	2
	.type	_ZL9MHROMSyncv, @function
_ZL9MHROMSyncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR2
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	srli	a1,a1,4
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a0,a0,15
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL9MHROMSyncv, .-_ZL9MHROMSyncv
	.section	.text._ZL7M86Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M86Syncv, @function
_ZL7M86Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR2
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	srli	a1,a1,4
	andi	a1,a1,3
	call	_Z8setprg32jj
	lbu	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a5,4
	andi	a0,a0,4
	andi	a5,a5,3
	or	a0,a0,a5
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL7M86Syncv, .-_ZL7M86Syncv
	.section	.text._ZL7M87Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M87Syncv, @function
_ZL7M87Syncv:
	addi	sp,sp,-12
	li	a0,32768
	li	a1,0
	sw	ra,8(sp)
	call	_Z8setprg32jj
	la a5, .LANCHOR2; lbu a5, 0(a5);
	lw	ra,8(sp)
	srli	a0,a5,1
	slli	a5,a5,1
	andi	a0,a0,1
	andi	a5,a5,2
	or	a0,a0,a5
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL7M87Syncv, .-_ZL7M87Syncv
	.section	.text._ZL8M101Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M101Syncv, @function
_ZL8M101Syncv:
	addi	sp,sp,-12
	li	a0,32768
	li	a1,0
	sw	ra,8(sp)
	call	_Z8setprg32jj
	lw	ra,8(sp)
	la a0, .LANCHOR2; lbu a0, 0(a0);
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL8M101Syncv, .-_ZL8M101Syncv
	.section	.text._ZL8M107Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M107Syncv, @function
_ZL8M107Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR2
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	srli	a1,a1,1
	andi	a1,a1,3
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a0,a0,7
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL8M107Syncv, .-_ZL8M107Syncv
	.section	.text._ZL8M113Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M113Syncv, @function
_ZL8M113Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR2
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	srli	a1,a1,3
	andi	a1,a1,7
	call	_Z8setprg32jj
	lbu	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a5,3
	andi	a0,a0,8
	andi	a5,a5,7
	or	a0,a0,a5
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL8M113Syncv, .-_ZL8M113Syncv
	.section	.text._ZL8M240Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M240Syncv, @function
_ZL8M240Syncv:
	addi	sp,sp,-12
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z8setprg8rijj
	lla	s0,.LANCHOR2
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,4
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a0,a0,15
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL8M240Syncv, .-_ZL8M240Syncv
	.section	.text._ZL8M241Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M241Syncv, @function
_ZL8M241Syncv:
	addi	sp,sp,-12
	li	a0,0
	sw	ra,8(sp)
	call	_Z7setchr8j
	li	a1,24576
	li	a2,0
	li	a0,16
	call	_Z8setprg8rijj
	la a1, .LANCHOR2; lbu a1, 0(a1);
	slli	a5,a1,24
	srai	a5,a5,24
	bge	a5,zero,.L71
	ori	a1,a1,8
.L71:
	lw	ra,8(sp)
	li	a0,32768
	addi	sp,sp,12
	tail	_Z8setprg32jj
	.size	_ZL8M241Syncv, .-_ZL8M241Syncv
	.section	.text._ZL9ANROMSyncv,"ax",@progbits
	.align	2
	.type	_ZL9ANROMSyncv, @function
_ZL9ANROMSyncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR2
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	andi	a1,a1,15
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	srli	a0,a0,4
	andi	a0,a0,1
	addi	a0,a0,2
	call	_Z9setmirrori
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL9ANROMSyncv, .-_ZL9ANROMSyncv
	.section	.text._ZL7M78Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M78Syncv, @function
_ZL7M78Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR2
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	andi	a1,a1,7
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	lbu	a0,0(s0)
	srli	a0,a0,4
	call	_Z7setchr8j
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,3
	andi	a0,a0,1
	addi	a0,a0,2
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL7M78Syncv, .-_ZL7M78Syncv
	.section	.text._ZL7M89Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M89Syncv, @function
_ZL7M89Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR2
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	srli	a1,a1,4
	andi	a1,a1,7
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	lbu	a5,0(s0)
	srli	a0,a5,4
	andi	a0,a0,8
	andi	a5,a5,7
	or	a0,a0,a5
	call	_Z7setchr8j
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,3
	andi	a0,a0,1
	addi	a0,a0,2
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL7M89Syncv, .-_ZL7M89Syncv
	.section	.text._ZL7M97Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M97Syncv, @function
_ZL7M97Syncv:
	addi	sp,sp,-12
	li	a0,0
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z7setchr8j
	li	a1,-1
	li	a0,32768
	call	_Z8setprg16jj
	lla	s0,.LANCHOR2
	lbu	a1,0(s0)
	li	a0,49152
	andi	a1,a1,15
	call	_Z8setprg16jj
	lbu	a5,0(s0)
	li	a3,1
	srli	a4,a5,6
	beq	a4,a3,.L80
	li	a3,2
	bne	a4,a3,.L82
	li	a0,1
	call	_Z9setmirrori
	lbu	a5,0(s0)
.L82:
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a5,1
	slli	a5,a5,1
	andi	a0,a0,1
	andi	a5,a5,2
	or	a0,a0,a5
	addi	sp,sp,12
	tail	_Z7setchr8j
.L80:
	li	a0,0
	call	_Z9setmirrori
	lbu	a5,0(s0)
	j	.L82
	.size	_ZL7M97Syncv, .-_ZL7M97Syncv
	.section	.text._ZL8M152Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M152Syncv, @function
_ZL8M152Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR2
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	srli	a1,a1,4
	andi	a1,a1,7
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	lbu	a0,0(s0)
	andi	a0,a0,15
	call	_Z7setchr8j
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,7
	addi	a0,a0,2
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL8M152Syncv, .-_ZL8M152Syncv
	.section	.text._ZL12BMCA65ASSyncv,"ax",@progbits
	.align	2
	.type	_ZL12BMCA65ASSyncv, @function
_ZL12BMCA65ASSyncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR2
	lbu	a5,0(s0)
	sw	ra,8(sp)
	andi	a4,a5,64
	srli	a1,a5,1
	beq	a4,zero,.L87
	andi	a1,a1,15
	li	a0,32768
	call	_Z8setprg32jj
	li	a0,0
	call	_Z7setchr8j
	lbu	a0,0(s0)
	slli	a5,a0,24
	srai	a5,a5,24
	blt	a5,zero,.L92
.L89:
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,3
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L87:
	andi	a5,a5,7
	andi	a1,a1,24
	or	a1,a1,a5
	li	a0,32768
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	li	a0,49152
	srli	a1,a1,1
	andi	a1,a1,24
	ori	a1,a1,7
	call	_Z8setprg16jj
	li	a0,0
	call	_Z7setchr8j
	lbu	a0,0(s0)
	slli	a5,a0,24
	srai	a5,a5,24
	bge	a5,zero,.L89
.L92:
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,5
	andi	a0,a0,1
	addi	a0,a0,2
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL12BMCA65ASSyncv, .-_ZL12BMCA65ASSyncv
	.section	.text._ZL12BMC11160Syncv,"ax",@progbits
	.align	2
	.type	_ZL12BMC11160Syncv, @function
_ZL12BMC11160Syncv:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR2
	sw	s0,4(sp)
	lbu	s0,0(s1)
	li	a0,32768
	sw	ra,8(sp)
	srli	s0,s0,4
	andi	s0,s0,7
	mv	a1,s0
	call	_Z8setprg32jj
	lbu	a0,0(s1)
	slli	s0,s0,2
	andi	a0,a0,3
	or	a0,a0,s0
	call	_Z7setchr8j
	lbu	a0,0(s1)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	srli	a0,a0,7
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL12BMC11160Syncv, .-_ZL12BMC11160Syncv
	.section	.text._ZL9CPROMSyncv,"ax",@progbits
	.align	2
	.type	_ZL9CPROMSyncv, @function
_ZL9CPROMSyncv:
	addi	sp,sp,-12
	li	a1,0
	li	a0,0
	sw	ra,8(sp)
	call	_Z7setchr4jj
	la a1, .LANCHOR2; lbu a1, 0(a1);
	andi	a1,a1,3
	li	a0,4096
	call	_Z7setchr4jj
	lw	ra,8(sp)
	li	a1,0
	li	a0,32768
	addi	sp,sp,12
	tail	_Z8setprg32jj
	.size	_ZL9CPROMSyncv, .-_ZL9CPROMSyncv
	.section	.text._ZL8M184Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M184Syncv, @function
_ZL8M184Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR2
	lbu	a1,0(s0)
	li	a0,0
	sw	ra,8(sp)
	call	_Z7setchr4jj
	lbu	a1,0(s0)
	li	a0,4096
	srli	a1,a1,4
	call	_Z7setchr4jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a1,0
	li	a0,32768
	addi	sp,sp,12
	tail	_Z8setprg32jj
	.size	_ZL8M184Syncv, .-_ZL8M184Syncv
	.section	.text._ZL7M29Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M29Syncv, @function
_ZL7M29Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR2
	lbu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	srli	a1,a1,2
	andi	a1,a1,7
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	li	a0,0
	andi	a1,a1,3
	call	_Z8setchr8rij
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a2,0
	li	a1,24576
	li	a0,16
	addi	sp,sp,12
	tail	_Z8setprg8rijj
	.size	_ZL7M29Syncv, .-_ZL7M29Syncv
	.section	.text._Z9NROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z9NROM_InitP8CartInfo
	.hidden	_Z9NROM_InitP8CartInfo
	.type	_Z9NROM_InitP8CartInfo, @function
_Z9NROM_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL9NROMPowerv
	sw	a5,0(a0)
	lla	a5,_ZL10LatchClosev
	lla	s1,.LANCHOR7
	sw	a5,8(a0)
	mv	s0,a0
	li	a5,8192
	li	a0,8192
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	a5,.LANCHOR1
	li	a0,16
	li	a3,1
	sw	a1,0(a5)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a4,48(s0)
	lla	a5,.LANCHOR1
	lw	a0,0(a5)
	lw	a1,0(s1)
	beq	a4,zero,.L103
	sw	a0,12(s0)
	sw	a1,28(s0)
.L103:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a3,.LC0
	li	a2,0
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z9NROM_InitP8CartInfo, .-_Z9NROM_InitP8CartInfo
	.section	.text._Z10UNROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10UNROM_InitP8CartInfo
	.hidden	_Z10UNROM_InitP8CartInfo
	.type	_Z10UNROM_InitP8CartInfo, @function
_Z10UNROM_InitP8CartInfo:
	addi	sp,sp,-16
	li	a5,1
	li	a4,65536
	sw	a5,0(sp)
	addi	a4,a4,-1
	li	a5,0
	li	a3,32768
	li	a2,0
	lla	a1,_ZL9UNROMSyncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z10UNROM_InitP8CartInfo, .-_Z10UNROM_InitP8CartInfo
	.section	.text._Z10CNROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10CNROM_InitP8CartInfo
	.hidden	_Z10CNROM_InitP8CartInfo
	.type	_Z10CNROM_InitP8CartInfo, @function
_Z10CNROM_InitP8CartInfo:
	addi	sp,sp,-16
	li	a5,1
	li	a4,65536
	sw	a5,0(sp)
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL9CNROMSyncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z10CNROM_InitP8CartInfo, .-_Z10CNROM_InitP8CartInfo
	.section	.text._Z10ANROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10ANROM_InitP8CartInfo
	.hidden	_Z10ANROM_InitP8CartInfo
	.type	_Z10ANROM_InitP8CartInfo, @function
_Z10ANROM_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,65536
	li	a3,16384
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	addi	a3,a3,32
	li	a2,0
	lla	a1,_ZL9ANROMSyncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z10ANROM_InitP8CartInfo, .-_Z10ANROM_InitP8CartInfo
	.section	.text._Z12Mapper8_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12Mapper8_InitP8CartInfo
	.hidden	_Z12Mapper8_InitP8CartInfo
	.type	_Z12Mapper8_InitP8CartInfo, @function
_Z12Mapper8_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL6M8Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z12Mapper8_InitP8CartInfo, .-_Z12Mapper8_InitP8CartInfo
	.section	.text._Z13Mapper11_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper11_InitP8CartInfo
	.hidden	_Z13Mapper11_InitP8CartInfo
	.type	_Z13Mapper11_InitP8CartInfo, @function
_Z13Mapper11_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL7M11Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z13Mapper11_InitP8CartInfo, .-_Z13Mapper11_InitP8CartInfo
	.section	.text._Z14Mapper144_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper144_InitP8CartInfo
	.hidden	_Z14Mapper144_InitP8CartInfo
	.type	_Z14Mapper144_InitP8CartInfo, @function
_Z14Mapper144_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,65536
	li	a3,32768
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	addi	a3,a3,1
	li	a2,0
	lla	a1,_ZL7M11Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z14Mapper144_InitP8CartInfo, .-_Z14Mapper144_InitP8CartInfo
	.section	.text._Z10CPROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10CPROM_InitP8CartInfo
	.hidden	_Z10CPROM_InitP8CartInfo
	.type	_Z10CPROM_InitP8CartInfo, @function
_Z10CPROM_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL9CPROMSyncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z10CPROM_InitP8CartInfo, .-_Z10CPROM_InitP8CartInfo
	.section	.text._Z13Mapper29_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper29_InitP8CartInfo
	.hidden	_Z13Mapper29_InitP8CartInfo
	.type	_Z13Mapper29_InitP8CartInfo, @function
_Z13Mapper29_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,1
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL7M29Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z13Mapper29_InitP8CartInfo, .-_Z13Mapper29_InitP8CartInfo
	.section	.text._Z13Mapper38_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper38_InitP8CartInfo
	.hidden	_Z13Mapper38_InitP8CartInfo
	.type	_Z13Mapper38_InitP8CartInfo, @function
_Z13Mapper38_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,32768
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,28672
	li	a2,0
	lla	a1,_ZL7M38Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z13Mapper38_InitP8CartInfo, .-_Z13Mapper38_InitP8CartInfo
	.section	.text._Z10MHROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10MHROM_InitP8CartInfo
	.hidden	_Z10MHROM_InitP8CartInfo
	.type	_Z10MHROM_InitP8CartInfo, @function
_Z10MHROM_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL9MHROMSyncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z10MHROM_InitP8CartInfo, .-_Z10MHROM_InitP8CartInfo
	.section	.text._Z13Mapper70_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper70_InitP8CartInfo
	.hidden	_Z13Mapper70_InitP8CartInfo
	.type	_Z13Mapper70_InitP8CartInfo, @function
_Z13Mapper70_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL7M70Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z13Mapper70_InitP8CartInfo, .-_Z13Mapper70_InitP8CartInfo
	.section	.text._Z13Mapper78_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper78_InitP8CartInfo
	.hidden	_Z13Mapper78_InitP8CartInfo
	.type	_Z13Mapper78_InitP8CartInfo, @function
_Z13Mapper78_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL7M78Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z13Mapper78_InitP8CartInfo, .-_Z13Mapper78_InitP8CartInfo
	.section	.text._Z13Mapper86_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper86_InitP8CartInfo
	.hidden	_Z13Mapper86_InitP8CartInfo
	.type	_Z13Mapper86_InitP8CartInfo, @function
_Z13Mapper86_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,28672
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,24576
	li	a2,255
	lla	a1,_ZL7M86Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z13Mapper86_InitP8CartInfo, .-_Z13Mapper86_InitP8CartInfo
	.section	.text._Z13Mapper87_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper87_InitP8CartInfo
	.hidden	_Z13Mapper87_InitP8CartInfo
	.type	_Z13Mapper87_InitP8CartInfo, @function
_Z13Mapper87_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,24576
	li	a2,255
	lla	a1,_ZL7M87Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z13Mapper87_InitP8CartInfo, .-_Z13Mapper87_InitP8CartInfo
	.section	.text._Z13Mapper89_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper89_InitP8CartInfo
	.hidden	_Z13Mapper89_InitP8CartInfo
	.type	_Z13Mapper89_InitP8CartInfo, @function
_Z13Mapper89_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL7M89Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z13Mapper89_InitP8CartInfo, .-_Z13Mapper89_InitP8CartInfo
	.section	.text._Z18SUNSOFT_UNROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z18SUNSOFT_UNROM_InitP8CartInfo
	.hidden	_Z18SUNSOFT_UNROM_InitP8CartInfo
	.type	_Z18SUNSOFT_UNROM_InitP8CartInfo, @function
_Z18SUNSOFT_UNROM_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL11SSUNROMSyncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z18SUNSOFT_UNROM_InitP8CartInfo, .-_Z18SUNSOFT_UNROM_InitP8CartInfo
	.section	.text._Z13Mapper94_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper94_InitP8CartInfo
	.hidden	_Z13Mapper94_InitP8CartInfo
	.type	_Z13Mapper94_InitP8CartInfo, @function
_Z13Mapper94_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL7M94Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z13Mapper94_InitP8CartInfo, .-_Z13Mapper94_InitP8CartInfo
	.section	.text._Z13Mapper97_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper97_InitP8CartInfo
	.hidden	_Z13Mapper97_InitP8CartInfo
	.type	_Z13Mapper97_InitP8CartInfo, @function
_Z13Mapper97_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,255
	lla	a1,_ZL7M97Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z13Mapper97_InitP8CartInfo, .-_Z13Mapper97_InitP8CartInfo
	.section	.text._Z14Mapper101_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper101_InitP8CartInfo
	.hidden	_Z14Mapper101_InitP8CartInfo
	.type	_Z14Mapper101_InitP8CartInfo, @function
_Z14Mapper101_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,32768
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,24576
	li	a2,255
	lla	a1,_ZL8M101Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z14Mapper101_InitP8CartInfo, .-_Z14Mapper101_InitP8CartInfo
	.section	.text._Z14Mapper107_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper107_InitP8CartInfo
	.hidden	_Z14Mapper107_InitP8CartInfo
	.type	_Z14Mapper107_InitP8CartInfo, @function
_Z14Mapper107_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,255
	lla	a1,_ZL8M107Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z14Mapper107_InitP8CartInfo, .-_Z14Mapper107_InitP8CartInfo
	.section	.text._Z14Mapper113_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper113_InitP8CartInfo
	.hidden	_Z14Mapper113_InitP8CartInfo
	.type	_Z14Mapper113_InitP8CartInfo, @function
_Z14Mapper113_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,32768
	li	a3,16384
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	addi	a3,a3,256
	li	a2,0
	lla	a1,_ZL8M113Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z14Mapper113_InitP8CartInfo, .-_Z14Mapper113_InitP8CartInfo
	.section	.text._Z14Mapper140_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper140_InitP8CartInfo
	.hidden	_Z14Mapper140_InitP8CartInfo
	.type	_Z14Mapper140_InitP8CartInfo, @function
_Z14Mapper140_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,32768
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,24576
	li	a2,0
	lla	a1,_ZL9MHROMSyncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z14Mapper140_InitP8CartInfo, .-_Z14Mapper140_InitP8CartInfo
	.section	.text._Z14Mapper152_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper152_InitP8CartInfo
	.hidden	_Z14Mapper152_InitP8CartInfo
	.type	_Z14Mapper152_InitP8CartInfo, @function
_Z14Mapper152_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL8M152Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z14Mapper152_InitP8CartInfo, .-_Z14Mapper152_InitP8CartInfo
	.section	.text._Z14Mapper180_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper180_InitP8CartInfo
	.hidden	_Z14Mapper180_InitP8CartInfo
	.type	_Z14Mapper180_InitP8CartInfo, @function
_Z14Mapper180_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL8M180Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z14Mapper180_InitP8CartInfo, .-_Z14Mapper180_InitP8CartInfo
	.section	.text._Z14Mapper184_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper184_InitP8CartInfo
	.hidden	_Z14Mapper184_InitP8CartInfo
	.type	_Z14Mapper184_InitP8CartInfo, @function
_Z14Mapper184_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,32768
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,24576
	li	a2,0
	lla	a1,_ZL8M184Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z14Mapper184_InitP8CartInfo, .-_Z14Mapper184_InitP8CartInfo
	.section	.text._Z14Mapper203_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper203_InitP8CartInfo
	.hidden	_Z14Mapper203_InitP8CartInfo
	.type	_Z14Mapper203_InitP8CartInfo, @function
_Z14Mapper203_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL8M203Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z14Mapper203_InitP8CartInfo, .-_Z14Mapper203_InitP8CartInfo
	.section	.text._Z14Mapper240_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper240_InitP8CartInfo
	.hidden	_Z14Mapper240_InitP8CartInfo
	.type	_Z14Mapper240_InitP8CartInfo, @function
_Z14Mapper240_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,24576
	li	a3,16384
	sw	zero,0(sp)
	li	a5,1
	addi	a4,a4,-1
	addi	a3,a3,32
	li	a2,0
	lla	a1,_ZL8M240Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z14Mapper240_InitP8CartInfo, .-_Z14Mapper240_InitP8CartInfo
	.section	.text._Z14Mapper241_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper241_InitP8CartInfo
	.hidden	_Z14Mapper241_InitP8CartInfo
	.type	_Z14Mapper241_InitP8CartInfo, @function
_Z14Mapper241_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,1
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL8M241Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z14Mapper241_InitP8CartInfo, .-_Z14Mapper241_InitP8CartInfo
	.section	.text._Z13BMCA65AS_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13BMCA65AS_InitP8CartInfo
	.hidden	_Z13BMCA65AS_InitP8CartInfo
	.type	_Z13BMCA65AS_InitP8CartInfo, @function
_Z13BMCA65AS_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL12BMCA65ASSyncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z13BMCA65AS_InitP8CartInfo, .-_Z13BMCA65AS_InitP8CartInfo
	.section	.text._Z13BMC11160_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13BMC11160_InitP8CartInfo
	.hidden	_Z13BMC11160_InitP8CartInfo
	.type	_Z13BMC11160_InitP8CartInfo, @function
_Z13BMC11160_InitP8CartInfo:
	addi	sp,sp,-16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL12BMC11160Syncv
	sw	ra,12(sp)
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z13BMC11160_InitP8CartInfo, .-_Z13BMC11160_InitP8CartInfo
	.section	.sbss._ZL10latcheinit,"aw",@nobits
	.set	.LANCHOR4,. + 0
	.type	_ZL10latcheinit, @object
	.size	_ZL10latcheinit, 1
_ZL10latcheinit:
	.zero	1
	.section	.sbss._ZL12bus_conflict,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL12bus_conflict, @object
	.size	_ZL12bus_conflict, 1
_ZL12bus_conflict:
	.zero	1
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL5WSync,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_ZL5WSync, @object
	.size	_ZL5WSync, 4
_ZL5WSync:
	.zero	4
	.section	.sbss._ZL6latche,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	_ZL6latche, @object
	.size	_ZL6latche, 1
_ZL6latche:
	.zero	1
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.section	.sbss._ZL8addrreg0,"aw",@nobits
	.align	1
	.set	.LANCHOR5,. + 0
	.type	_ZL8addrreg0, @object
	.size	_ZL8addrreg0, 2
_ZL8addrreg0:
	.zero	2
	.section	.sbss._ZL8addrreg1,"aw",@nobits
	.align	1
	.set	.LANCHOR6,. + 0
	.type	_ZL8addrreg1, @object
	.size	_ZL8addrreg1, 2
_ZL8addrreg1:
	.zero	2
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
