; Unidentified routine.
CODE_9EA8EE:
	lda.b $A9
	pha
	lda.b $A5
	pha
	sta.b $AD
	cpx.w puckc
	bne CODE_9EA8FE
	jmp.w $A9AD
