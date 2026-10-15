; IRQ hook: the first BG1 scroll split of a stats screen, then the next hook
IRQ_StatsScroll1:
	sep #$20
	lda.w $1DF3
	sta.w BG1VOFS
	lda.w $1DF4
	sta.w BG1VOFS
	rep #$20
	lda.w #IRQ_StatsScroll2
	sta.w IRQHook
	lda.w $1DEF
	sta.w VTIMEL
	lda.w #$FFFF
	sta.w $1DCD
	rtl
