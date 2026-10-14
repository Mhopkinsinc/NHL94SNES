; Unidentified routine.
CODE_9D8091:
	phx
	phy
	lda.l $7E35BE
	clc
	adc.l printfontset
	sta.b tmp0
	lda.w #$009C
	sta.b $0E
	lda.w #$81DE
	sta.b $0C
	jsr.w CODE_9D804F
	lda.b tmp2
	lsr a
	cmp.w textdirtylo
	bcs CODE_9D80B6
	sta.w textdirtylo
CODE_9D80B6:
	dec.b d1
	dec.b d1
CODE_9D80BA:
	lda.w #$81E4
	sta.b $0C
	jsr.w CODE_9D804F
	dec.b d1
	bne CODE_9D80BA
	lda.w #$81EA
	sta.b $0C
	jsr.w CODE_9D804F
	inx
	inx
	txa
	lsr a
	cmp.w textdirtyhi
	bcc CODE_9D80DA
	sta.w textdirtyhi
CODE_9D80DA:
	ply
	plx
	rtl
