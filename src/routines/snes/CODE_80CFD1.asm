; Unidentified routine.
CODE_80CFD1:
	lda.w $1DA7
	sec
	sbc.w $1DAB
	clc
	adc.w #$0009
	cmp.w $1DA3
	bmi CODE_80CFE4
	jmp.w CODE_80CF48
