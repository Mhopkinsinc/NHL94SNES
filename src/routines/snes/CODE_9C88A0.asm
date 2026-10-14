; Unidentified routine.
CODE_9C88A0:
	lda.b d1
	pha
	lda.w $1DF9
	beq .t1
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF309
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $1DC5
	sta.b d1
	dec.b d1
	lda.w #$007E
	sta.b $0E
	lda.w #$39B4
	sta.b $0C
	ldy.w #$00E0
	ldx.w #$00C0
	jsl.l DMAToVRAM
	bra .1

.t1:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF32C
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $1DC1
	sta.b d1
	lda.w #$007E
	sta.b $0E
	lda.w #$39B4
	sta.b $0C
	ldy.w #$00E0
	ldx.w #$04C0
	jsl.l DMAToVRAM
.1:
	lda.w $1DB9
	xba
	lsr a
	adc.w #$2780
	sta.b $0C
	lda.w #$007F
	sta.b $0E
	lda.b d1
	xba
	lsr a
	adc.w #$0040
	tax
	ldy.w #$0160
	jsl.l DMAToVRAM
	pla
	sta.b d1
	rtl
