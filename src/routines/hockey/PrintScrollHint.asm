; Print the scroll hint under a summary list.
PrintScrollHint:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF138
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$000E
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l FramerOutline
	lda.w #$2400
	sta.w $0D0D
	lda.w #$000A
	sta.w printx
	lda.w #$0007
	sta.w printy
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #ScrollHint
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	rtl
