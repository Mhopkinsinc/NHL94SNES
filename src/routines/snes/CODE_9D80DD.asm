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
	jsr.w CODE_9D804F
	lda.b tmp2
	lsr a
	cmp.w textdirtylo
	bcs CODE_9D8102
	sta.w textdirtylo
CODE_9D8102:
	dec.b d1
	dec.b d1
CODE_9D8106:
	lda.w #$831C
	sta.b $0C
	jsr.w CODE_9D804F
	dec.b d1
	bne CODE_9D8106
	lda.w #$8322
	sta.b $0C
	jsr.w CODE_9D804F
	inx
	inx
	txa
	lsr a
	cmp.w textdirtyhi
	bcc CODE_9D8126
	sta.w textdirtyhi
CODE_9D8126:
	ply
	plx
	rtl
