; Unidentified routine.
CODE_9EA57E:
	sec
	sbc.b $08
	sta.w $0EC3,x
	bpl CODE_9EA589
CODE_9EA586:
	stz.w $0EC3,x
CODE_9EA589:
	lda.w $0EE3,x
	bpl CODE_9EA598
	clc
	adc.b $08
	sta.w $0EE3,x
	bmi CODE_9EA5A3
	bra CODE_9EA5A0
