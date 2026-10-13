; Unidentified routine.
CODE_9C8EDD:
	jsr.w $8F36
	lda.w $1DBD
	clc
	adc.w $1DC5
	cmp.w $1DA3
	bmi CODE_9C8EEF
	jmp.w $8E3A
