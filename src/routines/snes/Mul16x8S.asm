; X (16 bits) * A (8 bits) into $08-$0A, both signed
Mul16x8S:
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
