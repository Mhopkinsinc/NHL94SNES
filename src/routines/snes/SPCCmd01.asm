; sound driver command $01
SPCCmd01:
	sep #$20
.wait:
	lda.w APUIO0
	bne .wait
	lda.b #$01
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	stz.w APUIO0
	rep #$20
	rtl
