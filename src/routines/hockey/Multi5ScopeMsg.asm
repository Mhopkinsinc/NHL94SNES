; Print "The MultiPlayer 5 is not designed for use with the Super NES Super Scope."
Multi5ScopeMsg:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #TheMultiPlayer5IsNotTxt>>16
	sta.b $8F
	lda.w #TheMultiPlayer5IsNotTxt
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
	lda.w #DesignedForUseWithTheTxt>>16
	sta.b $8F
	lda.w #DesignedForUseWithTheTxt
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
	lda.w #SuperNesSuperScopeTxt>>16
	sta.b $8F
	lda.w #SuperNesSuperScopeTxt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l SendTextMap
	rtl
