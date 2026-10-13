; Unidentified routine.
CODE_9FDA53:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $AD
	pha
	lda.b $AF
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.w #$0003
	sta.b $A5
	ldy.b $91
	lda.w tmap,y
	ldy.b $8D
	cmp.w tmap,y
	beq CODE_9FDABF
	bpl CODE_9FDA82
	inc.b $A5
	inc.b $A5
CODE_9FDA82:
	lda.b $A5
	pha
	jsl.l CODE_9FDF0C
	lda.b $A5
	sta.b $A9
	lda.b $01,s
	inc a
	sta.b $A5
	jsl.l CODE_9FDF0C
	lda.b $A9
	sec
	sbc.b $A5
	bpl CODE_9FDAA0
	pla
	inc a
	pha
CODE_9FDAA0:
	pla
	ldy.b $91
	sta.w tmline,y
CODE_9FDAA6:
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $AF
	pla
	sta.b $AD
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A7
	pla
	sta.b $A5
	rtl
