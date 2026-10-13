; Unidentified routine.
CODE_80A1E9:
	lda.w $08F2,y
	and.w #$00FF
	beq CODE_80A1A4
	pla
	tya
	and.w #$00FF
	sep #$20
	inc.w SoundLock
	plp
	plb
	ply
	plx
	rtl
