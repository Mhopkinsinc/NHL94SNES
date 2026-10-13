; Unidentified routine.
CODE_9F954B:
	lda.l $7E35D4
	sec
	sbc.w #$0003
	bmi CODE_9F9559
	bvs CODE_9F955B
	bra CODE_9F95C2
