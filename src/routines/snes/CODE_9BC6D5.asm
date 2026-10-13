; Unidentified routine.
CODE_9BC6D5:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.b $91
	pha
	lda.b $93
	pha
	lda.w #$009B
	sta.b $93
	lda.w #PasstoText
	sta.b $91
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	lda.w #$007E
	sta.b $8B
	lda.w #$34F4
	sta.b $89
	lda.w #$0012
	sta.b [$8D]
	inc.b $8D
	inc.b $8D
	lda.w #$000F
	sta.b $A9
CODE_9BC71F:
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	tay
	lda.b [$91],y
	sta.b [$8D]
	inc.b $8D
	dec.b $A9
	bpl CODE_9BC71F
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $93
	pla
	sta.b $91
	pla
	sta.b $8F
	pla
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A7
	pla
	sta.b $A5
CODE_9BC75D:
	rtl
