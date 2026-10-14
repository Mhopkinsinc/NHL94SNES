; Unidentified routine.
CODE_9EAD01:
	lda.b $14
	sta.b d1
	lda.b tmp1
	and.w #$0002
	bne CODE_9EACBA
	rts
