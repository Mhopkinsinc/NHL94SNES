; Reset the scroll, window and colour math registers and their copies
ResetPPURegs:
	pha
	stz.w $07D6
	stz.w $07DA
	stz.w $07DE
	lda.w #$FFFF
	sta.w $07D8
	sta.w $07DC
	sta.w $07E0
	lda.w #$FFF0
	sta.b $30
	sta.b $2C
	lda.w #$00E0
	sta.b $32
	lda.w #$0100
	sta.b $2E
	sep #$20
	stz.w CGADSUB
	stz.w CGWSEL
	stz.w TMW
	stz.w MOSAIC
	stz.w SETINI
	stz.w TS
	stz.w TSW
	stz.w W12SEL
	stz.w W34SEL
	stz.w WOBJSEL
	stz.w $07E2
	rep #$20
	pla
	rtl
