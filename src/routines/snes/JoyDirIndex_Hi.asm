; JoyDirIndex of the high byte of A; JoyDirIndex: X = 2 * JoyDirTable[the dpad bits A & $F]
JoyDirIndex_Hi:
	xba

JoyDirIndex:
	and.w #$000F
	tax
	lda.l JoyDirTable,x
	and.w #$00FF
	asl a
	tax
	rtl
