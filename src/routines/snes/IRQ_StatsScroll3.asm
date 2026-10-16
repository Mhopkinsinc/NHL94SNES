; IRQ hook: the last BG1 scroll split
IRQ_StatsScroll3:
	sep #$20
	lda.w irqvscroll3
	sta.w BG1VOFS
	lda.w irqvscroll3+1
	sta.w BG1VOFS
	rep #$20
	lda.w #IRQ_StatsScroll1
	sta.w IRQHook
	rtl
