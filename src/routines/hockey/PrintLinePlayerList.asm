; Line editor player list: each row a player name and the attribute (GetNameandAttrib), the selected row highlighted
PrintLinePlayerList:
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
.loop:
	lda.w #$3800
	sta.w $0D0D
	lda.b d1
	sep #$20
	cmp.w $1D9B
	rep #$20
	bne .1
	lda.w #$2000
	sta.w $0D0D
.1:
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
	bpl .2
	lda.w #$0010
	sta.b $08
.2:
	lda.b $04
	sta.b d0
	jsl.l GetNameandAttrib
	inc.b a3
	inc.w printy
	dec.b d1
	bpl .loop
	lda.w #$3800
	sta.w $0D0D
	rts
