; Unidentified routine.
CODE_9EAD73:
	cpy.w #$002C
	bmi CODE_9EADAC
	lda.b tmp1
	ora.w #$0004
	sta.b tmp1
	bra CODE_9EADAC
