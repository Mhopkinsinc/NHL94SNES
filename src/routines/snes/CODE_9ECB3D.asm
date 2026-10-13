; Unidentified routine.
CODE_9ECB3D:
	bvs CODE_9ECB37
CODE_9ECB3F:
	lda.w $0D47
	bne CODE_9ECB5D
	ldy.w #$0002
CODE_9ECB47:
	lda.b [$8D],y
	and.w #$00FF
	cmp.w #$0020
	bne CODE_9ECB5D
	lda.b [$8D]
	dec a
	inc.b $8D
	sta.b [$8D]
	dec.b $A9
	iny
	bra CODE_9ECB47
