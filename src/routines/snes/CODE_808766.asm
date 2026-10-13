; Unidentified routine.
CODE_808766:
	cmp.w #$0000
	beq CODE_80877D
	cmp.w #$0100
	bne CODE_80878B
	tya
	asl a
	tay
CODE_808773:
	lda.b [$0C],y
	sta.b [$10],y
	iny
	iny
	dex
	bne CODE_808773
	rtl
