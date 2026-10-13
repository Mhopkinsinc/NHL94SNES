; Unidentified routine.
CODE_9D9F28:
	lda.b $8D
	clc
	adc.b [$8D]
	adc.w #$0004
	sta.b $8D
CODE_9D9F32:
	lda.b [$8D]
	bmi CODE_9D9F3A
	dec.b $A5
	bpl CODE_9D9F28
CODE_9D9F3A:
	lda.b [$8D]
	bpl CODE_9D9F43
	dec.w $0D47
	bra CODE_9D9F08
