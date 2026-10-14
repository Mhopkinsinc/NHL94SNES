; Unidentified routine.
CODE_9FBFBA:
	bpl CODE_9FBFE6
	stx.w Oldrow
	eor.w #$FFFF
	inc a
	cmp.w #$0019
	bcs CODE_9FBFDA
	sta.b tmp1
	lda.w vramrow
	sec
	sbc.b tmp1
	and.w #$001F
	sta.w vramrow
	sta.b tmp2
	bra CODE_9FC00D
