; Unidentified routine.
CODE_9EA5A4:
	lda.w $1023,x
	sec
	sbc.w $0ADB
	sta.w $1023,x
	bmi CODE_9EA5B3
	jmp.w $A694
