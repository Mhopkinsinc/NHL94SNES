; Print the password screen keys: Select, A Next, Y Back, Press start
PrintPasswordHelp:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #SelectTxt>>16
	sta.b $8F
	lda.w #SelectTxt
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
	lda.w #ANextTxt>>16
	sta.b $8F
	lda.w #ANextTxt
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
	lda.w #YBackTxt>>16
	sta.b $8F
	lda.w #YBackTxt
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
	lda.w #PressStartTxt>>16
	sta.b $8F
	lda.w #PressStartTxt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	rts
