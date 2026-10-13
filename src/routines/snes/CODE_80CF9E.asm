; Unidentified routine.
CODE_80CF9E:
	lda.w $0D47
	dec a
	bmi CODE_80CF48
	sta.w $0D47
	jsl.l CODE_80D004
	jmp.w CODE_80CF48
