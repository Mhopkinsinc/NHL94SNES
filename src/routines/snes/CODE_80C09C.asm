; Unidentified routine.
CODE_80C09C:
	lsr a
	lsr a
	lsr a
	sec
	sbc.w $0738
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$05
	cmp.b $73
	beq CODE_80C096
	bra CODE_80C0E8
