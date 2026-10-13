; Unidentified routine.
CODE_9B93DE:		; IRQ hook: BG1 vertical scroll $FFFF, then CODE_9B93C1 is the next hook
	sep #$20
	lda.b #$FF
	sta.w BG1VOFS
	lda.b #$FF
	sta.w BG1VOFS
	rep #$20
	lda.w #CODE_9B93C1
	sta.w $078F
	rtl
