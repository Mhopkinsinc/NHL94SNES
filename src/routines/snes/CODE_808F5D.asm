; Unidentified routine.
CODE_808F5D:
	phy
CODE_808F5E:
	cpx.w #$0000
	bpl CODE_808F4D
CODE_808F63:
	sep #$30
	sta.w WRMPYA
	txa
	eor.b #$FF
	inc a
	sta.w WRMPYB
	rep #$30
	lda.w #$0000
	sec
	sbc.w RDMPYL
	ply
	rtl
