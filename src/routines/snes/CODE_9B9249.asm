; Unidentified routine.
CODE_9B9249:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF0A7
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w SelectedPlayerIdx
	dec a
	asl a
	asl a
	asl a
	sta.b d0
	ldy.b a2
	lda.w $1DA7
	inc a
	sta.b a3
	lda.w #PositionNames
	sta.b $9D
	lda.w #$0080
	sta.b $9F
	lda.w $1DAF
	dec a
	sta.b d1
CODE_9B9284:
	lda.w #$3800
	sta.w $0D0D
	lda.b d1
	sep #$20
	cmp.w $1D9B
	rep #$20
	bne CODE_9B929B
	lda.w #$2000
	sta.w $0D0D
CODE_9B929B:
	lda.b a1
	sta.b $9D
	lda.b $8F
	sta.b $9F
	lda.w #$0002
	sta.w printx
	lda.b a3
	and.w #$00FF
	dec a
	sta.b d0
	sta.b $04
	stz.b $08
	jsl.l GoalieCount
	lda.b $04
	cmp.b d0
	bpl CODE_9B92C4
	lda.w #$0010
	sta.b $08
CODE_9B92C4:
	lda.b $04
	sta.b d0
	jsl.l CODE_9F9745
	inc.b a3
	inc.w printy
	dec.b d1
	bpl CODE_9B9284
	lda.w #$3800
	sta.w $0D0D
	rts
