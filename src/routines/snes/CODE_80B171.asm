; Unidentified routine.
CODE_80B171:
	lda.w $0000,y
	and.w $E67C,x
CODE_80B177:
	sta.w $0000,y
	rep #$20
	dec.w SpritesLeft
	dex
	bpl CODE_80B18D
	lda.w #$0003
	sta.w OAMHiShift
	inc.w OAMHiPtr
	bra CODE_80B190
