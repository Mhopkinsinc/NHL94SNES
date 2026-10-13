; Unidentified routine.
CODE_80899B:
	lda.w $0761
	bpl CODE_8089C7
	stx.w DAS1L
	lda.b $0C
	sta.w A1T1L
	lda.w #$1900
	sta.w DMAP1
	sty.w VMADDL
	sty.b $14
	sep #$20
	lda.b $0E
	sta.w A1B1
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	txa
	lsr a
	adc.b $14
	tay
	rtl
