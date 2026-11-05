#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"mmc3.cpp"
	.option nopic
	.text
	.section	.text._ZL10GENNOMWRAPh,"ax",@progbits
	.align	2
	.type	_ZL10GENNOMWRAPh, @function
_ZL10GENNOMWRAPh:
	la a5, .LANCHOR0; sb a0, 0(a5);
	ret
	.size	_ZL10GENNOMWRAPh, .-_ZL10GENNOMWRAPh
	.section	.text._ZL10MBWRAMMMC6jh,"ax",@progbits
	.align	2
	.type	_ZL10MBWRAMMMC6jh, @function
_ZL10MBWRAMMMC6jh:
	la a5, .LANCHOR1; lw a5, 0(a5);
	andi	a0,a0,1023
	add	a5,a5,a0
	sb	a1,0(a5)
	ret
	.size	_ZL10MBWRAMMMC6jh, .-_ZL10MBWRAMMMC6jh
	.section	.text._ZL10MAWRAMMMC6j,"ax",@progbits
	.align	2
	.type	_ZL10MAWRAMMMC6j, @function
_ZL10MAWRAMMMC6j:
	andi	a0,a0,1023
	la a5, .LANCHOR1; lw a5, 0(a5);
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
	.size	_ZL10MAWRAMMMC6j, .-_ZL10MAWRAMMMC6j
	.section	.text._ZL8M12Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M12Writejh, @function
_ZL8M12Writejh:
	srli	a5,a1,4
	lla	a4,.LANCHOR2
	andi	a1,a1,1
	andi	a5,a5,1
	sb	a1,0(a4)
	sb	a5,1(a4)
	ret
	.size	_ZL8M12Writejh, .-_ZL8M12Writejh
	.section	.text._ZL7M12Readj,"ax",@progbits
	.align	2
	.type	_ZL7M12Readj, @function
_ZL7M12Readj:
	la a0, .LANCHOR2+2; lbu a0, 0(a0);
	ret
	.size	_ZL7M12Readj, .-_ZL7M12Readj
	.section	.text._ZL7M45Readj,"ax",@progbits
	.align	2
	.type	_ZL7M45Readj, @function
_ZL7M45Readj:
	la a5, .LANCHOR2+5; lbu a5, 0(a5);
	addi	a5,a5,4
	li	a4,1
	sll	a4,a4,a5
	addi	a5,a4,-1
	or	a5,a5,a4
	and	a5,a5,a0
	la a0, X+24; lbu a0, 0(a0);
	beq	a5,zero,.L8
	ori	a0,a0,1
.L8:
	ret
	.size	_ZL7M45Readj, .-_ZL7M45Readj
	.section	.text._ZL8GENMWRAPh,"ax",@progbits
	.align	2
	.type	_ZL8GENMWRAPh, @function
_ZL8GENMWRAPh:
	mv	a5,a0
	not	a0,a0
	andi	a0,a0,1
	la a4, .LANCHOR0; sb a5, 0(a4);
	tail	_Z9setmirrori
	.size	_ZL8GENMWRAPh, .-_ZL8GENMWRAPh
	.section	.text._ZL6TKSPPUj,"ax",@progbits
	.align	2
	.type	_ZL6TKSPPUj, @function
_ZL6TKSPPUj:
	srli	a5,a0,10
	andi	a5,a5,7
	lla	a4,.LANCHOR4
	add	a4,a4,a5
	lbu	a0,0(a4)
	la a4, .LANCHOR3; sb a5, 0(a4);
	addi	a0,a0,2
	tail	_Z9setmirrori
	.size	_ZL6TKSPPUj, .-_ZL6TKSPPUj
	.section	.text._ZL12GenMMC3Closev,"ax",@progbits
	.align	2
	.type	_ZL12GenMMC3Closev, @function
_ZL12GenMMC3Closev:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a0, .LANCHOR5; lw a0, 0(a0);
	beq	a0,zero,.L15
	call	_Z10FCEU_gfreePv
.L15:
	la a0, .LANCHOR1; lw a0, 0(a0);
	beq	a0,zero,.L16
	call	_Z10FCEU_gfreePv
.L16:
	lw	ra,8(sp)
	la a5, .LANCHOR1; sw zero, 0(a5);
	la a5, .LANCHOR5; sw zero, 0(a5);
	addi	sp,sp,12
	jr	ra
	.size	_ZL12GenMMC3Closev, .-_ZL12GenMMC3Closev
	.section	.text._ZL8GENCWRAPjh,"ax",@progbits
	.align	2
	.type	_ZL8GENCWRAPjh, @function
_ZL8GENCWRAPjh:
	tail	_Z7setchr1jj
	.size	_ZL8GENCWRAPjh, .-_ZL8GENCWRAPjh
	.section	.text._ZL5M12CWjh,"ax",@progbits
	.align	2
	.type	_ZL5M12CWjh, @function
_ZL5M12CWjh:
	srli	a5,a0,12
	andi	a5,a5,1
	lla	a4,.LANCHOR2
	add	a5,a4,a5
	lbu	a5,0(a5)
	slli	a5,a5,8
	add	a1,a5,a1
	tail	_Z7setchr1jj
	.size	_ZL5M12CWjh, .-_ZL5M12CWjh
	.section	.text._ZL5M37CWjh,"ax",@progbits
	.align	2
	.type	_ZL5M37CWjh, @function
_ZL5M37CWjh:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	andi	a1,a1,127
	slli	a5,a5,6
	or	a1,a5,a1
	tail	_Z7setchr1jj
	.size	_ZL5M37CWjh, .-_ZL5M37CWjh
	.section	.text._ZL5M44CWjh,"ax",@progbits
	.align	2
	.type	_ZL5M44CWjh, @function
_ZL5M44CWjh:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	li	a4,5
	bgtu	a5,a4,.L28
	andi	a1,a1,127
.L28:
	slli	a5,a5,7
	or	a1,a5,a1
	tail	_Z7setchr1jj
	.size	_ZL5M44CWjh, .-_ZL5M44CWjh
	.section	.text._ZL5M47CWjh,"ax",@progbits
	.align	2
	.type	_ZL5M47CWjh, @function
_ZL5M47CWjh:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	andi	a1,a1,127
	slli	a5,a5,7
	or	a1,a5,a1
	tail	_Z7setchr1jj
	.size	_ZL5M47CWjh, .-_ZL5M47CWjh
	.section	.text._ZL5M49CWjh,"ax",@progbits
	.align	2
	.type	_ZL5M49CWjh, @function
_ZL5M49CWjh:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	slli	a5,a5,1
	andi	a1,a1,127
	andi	a5,a5,384
	or	a1,a5,a1
	tail	_Z7setchr1jj
	.size	_ZL5M49CWjh, .-_ZL5M49CWjh
	.section	.text._ZL5M52CWjh,"ax",@progbits
	.align	2
	.type	_ZL5M52CWjh, @function
_ZL5M52CWjh:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	srli	a3,a5,4
	srli	t1,a5,6
	andi	a4,a3,2
	andi	a2,a5,4
	and	a3,a3,t1
	slli	a5,a5,1
	or	a4,a4,a2
	andi	a3,a3,1
	andi	a5,a5,128
	or	a4,a4,a3
	xori	a5,a5,255
	slli	a4,a4,7
	and	a1,a5,a1
	or	a1,a4,a1
	tail	_Z7setchr1jj
	.size	_ZL5M52CWjh, .-_ZL5M52CWjh
	.section	.text._ZL6M115CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M115CWjh, @function
_ZL6M115CWjh:
	la a5, .LANCHOR2+1; lbu a5, 0(a5);
	slli	a5,a5,8
	andi	a5,a5,256
	or	a1,a5,a1
	tail	_Z7setchr1jj
	.size	_ZL6M115CWjh, .-_ZL6M115CWjh
	.section	.text._ZL6M134CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M134CWjh, @function
_ZL6M134CWjh:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	slli	a5,a5,3
	andi	a5,a5,256
	or	a1,a5,a1
	tail	_Z7setchr1jj
	.size	_ZL6M134CWjh, .-_ZL6M134CWjh
	.section	.text._ZL11UNLMaliSBCWjh,"ax",@progbits
	.align	2
	.type	_ZL11UNLMaliSBCWjh, @function
_ZL11UNLMaliSBCWjh:
	srli	a5,a1,4
	andi	a4,a1,-35
	andi	a5,a5,2
	slli	a1,a1,4
	or	a5,a5,a4
	andi	a1,a1,32
	or	a1,a5,a1
	tail	_Z7setchr1jj
	.size	_ZL11UNLMaliSBCWjh, .-_ZL11UNLMaliSBCWjh
	.section	.text._ZL6M205CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M205CWjh, @function
_ZL6M205CWjh:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	slli	a5,a5,3
	andi	a1,a1,127
	or	a1,a5,a1
	tail	_Z7setchr1jj
	.size	_ZL6M205CWjh, .-_ZL6M205CWjh
	.section	.text._ZL6M249CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M249CWjh, @function
_ZL6M249CWjh:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	andi	a5,a5,2
	beq	a5,zero,.L37
	srli	a5,a1,1
	srli	a2,a1,4
	andi	a5,a5,4
	andi	a2,a2,8
	andi	t1,a1,3
	srli	a3,a1,2
	slli	a4,a1,3
	or	a5,a5,a2
	slli	a1,a1,2
	andi	a1,a1,-64
	or	a5,a5,t1
	andi	a3,a3,16
	andi	a4,a4,32
	or	a4,a4,a1
	or	a5,a5,a3
	or	a5,a5,a4
	andi	a1,a5,0xff
.L37:
	tail	_Z7setchr1jj
	.size	_ZL6M249CWjh, .-_ZL6M249CWjh
	.section	.text._ZL7TKSWRAPjh,"ax",@progbits
	.align	2
	.type	_ZL7TKSWRAPjh, @function
_ZL7TKSWRAPjh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	a5,.LANCHOR4
	srli	s0,a0,10
	sw	s1,0(sp)
	add	a5,a5,s0
	sw	ra,8(sp)
	srli	s1,a1,7
	sb	s1,0(a5)
	andi	a1,a1,127
	call	_Z7setchr1jj
	la a5, .LANCHOR3; lbu a5, 0(a5);
	beq	s0,a5,.L44
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L44:
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	a0,s1,2
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL7TKSWRAPjh, .-_ZL7TKSWRAPjh
	.section	.text._ZL8GENPWRAPjh,"ax",@progbits
	.align	2
	.type	_ZL8GENPWRAPjh, @function
_ZL8GENPWRAPjh:
	la a5, .LANCHOR6; lbu a5, 0(a5);
	slli	a5,a5,4
	andi	a5,a5,64
	andi	a1,a1,127
	or	a1,a5,a1
	tail	_Z7setprg8jj
	.size	_ZL8GENPWRAPjh, .-_ZL8GENPWRAPjh
	.section	.text._ZL5M37PWjh,"ax",@progbits
	.align	2
	.type	_ZL5M37PWjh, @function
_ZL5M37PWjh:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	li	a3,2
	andi	a4,a1,15
	beq	a5,a3,.L48
	andi	a4,a1,7
.L48:
	slli	a5,a5,3
	or	a1,a4,a5
	andi	a1,a1,0xff
	tail	_Z7setprg8jj
	.size	_ZL5M37PWjh, .-_ZL5M37PWjh
	.section	.text._ZL5M44PWjh,"ax",@progbits
	.align	2
	.type	_ZL5M44PWjh, @function
_ZL5M44PWjh:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	li	a3,5
	andi	a4,a1,15
	bleu	a5,a3,.L51
	andi	a4,a1,31
.L51:
	slli	a5,a5,4
	or	a1,a5,a4
	tail	_Z7setprg8jj
	.size	_ZL5M44PWjh, .-_ZL5M44PWjh
	.section	.text._ZL5M45PWjh,"ax",@progbits
	.align	2
	.type	_ZL5M45PWjh, @function
_ZL5M45PWjh:
	lla	a4,.LANCHOR2
	lbu	a5,3(a4)
	lbu	a3,1(a4)
	not	a5,a5
	and	a1,a1,a5
	andi	a1,a1,63
	la a5, UNIFchrrama; lw a5, 0(a5);
	or	a1,a1,a3
	beq	a5,zero,.L53
	lbu	a5,2(a4)
	slli	a5,a5,2
	andi	a5,a5,256
	or	a1,a1,a5
.L53:
	tail	_Z7setprg8jj
	.size	_ZL5M45PWjh, .-_ZL5M45PWjh
	.section	.text._ZL5M47PWjh,"ax",@progbits
	.align	2
	.type	_ZL5M47PWjh, @function
_ZL5M47PWjh:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	andi	a1,a1,15
	slli	a5,a5,4
	or	a1,a1,a5
	andi	a1,a1,0xff
	tail	_Z7setprg8jj
	.size	_ZL5M47PWjh, .-_ZL5M47PWjh
	.section	.text._ZL5M52PWjh,"ax",@progbits
	.align	2
	.type	_ZL5M52PWjh, @function
_ZL5M52PWjh:
	la a3, .LANCHOR2; lbu a3, 0(a3);
	srli	a5,a3,3
	and	a5,a3,a5
	slli	a4,a3,1
	andi	a5,a5,1
	andi	a3,a3,6
	andi	a4,a4,16
	or	a5,a5,a3
	xori	a4,a4,31
	slli	a5,a5,4
	and	a1,a4,a1
	or	a1,a5,a1
	tail	_Z7setprg8jj
	.size	_ZL5M52PWjh, .-_ZL5M52PWjh
	.section	.text._ZL6M134PWjh,"ax",@progbits
	.align	2
	.type	_ZL6M134PWjh, @function
_ZL6M134PWjh:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	slli	a5,a5,4
	andi	a5,a5,32
	andi	a1,a1,31
	or	a1,a5,a1
	tail	_Z7setprg8jj
	.size	_ZL6M134PWjh, .-_ZL6M134PWjh
	.section	.text._ZL11UNLMaliSBPWjh,"ax",@progbits
	.align	2
	.type	_ZL11UNLMaliSBPWjh, @function
_ZL11UNLMaliSBPWjh:
	srli	a5,a1,1
	andi	a4,a1,3
	andi	a5,a5,4
	slli	a1,a1,1
	or	a5,a5,a4
	andi	a1,a1,8
	or	a1,a5,a1
	tail	_Z7setprg8jj
	.size	_ZL11UNLMaliSBPWjh, .-_ZL11UNLMaliSBPWjh
	.section	.text._ZL6M198PWjh,"ax",@progbits
	.align	2
	.type	_ZL6M198PWjh, @function
_ZL6M198PWjh:
	li	a4,79
	bleu	a1,a4,.L62
	andi	a1,a1,79
	tail	_Z7setprg8jj
.L62:
	tail	_Z7setprg8jj
	.size	_ZL6M198PWjh, .-_ZL6M198PWjh
	.section	.text._ZL6M205PWjh,"ax",@progbits
	.align	2
	.type	_ZL6M205PWjh, @function
_ZL6M205PWjh:
	andi	a1,a1,15
	la a5, .LANCHOR2; lbu a5, 0(a5);
	or	a1,a1,a5
	tail	_Z7setprg8jj
	.size	_ZL6M205PWjh, .-_ZL6M205PWjh
	.section	.text._ZL6M245PWjh,"ax",@progbits
	.align	2
	.type	_ZL6M245PWjh, @function
_ZL6M245PWjh:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	slli	a5,a5,5
	andi	a5,a5,64
	andi	a1,a1,63
	or	a1,a5,a1
	tail	_Z7setprg8jj
	.size	_ZL6M245PWjh, .-_ZL6M245PWjh
	.section	.text._ZL6M249PWjh,"ax",@progbits
	.align	2
	.type	_ZL6M249PWjh, @function
_ZL6M249PWjh:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	andi	a5,a5,2
	beq	a5,zero,.L66
	li	a5,31
	bgtu	a1,a5,.L67
	srli	a5,a1,3
	srli	a4,a1,1
	andi	a5,a5,2
	andi	a4,a4,4
	andi	a3,a1,1
	or	a5,a5,a4
	slli	a1,a1,2
	or	a5,a5,a3
	andi	a1,a1,24
	or	a1,a5,a1
.L66:
	tail	_Z7setprg8jj
.L67:
	addi	a1,a1,-32
	andi	a1,a1,0xff
	srli	a5,a1,1
	srli	a4,a1,4
	andi	a4,a4,8
	andi	a5,a5,4
	or	a5,a5,a4
	andi	a2,a1,3
	srli	a3,a1,2
	slli	a4,a1,3
	slli	a1,a1,2
	andi	a1,a1,-64
	or	a5,a5,a2
	andi	a3,a3,16
	andi	a4,a4,32
	or	a4,a4,a1
	or	a5,a5,a3
	or	a5,a5,a4
	andi	a1,a5,0xff
	tail	_Z7setprg8jj
	.size	_ZL6M249PWjh, .-_ZL6M249PWjh
	.section	.text._ZL5M49PWjh,"ax",@progbits
	.align	2
	.type	_ZL5M49PWjh, @function
_ZL5M49PWjh:
	la a5, .LANCHOR2; lbu a5, 0(a5);
	andi	a4,a5,1
	beq	a4,zero,.L72
	srli	a5,a5,2
	andi	a1,a1,15
	andi	a5,a5,48
	or	a1,a1,a5
	tail	_Z7setprg8jj
.L72:
	srli	a1,a5,4
	andi	a1,a1,3
	li	a0,32768
	tail	_Z8setprg32jj
	.size	_ZL5M49PWjh, .-_ZL5M49PWjh
	.section	.text._ZL5M74CWjh,"ax",@progbits
	.align	2
	.type	_ZL5M74CWjh, @function
_ZL5M74CWjh:
	addi	a5,a1,-8
	andi	a5,a5,0xff
	li	a4,1
	mv	a2,a1
	mv	a1,a0
	bleu	a5,a4,.L75
	li	a0,0
	tail	_Z8setchr1rijj
.L75:
	li	a0,16
	tail	_Z8setchr1rijj
	.size	_ZL5M74CWjh, .-_ZL5M74CWjh
	.section	.text._ZL6TQWRAPjh,"ax",@progbits
	.align	2
	.type	_ZL6TQWRAPjh, @function
_ZL6TQWRAPjh:
	mv	a2,a1
	mv	a1,a0
	srli	a0,a2,2
	andi	a0,a0,16
	andi	a2,a2,63
	tail	_Z8setchr1rijj
	.size	_ZL6TQWRAPjh, .-_ZL6TQWRAPjh
	.section	.text._ZL6M191CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M191CWjh, @function
_ZL6M191CWjh:
	mv	a2,a1
	mv	a1,a0
	srli	a0,a2,3
	andi	a0,a0,16
	tail	_Z8setchr1rijj
	.size	_ZL6M191CWjh, .-_ZL6M191CWjh
	.section	.text._ZL6M192CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M192CWjh, @function
_ZL6M192CWjh:
	addi	a5,a1,-8
	andi	a5,a5,0xff
	li	a4,3
	mv	a2,a1
	mv	a1,a0
	bgtu	a5,a4,.L79
	li	a0,16
	tail	_Z8setchr1rijj
.L79:
	li	a0,0
	tail	_Z8setchr1rijj
	.size	_ZL6M192CWjh, .-_ZL6M192CWjh
	.section	.text._ZL6M194CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M194CWjh, @function
_ZL6M194CWjh:
	mv	a2,a1
	li	a5,1
	mv	a1,a0
	bleu	a2,a5,.L82
	li	a0,0
	tail	_Z8setchr1rijj
.L82:
	li	a0,16
	tail	_Z8setchr1rijj
	.size	_ZL6M194CWjh, .-_ZL6M194CWjh
	.section	.text._ZL6M195CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M195CWjh, @function
_ZL6M195CWjh:
	mv	a2,a1
	li	a5,3
	mv	a1,a0
	bgtu	a2,a5,.L84
	li	a0,16
	tail	_Z8setchr1rijj
.L84:
	li	a0,0
	tail	_Z8setchr1rijj
	.size	_ZL6M195CWjh, .-_ZL6M195CWjh
	.section	.text._ZL9M114PWRAPjh,"ax",@progbits
	.align	2
	.type	_ZL9M114PWRAPjh, @function
_ZL9M114PWRAPjh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR2
	lbu	a5,0(s0)
	sw	ra,8(sp)
	slli	a4,a5,24
	srai	a4,a4,24
	blt	a4,zero,.L88
	lw	s0,4(sp)
	lw	ra,8(sp)
	andi	a1,a1,63
	addi	sp,sp,12
	tail	_Z7setprg8jj
.L88:
	andi	a1,a5,15
	li	a0,32768
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,49152
	andi	a1,a1,15
	addi	sp,sp,12
	tail	_Z8setprg16jj
	.size	_ZL9M114PWRAPjh, .-_ZL9M114PWRAPjh
	.section	.text._ZL6M115PWjh,"ax",@progbits
	.align	2
	.type	_ZL6M115PWjh, @function
_ZL6M115PWjh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR2
	lbu	a5,0(s0)
	sw	ra,8(sp)
	slli	a4,a5,24
	srai	a4,a4,24
	bge	a4,zero,.L90
	andi	a4,a5,32
	beq	a4,zero,.L91
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a1,a5,1
	andi	a1,a1,7
	li	a0,32768
	addi	sp,sp,12
	tail	_Z8setprg32jj
.L91:
	andi	a1,a5,15
	li	a0,32768
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a0,49152
	andi	a1,a1,15
	addi	sp,sp,12
	tail	_Z8setprg16jj
.L90:
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z7setprg8jj
	.size	_ZL6M115PWjh, .-_ZL6M115PWjh
	.section	.text._ZL9MR254WRAMj,"ax",@progbits
	.align	2
	.type	_ZL9MR254WRAMj, @function
_ZL9MR254WRAMj:
	lla	a4,.LANCHOR2
	la a5, .LANCHOR1; lw a5, 0(a5);
	lbu	a3,0(a4)
	add	a5,a5,a0
	li	a0,-24576
	add	a0,a0,a5
	lbu	a0,0(a0)
	bne	a3,zero,.L94
	lbu	a5,1(a4)
	xor	a0,a0,a5
.L94:
	ret
	.size	_ZL9MR254WRAMj, .-_ZL9MR254WRAMj
	.section	.text._Z13MMC3_IRQWritejh,"ax",@progbits
	.align	2
	.globl	_Z13MMC3_IRQWritejh
	.hidden	_Z13MMC3_IRQWritejh
	.type	_Z13MMC3_IRQWritejh, @function
_Z13MMC3_IRQWritejh:
	li	a4,57344
	addi	a5,a4,1
	and	a0,a0,a5
	beq	a0,a4,.L96
	beq	a0,a5,.L97
	li	a5,49152
	beq	a0,a5,.L98
	addi	a5,a5,1
	bne	a0,a5,.L104
	li	a5,1
	la a4, .LANCHOR8; sb a5, 0(a4);
	ret
.L96:
	addi	sp,sp,-12
	li	a0,1
	sw	ra,8(sp)
	call	_Z12X6502_IRQEndi
	lw	ra,8(sp)
	la a5, .LANCHOR9; sb zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L98:
	la a5, .LANCHOR7; sb a1, 0(a5);
	ret
.L97:
	li	a5,1
	la a4, .LANCHOR9; sb a5, 0(a4);
	ret
.L104:
	ret
	.size	_Z13MMC3_IRQWritejh, .-_Z13MMC3_IRQWritejh
	.section	.text._ZL16ClockMMC3Counterv,"ax",@progbits
	.align	2
	.type	_ZL16ClockMMC3Counterv, @function
_ZL16ClockMMC3Counterv:
	lla	a4,.LANCHOR10
	lbu	a5,0(a4)
	beq	a5,zero,.L106
	la a3, .LANCHOR8; lbu a3, 0(a3);
	beq	a3,zero,.L117
	la a5, .LANCHOR7; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, .LANCHOR8; sb zero, 0(a4);
.L109:
	bne	a5,zero,.L105
.L119:
	la a5, .LANCHOR9; lbu a5, 0(a5);
	bne	a5,zero,.L118
.L105:
	ret
.L106:
	la a5, .LANCHOR7; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, .LANCHOR8; sb zero, 0(a4);
	la a4, .LANCHOR11; lw a4, 0(a4);
	bne	a4,zero,.L109
	ret
.L117:
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	bne	a5,zero,.L105
	j	.L119
.L118:
	li	a0,1
	tail	_Z14X6502_IRQBegini
	.size	_ZL16ClockMMC3Counterv, .-_ZL16ClockMMC3Counterv
	.section	.text._ZL5M45CWjh,"ax",@progbits
	.align	2
	.type	_ZL5M45CWjh, @function
_ZL5M45CWjh:
	la a5, UNIFchrrama; lw a5, 0(a5);
	mv	a4,a1
	mv	a3,a0
	beq	a5,zero,.L126
	tail	_Z7setchr1jj
.L126:
	lla	a2,.LANCHOR2
	lbu	a5,2(a2)
	andi	a1,a5,8
	beq	a1,zero,.L122
	andi	a0,a5,7
	addi	a0,a0,1
	li	a1,1
	sll	a1,a1,a0
	addi	a1,a1,-1
	and	a4,a4,a1
.L123:
	lbu	a1,0(a2)
	li	a2,4096
	slli	a5,a5,4
	addi	a2,a2,-256
	and	a5,a5,a2
	or	a1,a5,a1
	or	a1,a1,a4
	mv	a0,a3
	tail	_Z7setchr1jj
.L122:
	seqz	a1,a5
	neg	a1,a1
	and	a4,a4,a1
	j	.L123
	.size	_ZL5M45CWjh, .-_ZL5M45CWjh
	.section	.text._ZL6M196PWjh,"ax",@progbits
	.align	2
	.type	_ZL6M196PWjh, @function
_ZL6M196PWjh:
	lla	a5,.LANCHOR2
	lbu	a4,0(a5)
	beq	a4,zero,.L128
	lbu	a1,1(a5)
	li	a0,32768
	tail	_Z8setprg32jj
.L128:
	tail	_Z7setprg8jj
	.size	_ZL6M196PWjh, .-_ZL6M196PWjh
	.section	.text._ZL5M76CWjh,"ax",@progbits
	.align	2
	.type	_ZL5M76CWjh, @function
_ZL5M76CWjh:
	li	a5,4096
	bgeu	a0,a5,.L131
	ret
.L131:
	li	a5,8192
	slli	a0,a0,1
	addi	a5,a5,-2048
	and	a0,a0,a5
	tail	_Z7setchr2jj
	.size	_ZL5M76CWjh, .-_ZL5M76CWjh
	.section	.text._ZL6M197CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M197CWjh, @function
_ZL6M197CWjh:
	beq	a0,zero,.L137
	li	a4,4096
	beq	a0,a4,.L136
	addi	a4,a4,1024
	beq	a0,a4,.L138
	ret
.L137:
	srli	a1,a1,1
	tail	_Z7setchr4jj
.L138:
	li	a0,8192
	addi	a0,a0,-2048
.L136:
	tail	_Z7setchr2jj
	.size	_ZL6M197CWjh, .-_ZL6M197CWjh
	.section	.text._ZL8M115Readj,"ax",@progbits
	.align	2
	.type	_ZL8M115Readj, @function
_ZL8M115Readj:
	la a0, .LANCHOR2+2; lbu a0, 0(a0);
	ret
	.size	_ZL8M115Readj, .-_ZL8M115Readj
	.section	.text._ZL9M165PPUFEv.part.0,"ax",@progbits
	.align	2
	.type	_ZL9M165PPUFEv.part.0, @function
_ZL9M165PPUFEv.part.0:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR12
	lbu	a1,1(s0)
	sw	ra,8(sp)
	bne	a1,zero,.L141
	li	a2,0
	li	a0,16
	call	_Z8setchr4rijj
	lbu	a1,4(s0)
	bne	a1,zero,.L143
.L145:
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a2,0
	li	a1,4096
	li	a0,16
	addi	sp,sp,12
	tail	_Z8setchr4rijj
.L141:
	srli	a1,a1,2
	li	a0,0
	call	_Z7setchr4jj
	lbu	a1,4(s0)
	beq	a1,zero,.L145
.L143:
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a1,a1,2
	li	a0,4096
	addi	sp,sp,12
	tail	_Z7setchr4jj
	.size	_ZL9M165PPUFEv.part.0, .-_ZL9M165PPUFEv.part.0
	.section	.text._ZL7M165CWMjh,"ax",@progbits
	.align	2
	.type	_ZL7M165CWMjh, @function
_ZL7M165CWMjh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR13
	lbu	a5,0(s0)
	sw	ra,8(sp)
	sw	s1,0(sp)
	andi	a4,a5,5
	beq	a4,zero,.L147
.L148:
	andi	a5,a5,7
	li	a4,18
	srl	a5,a4,a5
	andi	a5,a5,1
	beq	a5,zero,.L146
	la a4, .LANCHOR2; lbu a4, 0(a4);
	li	a5,254
	beq	a4,a5,.L157
.L146:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L147:
	la a4, .LANCHOR2; lbu a4, 0(a4);
	li	a5,253
	bne	a4,a5,.L146
	lla	s1,.LANCHOR12
	lbu	a1,0(s1)
	bne	a1,zero,.L149
	li	a2,0
	li	a0,16
	call	_Z8setchr4rijj
.L150:
	lbu	a1,2(s1)
	bne	a1,zero,.L151
	li	a2,0
	li	a1,4096
	li	a0,16
	call	_Z8setchr4rijj
	lbu	a5,0(s0)
	j	.L148
.L157:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	tail	_ZL9M165PPUFEv.part.0
.L151:
	srli	a1,a1,2
	li	a0,4096
	call	_Z7setchr4jj
	lbu	a5,0(s0)
	j	.L148
.L149:
	srli	a1,a1,2
	li	a0,0
	call	_Z7setchr4jj
	j	.L150
	.size	_ZL7M165CWMjh, .-_ZL7M165CWMjh
	.section	.text._ZL7M165PPUj,"ax",@progbits
	.align	2
	.type	_ZL7M165PPUj, @function
_ZL7M165PPUj:
	li	a5,8192
	addi	a4,a5,-16
	and	a0,a0,a4
	addi	a4,a5,-48
	beq	a0,a4,.L167
	addi	a5,a5,-32
	beq	a0,a5,.L168
	ret
.L167:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR12
	lbu	a1,0(s0)
	li	a5,-3
	sw	ra,8(sp)
	la a4, .LANCHOR2; sb a5, 0(a4);
	beq	a1,zero,.L169
	srli	a1,a1,2
	li	a0,0
	call	_Z7setchr4jj
	lbu	a1,2(s0)
	bne	a1,zero,.L162
.L170:
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a2,0
	li	a1,4096
	li	a0,16
	addi	sp,sp,12
	tail	_Z8setchr4rijj
.L169:
	li	a2,0
	li	a0,16
	call	_Z8setchr4rijj
	lbu	a1,2(s0)
	beq	a1,zero,.L170
.L162:
	lw	s0,4(sp)
	lw	ra,8(sp)
	srli	a1,a1,2
	li	a0,4096
	addi	sp,sp,12
	tail	_Z7setchr4jj
.L168:
	li	a5,-2
	la a4, .LANCHOR2; sb a5, 0(a4);
	tail	_ZL9M165PPUFEv.part.0
	.size	_ZL7M165PPUj, .-_ZL7M165PPUj
	.section	.text._ZL12M250IRQWritejh,"ax",@progbits
	.align	2
	.type	_ZL12M250IRQWritejh, @function
_ZL12M250IRQWritejh:
	srli	a5,a0,10
	li	a4,57344
	andi	a5,a5,1
	and	a3,a0,a4
	or	a5,a5,a3
	beq	a5,a4,.L172
	bgtu	a5,a4,.L173
	li	a4,49152
	beq	a5,a4,.L174
	addi	a4,a4,1
	bne	a5,a4,.L181
	li	a5,1
	la a4, .LANCHOR8; sb a5, 0(a4);
	ret
.L173:
	addi	a4,a4,1
	bne	a5,a4,.L182
	li	a5,1
	la a4, .LANCHOR9; sb a5, 0(a4);
	ret
.L182:
	ret
.L174:
	la a5, .LANCHOR7; sb a0, 0(a5);
	ret
.L172:
	addi	sp,sp,-12
	li	a0,1
	sw	ra,8(sp)
	call	_Z12X6502_IRQEndi
	lw	ra,8(sp)
	la a5, .LANCHOR9; sb zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L181:
	ret
	.size	_ZL12M250IRQWritejh, .-_ZL12M250IRQWritejh
	.section	.text._ZL7MMC3_hbv,"ax",@progbits
	.align	2
	.type	_ZL7MMC3_hbv, @function
_ZL7MMC3_hbv:
	lla	a4,.LANCHOR10
	lbu	a5,0(a4)
	beq	a5,zero,.L184
	la a3, .LANCHOR8; lbu a3, 0(a3);
	beq	a3,zero,.L195
	la a5, .LANCHOR7; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, .LANCHOR8; sb zero, 0(a4);
.L187:
	bne	a5,zero,.L183
.L197:
	la a5, .LANCHOR9; lbu a5, 0(a5);
	bne	a5,zero,.L196
.L183:
	ret
.L184:
	la a5, .LANCHOR7; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, .LANCHOR8; sb zero, 0(a4);
	la a4, .LANCHOR11; lw a4, 0(a4);
	bne	a4,zero,.L187
	ret
.L195:
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	bne	a5,zero,.L183
	j	.L197
.L196:
	li	a0,1
	tail	_Z14X6502_IRQBegini
	.size	_ZL7MMC3_hbv, .-_ZL7MMC3_hbv
	.section	.text._ZL23MMC3_hb_PALStarWarsHackv,"ax",@progbits
	.align	2
	.type	_ZL23MMC3_hb_PALStarWarsHackv, @function
_ZL23MMC3_hb_PALStarWarsHackv:
	la a4, scanline; lw a4, 0(a4);
	li	a5,240
	beq	a4,a5,.L224
	lla	a4,.LANCHOR10
	lbu	a5,0(a4)
	bne	a5,zero,.L225
	la a5, .LANCHOR7; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, .LANCHOR8; sb zero, 0(a4);
	la a4, .LANCHOR11; lw a4, 0(a4);
	bne	a4,zero,.L219
.L218:
	ret
.L225:
	la a3, .LANCHOR8; lbu a3, 0(a3);
	beq	a3,zero,.L226
	la a5, .LANCHOR7; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, .LANCHOR8; sb zero, 0(a4);
.L219:
	bne	a5,zero,.L218
.L228:
	la a5, .LANCHOR9; lbu a5, 0(a5);
	beq	a5,zero,.L218
	li	a0,1
	tail	_Z14X6502_IRQBegini
.L224:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_ZL16ClockMMC3Counterv
	lla	a4,.LANCHOR10
	lbu	a5,0(a4)
	bne	a5,zero,.L227
	la a5, .LANCHOR7; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, .LANCHOR8; sb zero, 0(a4);
	la a4, .LANCHOR11; lw a4, 0(a4);
	bne	a4,zero,.L203
.L198:
	lw	ra,8(sp)
	addi	sp,sp,12
	jr	ra
.L226:
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	bne	a5,zero,.L218
	j	.L228
.L227:
	la a3, .LANCHOR8; lbu a3, 0(a3);
	beq	a3,zero,.L229
	la a5, .LANCHOR7; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, .LANCHOR8; sb zero, 0(a4);
.L203:
	bne	a5,zero,.L198
	la a5, .LANCHOR9; lbu a5, 0(a5);
	beq	a5,zero,.L198
	lw	ra,8(sp)
	li	a0,1
	addi	sp,sp,12
	tail	_Z14X6502_IRQBegini
.L229:
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	j	.L203
	.size	_ZL23MMC3_hb_PALStarWarsHackv, .-_ZL23MMC3_hb_PALStarWarsHackv
	.section	.text._ZL22MMC3_hb_KickMasterHackv,"ax",@progbits
	.align	2
	.type	_ZL22MMC3_hb_KickMasterHackv, @function
_ZL22MMC3_hb_KickMasterHackv:
	la a4, scanline; lw a4, 0(a4);
	li	a5,238
	beq	a4,a5,.L256
	lla	a4,.LANCHOR10
	lbu	a5,0(a4)
	bne	a5,zero,.L257
	la a5, .LANCHOR7; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, .LANCHOR8; sb zero, 0(a4);
	la a4, .LANCHOR11; lw a4, 0(a4);
	bne	a4,zero,.L251
.L250:
	ret
.L257:
	la a3, .LANCHOR8; lbu a3, 0(a3);
	beq	a3,zero,.L258
	la a5, .LANCHOR7; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, .LANCHOR8; sb zero, 0(a4);
.L251:
	bne	a5,zero,.L250
.L260:
	la a5, .LANCHOR9; lbu a5, 0(a5);
	beq	a5,zero,.L250
	li	a0,1
	tail	_Z14X6502_IRQBegini
.L256:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_ZL16ClockMMC3Counterv
	lla	a4,.LANCHOR10
	lbu	a5,0(a4)
	bne	a5,zero,.L259
	la a5, .LANCHOR7; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, .LANCHOR8; sb zero, 0(a4);
	la a4, .LANCHOR11; lw a4, 0(a4);
	bne	a4,zero,.L235
.L230:
	lw	ra,8(sp)
	addi	sp,sp,12
	jr	ra
.L258:
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	bne	a5,zero,.L250
	j	.L260
.L259:
	la a3, .LANCHOR8; lbu a3, 0(a3);
	beq	a3,zero,.L261
	la a5, .LANCHOR7; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, .LANCHOR8; sb zero, 0(a4);
.L235:
	bne	a5,zero,.L230
	la a5, .LANCHOR9; lbu a5, 0(a5);
	beq	a5,zero,.L230
	lw	ra,8(sp)
	li	a0,1
	addi	sp,sp,12
	tail	_Z14X6502_IRQBegini
.L261:
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	j	.L235
	.size	_ZL22MMC3_hb_KickMasterHackv, .-_ZL22MMC3_hb_KickMasterHackv
	.section	.text._Z10FixMMC3PRGi,"ax",@progbits
	.align	2
	.globl	_Z10FixMMC3PRGi
	.hidden	_Z10FixMMC3PRGi
	.type	_Z10FixMMC3PRGi, @function
_Z10FixMMC3PRGi:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	s0,.LANCHOR14
	lla	s1,.LANCHOR12
	sw	ra,8(sp)
	andi	a0,a0,64
	lw	a5,0(s0)
	lbu	a1,6(s1)
	beq	a0,zero,.L263
	li	a0,49152
	jalr	a5
	lw	a5,0(s0)
	li	a1,254
	li	a0,32768
	jalr	a5
.L264:
	lbu	a1,7(s1)
	lw	a5,0(s0)
	li	a0,40960
	jalr	a5
	lw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	li	a1,255
	li	a0,57344
	addi	sp,sp,12
	jr	a5
.L263:
	li	a0,32768
	jalr	a5
	lw	a5,0(s0)
	li	a1,254
	li	a0,49152
	jalr	a5
	j	.L264
	.size	_Z10FixMMC3PRGi, .-_Z10FixMMC3PRGi
	.section	.text._Z14KT008HackWritejh,"ax",@progbits
	.align	2
	.globl	_Z14KT008HackWritejh
	.hidden	_Z14KT008HackWritejh
	.type	_Z14KT008HackWritejh, @function
_Z14KT008HackWritejh:
	andi	a0,a0,3
	bne	a0,zero,.L266
	addi	a5,a1,-39
	snez	a5,a5
	neg	a5,a5
	and	a1,a1,a5
	la a0, .LANCHOR13; lbu a0, 0(a0);
	la a5, .LANCHOR6; sb a1, 0(a5);
	tail	_Z10FixMMC3PRGi
.L266:
	ret
	.size	_Z14KT008HackWritejh, .-_Z14KT008HackWritejh
	.section	.text._ZL11M114ExWritejh,"ax",@progbits
	.align	2
	.type	_ZL11M114ExWritejh, @function
_ZL11M114ExWritejh:
	li	a5,32768
	bltu	a0,a5,.L271
	ret
.L271:
	la a0, .LANCHOR13; lbu a0, 0(a0);
	la a5, .LANCHOR2; sb a1, 0(a5);
	tail	_Z10FixMMC3PRGi
	.size	_ZL11M114ExWritejh, .-_ZL11M114ExWritejh
	.section	.text._ZL9M115Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M115Writejh, @function
_ZL9M115Writejh:
	li	a5,20480
	addi	a5,a5,128
	beq	a0,a5,.L276
	li	a5,24576
	beq	a0,a5,.L277
	addi	a5,a5,1
	bne	a0,a5,.L274
	la a5, .LANCHOR2+1; sb a1, 0(a5);
	la a0, .LANCHOR13; lbu a0, 0(a0);
	tail	_Z10FixMMC3PRGi
.L277:
	la a5, .LANCHOR2; sb a1, 0(a5);
.L274:
	la a0, .LANCHOR13; lbu a0, 0(a0);
	tail	_Z10FixMMC3PRGi
.L276:
	la a5, .LANCHOR2+2; sb a1, 0(a5);
	la a0, .LANCHOR13; lbu a0, 0(a0);
	tail	_Z10FixMMC3PRGi
	.size	_ZL9M115Writejh, .-_ZL9M115Writejh
	.section	.text._ZL16Mapper196WriteLojh,"ax",@progbits
	.align	2
	.type	_ZL16Mapper196WriteLojh, @function
_ZL16Mapper196WriteLojh:
	andi	a5,a1,15
	srli	a1,a1,4
	lla	a4,.LANCHOR2
	or	a5,a5,a1
	li	a3,1
	la a0, .LANCHOR13; lbu a0, 0(a0);
	sb	a3,0(a4)
	sb	a5,1(a4)
	tail	_Z10FixMMC3PRGi
	.size	_ZL16Mapper196WriteLojh, .-_ZL16Mapper196WriteLojh
	.section	.text._ZL6M245CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M245CWjh, @function
_ZL6M245CWjh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	la a5, UNIFchrrama; lw a5, 0(a5);
	mv	s0,a1
	beq	a5,zero,.L282
.L280:
	la a5, .LANCHOR2; sb s0, 0(a5);
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a0, .LANCHOR13; lbu a0, 0(a0);
	addi	sp,sp,12
	tail	_Z10FixMMC3PRGi
.L282:
	andi	a1,a1,7
	call	_Z7setchr1jj
	j	.L280
	.size	_ZL6M245CWjh, .-_ZL6M245CWjh
	.section	.text._Z10FixMMC3CHRi,"ax",@progbits
	.align	2
	.globl	_Z10FixMMC3CHRi
	.hidden	_Z10FixMMC3CHRi
	.type	_Z10FixMMC3CHRi, @function
_Z10FixMMC3CHRi:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,.LANCHOR12
	lla	s1,.LANCHOR15
	lbu	a1,0(a5)
	li	a3,4096
	lw	a4,0(s1)
	slli	s0,a0,5
	and	s0,s0,a3
	andi	a1,a1,254
	mv	a0,s0
	jalr	a4
	lla	a5,.LANCHOR12
	lbu	a1,0(a5)
	lw	a4,0(s1)
	ori	a0,s0,1024
	ori	a1,a1,1
	jalr	a4
	lla	a5,.LANCHOR12
	lbu	a1,1(a5)
	li	a3,4096
	lw	a4,0(s1)
	addi	a0,a3,-2048
	andi	a1,a1,254
	xor	a0,s0,a0
	jalr	a4
	lla	a5,.LANCHOR12
	lbu	a1,1(a5)
	li	a3,4096
	lw	a4,0(s1)
	addi	a0,a3,-1024
	ori	a1,a1,1
	xor	a0,s0,a0
	jalr	a4
	lla	a5,.LANCHOR12
	lbu	a1,2(a5)
	lw	a4,0(s1)
	li	a3,4096
	xor	a0,s0,a3
	jalr	a4
	lla	a5,.LANCHOR12
	lbu	a1,3(a5)
	li	a3,4096
	lw	a4,0(s1)
	addi	a0,a3,1024
	xor	a0,s0,a0
	jalr	a4
	lla	a5,.LANCHOR12
	lbu	a1,4(a5)
	li	a3,8192
	lw	a4,0(s1)
	addi	a0,a3,-2048
	xor	a0,s0,a0
	jalr	a4
	lla	a5,.LANCHOR12
	lbu	a1,5(a5)
	li	a3,8192
	lw	a5,0(s1)
	addi	a0,a3,-1024
	xor	a0,s0,a0
	jalr	a5
	la a5, .LANCHOR16; lw a5, 0(a5);
	beq	a5,zero,.L283
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	la a0, .LANCHOR0; lbu a0, 0(a0);
	addi	sp,sp,12
	jr	a5
.L283:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
	.size	_Z10FixMMC3CHRi, .-_Z10FixMMC3CHRi
	.section	.text._Z12MMC3RegResetv,"ax",@progbits
	.align	2
	.globl	_Z12MMC3RegResetv
	.hidden	_Z12MMC3RegResetv
	.type	_Z12MMC3RegResetv, @function
_Z12MMC3RegResetv:
	la a5, .LANCHOR13; sb zero, 0(a5);
	la a5, .LANCHOR9; sb zero, 0(a5);
	la a5, .LANCHOR7; sb zero, 0(a5);
	la a5, .LANCHOR10; sb zero, 0(a5);
	addi	sp,sp,-12
	li	a5,84148224
	sw	ra,8(sp)
	lla	a4,.LANCHOR12
	addi	a5,a5,512
	sw	a5,0(a4)
	li	a5,16777216
	addi	a5,a5,1798
	li	a0,0
	sw	a5,4(a4)
	la a5, .LANCHOR6; sb zero, 0(a5);
	call	_Z10FixMMC3PRGi
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
	.size	_Z12MMC3RegResetv, .-_Z12MMC3RegResetv
	.section	.text._Z12GenMMC3Powerv,"ax",@progbits
	.align	2
	.globl	_Z12GenMMC3Powerv
	.hidden	_Z12GenMMC3Powerv
	.type	_Z12GenMMC3Powerv, @function
_Z12GenMMC3Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	la a5, UNIFchrrama; lw a5, 0(a5);
	beq	a5,zero,.L289
	li	a0,0
	call	_Z7setchr8j
.L289:
	li	a1,49152
	lla	a2,_Z13MMC3_CMDWritejh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z13MMC3_IRQWritejh
	li	a0,49152
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	s0,24576
	lla	a2,_Z14KT008HackWritejh
	addi	a1,s0,-1
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	li	a0,1
	la a5, .LANCHOR0; sb zero, 0(a5);
	la a5, .LANCHOR17; sb zero, 0(a5);
	lla	s1,.LANCHOR18
	call	_Z9setmirrori
	lbu	a5,0(s1)
	andi	a5,a5,1
	beq	a5,zero,.L291
	lla	a4,.LANCHOR19
	lw	a0,0(a4)
	lla	a3,.LANCHOR1
	li	a5,1024
	lw	a2,0(a3)
	beq	a0,a5,.L300
	li	a1,24576
	srli	a0,a0,10
	call	_Z16FCEU_CheatAddRAMijPh
	lla	a4,.LANCHOR19
	lw	a1,0(a4)
	li	a5,8192
	addi	a5,a5,-1
	addi	a1,a1,-1
	and	a1,a1,a5
	lla	a2,_Z6CartBWjh
	add	a1,a1,s0
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a4,.LANCHOR19
	lw	a1,0(a4)
	li	a5,8192
	addi	a5,a5,-1
	addi	a1,a1,-1
	and	a1,a1,a5
	lla	a2,_Z6CartBRj
	li	a0,24576
	add	a1,a1,s0
	call	_Z14SetReadHandleriiPFhjE
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	lbu	a5,0(s1)
	lla	a3,.LANCHOR1
	lla	a4,.LANCHOR19
	andi	a5,a5,2
	beq	a5,zero,.L301
.L291:
	call	_Z12MMC3RegResetv
	la a0, .LANCHOR5; lw a0, 0(a0);
	beq	a0,zero,.L288
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	la a1, .LANCHOR20; lw a1, 0(a1);
	li	a2,1
	addi	sp,sp,12
	tail	_Z15FCEU_MemoryRandPhjb
.L288:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L300:
	li	a1,28672
	li	a0,1
	call	_Z16FCEU_CheatAddRAMijPh
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_ZL10MAWRAMMMC6j
	li	a0,28672
	call	_Z14SetReadHandleriiPFhjE
	lla	a2,_ZL10MBWRAMMMC6jh
	addi	a1,s0,-1
	li	a0,28672
	call	_Z15SetWriteHandleriiPFvjhE
	lbu	a5,0(s1)
	lla	a4,.LANCHOR19
	lla	a3,.LANCHOR1
	andi	a5,a5,2
	bne	a5,zero,.L291
.L301:
	lw	a1,0(a4)
	lw	a0,0(a3)
	li	a2,1
	call	_Z15FCEU_MemoryRandPhjb
	j	.L291
	.size	_Z12GenMMC3Powerv, .-_Z12GenMMC3Powerv
	.section	.text._ZL7M4Powerv,"ax",@progbits
	.align	2
	.type	_ZL7M4Powerv, @function
_ZL7M4Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z12GenMMC3Powerv
	la a0, .LANCHOR21; lw a0, 0(a0);
	not	a5,a0
	lw	ra,8(sp)
	andi	a5,a5,1
	la a4, .LANCHOR0; sb a5, 0(a4);
	addi	sp,sp,12
	tail	_Z9setmirrori
	.size	_ZL7M4Powerv, .-_ZL7M4Powerv
	.section	.text._ZL8M12Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M12Powerv, @function
_ZL8M12Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	lla	a5,.LANCHOR2
	li	a4,1
	sh	zero,0(a5)
	sb	a4,2(a5)
	call	_Z12GenMMC3Powerv
	li	s1,24576
	li	s0,16384
	addi	a1,s1,-1
	addi	a0,s0,256
	lla	a2,_ZL8M12Writejh
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a0,s0,256
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	a1,s1,-1
	lw	s1,0(sp)
	lla	a2,_ZL7M12Readj
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL8M12Powerv, .-_ZL8M12Powerv
	.section	.text._ZL8M37Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M37Powerv, @function
_ZL8M37Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a5, .LANCHOR2; sb zero, 0(a5);
	call	_Z12GenMMC3Powerv
	lw	ra,8(sp)
	li	a1,32768
	lla	a2,_ZL8M37Writejh
	addi	a1,a1,-1
	li	a0,24576
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL8M37Powerv, .-_ZL8M37Powerv
	.section	.text._ZL8M44Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M44Powerv, @function
_ZL8M44Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a5, .LANCHOR2; sb zero, 0(a5);
	call	_Z12GenMMC3Powerv
	lw	ra,8(sp)
	li	a1,49152
	lla	a2,_ZL8M44Writejh
	addi	a1,a1,-1
	li	a0,40960
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL8M44Powerv, .-_ZL8M44Powerv
	.section	.text._ZL8M45Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M45Powerv, @function
_ZL8M45Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z12GenMMC3Powerv
	lla	a5,.LANCHOR2
	li	a1,32768
	lla	a2,_ZL8M45Writejh
	addi	a1,a1,-1
	li	a0,20480
	sw	zero,0(a5)
	sh	zero,4(a5)
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	li	a1,24576
	lla	a2,_ZL7M45Readj
	addi	a1,a1,-1
	li	a0,20480
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL8M45Powerv, .-_ZL8M45Powerv
	.section	.text._ZL8M47Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M47Powerv, @function
_ZL8M47Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a5, .LANCHOR2; sb zero, 0(a5);
	call	_Z12GenMMC3Powerv
	lw	ra,8(sp)
	li	a1,32768
	lla	a2,_ZL8M47Writejh
	addi	a1,a1,-1
	li	a0,24576
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL8M47Powerv, .-_ZL8M47Powerv
	.section	.text._ZL9M114Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M114Powerv, @function
_ZL9M114Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z12GenMMC3Powerv
	li	a1,65536
	lla	a2,_ZL9M114Writejh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	li	a1,32768
	lla	a2,_ZL11M114ExWritejh
	addi	a1,a1,-1
	li	a0,20480
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL9M114Powerv, .-_ZL9M114Powerv
	.section	.text._ZL9M115Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M115Powerv, @function
_ZL9M115Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z12GenMMC3Powerv
	li	a1,32768
	li	a0,16384
	lla	a2,_ZL9M115Writejh
	addi	a1,a1,-1
	addi	a0,a0,256
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	li	a1,24576
	lla	a2,_ZL8M115Readj
	addi	a1,a1,-1
	li	a0,20480
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL9M115Powerv, .-_ZL9M115Powerv
	.section	.text._ZL9M134Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M134Powerv, @function
_ZL9M134Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a5, .LANCHOR2; sb zero, 0(a5);
	call	_Z12GenMMC3Powerv
	lw	ra,8(sp)
	li	a1,24576
	addi	a1,a1,1
	lla	a2,_ZL9M134Writejh
	mv	a0,a1
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL9M134Powerv, .-_ZL9M134Powerv
	.section	.text._ZL9M165Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M165Powerv, @function
_ZL9M165Powerv:
	li	a5,-3
	la a4, .LANCHOR2; sb a5, 0(a4);
	tail	_Z12GenMMC3Powerv
	.size	_ZL9M165Powerv, .-_ZL9M165Powerv
	.section	.text._ZL9M195Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M195Powerv, @function
_ZL9M195Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	call	_Z12GenMMC3Powerv
	li	a2,2
	li	a1,20480
	li	a0,16
	call	_Z8setprg4rijj
	li	s0,24576
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a2,_Z6CartBRj
	li	a0,20480
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL9M195Powerv, .-_ZL9M195Powerv
	.section	.text._ZL14Mapper196Powerv,"ax",@progbits
	.align	2
	.type	_ZL14Mapper196Powerv, @function
_ZL14Mapper196Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z12GenMMC3Powerv
	li	a1,28672
	lla	a2,_ZL16Mapper196WriteLojh
	addi	a1,a1,-1
	li	a0,24576
	la a5, .LANCHOR2; sh zero, 0(a5);
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	li	a1,65536
	lla	a2,_ZL14Mapper196Writejh
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL14Mapper196Powerv, .-_ZL14Mapper196Powerv
	.section	.text._ZL14UNLMaliSBPowerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLMaliSBPowerv, @function
_ZL14UNLMaliSBPowerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z12GenMMC3Powerv
	lw	ra,8(sp)
	li	a1,65536
	lla	a2,_ZL14UNLMaliSBWritejh
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL14UNLMaliSBPowerv, .-_ZL14UNLMaliSBPowerv
	.section	.text._ZL9M205Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M205Powerv, @function
_ZL9M205Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z12GenMMC3Powerv
	li	a1,28672
	lla	a2,_ZL10M205Write0jh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	li	a1,32768
	lla	a2,_ZL10M205Write1jh
	addi	a1,a1,-1
	li	a0,28672
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL9M205Powerv, .-_ZL9M205Powerv
	.section	.text._ZL9M245Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M245Powerv, @function
_ZL9M245Powerv:
	la a5, .LANCHOR2; sb zero, 0(a5);
	tail	_Z12GenMMC3Powerv
	.size	_ZL9M245Powerv, .-_ZL9M245Powerv
	.section	.text._ZL9M249Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M249Powerv, @function
_ZL9M249Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a5, .LANCHOR2; sb zero, 0(a5);
	call	_Z12GenMMC3Powerv
	lw	ra,8(sp)
	lla	a2,_ZL9M249Writejh
	li	a1,20480
	li	a0,20480
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL9M249Powerv, .-_ZL9M249Powerv
	.section	.text._ZL10M250_Powerv,"ax",@progbits
	.align	2
	.type	_ZL10M250_Powerv, @function
_ZL10M250_Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z12GenMMC3Powerv
	li	a1,49152
	lla	a2,_ZL9M250Writejh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	li	a1,65536
	lla	a2,_ZL12M250IRQWritejh
	addi	a1,a1,-1
	li	a0,49152
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL10M250_Powerv, .-_ZL10M250_Powerv
	.section	.text._ZL10M254_Powerv,"ax",@progbits
	.align	2
	.type	_ZL10M254_Powerv, @function
_ZL10M254_Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z12GenMMC3Powerv
	li	a1,49152
	lla	a2,_ZL9M254Writejh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	li	a1,32768
	lla	a2,_ZL9MR254WRAMj
	addi	a1,a1,-1
	li	a0,24576
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL10M254_Powerv, .-_ZL10M254_Powerv
	.section	.text._ZL8M12Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M12Resetv, @function
_ZL8M12Resetv:
	lla	a5,.LANCHOR2
	lbu	a4,2(a5)
	sh	zero,0(a5)
	xori	a4,a4,1
	sb	a4,2(a5)
	tail	_Z12MMC3RegResetv
	.size	_ZL8M12Resetv, .-_ZL8M12Resetv
	.section	.text._ZL8M37Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M37Resetv, @function
_ZL8M37Resetv:
	la a5, .LANCHOR2; sb zero, 0(a5);
	tail	_Z12MMC3RegResetv
	.size	_ZL8M37Resetv, .-_ZL8M37Resetv
	.section	.text._ZL8M45Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M45Resetv, @function
_ZL8M45Resetv:
	lla	a4,.LANCHOR2
	lbu	a5,5(a4)
	sw	zero,0(a4)
	sb	zero,4(a4)
	addi	a5,a5,1
	andi	a5,a5,7
	sb	a5,5(a4)
	tail	_Z12MMC3RegResetv
	.size	_ZL8M45Resetv, .-_ZL8M45Resetv
	.section	.text._ZL8M49Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M49Powerv, @function
_ZL8M49Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR2; sb zero, 0(a5);
	li	s0,32768
	call	_Z12MMC3RegResetv
	call	_Z12GenMMC3Powerv
	addi	a1,s0,-1
	lla	a2,_ZL8M49Writejh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	lw	ra,8(sp)
	li	a2,0
	li	a0,24576
	addi	sp,sp,12
	tail	_Z14SetReadHandleriiPFhjE
	.size	_ZL8M49Powerv, .-_ZL8M49Powerv
	.section	.text._ZL8M52Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M52Resetv, @function
_ZL8M52Resetv:
	la a5, .LANCHOR2; sh zero, 0(a5);
	tail	_Z12MMC3RegResetv
	.size	_ZL8M52Resetv, .-_ZL8M52Resetv
	.section	.text._ZL8M52Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M52Powerv, @function
_ZL8M52Powerv:
	addi	sp,sp,-12
	sw	ra,8(sp)
	la a5, .LANCHOR2; sh zero, 0(a5);
	call	_Z12MMC3RegResetv
	call	_Z12GenMMC3Powerv
	lw	ra,8(sp)
	li	a1,32768
	lla	a2,_ZL8M52Writejh
	addi	a1,a1,-1
	li	a0,24576
	addi	sp,sp,12
	tail	_Z15SetWriteHandleriiPFvjhE
	.size	_ZL8M52Powerv, .-_ZL8M52Powerv
	.section	.text._ZL9M205Resetv,"ax",@progbits
	.align	2
	.type	_ZL9M205Resetv, @function
_ZL9M205Resetv:
	lla	a5,.LANCHOR2
	sb	zero,2(a5)
	sb	zero,0(a5)
	tail	_Z12MMC3RegResetv
	.size	_ZL9M205Resetv, .-_ZL9M205Resetv
	.section	.text._ZL9M114Resetv,"ax",@progbits
	.align	2
	.type	_ZL9M114Resetv, @function
_ZL9M114Resetv:
	la a5, .LANCHOR2; sb zero, 0(a5);
	tail	_Z12MMC3RegResetv
	.size	_ZL9M114Resetv, .-_ZL9M114Resetv
	.section	.text._ZL8M49Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M49Resetv, @function
_ZL8M49Resetv:
	la a5, .LANCHOR2; sb zero, 0(a5);
	tail	_Z12MMC3RegResetv
	.size	_ZL8M49Resetv, .-_ZL8M49Resetv
	.section	.text._ZL9M134Resetv,"ax",@progbits
	.align	2
	.type	_ZL9M134Resetv, @function
_ZL9M134Resetv:
	la a5, .LANCHOR2; sb zero, 0(a5);
	tail	_Z12MMC3RegResetv
	.size	_ZL9M134Resetv, .-_ZL9M134Resetv
	.section	.text._Z13MMC3_CMDWritejh,"ax",@progbits
	.align	2
	.globl	_Z13MMC3_CMDWritejh
	.hidden	_Z13MMC3_CMDWritejh
	.type	_Z13MMC3_CMDWritejh, @function
_Z13MMC3_CMDWritejh:
	li	a5,57344
	addi	sp,sp,-12
	addi	a5,a5,1
	sw	s0,4(sp)
	and	a0,a0,a5
	sw	ra,8(sp)
	sw	s1,0(sp)
	li	a5,40960
	mv	s0,a1
	beq	a0,a5,.L349
	bgtu	a0,a5,.L350
	li	a5,32768
	beq	a0,a5,.L351
	addi	a5,a5,1
	bne	a0,a5,.L348
	la a3, .LANCHOR13; lbu a3, 0(a3);
	andi	a1,a3,7
	lla	a2,.L359
	slli	a5,a1,2
	add	a5,a5,a2
	lw	a5,0(a5)
	lla	a4,.LANCHOR12
	slli	s1,a3,5
	add	a4,a4,a1
	add	a5,a5,a2
	li	a2,4096
	and	s1,s1,a2
	sb	s0,0(a4)
	jr	a5
	.section	.rodata._Z13MMC3_CMDWritejh,"a",@progbits
	.align	2
	.align	2
.L359:
	.word	.L357-.L359
	.word	.L365-.L359
	.word	.L364-.L359
	.word	.L363-.L359
	.word	.L362-.L359
	.word	.L361-.L359
	.word	.L360-.L359
	.word	.L358-.L359
	.section	.text._Z13MMC3_CMDWritejh
.L350:
	addi	a5,a5,1
	bne	a0,a5,.L348
	la a5, .LANCHOR17; sb a1, 0(a5);
.L348:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L351:
	lla	s1,.LANCHOR13
	lbu	a5,0(s1)
	xor	a5,a1,a5
	andi	a4,a5,64
	bne	a4,zero,.L376
.L355:
	slli	a5,a5,24
	srai	a5,a5,24
	blt	a5,zero,.L377
	sb	s0,0(s1)
.L378:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L349:
	la a5, .LANCHOR16; lw a5, 0(a5);
	beq	a5,zero,.L348
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	mv	a0,a1
	addi	sp,sp,12
	jr	a5
.L376:
	mv	a0,a1
	call	_Z10FixMMC3PRGi
	lbu	a5,0(s1)
	xor	a5,s0,a5
	j	.L355
.L377:
	mv	a0,s0
	call	_Z10FixMMC3CHRi
	sb	s0,0(s1)
	j	.L378
.L365:
	lla	a4,.LANCHOR15
	li	a5,4096
	lw	a3,0(a4)
	addi	a0,a5,-2048
	andi	a1,s0,254
	xor	a0,s1,a0
	jalr	a3
	li	a5,4096
	lla	a4,.LANCHOR15
	addi	a0,a5,-1024
	ori	a1,s0,1
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	a4,0(a4)
	xor	a0,s1,a0
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	a4
.L358:
	mv	a1,s0
	li	a0,40960
	la a5, .LANCHOR14; lw a5, 0(a5);
.L374:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	a5
.L360:
	andi	a3,a3,64
	la a5, .LANCHOR14; lw a5, 0(a5);
	mv	a1,s0
	li	a0,49152
	bne	a3,zero,.L374
	li	a0,32768
	j	.L374
.L361:
	li	a0,8192
	mv	a1,s0
	addi	a0,a0,-1024
.L375:
	lw	s0,4(sp)
	lw	ra,8(sp)
	xor	a0,s1,a0
	lw	s1,0(sp)
	la a5, .LANCHOR15; lw a5, 0(a5);
	addi	sp,sp,12
	jr	a5
.L362:
	li	a0,8192
	mv	a1,s0
	addi	a0,a0,-2048
	j	.L375
.L363:
	li	a0,4096
	mv	a1,s0
	addi	a0,a0,1024
	j	.L375
.L364:
	mv	a1,s0
	li	a0,4096
	j	.L375
.L357:
	lla	a5,.LANCHOR15
	lw	a4,0(a5)
	andi	a1,s0,254
	mv	a0,s1
	jalr	a4
	lla	a5,.LANCHOR15
	lw	a5,0(a5)
	ori	a1,s0,1
	ori	a0,s1,1024
	j	.L374
	.size	_Z13MMC3_CMDWritejh, .-_Z13MMC3_CMDWritejh
	.section	.text._ZL14Mapper196Writejh,"ax",@progbits
	.align	2
	.type	_ZL14Mapper196Writejh, @function
_ZL14Mapper196Writejh:
	srli	a4,a0,3
	srli	a5,a0,2
	or	a5,a5,a4
	li	a4,65536
	addi	a4,a4,-2
	andi	a5,a5,1
	and	a4,a0,a4
	li	a3,49152
	or	a5,a5,a4
	bltu	a0,a3,.L380
	mv	a2,a1
	li	a1,57344
	addi	a4,a1,1
	and	a0,a5,a4
	beq	a0,a1,.L381
	beq	a0,a4,.L382
	beq	a0,a3,.L383
	addi	a3,a3,1
	bne	a0,a3,.L389
	li	a5,1
	la a4, .LANCHOR8; sb a5, 0(a4);
	ret
.L380:
	srli	a0,a0,1
	andi	a0,a0,1
	or	a0,a0,a5
	tail	_Z13MMC3_CMDWritejh
.L381:
	addi	sp,sp,-12
	li	a0,1
	sw	ra,8(sp)
	call	_Z12X6502_IRQEndi
	lw	ra,8(sp)
	la a5, .LANCHOR9; sb zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L383:
	la a5, .LANCHOR7; sb a2, 0(a5);
	ret
.L382:
	li	a5,1
	la a4, .LANCHOR9; sb a5, 0(a4);
	ret
.L389:
	ret
	.size	_ZL14Mapper196Writejh, .-_ZL14Mapper196Writejh
	.section	.text._ZL14UNLMaliSBWritejh,"ax",@progbits
	.align	2
	.type	_ZL14UNLMaliSBWritejh, @function
_ZL14UNLMaliSBWritejh:
	li	a4,65536
	addi	a4,a4,-2
	li	a3,49152
	and	a4,a0,a4
	srli	t1,a0,3
	bltu	a0,a3,.L391
	srli	a5,a0,2
	or	a5,a5,t1
	mv	a2,a1
	andi	a5,a5,1
	li	a1,57344
	or	a5,a5,a4
	addi	a4,a1,1
	and	a5,a5,a4
	beq	a5,a1,.L392
	beq	a5,a4,.L393
	beq	a5,a3,.L394
	addi	a3,a3,1
	bne	a5,a3,.L400
	li	a5,1
	la a4, .LANCHOR8; sb a5, 0(a4);
	ret
.L391:
	andi	a0,t1,1
	or	a0,a0,a4
	tail	_Z13MMC3_CMDWritejh
.L392:
	addi	sp,sp,-12
	li	a0,1
	sw	ra,8(sp)
	call	_Z12X6502_IRQEndi
	lw	ra,8(sp)
	la a5, .LANCHOR9; sb zero, 0(a5);
	addi	sp,sp,12
	jr	ra
.L394:
	la a5, .LANCHOR7; sb a2, 0(a5);
	ret
.L393:
	li	a5,1
	la a4, .LANCHOR9; sb a5, 0(a4);
	ret
.L400:
	ret
	.size	_ZL14UNLMaliSBWritejh, .-_ZL14UNLMaliSBWritejh
	.section	.text._ZL9M250Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M250Writejh, @function
_ZL9M250Writejh:
	srli	a4,a0,10
	li	a5,57344
	andi	a4,a4,1
	and	a5,a0,a5
	andi	a1,a0,0xff
	or	a0,a4,a5
	tail	_Z13MMC3_CMDWritejh
	.size	_ZL9M250Writejh, .-_ZL9M250Writejh
	.section	.text._ZL9M254Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M254Writejh, @function
_ZL9M254Writejh:
	li	a5,32768
	beq	a0,a5,.L403
	li	a5,40960
	addi	a5,a5,1
	bne	a0,a5,.L405
	la a5, .LANCHOR2+1; sb a1, 0(a5);
.L405:
	tail	_Z13MMC3_CMDWritejh
.L403:
	li	a5,-1
	la a4, .LANCHOR2; sb a5, 0(a4);
	tail	_Z13MMC3_CMDWritejh
	.size	_ZL9M254Writejh, .-_ZL9M254Writejh
	.section	.text._Z14GenMMC3Restorei,"ax",@progbits
	.align	2
	.globl	_Z14GenMMC3Restorei
	.hidden	_Z14GenMMC3Restorei
	.type	_Z14GenMMC3Restorei, @function
_Z14GenMMC3Restorei:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR13
	lbu	a0,0(s0)
	sw	ra,8(sp)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
	.size	_Z14GenMMC3Restorei, .-_Z14GenMMC3Restorei
	.section	.text._ZL8M37Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M37Writejh, @function
_ZL8M37Writejh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR13
	lbu	a0,0(s0)
	srli	a1,a1,1
	andi	a1,a1,3
	sw	ra,8(sp)
	la a5, .LANCHOR2; sb a1, 0(a5);
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
	.size	_ZL8M37Writejh, .-_ZL8M37Writejh
	.section	.text._ZL8M44Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M44Writejh, @function
_ZL8M44Writejh:
	andi	a4,a0,1
	beq	a4,zero,.L411
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR13
	lbu	a0,0(s0)
	andi	a1,a1,7
	sw	ra,8(sp)
	la a5, .LANCHOR2; sb a1, 0(a5);
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
.L411:
	tail	_Z13MMC3_CMDWritejh
	.size	_ZL8M44Writejh, .-_ZL8M44Writejh
	.section	.text._ZL8M45Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M45Writejh, @function
_ZL8M45Writejh:
	lla	a4,.LANCHOR2
	lbu	a5,3(a4)
	andi	a5,a5,64
	beq	a5,zero,.L416
	la a4, .LANCHOR1; lw a4, 0(a4);
	add	a4,a4,a0
	li	a5,-24576
	add	a5,a5,a4
	sb	a1,0(a5)
	ret
.L416:
	addi	sp,sp,-12
	sw	s0,4(sp)
	sw	ra,8(sp)
	lbu	a5,4(a4)
	lla	s0,.LANCHOR13
	lbu	a0,0(s0)
	add	a5,a4,a5
	sb	a1,0(a5)
	lbu	a5,4(a4)
	addi	a5,a5,1
	andi	a5,a5,3
	sb	a5,4(a4)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
	.size	_ZL8M45Writejh, .-_ZL8M45Writejh
	.section	.text._ZL8M47Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M47Writejh, @function
_ZL8M47Writejh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR13
	lbu	a0,0(s0)
	andi	a1,a1,1
	sw	ra,8(sp)
	la a5, .LANCHOR2; sb a1, 0(a5);
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
	.size	_ZL8M47Writejh, .-_ZL8M47Writejh
	.section	.text._ZL8M49Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M49Writejh, @function
_ZL8M49Writejh:
	la a5, .LANCHOR17; lb a5, 0(a5);
	blt	a5,zero,.L428
	ret
.L428:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR13
	lbu	a0,0(s0)
	sw	ra,8(sp)
	la a5, .LANCHOR2; sb a1, 0(a5);
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
	.size	_ZL8M49Writejh, .-_ZL8M49Writejh
	.section	.text._ZL8M52Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M52Writejh, @function
_ZL8M52Writejh:
	lla	a5,.LANCHOR2
	lbu	a4,1(a5)
	beq	a4,zero,.L430
	la a4, .LANCHOR1; lw a4, 0(a4);
	add	a4,a4,a0
	li	a5,-24576
	add	a5,a5,a4
	sb	a1,0(a5)
	ret
.L430:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR13
	lbu	a0,0(s0)
	sw	ra,8(sp)
	andi	a4,a1,-128
	sb	a4,1(a5)
	sb	a1,0(a5)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
	.size	_ZL8M52Writejh, .-_ZL8M52Writejh
	.section	.text._ZL9M134Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M134Writejh, @function
_ZL9M134Writejh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR13
	lbu	a0,0(s0)
	sw	ra,8(sp)
	la a5, .LANCHOR2; sb a1, 0(a5);
	call	_Z10FixMMC3CHRi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3PRGi
	.size	_ZL9M134Writejh, .-_ZL9M134Writejh
	.section	.text._ZL10M205Write1jh,"ax",@progbits
	.align	2
	.type	_ZL10M205Write1jh, @function
_ZL10M205Write1jh:
	lla	a4,.LANCHOR2
	lbu	a3,2(a4)
	bne	a3,zero,.L438
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR13
	lbu	a0,0(s0)
	sw	ra,8(sp)
	andi	a1,a1,48
	sb	a1,0(a4)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
.L438:
	tail	_Z6CartBWjh
	.size	_ZL10M205Write1jh, .-_ZL10M205Write1jh
	.section	.text._ZL10M205Write0jh,"ax",@progbits
	.align	2
	.type	_ZL10M205Write0jh, @function
_ZL10M205Write0jh:
	lla	a4,.LANCHOR2
	lbu	a3,2(a4)
	bne	a3,zero,.L443
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR13
	mv	a5,a0
	lbu	a0,0(s0)
	sw	ra,8(sp)
	andi	a3,a5,48
	andi	a5,a5,128
	sb	a3,0(a4)
	sb	a5,2(a4)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
.L443:
	tail	_Z6CartBWjh
	.size	_ZL10M205Write0jh, .-_ZL10M205Write0jh
	.section	.text._ZL9M249Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M249Writejh, @function
_ZL9M249Writejh:
	addi	sp,sp,-12
	sw	s0,4(sp)
	lla	s0,.LANCHOR13
	lbu	a0,0(s0)
	sw	ra,8(sp)
	la a5, .LANCHOR2; sb a1, 0(a5);
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	addi	sp,sp,12
	tail	_Z10FixMMC3CHRi
	.size	_ZL9M249Writejh, .-_ZL9M249Writejh
	.section	.text._ZL9M114Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M114Writejh, @function
_ZL9M114Writejh:
	li	a2,57344
	addi	sp,sp,-12
	addi	a3,a2,1
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	and	a5,a0,a3
	li	a4,49152
	beq	a5,a4,.L450
	bgtu	a5,a4,.L451
	li	a4,40960
	mv	a0,a1
	beq	a5,a4,.L452
	addi	a4,a4,1
	bne	a5,a4,.L471
	la a5, .LANCHOR7; sb a1, 0(a5);
.L449:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L471:
	li	a4,32768
	addi	a4,a4,1
	bne	a5,a4,.L449
	la a5, .LANCHOR16; lw a5, 0(a5);
	beq	a5,zero,.L449
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	a5
.L451:
	beq	a5,a2,.L456
	bne	a5,a3,.L472
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a5,1
	la a4, .LANCHOR9; sb a5, 0(a4);
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L472:
	addi	a4,a4,1
	bne	a5,a4,.L449
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a5,1
	la a4, .LANCHOR8; sb a5, 0(a4);
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L456:
	li	a0,1
	call	_Z12X6502_IRQEndi
	lw	ra,8(sp)
	lw	s0,4(sp)
	la a5, .LANCHOR9; sb zero, 0(a5);
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L450:
	la a5, .LANCHOR23; lbu a5, 0(a5);
	beq	a5,zero,.L449
	li	a0,32768
	addi	a0,a0,1
	call	_Z13MMC3_CMDWritejh
	la a5, .LANCHOR23; sb zero, 0(a5);
	j	.L449
.L452:
	andi	a4,a1,7
	lla	a5,.LANCHOR22
	add	a5,a5,a4
	lbu	s0,0(a5)
	lla	s1,.LANCHOR13
	lbu	a5,0(s1)
	andi	a1,a1,-64
	or	s0,s0,a1
	xor	a5,s0,a5
	andi	a4,a5,64
	bne	a4,zero,.L473
.L459:
	slli	a5,a5,24
	srai	a5,a5,24
	blt	a5,zero,.L474
.L460:
	sb	s0,0(s1)
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a5,1
	la a4, .LANCHOR23; sb a5, 0(a4);
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L474:
	mv	a0,s0
	call	_Z10FixMMC3CHRi
	j	.L460
.L473:
	mv	a0,s0
	call	_Z10FixMMC3PRGi
	lbu	a5,0(s1)
	xor	a5,s0,a5
	j	.L459
	.size	_ZL9M114Writejh, .-_ZL9M114Writejh
	.section	.rodata._Z12GenMMC3_InitP8CartInfoiiii.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.align	2
.LC1:
	.string	"KTEX"
	.section	.text._Z12GenMMC3_InitP8CartInfoiiii,"ax",@progbits
	.align	2
	.globl	_Z12GenMMC3_InitP8CartInfoiiii
	.hidden	_Z12GenMMC3_InitP8CartInfoiiii
	.type	_Z12GenMMC3_InitP8CartInfoiiii, @function
_Z12GenMMC3_InitP8CartInfoiiii:
	addi	sp,sp,-20
	lla	t1,CHRmask1
	sw	s1,8(sp)
	lw	s1,0(t1)
	lla	t0,PRGmask8
	srai	t2,a2,10
	sw	ra,16(sp)
	lla	a5,CHRmask2
	lw	ra,0(t0)
	addi	t2,t2,-1
	and	t2,t2,s1
	srai	a1,a1,13
	lw	s1,0(a5)
	srai	a2,a2,11
	addi	a1,a1,-1
	and	a1,a1,ra
	addi	a2,a2,-1
	lla	ra,_ZL8GENPWRAPjh
	and	a2,a2,s1
	la s1, .LANCHOR14; sw ra, 0(s1);
	lla	ra,_ZL8GENCWRAPjh
	sw	s0,12(sp)
	la s1, .LANCHOR15; sw ra, 0(s1);
	slli	s0,a3,10
	lla	ra,_ZL8GENMWRAPh
	la s1, .LANCHOR16; sw ra, 0(s1);
	sw	s0,0(sp)
	slli	ra,a3,10
	lla	s0,.LANCHOR19
	sw	ra,0(s0)
	sw	a1,0(t0)
	sw	t2,0(t1)
	sw	a2,0(a5)
	mv	s1,a0
	bne	a3,zero,.L490
.L476:
	beq	a4,zero,.L477
	lla	a3,.LANCHOR18
	lbu	a4,0(a3)
	lw	a2,0(s0)
	ori	a4,a4,2
	sb	a4,0(a3)
	la a4, .LANCHOR1; lw a4, 0(a4);
	sw	a4,12(s1)
	sw	a2,28(s1)
.L477:
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR6
	call	_Z10AddExStatePvjiPKc
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,.LANCHOR24
	call	_Z10AddExStatePvjiPKc
	lla	a3,_Z12GenMMC3Powerv
	sw	a3,0(s1)
	lw	a4,92(s1)
	lla	a3,_Z12MMC3RegResetv
	sw	a3,4(s1)
	li	a5,1359249408
	lla	a3,_ZL12GenMMC3Closev
	sw	a3,8(s1)
	addi	a5,a5,830
	lla	a3,_ZL22MMC3_hb_KickMasterHackv
	beq	a4,a5,.L478
	li	a5,1516789760
	addi	a5,a5,241
	beq	a4,a5,.L478
	li	a5,-1373106176
	addi	a5,a5,-480
	beq	a4,a5,.L478
	li	a5,-52989952
	addi	a5,a5,747
	lla	a3,_ZL7MMC3_hbv
	beq	a4,a5,.L491
.L478:
	lw	ra,16(sp)
	lw	s0,12(sp)
	la a5, GameHBIRQHook; sw a3, 0(a5);
	lla	a5,_Z14GenMMC3Restorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L490:
	lla	a2,.LANCHOR18
	lbu	a3,0(a2)
	mv	a0,ra
	sw	a4,4(sp)
	ori	a3,a3,1
	sb	a3,0(a2)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	a5,.LANCHOR1
	li	a3,1
	li	a0,16
	sw	a1,0(a5)
	call	_Z19SetupCartPRGMappingiPhji
	lla	a5,.LANCHOR1
	lw	a1,0(s0)
	lw	a0,0(a5)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	a4,4(sp)
	j	.L476
.L491:
	lla	a3,_ZL23MMC3_hb_PALStarWarsHackv
	j	.L478
	.size	_Z12GenMMC3_InitP8CartInfoiiii, .-_Z12GenMMC3_InitP8CartInfoiiii
	.section	.rodata._Z12Mapper4_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"Low-G-Man can not work normally in the iNES format.\nThis game has been recognized by its CRC32 value, and the appropriate changes will be made so it will run.\nIf you wish to hack this game, you should use the UNIF format for your hack.\n\n"
	.section	.text._Z12Mapper4_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12Mapper4_InitP8CartInfo
	.hidden	_Z12Mapper4_InitP8CartInfo
	.type	_Z12Mapper4_InitP8CartInfo, @function
_Z12Mapper4_InitP8CartInfo:
	lw	a4,92(a0)
	addi	sp,sp,-12
	li	a5,-1818685440
	sw	s0,4(sp)
	sw	ra,8(sp)
	addi	a5,a5,1075
	mv	s0,a0
	beq	a4,a5,.L493
	li	a5,-1352290304
	addi	a5,a5,-1404
	li	a3,8
	beq	a4,a5,.L493
.L494:
	lw	a4,48(s0)
	mv	a0,s0
	li	a2,256
	li	a1,512
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lw	a5,44(s0)
	lla	a4,_ZL7M4Powerv
	sw	a4,0(s0)
	lw	ra,8(sp)
	lw	s0,4(sp)
	la a4, .LANCHOR21; sw a5, 0(a4);
	addi	sp,sp,12
	jr	ra
.L493:
	lla	a0,.LC2
	call	printf
	li	a3,0
	j	.L494
	.size	_Z12Mapper4_InitP8CartInfo, .-_Z12Mapper4_InitP8CartInfo
	.section	.rodata._Z13Mapper12_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"EXPR"
	.section	.text._Z13Mapper12_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper12_InitP8CartInfo
	.hidden	_Z13Mapper12_InitP8CartInfo
	.type	_Z13Mapper12_InitP8CartInfo, @function
_Z13Mapper12_InitP8CartInfo:
	lw	a4,48(a0)
	addi	sp,sp,-12
	li	a3,8
	li	a2,256
	li	a1,512
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL5M12CWjh
	la a4, .LANCHOR15; sw a5, 0(a4);
	lla	a5,_ZL8M12Powerv
	sw	a5,0(s0)
	lla	a5,_ZL8M12Resetv
	sw	a5,4(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	la a5, .LANCHOR11; sw zero, 0(a5);
	lla	a3,.LC3
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR2
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper12_InitP8CartInfo, .-_Z13Mapper12_InitP8CartInfo
	.section	.text._Z13Mapper37_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper37_InitP8CartInfo
	.hidden	_Z13Mapper37_InitP8CartInfo
	.type	_Z13Mapper37_InitP8CartInfo, @function
_Z13Mapper37_InitP8CartInfo:
	lw	a4,48(a0)
	addi	sp,sp,-12
	li	a3,8
	li	a2,256
	li	a1,512
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL5M37PWjh
	la a4, .LANCHOR14; sw a5, 0(a4);
	lla	a5,_ZL5M37CWjh
	la a4, .LANCHOR15; sw a5, 0(a4);
	lla	a5,_ZL8M37Powerv
	sw	a5,0(s0)
	lla	a5,_ZL8M37Resetv
	sw	a5,4(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR2
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper37_InitP8CartInfo, .-_Z13Mapper37_InitP8CartInfo
	.section	.text._Z13Mapper44_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper44_InitP8CartInfo
	.hidden	_Z13Mapper44_InitP8CartInfo
	.type	_Z13Mapper44_InitP8CartInfo, @function
_Z13Mapper44_InitP8CartInfo:
	lw	a4,48(a0)
	addi	sp,sp,-12
	li	a3,8
	li	a2,256
	li	a1,512
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL5M44CWjh
	la a4, .LANCHOR15; sw a5, 0(a4);
	lla	a5,_ZL5M44PWjh
	la a4, .LANCHOR14; sw a5, 0(a4);
	lla	a5,_ZL8M44Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR2
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper44_InitP8CartInfo, .-_Z13Mapper44_InitP8CartInfo
	.section	.text._Z13Mapper45_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper45_InitP8CartInfo
	.hidden	_Z13Mapper45_InitP8CartInfo
	.type	_Z13Mapper45_InitP8CartInfo, @function
_Z13Mapper45_InitP8CartInfo:
	lw	a4,48(a0)
	addi	sp,sp,-12
	li	a3,8
	li	a2,256
	li	a1,512
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL5M45CWjh
	la a4, .LANCHOR15; sw a5, 0(a4);
	lla	a5,_ZL5M45PWjh
	la a4, .LANCHOR14; sw a5, 0(a4);
	lla	a5,_ZL8M45Resetv
	sw	a5,4(s0)
	lla	a5,_ZL8M45Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC3
	li	a2,0
	li	a1,5
	lla	a0,.LANCHOR2
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper45_InitP8CartInfo, .-_Z13Mapper45_InitP8CartInfo
	.section	.text._Z13Mapper47_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper47_InitP8CartInfo
	.hidden	_Z13Mapper47_InitP8CartInfo
	.type	_Z13Mapper47_InitP8CartInfo, @function
_Z13Mapper47_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,8
	li	a2,256
	li	a1,512
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL5M47PWjh
	la a4, .LANCHOR14; sw a5, 0(a4);
	lla	a5,_ZL5M47CWjh
	la a4, .LANCHOR15; sw a5, 0(a4);
	lla	a5,_ZL8M47Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR2
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper47_InitP8CartInfo, .-_Z13Mapper47_InitP8CartInfo
	.section	.text._Z13Mapper49_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper49_InitP8CartInfo
	.hidden	_Z13Mapper49_InitP8CartInfo
	.type	_Z13Mapper49_InitP8CartInfo, @function
_Z13Mapper49_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,512
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL5M49CWjh
	la a4, .LANCHOR15; sw a5, 0(a4);
	lla	a5,_ZL5M49PWjh
	la a4, .LANCHOR14; sw a5, 0(a4);
	lla	a5,_ZL8M49Resetv
	sw	a5,4(s0)
	lla	a5,_ZL8M49Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR2
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper49_InitP8CartInfo, .-_Z13Mapper49_InitP8CartInfo
	.section	.text._Z13Mapper52_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper52_InitP8CartInfo
	.hidden	_Z13Mapper52_InitP8CartInfo
	.type	_Z13Mapper52_InitP8CartInfo, @function
_Z13Mapper52_InitP8CartInfo:
	lw	a4,48(a0)
	addi	sp,sp,-12
	li	a3,8
	li	a2,256
	li	a1,256
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL5M52CWjh
	la a4, .LANCHOR15; sw a5, 0(a4);
	lla	a5,_ZL5M52PWjh
	la a4, .LANCHOR14; sw a5, 0(a4);
	lla	a5,_ZL8M52Resetv
	sw	a5,4(s0)
	lla	a5,_ZL8M52Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC3
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR2
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper52_InitP8CartInfo, .-_Z13Mapper52_InitP8CartInfo
	.section	.text._Z13Mapper76_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper76_InitP8CartInfo
	.hidden	_Z13Mapper76_InitP8CartInfo
	.type	_Z13Mapper76_InitP8CartInfo, @function
_Z13Mapper76_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,0
	li	a2,128
	li	a1,128
	sw	ra,8(sp)
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lw	ra,8(sp)
	lla	a5,_ZL5M76CWjh
	la a4, .LANCHOR15; sw a5, 0(a4);
	addi	sp,sp,12
	jr	ra
	.size	_Z13Mapper76_InitP8CartInfo, .-_Z13Mapper76_InitP8CartInfo
	.section	.rodata._Z13Mapper74_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"CHRR"
	.section	.text._Z13Mapper74_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper74_InitP8CartInfo
	.hidden	_Z13Mapper74_InitP8CartInfo
	.type	_Z13Mapper74_InitP8CartInfo, @function
_Z13Mapper74_InitP8CartInfo:
	lw	a4,48(a0)
	addi	sp,sp,-12
	li	a3,8
	li	a2,256
	li	a1,512
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	call	_Z12GenMMC3_InitP8CartInfoiiii
	li	a0,4096
	lla	s0,.LANCHOR20
	lla	a5,_ZL5M74CWjh
	addi	a0,a0,-2048
	la a4, .LANCHOR15; sw a5, 0(a4);
	sw	a0,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR5
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a1,0(s0)
	lw	s0,4(sp)
	lw	a0,0(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a3,.LC4
	li	a2,0
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z13Mapper74_InitP8CartInfo, .-_Z13Mapper74_InitP8CartInfo
	.section	.rodata._Z14Mapper114_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"CMDI"
	.section	.text._Z14Mapper114_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper114_InitP8CartInfo
	.hidden	_Z14Mapper114_InitP8CartInfo
	.type	_Z14Mapper114_InitP8CartInfo, @function
_Z14Mapper114_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,256
	sw	ra,8(sp)
	sw	s0,4(sp)
	la a5, .LANCHOR11; sw zero, 0(a5);
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL9M114PWRAPjh
	la a4, .LANCHOR14; sw a5, 0(a4);
	lla	a5,_ZL9M114Powerv
	sw	a5,0(s0)
	lla	a5,_ZL9M114Resetv
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR2
	sw	a5,4(s0)
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC5
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR23
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper114_InitP8CartInfo, .-_Z14Mapper114_InitP8CartInfo
	.section	.text._Z14Mapper115_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper115_InitP8CartInfo
	.hidden	_Z14Mapper115_InitP8CartInfo
	.type	_Z14Mapper115_InitP8CartInfo, @function
_Z14Mapper115_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,0
	li	a2,512
	li	a1,128
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M115CWjh
	la a4, .LANCHOR15; sw a5, 0(a4);
	lla	a5,_ZL6M115PWjh
	la a4, .LANCHOR14; sw a5, 0(a4);
	lla	a5,_ZL9M115Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC3
	li	a2,0
	li	a1,3
	lla	a0,.LANCHOR2
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper115_InitP8CartInfo, .-_Z14Mapper115_InitP8CartInfo
	.section	.text._Z14Mapper134_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper134_InitP8CartInfo
	.hidden	_Z14Mapper134_InitP8CartInfo
	.type	_Z14Mapper134_InitP8CartInfo, @function
_Z14Mapper134_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,256
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M134PWjh
	la a4, .LANCHOR14; sw a5, 0(a4);
	lla	a5,_ZL6M134CWjh
	la a4, .LANCHOR15; sw a5, 0(a4);
	lla	a5,_ZL9M134Powerv
	sw	a5,0(s0)
	lla	a5,_ZL9M134Resetv
	sw	a5,4(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC3
	li	a2,0
	li	a1,4
	lla	a0,.LANCHOR2
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper134_InitP8CartInfo, .-_Z14Mapper134_InitP8CartInfo
	.section	.text._Z14Mapper165_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper165_InitP8CartInfo
	.hidden	_Z14Mapper165_InitP8CartInfo
	.type	_Z14Mapper165_InitP8CartInfo, @function
_Z14Mapper165_InitP8CartInfo:
	lw	a4,48(a0)
	addi	sp,sp,-12
	li	a3,8
	li	a2,128
	li	a1,512
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL7M165CWMjh
	la a4, .LANCHOR15; sw a5, 0(a4);
	lla	a5,_ZL7M165PPUj
	la a4, PPU_hook; sw a5, 0(a4);
	lla	a5,_ZL9M165Powerv
	lla	s1,.LANCHOR20
	sw	a5,0(s0)
	li	a0,4096
	li	a5,4096
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	s0,.LANCHOR5
	li	a3,1
	li	a0,16
	sw	a1,0(s0)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a1,0(s1)
	lw	a0,0(s0)
	lla	a3,.LC4
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a3,.LC3
	li	a2,0
	li	a1,4
	lla	a0,.LANCHOR2
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper165_InitP8CartInfo, .-_Z14Mapper165_InitP8CartInfo
	.section	.text._Z14Mapper191_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper191_InitP8CartInfo
	.hidden	_Z14Mapper191_InitP8CartInfo
	.type	_Z14Mapper191_InitP8CartInfo, @function
_Z14Mapper191_InitP8CartInfo:
	lw	a4,48(a0)
	addi	sp,sp,-12
	li	a3,8
	li	a2,256
	li	a1,256
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	call	_Z12GenMMC3_InitP8CartInfoiiii
	li	a0,4096
	lla	s0,.LANCHOR20
	lla	a5,_ZL6M191CWjh
	addi	a0,a0,-2048
	la a4, .LANCHOR15; sw a5, 0(a4);
	sw	a0,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR5
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a1,0(s0)
	lw	s0,4(sp)
	lw	a0,0(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a3,.LC4
	li	a2,0
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper191_InitP8CartInfo, .-_Z14Mapper191_InitP8CartInfo
	.section	.text._Z14Mapper192_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper192_InitP8CartInfo
	.hidden	_Z14Mapper192_InitP8CartInfo
	.type	_Z14Mapper192_InitP8CartInfo, @function
_Z14Mapper192_InitP8CartInfo:
	lw	a4,48(a0)
	addi	sp,sp,-12
	li	a3,8
	li	a2,256
	li	a1,512
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M192CWjh
	lla	s0,.LANCHOR20
	la a4, .LANCHOR15; sw a5, 0(a4);
	li	a0,4096
	li	a5,4096
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR5
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a1,0(s0)
	lw	s0,4(sp)
	lw	a0,0(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a3,.LC4
	li	a2,0
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper192_InitP8CartInfo, .-_Z14Mapper192_InitP8CartInfo
	.section	.text._Z14Mapper194_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper194_InitP8CartInfo
	.hidden	_Z14Mapper194_InitP8CartInfo
	.type	_Z14Mapper194_InitP8CartInfo, @function
_Z14Mapper194_InitP8CartInfo:
	lw	a4,48(a0)
	addi	sp,sp,-12
	li	a3,8
	li	a2,256
	li	a1,512
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	call	_Z12GenMMC3_InitP8CartInfoiiii
	li	a0,4096
	lla	s0,.LANCHOR20
	lla	a5,_ZL6M194CWjh
	addi	a0,a0,-2048
	la a4, .LANCHOR15; sw a5, 0(a4);
	sw	a0,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR5
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a1,0(s0)
	lw	s0,4(sp)
	lw	a0,0(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a3,.LC4
	li	a2,0
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper194_InitP8CartInfo, .-_Z14Mapper194_InitP8CartInfo
	.section	.text._Z14Mapper195_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper195_InitP8CartInfo
	.hidden	_Z14Mapper195_InitP8CartInfo
	.type	_Z14Mapper195_InitP8CartInfo, @function
_Z14Mapper195_InitP8CartInfo:
	lw	a4,48(a0)
	addi	sp,sp,-12
	li	a3,16
	li	a2,256
	li	a1,512
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M195CWjh
	la a4, .LANCHOR15; sw a5, 0(a4);
	lla	a5,_ZL9M195Powerv
	lla	s1,.LANCHOR20
	sw	a5,0(s0)
	li	a0,4096
	li	a5,4096
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	s0,.LANCHOR5
	li	a3,1
	li	a0,16
	sw	a1,0(s0)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a0,0(s0)
	lw	s0,4(sp)
	lw	a1,0(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a3,.LC4
	li	a2,0
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper195_InitP8CartInfo, .-_Z14Mapper195_InitP8CartInfo
	.section	.text._Z14Mapper196_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper196_InitP8CartInfo
	.hidden	_Z14Mapper196_InitP8CartInfo
	.type	_Z14Mapper196_InitP8CartInfo, @function
_Z14Mapper196_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,0
	li	a2,128
	li	a1,128
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M196PWjh
	la a4, .LANCHOR14; sw a5, 0(a4);
	lla	a5,_ZL14Mapper196Powerv
	lw	ra,8(sp)
	sw	a5,0(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	_Z14Mapper196_InitP8CartInfo, .-_Z14Mapper196_InitP8CartInfo
	.section	.text._Z14UNLMaliSB_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLMaliSB_InitP8CartInfo
	.hidden	_Z14UNLMaliSB_InitP8CartInfo
	.type	_Z14UNLMaliSB_InitP8CartInfo, @function
_Z14UNLMaliSB_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,0
	li	a2,128
	li	a1,128
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL11UNLMaliSBPWjh
	la a4, .LANCHOR14; sw a5, 0(a4);
	lla	a5,_ZL11UNLMaliSBCWjh
	la a4, .LANCHOR15; sw a5, 0(a4);
	lla	a5,_ZL14UNLMaliSBPowerv
	lw	ra,8(sp)
	sw	a5,0(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	_Z14UNLMaliSB_InitP8CartInfo, .-_Z14UNLMaliSB_InitP8CartInfo
	.section	.text._Z14Mapper197_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper197_InitP8CartInfo
	.hidden	_Z14Mapper197_InitP8CartInfo
	.type	_Z14Mapper197_InitP8CartInfo, @function
_Z14Mapper197_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,8
	li	a2,512
	li	a1,128
	sw	ra,8(sp)
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lw	ra,8(sp)
	lla	a5,_ZL6M197CWjh
	la a4, .LANCHOR15; sw a5, 0(a4);
	addi	sp,sp,12
	jr	ra
	.size	_Z14Mapper197_InitP8CartInfo, .-_Z14Mapper197_InitP8CartInfo
	.section	.text._Z14Mapper198_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper198_InitP8CartInfo
	.hidden	_Z14Mapper198_InitP8CartInfo
	.type	_Z14Mapper198_InitP8CartInfo, @function
_Z14Mapper198_InitP8CartInfo:
	lw	a4,48(a0)
	addi	sp,sp,-12
	li	a3,16
	li	a2,0
	li	a1,1024
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M198PWjh
	la a4, .LANCHOR14; sw a5, 0(a4);
	lla	a5,_ZL9M195Powerv
	lw	ra,8(sp)
	sw	a5,0(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	_Z14Mapper198_InitP8CartInfo, .-_Z14Mapper198_InitP8CartInfo
	.section	.text._Z14Mapper205_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper205_InitP8CartInfo
	.hidden	_Z14Mapper205_InitP8CartInfo
	.type	_Z14Mapper205_InitP8CartInfo, @function
_Z14Mapper205_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,8
	li	a2,128
	li	a1,128
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M205PWjh
	la a4, .LANCHOR14; sw a5, 0(a4);
	lla	a5,_ZL6M205CWjh
	la a4, .LANCHOR15; sw a5, 0(a4);
	lla	a5,_ZL9M205Powerv
	sw	a5,0(s0)
	lla	a5,_ZL9M205Resetv
	sw	a5,4(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR2
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper205_InitP8CartInfo, .-_Z14Mapper205_InitP8CartInfo
	.section	.text._Z14Mapper245_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper245_InitP8CartInfo
	.hidden	_Z14Mapper245_InitP8CartInfo
	.type	_Z14Mapper245_InitP8CartInfo, @function
_Z14Mapper245_InitP8CartInfo:
	lw	a4,48(a0)
	addi	sp,sp,-12
	li	a3,8
	li	a2,256
	li	a1,512
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M245CWjh
	la a4, .LANCHOR15; sw a5, 0(a4);
	lla	a5,_ZL6M245PWjh
	la a4, .LANCHOR14; sw a5, 0(a4);
	lla	a5,_ZL9M245Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR2
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper245_InitP8CartInfo, .-_Z14Mapper245_InitP8CartInfo
	.section	.text._Z14Mapper249_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper249_InitP8CartInfo
	.hidden	_Z14Mapper249_InitP8CartInfo
	.type	_Z14Mapper249_InitP8CartInfo, @function
_Z14Mapper249_InitP8CartInfo:
	lw	a4,48(a0)
	addi	sp,sp,-12
	li	a3,8
	li	a2,256
	li	a1,512
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M249CWjh
	la a4, .LANCHOR15; sw a5, 0(a4);
	lla	a5,_ZL6M249PWjh
	la a4, .LANCHOR14; sw a5, 0(a4);
	lla	a5,_ZL9M249Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR2
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper249_InitP8CartInfo, .-_Z14Mapper249_InitP8CartInfo
	.section	.text._Z14Mapper250_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper250_InitP8CartInfo
	.hidden	_Z14Mapper250_InitP8CartInfo
	.type	_Z14Mapper250_InitP8CartInfo, @function
_Z14Mapper250_InitP8CartInfo:
	lw	a4,48(a0)
	addi	sp,sp,-12
	li	a3,8
	li	a2,256
	li	a1,512
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL10M250_Powerv
	lw	ra,8(sp)
	sw	a5,0(s0)
	lw	s0,4(sp)
	addi	sp,sp,12
	jr	ra
	.size	_Z14Mapper250_InitP8CartInfo, .-_Z14Mapper250_InitP8CartInfo
	.section	.text._Z14Mapper254_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper254_InitP8CartInfo
	.hidden	_Z14Mapper254_InitP8CartInfo
	.type	_Z14Mapper254_InitP8CartInfo, @function
_Z14Mapper254_InitP8CartInfo:
	lw	a4,48(a0)
	addi	sp,sp,-12
	li	a3,8
	li	a2,128
	li	a1,128
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL10M254_Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	lw	ra,8(sp)
	lla	a3,.LC3
	li	a2,0
	li	a1,2
	lla	a0,.LANCHOR2
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z14Mapper254_InitP8CartInfo, .-_Z14Mapper254_InitP8CartInfo
	.section	.text._Z10TBROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TBROM_InitP8CartInfo
	.hidden	_Z10TBROM_InitP8CartInfo
	.type	_Z10TBROM_InitP8CartInfo, @function
_Z10TBROM_InitP8CartInfo:
	li	a4,0
	li	a3,0
	li	a2,64
	li	a1,64
	tail	_Z12GenMMC3_InitP8CartInfoiiii
	.size	_Z10TBROM_InitP8CartInfo, .-_Z10TBROM_InitP8CartInfo
	.section	.text._Z10TEROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TEROM_InitP8CartInfo
	.hidden	_Z10TEROM_InitP8CartInfo
	.type	_Z10TEROM_InitP8CartInfo, @function
_Z10TEROM_InitP8CartInfo:
	li	a4,0
	li	a3,0
	li	a2,32
	li	a1,32
	tail	_Z12GenMMC3_InitP8CartInfoiiii
	.size	_Z10TEROM_InitP8CartInfo, .-_Z10TEROM_InitP8CartInfo
	.section	.text._Z10TFROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TFROM_InitP8CartInfo
	.hidden	_Z10TFROM_InitP8CartInfo
	.type	_Z10TFROM_InitP8CartInfo, @function
_Z10TFROM_InitP8CartInfo:
	li	a4,0
	li	a3,0
	li	a2,64
	li	a1,512
	tail	_Z12GenMMC3_InitP8CartInfoiiii
	.size	_Z10TFROM_InitP8CartInfo, .-_Z10TFROM_InitP8CartInfo
	.section	.text._Z10TGROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TGROM_InitP8CartInfo
	.hidden	_Z10TGROM_InitP8CartInfo
	.type	_Z10TGROM_InitP8CartInfo, @function
_Z10TGROM_InitP8CartInfo:
	li	a4,0
	li	a3,0
	li	a2,0
	li	a1,512
	tail	_Z12GenMMC3_InitP8CartInfoiiii
	.size	_Z10TGROM_InitP8CartInfo, .-_Z10TGROM_InitP8CartInfo
	.section	.text._Z10TKROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TKROM_InitP8CartInfo
	.hidden	_Z10TKROM_InitP8CartInfo
	.type	_Z10TKROM_InitP8CartInfo, @function
_Z10TKROM_InitP8CartInfo:
	lw	a4,48(a0)
	li	a3,8
	li	a2,256
	li	a1,512
	tail	_Z12GenMMC3_InitP8CartInfoiiii
	.size	_Z10TKROM_InitP8CartInfo, .-_Z10TKROM_InitP8CartInfo
	.section	.text._Z10TLROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TLROM_InitP8CartInfo
	.hidden	_Z10TLROM_InitP8CartInfo
	.type	_Z10TLROM_InitP8CartInfo, @function
_Z10TLROM_InitP8CartInfo:
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,512
	tail	_Z12GenMMC3_InitP8CartInfoiiii
	.size	_Z10TLROM_InitP8CartInfo, .-_Z10TLROM_InitP8CartInfo
	.section	.text._Z10TSROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TSROM_InitP8CartInfo
	.hidden	_Z10TSROM_InitP8CartInfo
	.type	_Z10TSROM_InitP8CartInfo, @function
_Z10TSROM_InitP8CartInfo:
	li	a4,0
	li	a3,8
	li	a2,256
	li	a1,512
	tail	_Z12GenMMC3_InitP8CartInfoiiii
	.size	_Z10TSROM_InitP8CartInfo, .-_Z10TSROM_InitP8CartInfo
	.section	.rodata._Z11TLSROM_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	"PPUC"
	.section	.text._Z11TLSROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11TLSROM_InitP8CartInfo
	.hidden	_Z11TLSROM_InitP8CartInfo
	.type	_Z11TLSROM_InitP8CartInfo, @function
_Z11TLSROM_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,8
	li	a2,256
	li	a1,512
	sw	ra,8(sp)
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL7TKSWRAPjh
	la a4, .LANCHOR15; sw a5, 0(a4);
	lla	a5,_ZL10GENNOMWRAPh
	lw	ra,8(sp)
	la a4, .LANCHOR16; sw a5, 0(a4);
	lla	a5,_ZL6TKSPPUj
	la a4, PPU_hook; sw a5, 0(a4);
	lla	a3,.LC6
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR3
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z11TLSROM_InitP8CartInfo, .-_Z11TLSROM_InitP8CartInfo
	.section	.text._Z11TKSROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11TKSROM_InitP8CartInfo
	.hidden	_Z11TKSROM_InitP8CartInfo
	.type	_Z11TKSROM_InitP8CartInfo, @function
_Z11TKSROM_InitP8CartInfo:
	lw	a4,48(a0)
	addi	sp,sp,-12
	li	a3,8
	li	a2,256
	li	a1,512
	sw	ra,8(sp)
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL7TKSWRAPjh
	la a4, .LANCHOR15; sw a5, 0(a4);
	lla	a5,_ZL10GENNOMWRAPh
	lw	ra,8(sp)
	la a4, .LANCHOR16; sw a5, 0(a4);
	lla	a5,_ZL6TKSPPUj
	la a4, PPU_hook; sw a5, 0(a4);
	lla	a3,.LC6
	li	a2,0
	li	a1,1
	lla	a0,.LANCHOR3
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z11TKSROM_InitP8CartInfo, .-_Z11TKSROM_InitP8CartInfo
	.section	.text._Z10TQROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TQROM_InitP8CartInfo
	.hidden	_Z10TQROM_InitP8CartInfo
	.type	_Z10TQROM_InitP8CartInfo, @function
_Z10TQROM_InitP8CartInfo:
	addi	sp,sp,-12
	li	a4,0
	li	a3,0
	li	a2,64
	li	a1,512
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6TQWRAPjh
	lla	s0,.LANCHOR20
	la a4, .LANCHOR15; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,.LANCHOR5
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a1,0(s0)
	lw	s0,4(sp)
	lw	a0,0(s1)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lla	a3,.LC4
	li	a2,0
	addi	sp,sp,12
	tail	_Z10AddExStatePvjiPKc
	.size	_Z10TQROM_InitP8CartInfo, .-_Z10TQROM_InitP8CartInfo
	.section	.text._Z14Mapper119_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper119_InitP8CartInfo
	.hidden	_Z14Mapper119_InitP8CartInfo
	.type	_Z14Mapper119_InitP8CartInfo, @function
_Z14Mapper119_InitP8CartInfo:
	tail	_Z10TQROM_InitP8CartInfo
	.size	_Z14Mapper119_InitP8CartInfo, .-_Z14Mapper119_InitP8CartInfo
	.section	.text._Z10HKROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10HKROM_InitP8CartInfo
	.hidden	_Z10HKROM_InitP8CartInfo
	.type	_Z10HKROM_InitP8CartInfo, @function
_Z10HKROM_InitP8CartInfo:
	lw	a4,48(a0)
	li	a3,1
	li	a2,512
	li	a1,512
	tail	_Z12GenMMC3_InitP8CartInfoiiii
	.size	_Z10HKROM_InitP8CartInfo, .-_Z10HKROM_InitP8CartInfo
	.hidden	m114_perm
	.globl	m114_perm
	.hidden	mwrap
	.globl	mwrap
	.hidden	cwrap
	.globl	cwrap
	.hidden	pwrap
	.globl	pwrap
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"REGS"
	.align	2
.LC8:
	.string	"CMD"
	.align	2
.LC9:
	.string	"A000"
	.align	2
.LC10:
	.string	"A001"
	.align	2
.LC11:
	.string	"IRQR"
	.align	2
.LC12:
	.string	"IRQC"
	.align	2
.LC13:
	.string	"IRQL"
	.align	2
.LC14:
	.string	"IRQA"
	.hidden	IRQReload
	.globl	IRQReload
	.hidden	IRQa
	.globl	IRQa
	.hidden	IRQLatch
	.globl	IRQLatch
	.hidden	IRQCount
	.globl	IRQCount
	.hidden	mmc3opts
	.globl	mmc3opts
	.hidden	A001B
	.globl	A001B
	.hidden	A000B
	.globl	A000B
	.hidden	EXPREGS
	.globl	EXPREGS
	.hidden	DRegBuf
	.globl	DRegBuf
	.hidden	CHRRAMSIZE
	.globl	CHRRAMSIZE
	.hidden	CHRRAM
	.globl	CHRRAM
	.hidden	WRAMSIZE
	.globl	WRAMSIZE
	.hidden	WRAM
	.globl	WRAM
	.hidden	kt_extra
	.globl	kt_extra
	.hidden	MMC3_cmd
	.globl	MMC3_cmd
	.section	.data._ZL14MMC3_StateRegs,"aw"
	.align	2
	.set	.LANCHOR24,. + 0
	.type	_ZL14MMC3_StateRegs, @object
	.size	_ZL14MMC3_StateRegs, 108
_ZL14MMC3_StateRegs:
	.word	DRegBuf
	.word	8
	.word	.LC7
	.word	MMC3_cmd
	.word	1
	.word	.LC8
	.word	A000B
	.word	1
	.word	.LC9
	.word	A001B
	.word	1
	.word	.LC10
	.word	IRQReload
	.word	1
	.word	.LC11
	.word	IRQCount
	.word	1
	.word	.LC12
	.word	IRQLatch
	.word	1
	.word	.LC13
	.word	IRQa
	.word	1
	.word	.LC14
	.word	0
	.zero	8
	.section	.sbss.A000B,"aw",@nobits
	.set	.LANCHOR0,. + 0
	.type	A000B, @object
	.size	A000B, 1
A000B:
	.zero	1
	.section	.sbss.A001B,"aw",@nobits
	.set	.LANCHOR17,. + 0
	.type	A001B, @object
	.size	A001B, 1
A001B:
	.zero	1
	.section	.sbss.CHRRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	CHRRAM, @object
	.size	CHRRAM, 4
CHRRAM:
	.zero	4
	.section	.sbss.CHRRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR20,. + 0
	.type	CHRRAMSIZE, @object
	.size	CHRRAMSIZE, 4
CHRRAMSIZE:
	.zero	4
	.section	.sbss.DRegBuf,"aw",@nobits
	.align	2
	.set	.LANCHOR12,. + 0
	.type	DRegBuf, @object
	.size	DRegBuf, 8
DRegBuf:
	.zero	8
	.section	.sbss.EXPREGS,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	EXPREGS, @object
	.size	EXPREGS, 8
EXPREGS:
	.zero	8
	.section	.sbss.IRQCount,"aw",@nobits
	.set	.LANCHOR10,. + 0
	.type	IRQCount, @object
	.size	IRQCount, 1
IRQCount:
	.zero	1
	.section	.sbss.IRQLatch,"aw",@nobits
	.set	.LANCHOR7,. + 0
	.type	IRQLatch, @object
	.size	IRQLatch, 1
IRQLatch:
	.zero	1
	.section	.sbss.IRQReload,"aw",@nobits
	.set	.LANCHOR8,. + 0
	.type	IRQReload, @object
	.size	IRQReload, 1
IRQReload:
	.zero	1
	.section	.sbss.IRQa,"aw",@nobits
	.set	.LANCHOR9,. + 0
	.type	IRQa, @object
	.size	IRQa, 1
IRQa:
	.zero	1
	.section	.sbss.MMC3_cmd,"aw",@nobits
	.set	.LANCHOR13,. + 0
	.type	MMC3_cmd, @object
	.size	MMC3_cmd, 1
MMC3_cmd:
	.zero	1
	.section	.sbss.WRAM,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	WRAM, @object
	.size	WRAM, 4
WRAM:
	.zero	4
	.section	.sbss.WRAMSIZE,"aw",@nobits
	.align	2
	.set	.LANCHOR19,. + 0
	.type	WRAMSIZE, @object
	.size	WRAMSIZE, 4
WRAMSIZE:
	.zero	4
	.section	.sbss._ZL5cmdin,"aw",@nobits
	.set	.LANCHOR23,. + 0
	.type	_ZL5cmdin, @object
	.size	_ZL5cmdin, 1
_ZL5cmdin:
	.zero	1
	.section	.sbss._ZL6TKSMIR,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZL6TKSMIR, @object
	.size	_ZL6TKSMIR, 8
_ZL6TKSMIR:
	.zero	8
	.section	.sbss._ZL6hackm4,"aw",@nobits
	.align	2
	.set	.LANCHOR21,. + 0
	.type	_ZL6hackm4, @object
	.size	_ZL6hackm4, 4
_ZL6hackm4:
	.zero	4
	.section	.sbss._ZL9PPUCHRBus,"aw",@nobits
	.set	.LANCHOR3,. + 0
	.type	_ZL9PPUCHRBus, @object
	.size	_ZL9PPUCHRBus, 1
_ZL9PPUCHRBus:
	.zero	1
	.section	.sbss.cwrap,"aw",@nobits
	.align	2
	.set	.LANCHOR15,. + 0
	.type	cwrap, @object
	.size	cwrap, 4
cwrap:
	.zero	4
	.section	.sbss.kt_extra,"aw",@nobits
	.set	.LANCHOR6,. + 0
	.type	kt_extra, @object
	.size	kt_extra, 1
kt_extra:
	.zero	1
	.section	.sbss.mmc3opts,"aw",@nobits
	.set	.LANCHOR18,. + 0
	.type	mmc3opts, @object
	.size	mmc3opts, 1
mmc3opts:
	.zero	1
	.section	.sbss.mwrap,"aw",@nobits
	.align	2
	.set	.LANCHOR16,. + 0
	.type	mwrap, @object
	.size	mwrap, 4
mwrap:
	.zero	4
	.section	.sbss.pwrap,"aw",@nobits
	.align	2
	.set	.LANCHOR14,. + 0
	.type	pwrap, @object
	.size	pwrap, 4
pwrap:
	.zero	4
	.section	.sdata._ZL6isRevB,"aw"
	.align	2
	.set	.LANCHOR11,. + 0
	.type	_ZL6isRevB, @object
	.size	_ZL6isRevB, 4
_ZL6isRevB:
	.word	1
	.section	.sdata.m114_perm,"aw"
	.align	2
	.set	.LANCHOR22,. + 0
	.type	m114_perm, @object
	.size	m114_perm, 8
m114_perm:
	.string	""
	.ascii	"\003\001\005\006\007\002\004"
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
