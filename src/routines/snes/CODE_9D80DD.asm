; Unidentified routine.
CODE_9D80DD:
	phx
	phy
	lda.l $7E35C0
	clc
	adc.l printfontset
	sta.b tmp0
	lda.w #$009C
	sta.b $0E
	lda.w #$8316
	sta.b $0C
	jsr.w FramerRow
	lda.b tmp2
	lsr a
	cmp.w textdirtylo
	bcs .1
	sta.w textdirtylo
.1:
	dec.b d1
	dec.b d1
.loop:
	lda.w #$831C
	sta.b $0C
	jsr.w FramerRow
	dec.b d1
	bne .loop
	lda.w #$8322
	sta.b $0C
	jsr.w FramerRow
	inx
	inx
	txa
	lsr a
	cmp.w textdirtyhi
	bcc .2
	sta.w textdirtyhi
.2:
	ply
	plx
	rtl
