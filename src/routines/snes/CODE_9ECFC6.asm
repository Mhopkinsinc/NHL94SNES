; Unidentified routine.
CODE_9ECFC6:
	lda.b d0
	sta.b $10
CODE_9ECFCA:
	lda.b d0
	bne .t1
	jmp.w print

.t1:
	lda.b [a1]
	clc
	adc.b a1
	sta.b a1
	dec.b d0
	bra CODE_9ECFCA
