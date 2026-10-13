; Unidentified routine.
CODE_9C945C:
	inc.b $16
	sep #$30
	lda.b $8F
	pha
	plb
	rep #$30
	lda.b ($8D)
	tay
	dey
	dey
	lda.b $8D
	inc a
	inc a
	sta.b $A9
	lda.w #$0000
	sta.b ($A9),y
	ldy.w #$0000
CODE_9C9479:
	lda.b ($A9),y
	and.w #$00FF
	beq CODE_9C94D2
	cmp.w #$0020
	bne CODE_9C948F
	cpy.w #$0000
	beq CODE_9C94CF
	lda.w #$0005
	bra CODE_9C94CA
