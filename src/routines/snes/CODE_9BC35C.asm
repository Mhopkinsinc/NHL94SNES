; Unidentified routine.
CODE_9BC35C:
	jsr.w $C4F3
	lda.w #$0006
	sta.w $1DC5
	jsl.l CODE_9BC44B
	lda.w #$0005
	sta.w $1DC5
	lda.w $1DBD
	clc
	adc.w #$0005
	clc
	adc.w $1DE9
	cmp.w $1DC1
	bmi CODE_9BC382
	jmp.w $C2E4
