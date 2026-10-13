; Unidentified routine.
CODE_9EE463:
	cpx.w puckc
	bne CODE_9EE46D
	lda.w $19D4,x
	bmi CODE_9EE47E
CODE_9EE46D:
	jmp.w $8BE6
