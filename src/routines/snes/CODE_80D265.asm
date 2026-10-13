; Unidentified routine.
CODE_80D265:
	bvc CODE_80D269
CODE_80D267:
	dec.b $A9
CODE_80D269:
	lda.w #$3800
	sta.w $0D0D
	lda.b $A9
	cmp.w $1D9B
	bne CODE_80D27C
	lda.w #$2000
	sta.w $0D0D
CODE_80D27C:
	lda.b $8F
	sta.b $9F
	lda.b $8D
	sta.b $9D
	lda.w #$0002
	sta.w printx
	lda.b $95
	and.w #$00FF
	dec a
	sta.b $A5
	sta.b $04
	stz.b $08
	jsl.l GoalieCount
	lda.b $04
	cmp.b $A5
	bpl CODE_80D2A5
	lda.w #$0010
	sta.b $08
CODE_80D2A5:
	lda.b $04
	sta.b $A5
	jsl.l CODE_9F9745
	inc.b $95
	inc.w printy
	dec.b $A9
	bpl CODE_80D269
	lda.w #$2000
	sta.w $0D0D
	rtl
