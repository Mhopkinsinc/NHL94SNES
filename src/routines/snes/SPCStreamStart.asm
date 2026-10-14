; sound driver command $0F: start sending X bytes from [$3E] to sound RAM address Y; sends the first block
SPCStreamStart:
	lda.w STAT78
	bit.w #$007E
	beq .small
	txa
	sec
	sbc.w #$008A
	sta.l SPCStreamLeft
	ldx.w #$008A
	bra .send
.small:
	txa
	sec
	sbc.w #$0073
	sta.l SPCStreamLeft
	ldx.w #$0073
.send:
	sep #$20
.wait:
	lda.w APUIO0
	bne .wait
	sty.w APUIO2
	lda.b #$0F
	sta.w APUIO0
	stz.w APUIO1
.ack:
	cmp.w APUIO0
	bne .ack
	ldy.w #$0000
.loop:
	lda.b [$3E],y
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
	tya
	clc
	adc.b $3E
	sta.l SPCStreamPtr
	lda.b $40
	sta.l SPCStreamPtr+2
	rtl
