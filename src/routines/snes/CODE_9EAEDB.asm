; Unidentified routine.
CODE_9EAEDB:
	lda.b $C7
	cmp.w #$0010
	bne CODE_9EAEC8
CODE_9EAEE2:
	lda.b $14
	sta.b $A9
	rts
