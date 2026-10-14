; Unidentified routine.
CODE_9EACF5:
	lda.b tmp1
	cmp.w #$0010
	bne CODE_9EACE2
CODE_9EACFC:
	lda.b $14
	sta.b d1
	rts
