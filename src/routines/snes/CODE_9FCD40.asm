; Unidentified routine.
CODE_9FCD40:
	lda.w #$0002
	ldy.w pfgoal,x
	bne CODE_9FCD69
	lda.w #$0001
	bra CODE_9FCD69
