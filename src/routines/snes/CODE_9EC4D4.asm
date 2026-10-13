; Unidentified routine.
CODE_9EC4D4:
	lda.b $A9
	cmp.w pucky
	bmi CODE_9EC479
CODE_9EC4DB:
	ldy.b $89
	lda.w position,y
	bmi CODE_9EC4E9
	lda.b $A9
	cmp.w Ypos,y
	bmi CODE_9EC4BC
CODE_9EC4E9:
	inc.b $89
	inc.b $89
	dec.b $A5
	bpl CODE_9EC4DB
	bra CODE_9EC479
