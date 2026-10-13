; Unidentified routine.
CODE_9ECFC6:
	lda.b $A5
	sta.b $10
CODE_9ECFCA:
	lda.b $A5
	bne CODE_9ECFD1
	jmp.w $C7BE
