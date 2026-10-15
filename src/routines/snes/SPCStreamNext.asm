; sound driver command $10: send the next block of the stream; returns the bytes still left
SPCStreamNext:
	lda.l SPCStreamPtr
	sta.b StreamSrc
	lda.l SPCStreamPtr+2
	sta.b StreamSrc+2
	lda.w STAT78
	bit.w #$0010
	beq .small
.big:
	lda.l SPCStreamLeft
	cmp.w #$008B
	bcc .last
	sbc.w #$008A
	sta.l SPCStreamLeft
	ldx.w #$008A
	bra .send
.small:
	lda.l SPCStreamLeft
	cmp.w #$0074
	bcc .last
	sbc.w #$0073
	sta.l SPCStreamLeft
	ldx.w #$0073
	bra .send
.last:
	tax
	lda.w #$0000
	sta.l SPCStreamLeft
.send:
	ldy.w #$0000
	sep #$20
.wait:
	lda.w APUIO0
	bne .wait
	lda.b #$10
	sta.w APUIO0
	stz.w APUIO1
.ack:
	cmp.w APUIO0
	bne .ack
.loop:
	lda.b [StreamSrc],y
	sta.w APUIO2
	iny
	tya
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
	tya
	clc
	adc.b StreamSrc
	sta.l SPCStreamPtr
	lda.l SPCStreamLeft
	rtl
