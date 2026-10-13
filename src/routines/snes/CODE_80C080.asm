; Unidentified routine.
CODE_80C080:
	lsr a
	lsr a
	lsr a
	lsr a
	sec
	sbc.w $0736
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$04
	cmp.b $73
	beq CODE_80C096
	bra CODE_80C0E8
