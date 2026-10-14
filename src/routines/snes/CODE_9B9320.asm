; Unidentified routine.
CODE_9B9320:
	lda.w #$0000
	sta.b $97
	lda.b a2
	beq .t1
	lda.w #$1D1C
	bra CODE_9B9331

.t1:
	lda.w #$1CE4
CODE_9B9331:
	sta.b a3
	rtl
