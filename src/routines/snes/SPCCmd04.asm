; sound driver command $04 (drop the last uploaded sample)
SPCCmd04:
	sep #$20
.wait:
	lda.w APUIO0
	bne .wait
	lda.b #$04
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	stz.w APUIO0
	rep #$20
	rtl
