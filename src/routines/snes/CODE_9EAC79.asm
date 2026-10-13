; Unidentified routine.
CODE_9EAC79:
	lda.b $12
	cmp.w #$FEF8
	bpl CODE_9EAC91
	lda.b $22
	sta.b $A9
	ldy.b $20
	bmi CODE_9EACBA
	lda.b $0C
	cmp.w Xpos,y
	bmi CODE_9EAC5A
	bra CODE_9EACE2
