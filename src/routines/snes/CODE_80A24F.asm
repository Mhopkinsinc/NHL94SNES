; Unidentified routine.
CODE_80A24F:
	ldy.b #$17
	lda.b ($4E),y
	sta.w $08BE
CODE_80A256:
	sta.w $08CF
	lda.b $65
	sta.b $5A
	ldy.b #$10
	jsr.w CODE_80A697
	and.b #$FF
	sep #$20
	inc.w SoundLock
	plp
	plb
	ply
	plx
	rtl
