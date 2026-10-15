; IRQ hook: put the BG1 scroll back, then IRQ_BandStart
IRQ_BandEnd:
	sep #$20
	stz.w BG1HOFS
	stz.w BG1HOFS
	lda.b #$FF
	sta.w BG1VOFS
	sta.w BG1VOFS
	rep #$20
	lda.w #IRQ_BandStart
	sta.w IRQHook
	lda.w irqline1
	sta.w VTIMEL
	rtl
