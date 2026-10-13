; Unidentified routine.
CODE_808E1C:
	dex
	bmi CODE_808E1B
	lda.w #$0020
	clc
	adc.b $26
	sta.b [$10],y
	iny
	iny
	inc.b $0C
	bra CODE_808E1C
