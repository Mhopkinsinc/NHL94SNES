; Unidentified routine.
CODE_9ED640:
	lda.w $1063,x
	bne CODE_9ED673
	lda.w $0B1D,x
	cmp.w #$002D
	bcs CODE_9ED6AE
	lda.w pucky
	cmp.w #$FEF7
	bmi CODE_9ED6AE
	cmp.w #$0109
	bpl CODE_9ED6AE
	lda.b a2
	eor.w #$0002
	tay
	lda.w $17AE,y
	cmp.w #$003C
	bcs CODE_9ED6AE
	jsl.l RandomWord
	cmp.w #$0800
	bcs CODE_9ED6AE
	bra CODE_9ED676
