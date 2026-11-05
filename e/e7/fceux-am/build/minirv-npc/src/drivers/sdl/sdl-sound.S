#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"sdl-sound.cpp"
	.option nopic
	.text
	.section	.text._Z9InitSoundv,"ax",@progbits
	.align	2
	.globl	_Z9InitSoundv
	.hidden	_Z9InitSoundv
	.type	_Z9InitSoundv, @function
_Z9InitSoundv:
	li	a0,1
	ret
	.size	_Z9InitSoundv, .-_Z9InitSoundv
	.section	.text._Z11GetMaxSoundv,"ax",@progbits
	.align	2
	.globl	_Z11GetMaxSoundv
	.hidden	_Z11GetMaxSoundv
	.type	_Z11GetMaxSoundv, @function
_Z11GetMaxSoundv:
	li	a0,0
	ret
	.size	_Z11GetMaxSoundv, .-_Z11GetMaxSoundv
	.section	.text._Z13GetWriteSoundv,"ax",@progbits
	.align	2
	.globl	_Z13GetWriteSoundv
	.hidden	_Z13GetWriteSoundv
	.type	_Z13GetWriteSoundv, @function
_Z13GetWriteSoundv:
	li	a0,0
	ret
	.size	_Z13GetWriteSoundv, .-_Z13GetWriteSoundv
	.section	.text._Z10WriteSoundPii,"ax",@progbits
	.align	2
	.globl	_Z10WriteSoundPii
	.hidden	_Z10WriteSoundPii
	.type	_Z10WriteSoundPii, @function
_Z10WriteSoundPii:
	ret
	.size	_Z10WriteSoundPii, .-_Z10WriteSoundPii
	.section	.text._Z12SilenceSoundi,"ax",@progbits
	.align	2
	.globl	_Z12SilenceSoundi
	.hidden	_Z12SilenceSoundi
	.type	_Z12SilenceSoundi, @function
_Z12SilenceSoundi:
	ret
	.size	_Z12SilenceSoundi, .-_Z12SilenceSoundi
	.section	.text._Z9KillSoundv,"ax",@progbits
	.align	2
	.globl	_Z9KillSoundv
	.hidden	_Z9KillSoundv
	.type	_Z9KillSoundv, @function
_Z9KillSoundv:
	addi	sp,sp,-12
	li	a0,0
	sw	ra,8(sp)
	call	_Z11FCEUI_Soundi
	lw	ra,8(sp)
	li	a0,0
	addi	sp,sp,12
	jr	ra
	.size	_Z9KillSoundv, .-_Z9KillSoundv
	.section	.text._Z23FCEUD_SoundVolumeAdjusti,"ax",@progbits
	.align	2
	.globl	_Z23FCEUD_SoundVolumeAdjusti
	.hidden	_Z23FCEUD_SoundVolumeAdjusti
	.type	_Z23FCEUD_SoundVolumeAdjusti, @function
_Z23FCEUD_SoundVolumeAdjusti:
	ret
	.size	_Z23FCEUD_SoundVolumeAdjusti, .-_Z23FCEUD_SoundVolumeAdjusti
	.section	.text._Z17FCEUD_SoundTogglev,"ax",@progbits
	.align	2
	.globl	_Z17FCEUD_SoundTogglev
	.hidden	_Z17FCEUD_SoundTogglev
	.type	_Z17FCEUD_SoundTogglev, @function
_Z17FCEUD_SoundTogglev:
	ret
	.size	_Z17FCEUD_SoundTogglev, .-_Z17FCEUD_SoundTogglev
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
