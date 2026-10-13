; Unidentified routine.
CODE_9DA931:
	bvs CODE_9DA938
CODE_9DA933:
	lda.b $B5
	dec a
	sta.b $B1
CODE_9DA938:
	lda.b $B1
	sec
	sbc.b $B5
	bmi CODE_9DA943
	bvc CODE_9DA945
	bra CODE_9DA920
