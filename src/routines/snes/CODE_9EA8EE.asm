; Unidentified routine.
CODE_9EA8EE:
	lda.b d1
	pha
	lda.b d0
	pha
	sta.b d2
	cpx.w $0AD9
	bne CODE_9EA8FE
	jmp.w CODE_9EA9AD
