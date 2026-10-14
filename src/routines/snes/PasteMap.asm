; Copy map [$0C] (width, height) into the map at [$10], column X, row Y, adding A to each entry
PasteMap:
	sta.b $26
	stx.b $1C
	tya
	asl a
	ldx.b $24
	jsl.l Mul16U
	lda.b $1C
	asl a
	clc
	adc.b $08
	adc.b $10
	sta.b $10
	ldy.w #$0000
	lda.b [$0C],y
	sta.b $18
	iny
	iny
	lda.b [$0C],y
	sta.b $1A
	lda.b $0C
	clc
	adc.w #$0006
	sta.b $0C
.loop:
	ldx.b $18
	ldy.w #$0000
.loop2:
	lda.b [$0C],y
	clc
	adc.b $26
	sta.b [$10],y
	iny
	iny
	dex
	bne .loop2
	lda.b $24
	asl a
	adc.b $10
	sta.b $10
	lda.b $18
	asl a
	adc.b $0C
	sta.b $0C
	dec.b $1A
	bne .loop
	rtl
