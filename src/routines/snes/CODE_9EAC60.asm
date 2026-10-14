; Unidentified routine.
CODE_9EAC60:
	lda.b $0E
	cmp.w #$FEF8
	bpl CODE_9EAC79
CODE_9EAC67:
	lda.b $0C
	cmp.w #$FFCB
	bmi CODE_9EAC5A
	cmp.w #$0036
	bpl CODE_9EACE2
	lda.b $14
	sta.b d1
	bra CODE_9EACBA
