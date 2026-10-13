; Unidentified routine.
RemapTiles:
	lda.w #$000E
	sta.b $CA
	sta.b $CA
CODE_9B8552:
	rep #$30
	ldy.b $CA
	lda.b [$89],y
	sta.b $C5
	tya
	clc
	adc.w #$0010
	tay
	lda.b [$89],y
	sta.b $C7
	sep #$30
	ldx.b $CA
	lda.b #$07
	sta.b $C9
CODE_9B856C:
	ldy.b #$00
	asl.b $C8
	bcc CODE_9B8574
	ldy.b #$08
CODE_9B8574:
	asl.b $C7
	bcc CODE_9B857C
	iny
	iny
	iny
	iny
CODE_9B857C:
	asl.b $C6
	bcc CODE_9B8582
	iny
	iny
CODE_9B8582:
	asl.b $C5
	bcc CODE_9B8587
	iny
CODE_9B8587:
	lda.b [$8D],y
	lsr a
	rol.w $0A0A,x
	lsr a
	rol.w $0A0B,x
	lsr a
	rol.w $0A1A,x
	lsr a
	rol.w $0A1B,x
	dec.b $C9
	bpl CODE_9B856C
	dec.b $CA
	dec.b $CA
	bpl CODE_9B8552
	rep #$30
	ldx.w #$0000
CODE_9B85A8:
	lda.w $0A0A,x
	sta.w VMDATAL
	inx
	inx
	cpx.w #$0020
	bne CODE_9B85A8
	lda.b $89
	clc
	adc.w #$0020
	sta.b $89
	dec.b $A5
	bne RemapTiles
	rtl
