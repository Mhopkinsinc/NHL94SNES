; Unidentified routine.
CODE_9ED325:
	lda.b $8D
	clc
	adc.b [$8D]
	sta.b $8D
CODE_9ED32C:
	dec.b $A5
	bpl CODE_9ED325
	rtl
