; Unidentified routine.
; Divides.
Div16S:		; $08 / $04 into $00, signed
	lda.b $04
	bmi .divneg
	lda.b $08
	bmi .dividendneg
	jmp.w Div16U
.divneg:
	eor.w #$FFFF
	inc a
	sta.b $04
	lda.b $08
	bpl .negate
	lda.w #$0000
	sec
	sbc.b $08
	sta.b $08
	jmp.w Div16U
.dividendneg:
	eor.w #$FFFF
	inc a
	sta.b $08
.negate:
	jsl.l Div16U
	lda.w #$0000
	sec
	sbc.b $00
	sta.b $00
	rtl
