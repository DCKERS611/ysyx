#include "/home/ysyx/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"lopcodes.c"
	.option nopic
	.text
	.hidden	luaP_opmodes
	.globl	luaP_opmodes
	.hidden	luaP_opnames
	.globl	luaP_opnames
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"MOVE"
	.align	2
.LC1:
	.string	"LOADK"
	.align	2
.LC2:
	.string	"LOADKX"
	.align	2
.LC3:
	.string	"LOADBOOL"
	.align	2
.LC4:
	.string	"LOADNIL"
	.align	2
.LC5:
	.string	"GETUPVAL"
	.align	2
.LC6:
	.string	"GETTABUP"
	.align	2
.LC7:
	.string	"GETTABLE"
	.align	2
.LC8:
	.string	"SETTABUP"
	.align	2
.LC9:
	.string	"SETUPVAL"
	.align	2
.LC10:
	.string	"SETTABLE"
	.align	2
.LC11:
	.string	"NEWTABLE"
	.align	2
.LC12:
	.string	"SELF"
	.align	2
.LC13:
	.string	"ADD"
	.align	2
.LC14:
	.string	"SUB"
	.align	2
.LC15:
	.string	"MUL"
	.align	2
.LC16:
	.string	"MOD"
	.align	2
.LC17:
	.string	"POW"
	.align	2
.LC18:
	.string	"DIV"
	.align	2
.LC19:
	.string	"IDIV"
	.align	2
.LC20:
	.string	"BAND"
	.align	2
.LC21:
	.string	"BOR"
	.align	2
.LC22:
	.string	"BXOR"
	.align	2
.LC23:
	.string	"SHL"
	.align	2
.LC24:
	.string	"SHR"
	.align	2
.LC25:
	.string	"UNM"
	.align	2
.LC26:
	.string	"BNOT"
	.align	2
.LC27:
	.string	"NOT"
	.align	2
.LC28:
	.string	"LEN"
	.align	2
.LC29:
	.string	"CONCAT"
	.align	2
.LC30:
	.string	"JMP"
	.align	2
.LC31:
	.string	"EQ"
	.align	2
.LC32:
	.string	"LT"
	.align	2
.LC33:
	.string	"LE"
	.align	2
.LC34:
	.string	"TEST"
	.align	2
.LC35:
	.string	"TESTSET"
	.align	2
.LC36:
	.string	"CALL"
	.align	2
.LC37:
	.string	"TAILCALL"
	.align	2
.LC38:
	.string	"RETURN"
	.align	2
.LC39:
	.string	"FORLOOP"
	.align	2
.LC40:
	.string	"FORPREP"
	.align	2
.LC41:
	.string	"TFORCALL"
	.align	2
.LC42:
	.string	"TFORLOOP"
	.align	2
.LC43:
	.string	"SETLIST"
	.align	2
.LC44:
	.string	"CLOSURE"
	.align	2
.LC45:
	.string	"VARARG"
	.align	2
.LC46:
	.string	"EXTRAARG"
	.section	.rodata.luaP_opmodes,"a"
	.align	2
	.type	luaP_opmodes, @object
	.size	luaP_opmodes, 47
luaP_opmodes:
	.ascii	"`qATPP\\l<\020<Tl||||||||||||````h\"\274\274\274\204\344TT\020"
	.ascii	"bb\004b\024QP\027"
	.section	.rodata.luaP_opnames,"a"
	.align	2
	.type	luaP_opnames, @object
	.size	luaP_opnames, 192
luaP_opnames:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	0
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
