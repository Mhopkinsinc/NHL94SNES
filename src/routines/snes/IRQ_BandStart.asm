; IRQ hook: shift the BG1 scroll for the band, then IRQ_BandEnd
IRQ_BandStart:
	sep #$20
	lda.b #$FC
	sta.w BG1HOFS
	lda.b #$FF
	sta.w BG1HOFS
	lda.b #$FB
	sta.w BG1VOFS
	lda.b #$FF
	sta.w BG1VOFS
	rep #$20
	lda.w #IRQ_BandEnd
	sta.w IRQHook
	lda.w $1DEF
	sta.w VTIMEL
	rtl
