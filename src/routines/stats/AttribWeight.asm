; The player's weight in pounds, from his weight rating
AttribWeight:
	lda.b d0
	asl a
	asl a
	asl a
	adc.w #$008C
	sta.b d0
	jsl.l PushNumber
	jsl.l print
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #AttribWeightPos>>16
	sta.b a1+2
	lda.w #AttribWeightPos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	rtl
