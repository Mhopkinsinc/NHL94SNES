; Unidentified routine.
CODE_9D9C97:
	lda.w #$FFFF
	sta.l $7E34CC
	lda.w #$007E
	sta.b $8B
	lda.w #$34BC
	sta.b $89
	lda.w #$009D
	sta.b $8F
	lda.w #DATA8_9D9CC2
	sta.b $8D
	ldy.w #$0000
	ldx.w #$0007
CODE_9D9CB8:
	lda.b [$8D],y
	sta.b [$89],y
	iny
	iny
	dex
	bpl CODE_9D9CB8
	rtl
