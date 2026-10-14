; Unidentified routine.
CODE_9FB58F:
	lda.b a3
	clc
	adc.b d0
	tay
	lda.w $1003,y
	sec
	sbc.b d7
	sta.w $1003,y
	bmi CODE_9FB5A3
	jmp.w CODE_9FB517
