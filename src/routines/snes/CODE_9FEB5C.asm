; Unidentified routine.
CODE_9FEB5C:
	sta.b $C5
	lda.w tmdata,y
	sta.b $99
	lda.w #$009C
	sta.b $9B
	ldy.w #$0000
	lda.b [$99],y
	clc
	adc.b $99
	sta.b $99
CODE_9FEB72:
	dec.b $C5
	bmi CODE_9FEB82
	lda.b [$99]
	clc
	adc.b $99
	adc.w #$0008
	sta.b $99
	bra CODE_9FEB72
