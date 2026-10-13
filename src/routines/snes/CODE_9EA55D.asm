; Unidentified routine.
CODE_9EA55D:
	phx
	lda.w #$0070
	clc
	adc.w $12E3,x
	ldx.w $0ADB
	jsl.l CODE_808F4C
	sta.b $08
	plx
	lda.w $0EC3,x
	bpl CODE_9EA57E
	clc
	adc.b $08
	sta.w $0EC3,x
	bmi CODE_9EA589
	bra CODE_9EA586
