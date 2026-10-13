; Unidentified routine.
addteamstat:
	ldy.b $A9
	lda.w pfteam,x
	beq CODE_9FC97E
	iny
	iny
CODE_9FC97E:
	lda.w $0000,y
	clc
	adc.b $A5
	sta.w $0000,y
	rtl
