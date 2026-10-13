; Unidentified routine.
CODE_80B250:
	lda.w $0000,y
	and.w $E67C,x
CODE_80B256:
	sta.w $0000,y
	rep #$20
	dec.w SpritesLeft
	dex
	bpl CODE_80B26C
	lda.w #$0003
	sta.w OAMHiShift
	inc.w OAMHiPtr
	bra CODE_80B26F
