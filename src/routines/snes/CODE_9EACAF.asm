; Unidentified routine.
CODE_9EACAF:
	lda.b $16
	sta.b $A9
	lda.b $C7
	and.w #$0008
	bne CODE_9EACD3
CODE_9EACBA:
	lda.b $10
	bpl CODE_9EACC9
	cmp.w #$FFCB
	bmi CODE_9EACD3
	lda.w #$FFCA
	sta.b $A5
	rts
