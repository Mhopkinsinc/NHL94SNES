; Unidentified routine.
CODE_9FA626:
	lda.w gmclock
	ora.w gameclock
	bne CODE_9FA635
	jsl.l CODE_9FBA97
	jmp.w $8B79
