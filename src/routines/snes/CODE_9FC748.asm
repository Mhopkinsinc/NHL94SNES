; Unidentified routine.
CODE_9FC748:
	lda.b a0
	clc
	adc.b [a0]
	adc.w #$0008
	sta.b a0
CODE_9FC752:
	dec.b d0
	bpl CODE_9FC748
	rtl
