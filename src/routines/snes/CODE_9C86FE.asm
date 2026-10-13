; Unidentified routine.
CODE_9C86FE:
	jsl.l CODE_9C8858
	lda.w $1DB9
	clc
	adc.w $1DC5
	dec a
	cmp.w $1DC1
	bmi CODE_9C8712
	jmp.w CODE_808684
