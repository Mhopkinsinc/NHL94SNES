; Unidentified routine.
SPCDownload:		; sound driver command $11: X bytes from sound RAM address Y to [$0C]
	sep #$20
.wait:
	lda.w APUIO0
	bne .wait
	sty.w APUIO2
	lda.b #$11
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	stx.w APUIO2
	lda.b #$86
	sta.w APUIO0
.ack2:
	cmp.w APUIO0
	bne .ack2
	lda.b #$87
	sta.w APUIO0
	lda.b #$00
	sta.w APUIO1
	ldy.w #$0000
.loop:
	tya
.waitbyte:
	cmp.w APUIO1
	beq .waitbyte
	lda.w APUIO2
	sta.b [$0C],y
	iny
	tya
	sta.w APUIO1
	dex
	bne .loop
	stz.w APUIO0
	rep #$20
	rtl
