; IRQ hook: the second BG1 scroll split, then the next hook
IRQ_StatsScroll2:
	sep #$20
	lda.w $1DF5
	sta.w BG1VOFS
	lda.w $1DF6
	sta.w BG1VOFS
	rep #$20
	lda.w #IRQ_StatsScroll3
	sta.w IRQHook
	lda.w $1DF1
	sta.w VTIMEL
	rtl
