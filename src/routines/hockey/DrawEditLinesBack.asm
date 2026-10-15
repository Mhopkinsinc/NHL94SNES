; Redraw the line editor background: clear the top, the frame, and the background map in map 2
DrawEditLinesBack:
	pha
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #DrawEditLinesBackPos>>16
	sta.b $8F
	lda.w #DrawEditLinesBackPos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0020
	sta.b d0
	lda.w #$000D
	sta.b d1
	lda.l blankchar
	sta.b d2
	jsl.l eraser
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #DrawEditLinesBackPos2>>16
	sta.b $8F
	lda.w #DrawEditLinesBackPos2
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0800
	sta.w printa
	lda.w #$0011
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l FramerOutline
	lda.w #MenuBackMap>>16
	sta.b $0E
	lda.w #MenuBackMap
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
	lda.w #textmap2>>16
	sta.b $12
	lda.w #textmap2
	sta.b $10
	lda.w #$0020
	sta.b $24
	lda.w #$0014
	sta.b $26
	ldx.w #$0000
	ldy.w #$0000
	lda.l $7E35AC
	clc
	adc.w #$0C00
	jsl.l PasteMap
	pla
	rts
