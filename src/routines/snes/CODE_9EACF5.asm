; Unidentified routine.
CODE_9EACF5:
	lda.b $C7
	cmp.w #$0010
	bne CODE_9EACE2
CODE_9EACFC:
	lda.b $14
	sta.b $A9
	rts
