; Unidentified routine.
CODE_808D72:
	sep #$20
	lda.b $0E
	sta.w A1B1
	stz.w DMAP1
	stz.w VMAIN
	lda.b #$18
	sta.w BBAD1
	rep #$20
.loop:
	lda.b $18
	sta.w DAS1L
	stx.w A1T1L
	sty.w VMADDL
	sep #$20
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	txa
	clc
	adc.b $18
	tax
	tya
	clc
	adc.w #$0080
	tay
	dec.b $1A
	bne .loop
	sep #$20
	lda.b #$80
	sta.w VMAIN
	rep #$20
	rtl
