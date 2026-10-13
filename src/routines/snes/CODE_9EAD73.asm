; Unidentified routine.
CODE_9EAD73:
	cpy.w #$002C
	bmi CODE_9EADAC
	lda.b $C7
	ora.w #$0004
	sta.b $C7
	bra CODE_9EADAC
