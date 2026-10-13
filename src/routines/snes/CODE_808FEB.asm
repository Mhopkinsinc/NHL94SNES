; Unidentified routine.
CODE_808FEB:
	phy
	tay
	beq CODE_808FC3
	bpl CODE_808FCD
	eor.w #$FFFF
	inc a
	tay
	txa
	beq CODE_808FC3
	bpl CODE_808FD6
	eor.w #$FFFF
	inc a
	jmp.w CODE_808F9F
org $809002
