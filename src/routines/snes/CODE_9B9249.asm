; Unidentified routine.
CODE_9B9249:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF0A7
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $0D43
	dec a
	asl a
	asl a
	asl a
	sta.b $A5
	ldy.b $91
	lda.w $1DA7
	inc a
	sta.b $95
	lda.w #PositionNames
	sta.b $9D
	lda.w #$0080
	sta.b $9F
	lda.w $1DAF
	dec a
	sta.b $A9
CODE_9B9284:
	lda.w #$3800
	sta.w $0D0D
	lda.b $A9
	sep #$20
	cmp.w $1D9B
	rep #$20
	bne CODE_9B929B
	lda.w #$2000
	sta.w $0D0D
CODE_9B929B:
	lda.b $8D
	sta.b $9D
	lda.b $8F
	sta.b $9F
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
	bpl CODE_9B92C4
	lda.w #$0010
	sta.b $08
CODE_9B92C4:
	lda.b $04
	sta.b $A5
	jsl.l CODE_9F9745
	inc.b $95
	inc.w printy
	dec.b $A9
	bpl CODE_9B9284
	lda.w #$3800
	sta.w $0D0D
	rts
