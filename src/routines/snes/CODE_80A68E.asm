; Unidentified routine.
CODE_80A68E:
	lda.b ($4E)
	and.l ByteBitMasks,x
	beq CODE_80A61F
	rts
