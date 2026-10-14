; Unidentified routine.
CODE_9EAC2F:
	lda.b $12
	cmp.w #$FEF8
	bmi CODE_9EAC54
	ldy.b $20
	bmi CODE_9EAC49
	lda.b $0C
	cmp.b $10
	bmi CODE_9EAC4A
	cmp.w Xpos,y
	bmi CODE_9EAC49
	lda.b $16
	sta.b d1
CODE_9EAC49:
	rts
