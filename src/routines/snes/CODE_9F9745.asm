; Unidentified routine.
CODE_9F9745:
	stx.b xsave
	ldx.w #$0000
CODE_9F974A:
	lda.b d0,x
	pha
	inx
	inx
	cpx.w #$0014
	bne CODE_9F974A
	ldx.b xsave
	lda.b a0
	pha
	lda.b $8B
	pha
	lda.b a1
	pha
	lda.b $8F
	pha
	lda.b $08
	pha
	jsl.l PlayerNumName
	jsl.l print
	pla
	sta.b $08
	lda.w #$0019
	sta.w printx
	lda.l $7E346A
	bne CODE_9F977F
	inc.w printx
CODE_9F977F:
	lda.b d4
	cmp.w #$0003
	bcs CODE_9F9789
	jmp.w CODE_9F9794
