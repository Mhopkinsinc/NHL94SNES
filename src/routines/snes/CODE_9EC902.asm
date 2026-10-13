; Unidentified routine.
CODE_9EC902:
	dex
	bmi CODE_9EC901
	lda.w #$0020
	clc
	adc.b $26
	sta.b [$10],y
	iny
	iny
	inc.b $0C
	bra CODE_9EC902
