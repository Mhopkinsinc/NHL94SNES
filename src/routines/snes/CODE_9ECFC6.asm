; Unidentified routine.
CODE_9ECFC6:
	lda.b d0
	sta.b $10
CODE_9ECFCA:
	lda.b d0
	bne CODE_9ECFD1
	jmp.w print
