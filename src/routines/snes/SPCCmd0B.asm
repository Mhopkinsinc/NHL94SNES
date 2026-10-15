; sound driver command $0B (pitch Y of voice X), Y in APUIO2-APUIO3, X in APUIO1
SPCCmd0B:
	sty.w APUIO2
	sep #$30
.wait:
	lda.w APUIO0
	bne .wait
	stx.w APUIO1
	lda.b #$0B
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	stz.w APUIO0
	rep #$30
	rtl
