; Unidentified routine.
CODE_9B9320:
	lda.w #$0000
	sta.b $97
	lda.b $91
	beq CODE_9B932E
	lda.w #$1D1C
	bra CODE_9B9331
