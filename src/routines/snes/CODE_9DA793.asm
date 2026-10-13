; Unidentified routine.
CODE_9DA793:
	jsr.w $AA83
	jsl.l CODE_9FBF75
	dec.b $BD
	dec.b $BD
	bmi CODE_9DA7A3
	jmp.w $A704
