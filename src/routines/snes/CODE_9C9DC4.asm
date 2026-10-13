; Unidentified routine.
CODE_9C9DC4:
	bvs CODE_9C9E29
CODE_9C9DC6:
	lda.b $A5
	sec
	sbc.w $1E31
	beq CODE_9C9DD6
	bmi CODE_9C9DD4
	bvs CODE_9C9DD6
	bra CODE_9C9E29
