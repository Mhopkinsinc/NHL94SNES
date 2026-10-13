; Unidentified routine.
CODE_9EE0CD:
	lda.b $B1
	sec
	sbc.w puckx
	sta.b $B1
	lda.b $B5
	sec
	sbc.w pucky
	ldx.b $A5
	jsl.l Mul16S
	lda.b $0A
	sta.b $B7
	lda.b $08
	sta.b $B5
	lda.b $A9
	ldx.b $B1
	jsl.l Mul16S
	lda.b $B5
	sec
	sbc.b $08
	sta.b $08
	lda.b $B7
	sbc.b $0A
	sta.b $0A
	lda.b $AD
	sta.b $04
	jsl.l Div32S
	lda.b $00
	sta.b $B5
	rts
