; Unidentified routine.
CODE_9EACD6:
	lda.b $C7
	cmp.w #$0010
	bne CODE_9EACE2
CODE_9EACDD:
	lda.b $16
	sta.b $A9
	rts
