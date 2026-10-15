; $08-$0B / $04 into $00, signed; $7FFF when the quotient does not fit
Div32S:
	lda.b r1
	bmi .divneg
	lda.b r2+2
	bmi .dividendneg
	jmp.w Div32U
.divneg:
	eor.w #$FFFF
	inc a
	sta.b r1
	lda.b r2+2
	bpl .negate
	lda.w #$0000
	sec
	sbc.b r2
	sta.b r2
	lda.w #$0000
	sbc.b r2+2
	sta.b r2+2
	jmp.w Div32U
.dividendneg:
	lda.w #$0000
	sec
	sbc.b r2
	sta.b r2
	lda.w #$0000
	sbc.b r2+2
	sta.b r2+2
.negate:
	jsl.l Div32U
	lda.w #$0000
	sec
	sbc.b r0
	sta.b r0
	rtl
