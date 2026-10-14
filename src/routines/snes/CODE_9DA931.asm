; Unidentified routine.
CODE_9DA931:
	bvs CODE_9DA938
CODE_9DA933:
	lda.b d4
	dec a
	sta.b d3
CODE_9DA938:
	lda.b d3
	sec
	sbc.b d4
	bmi CODE_9DA943
	bvc CODE_9DA945
	bra CODE_9DA920
