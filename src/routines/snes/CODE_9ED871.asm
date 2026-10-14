; Unidentified routine.
CODE_9ED871:
	ldy.w #$0002
	lda.b [$89],y
	cmp.w #$0023
	bcc CODE_9ED87E
	jmp.w CODE_9EDA51
