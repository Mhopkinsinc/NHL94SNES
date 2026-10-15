; X (16 bits) * A (8 bits) into $08-$0A, unsigned
Mul16x8U:
	phy
	tay
	beq Mul16x8_Zero
	txa
	beq Mul16x8_Zero
Mul16x8U_go:
	sep #$20
	sta.w WRMPYA
	sty.w WRMPYB
	stz.b r2+2
	xba
	sta.w WRMPYA
	ldx.w RDMPYL
	stx.b r2
	sty.w WRMPYB
	stz.b r2+3
	rep #$20
	lda.b r2+1
	clc
	adc.w RDMPYL
	sta.b r2+1
	ply
	rtl
