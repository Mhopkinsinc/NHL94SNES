; Unidentified routine.
CODE_9ED6AE:
	lda.w pfgoal,x
	bne CODE_9ED6C9
	lda.w #$0000
	sta.b $8B
	lda.w #$0D17
	sta.b a0
	lda.w #$0104
	sta.b d3
	lda.w #$0108
	sta.b d4
	bra CODE_9ED6D8
