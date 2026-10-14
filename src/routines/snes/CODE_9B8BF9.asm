; Unidentified routine.
CODE_9B8BF9:
	bvc CODE_9B8BFD
CODE_9B8BFB:
	dec.b d1
CODE_9B8BFD:
	lda.w #$3800
	sta.w $0D0D
	lda.b d1
	cmp.w $1D8B
	bne CODE_9B8C1A
	lda.w #$2000
	sta.w $0D0D
	lda.b [a3]
	and.w #$00FF
	dec a
	sta.l $7E345A
CODE_9B8C1A:
	lda.w #$0005
	sta.w printx
	lda.b $9D
	sta.b a1
	lda.b $9F
	sta.b $8F
	jsl.l print
	lda.b a1
	sta.b $9D
	lda.b $8F
	sta.b $9F
	lda.w #$0008
	sta.w printx
	lda.b a1
	pha
	lda.b $8F
	pha
	lda.b [a3]
	and.w #$00FF
	dec a
	sta.b d0
	jsl.l PlayerNumName
	jsl.l print
	inc.b a3
	pla
	sta.b $8F
	pla
	sta.b a1
	inc.w printy
	inc.w printy
	dec.b d1
	bmi CODE_9B8C65
	jmp.w CODE_9B8BFD
