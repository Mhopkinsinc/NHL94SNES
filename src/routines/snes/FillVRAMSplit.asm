; Fill X bytes of video memory at Y with the word A, the low bytes then the high bytes
FillVRAMSplit:
	sta.b $16
	lda.w IniDispShadow-1
	bpl .t1
	txa
	pha
	sta.w DAS1L
	sty.w VMADDL
	sty.b $14
	ldy.w #$0016
	sty.w A1T1L
	lda.w #$1808
	sta.w DMAP1
	sep #$20
	stz.w VMAIN
	stz.w A1B1
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	pla
	sta.w DAS1L
	clc
	adc.b $14
	pha
	ldy.b $14
	sty.w VMADDL
	ldy.w #$0017
	sty.w A1T1L
	lda.w #$1908
	sta.w DMAP1
	sep #$20
	lda.b #$80
	sta.w VMAIN
	stz.w A1B1
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	ply
	rtl

.t1:
	txa
	ldx.b DMAQueueTail
.loop:
	pha
	cmp.w #$1001
	bcc .1
	lda.w #$1000
.1:
	pha
	sta.w DMAQueue+4,x
	tya
	sta.w DMAQueue+6,x
	lda.w #$0016
	sta.w DMAQueue+1,x
	sep #$20
	stz.w DMAQueue+3,x
	lda.b #$FD
	sta.w DMAQueue,x
	rep #$20
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	pla
	sta.w DMAQueue+4,x
	pha
	tya
	sta.w DMAQueue+6,x
	pla
	clc
	adc.w DMAQueue+6,x
	tay
	lda.w #$0017
	sta.w DMAQueue+1,x
	sep #$20
	stz.w DMAQueue+3,x
	lda.b #$FC
	sta.w DMAQueue,x
	rep #$20
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	pla
	sec
	sbc.w #$1000
	beq .2
	bcs .loop
.2:
	stx.b DMAQueueTail
	rtl
