; Unidentified routine.
CODE_9FBFBA:
	bpl CODE_9FBFE6
	stx.w $0D23
	eor.w #$FFFF
	inc a
	cmp.w #$0019
	bcs CODE_9FBFDA
	sta.b $C7
	lda.w $0D25
	sec
	sbc.b $C7
	and.w #$001F
	sta.w $0D25
	sta.b $C9
	bra CODE_9FC00D
