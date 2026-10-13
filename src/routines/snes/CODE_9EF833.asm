; Unidentified routine.
CODE_9EF833:
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	lda.b $A5
	sec
	sbc.w pucky
	bmi CODE_9EF84D
	lda.b $A5
	sec
	sbc.w $0E9F
	bpl CODE_9EF829
	bra CODE_9EF855
