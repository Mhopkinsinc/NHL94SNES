; Unidentified routine.
CODE_9D9F28:
	lda.b a1
	clc
	adc.b [a1]
	adc.w #$0004
	sta.b a1
CODE_9D9F32:
	lda.b [a1]
	bmi CODE_9D9F3A
	dec.b d0
	bpl CODE_9D9F28
CODE_9D9F3A:
	lda.b [a1]
	bpl CODE_9D9F43
	dec.w $0D47
	bra CODE_9D9F08
