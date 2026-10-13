; Unidentified routine.
CODE_9C9E15:
	bvs CODE_9C9E81
CODE_9C9E17:
	lda.b $A5
	sec
	sbc.w $1E39
	beq CODE_9C9E27
	bmi CODE_9C9E25
	bvs CODE_9C9E27
	bra CODE_9C9E81
