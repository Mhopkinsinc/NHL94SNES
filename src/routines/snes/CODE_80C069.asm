; Unidentified routine.
CODE_80C069:
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sec
	sbc.w $0734
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$03
	cmp.b $73
	beq CODE_80C096
	bra CODE_80C0E8
