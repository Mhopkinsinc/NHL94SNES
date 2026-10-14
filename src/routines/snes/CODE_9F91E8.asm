; Unidentified routine.
CODE_9F91E8:
	lda.w #$0008
	trb.w sflags3
CODE_9F91EE:
	jsl.l CODE_9BC17C
	lda.w #$0096
	sta.b $0E
	lda.w #DATA8_96B2CF
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	lda.l $7E35BA
	asl a
	asl a
	asl a
	asl a
	adc.w #$1000
	tay
	jsl.l CODE_80891F
	stx.b xsave
	ldx.w #$001A
CODE_9F9229:
	pla
	sta.b a0,x
	dex
	dex
	bpl CODE_9F9229
	ldx.b xsave
	stx.b xsave
	ldx.w #$001E
CODE_9F9237:
	pla
	sta.b d0,x
	dex
	dex
	bpl CODE_9F9237
	ldx.b xsave
	ldx.b a3
	rtl
