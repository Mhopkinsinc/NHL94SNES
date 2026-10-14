; sound driver command $0E, X in APUIO1, A in APUIO2, Y in APUIO3
SPCCmd0E:
	sep #$30
	pha
.wait:
	lda.w APUIO0
	bne .wait
	pla
	sty.w APUIO3
	sta.w APUIO2
	stx.w APUIO1
	lda.b #$0E
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	stz.w APUIO0
	rep #$30
	rtl
