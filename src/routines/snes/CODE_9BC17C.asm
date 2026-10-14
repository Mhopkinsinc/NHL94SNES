; Unidentified routine.
CODE_9BC17C:
	lda.w HomeTeam
	asl a
	asl a
	asl a
	tax
	lda.l CenterIceTable,x
	sta.b $0C
	lda.l CenterIceTable+2,x
	sta.b $0E
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $12
	sta.b $0E
	stz.b $0C
	stx.b $10
	stx.b $00
	jsl.l LinearToPlanar
	ldx.b $10
	stx.b $0C
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	adc.l $7E35B8
	sta.l $7E35BA
	lda.l $7E35B8
	asl a
	asl a
	asl a
	asl a
	adc.w #$1000
	tay
	jsl.l DMAToVRAM
	jsl.l CODE_9BC1D5
	rtl
