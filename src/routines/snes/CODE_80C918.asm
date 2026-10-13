; Unidentified routine.
CODE_80C918:
	lda.w shootoutround
CODE_80C91B:
	cmp.w #$0006
	bmi CODE_80C926
	sec
	sbc.w #$0005
	bra CODE_80C91B
