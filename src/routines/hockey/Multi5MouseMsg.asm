; Print "The MultiPlayer 5 is not designed for use with the Super NES mouse."
Multi5MouseMsg:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #TheMultiPlayer5IsNotTxt2>>16
	sta.b $8F
	lda.w #TheMultiPlayer5IsNotTxt2
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
	lda.w #DesignedForUseWithTheTxt2>>16
	sta.b $8F
	lda.w #DesignedForUseWithTheTxt2
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
	lda.w #SuperNesMouseTxt>>16
	sta.b $8F
	lda.w #SuperNesMouseTxt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l SendTextMap
	rtl
