; Unidentified routine.
CODE_9BCD1C:
	jsl.l CODE_9CA41B
	lda.b $C1
	clc
	adc.b $A5
	sta.b $C1
	rtl
