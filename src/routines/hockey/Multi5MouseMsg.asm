; Print "The MultiPlayer 5 is not designed for use with the Super NES mouse."
Multi5MouseMsg:
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #TheMultiPlayer5IsNotTxt2>>16
	sta.b a1+2
	lda.w #TheMultiPlayer5IsNotTxt2
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
	lda.w #DesignedForUseWithTheTxt2>>16
	sta.b a1+2
	lda.w #DesignedForUseWithTheTxt2
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
	lda.w #SuperNesMouseTxt>>16
	sta.b a1+2
	lda.w #SuperNesMouseTxt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	jsl.l SendTextMap
	rtl
