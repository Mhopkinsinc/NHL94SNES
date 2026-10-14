; Unidentified routine.
CODE_9DD992:
	lda.w #$007E
	sta.b $12
	lda.w #$3FF4
	sta.b $10
	lda.l $7E35D0
	clc
	adc.l $7E35AC
	ldx.w #$0800
	jsl.l MemFill
	rtl
