; A * X into $08-$0B, unsigned
Mul16U:
	phy
	tay
	beq Mul16_Zero
	sta.b $00
	txa
	beq Mul16_Zero
Mul16U_Go:
	sep #$20
	sta.w WRMPYA
	sty.w WRMPYB
	stz.b $08
	xba
	sta.w WRMPYA
	ldx.w RDMPYL
	stx.b $04
	sty.w WRMPYB
	stz.b $0B
	ldy.b $01
	ldx.w RDMPYL
	stx.b $09
	sty.w WRMPYB
	xba
	sta.w WRMPYA
	ldx.w RDMPYL
	stx.b $06
	sty.w WRMPYB
	rep #$20
	lda.b $09
	clc
	adc.w RDMPYL
	sta.b $09
	bcc .nocarry
	inc.b $0B
.nocarry:
	lda.b $04
	clc
	adc.b $08
	sta.b $08
	lda.b $06
	adc.b $0A
	sta.b $0A
	ply
	rtl
