; Unidentified routine.
CODE_9F9C10:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF830
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0009
	sta.b d0
	lda.w #$0005
	sta.b d1
	jsl.l CODE_9D8000
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF835
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	stz.b d3
	stz.b a2
	jsl.l CODE_9F9DB0
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF83A
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	inc.b d3
	inc.b a2
	inc.b a2
	jsl.l CODE_9F9DB0
	stz.b a2
	lda.w #$0002
	sta.b a3
	lda.w gmode
	bit.w #$0002
	bne CODE_9F9C94
	stz.b a3
	lda.w #$0002
	sta.b a2
CODE_9F9C94:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF83F
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9F9DFA
	ldx.b a2
	lda.b a3
	sta.b a2
	stx.b a3
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF844
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9F9DFA
CODE_9F9CD8:
	stx.b xsave
	ldx.w #$000E
CODE_9F9CDD:
	pla
	sta.b a0,x
	dex
	dex
	bpl CODE_9F9CDD
	ldx.b xsave
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
	ldx.b a3
	rtl
