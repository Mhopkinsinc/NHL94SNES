; Unidentified routine.
CODE_9EACC9:
	cmp.w #$0036
	bpl CODE_9EACD3
	lda.w #$0036
	sta.b $A5
CODE_9EACD3:
	rts
