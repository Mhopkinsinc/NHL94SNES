; Unidentified routine.
CODE_9ED92A:
	lda.w puckvy
	cmp.w #$0800
	bpl CODE_9ED93F
	cmp.w #$F800
	bmi CODE_9ED93F
	lda.w #$0008
	sta.b $A5
	jmp.w $DA04
