; Unidentified routine.
CODE_9ED325:
	lda.b a1
	clc
	adc.b [a1]
	sta.b a1
CODE_9ED32C:
	dec.b d0
	bpl CODE_9ED325
	rtl
