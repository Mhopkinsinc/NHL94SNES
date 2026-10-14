; Unidentified routine.
CODE_9EAF4E:
	cpy.b $16
	bmi CODE_9EAF7D
	lda.w #$0002
	sta.b tmp1
	bra CODE_9EAF7D
