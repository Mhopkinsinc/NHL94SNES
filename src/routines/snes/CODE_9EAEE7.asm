; Unidentified routine.
CODE_9EAEE7:
	lda.b $14
	sta.b $A9
	lda.b $C7
	and.w #$0002
	bne CODE_9EAEA2
	rts
