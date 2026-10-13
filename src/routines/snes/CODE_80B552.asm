; Unidentified routine.
CODE_80B552:
	lda.b $2A
	cmp.b $14
	bcs CODE_80B56E
	lda.w $2F40,x
CODE_80B55B:
	and.b #$3F
	sta.b $2A
	txa
	clc
	adc.b $2A
	bra CODE_80B530
