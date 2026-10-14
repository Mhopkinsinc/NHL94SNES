; Unidentified routine.
CODE_9EACAF:
	lda.b $16
	sta.b d1
	lda.b tmp1
	and.w #$0008
	bne CODE_9EACD3
CODE_9EACBA:
	lda.b $10
	bpl CODE_9EACC9
	cmp.w #$FFCB
	bmi CODE_9EACD3
	lda.w #$FFCA
	sta.b d0
	rts
