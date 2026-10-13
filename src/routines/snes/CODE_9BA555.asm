; Unidentified routine.
CODE_9BA555:
	lda.w $1DB9
	inc a
	cmp.w #$0003
	bcs CODE_9BA522
	sta.w $1DB9
	bra CODE_9BA4FE
