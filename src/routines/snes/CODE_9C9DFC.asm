; Unidentified routine.
CODE_9C9DFC:
	bvs CODE_9C9E55
CODE_9C9DFE:
	lda.b $A7
	sec
	sbc.w $1E3B
	bmi CODE_9C9E0B
	bvc CODE_9C9E0D
CODE_9C9E08:
	jmp.w $9E8E
