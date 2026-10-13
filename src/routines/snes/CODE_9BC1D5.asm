; Unidentified routine.
CODE_9BC1D5:
	lda.w #$0092
	sta.b $0E
	lda.w #IceRinkMap
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$C800
	sta.b $10
	jsl.l Decompress
	lda.w HomeTeam
	asl a
	asl a
	asl a
	tax
	lda.l CenterIceTable+4,x
	sta.b $0C
	lda.l CenterIceTable+6,x
	sta.b $0E
	lda.w #$007F
	sta.b $12
	lda.w #$D8B6
	sec
	sbc.b [$0C]
	sta.b $10
	lda.b [$0C]
	asl a
	sta.b $14
	inc.b $0C
	inc.b $0C
	lda.b [$0C]
	tay
	cmp.w #$0006
	bcc CODE_9BC226
	lda.b $10
	sec
	sbc.w #$0060
	sta.b $10
CODE_9BC226:
	lda.b $0C
	clc
	adc.w #$0004
	sta.b $0C
CODE_9BC22E:
	ldx.w #$0000
CODE_9BC231:
	lda.b [$0C]
	clc
	adc.l $7E35B8
	adc.w #$1400
	sta.b [$10]
	inx
	inx
	inc.b $0C
	inc.b $0C
	inc.b $10
	inc.b $10
	cpx.b $14
	bne CODE_9BC231
	lda.b $10
	clc
	adc.w #$0060
	sec
	sbc.b $14
	sta.b $10
	dey
	bne CODE_9BC22E
	rtl
