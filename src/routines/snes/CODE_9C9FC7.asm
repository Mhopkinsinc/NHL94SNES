; Unidentified routine.
CODE_9C9FC7:
	lda.b d0
	clc
	adc.b $08
	sta.b d0
	lda.b $A7
	adc.b $0A
	sta.b $A7
	rts
