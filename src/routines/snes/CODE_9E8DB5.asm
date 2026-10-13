; Unidentified routine.
CODE_9E8DB5:
	lda.b $AD
	sec
	sbc.b $B5
	sta.b $AD
	eor.w #$FFFF
	inc a
	sta.b $A9
	bit.w #$8000
	beq CODE_9E8DCB
	eor.w #$FFFF
	inc a
CODE_9E8DCB:
	sta.b $CD
	lda.b $B1
	sec
	sbc.b $B9
	sta.b $A5
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
