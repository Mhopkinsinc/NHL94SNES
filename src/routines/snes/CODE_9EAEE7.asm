; Unidentified routine.
CODE_9EAEE7:
	lda.b $14
	sta.b d1
	lda.b tmp1
	and.w #$0002
	bne CODE_9EAEA2
	rts
