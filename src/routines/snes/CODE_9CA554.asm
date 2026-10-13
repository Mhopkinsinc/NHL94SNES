; Unidentified routine.
CODE_9CA554:
	cmp.w #$0000
	bpl CODE_9CA55D
	eor.w #$FFFF
	inc a
CODE_9CA55D:
	sta.b $14
	tya
	bpl CODE_9CA566
	eor.w #$FFFF
	inc a
CODE_9CA566:
	ldy.b $14
CODE_9CA568:
	sty.b $14
	cmp.b $14
	bcs CODE_9CA571
	sta.b $14
	tya
CODE_9CA571:
	sta.b $16
	lsr a
	cmp.b $14
	bcc CODE_9CA580
	lda.b $14
	lsr a
	lsr a
	clc
	adc.b $16
	rtl
