; Unidentified routine.
CODE_9C9DEC:
	bvs CODE_9C9E55
CODE_9C9DEE:
	lda.b d0
	sec
	sbc.w $1E35
	beq CODE_9C9DFE
	bmi CODE_9C9DFC
	bvs CODE_9C9DFE
	bra CODE_9C9E55
