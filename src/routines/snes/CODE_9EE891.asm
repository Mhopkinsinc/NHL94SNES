; Unidentified routine.
CODE_9EE891:
	lda.w puckc
	bmi CODE_9EE89E
CODE_9EE896:
	cpx.w puckc
	beq CODE_9EE89E
	jmp.w $E77E
