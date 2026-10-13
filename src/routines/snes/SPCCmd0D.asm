; Unidentified routine.
SPCCmd0D:		; sound driver command $0D
	sep #$20
.wait:
	lda.w APUIO0
	bne .wait
	lda.b #$0D
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	stz.w APUIO0
	rep #$20
	rtl
