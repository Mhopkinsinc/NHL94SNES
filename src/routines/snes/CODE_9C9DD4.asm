; Unidentified routine.
CODE_9C9DD4:
	bvs CODE_9C9E29
CODE_9C9DD6:
	lda.b $A7
	sec
	sbc.w $1E37
	bmi CODE_9C9DE2
	bvc CODE_9C9DE4
	bra CODE_9C9DFE
