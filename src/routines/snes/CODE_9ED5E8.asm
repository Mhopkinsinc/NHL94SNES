; Unidentified routine.
CODE_9ED5E8:
	lda.w $0AA4,y
	cmp.w #$0008
	bne CODE_9ED5F3
	jmp.w CODE_9ED676
