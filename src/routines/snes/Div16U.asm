; Unidentified routine.
Div16U:		; $08 / $04 into $00, unsigned
	sep #$20
Div16U_Go:
	lda.b $05
	beq Div16x8U_Go
	stz.b $0A
	lda.b $09
	cmp.b $05
	bcs Div_8Bits
	rep #$20
	stz.b $00
	rtl
