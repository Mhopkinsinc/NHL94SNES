; A * X, 8 by 8 bits, both signed, into A
Mul8S:
	phy
	tay
	bpl CODE_808F5E
	txa
	bpl CODE_808F7A
	eor.w #$FFFF
	inc a
	sta.w WRMPYA
	tya
	eor.w #$FFFF
	inc a
	sta.w WRMPYB
	bra CODE_808F57
