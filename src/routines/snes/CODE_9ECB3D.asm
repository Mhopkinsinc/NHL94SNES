; Unidentified routine.
CODE_9ECB3D:
	bvs CODE_9ECB37
CODE_9ECB3F:
	lda.w $0D47
	bne CODE_9ECB5D
	ldy.w #$0002
CODE_9ECB47:
	lda.b [a1],y
	and.w #$00FF
	cmp.w #$0020
	bne CODE_9ECB5D
	lda.b [a1]
	dec a
	inc.b a1
	sta.b [a1]
	dec.b d1
	iny
	bra CODE_9ECB47
