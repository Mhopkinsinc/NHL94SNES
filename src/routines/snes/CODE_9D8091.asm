; Unidentified routine.
CODE_9D8091:
	phx
	phy
	lda.l $7E35BE
	clc
	adc.l $7E35A8
	sta.b $C5
	lda.w #$009C
	sta.b $0E
	lda.w #$81DE
	sta.b $0C
	jsr.w CODE_9D804F
	lda.b $C9
	lsr a
	cmp.w $0CD5
	bcs CODE_9D80B6
	sta.w $0CD5
CODE_9D80B6:
	dec.b $A9
	dec.b $A9
CODE_9D80BA:
	lda.w #$81E4
	sta.b $0C
	jsr.w CODE_9D804F
	dec.b $A9
	bne CODE_9D80BA
	lda.w #$81EA
	sta.b $0C
	jsr.w CODE_9D804F
	inx
	inx
	txa
	lsr a
	cmp.w $0CD7
	bcc CODE_9D80DA
	sta.w $0CD7
CODE_9D80DA:
	ply
	plx
	rtl
