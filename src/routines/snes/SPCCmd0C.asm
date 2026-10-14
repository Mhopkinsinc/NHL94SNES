; sound driver command $0C, Y in APUIO2, X in APUIO1
SPCCmd0C:
	sep #$30
.wait:
	lda.w APUIO0
	bne .wait
	sty.w APUIO2
	stx.w APUIO1
	lda.b #$0C
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	stz.w APUIO0
	rep #$30
	rtl
