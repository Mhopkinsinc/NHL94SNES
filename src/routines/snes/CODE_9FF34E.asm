; Unidentified routine.
CODE_9FF34E:
	lda.b [$8D]
	dec a
	dec a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0010
	sta.w printx
	rtl
