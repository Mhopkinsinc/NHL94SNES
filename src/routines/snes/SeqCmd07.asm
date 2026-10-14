; Sequencer: sound driver command $07 with the instrument data that follows
SeqCmd07:
	lda.w APUIO0
	bne SeqCmd07
	lda.b $4B
	sta.w APUIO1
	lda.w $07FC
	sta.w APUIO2
	lda.w $07FE
	sta.w APUIO3
	lda.b #$07
	sta.w APUIO0
.loop:
	cmp.w APUIO0
	bne .loop
	ldy.b #$14
	lda.b ($4E),y
	sta.w APUIO1
	iny
	lda.b ($4E),y
	sta.w APUIO2
	pha
	iny
	lda.b ($4E),y
	sta.w APUIO3
	ldx.b #$81
	stx.w APUIO0
.loop2:
	cpx.w APUIO0
	bne .loop2
	stz.w APUIO0
.loop3:
	lda.w APUIO0
	bne .loop3
	lda.b $4B
	sta.w APUIO1
	rep #$20
	lda.b $5A
	sta.w APUIO2
	sep #$20
	lda.b #$06
	sta.w APUIO0
.loop4:
	cmp.w APUIO0
	bne .loop4
	stz.w APUIO0
	pla
	bmi .1
.loop5:
	lda.w APUIO0
	bne .loop5
	lda.b $5D
	sta.w APUIO2
	lda.b #$0C
	sta.w APUIO0
.loop6:
	cmp.w APUIO0
	bne .loop6
	stz.w APUIO0
.1:
	ldy.b $4B
	rts
