; Unidentified routine.
CODE_80C0B1:
	lsr a
	lsr a
	sec
	sbc.w $073A
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$06
	cmp.b $73
	beq CODE_80C096
	bra CODE_80C0E8
