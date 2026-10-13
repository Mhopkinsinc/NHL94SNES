; Unidentified routine.
CODE_9EE891:
	lda.w $0AD9
	bmi CODE_9EE89E
CODE_9EE896:
	cpx.w $0AD9
	beq CODE_9EE89E
	jmp.w $E77E
