; Unidentified routine.
CODE_9EF7AD:
	lda.b d0
	sec
	sbc.w pucky
	bmi CODE_9EF7BF
	lda.b d0
	sec
	sbc.w $0E9F
	bpl CODE_9EF829
	bra CODE_9EF7C7
