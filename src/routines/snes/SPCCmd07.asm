; sound driver command $07, X and 5 bytes from [p0]
SPCCmd07:
	sep #$30
.wait:
	lda.w APUIO0
	bne .wait
	stx.w APUIO1
	ldy.b #$00
	lda.b [p0],y
	sta.w APUIO2
	iny
	lda.b [p0],y
	sta.w APUIO3
	iny
	lda.b #$07
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	lda.b [p0],y
	sta.w APUIO1
	iny
	lda.b [p0],y
	sta.w APUIO2
	iny
	lda.b [p0],y
	sta.w APUIO3
	ldx.b #$81
	stx.w APUIO0
.ack2:
	cpx.w APUIO0
	bne .ack2
	stz.w APUIO0
	rep #$30
	rtl
