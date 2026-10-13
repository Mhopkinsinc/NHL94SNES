; Unidentified routine.
CODE_9E9E78:
	lda.l $7E35E0
	clc
	adc.w #$0258
	sta.l $7E35E0
	lda.w #$002D
	sta.b $81
	rtl
