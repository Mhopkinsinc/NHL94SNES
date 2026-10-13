; Unidentified routine.
LinearToPlanar:		; convert $00 bytes of linear 4bpp tiles at [$0C] to SNES planar, in place
	ldx.b $00
	phb
	sep #$20
	lda.b $0E
	pha
	rep #$20
	plb
	stz.b $04
	lda.w #$FFFE
	sta.b $06
	lda.b $00
	lsr a
	lsr a
	sta.b $00
	bra CODE_9B85E8
