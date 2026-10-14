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
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #AttribWeightPos>>16
	sta.b $8F
	lda.w #AttribWeightPos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	rtl
