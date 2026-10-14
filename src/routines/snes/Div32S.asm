; $08-$0B / $04 into $00, signed; $7FFF when the quotient does not fit
Div32S:
	lda.b $04
	bmi .divneg
	lda.b $0A
	bmi .dividendneg
	jmp.w Div32U
.divneg:
	eor.w #$FFFF
	inc a
	sta.b $04
	lda.b $0A
	bpl .negate
	lda.w #$0000
	sec
	sbc.b $08
	sta.b $08
	lda.w #$0000
	sbc.b $0A
	sta.b $0A
	jmp.w Div32U
.dividendneg:
	lda.w #$0000
	sec
	sbc.b $08
	sta.b $08
	lda.w #$0000
	sbc.b $0A
	sta.b $0A
.negate:
	jsl.l Div32U
	lda.w #$0000
	sec
	sbc.b $00
	sta.b $00
	rtl
