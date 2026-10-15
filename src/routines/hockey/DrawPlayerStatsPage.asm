; Player stats: print the header and send the header rows and the visible rows of the stats page buffer (scroll $1DB9) to VRAM
DrawPlayerStatsPage:
	lda.b d1
	pha
	lda.w statcolumn
	beq .t1
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #PlayerGAPtShPmTxt>>16
	sta.b $8F
	lda.w #PlayerGAPtShPmTxt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w listrows
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
	lda.w #GoalieGaShPtgTxt>>16
	sta.b $8F
	lda.w #GoalieGaShPtgTxt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w listend
	sta.b d1
	lda.w #$007E
	sta.b $0E
	lda.w #$39B4
	sta.b $0C
	ldy.w #$00E0
	ldx.w #$04C0
	jsl.l DMAToVRAM
.1:
	lda.w curitem
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
