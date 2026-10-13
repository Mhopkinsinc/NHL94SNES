; Unidentified routine.
CODE_9D9482:
	lda.b #$00
	sta.l $7F6700,x
CODE_9D9488:
	lda.b $00
	sta.b $03,s
	plx
	inx
	inx
	dey
	bpl CODE_9D9430
	pla
	rts
