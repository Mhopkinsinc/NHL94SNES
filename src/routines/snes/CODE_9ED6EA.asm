; Unidentified routine.
CODE_9ED6EA:
	lda.w $19D4,x
	bpl CODE_9ED6FD
	lda.w pfgoal,x
	eor.w #$0001
	asl a
	asl a
	sta.b d0
	jsl.l CODE_9EDC06
CODE_9ED6FD:
	lda.w Ypos,x
	cmp.w #$FEFB
	bmi CODE_9ED72D
	cmp.w #$0105
	bpl CODE_9ED72D
CODE_9ED70A:
	lda.w $0D71
	sta.b d0
	lda.w pucky
	sta.b d1
	jsl.l CODE_9EDBC0
	lda.b d1
	cmp.w #$FFD2
	bmi CODE_9ED755
	cmp.w #$002E
	bpl CODE_9ED755
	lda.b d1
	pha
	lda.b d0
	pha
	jmp.w CODE_9ED7F1
