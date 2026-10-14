; Line editor: clear the top, the title (DrawEditLinesTitle) and the line frame
DrawEditLinesTop:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFEA
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
	jsl.l DrawEditLinesTitle
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFEF
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0800
	sta.w $0D0D
	lda.w #$0011
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l FramerOutline
	rtl
