; sound driver command $05, X in APUIO1
SPCCmd05:
	sep #$30
.wait:
	lda.w APUIO0
	bne .wait
	stx.w APUIO1
	lda.b #$05
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	stz.w APUIO0
	rep #$30
	rtl
