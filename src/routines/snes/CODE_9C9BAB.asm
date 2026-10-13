; Unidentified routine.
CODE_9C9BAB:
	phx
	phy
	stx.b $87
	ldx.w #$0000
CODE_9C9BB2:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0018
	bne CODE_9C9BB2
	ldx.b $87
	stx.b $87
	ldx.w #$0000
CODE_9C9BC3:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0014
	bne CODE_9C9BC3
	ldx.b $87
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF370
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0013
	sta.b $A5
	lda.w #$0008
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF375
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0015
	sta.b $A5
	lda.w #$0007
	sta.b $A9
	jsl.l CODE_9D8000
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF37A
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9C9D25
	lda.w #$0005
	sta.w printy
	lda.w #$000D
	sta.w printx
	stz.b $B1
	stz.b $91
	lda.w $1E2B
	cmp.w #$001A
	bmi CODE_9C9C69
	sec
	sbc.w #$001A
	sta.w $1E2B
	inc.b $B1
	lda.w #$0002
	sta.b $91
CODE_9C9C69:
	jsl.l printteamname
	lda.w #$0005
	sta.w printy
	lda.w #$0011
	sta.w printx
	lda.w $1E2B
	sta.b $A5
	jsl.l CODE_9FC427
	jsl.l CODE_9EC7BE
	inc.w printy
	lda.w #$000D
	sta.w printx
	stz.b $B1
	stz.b $91
	lda.w $1E2D
	cmp.w #$001A
	bmi CODE_9C9CA9
	sec
	sbc.w #$001A
	sta.w $1E2D
	inc.b $B1
	lda.w #$0002
	sta.b $91
CODE_9C9CA9:
	jsl.l printteamname
	lda.w #$0006
	sta.w printy
	lda.w #$0011
	sta.w printx
	lda.w $1E2D
	sta.b $A5
	jsl.l CODE_9FC427
	jsl.l CODE_9EC7BE
	inc.w printy
	lda.w #$000D
	sta.w printx
	stz.b $B1
	stz.b $91
	lda.w $1E2F
	cmp.w #$001A
	bmi CODE_9C9CE9
	sec
	sbc.w #$001A
	sta.w $1E2F
	inc.b $B1
	lda.w #$0002
	sta.b $91
CODE_9C9CE9:
	jsl.l printteamname
	lda.w #$0007
	sta.w printy
	lda.w #$0011
	sta.w printx
	lda.w $1E2F
	sta.b $A5
	jsl.l CODE_9FC427
	jsl.l CODE_9EC7BE
	stx.b $87
	ldx.w #$0012
CODE_9C9D0B:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9C9D0B
	ldx.b $87
	stx.b $87
	ldx.w #$0016
CODE_9C9D19:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9C9D19
	ldx.b $87
	ply
	plx
	rtl
