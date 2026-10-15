; IRQ hook: the second BG1 scroll split, then the next hook
IRQ_StatsScroll2:
	sep #$20
	lda.w irqvscroll2
	sta.w BG1VOFS
	lda.w irqvscroll2+1
	sta.w BG1VOFS
	rep #$20
	lda.w #IRQ_StatsScroll3
	sta.w IRQHook
	lda.w irqline3
	sta.w VTIMEL
	rtl
