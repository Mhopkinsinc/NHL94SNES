; Unidentified routine.
CODE_9EC4D4:
	lda.b d1
	cmp.w pucky
	bmi CODE_9EC479
CODE_9EC4DB:
	ldy.b a0
	lda.w position,y
	bmi CODE_9EC4E9
	lda.b d1
	cmp.w Ypos,y
	bmi CODE_9EC4BC
CODE_9EC4E9:
	inc.b a0
	inc.b a0
	dec.b d0
	bpl CODE_9EC4DB
	bra CODE_9EC479
