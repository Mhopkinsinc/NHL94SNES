; Unidentified routine.
CODE_9EAD68:
	cpy.b $16
	bmi CODE_9EAD97
	lda.w #$0002
	sta.b $C7
	bra CODE_9EAD97
