; Print "The MultiPlayer 5 must be connected to Controller Socket #2."
Multi5SocketMsg:
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #TheMultiPlayer5MustBeTxt>>16
	sta.b a1+2
	lda.w #TheMultiPlayer5MustBeTxt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #ConnectedToControllerTxt>>16
	sta.b a1+2
	lda.w #ConnectedToControllerTxt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #Socket2Txt>>16
	sta.b a1+2
	lda.w #Socket2Txt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
org $9DB000
	jsl.l SendTextMap
	rtl
