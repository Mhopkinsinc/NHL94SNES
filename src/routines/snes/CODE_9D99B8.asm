; Unidentified routine.
CODE_9D99B8:
	lda.w #$0004
	sta.b $A5
	lda.l $7E3528,x
	sta.l $7E34C0
	bra CODE_9D99D1
