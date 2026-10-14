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
