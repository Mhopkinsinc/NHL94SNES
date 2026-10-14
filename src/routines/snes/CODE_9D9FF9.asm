; Unidentified routine.
CODE_9D9FF9:
	bvc CODE_9D9FFD
CODE_9D9FFB:
	dec.b d1
CODE_9D9FFD:
	lda.w #$0001
org $9DA000
	sta.w printx
	lda.b $9F
	sta.b $8F
	lda.b $9D
	sta.b a1
	jsl.l print
	lda.b $8F
	sta.b $9F
	lda.b a1
	sta.b $9D
	lda.w #$0004
	sta.w printx
	lda.b [a3]
	inc.b a3
	and.w #$00FF
	dec a
	sta.b d0
	sta.b $04
	stz.b $08
	jsl.l GoalieCount
	lda.b $04
	cmp.b d0
	bpl CODE_9DA03A
	lda.w #$0010
	sta.b $08
CODE_9DA03A:
	lda.b $04
	sta.b d0
	jsl.l CODE_9F9745
	inc.w printy
	inc.w printy
	dec.b d1
	bpl CODE_9D9FFD
CODE_9DA04C:
	rtl
