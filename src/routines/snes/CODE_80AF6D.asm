; Unidentified routine.
CODE_80AF6D:
	ldx.w #$03D0
	lda.w #$FFFF
CODE_80AF73:
	sta.w $2740,x
	dex
	dex
	bpl CODE_80AF73
	rts
