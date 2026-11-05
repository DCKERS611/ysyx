#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"sound.cpp"
	.option nopic
	.text
	.section	.text._Z17FCEU_SoundCPUHooki,"ax",@progbits
	.align	2
	.globl	_Z17FCEU_SoundCPUHooki
	.hidden	_Z17FCEU_SoundCPUHooki
	.type	_Z17FCEU_SoundCPUHooki, @function
_Z17FCEU_SoundCPUHooki:
	ret
	.size	_Z17FCEU_SoundCPUHooki, .-_Z17FCEU_SoundCPUHooki
	.section	.text._Z13FCEUSND_Powerv,"ax",@progbits
	.align	2
	.globl	_Z13FCEUSND_Powerv
	.hidden	_Z13FCEUSND_Powerv
	.type	_Z13FCEUSND_Powerv, @function
_Z13FCEUSND_Powerv:
	ret
	.size	_Z13FCEUSND_Powerv, .-_Z13FCEUSND_Powerv
	.section	.text._Z17FlushEmulateSoundv,"ax",@progbits
	.align	2
	.globl	_Z17FlushEmulateSoundv
	.hidden	_Z17FlushEmulateSoundv
	.type	_Z17FlushEmulateSoundv, @function
_Z17FlushEmulateSoundv:
	li	a0,0
	ret
	.size	_Z17FlushEmulateSoundv, .-_Z17FlushEmulateSoundv
	.section	.text._Z17SetSoundVariablesv,"ax",@progbits
	.align	2
	.globl	_Z17SetSoundVariablesv
	.hidden	_Z17SetSoundVariablesv
	.type	_Z17SetSoundVariablesv, @function
_Z17SetSoundVariablesv:
	ret
	.size	_Z17SetSoundVariablesv, .-_Z17SetSoundVariablesv
	.section	.text._Z11FCEUI_Soundi,"ax",@progbits
	.align	2
	.globl	_Z11FCEUI_Soundi
	.hidden	_Z11FCEUI_Soundi
	.type	_Z11FCEUI_Soundi, @function
_Z11FCEUI_Soundi:
	la a5, FSettings+60; sw a0, 0(a5);
	ret
	.size	_Z11FCEUI_Soundi, .-_Z11FCEUI_Soundi
	.section	.text._Z21FCEUI_SetSoundQualityi,"ax",@progbits
	.align	2
	.globl	_Z21FCEUI_SetSoundQualityi
	.hidden	_Z21FCEUI_SetSoundQualityi
	.type	_Z21FCEUI_SetSoundQualityi, @function
_Z21FCEUI_SetSoundQualityi:
	la a5, FSettings+64; sw a0, 0(a5);
	ret
	.size	_Z21FCEUI_SetSoundQualityi, .-_Z21FCEUI_SetSoundQualityi
	.section	.text._Z20FCEUI_SetSoundVolumej,"ax",@progbits
	.align	2
	.globl	_Z20FCEUI_SetSoundVolumej
	.hidden	_Z20FCEUI_SetSoundVolumej
	.type	_Z20FCEUI_SetSoundVolumej, @function
_Z20FCEUI_SetSoundVolumej:
	la a5, FSettings+8; sw a0, 0(a5);
	ret
	.size	_Z20FCEUI_SetSoundVolumej, .-_Z20FCEUI_SetSoundVolumej
	.section	.text._Z23FCEUI_SetTriangleVolumej,"ax",@progbits
	.align	2
	.globl	_Z23FCEUI_SetTriangleVolumej
	.hidden	_Z23FCEUI_SetTriangleVolumej
	.type	_Z23FCEUI_SetTriangleVolumej, @function
_Z23FCEUI_SetTriangleVolumej:
	la a5, FSettings+12; sw a0, 0(a5);
	ret
	.size	_Z23FCEUI_SetTriangleVolumej, .-_Z23FCEUI_SetTriangleVolumej
	.section	.text._Z22FCEUI_SetSquare1Volumej,"ax",@progbits
	.align	2
	.globl	_Z22FCEUI_SetSquare1Volumej
	.hidden	_Z22FCEUI_SetSquare1Volumej
	.type	_Z22FCEUI_SetSquare1Volumej, @function
_Z22FCEUI_SetSquare1Volumej:
	la a5, FSettings+16; sw a0, 0(a5);
	ret
	.size	_Z22FCEUI_SetSquare1Volumej, .-_Z22FCEUI_SetSquare1Volumej
	.section	.text._Z22FCEUI_SetSquare2Volumej,"ax",@progbits
	.align	2
	.globl	_Z22FCEUI_SetSquare2Volumej
	.hidden	_Z22FCEUI_SetSquare2Volumej
	.type	_Z22FCEUI_SetSquare2Volumej, @function
_Z22FCEUI_SetSquare2Volumej:
	la a5, FSettings+20; sw a0, 0(a5);
	ret
	.size	_Z22FCEUI_SetSquare2Volumej, .-_Z22FCEUI_SetSquare2Volumej
	.section	.text._Z20FCEUI_SetNoiseVolumej,"ax",@progbits
	.align	2
	.globl	_Z20FCEUI_SetNoiseVolumej
	.hidden	_Z20FCEUI_SetNoiseVolumej
	.type	_Z20FCEUI_SetNoiseVolumej, @function
_Z20FCEUI_SetNoiseVolumej:
	la a5, FSettings+24; sw a0, 0(a5);
	ret
	.size	_Z20FCEUI_SetNoiseVolumej, .-_Z20FCEUI_SetNoiseVolumej
	.section	.text._Z18FCEUI_SetPCMVolumej,"ax",@progbits
	.align	2
	.globl	_Z18FCEUI_SetPCMVolumej
	.hidden	_Z18FCEUI_SetPCMVolumej
	.type	_Z18FCEUI_SetPCMVolumej, @function
_Z18FCEUI_SetPCMVolumej:
	la a5, FSettings+28; sw a0, 0(a5);
	ret
	.size	_Z18FCEUI_SetPCMVolumej, .-_Z18FCEUI_SetPCMVolumej
	.hidden	soundtsi
	.globl	soundtsi
	.hidden	soundtsinc
	.globl	soundtsinc
	.hidden	nesincsize
	.globl	nesincsize
	.hidden	soundtsoffs
	.globl	soundtsoffs
	.hidden	EnvUnits
	.globl	EnvUnits
	.hidden	DMC_7bit
	.globl	DMC_7bit
	.hidden	InitialRawDALatch
	.globl	InitialRawDALatch
	.hidden	IRQFrameMode
	.globl	IRQFrameMode
	.hidden	EnabledChannels
	.globl	EnabledChannels
	.hidden	DMCSizeLatch
	.globl	DMCSizeLatch
	.hidden	DMCAddressLatch
	.globl	DMCAddressLatch
	.hidden	RawDALatch
	.globl	RawDALatch
	.hidden	DMCFormat
	.globl	DMCFormat
	.hidden	PSG
	.globl	PSG
	.hidden	GameExpSound
	.globl	GameExpSound
	.section	.bss.EnvUnits,"aw",@nobits
	.align	2
	.type	EnvUnits, @object
	.size	EnvUnits, 24
EnvUnits:
	.zero	24
	.section	.bss.GameExpSound,"aw",@nobits
	.align	2
	.type	GameExpSound, @object
	.size	GameExpSound, 24
GameExpSound:
	.zero	24
	.section	.bss.PSG,"aw",@nobits
	.align	2
	.type	PSG, @object
	.size	PSG, 16
PSG:
	.zero	16
	.section	.sbss.DMCAddressLatch,"aw",@nobits
	.type	DMCAddressLatch, @object
	.size	DMCAddressLatch, 1
DMCAddressLatch:
	.zero	1
	.section	.sbss.DMCFormat,"aw",@nobits
	.type	DMCFormat, @object
	.size	DMCFormat, 1
DMCFormat:
	.zero	1
	.section	.sbss.DMCSizeLatch,"aw",@nobits
	.type	DMCSizeLatch, @object
	.size	DMCSizeLatch, 1
DMCSizeLatch:
	.zero	1
	.section	.sbss.DMC_7bit,"aw",@nobits
	.type	DMC_7bit, @object
	.size	DMC_7bit, 1
DMC_7bit:
	.zero	1
	.section	.sbss.EnabledChannels,"aw",@nobits
	.type	EnabledChannels, @object
	.size	EnabledChannels, 1
EnabledChannels:
	.zero	1
	.section	.sbss.IRQFrameMode,"aw",@nobits
	.type	IRQFrameMode, @object
	.size	IRQFrameMode, 1
IRQFrameMode:
	.zero	1
	.section	.sbss.InitialRawDALatch,"aw",@nobits
	.type	InitialRawDALatch, @object
	.size	InitialRawDALatch, 1
InitialRawDALatch:
	.zero	1
	.section	.sbss.RawDALatch,"aw",@nobits
	.type	RawDALatch, @object
	.size	RawDALatch, 1
RawDALatch:
	.zero	1
	.section	.sbss.nesincsize,"aw",@nobits
	.align	2
	.type	nesincsize, @object
	.size	nesincsize, 4
nesincsize:
	.zero	4
	.section	.sbss.soundtsi,"aw",@nobits
	.align	2
	.type	soundtsi, @object
	.size	soundtsi, 4
soundtsi:
	.zero	4
	.section	.sbss.soundtsinc,"aw",@nobits
	.align	2
	.type	soundtsinc, @object
	.size	soundtsinc, 4
soundtsinc:
	.zero	4
	.section	.sbss.soundtsoffs,"aw",@nobits
	.align	2
	.type	soundtsoffs, @object
	.size	soundtsoffs, 4
soundtsoffs:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
