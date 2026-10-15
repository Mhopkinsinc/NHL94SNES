; A = the approximate length of the vector (A, Y)
ApproxLength:
	cmp.w #$0000
	bpl .1
	eor.w #$FFFF
	inc a
.1:
	sta.b r3
	tya
	bpl .2
	eor.w #$FFFF
	inc a
.2:
	ldy.b r3
ApproxLength_abs:
	sty.b r3
	cmp.b r3
	bcs .1
	sta.b r3
	tya
.1:
	sta.b r3+2
	lsr a
	cmp.b r3
	bcc .t1
	lda.b r3
	lsr a
	lsr a
	clc
	adc.b r3+2
	rtl

.t1:
	lda.b r3
	lsr a
	clc
	adc.b r3
	lsr a
	lsr a
	clc
	adc.b r3+2
	rtl
