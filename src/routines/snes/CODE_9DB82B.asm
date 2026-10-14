; Unidentified routine.
CODE_9DB82B:
	lda.w $0BFB
	inc a
	cmp.w #$0200
	bcs CODE_9DB871
	sta.w $0BFB
	sec
	sbc.w #$0100
	pha
	ldx.w #$0070
	jsl.l CODE_808F4C
	xba
	and.w #$00FF
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0190
	sta.w $0BF7
	pla
	ldx.w #$0040
	jsl.l CODE_808F4C
	xba
	and.w #$00FF
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0180
	sta.w $0BF9
	ldx.w #$03E8
	jsr.w CODE_9DB884
	bra CODE_9DB82B
