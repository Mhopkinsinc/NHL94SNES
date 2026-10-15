; sound driver command $09 (echo volume, feedback, buffer address and delay), 5 bytes from [p0]
SPCCmd09:
	sep #$30
.wait:
	lda.w APUIO0
	bne .wait
	ldy.b #$00
	lda.b [p0],y
	sta.w APUIO1
	iny
	lda.b [p0],y
	sta.w APUIO2
	iny
	lda.b [p0],y
	sta.w APUIO3
	iny
	lda.b #$09
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	lda.b [p0],y
	sta.w APUIO1
	iny
	lda.b [p0],y
	sta.w APUIO2
	ldx.b #$83
	stx.w APUIO0
.ack2:
	cpx.w APUIO0
	bne .ack2
	stz.w APUIO0
	rep #$30
	rtl
