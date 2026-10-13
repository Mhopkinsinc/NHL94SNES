; Unidentified routine.
CODE_80CFEE:
	lda.w $1DA7
	dec a
	cmp.w $1DAB
	bpl CODE_80CFFA
	jmp.w CODE_80CF48
