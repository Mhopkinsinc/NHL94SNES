; Unidentified routine.
CODE_9FF863:
	lda.b $83
	clc
	adc.w #$001E
	sta.b $BF
	lda.w #$0002
	sta.b $B7
	lda.w #$0008
	sta.b $B9
	jmp.w CODE_9FF898
