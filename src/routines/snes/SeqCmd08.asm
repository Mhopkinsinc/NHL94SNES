; Sequencer: sound driver command $08 with the values $07F8, $07E7-$07E9
SeqCmd08:
	php
	sep #$30
.loop:
	lda.w APUIO0
	bne .loop
	ldy.b #$00
	lda.w $07F8
	sta.w APUIO1
	iny
	lda.w $07F8
	sta.w APUIO2
	iny
	lda.l $0007E9
	sta.w APUIO3
	iny
	lda.b #$08
	sta.w APUIO0
.loop2:
	cmp.w APUIO0
	bne .loop2
	lda.l $0007E8
	sta.w APUIO1
	iny
	lda.l $0007E7
	sta.w APUIO2
	ldx.b #$82
	stx.w APUIO0
.loop3:
	cpx.w APUIO0
	bne .loop3
	stz.w APUIO0
	lda.w $07E7
	beq .1
.loop4:
	lda.w APUIO0
	bne .loop4
	ldy.b #$00
	lda.l $0007EB
	sta.w APUIO1
	iny
	lda.l $0007EB
	sta.w APUIO2
	iny
	lda.l $0007EC
	sta.w APUIO3
	iny
	lda.b #$09
	sta.w APUIO0
.loop5:
	cmp.w APUIO0
	bne .loop5
	lda.b #$E0
	sta.w APUIO1
	iny
	lda.l $0007EA
	sta.w APUIO2
	ldx.b #$83
	stx.w APUIO0
.loop6:
	cpx.w APUIO0
	bne .loop6
	stz.w APUIO0
.1:
	rep #$30
	plp
	rts
