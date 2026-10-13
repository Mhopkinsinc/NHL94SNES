; Unidentified routine.
CODE_808F98:
	phy
	tay
	beq CODE_808FC3
	txa
	beq CODE_808FC3
CODE_808F9F:
	sep #$20
	sta.w WRMPYA
	sty.w WRMPYB
	stz.b $0A
	xba
	sta.w WRMPYA
	ldx.w RDMPYL
	stx.b $08
	sty.w WRMPYB
	stz.b $0B
	rep #$20
	lda.b $09
	clc
	adc.w RDMPYL
	sta.b $09
	ply
	rtl
