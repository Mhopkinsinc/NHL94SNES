; Unidentified routine.
CODE_9EAEDB:
	lda.b tmp1
	cmp.w #$0010
	bne CODE_9EAEC8
CODE_9EAEE2:
	lda.b $14
	sta.b d1
	rts
