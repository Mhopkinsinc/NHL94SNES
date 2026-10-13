; Unidentified routine.
CODE_9EAD01:
	lda.b $14
	sta.b $A9
	lda.b $C7
	and.w #$0002
	bne CODE_9EACBA
	rts
