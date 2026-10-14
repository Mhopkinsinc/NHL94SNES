; A = the approximate length of the vector (A, Y)
ApproxLength:
	cmp.w #$0000
	bpl .1
	eor.w #$FFFF
	inc a
.1:
	sta.b $14
	tya
	bpl .2
	eor.w #$FFFF
	inc a
.2:
	ldy.b $14
CODE_9CA568:
	sty.b $14
	cmp.b $14
	bcs .1
	sta.b $14
	tya
.1:
	sta.b $16
	lsr a
	cmp.b $14
	bcc .t1
	lda.b $14
	lsr a
	lsr a
	clc
	adc.b $16
	rtl

.t1:
	lda.b $14
	lsr a
	clc
	adc.b $14
	lsr a
	lsr a
	clc
	adc.b $16
	rtl
