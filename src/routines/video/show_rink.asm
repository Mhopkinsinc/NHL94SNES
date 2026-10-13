; Unidentified routine.
show_rink:
	lda.w sfhormode
	bne CODE_9FBC5E
	lda.w Hpos
	sec
	sbc.w #$0080
	sta.w Hscroll
	lda.w Vpos
	eor.w #$FFFF
	inc a
	sec
	sbc.w #$0070
	sta.w Vscroll
CODE_9FBC5E:
	rtl
