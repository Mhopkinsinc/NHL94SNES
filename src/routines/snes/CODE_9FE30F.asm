; Unidentified routine.
CODE_9FE30F:
	lda.w #$0001
	sta.l $7E346A
	jsl.l CODE_9B869B
	lda.w #$0000
	sta.l $7E346A
	jsl.l CODE_9FE79F
	bra CODE_9FE2AE
