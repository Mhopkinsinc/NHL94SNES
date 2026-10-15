; Reset the scroll, window and colour math registers and their copies
ResetPPURegs:
	pha
	stz.w BG1HScroll
	stz.w BG2HScroll
	stz.w BG3HScroll
	lda.w #$FFFF
	sta.w BG1VScroll
	sta.w BG2VScroll
	sta.w BG3VScroll
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
	stz.w Mode7InUse
	rep #$20
	pla
	rtl
