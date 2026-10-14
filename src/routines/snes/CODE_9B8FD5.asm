; Unidentified routine.
CODE_9B8FD5:
	lda.b a1
	clc
	adc.b [a1]
	adc.w #$0004
	sta.b a1
CODE_9B8FDF:
	lda.b [a1]
	bmi CODE_9B8FE7
	dec.b d0
	bpl CODE_9B8FD5
CODE_9B8FE7:
	lda.b [a1]
	bpl CODE_9B8FF0
	dec.w $0D47
	bra CODE_9B8FB5
