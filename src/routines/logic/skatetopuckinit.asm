; Unidentified routine.
skatetopuckinit:
	lda.w puckvx
	xba
	lsr a
	and.w #$007F
	bit.w #$0040
	beq CODE_9EDEB7
	ora.w #$FF80
CODE_9EDEB7:
	clc
	adc.w puckx
	sta.b $A5
	lda.w puckvy
	xba
	lsr a
	and.w #$007F
	bit.w #$0040
	beq CODE_9EDECD
	ora.w #$FF80
CODE_9EDECD:
	clc
	adc.w pucky
	sta.b $A9
	rtl
