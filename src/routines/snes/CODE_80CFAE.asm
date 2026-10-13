; Unidentified routine.
CODE_80CFAE:
	lda.w $1D9B
	dec a
	bmi CODE_80CFD1
	sta.w $1D9B
	jsl.l CODE_80D004
	jmp.w CODE_80CF48
