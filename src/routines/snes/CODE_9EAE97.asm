; Unidentified routine.
CODE_9EAE97:
	lda.b $16
	sta.b d1
	lda.b tmp1
	and.w #$0008
	bne CODE_9EAEBB
CODE_9EAEA2:
	lda.b $10
	bpl .t1
	cmp.w #$FFDB
	bmi CODE_9EAEBB
	lda.w #$FFDA
	sta.b d0
	rts

.t1:
	cmp.w #$0026
	bpl CODE_9EAEBB
	lda.w #$0026
	sta.b d0
CODE_9EAEBB:
	rts
