; Unidentified routine.
CODE_9EAE97:
	lda.b $16
	sta.b $A9
	lda.b $C7
	and.w #$0008
	bne CODE_9EAEBB
CODE_9EAEA2:
	lda.b $10
	bpl CODE_9EAEB1
	cmp.w #$FFDB
	bmi CODE_9EAEBB
	lda.w #$FFDA
	sta.b $A5
	rts
