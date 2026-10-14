; Unidentified routine.
CODE_9EC4D4:
	lda.b d1
	cmp.w pucky
	bmi CODE_9EC479
.loop:
	ldy.b a0
	lda.w position,y
	bmi .1
	lda.b d1
	cmp.w Ypos,y
	bmi CODE_9EC4BC
.1:
	inc.b a0
	inc.b a0
	dec.b d0
	bpl .loop
	bra CODE_9EC479
