; Unidentified routine.
CODE_80877D:
	lda.w #$0000
	tya
	asl a
	tay
CODE_808783:
	sta.b [$10],y
	iny
	iny
	dex
	bne CODE_808783
	rtl
