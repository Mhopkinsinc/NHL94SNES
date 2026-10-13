; Unidentified routine.
CODE_80C0C5:
	lsr a
	sec
	sbc.w $073C
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$07
	cmp.b $73
	beq CODE_80C096
	bra CODE_80C0E8
