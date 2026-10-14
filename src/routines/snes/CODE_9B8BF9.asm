; Unidentified routine.
CODE_9B8BF9:
	bvc CODE_9B8BFD
CODE_9B8BFB:
	dec.b $A9
CODE_9B8BFD:
	lda.w #$3800
	sta.w $0D0D
	lda.b $A9
	cmp.w $1D8B
	bne CODE_9B8C1A
	lda.w #$2000
	sta.w $0D0D
	lda.b [$95]
	and.w #$00FF
	dec a
	sta.l $7E345A
CODE_9B8C1A:
	lda.w #$0005
	sta.w printx
	lda.b $9D
	sta.b $8D
	lda.b $9F
	sta.b $8F
	jsl.l CODE_9EC7BE
	lda.b $8D
	sta.b $9D
	lda.b $8F
	sta.b $9F
	lda.w #$0008
	sta.w printx
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.b [$95]
	and.w #$00FF
	dec a
	sta.b $A5
	jsl.l CODE_9FC372
	jsl.l CODE_9EC7BE
	inc.b $95
	pla
	sta.b $8F
	pla
	sta.b $8D
	inc.w printy
	inc.w printy
	dec.b $A9
	bmi CODE_9B8C65
	jmp.w CODE_9B8BFD
