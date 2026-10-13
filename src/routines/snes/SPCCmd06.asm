; Unidentified routine.
SPCCmd06:		; sound driver command $06, Y in APUIO2-APUIO3, X in APUIO1
	sty.w APUIO2
	sep #$30
.wait:
	lda.w APUIO0
	bne .wait
	stx.w APUIO1
	lda.b #$06
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	stz.w APUIO0
	rep #$30
	rtl
