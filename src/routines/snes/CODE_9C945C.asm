; Unidentified routine.
CODE_9C945C:
	inc.b $16
	sep #$30
	lda.b $8F
	pha
	plb
	rep #$30
	lda.b (a1)
	tay
	dey
	dey
	lda.b a1
	inc a
	inc a
	sta.b d1
	lda.w #$0000
	sta.b (d1),y
	ldy.w #$0000
CODE_9C9479:
	lda.b (d1),y
	and.w #$00FF
	beq CODE_9C94D2
	cmp.w #$0020
	bne CODE_9C948F
	cpy.w #$0000
	beq CODE_9C94CF
	lda.w #$0005
	bra CODE_9C94CA
