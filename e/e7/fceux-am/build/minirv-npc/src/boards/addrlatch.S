#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"addrlatch.cpp"
	.option nopic
	.text
	.section	.text._ZL10LatchWritejh,"ax",@progbits
	.align	2
	.type	_ZL10LatchWritejh, @function
_ZL10LatchWritejh:
	la a5, .LANCHOR0; sh a0, 0(a5);
	la a5, .LANCHOR1; lw a5, 0(a5);
	jr	a5
	.size	_ZL10LatchWritejh, .-_ZL10LatchWritejh
	.section	.text._ZL10LatchResetv,"ax",@progbits
	.align	2
	.type	_ZL10LatchResetv, @function
_ZL10LatchResetv:
	la a5, .LANCHOR2; lhu a5, 0(a5);
	la a4, .LANCHOR0; sh a5, 0(a4);
	la a5, .LANCHOR1; lw a5, 0(a5);
	jr	a5
	.size	_ZL10LatchResetv, .-_ZL10LatchResetv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
	la a5, .LANCHOR1; lw a5, 0(a5);
	jr	a5
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL13BMCD1038Resetv,"ax",@progbits
	.align	2
	.type	_ZL13BMCD1038Resetv, @function
_ZL13BMCD1038Resetv:
	lla	a4,.LANCHOR3
	lbu	a5,0(a4)
	addi	a5,a5,1
	andi	a5,a5,3
	sb	a5,0(a4)
	ret
	.size	_ZL13BMCD1038Resetv, .-_ZL13BMCD1038Resetv
	.section	.text._ZL12BMCD1038Readj,"ax",@progbits
	.align	2
	.type	_ZL12BMCD1038Readj, @function
_ZL12BMCD1038Readj:
	la a5, .LANCHOR0; lhu a5, 0(a5);
	andi	a5,a5,256
	beq	a5,zero,.L11
	la a0, .LANCHOR3; lbu a0, 0(a0);
	ret
.L11:
	tail	_Z6CartBRj
	.size	_ZL12BMCD1038Readj, .-_ZL12BMCD1038Readj
	.section	.text._ZL7M59Readj,"ax",@progbits
	.align	2
	.type	_ZL7M59Readj, @function
_ZL7M59Readj:
	la a5, .LANCHOR0; lhu a5, 0(a5);
	andi	a5,a5,256
	beq	a5,zero,.L14
	li	a0,0
	ret
.L14:
	tail	_Z6CartBRj
	.size	_ZL7M59Readj, .-_ZL7M59Readj
	.section	.text._ZL7M92Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M92Syncv, @function
_ZL7M92Syncv:
	addi	sp,sp,-12
	sw	s1,0(sp)
	li	a1,0
	lla	s1,.LANCHOR0
	li	a0,32768
	sw	s0,4(sp)
	sw	ra,8(sp)
	lhu	s0,0(s1)
	call	_Z8setprg16jj
	lhu	a1,0(s1)
	li	a5,36864
	andi	s0,s0,240
	bltu	a1,a5,.L16
	li	a5,208
	beq	s0,a5,.L22
	li	a5,224
	beq	s0,a5,.L20
.L15:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L16:
	li	a5,112
	beq	s0,a5,.L20
	li	a5,176
	bne	s0,a5,.L15
.L22:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	andi	a1,a1,15
	li	a0,49152
	addi	sp,sp,12
	tail	_Z8setprg16jj
.L20:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	andi	a0,a1,15
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL7M92Syncv, .-_ZL7M92Syncv
	.section	.text._ZL8M214Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M214Syncv, @function
_ZL8M214Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lhu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	srli	a1,a1,2
	andi	a1,a1,3
	call	_Z8setprg16jj
	lhu	a1,0(s0)
	li	a0,49152
	srli	a1,a1,2
	andi	a1,a1,3
	call	_Z8setprg16jj
	lhu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a0,a0,3
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL8M214Syncv, .-_ZL8M214Syncv
	.section	.text._ZL8M217Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M217Syncv, @function
_ZL8M217Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lhu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	srli	a1,a1,2
	andi	a1,a1,3
	call	_Z8setprg32jj
	lhu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a0,a0,7
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL8M217Syncv, .-_ZL8M217Syncv
	.section	.text._ZL12BMCD1038Syncv,"ax",@progbits
	.align	2
	.type	_ZL12BMCD1038Syncv, @function
_ZL12BMCD1038Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lhu	a1,0(s0)
	sw	ra,8(sp)
	andi	a5,a1,128
	beq	a5,zero,.L28
	srli	a1,a1,4
	andi	a1,a1,7
	li	a0,32768
	call	_Z8setprg16jj
	lhu	a1,0(s0)
	li	a0,49152
	srli	a1,a1,4
	andi	a1,a1,7
	call	_Z8setprg16jj
.L29:
	lhu	a0,0(s0)
	andi	a0,a0,7
	call	_Z7setchr8j
	lhu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,3
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L28:
	srli	a1,a1,5
	andi	a1,a1,3
	li	a0,32768
	call	_Z8setprg32jj
	j	.L29
	.size	_ZL12BMCD1038Syncv, .-_ZL12BMCD1038Syncv
	.section	.text._ZL12BMCGK192Syncv,"ax",@progbits
	.align	2
	.type	_ZL12BMCGK192Syncv, @function
_ZL12BMCGK192Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lhu	a1,0(s0)
	sw	ra,8(sp)
	andi	a5,a1,64
	beq	a5,zero,.L32
	andi	a1,a1,7
	li	a0,32768
	call	_Z8setprg16jj
	lhu	a1,0(s0)
	li	a0,49152
	andi	a1,a1,7
	call	_Z8setprg16jj
.L33:
	lhu	a0,0(s0)
	srli	a0,a0,3
	andi	a0,a0,7
	call	_Z7setchr8j
	lhu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,7
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L32:
	srli	a1,a1,1
	andi	a1,a1,3
	li	a0,32768
	call	_Z8setprg32jj
	j	.L33
	.size	_ZL12BMCGK192Syncv, .-_ZL12BMCGK192Syncv
	.section	.text._ZL7M59Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M59Syncv, @function
_ZL7M59Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lhu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	srli	a1,a1,4
	andi	a1,a1,7
	call	_Z8setprg32jj
	lhu	a0,0(s0)
	andi	a0,a0,7
	call	_Z7setchr8j
	lhu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,3
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL7M59Syncv, .-_ZL7M59Syncv
	.section	.text._ZL7M61Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M61Syncv, @function
_ZL7M61Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lhu	a1,0(s0)
	sw	ra,8(sp)
	slli	a4,a1,1
	xor	a5,a1,a4
	andi	a5,a5,32
	beq	a5,zero,.L38
	srli	a1,a1,4
	andi	a4,a4,30
	andi	a1,a1,2
	or	a1,a1,a4
	li	a0,32768
	call	_Z8setprg16jj
	lhu	a5,0(s0)
	li	a0,49152
	slli	a1,a5,1
	srli	a5,a5,4
	andi	a1,a1,30
	andi	a5,a5,2
	or	a1,a1,a5
	call	_Z8setprg16jj
.L39:
	li	a0,0
	call	_Z7setchr8j
	lhu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,7
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L38:
	andi	a1,a1,15
	li	a0,32768
	call	_Z8setprg32jj
	j	.L39
	.size	_ZL7M61Syncv, .-_ZL7M61Syncv
	.section	.text._ZL8M200Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M200Syncv, @function
_ZL8M200Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lhu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	andi	a1,a1,7
	call	_Z8setprg16jj
	lhu	a1,0(s0)
	li	a0,49152
	andi	a1,a1,7
	call	_Z8setprg16jj
	lhu	a0,0(s0)
	andi	a0,a0,7
	call	_Z7setchr8j
	lhu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,3
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL8M200Syncv, .-_ZL8M200Syncv
	.section	.text._ZL8M202Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M202Syncv, @function
_ZL8M202Syncv:
	addi	sp,sp,-16
	sw	s0,8(sp)
	la s0, .LANCHOR0; lhu s0, 0(s0);
	srli	a1,s0,1
	sw	s1,4(sp)
	andi	s1,a1,7
	srai	a4,s1,2
	sw	ra,12(sp)
	and	a4,s0,a4
	beq	a4,zero,.L44
	andi	a1,a1,6
	li	a0,32768
	sw	a1,0(sp)
	call	_Z8setprg16jj
	lw	a1,0(sp)
	ori	a1,a1,1
.L45:
	li	a0,49152
	call	_Z8setprg16jj
	not	a0,s0
	andi	a0,a0,1
	call	_Z9setmirrori
	lw	s0,8(sp)
	lw	ra,12(sp)
	mv	a0,s1
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	_Z7setchr8j
.L44:
	mv	a1,s1
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s1
	j	.L45
	.size	_ZL8M202Syncv, .-_ZL8M202Syncv
	.section	.text._ZL8M204Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M204Syncv, @function
_ZL8M204Syncv:
	addi	sp,sp,-16
	sw	s1,4(sp)
	lla	s1,.LANCHOR0
	sw	s0,8(sp)
	lhu	s0,0(s1)
	sw	ra,12(sp)
	li	a4,6
	andi	a5,s0,6
	beq	a5,a4,.L48
	andi	s0,s0,1
	add	s0,s0,a5
	mv	a1,s0
	li	a0,32768
	sw	a5,0(sp)
	call	_Z8setprg16jj
	lhu	a1,0(s1)
	lw	a5,0(sp)
	andi	a1,a1,1
.L49:
	add	a1,a1,a5
	li	a0,49152
	call	_Z8setprg16jj
	mv	a0,s0
	call	_Z7setchr8j
	lhu	a0,0(s1)
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	srli	a0,a0,4
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,16
	tail	_Z9setmirrori
.L48:
	li	a1,6
	li	a0,32768
	sw	a5,0(sp)
	call	_Z8setprg16jj
	lw	a5,0(sp)
	li	s0,6
	li	a1,1
	j	.L49
	.size	_ZL8M204Syncv, .-_ZL8M204Syncv
	.section	.text._ZL8M212Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M212Syncv, @function
_ZL8M212Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lhu	a1,0(s0)
	li	a5,16384
	sw	ra,8(sp)
	and	a5,a1,a5
	beq	a5,zero,.L52
	srli	a1,a1,1
	andi	a1,a1,3
	li	a0,32768
	call	_Z8setprg32jj
.L53:
	lhu	a0,0(s0)
	andi	a0,a0,7
	call	_Z7setchr8j
	lhu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,3
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L52:
	andi	a1,a1,7
	li	a0,32768
	call	_Z8setprg16jj
	lhu	a1,0(s0)
	li	a0,49152
	andi	a1,a1,7
	call	_Z8setprg16jj
	j	.L53
	.size	_ZL8M212Syncv, .-_ZL8M212Syncv
	.section	.text._ZL8M213Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M213Syncv, @function
_ZL8M213Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lhu	a1,0(s0)
	sw	ra,8(sp)
	andi	a5,a1,64
	beq	a5,zero,.L56
	andi	a1,a1,7
	li	a0,32768
	call	_Z8setprg16jj
	lhu	a1,0(s0)
	li	a0,49152
	andi	a1,a1,7
	call	_Z8setprg16jj
.L57:
	lhu	a0,0(s0)
	srli	a0,a0,3
	andi	a0,a0,7
	call	_Z7setchr8j
	lhu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a5,a0,6
	xor	a0,a0,a5
	not	a0,a0
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L56:
	srli	a1,a1,1
	andi	a1,a1,3
	li	a0,32768
	call	_Z8setprg32jj
	j	.L57
	.size	_ZL8M213Syncv, .-_ZL8M213Syncv
	.section	.text._ZL8M229Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M229Syncv, @function
_ZL8M229Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lhu	a0,0(s0)
	sw	ra,8(sp)
	call	_Z7setchr8j
	lhu	a1,0(s0)
	andi	a5,a1,30
	bne	a5,zero,.L60
	li	a1,0
	li	a0,32768
	call	_Z8setprg32jj
.L61:
	lhu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,5
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L60:
	andi	a1,a1,31
	li	a0,32768
	call	_Z8setprg16jj
	lhu	a1,0(s0)
	li	a0,49152
	andi	a1,a1,31
	call	_Z8setprg16jj
	j	.L61
	.size	_ZL8M229Syncv, .-_ZL8M229Syncv
	.section	.text._ZL8M231Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M231Syncv, @function
_ZL8M231Syncv:
	addi	sp,sp,-12
	li	a0,0
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LANCHOR0
	call	_Z7setchr8j
	lhu	a1,0(s0)
	andi	a5,a1,32
	beq	a5,zero,.L64
	srli	a1,a1,1
	andi	a1,a1,15
	li	a0,32768
	call	_Z8setprg32jj
.L65:
	lhu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,7
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L64:
	andi	a1,a1,30
	li	a0,32768
	call	_Z8setprg16jj
	lhu	a1,0(s0)
	li	a0,49152
	andi	a1,a1,30
	call	_Z8setprg16jj
	j	.L65
	.size	_ZL8M231Syncv, .-_ZL8M231Syncv
	.section	.text._ZL13BMC190in1Syncv,"ax",@progbits
	.align	2
	.type	_ZL13BMC190in1Syncv, @function
_ZL13BMC190in1Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lhu	a1,0(s0)
	li	a0,32768
	sw	ra,8(sp)
	srli	a1,a1,2
	andi	a1,a1,7
	call	_Z8setprg16jj
	lhu	a1,0(s0)
	li	a0,49152
	srli	a1,a1,2
	andi	a1,a1,7
	call	_Z8setprg16jj
	lhu	a0,0(s0)
	srli	a0,a0,2
	andi	a0,a0,7
	call	_Z7setchr8j
	lhu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	not	a0,a0
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL13BMC190in1Syncv, .-_ZL13BMC190in1Syncv
	.section	.text._ZL16BMC810544CA1Syncv,"ax",@progbits
	.align	2
	.type	_ZL16BMC810544CA1Syncv, @function
_ZL16BMC810544CA1Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lhu	a5,0(s0)
	sw	ra,8(sp)
	sw	s1,0(sp)
	andi	a4,a5,64
	srli	a1,a5,7
	beq	a4,zero,.L70
	li	a0,32768
	call	_Z8setprg32jj
.L71:
	lhu	a0,0(s0)
	andi	a0,a0,15
	call	_Z7setchr8j
	lhu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	srli	a0,a0,4
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L70:
	srli	a5,a5,5
	slli	s1,a1,1
	andi	a5,a5,1
	or	a1,a5,s1
	li	a0,32768
	call	_Z8setprg16jj
	lhu	a1,0(s0)
	li	a0,49152
	srli	a1,a1,5
	andi	a1,a1,1
	or	a1,a1,s1
	call	_Z8setprg16jj
	j	.L71
	.size	_ZL16BMC810544CA1Syncv, .-_ZL16BMC810544CA1Syncv
	.section	.text._ZL12BMCNTD03Syncv,"ax",@progbits
	.align	2
	.type	_ZL12BMCNTD03Syncv, @function
_ZL12BMCNTD03Syncv:
	addi	sp,sp,-16
	sw	s0,8(sp)
	lla	s0,.LANCHOR0
	lhu	a1,0(s0)
	sw	s1,4(sp)
	sw	ra,12(sp)
	srli	s1,a1,5
	srli	a5,a1,10
	andi	s1,s1,24
	andi	a3,a1,7
	andi	a4,a1,128
	andi	a5,a5,30
	or	s1,s1,a3
	beq	a4,zero,.L74
	srli	a1,a1,6
	andi	a1,a1,1
	or	a1,a5,a1
	li	a0,32768
	sw	a5,0(sp)
	call	_Z8setprg16jj
	lhu	a1,0(s0)
	lw	a5,0(sp)
	li	a0,49152
	srli	a1,a1,6
	andi	a1,a1,1
	or	a1,a5,a1
	call	_Z8setprg16jj
.L75:
	mv	a0,s1
	call	_Z7setchr8j
	lhu	a0,0(s0)
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	srli	a0,a0,10
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,16
	tail	_Z9setmirrori
.L74:
	srli	a1,a5,1
	li	a0,32768
	call	_Z8setprg32jj
	j	.L75
	.size	_ZL12BMCNTD03Syncv, .-_ZL12BMCNTD03Syncv
	.section	.text._ZL11BMCG146Syncv,"ax",@progbits
	.align	2
	.type	_ZL11BMCG146Syncv, @function
_ZL11BMCG146Syncv:
	addi	sp,sp,-12
	li	a0,0
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	s0,.LANCHOR0
	call	_Z7setchr8j
	lhu	a1,0(s0)
	srli	a5,a1,11
	andi	a5,a5,1
	bne	a5,zero,.L82
	andi	a5,a1,64
	bne	a5,zero,.L83
	srli	a1,a1,1
	andi	a1,a1,15
	li	a0,32768
	call	_Z8setprg32jj
.L79:
	lhu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,7
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
.L83:
	andi	a1,a1,31
	li	a0,32768
	call	_Z8setprg16jj
	lhu	a1,0(s0)
	li	a0,49152
	andi	a1,a1,31
	call	_Z8setprg16jj
	j	.L79
.L82:
	srli	a5,a1,6
	and	a5,a1,a5
	andi	a5,a5,1
	andi	a1,a1,31
	or	a1,a5,a1
	li	a0,32768
	call	_Z8setprg16jj
	lhu	a1,0(s0)
	li	a0,49152
	andi	a1,a1,24
	ori	a1,a1,7
	call	_Z8setprg16jj
	j	.L79
	.size	_ZL11BMCG146Syncv, .-_ZL11BMCG146Syncv
	.section	.text._ZL8M212Readj,"ax",@progbits
	.align	2
	.type	_ZL8M212Readj, @function
_ZL8M212Readj:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z8CartBROBj
	li	a5,57344
	addi	a5,a5,16
	and	s0,s0,a5
	li	a5,24576
	bne	s0,a5,.L85
	ori	a0,a0,-128
	andi	a0,a0,0xff
.L85:
	lw	ra,8(sp)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	_ZL8M212Readj, .-_ZL8M212Readj
	.section	.text._ZL10LatchClosev,"ax",@progbits
	.align	2
	.type	_ZL10LatchClosev, @function
_ZL10LatchClosev:
	la a0, .LANCHOR4; lw a0, 0(a0);
	beq	a0,zero,.L93
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	la a5, .LANCHOR4; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L93:
	la a5, .LANCHOR4; sw zero, 0(a5);
	ret
	.size	_ZL10LatchClosev, .-_ZL10LatchClosev
	.section	.text._ZL10LatchPowerv,"ax",@progbits
	.align	2
	.type	_ZL10LatchPowerv, @function
_ZL10LatchPowerv:
	addi	sp,sp,-12
	la a5, .LANCHOR2; lhu a5, 0(a5);
	sw	s0,4(sp)
	la a4, .LANCHOR0; sh a5, 0(a4);
	sw	ra,8(sp)
	la a5, .LANCHOR1; lw a5, 0(a5);
	lla	s0,.LANCHOR4
	jalr	a5
	lw	a5,0(s0)
	beq	a5,zero,.L97
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
	la a0, .LANCHOR5; lw a0, 0(a0);
	li	a1,24576
	srli	a0,a0,10
	call	_Z16FCEU_CheatAddRAMijPh
.L98:
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a1, .LANCHOR7; lhu a1, 0(a1);
	la a0, .LANCHOR8; lhu a0, 0(a0);
	lla	a2,_ZL10LatchWritejh
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
.L97:
	li	a1,65536
	la a2, .LANCHOR6; lw a2, 0(a2);
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	j	.L98
	.size	_ZL10LatchPowerv, .-_ZL10LatchPowerv
	.section	.rodata._ZL12UNL43272Syncv.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"unrecognized command %04!\n"
	.section	.text._ZL12UNL43272Syncv,"ax",@progbits
	.align	2
	.type	_ZL12UNL43272Syncv, @function
_ZL12UNL43272Syncv:
	addi	sp,sp,-12
	la a1, .LANCHOR0; lhu a1, 0(a1);
	sw	ra,8(sp)
	andi	a4,a1,129
	li	a5,129
	beq	a4,a5,.L104
	lla	a0,.LC0
	call	printf
	li	a0,0
	call	_Z7setchr8j
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z9setmirrori
.L104:
	srli	a1,a1,3
	andi	a1,a1,7
	li	a0,32768
	call	_Z8setprg32jj
	li	a0,0
	call	_Z7setchr8j
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL12UNL43272Syncv, .-_ZL12UNL43272Syncv
	.section	.text._ZL13UNL43272Resetv,"ax",@progbits
	.align	2
	.type	_ZL13UNL43272Resetv, @function
_ZL13UNL43272Resetv:
	la a5, .LANCHOR0; sh zero, 0(a5);
	tail	_ZL12UNL43272Syncv
	.size	_ZL13UNL43272Resetv, .-_ZL13UNL43272Resetv
	.section	.text._ZL8M227Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M227Syncv, @function
_ZL8M227Syncv:
	addi	sp,sp,-16
	lla	a4,.LANCHOR0
	sw	s0,8(sp)
	lhu	s0,0(a4)
	sw	s1,4(sp)
	li	a5,-4096
	srli	s1,s0,2
	srli	a3,s0,3
	andi	t1,s0,1
	andi	s1,s1,31
	andi	a3,a3,32
	sw	ra,12(sp)
	li	a2,61440
	and	a5,s0,a5
	sw	t1,0(sp)
	or	s1,s1,a3
	la a1, CHRptr; lw a1, 0(a1);
	beq	a5,a2,.L117
	li	a3,1
	li	a2,8192
	li	a0,0
	call	_Z19SetupCartCHRMappingiPhji
	lw	t1,0(sp)
	lla	a4,.LANCHOR0
.L108:
	lhu	a5,0(a4)
	srli	a5,a5,7
	andi	a5,a5,1
	beq	a5,zero,.L109
	bne	t1,zero,.L118
	mv	a1,s1
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s1
	li	a0,49152
	call	_Z8setprg16jj
	lla	a4,.LANCHOR0
.L111:
	lhu	a0,0(a4)
	srli	a0,a0,1
	xori	a0,a0,1
	andi	a0,a0,1
	call	_Z9setmirrori
	li	a0,0
	call	_Z7setchr8j
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	li	a2,0
	li	a1,24576
	li	a0,16
	addi	sp,sp,16
	tail	_Z8setprg8rijj
.L109:
	srli	s0,s0,9
	andi	s0,s0,1
	beq	t1,zero,.L112
	andi	a1,s1,62
	li	a0,32768
	beq	s0,zero,.L114
.L116:
	call	_Z8setprg16jj
	ori	a1,s1,7
	li	a0,49152
	call	_Z8setprg16jj
	lla	a4,.LANCHOR0
	j	.L111
.L112:
	mv	a1,s1
	li	a0,32768
	bne	s0,zero,.L116
.L114:
	call	_Z8setprg16jj
	andi	a1,s1,56
	li	a0,49152
	call	_Z8setprg16jj
	lla	a4,.LANCHOR0
	j	.L111
.L118:
	srli	a1,s1,1
	li	a0,32768
	call	_Z8setprg32jj
	lla	a4,.LANCHOR0
	j	.L111
.L117:
	li	a3,0
	li	a2,8192
	li	a0,0
	call	_Z19SetupCartCHRMappingiPhji
	lw	t1,0(sp)
	lla	a4,.LANCHOR0
	j	.L108
	.size	_ZL8M227Syncv, .-_ZL8M227Syncv
	.section	.text._ZL8M242Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M242Syncv, @function
_ZL8M242Syncv:
	addi	sp,sp,-12
	li	a0,0
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z7setchr8j
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	lla	s0,.LANCHOR0
	lhu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,3
	andi	a1,a1,15
	call	_Z8setprg32jj
	lhu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a0,a0,1
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL8M242Syncv, .-_ZL8M242Syncv
	.section	.text._ZL12UNL43272Readj,"ax",@progbits
	.align	2
	.type	_ZL12UNL43272Readj, @function
_ZL12UNL43272Readj:
	la a5, .LANCHOR0; lhu a5, 0(a5);
	andi	a5,a5,1024
	beq	a5,zero,.L122
	andi	a0,a0,254
	tail	_Z6CartBRj
.L122:
	tail	_Z6CartBRj
	.size	_ZL12UNL43272Readj, .-_ZL12UNL43272Readj
	.section	.text._ZL8M201Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M201Syncv, @function
_ZL8M201Syncv:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR0
	lhu	a1,0(s0)
	sw	ra,8(sp)
	li	a0,32768
	andi	a5,a1,8
	beq	a5,zero,.L124
	andi	a1,a1,3
	call	_Z8setprg32jj
	lhu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a0,a0,3
	addi	sp,sp,12
	tail	_Z7setchr8j
.L124:
	li	a1,0
	call	_Z8setprg32jj
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z7setchr8j
	.size	_ZL8M201Syncv, .-_ZL8M201Syncv
	.section	.rodata._Z13BMCD1038_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"LATC"
	.align	2
.LC2:
	.string	"DIPSW"
	.section	.text._Z13BMCD1038_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13BMCD1038_InitP8CartInfo
	.hidden	_Z13BMCD1038_InitP8CartInfo
	.type	_Z13BMCD1038_InitP8CartInfo, @function
_Z13BMCD1038_InitP8CartInfo:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	a5,_ZL10LatchPowerv
	sw	a5,0(a0)
	mv	s0,a0
	lla	a5,_ZL10LatchResetv
	sw	a5,4(s0)
	lla	a5,_ZL10LatchClosev
	sw	a5,8(s0)
	la a5, .LANCHOR2; sh zero, 0(a5);
	li	a5,-32768
	la a4, .LANCHOR8; sh a5, 0(a4);
	li	a5,-1
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL12BMCD1038Syncv
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a5,_ZL12BMCD1038Readj
	lla	a3,.LC1
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR0
	la a4, .LANCHOR6; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lla	a5,_ZL13BMCD1038Resetv
	sw	a5,4(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC2
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR3
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13BMCD1038_InitP8CartInfo, .-_Z13BMCD1038_InitP8CartInfo
	.section	.text._Z13UNL43272_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13UNL43272_InitP8CartInfo
	.hidden	_Z13UNL43272_InitP8CartInfo
	.type	_Z13UNL43272_InitP8CartInfo, @function
_Z13UNL43272_InitP8CartInfo:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lla	a5,_ZL10LatchPowerv
	sw	a5,0(a0)
	mv	s0,a0
	lla	a5,_ZL10LatchResetv
	sw	a5,4(s0)
	lla	a5,_ZL10LatchClosev
	sw	a5,8(s0)
	li	a5,129
	la a4, .LANCHOR2; sh a5, 0(a4);
	li	a5,-32768
	la a4, .LANCHOR8; sh a5, 0(a4);
	li	a5,-1
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL12UNL43272Syncv
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a5,_ZL12UNL43272Readj
	lla	a3,.LC1
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR0
	la a4, .LANCHOR6; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lla	a5,_ZL13UNL43272Resetv
	sw	a5,4(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC2
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR3
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13UNL43272_InitP8CartInfo, .-_Z13UNL43272_InitP8CartInfo
	.section	.text._Z13BMCGK192_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13BMCGK192_InitP8CartInfo
	.hidden	_Z13BMCGK192_InitP8CartInfo
	.type	_Z13BMCGK192_InitP8CartInfo, @function
_Z13BMCGK192_InitP8CartInfo:
	lla	a5,_ZL10LatchPowerv
	sw	a5,0(a0)
	lla	a5,_ZL10LatchResetv
	sw	a5,4(a0)
	lla	a5,_ZL10LatchClosev
	sw	a5,8(a0)
	la a5, .LANCHOR2; sh zero, 0(a5);
	li	a5,-32768
	la a4, .LANCHOR8; sh a5, 0(a4);
	li	a5,-1
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL12BMCGK192Syncv
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a5,_Z8CartBROBj
	la a4, .LANCHOR6; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	a3,.LC1
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR0
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13BMCGK192_InitP8CartInfo, .-_Z13BMCGK192_InitP8CartInfo
	.section	.text._Z13Mapper59_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper59_InitP8CartInfo
	.hidden	_Z13Mapper59_InitP8CartInfo
	.type	_Z13Mapper59_InitP8CartInfo, @function
_Z13Mapper59_InitP8CartInfo:
	lla	a5,_ZL10LatchPowerv
	sw	a5,0(a0)
	lla	a5,_ZL10LatchResetv
	sw	a5,4(a0)
	lla	a5,_ZL10LatchClosev
	sw	a5,8(a0)
	la a5, .LANCHOR2; sh zero, 0(a5);
	li	a5,-32768
	la a4, .LANCHOR8; sh a5, 0(a4);
	li	a5,-1
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL7M59Syncv
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a5,_ZL7M59Readj
	la a4, .LANCHOR6; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	a3,.LC1
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR0
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper59_InitP8CartInfo, .-_Z13Mapper59_InitP8CartInfo
	.section	.text._Z13Mapper61_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper61_InitP8CartInfo
	.hidden	_Z13Mapper61_InitP8CartInfo
	.type	_Z13Mapper61_InitP8CartInfo, @function
_Z13Mapper61_InitP8CartInfo:
	lla	a5,_ZL10LatchPowerv
	sw	a5,0(a0)
	lla	a5,_ZL10LatchResetv
	sw	a5,4(a0)
	lla	a5,_ZL10LatchClosev
	sw	a5,8(a0)
	la a5, .LANCHOR2; sh zero, 0(a5);
	li	a5,-32768
	la a4, .LANCHOR8; sh a5, 0(a4);
	li	a5,-1
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL7M61Syncv
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a5,_Z8CartBROBj
	la a4, .LANCHOR6; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	a3,.LC1
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR0
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper61_InitP8CartInfo, .-_Z13Mapper61_InitP8CartInfo
	.section	.text._Z13Mapper92_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper92_InitP8CartInfo
	.hidden	_Z13Mapper92_InitP8CartInfo
	.type	_Z13Mapper92_InitP8CartInfo, @function
_Z13Mapper92_InitP8CartInfo:
	li	a5,-32768
	addi	a4,a5,176
	la t1, .LANCHOR2; sh a4, 0(t1);
	la a4, .LANCHOR8; sh a5, 0(a4);
	li	a5,-1
	lla	a3,_ZL10LatchPowerv
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL7M92Syncv
	sw	a3,0(a0)
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a3,_ZL10LatchResetv
	lla	a5,_Z8CartBROBj
	sw	a3,4(a0)
	la a4, .LANCHOR6; sw a5, 0(a4);
	lla	a3,_ZL10LatchClosev
	lla	a5,_ZL12StateRestorei
	sw	a3,8(a0)
	li	a2,0
	lla	a3,.LC1
	li	a1,2
	lla	a0,.LANCHOR0
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper92_InitP8CartInfo, .-_Z13Mapper92_InitP8CartInfo
	.section	.text._Z14Mapper200_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper200_InitP8CartInfo
	.hidden	_Z14Mapper200_InitP8CartInfo
	.type	_Z14Mapper200_InitP8CartInfo, @function
_Z14Mapper200_InitP8CartInfo:
	lla	a4,_ZL10LatchPowerv
	sw	a4,0(a0)
	lla	a4,_ZL10LatchResetv
	li	a5,-1
	sw	a4,4(a0)
	lla	a4,_ZL10LatchClosev
	sw	a4,8(a0)
	la a4, .LANCHOR2; sh a5, 0(a4);
	li	a4,-32768
	la t1, .LANCHOR8; sh a4, 0(t1);
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL8M200Syncv
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a5,_Z8CartBROBj
	la a4, .LANCHOR6; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	a3,.LC1
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR0
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper200_InitP8CartInfo, .-_Z14Mapper200_InitP8CartInfo
	.section	.text._Z14Mapper201_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper201_InitP8CartInfo
	.hidden	_Z14Mapper201_InitP8CartInfo
	.type	_Z14Mapper201_InitP8CartInfo, @function
_Z14Mapper201_InitP8CartInfo:
	lla	a4,_ZL10LatchPowerv
	sw	a4,0(a0)
	lla	a4,_ZL10LatchResetv
	li	a5,-1
	sw	a4,4(a0)
	lla	a4,_ZL10LatchClosev
	sw	a4,8(a0)
	la a4, .LANCHOR2; sh a5, 0(a4);
	li	a4,-32768
	la t1, .LANCHOR8; sh a4, 0(t1);
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL8M201Syncv
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a5,_Z8CartBROBj
	la a4, .LANCHOR6; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	a3,.LC1
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR0
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper201_InitP8CartInfo, .-_Z14Mapper201_InitP8CartInfo
	.section	.text._Z14Mapper202_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper202_InitP8CartInfo
	.hidden	_Z14Mapper202_InitP8CartInfo
	.type	_Z14Mapper202_InitP8CartInfo, @function
_Z14Mapper202_InitP8CartInfo:
	lla	a5,_ZL10LatchPowerv
	sw	a5,0(a0)
	lla	a5,_ZL10LatchResetv
	sw	a5,4(a0)
	lla	a5,_ZL10LatchClosev
	sw	a5,8(a0)
	la a5, .LANCHOR2; sh zero, 0(a5);
	li	a5,-32768
	la a4, .LANCHOR8; sh a5, 0(a4);
	li	a5,-1
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL8M202Syncv
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a5,_Z8CartBROBj
	la a4, .LANCHOR6; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	a3,.LC1
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR0
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper202_InitP8CartInfo, .-_Z14Mapper202_InitP8CartInfo
	.section	.text._Z14Mapper204_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper204_InitP8CartInfo
	.hidden	_Z14Mapper204_InitP8CartInfo
	.type	_Z14Mapper204_InitP8CartInfo, @function
_Z14Mapper204_InitP8CartInfo:
	lla	a4,_ZL10LatchPowerv
	sw	a4,0(a0)
	lla	a4,_ZL10LatchResetv
	li	a5,-1
	sw	a4,4(a0)
	lla	a4,_ZL10LatchClosev
	sw	a4,8(a0)
	la a4, .LANCHOR2; sh a5, 0(a4);
	li	a4,-32768
	la t1, .LANCHOR8; sh a4, 0(t1);
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL8M204Syncv
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a5,_Z8CartBROBj
	la a4, .LANCHOR6; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	a3,.LC1
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR0
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper204_InitP8CartInfo, .-_Z14Mapper204_InitP8CartInfo
	.section	.text._Z14Mapper212_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper212_InitP8CartInfo
	.hidden	_Z14Mapper212_InitP8CartInfo
	.type	_Z14Mapper212_InitP8CartInfo, @function
_Z14Mapper212_InitP8CartInfo:
	lla	a5,_ZL10LatchPowerv
	sw	a5,0(a0)
	lla	a5,_ZL10LatchResetv
	sw	a5,4(a0)
	lla	a5,_ZL10LatchClosev
	sw	a5,8(a0)
	la a5, .LANCHOR2; sh zero, 0(a5);
	li	a5,-32768
	la a4, .LANCHOR8; sh a5, 0(a4);
	li	a5,-1
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL8M212Syncv
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a5,_ZL8M212Readj
	la a4, .LANCHOR6; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	a3,.LC1
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR0
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper212_InitP8CartInfo, .-_Z14Mapper212_InitP8CartInfo
	.section	.text._Z14Mapper213_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper213_InitP8CartInfo
	.hidden	_Z14Mapper213_InitP8CartInfo
	.type	_Z14Mapper213_InitP8CartInfo, @function
_Z14Mapper213_InitP8CartInfo:
	lla	a5,_ZL10LatchPowerv
	sw	a5,0(a0)
	lla	a5,_ZL10LatchResetv
	sw	a5,4(a0)
	lla	a5,_ZL10LatchClosev
	sw	a5,8(a0)
	la a5, .LANCHOR2; sh zero, 0(a5);
	li	a5,-32768
	la a4, .LANCHOR8; sh a5, 0(a4);
	li	a5,-1
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL8M213Syncv
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a5,_Z8CartBROBj
	la a4, .LANCHOR6; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	a3,.LC1
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR0
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper213_InitP8CartInfo, .-_Z14Mapper213_InitP8CartInfo
	.section	.text._Z14Mapper214_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper214_InitP8CartInfo
	.hidden	_Z14Mapper214_InitP8CartInfo
	.type	_Z14Mapper214_InitP8CartInfo, @function
_Z14Mapper214_InitP8CartInfo:
	lla	a5,_ZL10LatchPowerv
	sw	a5,0(a0)
	lla	a5,_ZL10LatchResetv
	sw	a5,4(a0)
	lla	a5,_ZL10LatchClosev
	sw	a5,8(a0)
	la a5, .LANCHOR2; sh zero, 0(a5);
	li	a5,-32768
	la a4, .LANCHOR8; sh a5, 0(a4);
	li	a5,-1
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL8M214Syncv
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a5,_Z8CartBROBj
	la a4, .LANCHOR6; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	a3,.LC1
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR0
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper214_InitP8CartInfo, .-_Z14Mapper214_InitP8CartInfo
	.section	.text._Z14Mapper217_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper217_InitP8CartInfo
	.hidden	_Z14Mapper217_InitP8CartInfo
	.type	_Z14Mapper217_InitP8CartInfo, @function
_Z14Mapper217_InitP8CartInfo:
	lla	a5,_ZL10LatchPowerv
	sw	a5,0(a0)
	lla	a5,_ZL10LatchResetv
	sw	a5,4(a0)
	lla	a5,_ZL10LatchClosev
	sw	a5,8(a0)
	la a5, .LANCHOR2; sh zero, 0(a5);
	li	a5,-32768
	la a4, .LANCHOR8; sh a5, 0(a4);
	li	a5,-1
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL8M217Syncv
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a5,_Z8CartBROBj
	la a4, .LANCHOR6; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	a3,.LC1
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR0
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper217_InitP8CartInfo, .-_Z14Mapper217_InitP8CartInfo
	.section	.rodata._Z14Mapper227_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"WRAM"
	.section	.text._Z14Mapper227_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper227_InitP8CartInfo
	.hidden	_Z14Mapper227_InitP8CartInfo
	.type	_Z14Mapper227_InitP8CartInfo, @function
_Z14Mapper227_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL10LatchPowerv
	sw	a5,0(a0)
	lla	a5,_ZL10LatchResetv
	sw	a5,4(a0)
	lla	a5,_ZL10LatchClosev
	sw	a5,8(a0)
	la a5, .LANCHOR2; sh zero, 0(a5);
	li	a5,-32768
	la a4, .LANCHOR8; sh a5, 0(a4);
	li	a5,-1
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL8M227Syncv
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a5,_Z8CartBROBj
	lla	s1,.LANCHOR5
	la a4, .LANCHOR6; sw a5, 0(a4);
	mv	s0,a0
	li	a5,8192
	li	a0,8192
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	a5,.LANCHOR4
	li	a0,16
	li	a3,1
	sw	a1,0(a5)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a4,48(s0)
	lla	a5,.LANCHOR4
	lw	a0,0(a5)
	lw	a1,0(s1)
	beq	a4,zero,.L145
	sw	a0,12(s0)
	sw	a1,28(s0)
.L145:
	lla	a3,.LC3
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a3,.LC1
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR0
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper227_InitP8CartInfo, .-_Z14Mapper227_InitP8CartInfo
	.section	.text._Z14Mapper229_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper229_InitP8CartInfo
	.hidden	_Z14Mapper229_InitP8CartInfo
	.type	_Z14Mapper229_InitP8CartInfo, @function
_Z14Mapper229_InitP8CartInfo:
	lla	a5,_ZL10LatchPowerv
	sw	a5,0(a0)
	lla	a5,_ZL10LatchResetv
	sw	a5,4(a0)
	lla	a5,_ZL10LatchClosev
	sw	a5,8(a0)
	la a5, .LANCHOR2; sh zero, 0(a5);
	li	a5,-32768
	la a4, .LANCHOR8; sh a5, 0(a4);
	li	a5,-1
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL8M229Syncv
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a5,_Z8CartBROBj
	la a4, .LANCHOR6; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	a3,.LC1
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR0
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper229_InitP8CartInfo, .-_Z14Mapper229_InitP8CartInfo
	.section	.text._Z14Mapper231_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper231_InitP8CartInfo
	.hidden	_Z14Mapper231_InitP8CartInfo
	.type	_Z14Mapper231_InitP8CartInfo, @function
_Z14Mapper231_InitP8CartInfo:
	lla	a5,_ZL10LatchPowerv
	sw	a5,0(a0)
	lla	a5,_ZL10LatchResetv
	sw	a5,4(a0)
	lla	a5,_ZL10LatchClosev
	sw	a5,8(a0)
	la a5, .LANCHOR2; sh zero, 0(a5);
	li	a5,-32768
	la a4, .LANCHOR8; sh a5, 0(a4);
	li	a5,-1
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL8M231Syncv
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a5,_Z8CartBROBj
	la a4, .LANCHOR6; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	a3,.LC1
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR0
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper231_InitP8CartInfo, .-_Z14Mapper231_InitP8CartInfo
	.section	.text._Z14Mapper242_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper242_InitP8CartInfo
	.hidden	_Z14Mapper242_InitP8CartInfo
	.type	_Z14Mapper242_InitP8CartInfo, @function
_Z14Mapper242_InitP8CartInfo:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,_ZL10LatchPowerv
	sw	a5,0(a0)
	lla	a5,_ZL10LatchResetv
	sw	a5,4(a0)
	lla	a5,_ZL10LatchClosev
	sw	a5,8(a0)
	la a5, .LANCHOR2; sh zero, 0(a5);
	li	a5,-32768
	la a4, .LANCHOR8; sh a5, 0(a4);
	li	a5,-1
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL8M242Syncv
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a5,_Z8CartBROBj
	lla	s1,.LANCHOR5
	la a4, .LANCHOR6; sw a5, 0(a4);
	mv	s0,a0
	li	a5,8192
	li	a0,8192
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	a5,.LANCHOR4
	li	a0,16
	li	a3,1
	sw	a1,0(a5)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a4,48(s0)
	lla	a5,.LANCHOR4
	lw	a0,0(a5)
	lw	a1,0(s1)
	beq	a4,zero,.L151
	sw	a0,12(s0)
	sw	a1,28(s0)
.L151:
	lla	a3,.LC3
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a3,.LC1
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR0
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper242_InitP8CartInfo, .-_Z14Mapper242_InitP8CartInfo
	.section	.text._Z14BMC190in1_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14BMC190in1_InitP8CartInfo
	.hidden	_Z14BMC190in1_InitP8CartInfo
	.type	_Z14BMC190in1_InitP8CartInfo, @function
_Z14BMC190in1_InitP8CartInfo:
	lla	a5,_ZL10LatchPowerv
	sw	a5,0(a0)
	lla	a5,_ZL10LatchResetv
	sw	a5,4(a0)
	lla	a5,_ZL10LatchClosev
	sw	a5,8(a0)
	la a5, .LANCHOR2; sh zero, 0(a5);
	li	a5,-32768
	la a4, .LANCHOR8; sh a5, 0(a4);
	li	a5,-1
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL13BMC190in1Syncv
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a5,_Z8CartBROBj
	la a4, .LANCHOR6; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	a3,.LC1
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR0
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14BMC190in1_InitP8CartInfo, .-_Z14BMC190in1_InitP8CartInfo
	.section	.text._Z17BMC810544CA1_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z17BMC810544CA1_InitP8CartInfo
	.hidden	_Z17BMC810544CA1_InitP8CartInfo
	.type	_Z17BMC810544CA1_InitP8CartInfo, @function
_Z17BMC810544CA1_InitP8CartInfo:
	lla	a5,_ZL10LatchPowerv
	sw	a5,0(a0)
	lla	a5,_ZL10LatchResetv
	sw	a5,4(a0)
	lla	a5,_ZL10LatchClosev
	sw	a5,8(a0)
	la a5, .LANCHOR2; sh zero, 0(a5);
	li	a5,-32768
	la a4, .LANCHOR8; sh a5, 0(a4);
	li	a5,-1
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL16BMC810544CA1Syncv
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a5,_Z8CartBROBj
	la a4, .LANCHOR6; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	a3,.LC1
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR0
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z17BMC810544CA1_InitP8CartInfo, .-_Z17BMC810544CA1_InitP8CartInfo
	.section	.text._Z13BMCNTD03_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13BMCNTD03_InitP8CartInfo
	.hidden	_Z13BMCNTD03_InitP8CartInfo
	.type	_Z13BMCNTD03_InitP8CartInfo, @function
_Z13BMCNTD03_InitP8CartInfo:
	lla	a5,_ZL10LatchPowerv
	sw	a5,0(a0)
	lla	a5,_ZL10LatchResetv
	sw	a5,4(a0)
	lla	a5,_ZL10LatchClosev
	sw	a5,8(a0)
	la a5, .LANCHOR2; sh zero, 0(a5);
	li	a5,-32768
	la a4, .LANCHOR8; sh a5, 0(a4);
	li	a5,-1
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL12BMCNTD03Syncv
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a5,_Z8CartBROBj
	la a4, .LANCHOR6; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	a3,.LC1
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR0
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13BMCNTD03_InitP8CartInfo, .-_Z13BMCNTD03_InitP8CartInfo
	.section	.text._Z12BMCG146_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12BMCG146_InitP8CartInfo
	.hidden	_Z12BMCG146_InitP8CartInfo
	.type	_Z12BMCG146_InitP8CartInfo, @function
_Z12BMCG146_InitP8CartInfo:
	lla	a5,_ZL10LatchPowerv
	sw	a5,0(a0)
	lla	a5,_ZL10LatchResetv
	sw	a5,4(a0)
	lla	a5,_ZL10LatchClosev
	sw	a5,8(a0)
	la a5, .LANCHOR2; sh zero, 0(a5);
	li	a5,-32768
	la a4, .LANCHOR8; sh a5, 0(a4);
	li	a5,-1
	la a4, .LANCHOR7; sh a5, 0(a4);
	lla	a5,_ZL11BMCG146Syncv
	la a4, .LANCHOR1; sw a5, 0(a4);
	lla	a5,_Z8CartBROBj
	la a4, .LANCHOR6; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	a3,.LC1
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR0
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.size	_Z12BMCG146_InitP8CartInfo, .-_Z12BMCG146_InitP8CartInfo
	.section	.sbss._ZL10latcheinit,"aw",@nobits
	.align	1
	.set	.LANCHOR2,. + 0
	.type	_ZL10latcheinit, @object
	.size	_ZL10latcheinit, 2
_ZL10latcheinit:
	.zero	2
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL5WSync,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL5WSync, @object
	.size	_ZL5WSync, 4
_ZL5WSync:
	.zero	4
	.section	.sbss._ZL6latche,"aw",@nobits
	.align	1
	.set	.LANCHOR0,. + 0
	.type	_ZL6latche, @object
	.size	_ZL6latche, 2
_ZL6latche:
	.zero	2
	.section	.sbss._ZL7defread,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	_ZL7defread, @object
	.size	_ZL7defread, 4
_ZL7defread:
	.zero	4
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.section	.sbss._ZL8addrreg0,"aw",@nobits
	.align	1
	.set	.LANCHOR8,. + 0
	.type	_ZL8addrreg0, @object
	.size	_ZL8addrreg0, 2
_ZL8addrreg0:
	.zero	2
	.section	.sbss._ZL8addrreg1,"aw",@nobits
	.align	1
	.set	.LANCHOR7,. + 0
	.type	_ZL8addrreg1, @object
	.size	_ZL8addrreg1, 2
_ZL8addrreg1:
	.zero	2
	.section	.sbss._ZL9dipswitch,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL9dipswitch, @object
	.size	_ZL9dipswitch, 1
_ZL9dipswitch:
	.zero	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
