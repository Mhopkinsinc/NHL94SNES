; The computer team picks a line by the man advantage, the score and the line energies
CompLine:
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b d2
	pha
	lda.b $AF
	pha
	lda.b a0
	pha
	lda.b $8B
	pha
	lda.w #$0003
	sta.b d0
	ldy.b a2
	lda.w tmap,y
	ldy.b a1
	cmp.w tmap,y
	beq CODE_9FDABF
	bpl .1
	inc.b d0
	inc.b d0
.1:
	lda.b d0
	pha
	jsl.l getlinee
	lda.b d0
	sta.b d1
	lda.b $01,s
	inc a
	sta.b d0
	jsl.l getlinee
	lda.b d1
	sec
	sbc.b d0
	bpl .2
	pla
	inc a
	pha
.2:
	pla
	ldy.b a2
	sta.w tmline,y
CODE_9FDAA6:
	pla
	sta.b $8B
	pla
	sta.b a0
	pla
	sta.b $AF
	pla
	sta.b d2
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b $A7
	pla
	sta.b d0
	rtl
