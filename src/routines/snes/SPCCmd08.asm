; Unidentified routine.
SPCCmd08:		; sound driver command $08, 5 bytes from [$0C]
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
	lda.b #$08
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	lda.b [$0C],y
	sta.w APUIO1
	iny
	lda.b [$0C],y
	sta.w APUIO2
	ldx.b #$82
	stx.w APUIO0
.ack2:
	cpx.w APUIO0
	bne .ack2
	stz.w APUIO0
	rep #$30
	rtl
