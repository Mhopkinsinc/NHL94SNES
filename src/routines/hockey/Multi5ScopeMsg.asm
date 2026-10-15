; Print "The MultiPlayer 5 is not designed for use with the Super NES Super Scope."
Multi5ScopeMsg:
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #TheMultiPlayer5IsNotTxt>>16
	sta.b a1+2
	lda.w #TheMultiPlayer5IsNotTxt
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
	lda.w #DesignedForUseWithTheTxt>>16
	sta.b a1+2
	lda.w #DesignedForUseWithTheTxt
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
	lda.w #SuperNesSuperScopeTxt>>16
	sta.b a1+2
	lda.w #SuperNesSuperScopeTxt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	jsl.l SendTextMap
	rtl
