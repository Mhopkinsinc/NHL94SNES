; Unidentified routine.
CODE_9ECBDD:
	ldx.b $A5
	sta.b $A5
	lda.w #$0002
	sta.b $91
	bra CODE_9ECBE8
