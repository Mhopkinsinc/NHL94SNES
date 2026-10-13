; Unidentified routine.
CODE_8087EA:
	sta.b $16
	lda.w $0761
	bpl CODE_808820
	stx.w DAS1L
	cpy.w #$0000
	bmi CODE_8087FE
	sty.w VMADDL
	sty.b $14
CODE_8087FE:
	ldy.w #$0016
	sty.w A1T1L
	sep #$20
	lda.b #$09
	sta.w DMAP1
	lda.b #$18
	sta.w BBAD1
	stz.w A1B1
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	txa
	lsr a
	adc.b $14
	tay
	rtl
