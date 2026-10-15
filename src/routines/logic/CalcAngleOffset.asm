; d4 = the cross product of the goalie vector and the post vector from the puck
CalcAngleOffset:
	lda.b d3
	sec
	sbc.w puckx
	sta.b d3
	lda.b d4
	sec
	sbc.w pucky
	ldx.b d0
	jsl.l Mul16S
	lda.b $0A
	sta.b $B7
	lda.b $08
	sta.b d4
	lda.b d1
	ldx.b d3
	jsl.l Mul16S
	lda.b d4
	sec
	sbc.b $08
	sta.b $08
	lda.b $B7
	sbc.b $0A
	sta.b $0A
	lda.b d2
	sta.b $04
	jsl.l Div32S
	lda.b $00
	sta.b d4
	rts
