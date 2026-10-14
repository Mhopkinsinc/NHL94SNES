; Unidentified routine.
CODE_9C9E0B:
	bvc CODE_9C9E08
CODE_9C9E0D:
	beq CODE_9C9E17
	bmi .t1
	bvs CODE_9C9E17
	bra CODE_9C9E81

.t1:
	bvs CODE_9C9E81
CODE_9C9E17:
	lda.b d0
	sec
	sbc.w $1E39
	beq CODE_9C9E27
	bmi .t1
	bvs CODE_9C9E27
	bra CODE_9C9E81

.t1:
	bvs CODE_9C9E81
CODE_9C9E27:
	bra CODE_9C9E8E
