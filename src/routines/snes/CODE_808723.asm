; Unidentified routine.
CODE_808723:
	sep #$20
	lda.w $0762
	bpl CODE_808751
	tya
	sta.w CGADD
	rep #$20
	txa
	sep #$10
	asl a
	beq CODE_80874E
	sta.w DAS1L
	lda.w #DMA_CGRAM
	sta.w DMAP1
	lda.b $0C
	sta.w A1T1L
	ldx.b $0E
	stx.w A1B1
	ldx.b #$02
	stx.w MDMAEN
CODE_80874E:
	rep #$30
	rtl
