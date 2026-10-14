; Unidentified routine.
CODE_808723:
	sep #$20
	lda.w $0762
	bpl .t1
	tya
	sta.w CGADD
	rep #$20
	txa
	sep #$10
	asl a
	beq .1
	sta.w DAS1L
	lda.w #DMA_CGRAM
	sta.w DMAP1
	lda.b $0C
	sta.w A1T1L
	ldx.b $0E
	stx.w A1B1
	ldx.b #$02
	stx.w MDMAEN
.1:
	rep #$30
	rtl

.t1:
	sty.w $076A
	rep #$20
	lda.b $0E
	sta.w $076E
	lda.b $0C
	sta.w $076C
	txa
	asl a
	sta.w $0768
	rtl

.t3:
	cmp.w #$0000
	beq .t1x
	cmp.w #$0100
	bne .t2
	tya
	asl a
	tay
.loop:
	lda.b [$0C],y
	sta.b [$10],y
	iny
	iny
	dex
	bne .loop
	rtl

.t1x:
	lda.w #$0000
	tya
	asl a
	tay
.loopx:
	sta.b [$10],y
	iny
	iny
	dex
	bne .loopx
	rtl

.t2:
	and.w #$00FF
	xba
	sta.b $14
	tya
	asl a
	tay
.loopx2:
	lda.b [$0C],y
	and.w #$001F
	ora.b $14
	sta.w WRMPYA
	nop
	rep #$20
	lda.w RDMPYL
	xba
	and.w #$001F
	sta.b [$10],y
	lda.b [$0C],y
	asl a
	asl a
	asl a
	xba
	and.w #$001F
	ora.b $14
	sta.w WRMPYA
	nop
	rep #$20
	lda.w RDMPYL
	lsr a
	lsr a
	lsr a
	and.w #$03E0
	ora.b [$10],y
	sta.b [$10],y
	lda.b [$0C],y
	xba
	lsr a
	lsr a
	and.w #$001F
	ora.b $14
	sta.w WRMPYA
	nop
	rep #$20
	lda.w RDMPYL
	asl a
	asl a
	and.w #$7C00
	ora.b [$10],y
	sta.b [$10],y
	iny
	iny
	dex
	bne .loopx2
	rtl
