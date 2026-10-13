; Unidentified routine.
CODE_9EC72D:
	lda.w $1E9B
	bne CODE_9EC790
	lda.w $1E8D
	cmp.w #$000C
	bmi CODE_9EC745
	lda.w #$0002
	sta.w $1E91
	inc.w $17CC
	bra CODE_9EC74B
