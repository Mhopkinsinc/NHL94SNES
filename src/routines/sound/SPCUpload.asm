; sound driver command $03: a sample of X bytes from [p0], loop point Y (the next sample slot)
SPCUpload:
	sep #$20
.wait:
	lda.w APUIO0
	bne .wait
	sty.w APUIO2
	lda.b #$03
	sta.w APUIO0
	stz.w APUIO1
.ack:
	cmp.w APUIO0
	bne .ack
	ldy.w #$0000
.loop:
	lda.b [p0],y
	sta.w APUIO2
	iny
	tya
	sta.w APUIO1
.ackbyte:
	cmp.w APUIO1
	bne .ackbyte
	nop
	nop
	nop
	dex
	bne .loop
	stz.w APUIO0
	rep #$20
	rtl
