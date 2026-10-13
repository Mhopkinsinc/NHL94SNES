; Unidentified routine.
CODE_9B93C1:		; IRQ hook: BG1 vertical scroll from $07E0, then CODE_9B93DE is the next hook
	sep #$20
	lda.w $07E0
	sta.w BG1VOFS
	lda.w $07E1
	sta.w BG1VOFS
	rep #$20
	lda.w #CODE_9B93DE
	sta.w $078F
	lda.w #$0030
	sta.w VTIMEL
	rtl
