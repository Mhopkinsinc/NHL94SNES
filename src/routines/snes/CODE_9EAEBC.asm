; Unidentified routine.
CODE_9EAEBC:
	lda.b $C7
	cmp.w #$0010
	bne CODE_9EAEC8
CODE_9EAEC3:
	lda.b $16
	sta.b $A9
	rts
