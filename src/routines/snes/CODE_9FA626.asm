; Unidentified routine.
CODE_9FA626:
	lda.w $15D6
	ora.w gameclock
	bne CODE_9FA635
	jsl.l CODE_9FBA97
	jmp.w CODE_9F8B79
