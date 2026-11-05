#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"sdl.cpp"
	.option nopic
	.text
	.section	.text._Z8LoadGamePKc,"ax",@progbits
	.align	2
	.globl	_Z8LoadGamePKc
	.hidden	_Z8LoadGamePKc
	.type	_Z8LoadGamePKc, @function
_Z8LoadGamePKc:
	addi	sp,sp,-12
	sw	s1,0(sp)
	lla	s1,.LANCHOR0
	lw	a5,0(s1)
	sw	s0,4(sp)
	sw	ra,8(sp)
	mv	s0,a0
	bne	a5,zero,.L19
.L2:
	li	a2,0
	li	a1,1
	mv	a0,s0
	call	_Z14FCEUI_LoadGamePKcib
	beq	a0,zero,.L6
	lla	s0,GameInfo
	lw	a0,0(s0)
	call	_Z12ParseGIInputP6FCEUGI
	call	_Z18RefreshThrottleFPSv
	lw	a0,0(s0)
	call	_Z9InitVideoP6FCEUGI
	blt	a0,zero,.L6
	lla	s0,.LANCHOR1
	lw	a5,0(s0)
	ori	a5,a5,4
	sw	a5,0(s0)
	call	_Z9InitSoundv
	beq	a0,zero,.L7
	lw	a5,0(s0)
	ori	a5,a5,1
	sw	a5,0(s0)
.L7:
	lla	a4,.LANCHOR2
	lw	a5,0(a4)
	andi	a5,a5,-33
	sw	a5,0(a4)
	call	_Z18InitInputInterfacev
	li	a0,0
	li	a1,1
	call	_Z15FCEUI_SetRegionii
	lw	ra,8(sp)
	lw	s0,4(sp)
	li	a5,1
	sw	a5,0(s1)
	li	a0,1
	lw	s1,0(sp)
	addi	sp,sp,12
	jr	ra
.L6:
	lw	ra,8(sp)
	lw	s0,4(sp)
	lw	s1,0(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
.L19:
	call	_Z15FCEUI_CloseGamev
	la a5, .LANCHOR1; lw a5, 0(a5);
	andi	a5,a5,4
	bne	a5,zero,.L20
.L3:
	la a5, .LANCHOR1; sw zero, 0(a5);
	la a5, .LANCHOR0; sw zero, 0(a5);
	la a5, GameInfo; sw zero, 0(a5);
	call	_Z18InputUserActiveFixv
	j	.L2
.L20:
	call	_Z9KillVideov
	j	.L3
	.size	_Z8LoadGamePKc, .-_Z8LoadGamePKc
	.section	.text._Z9CloseGamev,"ax",@progbits
	.align	2
	.globl	_Z9CloseGamev
	.hidden	_Z9CloseGamev
	.type	_Z9CloseGamev, @function
_Z9CloseGamev:
	la a0, .LANCHOR0; lw a0, 0(a0);
	bne	a0,zero,.L34
	ret
.L34:
	addi	sp,sp,-12
	sw	ra,8(sp)
	call	_Z15FCEUI_CloseGamev
	la a5, .LANCHOR1; lw a5, 0(a5);
	andi	a5,a5,4
	bne	a5,zero,.L35
.L23:
	la a5, .LANCHOR1; sw zero, 0(a5);
	la a5, .LANCHOR0; sw zero, 0(a5);
	la a5, GameInfo; sw zero, 0(a5);
	call	_Z18InputUserActiveFixv
	lw	ra,8(sp)
	li	a0,1
	addi	sp,sp,12
	jr	ra
.L35:
	call	_Z9KillVideov
	j	.L23
	.size	_Z9CloseGamev, .-_Z9CloseGamev
	.globl	__divsi3
	.section	.text._Z12FCEUD_UpdatePhPii,"ax",@progbits
	.align	2
	.globl	_Z12FCEUD_UpdatePhPii
	.hidden	_Z12FCEUD_UpdatePhPii
	.type	_Z12FCEUD_UpdatePhPii, @function
_Z12FCEUD_UpdatePhPii:
	addi	sp,sp,-28
	sw	s1,16(sp)
	sw	ra,24(sp)
	sw	s0,20(sp)
	mv	s1,a0
	bne	a2,zero,.L89
	la a5, NoWaiting; lw a5, 0(a5);
	bne	a5,zero,.L66
	la a5, .LANCHOR2; lw a5, 0(a5);
	andi	a5,a5,64
	beq	a5,zero,.L64
	j	.L90
.L67:
	call	_Z17FCEUD_UpdateInputv
.L64:
	call	_Z13SpeedThrottlev
	bne	a0,zero,.L67
.L66:
	beq	s1,zero,.L46
	la a5, .LANCHOR1; lw a5, 0(a5);
	andi	a5,a5,4
	bne	a5,zero,.L68
.L46:
	lw	s0,20(sp)
	lw	ra,24(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	tail	_Z17FCEUD_UpdateInputv
.L89:
	sw	a2,4(sp)
	mv	s0,a1
	call	_Z13GetWriteSoundv
	sw	a0,0(sp)
	call	_Z11GetMaxSoundv
	lw	a3,0(sp)
	lw	a2,4(sp)
	bgt	a0,a3,.L38
	li	a5,1
	la a4, .LANCHOR3; sw a5, 0(a4);
.L38:
	blt	a2,a3,.L69
	la a5, .LANCHOR3; sw zero, 0(a5);
.L39:
	mv	a1,a3
	mv	a0,s0
	sw	a2,0(sp)
	sw	a3,12(sp)
	call	_Z10WriteSoundPii
	call	_Z13GetWriteSoundv
	lw	a2,0(sp)
	mv	a5,a0
	li	a1,10
	slli	a4,a2,3
	add	a4,a4,a2
	mv	a0,a4
	sw	a2,8(sp)
	sw	a4,4(sp)
	sw	a5,0(sp)
	call	__divsi3
	lw	a5,0(sp)
	lw	a4,4(sp)
	lw	a2,8(sp)
	ble	a0,a5,.L40
	la a4, .LANCHOR3; lw a4, 0(a4);
	sw	a4,8(sp)
	bne	a4,zero,.L41
	lw	a3,12(sp)
	sub	a5,a2,a3
	beq	s1,zero,.L43
	la a4, .LANCHOR1; lw a4, 0(a4);
	andi	a4,a4,4
	beq	a4,zero,.L43
	lla	a4,NoWaiting
	lw	a1,0(a4)
	andi	a1,a1,2
	beq	a1,zero,.L91
	bne	a5,zero,.L45
.L68:
	mv	a0,s1
	call	_Z10BlitScreenPh
	lw	s0,20(sp)
	lw	ra,24(sp)
	lw	s1,16(sp)
	addi	sp,sp,28
	tail	_Z17FCEUD_UpdateInputv
.L69:
	mv	a3,a2
	j	.L39
.L43:
	lla	a4,NoWaiting
	beq	a5,zero,.L46
.L45:
	lw	a4,0(a4)
	slli	a3,a3,2
	add	s0,s0,a3
	bne	a4,zero,.L47
.L87:
	ble	a5,zero,.L51
	mv	a0,s0
	mv	a1,a2
	ble	a2,a5,.L52
	mv	a1,a5
.L52:
	sub	a5,a5,a2
	sw	a2,4(sp)
	sw	a5,0(sp)
	call	_Z10WriteSoundPii
	lw	a5,0(sp)
	lw	a2,4(sp)
	j	.L87
.L40:
	la a3, NoWaiting; lw a3, 0(a3);
	bne	a3,zero,.L66
	la a3, .LANCHOR3; lw a3, 0(a3);
	bne	a3,zero,.L56
	li	a1,5
	mv	a0,a4
	sw	a2,4(sp)
	sw	a5,0(sp)
	call	__divsi3
	lw	a5,0(sp)
	lw	a2,4(sp)
	bgt	a0,a5,.L66
.L56:
	bgt	a2,a5,.L92
.L58:
	ble	a5,zero,.L66
.L60:
	mv	a0,s0
	mv	a1,a2
	ble	a2,a5,.L59
	mv	a1,a5
.L59:
	sub	a5,a5,a2
	sw	a2,4(sp)
	sw	a5,0(sp)
	call	_Z10WriteSoundPii
	lw	a5,0(sp)
	lw	a2,4(sp)
	bgt	a5,zero,.L60
	j	.L66
.L90:
	call	_Z21FCEUI_EmulationPausedv
	bne	a0,zero,.L64
	j	.L66
.L41:
	la a4, NoWaiting; lw a4, 0(a4);
	bne	a4,zero,.L66
	ble	a2,a5,.L58
	j	.L92
.L47:
	sw	a5,0(sp)
	call	_Z13GetWriteSoundv
	lw	a5,0(sp)
	mv	a1,a0
	ble	a0,a5,.L50
	mv	a1,a5
.L50:
	mv	a0,s0
	call	_Z10WriteSoundPii
.L51:
	lw	a5,8(sp)
	bne	a5,zero,.L46
	j	.L66
.L92:
	mv	a2,a5
	j	.L58
.L91:
	mv	a0,s1
	sw	a4,12(sp)
	sw	a2,8(sp)
	sw	a5,4(sp)
	sw	a3,0(sp)
	call	_Z10BlitScreenPh
	lw	a5,4(sp)
	lw	a3,0(sp)
	lw	a2,8(sp)
	lw	a4,12(sp)
	beq	a5,zero,.L46
	li	a1,1
	sw	a1,8(sp)
	j	.L45
	.size	_Z12FCEUD_UpdatePhPii, .-_Z12FCEUD_UpdatePhPii
	.section	.text._Z18FCEUD_UTF8_fstreamPKcS0_,"ax",@progbits
	.align	2
	.globl	_Z18FCEUD_UTF8_fstreamPKcS0_
	.hidden	_Z18FCEUD_UTF8_fstreamPKcS0_
	.type	_Z18FCEUD_UTF8_fstreamPKcS0_, @function
_Z18FCEUD_UTF8_fstreamPKcS0_:
	addi	sp,sp,-16
	sw	s1,4(sp)
	mv	s1,a0
	li	a0,36
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	a1,0(sp)
	call	malloc
	lw	a2,0(sp)
	mv	a1,s1
	mv	s0,a0
	call	_ZN12EMUFILE_FILE4openEPKcS1_
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	_Z18FCEUD_UTF8_fstreamPKcS0_, .-_Z18FCEUD_UTF8_fstreamPKcS0_
	.section	.text._Z22FCEUD_TraceInstructionv,"ax",@progbits
	.align	2
	.globl	_Z22FCEUD_TraceInstructionv
	.hidden	_Z22FCEUD_TraceInstructionv
	.type	_Z22FCEUD_TraceInstructionv, @function
_Z22FCEUD_TraceInstructionv:
	ret
	.size	_Z22FCEUD_TraceInstructionv, .-_Z22FCEUD_TraceInstructionv
	.section	.rodata.main.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"ROM is %s\n"
	.align	2
.LC1:
	.string	"Starting FCEUX 2.2.3-interim git...\n"
	.align	2
.LC2:
	.string	"%s"
	.globl	__modsi3
	.section	.text.startup.main,"ax",@progbits
	.align	2
	.globl	main
	.hidden	main
	.type	main, @function
main:
	addi	sp,sp,-24
	sw	ra,20(sp)
	sw	s0,16(sp)
	sw	s1,12(sp)
	mv	s0,a0
	call	ioe_init
	mv	a1,s0
	lla	a0,.LC0
	call	printf
	lla	a1,.LC1
	lla	a0,.LC2
	call	printf
	call	_Z16FCEUI_Initializev
	beq	a0,zero,.L104
	call	_Z11UpdateInputv
	li	a2,72
	li	a1,56
	li	a0,0
	call	_Z15FCEUI_SetNTSCTHbii
	li	a1,1
	li	a0,0
	call	_Z15FCEUI_SetRegionii
	li	a0,1
	call	_Z29FCEUI_DisableSpriteLimitationi
	li	a3,239
	li	a2,0
	li	a1,231
	li	a0,8
	call	_Z22FCEUI_SetRenderedLinesiiii
	mv	a0,s0
	call	_Z8LoadGamePKc
	li	a5,1
	bne	a0,a5,.L98
	lla	a5,GameInfo
	lw	a5,0(a5)
	beq	a5,zero,.L100
	lla	s0,.LANCHOR4
	lla	s1,.LANCHOR5
.L99:
	lw	a0,0(s0)
	li	a1,3
	sw	zero,8(sp)
	addi	a0,a0,1
	call	__modsi3
	lla	a5,NoWaiting
	lw	a5,0(a5)
	mv	a3,a0
	sw	a3,0(s0)
	addi	a2,sp,8
	addi	a1,sp,4
	mv	a0,sp
	beq	a5,zero,.L102
	sw	zero,0(sp)
.L102:
	call	_Z13FCEUI_EmulatePPhPPiS1_i
	lw	a2,8(sp)
	lw	a1,4(sp)
	lw	a0,0(sp)
	call	_Z12FCEUD_UpdatePhPii
	call	_Z21FCEUI_EmulationPausedv
	lw	a5,0(s1)
	beq	a0,a5,.L103
	call	_Z21FCEUI_EmulationPausedv
	sw	a0,0(s1)
.L103:
	lla	a5,GameInfo
	lw	a5,0(a5)
	bne	a5,zero,.L99
.L100:
	call	_Z9CloseGamev
	call	_Z10FCEUI_Killv
	li	a0,0
.L96:
	lw	ra,20(sp)
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,24
	jr	ra
.L104:
	li	a0,-1
	j	.L96
.L98:
	la a5, .LANCHOR1; lw a5, 0(a5);
	andi	a5,a5,4
	bne	a5,zero,.L114
.L101:
	la a5, .LANCHOR1; sw zero, 0(a5);
	li	a0,-1
	j	.L96
.L114:
	call	_Z9KillVideov
	j	.L101
	.size	main, .-main
	.globl	__udivdi3
	.section	.text._Z13FCEUD_GetTimev,"ax",@progbits
	.align	2
	.globl	_Z13FCEUD_GetTimev
	.hidden	_Z13FCEUD_GetTimev
	.type	_Z13FCEUD_GetTimev, @function
_Z13FCEUD_GetTimev:
	addi	sp,sp,-24
	sw	s0,16(sp)
	addi	s0,sp,7
	andi	s0,s0,-8
	mv	a1,s0
	li	a0,6
	sw	ra,20(sp)
	call	ioe_read
	lw	a0,0(s0)
	lw	a1,4(s0)
	li	a2,1000
	li	a3,0
	call	__udivdi3
	lw	ra,20(sp)
	lw	s0,16(sp)
	addi	sp,sp,24
	jr	ra
	.size	_Z13FCEUD_GetTimev, .-_Z13FCEUD_GetTimev
	.section	.text._Z17FCEUD_GetTimeFreqv,"ax",@progbits
	.align	2
	.globl	_Z17FCEUD_GetTimeFreqv
	.hidden	_Z17FCEUD_GetTimeFreqv
	.type	_Z17FCEUD_GetTimeFreqv, @function
_Z17FCEUD_GetTimeFreqv:
	li	a0,1000
	ret
	.size	_Z17FCEUD_GetTimeFreqv, .-_Z17FCEUD_GetTimeFreqv
	.section	.text._Z13FCEUD_MessagePKc,"ax",@progbits
	.align	2
	.globl	_Z13FCEUD_MessagePKc
	.hidden	_Z13FCEUD_MessagePKc
	.type	_Z13FCEUD_MessagePKc, @function
_Z13FCEUD_MessagePKc:
	mv	a1,a0
	lla	a0,.LC2
	tail	printf
	.size	_Z13FCEUD_MessagePKc, .-_Z13FCEUD_MessagePKc
	.section	.rodata._Z16FCEUD_PrintErrorPKc.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"%s\n"
	.section	.text._Z16FCEUD_PrintErrorPKc,"ax",@progbits
	.align	2
	.globl	_Z16FCEUD_PrintErrorPKc
	.hidden	_Z16FCEUD_PrintErrorPKc
	.type	_Z16FCEUD_PrintErrorPKc, @function
_Z16FCEUD_PrintErrorPKc:
	mv	a1,a0
	lla	a0,.LC3
	tail	printf
	.size	_Z16FCEUD_PrintErrorPKc, .-_Z16FCEUD_PrintErrorPKc
	.section	.rodata._Z20FCEUD_HideMenuTogglev.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"FCEUD_HideMenuToggle"
	.align	2
.LC5:
	.string	"Not implemented.\n"
	.section	.text._Z20FCEUD_HideMenuTogglev,"ax",@progbits
	.align	2
	.globl	_Z20FCEUD_HideMenuTogglev
	.hidden	_Z20FCEUD_HideMenuTogglev
	.type	_Z20FCEUD_HideMenuTogglev, @function
_Z20FCEUD_HideMenuTogglev:
	addi	sp,sp,-12
	lla	a1,.LC4
	lla	a0,.LC3
	sw	ra,8(sp)
	call	printf
	lw	ra,8(sp)
	lla	a0,.LC5
	addi	sp,sp,12
	tail	printf
	.size	_Z20FCEUD_HideMenuTogglev, .-_Z20FCEUD_HideMenuTogglev
	.section	.rodata._Z21FCEUD_MovieReplayFromv.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	"FCEUD_MovieReplayFrom"
	.section	.text._Z21FCEUD_MovieReplayFromv,"ax",@progbits
	.align	2
	.globl	_Z21FCEUD_MovieReplayFromv
	.hidden	_Z21FCEUD_MovieReplayFromv
	.type	_Z21FCEUD_MovieReplayFromv, @function
_Z21FCEUD_MovieReplayFromv:
	addi	sp,sp,-12
	lla	a1,.LC6
	lla	a0,.LC3
	sw	ra,8(sp)
	call	printf
	lw	ra,8(sp)
	lla	a0,.LC5
	addi	sp,sp,12
	tail	printf
	.size	_Z21FCEUD_MovieReplayFromv, .-_Z21FCEUD_MovieReplayFromv
	.section	.rodata._Z22FCEUD_ToggleStatusIconv.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"FCEUD_ToggleStatusIcon"
	.section	.text._Z22FCEUD_ToggleStatusIconv,"ax",@progbits
	.align	2
	.globl	_Z22FCEUD_ToggleStatusIconv
	.hidden	_Z22FCEUD_ToggleStatusIconv
	.type	_Z22FCEUD_ToggleStatusIconv, @function
_Z22FCEUD_ToggleStatusIconv:
	addi	sp,sp,-12
	lla	a1,.LC7
	lla	a0,.LC3
	sw	ra,8(sp)
	call	printf
	lw	ra,8(sp)
	lla	a0,.LC5
	addi	sp,sp,12
	tail	printf
	.size	_Z22FCEUD_ToggleStatusIconv, .-_Z22FCEUD_ToggleStatusIconv
	.section	.rodata._Z17FCEUD_AviRecordTov.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	"FCEUD_AviRecordTo"
	.section	.text._Z17FCEUD_AviRecordTov,"ax",@progbits
	.align	2
	.globl	_Z17FCEUD_AviRecordTov
	.hidden	_Z17FCEUD_AviRecordTov
	.type	_Z17FCEUD_AviRecordTov, @function
_Z17FCEUD_AviRecordTov:
	addi	sp,sp,-12
	lla	a1,.LC8
	lla	a0,.LC3
	sw	ra,8(sp)
	call	printf
	lw	ra,8(sp)
	lla	a0,.LC5
	addi	sp,sp,12
	tail	printf
	.size	_Z17FCEUD_AviRecordTov, .-_Z17FCEUD_AviRecordTov
	.section	.rodata._Z13FCEUD_AviStopv.str1.4,"aMS",@progbits,1
	.align	2
.LC9:
	.string	"FCEUD_AviStop"
	.section	.text._Z13FCEUD_AviStopv,"ax",@progbits
	.align	2
	.globl	_Z13FCEUD_AviStopv
	.hidden	_Z13FCEUD_AviStopv
	.type	_Z13FCEUD_AviStopv, @function
_Z13FCEUD_AviStopv:
	addi	sp,sp,-12
	lla	a1,.LC9
	lla	a0,.LC3
	sw	ra,8(sp)
	call	printf
	lw	ra,8(sp)
	lla	a0,.LC5
	addi	sp,sp,12
	tail	printf
	.size	_Z13FCEUD_AviStopv, .-_Z13FCEUD_AviStopv
	.section	.text._Z20FCEUI_AviVideoUpdatePKh,"ax",@progbits
	.align	2
	.globl	_Z20FCEUI_AviVideoUpdatePKh
	.hidden	_Z20FCEUI_AviVideoUpdatePKh
	.type	_Z20FCEUI_AviVideoUpdatePKh, @function
_Z20FCEUI_AviVideoUpdatePKh:
	ret
	.size	_Z20FCEUI_AviVideoUpdatePKh, .-_Z20FCEUI_AviVideoUpdatePKh
	.section	.text._Z20FCEUD_ShowStatusIconv,"ax",@progbits
	.align	2
	.globl	_Z20FCEUD_ShowStatusIconv
	.hidden	_Z20FCEUD_ShowStatusIconv
	.type	_Z20FCEUD_ShowStatusIconv, @function
_Z20FCEUD_ShowStatusIconv:
	li	a0,0
	ret
	.size	_Z20FCEUD_ShowStatusIconv, .-_Z20FCEUD_ShowStatusIconv
	.section	.text._Z20FCEUI_AviIsRecordingv,"ax",@progbits
	.align	2
	.globl	_Z20FCEUI_AviIsRecordingv
	.hidden	_Z20FCEUI_AviIsRecordingv
	.type	_Z20FCEUI_AviIsRecordingv, @function
_Z20FCEUI_AviIsRecordingv:
	li	a0,0
	ret
	.size	_Z20FCEUI_AviIsRecordingv, .-_Z20FCEUI_AviIsRecordingv
	.section	.text._Z20FCEUI_UseInputPreseti,"ax",@progbits
	.align	2
	.globl	_Z20FCEUI_UseInputPreseti
	.hidden	_Z20FCEUI_UseInputPreseti
	.type	_Z20FCEUI_UseInputPreseti, @function
_Z20FCEUI_UseInputPreseti:
	ret
	.size	_Z20FCEUI_UseInputPreseti, .-_Z20FCEUI_UseInputPreseti
	.section	.text._Z24FCEUD_PauseAfterPlaybackv,"ax",@progbits
	.align	2
	.globl	_Z24FCEUD_PauseAfterPlaybackv
	.hidden	_Z24FCEUD_PauseAfterPlaybackv
	.type	_Z24FCEUD_PauseAfterPlaybackv, @function
_Z24FCEUD_PauseAfterPlaybackv:
	li	a0,0
	ret
	.size	_Z24FCEUD_PauseAfterPlaybackv, .-_Z24FCEUD_PauseAfterPlaybackv
	.section	.text._Z13FCEUD_TurboOnv,"ax",@progbits
	.align	2
	.globl	_Z13FCEUD_TurboOnv
	.hidden	_Z13FCEUD_TurboOnv
	.type	_Z13FCEUD_TurboOnv, @function
_Z13FCEUD_TurboOnv:
	lla	a4,NoWaiting
	lw	a5,0(a4)
	ori	a5,a5,1
	sw	a5,0(a4)
	ret
	.size	_Z13FCEUD_TurboOnv, .-_Z13FCEUD_TurboOnv
	.section	.text._Z14FCEUD_TurboOffv,"ax",@progbits
	.align	2
	.globl	_Z14FCEUD_TurboOffv
	.hidden	_Z14FCEUD_TurboOffv
	.type	_Z14FCEUD_TurboOffv, @function
_Z14FCEUD_TurboOffv:
	lla	a4,NoWaiting
	lw	a5,0(a4)
	andi	a5,a5,-2
	sw	a5,0(a4)
	ret
	.size	_Z14FCEUD_TurboOffv, .-_Z14FCEUD_TurboOffv
	.section	.text._Z17FCEUD_TurboTogglev,"ax",@progbits
	.align	2
	.globl	_Z17FCEUD_TurboTogglev
	.hidden	_Z17FCEUD_TurboTogglev
	.type	_Z17FCEUD_TurboTogglev, @function
_Z17FCEUD_TurboTogglev:
	lla	a4,NoWaiting
	lw	a5,0(a4)
	xori	a5,a5,1
	sw	a5,0(a4)
	ret
	.size	_Z17FCEUD_TurboTogglev, .-_Z17FCEUD_TurboTogglev
	.hidden	KillFCEUXonFrame
	.globl	KillFCEUXonFrame
	.hidden	noGui
	.globl	noGui
	.hidden	swapDuty
	.globl	swapDuty
	.hidden	dendy
	.globl	dendy
	.hidden	pal_emulation
	.globl	pal_emulation
	.hidden	gametype
	.globl	gametype
	.hidden	eoptions
	.globl	eoptions
	.hidden	turbo
	.globl	turbo
	.hidden	isloaded
	.globl	isloaded
	.section	.sbss.KillFCEUXonFrame,"aw",@nobits
	.align	2
	.type	KillFCEUXonFrame, @object
	.size	KillFCEUXonFrame, 4
KillFCEUXonFrame:
	.zero	4
	.section	.sbss._ZL6inited,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_ZL6inited, @object
	.size	_ZL6inited, 4
_ZL6inited:
	.zero	4
	.section	.sbss._ZZ12FCEUD_UpdatePhPiiE5uflow,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	_ZZ12FCEUD_UpdatePhPiiE5uflow, @object
	.size	_ZZ12FCEUD_UpdatePhPiiE5uflow, 4
_ZZ12FCEUD_UpdatePhPiiE5uflow:
	.zero	4
	.section	.sbss._ZZL5DoFuniiE6fskipc,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	_ZZL5DoFuniiE6fskipc, @object
	.size	_ZZL5DoFuniiE6fskipc, 4
_ZZL5DoFuniiE6fskipc:
	.zero	4
	.section	.sbss._ZZL5DoFuniiE6opause,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	_ZZL5DoFuniiE6opause, @object
	.size	_ZZL5DoFuniiE6opause, 4
_ZZL5DoFuniiE6opause:
	.zero	4
	.section	.sbss.dendy,"aw",@nobits
	.align	2
	.type	dendy, @object
	.size	dendy, 4
dendy:
	.zero	4
	.section	.sbss.eoptions,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	eoptions, @object
	.size	eoptions, 4
eoptions:
	.zero	4
	.section	.sbss.gametype,"aw",@nobits
	.align	2
	.type	gametype, @object
	.size	gametype, 4
gametype:
	.zero	4
	.section	.sbss.isloaded,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	isloaded, @object
	.size	isloaded, 4
isloaded:
	.zero	4
	.section	.sbss.pal_emulation,"aw",@nobits
	.align	2
	.type	pal_emulation, @object
	.size	pal_emulation, 4
pal_emulation:
	.zero	4
	.section	.sbss.swapDuty,"aw",@nobits
	.type	swapDuty, @object
	.size	swapDuty, 1
swapDuty:
	.zero	1
	.section	.sbss.turbo,"aw",@nobits
	.type	turbo, @object
	.size	turbo, 1
turbo:
	.zero	1
	.section	.sdata.noGui,"aw"
	.align	2
	.type	noGui, @object
	.size	noGui, 4
noGui:
	.word	1
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
