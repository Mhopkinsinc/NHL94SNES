; Unidentified routine.
CODE_80C964:
	phx
	phy
	lda.b $A9
	pha
	lda.b $8D
	pha
	lda.w tmscore
	sec
	sbc.w $1790
	bmi CODE_80C97A
	ldy.w #$0000
	bra CODE_80C97D
