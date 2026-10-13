; Unidentified routine.
CODE_9E85F6:
	lda.w #$0058
	sec
	sbc.w pucky
	bmi CODE_9E860B
	lda.b $A9
	clc
	adc.w pucky
	pha
	asl a
	pla
	ror a
	sta.b $A9
CODE_9E860B:
	lda.w #$009E
	sta.b $8B
	lda.w #rtss
	sta.b $89
	jmp.w $A5A4
