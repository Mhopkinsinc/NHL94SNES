; Unidentified routine.
CODE_9D94EC:
	lda.b #$00
	sta.l $7F6700,x
CODE_9D94F2:
	lda.b $00
	sta.b $03,s
	plx
	inx
	inx
	dey
	bpl CODE_9D949A
	pla
	rts
