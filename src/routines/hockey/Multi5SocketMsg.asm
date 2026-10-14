; Print "The MultiPlayer 5 must be connected to Controller Socket #2."
Multi5SocketMsg:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #TheMultiPlayer5MustBeTxt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #ConnectedToControllerTxt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #Socket2Txt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
org $9DB000
	jsl.l SendTextMap
	rtl
