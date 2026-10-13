; Unidentified routine.
CODE_9F9F20:
	lda.w #$0003
	sta.l $7E3568,x
	lda.l $7E3598,x
	ora.w #$0002
	sta.l $7E3598,x
	bra CODE_9F9F77
