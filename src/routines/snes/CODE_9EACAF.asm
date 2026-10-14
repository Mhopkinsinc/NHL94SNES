; Unidentified routine.
CODE_9EACAF:
	lda.b $16
	sta.b d1
	lda.b tmp1
	and.w #$0008
	bne CODE_9EACD3
CODE_9EACBA:
	lda.b $10
	bpl .t1
	cmp.w #$FFCB
	bmi CODE_9EACD3
	lda.w #$FFCA
	sta.b d0
	rts

.t1:
	cmp.w #$0036
	bpl CODE_9EACD3
	lda.w #$0036
	sta.b d0
CODE_9EACD3:
	rts
