; Unidentified routine.
CODE_9D80DD:
	phx
	phy
	lda.l $7E35C0
	clc
	adc.l $7E35A8
	sta.b $C5
	lda.w #$009C
	sta.b $0E
	lda.w #$8316
	sta.b $0C
	jsr.w CODE_9D804F
	lda.b $C9
	lsr a
	cmp.w $0CD5
	bcs CODE_9D8102
	sta.w $0CD5
CODE_9D8102:
	dec.b $A9
	dec.b $A9
CODE_9D8106:
	lda.w #$831C
	sta.b $0C
	jsr.w CODE_9D804F
	dec.b $A9
	bne CODE_9D8106
	lda.w #$8322
	sta.b $0C
	jsr.w CODE_9D804F
	inx
	inx
	txa
	lsr a
	cmp.w $0CD7
	bcc CODE_9D8126
	sta.w $0CD7
CODE_9D8126:
	ply
	plx
	rtl
