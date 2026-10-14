; sound driver command $0A, 8 bytes from [$0C]
SPCCmd0A:
	sep #$30
.wait:
	lda.w APUIO0
	bne .wait
	ldy.b #$00
	lda.b [$0C],y
	sta.w APUIO1
	iny
	lda.b [$0C],y
	sta.w APUIO2
	iny
	lda.b [$0C],y
	sta.w APUIO3
	iny
	lda.b #$0A
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	lda.b [$0C],y
	sta.w APUIO1
	iny
	lda.b [$0C],y
	sta.w APUIO2
	iny
	lda.b [$0C],y
	sta.w APUIO3
	ldx.b #$84
	stx.w APUIO0
.ack2:
	cpx.w APUIO0
	bne .ack2
	lda.b [$0C],y
	sta.w APUIO1
	iny
	lda.b [$0C],y
	sta.w APUIO2
	inx
	stx.w APUIO0
.ack3:
	cpx.w APUIO0
	bne .ack3
	stz.w APUIO0
	rep #$30
	rtl
