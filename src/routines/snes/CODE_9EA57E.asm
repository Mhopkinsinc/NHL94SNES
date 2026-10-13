; Unidentified routine.
CODE_9EA57E:
	sec
	sbc.b $08
	sta.w Xvel,x
	bpl CODE_9EA589
CODE_9EA586:
	stz.w Xvel,x
CODE_9EA589:
	lda.w Yvel,x
	bpl CODE_9EA598
	clc
	adc.b $08
	sta.w Yvel,x
	bmi CODE_9EA5A3
	bra CODE_9EA5A0
