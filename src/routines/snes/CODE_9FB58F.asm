; Unidentified routine.
CODE_9FB58F:
	lda.b $95
	clc
	adc.b $A5
	tay
	lda.w temp1,y
	sec
	sbc.b $C1
	sta.w temp1,y
	bmi CODE_9FB5A3
	jmp.w $B517
