; Unidentified routine.
CODE_9EAEBC:
	lda.b tmp1
	cmp.w #$0010
	bne CODE_9EAEC8
CODE_9EAEC3:
	lda.b $16
	sta.b d1
	rts
