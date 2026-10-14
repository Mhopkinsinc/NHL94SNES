; Unidentified routine.
CODE_9C8EDD:
	jsr.w CODE_9C8F36
	lda.w $1DBD
	clc
	adc.w $1DC5
	cmp.w $1DA3
	bmi CODE_9C8EEF
	jmp.w CODE_9C8E3A
