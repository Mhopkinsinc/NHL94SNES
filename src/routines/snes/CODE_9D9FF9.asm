; Unidentified routine.
CODE_9D9FF9:
	bvc CODE_9D9FFD
CODE_9D9FFB:
	dec.b $A9
CODE_9D9FFD:
	lda.w #$0001
org $9DA000
	sta.w printx
	lda.b $9F
	sta.b $8F
	lda.b $9D
	sta.b $8D
	jsl.l CODE_9EC7BE
	lda.b $8F
	sta.b $9F
	lda.b $8D
	sta.b $9D
	lda.w #$0004
	sta.w printx
	lda.b [$95]
	inc.b $95
	and.w #$00FF
	dec a
	sta.b $A5
	sta.b $04
	stz.b $08
	jsl.l GoalieCount
	lda.b $04
	cmp.b $A5
	bpl CODE_9DA03A
	lda.w #$0010
	sta.b $08
CODE_9DA03A:
	lda.b $04
	sta.b $A5
	jsl.l CODE_9F9745
	inc.w printy
	inc.w printy
	dec.b $A9
	bpl CODE_9D9FFD
CODE_9DA04C:
	rtl
