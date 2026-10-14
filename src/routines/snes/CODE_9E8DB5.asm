; Unidentified routine.
CODE_9E8DB5:
	lda.b d2
	sec
	sbc.b d4
	sta.b d2
	eor.w #$FFFF
	inc a
	sta.b d1
	bit.w #$8000
	beq CODE_9E8DCB
	eor.w #$FFFF
	inc a
CODE_9E8DCB:
	sta.b $CD
	lda.b d3
	sec
	sbc.b d5
	sta.b d0
	bit.w #$8000
	beq CODE_9E8DDD
	eor.w #$FFFF
	inc a
CODE_9E8DDD:
	sta.b $D7
	cmp.b $CD
	bcc CODE_9E8DEB
	lda.b $CD
	lsr a
	lsr a
	adc.b $D7
	bra CODE_9E8DEF
