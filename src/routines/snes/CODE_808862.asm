; Unidentified routine.
CODE_808862:
	sta.b $16
	lda.w $0761
	bpl CODE_8088BA
	txa
	pha
	sta.w DAS1L
	sty.w VMADDL
	sty.b $14
	ldy.w #$0016
	sty.w A1T1L
	lda.w #$1808
	sta.w DMAP1
	sep #$20
	stz.w VMAIN
	stz.w A1B1
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	pla
	sta.w DAS1L
	clc
	adc.b $14
	pha
	ldy.b $14
	sty.w VMADDL
	ldy.w #$0017
	sty.w A1T1L
	lda.w #$1908
	sta.w DMAP1
	sep #$20
	lda.b #$80
	sta.w VMAIN
	stz.w A1B1
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	ply
	rtl
