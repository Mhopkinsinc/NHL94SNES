; Unidentified routine.
CODE_80A549:
	ldx.b #$00
	txy
CODE_80A54C:
	sty.b $4B
	stx.w $0800
	lda.w $08F2,y
	beq CODE_80A560
	lda.w $08FA,y
	cmp.b #$10
	bcs CODE_80A560
	jsr.w CODE_80A51C
CODE_80A560:
	inx
	inx
	iny
	cpy.b #$08
	bcc CODE_80A54C
	rts
