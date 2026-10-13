; Unidentified routine.
CODE_9ED72D:
	lda.w $19D4,x
	bpl CODE_9ED70A
	stz.b $AD
	stz.b $A5
	lda.w Xpos,x
	cmp.w #$FFD3
	bmi CODE_9ED752
	cmp.w #$002D
	bpl CODE_9ED752
	lda.w #$0088
	sta.b $A5
	lda.w Xpos,x
	bpl CODE_9ED752
	lda.w #$FF78
	sta.b $A5
CODE_9ED752:
	jmp.w $DA51
