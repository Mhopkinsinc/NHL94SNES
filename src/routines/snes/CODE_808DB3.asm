; Unidentified routine.
CODE_808DB3:
	stx.b $0C
	ldx.b $3C
CODE_808DB7:
	lda.b $0C
	sta.w $0101,x
	clc
	adc.b $18
	sta.b $0C
	lda.b $18
	sta.w $0104,x
	tya
	sta.w $0106,x
	clc
	adc.w #$0080
	tay
	sep #$20
	lda.b $0E
	sta.w $0103,x
	lda.b #$FB
	sta.w $0100,x
	rep #$20
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	dec.b $1A
	bne CODE_808DB7
	stx.b $3C
	rtl
