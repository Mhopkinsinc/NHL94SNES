; Unidentified routine.
CODE_80C964:
	phx
	phy
	lda.b d1
	pha
	lda.b a1
	pha
	lda.w $178E
	sec
	sbc.w $1790
	bmi CODE_80C97A
	ldy.w #$0000
	bra CODE_80C97D
