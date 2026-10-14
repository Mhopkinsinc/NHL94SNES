; Unidentified routine.
CODE_9DBB14:
	pha
	lda.w #$007F
	sta.b $0E
	lda.w #$4000
	sta.b $0C
	lda.w #$0000
	sta.w $079C
	ldx.w #$003C
	ldy.w #$003C
	jsl.l CODE_808D43
	pla
	asl a
	asl a
	asl a
	tax
	phx
	lda.l CenterIceTable+4,x
	sta.b $0C
	lda.l CenterIceTable+6,x
	sta.b $0E
	jsr.w CODE_9DBC25
	txa
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0042
	tax
	tya
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0040
	tay
	lda.w #$007F
	sta.b $0E
	lda.w #$A000
	sta.b $0C
	lda.w #$0000
	sta.w $079C
	jsl.l CODE_808D43
	plx
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
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	jsr.w CODE_9DBBA8
	lda.w #$007F
	sta.b $0E
	lda.w #$A000
	sta.b $0C
	ldy.w #$0000
	jsl.l CODE_80899B
	rts
