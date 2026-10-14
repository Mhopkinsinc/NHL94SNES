; Unidentified routine.
CODE_9C9BAB:
	phx
	phy
	stx.b xsave
	ldx.w #$0000
CODE_9C9BB2:
	lda.b d0,x
	pha
	inx
	inx
	cpx.w #$0018
	bne CODE_9C9BB2
	ldx.b xsave
	stx.b xsave
	ldx.w #$0000
CODE_9C9BC3:
	lda.b a0,x
	pha
	inx
	inx
	cpx.w #$0014
	bne CODE_9C9BC3
	ldx.b xsave
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF370
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0013
	sta.b d0
	lda.w #$0008
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF375
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0015
	sta.b d0
	lda.w #$0007
	sta.b d1
	jsl.l CODE_9D8000
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF37A
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9C9D25
	lda.w #$0005
	sta.w printy
	lda.w #$000D
	sta.w printx
	stz.b d3
	stz.b a2
	lda.w $1E2B
	cmp.w #$001A
	bmi CODE_9C9C69
	sec
	sbc.w #$001A
	sta.w $1E2B
	inc.b d3
	lda.w #$0002
	sta.b a2
CODE_9C9C69:
	jsl.l CODE_9FBD66
	lda.w #$0005
	sta.w printy
	lda.w #$0011
	sta.w printx
	lda.w $1E2B
	sta.b d0
	jsl.l CODE_9FC427
	jsl.l print
	inc.w printy
	lda.w #$000D
	sta.w printx
	stz.b d3
	stz.b a2
	lda.w $1E2D
	cmp.w #$001A
	bmi CODE_9C9CA9
	sec
	sbc.w #$001A
	sta.w $1E2D
	inc.b d3
	lda.w #$0002
	sta.b a2
CODE_9C9CA9:
	jsl.l CODE_9FBD66
	lda.w #$0006
	sta.w printy
	lda.w #$0011
	sta.w printx
	lda.w $1E2D
	sta.b d0
	jsl.l CODE_9FC427
	jsl.l print
	inc.w printy
	lda.w #$000D
	sta.w printx
	stz.b d3
	stz.b a2
	lda.w $1E2F
	cmp.w #$001A
	bmi CODE_9C9CE9
	sec
	sbc.w #$001A
	sta.w $1E2F
	inc.b d3
	lda.w #$0002
	sta.b a2
CODE_9C9CE9:
	jsl.l CODE_9FBD66
	lda.w #$0007
	sta.w printy
	lda.w #$0011
	sta.w printx
	lda.w $1E2F
	sta.b d0
	jsl.l CODE_9FC427
	jsl.l print
	stx.b xsave
	ldx.w #$0012
CODE_9C9D0B:
	pla
	sta.b a0,x
	dex
	dex
	bpl CODE_9C9D0B
	ldx.b xsave
	stx.b xsave
	ldx.w #$0016
CODE_9C9D19:
	pla
	sta.b d0,x
	dex
	dex
	bpl CODE_9C9D19
	ldx.b xsave
	ply
	plx
	rtl
