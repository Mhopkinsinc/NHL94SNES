; Full brightness, no forced blank
ScreenOn:
	pha
	lda.w brightness
	cmp.w #$000F
	beq .1
	jsl.l FadeIn
.1:
	sep #$20
	lda.b #$0F
	sta.w IniDispShadow
	rep #$20
	pla
	rtl
