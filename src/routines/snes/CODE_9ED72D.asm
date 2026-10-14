; Unidentified routine.
CODE_9ED72D:
	lda.w $19D4,x
	bpl CODE_9ED70A
	stz.b d2
	stz.b d0
	lda.w Xpos,x
	cmp.w #$FFD3
	bmi .1
	cmp.w #$002D
	bpl .1
	lda.w #$0088
	sta.b d0
	lda.w Xpos,x
	bpl .1
	lda.w #$FF78
	sta.b d0
.1:
	jmp.w CODE_9EDA51
