; Unidentified routine.
CODE_9FEB5C:
	sta.b tmp0
	lda.w tmdata,y
	sta.b a4
	lda.w #$009C
	sta.b $9B
	ldy.w #$0000
	lda.b [a4],y
	clc
	adc.b a4
	sta.b a4
CODE_9FEB72:
	dec.b tmp0
	bmi CODE_9FEB82
	lda.b [a4]
	clc
	adc.b a4
	adc.w #$0008
	sta.b a4
	bra CODE_9FEB72
