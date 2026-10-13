; Unidentified routine.
CODE_9FC748:
	lda.b $89
	clc
	adc.b [$89]
	adc.w #$0008
	sta.b $89
CODE_9FC752:
	dec.b $A5
	bpl CODE_9FC748
	rtl
