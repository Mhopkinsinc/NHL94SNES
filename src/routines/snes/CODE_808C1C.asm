; Unidentified routine.
CODE_808C1C:
	lda.b $0C
	clc
	adc.w #$0006
	adc.b $24
	adc.b $08
	tax
	pla
	sta.b $24
	lda.b $1E
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w $079C
	ora.b $1C
	tay
	sep #$20
	lda.b $0E
	sta.w A1B1
	lda.b #$01
	sta.w DMAP1
	lda.b #$18
	sta.w BBAD1
	rep #$20
CODE_808C4A:
	lda.b $18
	clc
	adc.b $1C
	cmp.w #$0021
	bcs CODE_808C88
	lda.b $18
	asl a
	sta.w DAS1L
	stx.w A1T1L
	sty.w VMADDL
CODE_808C60:
	sep #$20
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	txa
	clc
	adc.b $24
	tax
	tya
	clc
	adc.w #$0020
	tay
	inc.b $1E
	lda.b $1E
	cmp.w #$0020
	bne CODE_808C83
	tya
	clc
	adc.w $079E
	tay
CODE_808C83:
	dec.b $1A
	bne CODE_808C4A
	rtl
