; Unidentified routine.
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
