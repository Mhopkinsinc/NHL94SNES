; Unidentified routine.
CODE_9B8FD5:
	lda.b $8D
	clc
	adc.b [$8D]
	adc.w #$0004
	sta.b $8D
CODE_9B8FDF:
	lda.b [$8D]
	bmi CODE_9B8FE7
	dec.b $A5
	bpl CODE_9B8FD5
CODE_9B8FE7:
	lda.b [$8D]
	bpl CODE_9B8FF0
	dec.w $0D47
	bra CODE_9B8FB5
