; Unidentified routine.
CODE_808A11:
	sta.b $16
	lda.w $0761
	bmi CODE_808A1B
CODE_808A18:
	jmp.w CODE_808A11
