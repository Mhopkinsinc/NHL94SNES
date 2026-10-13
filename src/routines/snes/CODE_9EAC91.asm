; Unidentified routine.
CODE_9EAC91:
	ldy.b $20
	bmi CODE_9EACD3
CODE_9EAC95:
	lda.b $10
	sec
	sbc.w Xpos,y
	pha
	lda.b $0C
	sec
	sbc.b $10
	eor.b $01,s
	bpl CODE_9EACD4
	pla
	lda.b $0C
	cmp.w Xpos,y
	bpl CODE_9EACE2
	bra CODE_9EAD14
