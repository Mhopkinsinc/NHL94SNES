; Print the rows of the list from $1DA7, the row at the cursor ($1D9B) in another palette
PrintShooterRows:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #PrintShooterRowsPos>>16
	sta.b $8F
	lda.w #PrintShooterRowsPos
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
	lda.w picktop
	inc a
	sta.b a3
	lda.w #PositionNames>>16
	sta.b $9F
	lda.w #PositionNames
	sta.b $9D
	lda.w #$0008
	sta.b d1
	lda.w SelectedPlayerIdx
	sec
	sbc.w #$0005
	beq .3
	bmi .t1
	bvc .1
	bra .3

.t1:
	bvc .3
.1:
	dec.b d1
.3:
	lda.w #$3800
	sta.w printa
	lda.b d1
	cmp.w curplayer
	bne .1x
	lda.w #$2000
	sta.w printa
.1x:
	lda.b $8F
	sta.b $9F
	lda.b a1
	sta.b $9D
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
	bpl .3
	lda.w #$2000
	sta.w printa
	rtl
