; IRQ hook: the first BG1 scroll split of a stats screen, then the next hook
IRQ_StatsScroll1:
	sep #$20
	lda.w irqvscroll1
	sta.w BG1VOFS
	lda.w irqvscroll1+1
	sta.w BG1VOFS
	rep #$20
	lda.w #IRQ_StatsScroll2
	sta.w IRQHook
	lda.w irqline2
	sta.w VTIMEL
	lda.w #$FFFF
	sta.w scrollirqdone
	rtl
