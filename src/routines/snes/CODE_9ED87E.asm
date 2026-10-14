; Unidentified routine.
CODE_9ED87E:
	lda.b [$89]
	cmp.w #$FFE7
	bmi CODE_9ED8A1
	cmp.w #$0019
	bpl CODE_9ED8A1
	lda.b [$89],y
	cmp.w #$0013
	bcs CODE_9ED89E
	lda.w pucky
	cmp.w #$FEF7
	bmi CODE_9ED89E
	cmp.w #$0109
	bmi CODE_9ED8A4
CODE_9ED89E:
	jmp.w CODE_9EDA2C
