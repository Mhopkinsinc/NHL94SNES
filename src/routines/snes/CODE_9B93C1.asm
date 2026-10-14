; Unidentified routine.
CODE_9B93C1:		; IRQ hook: BG1 vertical scroll from $07E0, then .t1 is the next hook
	sep #$20
	lda.w $07E0
	sta.w BG1VOFS
	lda.w $07E1
	sta.w BG1VOFS
	rep #$20
	lda.w #.t1
	sta.w $078F
	lda.w #$0030
	sta.w VTIMEL
	rtl

.t1:		; IRQ hook: BG1 vertical scroll $FFFF, then CODE_9B93C1 is the next hook
	sep #$20
	lda.b #$FF
	sta.w BG1VOFS
	lda.b #$FF
	sta.w BG1VOFS
	rep #$20
	lda.w #CODE_9B93C1
	sta.w $078F
	rtl
