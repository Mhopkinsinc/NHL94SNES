; Unidentified routine.
CODE_9EAE8A:
	lda.b $C7
	bit.w #$0002
	bne CODE_9EAEBB
CODE_9EAE91:
	lda.b $16
	sta.b $A9
	bra CODE_9EAEA2
