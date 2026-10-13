; Unidentified routine.
CODE_9BA355:
	lda.l $7E33D0,x
	ora.l $7E33E4,x
	beq CODE_9BA3A8
	lda.l $7E3394,x
	clc
	adc.l $7E33D0,x
	sta.l $7E3394,x
	lda.l $7E33A8,x
	clc
	adc.l $7E33E4,x
	sta.l $7E33A8,x
	lda.l $7E33BC,x
	beq CODE_9BA3B1
	lda.l $7E33F8,x
	lsr a
	lsr a
	bit.w #$2000
	beq CODE_9BA38D
	ora.w #$C000
CODE_9BA38D:
	eor.w #$FFFF
	inc a
	clc
	adc.l $7E33BC,x
	bmi CODE_9BA3A9
	sta.l $7E33BC,x
	lda.l $7E33F8,x
	clc
	adc.w #$0006
	sta.l $7E33F8,x
CODE_9BA3A8:
	rtl
