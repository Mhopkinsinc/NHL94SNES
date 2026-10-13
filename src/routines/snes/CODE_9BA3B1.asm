; Unidentified routine.
CODE_9BA3B1:
	lda.w #$0000
	sta.l $7E33F8,x
	sta.l $7E33BC,x
	lda.w #$03E8
	sta.l $7E3420,x
	lda.l $7E33D0,x
	cmp.w #$0010
	bcc CODE_9BA408
	cmp.w #$FFF0
	bcs CODE_9BA408
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq CODE_9BA3DD
	ora.w #$F000
CODE_9BA3DD:
	eor.w #$FFFF
	inc a
	clc
	adc.l $7E33D0,x
	sta.l $7E33D0,x
	lda.l $7E33E4,x
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq CODE_9BA3FA
	ora.w #$F000
CODE_9BA3FA:
	eor.w #$FFFF
	inc a
	clc
	adc.l $7E33E4,x
	sta.l $7E33E4,x
	rtl
